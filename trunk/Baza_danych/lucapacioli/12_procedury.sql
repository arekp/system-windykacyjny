-- =============================================
-- procedury - 4 obiekty
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
w tabeli Platnosc na podstawie skojarzonych platnosci z wierzytelnosciami
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
w tabeli Wierzytelnosci na podstawie skojarzonych platnoœci z wierzytelnoœciami
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