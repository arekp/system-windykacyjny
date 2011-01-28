
-- =============================================
-- zakladamy funkcje u¿ytkownika - 4 obiekty
-- =============================================
use lucapacioli
go

--funkcja pomocnicza - uzywana do obliczenia odsetek od sp³at

if  object_id('fn_MaxDateTime') is not null 
	drop function dbo.fn_MaxDateTime
go


CREATE Function [dbo].[fn_MaxDateTime] ( @r1 DateTime,  @r2 DateTime)  
RETURNS DateTime
As
begin

declare @max DateTime

if @r1 is null
begin
set @r1 = @r2
end

if @r2 is null
begin
set @r2 = @r1
end


if @r1>= @r2

	begin
		set @max = @r1
	end
else
	begin
		 set @max =@r2
	end

return @max
end


GO



--funkcja pomocnicza - uzywana do obliczenia odsetek od sp³at

if  object_id('fn_MinDateTime') is not null
	drop function dbo.fn_MinDateTime
go
CREATE Function [dbo].[fn_MinDateTime] ( @r1 DateTime,  @r2 DateTime)  
RETURNS DateTime
As
begin

declare @min DateTime

if @r1 is null
begin
set @r1= @r2
end

if @r2 is null
begin
set @r2 = @r1
end

if @r1<= @r2

	begin
		set @min = @r1
	end
else
	begin
		set @min =@r2
	end

return @min
end


GO


--funkcja do obliczenia odsetek dla kwoty sp³acanych wierzytelnoœci. Oblicza nale¿ne odsetki dla sp³aconej kwoty

if  object_id('fn_LiczOdsetki') is not null
	drop function dbo.fn_LiczOdsetki
go

CREATE Function [dbo].[fn_LiczOdsetki] 
(@ID int)								--- parametrem jest stPK z tabeli Splata
RETURNS decimal(18,4)
As
begin
Declare @odsetki decimal(18,4)
Declare @wislFKTypWierzytelnosci bigint
Declare @odspFK int
Declare @wiDataWymagalnosci datetime
Declare @prOdsetkiNaDzien datetime
Declare @odKrotnosc as float
Declare @odLiczbaDniWRoku as Int
Declare @naKwota as decimal(18,4)
Declare @odKarencja as int

SET @wislFKTypWierzytelnosci = (SELECT wislTDFK FROM wierzytelnosc where wiPK =(select stwiFK from Splata where stPK = @ID ))
SET @odspFK = (SELECT wislSPFK FROM Wierzytelnosc where wiPK =(select stwiFK from Splata where stPK = @ID ))
SET @wiDataWymagalnosci = (SELECT wiDataWymagalnosci FROM wierzytelnosc where wiPK =(select stwiFK from Splata where stPK = @ID ))
SET @prOdsetkiNaDzien = (SELECT plData FROM Platnosc
	INNER JOIN Splata as st ON st.stplFK = plPK and st.stPK =  @ID)
SET @odKrotnosc = (SELECT wiKrotnoscOdsetek FROM Wierzytelnosc where wiPK =(select stwiFK from Splata where stPK = @ID ))
SET @odLiczbaDniWRoku = (SELECT wiLiczbaDniWRoku FROM Wierzytelnosc where wiPK = (select stwiFK from Splata where stPK = @ID ))
SET @naKwota = (SELECT stKwota FROM Splata
	INNER JOIN Wierzytelnosc ON wiPK=stwiFK where stPK = @ID AND (wislTDFK=1 or wislTDFK=2))
SET @odKarencja = 0


