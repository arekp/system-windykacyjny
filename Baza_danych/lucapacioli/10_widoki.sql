USE [lucapacioli]
GO

/****** Object:  View [dbo].[Lista_wierzytelnosci]    Script Date: 01/28/2011 12:03:00 ******/
/** Widok prezentuje listê wierzytelnosci jakie ma firma do zci¹gniêcia. 
	Mo¿e byc wykorzystany do prezentacji wierzytelnosci konkretnego klienta
**/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_Lista_wierzytelnosci]
AS
SELECT     dbo.Kontrahent.khNazwa, dbo.Kontrahent.khSkrot, dbo.Kontrahent.khSymbol, dbo.Kontrahent.khNIP, dbo.Kontrahent.khREGON, 
                      dbo.Sprawa.swNumerSprawy, dbo.Wierzytelnosc.wiNumerDokumentu, dbo.Wierzytelnosc.wiDataDokumentu, dbo.Wierzytelnosc.wiKwotaWlasciwa, 
                      dbo.Wierzytelnosc.wiKwotaGlowna, dbo.Wierzytelnosc.wiSaldo
FROM         dbo.Kontrahent INNER JOIN
                      dbo.Sprawa ON dbo.Kontrahent.khPK = dbo.Sprawa.swkhFK INNER JOIN
                      dbo.Wierzytelnosc ON dbo.Sprawa.swPK = dbo.Wierzytelnosc.wiswFK

GO

/**
Widok do prezentacji zadan jakie sa przypisane danemu kontrahentowi 
z po³aczeniem kto je bedzie wykonywa³
**/

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vZadaniaKontrahentUser]'))
DROP VIEW [dbo].[v_ZadaniaKontrahentUser]
GO

CREATE VIEW [dbo].[v_ZadaniaKontrahentUser]
AS
SELECT     dbo.Kontrahent.khNazwa, dbo.Kontrahent.khPK, dbo.Kontrahent.khSkrot, dbo.Kontrahent.khCzyWierzyciel, dbo.Kontrahent.khCzyDluznik, 
                      dbo.Kontrahent.khCzyOsobaFizyczna, dbo.Zadanie.zaDataPlanu, dbo.Zadanie.zaDataPlanuStop, dbo.Zadanie.zaDataRealizacji, 
                      dbo.Zadanie.zaCzyZrealizowane, dbo.Zadanie.zaOpis, dbo.Uzytkownik.urImie, dbo.Uzytkownik.urDrugieImie, dbo.Uzytkownik.urNazwisko, 
                      dbo.Uzytkownik.urDomena, dbo.Uzytkownik.urLogin
FROM         dbo.Kontrahent INNER JOIN
                      dbo.Zadanie ON dbo.Kontrahent.khPK = dbo.Zadanie.zakhFK INNER JOIN
                      dbo.Uzytkownik ON dbo.Zadanie.zaurFK = dbo.Uzytkownik.urPK

GO

/**
Widok prezentujacy dane adresowe kontrahenta
**/

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_DaneAdresoweKontrah]'))
DROP VIEW [dbo].[v_DaneAdresoweKontrah]
GO

CREATE VIEW [dbo].[v_DaneAdresoweKontrah]
AS
SELECT     dbo.Kontrahent.khNazwa AS Nazwa, dbo.Kontrahent.khSkrot AS skrot, dbo.Kontrahent.khSymbol AS Symbol, dbo.Kontrahent.khNIP AS NIP, 
                      dbo.Kontrahent.khREGON AS REGON, dbo.Kontrahent.khKRS AS KRS, dbo.Kontrahent.khDataUrodzenia AS DataUrodzenia, 
                      dbo.Kontrahent.khMiejsceUrodzenia AS MiejsceUrodzenia, dbo.Kontrahent.khPesel AS Pesel, dbo.Kontrahent.khNumerDowodu AS NrDowodu, 
                      dbo.slTypAdresu.taNazwa AS TypAdresu, dbo.slTypAdresu.taCzyGlowny AS [Czy g³owny], dbo.Adres.adMiasto AS Miasto, 
                      dbo.Adres.adKodPocztowy AS Kod, dbo.Adres.adUlica AS ulica, dbo.Adres.adDom AS Dom, dbo.Adres.adLokal AS Lokal, 
                      dbo.Adres.adTelefon AS telefon, dbo.Adres.adKomorka AS telKom, dbo.slWojewodztwo.woNazwa AS Wojewodztwo
FROM         dbo.Adres INNER JOIN
                      dbo.Kontrahent ON dbo.Adres.adkhFK = dbo.Kontrahent.khPK INNER JOIN
                      dbo.slTypAdresu ON dbo.Adres.adslFKTypAdresu = dbo.slTypAdresu.taPK INNER JOIN
                      dbo.slWojewodztwo ON dbo.Adres.adwoFK = dbo.slWojewodztwo.woPK

GO

/**
Widok prezentujacy kontrahentow i sp³aty razem z odsetkami z wykorzystaniem funkcji
 dbo.fn_LiczOdsetki()
**/

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_SplatyZOdsetkami]'))
DROP VIEW [dbo].[v_SplatyZOdsetkami]
GO

