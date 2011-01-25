/*
use lucapacioli
go

SELECT TABLE_NAME, CONSTRAINT_NAME
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
  WHERE CONSTRAINT_TYPE = 'CHECK'
  
 */
 
use lucapacioli
go

ALTER TABLE [dbo].[Kontrahent]
ADD CONSTRAINT CK_Kontrahent_khSymbol UNIQUE (khSymbol)

ALTER TABLE [dbo].[Kontrahent]
ADD CONSTRAINT CK_Kontrahent_khapiOryginalneID UNIQUE (khapiOryginalneID)

ALTER TABLE [dbo].[Kontrahent]
ADD CONSTRAINT CK_Kontrahent_khSkrot UNIQUE (khSkrot)