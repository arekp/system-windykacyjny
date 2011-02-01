-- =============================================
-- procedury - 8 obiekty
-- =============================================
use lucapacioli
go

/* 
=============================================
procedura zaczytuj¹ca z podanego katalogu  
pliki w postaci binarne dotycz¹ce danej Sprawy do tabeli Dokument
=============================================
*/

go
if exists (select routine_name from information_schema.routines where routine_name='usp_ZaczytajDokument')
drop procedure [dbo].[usp_ZaczytajDokument]
go
Create procedure [dbo].[usp_ZaczytajDokument]

 as

  declare c cursor
  for select doPK, doNazwa
  from dbo.Dokument

  open c
	declare @folder nvarchar(50)
	declare @doPK int, @doNazwa nvarchar(200)

  set @folder = N'C:\dokument\'

  fetch next from c into @doPK, @doNazwa
  while (@@FETCH_STATUS <> -1)

BEGIN
  execute('Update dbo.Dokument
  set doPlik = (select * from OPENROWSET(BULK N''' + @folder + @doNazwa + ''', SINGLE_BLOB) as doPlik) 
  where doPK = ' + @doPK)

  print 'zaimportowano plik ' + @doNazwa

  fetch next from c into @doPK, @doNazwa

END

  close c

deallocate c

/* 
=============================================
procedura aktualizuj¹ca wartoœæ kolumny Saldo 
w tabeli Platnosc na podstawie skojarzonych platnosci ze sp³atami
=============================================
*/
GO

if exists (select routine_name from information_schema.routines where routine_name='usp_AktualizujSaldoPlatnosci')
drop procedure [dbo].[usp_AktualizujSaldoPlatnosci]
go
create procedure [dbo].[usp_AktualizujSaldoPlatnosci]
@plPK int

AS

declare @stKwota  as decimal(18,4)

BEGIN

	set @stKwota = (
					select isnull (sum(st.stKwota) ,0) as k from Platnosc as pl 
						left outer join Splata as st on pl.plPK = st.stplFK
							where @plPK = pl.plPK
					group by st.stplFK
					)

	BEGIN
	
	UPDATE [dbo].[Platnosc] SET
		plSaldo = (plKwota - @stKwota)
	WHERE
		plPK = @plPK
	
	END
	
END

GO

/* 
=============================================
procedura aktualizuj¹ca wartoœæ kolumny Saldo 
w tabeli Wierzytelnosci na podstawie skojarzonych splat z wierzytelnoœciami
=============================================
*/
if exists (select routine_name from information_schema.routines where routine_name='usp_AktualizujSaldoPlatnosci')
drop procedure [dbo].[usp_AktualizujSaldoWierzytelnosci]
go

create procedure [dbo].[usp_AktualizujSaldoWierzytelnosci]
@wiPK int

AS

declare @stKwota  as decimal(18,4)

BEGIN

	set @stKwota =  (
						select isnull (sum(st.stKwota) ,0) as k from Wierzytelnosc as wi 
						left outer join Splata as st
						on wi.wiPK = st.stwiFK
						where @wiPK = wi.wiPK
						group by st.stwiFK
					)
	
	BEGIN
	
	UPDATE [dbo].[Wierzytelnosc] SET
		wiSaldo = (wiKwotaWlasciwa - @stKwota)
	WHERE
		wiPK = @wiPK
	
	END
	
END

GO

/* 
=============================================
procedura aktualizuj¹ca wartoœæ kolumny stWartoscOdsetek
w tabeli Splata - nale¿ne odsetki dla sp¹³canej wierzytelnoœci
=============================================
*/
if exists (select routine_name from information_schema.routines where routine_name='usp_LiczOdsetki')
drop procedure [dbo].[usp_LiczOdsetki]
go

create procedure [dbo].[usp_LiczOdsetki]
	@wi int
 as
	declare @st int
	declare @pl int
	declare @odsetki decimal(18, 2)
	
  declare kursor cursor
	for 
		select 
			 stPK
			,stwiFK
			,stplFK 
			,dbo.fn_LiczOdsetki (stPK)
		from dbo.Splata
		where stwiFK = @wi
open kursor
fetch next from kursor
into @st, @wi, @pl, @odsetki

WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE dbo.Splata SET
		stWartoscOdsetek = @odsetki
		where @st = stPK
		and @wi = stwiFK
		and @pl = stplFK

fetch next from kursor
into @st, @wi, @pl, @odsetki

END 
close kursor
deallocate kursor

GO

/**
==========================================================================
Procedura maj¹ca na celu utworzenie nowego zadania przypisanego do sprawy

@Nazwa - nazwa kontrahenta
@LoginPrac - login pracownika
@NumerSprawy - numer sprawy
@opis - Opis zadania
@DataRealizacji - Data realizacji
@Priorytet - Priorytet zadania
@LoginDodajacego  - osoby dodajaca

Przyklad:
exec dbo.usp_WstawZadanie 'Piotr Zaniewicz','arek','2','zadanie1','2011-03-12','3','gosc'
==================================================================================
**/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_WstawZadanie]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_WstawZadanie]
GO