CREATE VIEW [dbo].[v_SplatyZOdsetkami]
AS
SELECT     dbo.Kontrahent.khNazwa AS Nazwa, dbo.Kontrahent.khSkrot AS skrot, dbo.Kontrahent.khSymbol AS Symbol, dbo.Kontrahent.khNIP AS nip, 
                      dbo.Kontrahent.khREGON AS Regon, dbo.Platnosc.plData AS [Data Wplaty], dbo.Platnosc.plNrDokumentu AS [nr Dokumentu], 
                      dbo.Platnosc.plKwota AS Kwota, dbo.fn_LiczOdsetki(dbo.Splata.stPK) AS odsetki, dbo.Splata.stKwota AS [Kwota sp³aty], 
                      dbo.Splata.stData AS [data sp³aty], dbo.Wierzytelnosc.wiNumerDokumentu AS [Numer dokumenty wierzytelnosci], 
                      dbo.Wierzytelnosc.wiSaldo AS [saldo wierzytelnosci]
FROM         dbo.Splata INNER JOIN
                      dbo.Platnosc ON dbo.Splata.stplFK = dbo.Platnosc.plPK INNER JOIN
                      dbo.Kontrahent ON dbo.Platnosc.plkhFK = dbo.Kontrahent.khPK INNER JOIN
                      dbo.Wierzytelnosc ON dbo.Splata.stwiFK = dbo.Wierzytelnosc.wiPK

GO

/**
Widok prezentuj¹cy zadania czekaj¹ce na realizacje z przypisanymi pracownikami
Wykorzystujemy warunek i sortowanie
**/

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ZadaniaDoRealizacji]'))
DROP VIEW [dbo].[v_ZadaniaDoRealizacji]
GO

CREATE VIEW [dbo].[v_ZadaniaDoRealizacji]
AS
SELECT     TOP (100) PERCENT dbo.Uzytkownik.urImie AS Imie, dbo.Uzytkownik.urNazwisko AS Nazwisko, dbo.Uzytkownik.urLogin AS Login, 
                      dbo.Zadanie.zaDataPlanu AS [Data planowana], dbo.Zadanie.zaOpis AS [opis Zadania], dbo.Zadanie.zaslFKPriorytet AS priorytet, 
                      dbo.Sprawa.swNumerSprawy AS [Numer Sprawy], dbo.Kontrahent.khNazwa AS [Nazwa Kontrahenta]
FROM         dbo.Zadanie INNER JOIN
                      dbo.Uzytkownik ON dbo.Zadanie.zaurFK = dbo.Uzytkownik.urPK INNER JOIN
                      dbo.Kontrahent ON dbo.Zadanie.zakhFK = dbo.Kontrahent.khPK INNER JOIN
                      dbo.Sprawa ON dbo.Zadanie.zaswFK = dbo.Sprawa.swPK AND dbo.Uzytkownik.urPK = dbo.Sprawa.swurFK AND 
                      dbo.Kontrahent.khPK = dbo.Sprawa.swkhFK
WHERE     (dbo.Zadanie.zaDataPlanu > GETDATE())
ORDER BY priorytet DESC

GO

/**
Widok prezentuj¹cy zadania niezrealizowane i przeterminowane z przypisanymi pracownikami
Wykorzystujemy waruneki i sortowanie
**/

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_ZadaniaPrzeterminowane]'))
DROP VIEW [dbo].[v_ZadaniaPrzeterminowane]
GO

CREATE VIEW [dbo].[v_ZadaniaPrzeterminowane]
AS
SELECT     TOP (100) PERCENT dbo.Uzytkownik.urImie AS Imie, dbo.Uzytkownik.urNazwisko AS Nazwisko, dbo.Uzytkownik.urLogin AS Login, 
                      dbo.Zadanie.zaDataPlanu AS [Data planowana], dbo.Zadanie.zaOpis AS [opis Zadania], dbo.Zadanie.zaslFKPriorytet AS priorytet, 
                      dbo.Sprawa.swNumerSprawy AS [Numer Sprawy], dbo.Kontrahent.khNazwa AS [Nazwa Kontrahenta]
FROM         dbo.Zadanie INNER JOIN
                      dbo.Uzytkownik ON dbo.Zadanie.zaurFK = dbo.Uzytkownik.urPK INNER JOIN
                      dbo.Kontrahent ON dbo.Zadanie.zakhFK = dbo.Kontrahent.khPK INNER JOIN
                      dbo.Sprawa ON dbo.Zadanie.zaswFK = dbo.Sprawa.swPK AND dbo.Uzytkownik.urPK = dbo.Sprawa.swurFK AND 
                      dbo.Kontrahent.khPK = dbo.Sprawa.swkhFK
WHERE     (dbo.Zadanie.zaDataPlanu < GETDATE()) AND (dbo.Zadanie.zaDataRealizacji IS NULL)
ORDER BY priorytet DESC


GO
