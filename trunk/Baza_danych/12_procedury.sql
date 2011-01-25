-- =============================================
-- procedury - 1 obiekt
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

End

  close c

  deallocate c
