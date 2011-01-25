-- =============================================
-- zakladamy triggery - 2 obiekty
/*
WERYFIKACJA
select name  from sys.triggers
*/
-- =============================================
use lucapacioli
go

--- trigger, który z tabeli ApiKontrahent wprowadza i / lub modyfikuje dane w tabeli Kontrahent

if exists (select name from sys.triggers where name='ApiKontrahentTrigger')
drop TRIGGER ApiKontrahentTrigger
go
CREATE TRIGGER  [dbo].[ApiKontrahentTrigger] ON [dbo].[ApiKontrahent] 
FOR INSERT, UPDATE
AS

Declare @khOryginalneId int
Declare	@khNazwa nvarchar(100)
Declare	@khSkrot varchar(50)
Declare	@khSymbolKontrahenta varchar(50)
Declare	@khNIP nvarchar(13)
Declare	@khREGON nvarchar(14)
Declare	@khWierzyciel bit
Declare	@khDluznik bit
Declare	@khOsobaFizyczna bit
Declare @khWlasciciel bit

Declare @ile int

IF (SELECT COUNT(*) FROM inserted) > 0 
BEGIN	

	SELECT @khOryginalneId = (SELECT apiOryginalneID FROM inserted) 
	Select @ile = (Select Count(*) from Kontrahent Where khapiOryginalneID = @khOryginalneId) 

       		if(@ile >0)
		begin

			SELECT @khNazwa = (SELECT apiNazwa FROM Inserted)
			SELECT @khSkrot = (SELECT apiSkrot FROM Inserted)
			SELECT @khSymbolKontrahenta = (SELECT apiSymbol FROM Inserted)
			SELECT @khNIP = (SELECT  apiNIP FROM Inserted)
			SELECT @khREGON = (SELECT apiREGON FROM Inserted)

			SELECT @khWierzyciel = (SELECT apiCzyWierzyciel FROM Inserted)		
			SELECT @khDluznik = (SELECT apiCzyDluznik FROM Inserted)
			SELECT @khOsobaFizyczna = (SELECT apiCzyOsobaFizyczna FROM Inserted)
			SELECT @khWlasciciel = (SELECT apiCzyWlasciciel FROM Inserted)
 
			UPDATE [Kontrahent] SET  [khNazwa] = @khNazwa, [khSkrot] = @khSkrot, [khSymbol] = @khSymbolKontrahenta, [khNIP] = @khNIP, [khREGON] = @khREGON, 
			[khCzyWierzyciel] = @khWierzyciel, [khczyDluznik] = @khDluznik, [khCzyOsobaFizyczna] = @khOsobaFizyczna,
			[khCzyWlasciciel] = @khWlasciciel,
			[khDataZmiany] = GetDate(), [khLoginZmiany] = 'TRIGGER\ '+ CURRENT_USER Where [khapiOryginalneID] = @khOryginalneId
        		END
	Else
		Begin
			INSERT kontrahent (khapiOryginalneID,khNazwa, khSkrot, khSymbol, khNIP,khREGON,khCzyWierzyciel,khCzyDluznik,khCzyOsobaFizyczna,khCzyWlasciciel, khDataDodania,khLoginDodania) 
            SELECT apiOryginalneID,apiNazwa, apiSkrot, apiSymbol, apiNIP,apiREGON,apiCzyWierzyciel,apiCzyDluznik,apiCzyOsobaFizyczna,apiCzyWlasciciel ,GetDate(),'TRIGGER\ '+ CURRENT_USER FROM inserted            			
		
		END

 END


----- trigger, który wprowadza informacje o ka¿dej nowo tworzonej tabeli do _NazwyTabel

CREATE TRIGGER [trNazwyTabel_CREATE_TABLE_LOG]

ON DATABASE 

FOR CREATE_TABLE 

AS

SET NOCOUNT ON

DECLARE @xmlDataDodania XML



SET @xmlDataDodania = eventdata()



INSERT INTO lucapacioli.dbo._NazwyTabel

(

DataDodania,

TypZdarzenia,

TypObjectu,

Nazwa,

LoginDodania,

CommandText

)

SELECT REPLACE(CONVERT(VARCHAR(50), @xmlDataDodania.query('data(/EVENT_INSTANCE/PostTime)')),

'T', ' '),

CONVERT(VARCHAR(15), @xmlDataDodania.query('data(/EVENT_INSTANCE/EventType)')),

CONVERT(VARCHAR(25), @xmlDataDodania.query('data(/EVENT_INSTANCE/ObjectType)')),

CONVERT(VARCHAR(50), @xmlDataDodania.query('data(/EVENT_INSTANCE/ObjectName)')),

CONVERT(VARCHAR(50), @xmlDataDodania.query('data(/EVENT_INSTANCE/UserName)')),

CONVERT(VARCHAR(MAX), @xmlDataDodania.query('data(/EVENT_INSTANCE/TSQLCommand/CommandText)'))

GO


