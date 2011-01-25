-- =============================================
-- zakladamy tabele - 29 obiektów

/*
WERYFIKCACJA:
select name, create_date from sys.tables
where type_desc='USER_TABLE'
*/
-- =============================================

use lucapacioli
go

/****** Object:  Table [dbo].[_NazwyTabel]    Script Date: 01/05/2011 23:49:27 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[_NazwyTabel]') AND type in (N'U'))
BEGIN
CREATE TABLE [_NazwyTabel](
	[PK] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](50) NULL,
	[Prefix] [char](2) NULL,
	[DataDodania] [datetime] NULL,
	[TypZdarzenia][nvarchar] (50)NULL,
	[TypObjectu] [nvarchar] (50) NULL,
	[LoginDodania] [nvarchar](50) NULL,
	[CommandText] [nvarchar] (max) NULL
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Adres]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Adres]') AND type in (N'U'))
BEGIN
CREATE TABLE [Adres](
	[adPK] [int] IDENTITY(1,1) NOT NULL,
	[adkhFK] [int] NULL,			 --- klucz obcy do tabeli Kontrahent
	[adkoFK][int]  NULL,			 --- klucz obcy do tabeli Kontakt
	[adwoFK] [int] NULL,			 --- klucz obcy do tabeli slWojewodztwo
	[adslFKTypAdresu] [int]NOT NULL, --- klucz obcy do tabeli slTypAdresu
	[adMiasto] [nvarchar](100) NOT NULL,
	[adKodPocztowy] [nchar](10) NULL,
	[adUlica] [nvarchar](150) NOT NULL,
	[adDom] [nvarchar](20) NOT NULL,
	[adLokal] [nvarchar](20) NULL,
	[adTelefon] [nvarchar](50) NULL,
	[adKomorka] [nvarchar](50) NULL,
	[adFax] [nvarchar](50) NULL,
	[adEmail] [nvarchar](50) NULL,
	[adWWW] [nvarchar](50) NULL,
	[adUsuniety] [bit] NOT NULL,
	[adLoginDodania] [nvarchar](50) NOT NULL,
	[adDataDodania] [datetime] NOT NULL,
	[adLoginZmiany] [nvarchar](50) NULL,
	[adDataZmiany] [datetime] NULL,
	[adStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[ApiKontrahent]    Script Date: 01/06/2011 00:04:19 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ApiKontrahent]') AND type in (N'U'))
BEGIN
CREATE TABLE [ApiKontrahent](
	[apiPK] [int] IDENTITY(1,1) NOT NULL,
	[apiOryginalneID] [int] NOT NULL,		--- oryginalne PK kontrahenta z systemu Ÿród³owego
	[apiNazwa] [nvarchar](250) NOT NULL,
	[apiSkrot] [nvarchar](50) NOT NULL,
	[apiSymbol] [nvarchar](10) NULL,
	[apiNIP] [nvarchar](50) NULL,
	[apiREGON] [nvarchar](50) NULL,
	[apiKRS] [nvarchar](50) NULL,
	[apiCzyWierzyciel] [bit] NOT NULL,
	[apiCzyDluznik] [bit] NOT NULL,
	[apiCzyOsobaFizyczna] [bit] NOT NULL,
	[apiDataUrodzenia] [date] NULL,
	[apiMiejsceUrodzenia] [nvarchar](50) NULL,
	[apiPesel] [nvarchar](11) NULL,
	[apiNumerDowodu] [nvarchar](20) NULL,
	[apiZrodloDochodu] [nvarchar](50) NULL,
	[apiCzyWlasciciel] [bit] NOT NULL,
	[apiUwagi] [nvarchar](max) NULL
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Dokument]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Dokument]') AND type in (N'U'))
BEGIN
CREATE TABLE [Dokument](
	[doPK] [int] IDENTITY(1,1) NOT NULL,
	[dospFK] [int] NOT NULL,					--- klucz obcy do tabeli Sprawa
	[doNazwa] [nvarchar](255) NOT NULL,			--- nazwa pliku wraz z rozszerzeniem
	[doCzyWidoczny] [bit] NOT NULL,
	[doInformacje] [nvarchar](max) NULL,
	[doPlik] [varbinary](max) NULL,				--- plik w postaci binarnej
	[doUsuniety] [bit] NOT NULL,
	[doLoginDodania] [nvarchar](50) NOT NULL,
	[doDataDodania] [datetime] NOT NULL,
	[doStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Etap]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Etap]') AND type in (N'U'))
BEGIN
CREATE TABLE [Etap](
	[etPK] [int] IDENTITY(1,1) NOT NULL,
	[etswFK] [int] NOT NULL,				--- klucz obcy do tabeli Sprawa
	[etslESFK] [int] NOT NULL,				--- klucz obcy do tabeli slEtapSprawy
	[etData] [datetime] NOT NULL,
	[etCzyNieaktywny] [bit] NOT NULL,
	[etUsuniety] [bit] NOT NULL,
	[etLoginDodania] [nvarchar](50) NOT NULL,
	[etDataDodania] [datetime] NOT NULL,
	[etLoginZmiany] [nvarchar](50) NULL,
	[etDataZmiany] [datetime] NULL,
	[etStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Grupa]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Grupa]') AND type in (N'U'))
BEGIN
CREATE TABLE [Grupa](
	[grPK] [int] IDENTITY(1,1) NOT NULL,
	[grPrefix] [nvarchar](50) NOT NULL,
	[grNazwa] [nvarchar](50) NOT NULL,
	[grTyp] [nvarchar](50) NOT NULL,
	[grParent] [int] NOT NULL,
	[grOpis] [nvarchar](255) NULL,
	[grWidoczna] [bit] NOT NULL,
	[grEdytowalna] [bit] NOT NULL,
	[grUsuniety] [bit] NOT NULL,
	[grLoginDodania] [nvarchar](50) NOT NULL,
	[grDataDodania] [datetime] NOT NULL,
	[grStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO


/****** Object:  Table [dbo].[HistoriaKontaktow]    Script Date: 01/06/2011 00:04:19 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[HistoriaKontaktow]') AND type in (N'U'))
BEGIN
CREATE TABLE [HistoriaKontaktow](
	[hiPK] [int] IDENTITY(1,1) NOT NULL,
	[hikhFK] [int] NOT NULL,			--- klucz obcy do tabeli Kontrahent
	[hiswFK] [int] NULL,				--- klucz obcy do tabeli Sprawa
	[hietFK] [int] NULL,				--- klucz obcy do tabeli Etap
	[hiurFK] [int] NOT NULL,			--- klucz obcy do tabeli Uzytkownk
	[hizaFK] [int] NULL,				--- klucz obcy do tabeli Zadanie
	[hitkFK] [int] NOT NULL,			--- klucz obcy do tabeli slTypKontaktu
	[hiDataKontaktu] [datetime] NOT NULL,
	[hiOpis] [nvarchar](max) NULL,
	[hiUsuniety] [bit] NOT NULL,
	[hiLoginDodania] [nvarchar](50) NOT NULL,
	[hiDataDodania] [datetime] NOT NULL,
	[hiLoginZmiany] [nvarchar](50) NULL,
	[hiDataZmiany] [datetime] NULL,
	[hiStamp] [timestamp] NULL
) ON [PRIMARY]
END
GO


/****** Object:  Table [dbo].[Kontakt]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Kontakt]') AND type in (N'U'))
BEGIN
CREATE TABLE [Kontakt](
	[koPK] [int] IDENTITY(1,1) NOT NULL,
	[kokhFK] [int] NULL,					--- klucz obcy do tabeli Kontrahent
	[koslStanowiskoFK] [int] NULL,			--- klucz obcy do tabeli slStanowisko
	[koImie] [nvarchar](100) NOT NULL,
	[koNazwisko] [nvarchar](100) NOT NULL,
	[koUwagi] [nvarchar](255) NULL,
	[koUsuniety] [bit] NOT NULL,
	[koLoginDodania] [nvarchar](50) NOT NULL,
	[koDataDodania] [datetime] NOT NULL,
	[koLoginZmiany] [nvarchar](50) NULL,
	[koDataZmiany] [datetime] NULL,
	[koStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Kontrahent]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Kontrahent]') AND type in (N'U'))
BEGIN
CREATE TABLE [Kontrahent](
	[khPK] [int] IDENTITY(1,1) NOT NULL,
	[khapiOryginalneID] [int] NULL,				-- klucz obcy do tabeli ApiKontrahent, kolumna apiOryginalneID
	[khNazwa] [nvarchar](250) NOT NULL,
	[khSkrot] [nvarchar](50) NOT NULL,
	[khSymbol] [nvarchar](10) NULL,
	[khNIP] [nvarchar](50) NULL,
	[khREGON] [nvarchar](50) NULL,
	[khKRS] [nvarchar](50) NULL,
	[khCzyWierzyciel] [bit] NOT NULL,
	[khCzyDluznik] [bit] NOT NULL,
	[khCzyOsobaFizyczna] [bit] NOT NULL,
	[khDataUrodzenia] [date] NULL,
	[khMiejsceUrodzenia] [nvarchar](50) NULL,
	[khPesel] [nvarchar](11) NULL,
	[khNumerDowodu] [nvarchar](20) NULL,
	[khZrodloDochodu] [nvarchar](50) NULL,
	[khCzyWlasciciel] [bit] NOT NULL,
	[khUwagi] [nvarchar](max) NULL,
	[khUsuniety] [bit] NOT NULL,
	[khLoginDodania] [nvarchar](50) NOT NULL,
	[khDataDodania] [datetime] NOT NULL,
	[khLoginZmiany] [nvarchar](50) NULL,
	[khDataZmiany] [datetime] NULL,
	[khStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO


/****** Object:  Table [dbo].[Uzytkownik]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Uzytkownik]') AND type in (N'U'))
BEGIN
CREATE TABLE [Uzytkownik](
	[urPK] [int] IDENTITY(1,1) NOT NULL,
	[urImie] [nvarchar](50) NOT NULL,
	[urDrugieImie] [nvarchar](50) NULL,
	[urNazwisko] [nvarchar](50) NOT NULL,
	[urNazwiskoRodowe] [nvarchar](50) NULL,
	[urLogin] [nvarchar](50) NOT NULL,
	[urDomena] [nvarchar](50) NOT NULL,
	[urMail] [nvarchar](50) NOT NULL,
	[urCzyAutentykacjaW] [bit] NOT NULL,
	[urPlec] [bit] NOT NULL,
	[urUsuniety] [bit] NOT NULL,
	[urLoginDodania] [nvarchar](50) NOT NULL,
	[urDataDodania] [datetime] NOT NULL,
	[urStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Rola]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Rola]') AND type in (N'U'))
BEGIN
CREATE TABLE [Rola](
	[roPK] [int] IDENTITY(1,1) NOT NULL,
	[roPrefix] [nvarchar](50) NOT NULL,
	[roNazwa] [nvarchar](50) NOT NULL,
	[roTyp] [nvarchar](50) NOT NULL,
	[roParent] [int] NOT NULL,
	[roOpis] [nvarchar](255) NULL,
	[roWidoczne] [bit] NOT NULL,
	[roEdytowalne] [bit] NOT NULL,
	[roUsuniety] [bit] NOT NULL,
	[roLoginDodania] [nvarchar](50) NOT NULL,
	[roDataDodania] [datetime] NOT NULL,
	[roStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Raporty]    Script Date: 01/06/2011 00:04:19 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Raporty]') AND type in (N'U'))
BEGIN
CREATE TABLE [Raporty](
	[rpPK] [int] NOT NULL,
	[rpPrefiks] [nvarchar](255) NOT NULL,
	[rpNazwa] [nvarchar](255) NOT NULL,
	[rpParent] [int] NOT NULL,
	[rpOrder] [int] NULL,
	[rpHeader] [bit] NOT NULL,
	[rpCzyWidoczny] [bit] NOT NULL,
	[rpInformacje] [nvarchar](2000) NOT NULL,
	[rpKontrolka] [nvarchar](255) NOT NULL,
	[rpLoginDodania] [nvarchar](50) NOT NULL,
	[rpDataDodania] [datetime] NOT NULL,
	[rpStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Platnosc]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Platnosc]') AND type in (N'U'))
BEGIN
CREATE TABLE [Platnosc](
	[plPK] [int] IDENTITY(1,1) NOT NULL,
	[plkhFK] [int] NOT NULL,				--- klucz obcy do tabeli Kontrahent
	[plNrDokumentu] [nvarchar](50) NOT NULL,
	[plData] [date] NOT NULL,
	[plKwota] [decimal](18, 2) NOT NULL,
	[plSaldo] [decimal](18, 2) NOT NULL,
	[plUsuniety] [bit] NOT NULL,
	[plLoginDodania] [nvarchar](50) NOT NULL,
	[plDataDodania] [datetime] NOT NULL,
	[plLoginZmiany] [nvarchar](50) NULL,
	[plDataZmiany] [datetime] NULL,
	[plStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[P_Uzytkownik_Rola]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[P_Uzytkownik_Rola]') AND type in (N'U'))
BEGIN
CREATE TABLE [P_Uzytkownik_Rola](
	[poPK] [int] IDENTITY(1,1) NOT NULL,
	[pourFK] [int] NOT NULL,
	[poroFK] [int] NOT NULL,
	[poUsuniety] [bit] NOT NULL,
	[poLoginDodania] [nvarchar](50) NOT NULL,
	[poDataDodania] [datetime] NOT NULL,
	[poStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[P_Uzytkownik_Grupa]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[P_Uzytkownik_Grupa]') AND type in (N'U'))
BEGIN
CREATE TABLE [P_Uzytkownik_Grupa](
	[poPK] [int] IDENTITY(1,1) NOT NULL,
	[pourFK] [int] NOT NULL,
	[pogrFK] [int] NOT NULL,
	[poUsuniety] [bit] NOT NULL,
	[poLoginDodania] [nvarchar](50) NOT NULL,
	[poDataDodania] [datetime] NOT NULL,
	[poStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[P_Grupa_Rola]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[P_Grupa_Rola]') AND type in (N'U'))
BEGIN
CREATE TABLE [P_Grupa_Rola](
	[poPK] [int] IDENTITY(1,1) NOT NULL,
	[pogrFK] [int] NOT NULL,
	[poroFK] [int] NOT NULL,
	[poUsuniety] [bit] NOT NULL,
	[poLoginDodania] [nvarchar](50) NOT NULL,
	[poDataDodania] [date] NOT NULL,
	[poStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Umowa]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Umowa]') AND type in (N'U'))
BEGIN
CREATE TABLE [Umowa](
	[umPK] [int] IDENTITY(1,1) NOT NULL,
	[umkhFK] [int] NOT NULL,				--- klucz obcy do tabeli Kontrahent
	[umurFK] [int] NOT NULL,				--- kluczu obcy do tabeli Uzytkownik
	[umDataUmowy] [date] NOT NULL,
	[umNumerUmowy] [nvarchar](50) NOT NULL,
	[umCzyZatwierdzona] [bit] NULL,
	[umUsuniety] [bit] NOT NULL,
	[umLoginDodania] [nvarchar](50) NOT NULL,
	[umDataDodania] [datetime] NOT NULL,
	[umLoginZmiany] [nvarchar](50) NULL,
	[umDataZmiany] [datetime] NULL,
	[umStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[slStanowisko]    Script Date: 01/06/2011 00:04:19 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[slStanowisko]') AND type in (N'U'))
BEGIN
CREATE TABLE [slStanowisko](
	[soPK] [int] IDENTITY(1,1) NOT NULL,
	[soNazwa]  [nvarchar](255) NULL
	)
 ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[slWojewodztwo]    Script Date: 01/06/2011 00:04:19 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[slWojewodztwo]') AND type in (N'U'))
BEGIN
CREATE TABLE [slWojewodztwo](
	[woPK] [int] IDENTITY(1,1) NOT NULL,
	[woNazwa]  [nvarchar](255) NOT NULL
	)
 ON [PRIMARY]
END
GO


/****** Object:  Table [dbo].[slTypAdresu]    Script Date: 01/06/2011 00:04:19 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[slTypAdresu]') AND type in (N'U'))
BEGIN
CREATE TABLE [slTypAdresu](
	[taPK] [int] IDENTITY(1,1) NOT NULL,
	[taNazwa]  [nvarchar](255) NOT NULL,
	[taCzyGlowny] [bit] NOT NULL
	)
 ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[slTypKontaktu]    Script Date: 01/06/2011 00:04:19 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[slTypKontaktu]') AND type in (N'U'))
BEGIN
CREATE TABLE [slTypKontaktu](
	[tkPK] [int] IDENTITY(1,1) NOT NULL,
	[tkNazwa]  [nvarchar](255) NOT NULL
	)
 ON [PRIMARY]
END
GO


/****** Object:  Table [dbo].[slEtapSprawy]    Script Date: 01/06/2011 00:04:19 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[slEtapSprawy]') AND type in (N'U'))
BEGIN
CREATE TABLE [slEtapSprawy](
	[esPK] [int] IDENTITY(1,1) NOT NULL,
	[esNazwa]  [nvarchar](255) NOT NULL,
	[esOpis]  [nvarchar](255) NULL
	)
 ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[slTypDokumentu]    Script Date: 01/06/2011 00:04:19 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[slTypDokumentu]') AND type in (N'U'))
BEGIN
CREATE TABLE [slTypDokumentu](
	[tdPK] [int] IDENTITY(1,1) NOT NULL,
	[tdNazwa]  [nvarchar](255) NOT NULL,
	[tdOpis]  [nvarchar](255) NULL
	)
 ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[slStawkaStopyProcentowej]    Script Date: 01/06/2011 00:04:19 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[slStawkaStopyProcentowej]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[slStawkaStopyProcentowej](
	[ssPK] [int] IDENTITY(1,1) NOT NULL,
	[ssspFK] [int] NOT NULL,					--- klucz obcy do tabeli slStawkaProcentowa
	[ssStawka] [float] NOT NULL,
	[ssDataOd] [datetime] NOT NULL,
	[ssDataDo] [datetime] NULL,
	[ssDataDadania] [datetime] NOT NULL,
	[ssLogin] [nvarchar](50) NOT NULL,
	[ssDataZmiany] [datetime] NULL,
	[ssLoginZmiany] [nvarchar](50) NULL,
	[ssStamp] [timestamp] NOT NULL
	)
 ON [PRIMARY]
END
GO
	
/****** Object:  Table [dbo].[slStopaProcentowa]    Script Date: 01/06/2011 00:04:19 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[slStopaProcentowa]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[slStopaProcentowa](
	[spPK] [int] IDENTITY(1,1) NOT NULL,
	[spNazwaStopy] [nvarchar](50) NOT NULL,
	[spDataDodania] [datetime] NOT NULL,
	[spLogin] [nvarchar](50) NOT NULL,
	[spDataZmiany] [datetime] NULL,
	[spLoginZmiany] [nvarchar](50) NULL,
	[spStamp] [timestamp] NOT NULL	
	)
 ON [PRIMARY]
END
GO	
	
/****** Object:  Table [dbo].[Sprawa]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Sprawa]') AND type in (N'U'))
BEGIN
CREATE TABLE [Sprawa](
	[swPK] [int] IDENTITY(1,1) NOT NULL,
	[swumFK] [int] NOT NULL,				--- klucz obcy do tabeli Umowa
	[swurFK] [int] NOT NULL,				--- klucz obcy do tabeli Uzytkownik
	[swkhFK] [int] NOT NULL,				--- klucz obcy do tabeli Kontrahent
	[swNumerSprawy] [nvarchar](50) NULL,
	[swCzyLiczycOdsetki] [bit] NOT NULL,
	[swUwagi] [nvarchar](max) NULL,
	[swUsuniety] [bit] NOT NULL,
	[swLoginDodania] [nvarchar](50) NOT NULL,
	[swDataDodania] [datetime] NOT NULL,
	[swLoginZmiany] [nvarchar](50) NULL,
	[swDataZmiany] [datetime] NULL,
	[swStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Wierzytelnosc]    Script Date: 01/06/2011 00:04:19 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Wierzytelnosc]') AND type in (N'U'))
BEGIN
CREATE TABLE [Wierzytelnosc](
	[wiPK] [int] IDENTITY(1,1) NOT NULL,
	[wiswFK] [int] NOT NULL,						--- klucz obcy do tabeli Sprawa
	[wislTDFK] [int] NOT NULL,						--- klucz obcy do tabeli slTypDokumentu
	[wislSPFK] [int] NOT NULL,						--- klucz obcy do tabeli slStopaProcentowa
	[wiNumerDokumentu] [nvarchar](50) NOT NULL,
	[wiDataDokumentu] [datetime] NOT NULL,
	[wiDataWymagalnosci] [datetime] NOT NULL,
	[wiCzyLiczycOdsetki] [bit] NOT NULL,
	[wiKrotnoscOdsetek] [decimal](18, 2) NOT NULL,	--- krotnoœæ odsetek
	[wiLiczbaDniWRoku] [float] NOT NULL,			--- liczba dni w roku do obliczenia odsetek
	[wiKwotaWlasciwa] [decimal](18, 2) NOT NULL,
	[wiKwotaGlowna] [decimal](18, 2) NOT NULL,
	[wiSaldo] [decimal](18, 2) NOT NULL,
	[wiUsuniety] [bit] NOT NULL,
	[wiLoginDodania] [nvarchar](50) NOT NULL,
	[wiDataDodania] [datetime] NOT NULL,
	[wiLoginZmiany] [nvarchar](50) NULL,
	[wiDataZmiany] [datetime] NULL,
	[wiStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Splata]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Splata]') AND type in (N'U'))
BEGIN
CREATE TABLE [Splata](
	[stPK] [int] IDENTITY(1,1) NOT NULL,	
	[stwiFK] [int] NOT NULL,				--- klucz obcy do tabeli Wierzytelnosc
	[stplFK] [int] NOT NULL,				--- klucz obcy do tabeli Platnosc
	[stWartoscOdsetek] [decimal](18, 2) NOT NULL,
	[stData] [date] NOT NULL,
	[stKwota] [decimal](18, 2) NOT NULL,
	[stUsuniety] [bit] NOT NULL,
	[stLoginDodania] [nvarchar](50) NOT NULL,
	[stDataDodania] [datetime] NOT NULL,
	[stLoginZmiany] [nvarchar](50) NULL,
	[stDataZmiany] [datetime] NULL,
	[stStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO

/****** Object:  Table [dbo].[Zadanie]    Script Date: 01/06/2011 00:04:19 ******/


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Zadanie]') AND type in (N'U'))
BEGIN
CREATE TABLE [Zadanie](
	[zaPK] [int] IDENTITY(1,1) NOT NULL,
	[zakhFK] [int] NOT NULL,				--- klucz obcy do tabeli Kontrahent
	[zaswFK] [int] NULL,					--- klucz obcy do tabeli Sprawa
	[zaetFK] [int] NULL,					--- klucz obcy do tabeli Etap
	[zaurFK] [int] NOT NULL,				--- klucz obcy do tabeli Uzytkownik
	[zaDataPlanu] [datetime] NULL,
	[zaDataPlanuStop] [datetime] NULL,
	[zaDataRealizacji] [datetime] NULL,
	[zaCzyZrealizowane] [bit] NOT NULL,
	[zaslFKTyp] [nvarchar](4) NOT NULL,
	[zaslFKPriorytet] [nvarchar](4) NOT NULL,
	[zaOpis] [nvarchar](max) NULL,
	[zaCzyZablokowane] [bit] NOT NULL,
	[zaUsuniety] [bit] NOT NULL,
	[zaLoginDodania] [nvarchar](50) NOT NULL,
	[zaDataDodania] [datetime] NOT NULL,
	[zaLoginZmiany] [nvarchar](50) NULL,
	[zaDataZmiany] [datetime] NULL,
	[zaStamp] [timestamp] NOT NULL
) ON [PRIMARY]
END
GO