CREATE PROCEDURE [dbo].[usp_WstawZadanie]
@Nazwa nvarchar (250),
@LoginPrac nvarchar (50),
@NumerSprawy nvarchar (50),
@opis nvarchar(max),
@DataRealizacji datetime,
@Priorytet nvarchar (4),
@LoginDodajacego nvarchar (50)
AS


----------------------------------
DECLARE @khPk int
set @khPK = null

-- Wyszukanie kontrahenta
select @khPK=khPK from dbo.Kontrahent where khNazwa=@Nazwa

IF (@khPK is null) 
	BEGIN
	PRINT '### ERROR ### Brak kontrahent do przypisania zadania ErrorCode = -1'
	return -1
	END
-----------------------------------	
DECLARE @urPK int
set @urPK = null

-- Wyszukanie pracownika
select @urPK=urPK from dbo.Uzytkownik where urLogin=@LoginPrac

IF (@urPK is null) 
	BEGIN
	PRINT '### ERROR ### Brak Pracownika do przypisania ErrorCode = -2'
	return -2
	END	
-----------------------------------	
DECLARE @swPK int
set @swPK = null

-- Wyszukanie Sprawy
select @swPK=swPK from dbo.Sprawa where swNumerSprawy=@NumerSprawy

IF (@swPK is null) 
	BEGIN
	PRINT '### ERROR ### Brak Sprawy aby przypisac zadanie ErrorCode = -3'
	return -3
	END	


BEGIN TRY
BEGIN TRANSACTION; ---------------------------------------	
--- wstawiamyt zadania
INSERT INTO [lucapacioli].[dbo].[Zadanie]
           ([zakhFK]
           ,[zaswFK]
           ,[zaurFK]
           ,[zaDataPlanu]
           ,[zaDataRealizacji]
           ,[zaslFKPriorytet]
           ,[zaOpis]
           ,[zaLoginDodania]
           ,[zaDataDodania],[zaCzyZrealizowane],
           [zaslFKTyp],[zaCzyZablokowane],[zaUsuniety]
)
     VALUES
           (@khPK, @swPK,@urPK,GETDATE(),@DataRealizacji,@Priorytet,@opis,@LoginDodajacego,GETDATE(),0,'A',0,0)

-- Wprwadzenie faktu dodania zadania do historii

INSERT INTO [lucapacioli].[dbo].[HistoriaKontaktow]
           ([hikhFK] -- kontrahent
           ,[hiswFK] -- sprawa
           ,[hiurFK] -- pracownik
           ,[hitkFK] -- typ kontaktu s³ownikowa 6
           ,[hiDataKontaktu] -- sysdate
           ,[hiOpis] -- opis
           ,[hiUsuniety] -- 0
           ,[hiLoginDodania]
           ,[hiDataDodania] -- sysdate
           )
     VALUES 
           (@khPK,@swPK,@urPK,6,GETDATE(),@opis,0,@LoginDodajacego,GETDATE())

END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION;
PRINT '### ERROR ### Blad w dodawaniu zadania ErrorCode = -4'
	RETURN -4
END CATCH
COMMIT TRANSACTION;------------------

GO

/**
================================================================
Procedura zamykajaca zadanie i wpisujaca zdarzenie do historii

@IDZadania -- numer zadania do zamkniecia
@LoginZamykajacego -- login osoby zamykajacej

Przyklad
exec dbo.usp_ZamknijZadanie numer_zadani, login_zamykajacego
================================================================
**/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ZamknijZadanie]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ZamknijZadanie]
GO


CREATE PROCEDURE [dbo].[usp_ZamknijZadanie]
@IDZadania int,
@LoginZamykajacego nvarchar (50)
AS