if @wislFKTypWierzytelnosci = 1 or @wislFKTypWierzytelnosci = 2
begin
	Declare @maxOd  datetime
	Declare @maxDo  datetime
	Declare @dni int
	Declare @root int


	Set @maxOd = (Select Max(ssDataOd) From slStawkaStopyProcentowej 
	WHERE 
	ssDataOD <= @wiDataWymagalnosci)
	Set @maxDo = (Select Min(ssDataDo) From slStawkaStopyProcentowej 
	WHERE 
	ssDataDO >= @prOdsetkiNaDzien 
	)

	set @odsetki =(Select top 1 
	(
		SELECT  
			SUM((@naKwota * ((@odKrotnosc *slStawkaStopyProcentowej.ssStawka) / 100.0000))* 
			(Convert(int, DateDiff
				(d,DateAdd(d,@odKarencja,dbo.fn_MaxDateTime(ssDataOd,@wiDataWymagalnosci)), 
				dbo.fn_MinDateTime(ssDataDo,@prOdsetkiNaDzien) + case when ssDataOd<=@wiDataWymagalnosci  
				then 0 else 1 end))/Convert(decimal(18,2),@odLiczbaDniWRoku)))   
			FROM   slStawkaStopyProcentowej  
			INNER JOIN slStopaProcentowa on spPK=ssspFK and spPK =  @odspFK
			AND (ssDataOd >= @maxOd)
			And ((ssDataDo <= @maxDo ) OR ((@maxDo is null) ))
			
			) as ssp FROM   slStawkaStopyProcentowej)
end
else
begin
	set @odsetki = null
end
return @odsetki
end

go


--funkcja do obliczenia potencjalnych odseteke dla niesp³aconej czêœci wierzytelnoœci

if  object_id('fn_LiczOdsetki_potencjalne') is not null
	drop function dbo.fn_LiczOdsetki_potencjalne
go

CREATE Function [dbo].[fn_LiczOdsetki_potencjalne] 
(@ID int, @prOdsetkiNaDzien datetime)			--- parametrem jest wiPK z tabeli Wierzytelnosc, data, na któr¹ chcesmy policzyæ odsetki od niesp³aconego salda wierzytelnoœci
RETURNS decimal(18,4)

As
BEGIN
Declare @odsetki decimal(18,4)
Declare @wislFKTypWierzytelnosci bigint
Declare @odspFK int
Declare @wiDataWymagalnosci datetime
Declare @odKrotnosc as float
Declare @odLiczbaDniWRoku as Int
Declare @naKwota as decimal(18,4)
Declare @odKarencja as int

SET @wislFKTypWierzytelnosci = (SELECT wislTDFK FROM wierzytelnosc where wiPK = @ID )
SET @odspFK = (SELECT wislSPFK FROM Wierzytelnosc where wiPK = @ID )
SET @wiDataWymagalnosci = (SELECT wiDataWymagalnosci FROM wierzytelnosc where wiPK = @ID )
SET @odKrotnosc = (SELECT wiKrotnoscOdsetek FROM Wierzytelnosc where wiPK = @ID )
SET @odLiczbaDniWRoku = (SELECT wiLiczbaDniWRoku FROM Wierzytelnosc where wiPK = @ID )
SET @naKwota = (SELECT wiSaldo FROM Wierzytelnosc where wiPK = @ID AND (wislTDFK=1 or wislTDFK=2))
SET @odKarencja = 0


if @wislFKTypWierzytelnosci = 1 or @wislFKTypWierzytelnosci = 2
begin
	Declare @maxOd  datetime
	Declare @maxDo  datetime
	Declare @dni int
	Declare @root int


	Set @maxOd = (Select Max(ssDataOd) From slStawkaStopyProcentowej 
	WHERE 
	ssDataOD <= @wiDataWymagalnosci)
	Set @maxDo = (Select Min(ssDataDo) From slStawkaStopyProcentowej 
	WHERE 
	ssDataDO >= @prOdsetkiNaDzien 
	)

	set @odsetki =(Select top 1 
	(
		SELECT  
			SUM((@naKwota * ((@odKrotnosc *slStawkaStopyProcentowej.ssStawka) / 100.0000))* 
			(Convert(int, DateDiff
				(d,DateAdd(d,@odKarencja,dbo.fn_MaxDateTime(ssDataOd,@wiDataWymagalnosci)), 
				dbo.fn_MinDateTime(ssDataDo,@prOdsetkiNaDzien) + case when ssDataOd<=@wiDataWymagalnosci  
				then 0 else 1 end))/Convert(decimal(18,2),@odLiczbaDniWRoku)))   
			FROM   slStawkaStopyProcentowej  
			INNER JOIN slStopaProcentowa on spPK=ssspFK and spPK =  @odspFK
			AND (ssDataOd >= @maxOd)
			And ((ssDataDo <= @maxDo ) OR ((@maxDo is null) ))
			
			) as ssp FROM   slStawkaStopyProcentowej)
end
else
	begin
		set @odsetki = null
	end
	return @odsetki
END

go

