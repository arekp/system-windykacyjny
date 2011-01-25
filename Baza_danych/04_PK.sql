-- =============================================
-- zakladamy PK - 29 obiektów

/*
WERYFIKCACJA:

SELECT 
  TABLE_NAME, CONSTRAINT_NAME
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
  WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
  */
-- =============================================
use lucapacioli
go
ALTER TABLE dbo._NazwyTabel	
ADD CONSTRAINT 	[PK__NazwyTabel]	PRIMARY KEY CLUSTERED 	
(
	[PK] ASC 
)

ALTER TABLE dbo.Adres	
ADD CONSTRAINT 	[PK_Adres]	PRIMARY KEY CLUSTERED 	
(
	[adPK] ASC 
)

ALTER TABLE dbo.ApiKontrahent	
ADD CONSTRAINT 	[PK_ApiKontrahent]	PRIMARY KEY CLUSTERED 	
(
	[apiPK] ASC 
)

ALTER TABLE dbo.Dokument	
ADD CONSTRAINT 	[PK_Dokument]	PRIMARY KEY CLUSTERED 	
(
	[doPK] ASC 
)

ALTER TABLE dbo.Etap	
ADD CONSTRAINT 	[PK_Etap]	PRIMARY KEY CLUSTERED 	
(
	[etPK] ASC 
)

ALTER TABLE dbo.Grupa	
ADD CONSTRAINT 	[PK_Grupa]	PRIMARY KEY CLUSTERED 	
(
	[grPK] ASC 
)

ALTER TABLE dbo.HistoriaKontaktow	
ADD CONSTRAINT 	[PK_HistoriaKontaktow]	PRIMARY KEY CLUSTERED 	
(
	[hiPK] ASC 
)

ALTER TABLE dbo.Kontakt	
ADD CONSTRAINT 	[PK_Kontakt]	PRIMARY KEY CLUSTERED 	
(
	[koPK] ASC 
)

ALTER TABLE dbo.Kontrahent	
ADD CONSTRAINT 	[PK_Kontrahent]	PRIMARY KEY CLUSTERED 	
(
	[khPK] ASC 
)

ALTER TABLE dbo.P_Grupa_Rola	
ADD CONSTRAINT 	[PK_P_Grupa_Rola]	PRIMARY KEY CLUSTERED 	
(
	[poPK] ASC 
)

ALTER TABLE dbo.P_Uzytkownik_Grupa	
ADD CONSTRAINT 	[PK_P_Uzytkownik_Grupa]	PRIMARY KEY CLUSTERED 	
(
	[poPK] ASC 
)

ALTER TABLE dbo.P_Uzytkownik_Rola	
ADD CONSTRAINT 	[PK_P_Uzytkownik_Rola]	PRIMARY KEY CLUSTERED 	
(
	[poPK] ASC 
)

ALTER TABLE dbo.Platnosc	
ADD CONSTRAINT 	[PK_Platnosc]	PRIMARY KEY CLUSTERED 	
(
	[plPK] ASC 
)

ALTER TABLE dbo.Raporty	
ADD CONSTRAINT 	[PK_Raporty]	PRIMARY KEY CLUSTERED 	
(
	[rpPK] ASC 
)

ALTER TABLE dbo.Rola	
ADD CONSTRAINT 	[PK_Rola]	PRIMARY KEY CLUSTERED 	
(
	[roPK] ASC 
)

ALTER TABLE dbo.slEtapSprawy	
ADD CONSTRAINT 	[PK_slEtapSprawy]	PRIMARY KEY CLUSTERED 	
(
	[esPK] ASC 
)

ALTER TABLE dbo.slStanowisko	
ADD CONSTRAINT 	[PK_slStanowisko]	PRIMARY KEY CLUSTERED 	
(
	[soPK] ASC 
)

ALTER TABLE dbo.slStawkaStopyProcentowej	
ADD CONSTRAINT 	[PK_slStawkaStopyProcentowej]	PRIMARY KEY CLUSTERED 	
(
	[ssPK] ASC 
)

ALTER TABLE dbo.slStopaProcentowa	
ADD CONSTRAINT 	[PK_slStopaProcentowa]	PRIMARY KEY CLUSTERED 	
(
	[spPK] ASC 
)

ALTER TABLE dbo.slTypAdresu	
ADD CONSTRAINT 	[PK_slTypAdresu]	PRIMARY KEY CLUSTERED 	
(
	[taPK] ASC 
)

ALTER TABLE dbo.slTypDokumentu	
ADD CONSTRAINT 	[PK_slTypDokumentu]	PRIMARY KEY CLUSTERED 	
(
	[tdPK] ASC 
)

ALTER TABLE dbo.slTypKontaktu	
ADD CONSTRAINT 	[PK_slTypKontaktu]	PRIMARY KEY CLUSTERED 	
(
	[tkPK] ASC 
)

ALTER TABLE dbo.slWojewodztwo	
ADD CONSTRAINT 	[PK_slWojewodztwo]	PRIMARY KEY CLUSTERED 	
(
	[woPK] ASC 
)

ALTER TABLE dbo.Splata	
ADD CONSTRAINT 	[PK_Splata]	PRIMARY KEY CLUSTERED 	
(
	[stPK] ASC 
)

ALTER TABLE dbo.Sprawa	
ADD CONSTRAINT 	[PK_Sprawa]	PRIMARY KEY CLUSTERED 	
(
	[swPK] ASC 
)

ALTER TABLE dbo.Umowa	
ADD CONSTRAINT 	[PK_Umowa]	PRIMARY KEY CLUSTERED 	
(
	[umPK] ASC 
)

ALTER TABLE dbo.Uzytkownik	
ADD CONSTRAINT 	[PK_Uzytkownik]	PRIMARY KEY CLUSTERED 	
(
	[urPK] ASC 
)

ALTER TABLE dbo.Wierzytelnosc	
ADD CONSTRAINT 	[PK_Wierzytelnosc]	PRIMARY KEY CLUSTERED 	
(
	[wiPK] ASC 
)

ALTER TABLE dbo.Zadanie	
ADD CONSTRAINT 	[PK_Zadanie]	PRIMARY KEY CLUSTERED 	
(
	[zaPK] ASC 
)