----------------------------------
DECLARE @idzad int, @khPK int, @swPK int, @urPK int
set @idzad = null

-- Wyszukanie czy istnieje zadanie i pobranie danych potrzebnych do stworzenia historii

select @idzad=zaPK, @khPK=zakhFK,@swPK=zaswFK,@urPK=zaurFK from dbo.Zadanie where zaPK=@IDZadania and zaCzyZrealizowane=0

IF (@idzad is null) 
	BEGIN
	PRINT '### ERROR ### Brak zadania do zamkniecia lub zadanie jest zamkniete ErrorCode = -1'
	return -1
	END


-----------------------------------	
DECLARE @zam int
set @zam = null

-- Wyszukanie pracownika zamykajacego zadanie
select @zam=urPK from dbo.Uzytkownik where urLogin=@LoginZamykajacego and @urPK=urPK

IF (@zam is null) 
	BEGIN
	PRINT '### ERROR ### Brak Pracownika zamykajacego zadanie lub zamykajacy nie jest pracownikiem przypisanym do zadania ErrorCode = -2'
	return -2
	END	
	

BEGIN TRY
BEGIN TRANSACTION;
-- zamykanie zadania

UPDATE [lucapacioli].[dbo].[Zadanie]
   SET [zaDataPlanuStop] = GETDATE()
      ,[zaCzyZrealizowane] = 1
      ,[zaLoginZmiany] = @LoginZamykajacego
      ,[zaDataZmiany] = GETDATE()
 WHERE  zaPK=@IDZadania
 
 -- dodanie do hostorii zdarzen
 INSERT INTO [lucapacioli].[dbo].[HistoriaKontaktow]
           ([hikhFK] -- kontrahent
           ,[hiswFK] -- sprawa
           ,[hiurFK] -- pracownik
           ,[hitkFK] -- typ kontaktu s³ownikowa 6
           ,[hiDataKontaktu] -- sysdate
           ,[hiOpis] -- opis
           ,[hiUsuniety] -- 0
           ,[hiLoginDodania]
           ,[hiDataDodania] -- sysdate
           )
     VALUES 
           (@khPK,@swPK,@urPK,6,GETDATE(),'Zamkniecie zadania',0,@LoginZamykajacego,GETDATE())


END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION;
PRINT '### ERROR ### Blad w zamykaniu zadania ErrorCode = -3'
	RETURN -3
END CATCH
COMMIT TRANSACTION;

GO

/**
=====================================================================
Procedura automatycznie przypisujaca platnosc do splaty i bilansujaca
WEJSC
	@idPlatnosci - id platnosci
	@idWierzyt - id wierzytelnosci
	
Przyklad
exec dbo.usp_SplacWierzytelnosc id_platnosci,id_wierzytelnosci
=====================================================================
**/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SplacWierzytelnosc]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SplacWierzytelnosc]
GO

CREATE PROCEDURE [dbo].[usp_SplacWierzytelnosc]
	@idPlatnosci int,
	@idWierzyt int
AS
-- Przygotowanie platnosci
DECLARE 
@kwotaPlat decimal(18,2),@saldoPlat decimal(18,2)
set @kwotaPlat = null

-- Wyszukiwanie zadeklarowanej p³atnosci i pobranie danych do wyliczen
select @kwotaPlat=plKwota, @saldoPlat=plSaldo from dbo.Platnosc where plPK=@idPlatnosci 

IF (@kwotaPlat is null) 
	BEGIN
	PRINT '### ERROR ### Brak p³atnoœci do zbilansowania ErrorCode = -1'
	return -1
	END


-- przygotowanie wierzytelnosc
DECLARE 
@kwotaWlas decimal(18,2),@saldoWierzyt decimal(18,2)
set @kwotaWlas = null
 -- Wyszukiwanie wierzytelnosci do zbilanswania
 select @kwotaWlas=wiKwotaWlasciwa,@saldoWierzyt=wiSaldo from dbo.Wierzytelnosc where wiPK=@idWierzyt
 
IF (@kwotaWlas is null) 
	BEGIN
	PRINT '### ERROR ### Brak wierzytelnosci do zbilansowania ErrorCode = -2'
	return -2
	END


---- weryfikowanie wysokoœci sp³aty.
declare
@WysSplaty decimal(18,2)
set @WysSplaty=0

if @saldoPlat >= @saldoWierzyt
	BEGIN
	set @WysSplaty = @saldoWierzyt
	END
else 
	BEGIN
	set @WysSplaty = @saldoPlat
	END

BEGIN TRY
BEGIN TRANSACTION;

-- Wstawiamy splate
INSERT INTO [lucapacioli].[dbo].[Splata]
           ([stwiFK] -- wierzytelnosc
           ,[stplFK] -- platnosc
           ,[stData]
           ,[stKwota]
           ,[stLoginDodania]
           ,[stDataDodania],[stWartoscOdsetek],[stUsuniety])
     VALUES (@idWierzyt,@idPlatnosci,GETDATE(),@WysSplaty,'AUTOMAT',GETDATE(),dbo.fn_LiczOdsetki_potencjalne(@idWierzyt,GETDATE()),0)
     
-- poprawiamy stan p³atnosci

UPDATE [lucapacioli].[dbo].[Platnosc]
   SET 
      [plSaldo] = (@saldoPlat - @WysSplaty)
      ,[plLoginZmiany] = 'AUTOMAT'
      ,[plDataZmiany] = GETDATE()
 WHERE plPK=@idPlatnosci 

-- poprawiamy stan wierzytelnosci

UPDATE [lucapacioli].[dbo].[Wierzytelnosc]
   SET 
      [wiSaldo] = (@saldoWierzyt - @WysSplaty)
      ,[wiLoginZmiany] = 'Automat'
      ,[wiDataZmiany] = GETDATE()
 WHERE wiPK=@idWierzyt
 
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION;
	PRINT '### ERROR ### Problemy z wykonaniem bilansowania ErrorCode = -3'
	RETURN -3 
END CATCH
COMMIT TRANSACTION;------------------



GO

/**
======================================================================
Procedura przyjmujaca wplate z mozliwoscia bilansowania wierzytelnosci

	@idKontrahenta - id kontrahenta wplacajacego
	@kwota - kwota jaka zosta³a wpacona
	@Nrdokumentu - nazwa dokumentu
	@LoginDodajacego - identyfikator przyjmujacego wplate
	@idWierzytelnosci int = null - id ewentualnej wierzytelnosci do wplacenia

Przyklad
exec dbo.usp_WprowadzPlatnosc 9,350,'dok wpl 3',arek 
	lub 
exec dbo.usp_WprowadzPlatnosc 9,350,'dok wpl 3',arek,12
exec dbo.usp_WprowadzPlatnosc <idKOntrahenta>,<kwota>,<nazwa dokumentu>,<login>,<idWierzytelnosci - opcjonalne>
==========================================================================
**/


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_WprowadzPlatnosc]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_WprowadzPlatnosc]
GO


CREATE PROCEDURE [dbo].[usp_WprowadzPlatnosc]
	@idKontrahenta int,
	@kwota decimal(18,2),
	@Nrdokumentu nvarchar(50), 
	@LoginDodajacego nvarchar(50),
	@idWierzytelnosci int = null
AS

BEGIN TRY
-- wprowadzanie platnosci 
INSERT INTO [lucapacioli].[dbo].[Platnosc]
           ([plkhFK] -- kontrahent
           ,[plNrDokumentu] -- dokument
           ,[plData]
           ,[plKwota]
           ,[plSaldo]
           ,[plUsuniety] --0
           ,[plLoginDodania]
           ,[plDataDodania]
           )
     VALUES
           (@idKontrahenta,@Nrdokumentu,GETDATE(),@kwota,
           @kwota,0,@LoginDodajacego,GETDATE())
END TRY
	BEGIN CATCH
	-- wychwycenie ewentualnych problemow z wprowadzeniem danych
	PRINT '### ERROR ### B³ad wprowadzania wp³aty  ErrorCode = -1'
	    SELECT 
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_MESSAGE() AS ErrorMessage;
	return -1
	END CATCH;
	
-- odczytanie id platnosci	
DECLARE @idplatnosci int
SELECT @idplatnosci=@@IDENTITY;

-- splacamy wierzytelnosc
if @idWierzytelnosci is not null
begin 

BEGIN TRY
    EXECUTE dbo.usp_SplacWierzytelnosc  @idplatnosci,@idWierzytelnosci
END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_MESSAGE() AS ErrorMessage;
        PRINT '### ERROR ### B³¹d w wykonywaniu bilansowania  ErrorCode = -2'
        return -2
END CATCH;
END
else 
PRINT '### INFO ### Brak wierzytelnosci do splacenia, wplata zosta³a wprowadzona'



GO

