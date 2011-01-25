-- =============================================
-- zakladamy default - 103 obiekty --- NIE WIEM CZY TYLE BÊDZIE
/*
 U¿ywane do wprowadzenia domyœlnych wartoœci dla ka¿dej tabeli dotycz¹cych:
 - daty dodania rekordu
 - u¿ytkownika dodaj¹cego rekord
 - daty modyfikacji
 - u¿ytkownika modyfikuj¹cego rekord

*/
/*
WERYFIKCACJA:

select name from sys.default_constraints 
*/
-- =============================================

use lucapacioli
go


/****** Object:  Default [DF__NazwyTabel_DataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [_NazwyTabel] ADD  CONSTRAINT [DF__NazwyTabel_DataDodania]  DEFAULT (getdate()) FOR [DataDodania]
GO
/****** Object:  Default [DF_Adres_adUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Adres] ADD  CONSTRAINT [DF_Adres_adUsuniety]  DEFAULT ((0)) FOR [adUsuniety]
GO
/****** Object:  Default [DF_Adres_adLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Adres] ADD  CONSTRAINT [DF_Adres_adLoginDodania]  DEFAULT (original_login()) FOR [adLoginDodania]
GO
/****** Object:  Default [DF_Adres_adDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Adres] ADD  CONSTRAINT [DF_Adres_adDataDodania]  DEFAULT (getdate()) FOR [adDataDodania]
GO
/****** Object:  Default [DF_Dokument_rpKontrolka]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Dokument] ADD  CONSTRAINT [DF_Dokument_rpKontrolka]  DEFAULT (N'origonal_login()') FOR [doKontrolka]
GO
/****** Object:  Default [DF_Dokument_doUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Dokument] ADD  CONSTRAINT [DF_Dokument_doUsuniety]  DEFAULT ((0)) FOR [doUsuniety]
GO
/****** Object:  Default [DF_Dokument_rpLogin]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Dokument] ADD  CONSTRAINT [DF_Dokument_rpLogin]  DEFAULT (original_login()) FOR [doLoginDodania]
GO
/****** Object:  Default [DF_Dokument_rpDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Dokument] ADD  CONSTRAINT [DF_Dokument_rpDataDodania]  DEFAULT (getdate()) FOR [doDataDodania]
GO
/****** Object:  Default [DF_Etap_etCzyNieaktywny]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Etap] ADD  CONSTRAINT [DF_Etap_etCzyNieaktywny]  DEFAULT ((0)) FOR [etCzyNieaktywny]
GO
/****** Object:  Default [DF_Etap_etUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Etap] ADD  CONSTRAINT [DF_Etap_etUsuniety]  DEFAULT ((0)) FOR [etUsuniety]
GO
/****** Object:  Default [DF_Etap_etLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Etap] ADD  CONSTRAINT [DF_Etap_etLoginDodania]  DEFAULT (original_login()) FOR [etLoginDodania]
GO
/****** Object:  Default [DF_Etap_etDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Etap] ADD  CONSTRAINT [DF_Etap_etDataDodania]  DEFAULT (getdate()) FOR [etDataDodania]
GO
/****** Object:  Default [DF_Grupa_grWidoczna]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Grupa] ADD  CONSTRAINT [DF_Grupa_grWidoczna]  DEFAULT ((1)) FOR [grWidoczna]
GO
/****** Object:  Default [DF_Grupa_grEdytowalna]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Grupa] ADD  CONSTRAINT [DF_Grupa_grEdytowalna]  DEFAULT ((1)) FOR [grEdytowalna]
GO
/****** Object:  Default [DF_Grupa_grUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Grupa] ADD  CONSTRAINT [DF_Grupa_grUsuniety]  DEFAULT ((0)) FOR [grUsuniety]
GO
/****** Object:  Default [DF_Grupa_grLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Grupa] ADD  CONSTRAINT [DF_Grupa_grLoginDodania]  DEFAULT (original_login()) FOR [grLoginDodania]
GO
/****** Object:  Default [DF_Grupa_grDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Grupa] ADD  CONSTRAINT [DF_Grupa_grDataDodania]  DEFAULT (getdate()) FOR [grDataDodania]
GO
/****** Object:  Default [DF_HistoriaKontaktow_hiUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [HistoriaKontaktow] ADD  CONSTRAINT [DF_HistoriaKontaktow_hiUsuniety]  DEFAULT ((0)) FOR [hiUsuniety]
GO
/****** Object:  Default [DF_HistoriaKontaktow_hiLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [HistoriaKontaktow] ADD  CONSTRAINT [DF_HistoriaKontaktow_hiLoginDodania]  DEFAULT (original_login()) FOR [hiLoginDodania]
GO
/****** Object:  Default [DF_HistoriaKontaktow_hiDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [HistoriaKontaktow] ADD  CONSTRAINT [DF_HistoriaKontaktow_hiDataDodania]  DEFAULT (getdate()) FOR [hiDataDodania]
GO
/****** Object:  Default [DF_Kontakt_koUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Kontakt] ADD  CONSTRAINT [DF_Kontakt_koUsuniety]  DEFAULT ((0)) FOR [koUsuniety]
GO
/****** Object:  Default [DF_Kontakt_koLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Kontakt] ADD  CONSTRAINT [DF_Kontakt_koLoginDodania]  DEFAULT (original_login()) FOR [koLoginDodania]
GO
/****** Object:  Default [DF_Kontakt_koDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Kontakt] ADD  CONSTRAINT [DF_Kontakt_koDataDodania]  DEFAULT (getdate()) FOR [koDataDodania]
GO
/****** Object:  Default [DF_Kontrahent_khCzyWierzyciel]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Kontrahent] ADD  CONSTRAINT [DF_Kontrahent_khCzyWierzyciel]  DEFAULT ((0)) FOR [khCzyWierzyciel]
GO
/****** Object:  Default [DF_Kontrahent_khCzyDluznik]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Kontrahent] ADD  CONSTRAINT [DF_Kontrahent_khCzyDluznik]  DEFAULT ((0)) FOR [khCzyDluznik]
GO
/****** Object:  Default [DF_Kontrahent_khCzyOsobaFizyczna]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Kontrahent] ADD  CONSTRAINT [DF_Kontrahent_khCzyOsobaFizyczna]  DEFAULT ((0)) FOR [khCzyOsobaFizyczna]
GO
/****** Object:  Default [DF_Kontrahent_khCzyWlasciciel]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Kontrahent] ADD  CONSTRAINT [DF_Kontrahent_khCzyWlasciciel]  DEFAULT ((0)) FOR [khCzyWlasciciel]
GO
/****** Object:  Default [DF_Kontrahent_khUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Kontrahent] ADD  CONSTRAINT [DF_Kontrahent_khUsuniety]  DEFAULT ((0)) FOR [khUsuniety]
GO
/****** Object:  Default [DF_Kontrahent_khLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Kontrahent] ADD  CONSTRAINT [DF_Kontrahent_khLoginDodania]  DEFAULT (original_login()) FOR [khLoginDodania]
GO
/****** Object:  Default [DF_Kontrahent_khDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Kontrahent] ADD  CONSTRAINT [DF_Kontrahent_khDataDodania]  DEFAULT (getdate()) FOR [khDataDodania]
GO
/****** Object:  Default [DF_Odsetki_odWstawioneRecznie]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Odsetki] ADD  CONSTRAINT [DF_Odsetki_odWstawioneRecznie]  DEFAULT ((0)) FOR [odRecznie]
GO
/****** Object:  Default [DF_Odsetki_odUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Odsetki] ADD  CONSTRAINT [DF_Odsetki_odUsuniety]  DEFAULT ((0)) FOR [odUsuniety]
GO
/****** Object:  Default [DF_Odsetki_odLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Odsetki] ADD  CONSTRAINT [DF_Odsetki_odLoginDodania]  DEFAULT (original_login()) FOR [odLoginDodania]
GO
/****** Object:  Default [DF_Odsetki_odDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Odsetki] ADD  CONSTRAINT [DF_Odsetki_odDataDodania]  DEFAULT (getdate()) FOR [odDataDodania]
GO
/****** Object:  Default [DF_OdsetkiWzor_owCzyTakieSame]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [OdsetkiWzor] ADD  CONSTRAINT [DF_OdsetkiWzor_owCzyTakieSame]  DEFAULT ((0)) FOR [owCzyTakieSame]
GO
/****** Object:  Default [DF_OdsetkiWzor_owWartosc]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [OdsetkiWzor] ADD  CONSTRAINT [DF_OdsetkiWzor_owWartosc]  DEFAULT ((0)) FOR [owWartosc]
GO
/****** Object:  Default [DF_OdsetkiWzor_owKrotnosc]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [OdsetkiWzor] ADD  CONSTRAINT [DF_OdsetkiWzor_owKrotnosc]  DEFAULT ((1)) FOR [owKrotnosc]
GO
/****** Object:  Default [DF_OdsetkiWzor_owMarza]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [OdsetkiWzor] ADD  CONSTRAINT [DF_OdsetkiWzor_owMarza]  DEFAULT ((0)) FOR [owMarza]
GO
/****** Object:  Default [DF_OdsetkiWzor_owDniWRoku]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [OdsetkiWzor] ADD  CONSTRAINT [DF_OdsetkiWzor_owDniWRoku]  DEFAULT ((365)) FOR [owDniWRoku]
GO
/****** Object:  Default [DF_OdsetkiWzor_owKarencja]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [OdsetkiWzor] ADD  CONSTRAINT [DF_OdsetkiWzor_owKarencja]  DEFAULT ((0)) FOR [owKarencja]
GO
/****** Object:  Default [DF_OdsetkiWzor_owUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [OdsetkiWzor] ADD  CONSTRAINT [DF_OdsetkiWzor_owUsuniety]  DEFAULT ((0)) FOR [owUsuniety]
GO
/****** Object:  Default [DF_OdsetkiWzor_owLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [OdsetkiWzor] ADD  CONSTRAINT [DF_OdsetkiWzor_owLoginDodania]  DEFAULT (original_login()) FOR [owLoginDodania]
GO
/****** Object:  Default [DF_OdsetkiWzor_owDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [OdsetkiWzor] ADD  CONSTRAINT [DF_OdsetkiWzor_owDataDodania]  DEFAULT (getdate()) FOR [owDataDodania]
GO
/****** Object:  Default [DF_P_Grupa_Rola_poUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [P_Grupa_Rola] ADD  CONSTRAINT [DF_P_Grupa_Rola_poUsuniety]  DEFAULT ((0)) FOR [poUsuniety]
GO
/****** Object:  Default [DF_P_Grupa_Rola_poLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [P_Grupa_Rola] ADD  CONSTRAINT [DF_P_Grupa_Rola_poLoginDodania]  DEFAULT (original_login()) FOR [poLoginDodania]
GO
/****** Object:  Default [DF_P_Grupa_Rola_poDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [P_Grupa_Rola] ADD  CONSTRAINT [DF_P_Grupa_Rola_poDataDodania]  DEFAULT (getdate()) FOR [poDataDodania]
GO
/****** Object:  Default [DF_P_Uzytkownik_Grupa_poUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [P_Uzytkownik_Grupa] ADD  CONSTRAINT [DF_P_Uzytkownik_Grupa_poUsuniety]  DEFAULT ((0)) FOR [poUsuniety]
GO
/****** Object:  Default [DF_P_Uzytkownik_Grupa_poLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [P_Uzytkownik_Grupa] ADD  CONSTRAINT [DF_P_Uzytkownik_Grupa_poLoginDodania]  DEFAULT (original_login()) FOR [poLoginDodania]
GO
/****** Object:  Default [DF_P_Uzytkownik_Grupa_poDateDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [P_Uzytkownik_Grupa] ADD  CONSTRAINT [DF_P_Uzytkownik_Grupa_poDateDodania]  DEFAULT (getdate()) FOR [poDataDodania]
GO
/****** Object:  Default [DF_PoUzytkownikUprawnienie_poUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [P_Uzytkownik_Rola] ADD  CONSTRAINT [DF_PoUzytkownikUprawnienie_poUsuniety]  DEFAULT ((0)) FOR [poUsuniety]
GO
/****** Object:  Default [DF_PoUzytkownikUprawnienie_poLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [P_Uzytkownik_Rola] ADD  CONSTRAINT [DF_PoUzytkownikUprawnienie_poLoginDodania]  DEFAULT (original_login()) FOR [poLoginDodania]
GO
/****** Object:  Default [DF_PoUzytkownikUprawnienie_poDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [P_Uzytkownik_Rola] ADD  CONSTRAINT [DF_PoUzytkownikUprawnienie_poDataDodania]  DEFAULT (getdate()) FOR [poDataDodania]
GO
/****** Object:  Default [DF_Platnosc_plkhFK]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Platnosc] ADD  CONSTRAINT [DF_Platnosc_plkhFK]  DEFAULT ((0)) FOR [plkhFK]
GO
/****** Object:  Default [DF_Platnosc_plKwota]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Platnosc] ADD  CONSTRAINT [DF_Platnosc_plKwota]  DEFAULT ((0)) FOR [plKwota]
GO
/****** Object:  Default [DF_Platnosc_plSaldo]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Platnosc] ADD  CONSTRAINT [DF_Platnosc_plSaldo]  DEFAULT ((0)) FOR [plSaldo]
GO
/****** Object:  Default [DF_Platnosc_plUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Platnosc] ADD  CONSTRAINT [DF_Platnosc_plUsuniety]  DEFAULT ((0)) FOR [plUsuniety]
GO
/****** Object:  Default [DF_Platnosc_plLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Platnosc] ADD  CONSTRAINT [DF_Platnosc_plLoginDodania]  DEFAULT (original_login()) FOR [plLoginDodania]
GO
/****** Object:  Default [DF_Platnosc_plDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Platnosc] ADD  CONSTRAINT [DF_Platnosc_plDataDodania]  DEFAULT (getdate()) FOR [plDataDodania]
GO
/****** Object:  Default [DF_Raporty_rpLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Raporty] ADD  CONSTRAINT [DF_Raporty_rpLoginDodania]  DEFAULT (original_login()) FOR [rpLoginDodania]
GO
/****** Object:  Default [DF_Raporty_rpDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Raporty] ADD  CONSTRAINT [DF_Raporty_rpDataDodania]  DEFAULT (getdate()) FOR [rpDataDodania]
GO
/****** Object:  Default [DF_Uprawnienie_upWidoczne]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Rola] ADD  CONSTRAINT [DF_Uprawnienie_upWidoczne]  DEFAULT ((1)) FOR [roWidoczne]
GO
/****** Object:  Default [DF_Uprawnienie_upEdytowalne]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Rola] ADD  CONSTRAINT [DF_Uprawnienie_upEdytowalne]  DEFAULT ((1)) FOR [roEdytowalne]
GO
/****** Object:  Default [DF_Rola_roUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Rola] ADD  CONSTRAINT [DF_Rola_roUsuniety]  DEFAULT ((0)) FOR [roUsuniety]
GO
/****** Object:  Default [DF_Rola_roLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Rola] ADD  CONSTRAINT [DF_Rola_roLoginDodania]  DEFAULT (original_login()) FOR [roLoginDodania]
GO
/****** Object:  Default [DF_Rola_roDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Rola] ADD  CONSTRAINT [DF_Rola_roDataDodania]  DEFAULT (getdate()) FOR [roDataDodania]
GO
/****** Object:  Default [DF_Slownik_slOrder]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Slownik] ADD  CONSTRAINT [DF_Slownik_slOrder]  DEFAULT ((0)) FOR [slOrder]
GO
/****** Object:  Default [DF_Slownik_slKultura]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Slownik] ADD  CONSTRAINT [DF_Slownik_slKultura]  DEFAULT (N'pl-PL') FOR [slKultura]
GO
/****** Object:  Default [DF_Slownik_slUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Slownik] ADD  CONSTRAINT [DF_Slownik_slUsuniety]  DEFAULT ((0)) FOR [slUsuniety]
GO
/****** Object:  Default [DF_Splata_stUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Splata] ADD  CONSTRAINT [DF_Splata_stUsuniety]  DEFAULT ((0)) FOR [stUsuniety]
GO
/****** Object:  Default [DF_Splata_stLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Splata] ADD  CONSTRAINT [DF_Splata_stLoginDodania]  DEFAULT (original_login()) FOR [stLoginDodania]
GO
/****** Object:  Default [DF_Splata_stDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Splata] ADD  CONSTRAINT [DF_Splata_stDataDodania]  DEFAULT (getdate()) FOR [stDataDodania]
GO
/****** Object:  Default [DF_Sprawa_swCzyLiczycOdsetki]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Sprawa] ADD  CONSTRAINT [DF_Sprawa_swCzyLiczycOdsetki]  DEFAULT ((1)) FOR [swCzyLiczycOdsetki]
GO
/****** Object:  Default [DF_Sprawa_swUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Sprawa] ADD  CONSTRAINT [DF_Sprawa_swUsuniety]  DEFAULT ((0)) FOR [swUsuniety]
GO
/****** Object:  Default [DF_Sprawa_swLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Sprawa] ADD  CONSTRAINT [DF_Sprawa_swLoginDodania]  DEFAULT (original_login()) FOR [swLoginDodania]
GO
/****** Object:  Default [DF_Sprawa_swDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Sprawa] ADD  CONSTRAINT [DF_Sprawa_swDataDodania]  DEFAULT (getdate()) FOR [swDataDodania]
GO
/****** Object:  Default [DF_StawkaStopyProcentowej_ssUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [StawkaStopy] ADD  CONSTRAINT [DF_StawkaStopyProcentowej_ssUsuniety]  DEFAULT ((0)) FOR [ssUsuniety]
GO
/****** Object:  Default [DF_StawkaStopyProcentowej_ssLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [StawkaStopy] ADD  CONSTRAINT [DF_StawkaStopyProcentowej_ssLoginDodania]  DEFAULT (original_login()) FOR [ssLoginDodania]
GO
/****** Object:  Default [DF_StawkaStopyProcentowej_ssDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [StawkaStopy] ADD  CONSTRAINT [DF_StawkaStopyProcentowej_ssDataDodania]  DEFAULT (getdate()) FOR [ssDataDodania]
GO
/****** Object:  Default [DF_Umowa_umCzyZatwierdzona]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Umowa] ADD  CONSTRAINT [DF_Umowa_umCzyZatwierdzona]  DEFAULT ((0)) FOR [umCzyZatwierdzona]
GO
/****** Object:  Default [DF_Umowa_umUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Umowa] ADD  CONSTRAINT [DF_Umowa_umUsuniety]  DEFAULT ((0)) FOR [umUsuniety]
GO
/****** Object:  Default [DF_Umowa_umLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Umowa] ADD  CONSTRAINT [DF_Umowa_umLoginDodania]  DEFAULT (original_login()) FOR [umLoginDodania]
GO
/****** Object:  Default [DF_Umowa_umDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Umowa] ADD  CONSTRAINT [DF_Umowa_umDataDodania]  DEFAULT (getdate()) FOR [umDataDodania]
GO
/****** Object:  Default [DF_Uzytkownik_urCzyAutentykacjaW]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Uzytkownik] ADD  CONSTRAINT [DF_Uzytkownik_urCzyAutentykacjaW]  DEFAULT ((1)) FOR [urCzyAutentykacjaW]
GO
/****** Object:  Default [DF_Uzytkownik_urPlec]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Uzytkownik] ADD  CONSTRAINT [DF_Uzytkownik_urPlec]  DEFAULT ((1)) FOR [urPlec]
GO
/****** Object:  Default [DF_Uzytkownik_urUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Uzytkownik] ADD  CONSTRAINT [DF_Uzytkownik_urUsuniety]  DEFAULT ((0)) FOR [urUsuniety]
GO
/****** Object:  Default [DF_Uzytkownik_urLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Uzytkownik] ADD  CONSTRAINT [DF_Uzytkownik_urLoginDodania]  DEFAULT (original_login()) FOR [urLoginDodania]
GO
/****** Object:  Default [DF_Uzytkownik_urDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Uzytkownik] ADD  CONSTRAINT [DF_Uzytkownik_urDataDodania]  DEFAULT (getdate()) FOR [urDataDodania]
GO
/****** Object:  Default [DF_Wierzytelnosc_wiCzyLiczycOdsetki]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Wierzytelnosc] ADD  CONSTRAINT [DF_Wierzytelnosc_wiCzyLiczycOdsetki]  DEFAULT ((1)) FOR [wiCzyLiczycOdsetki]
GO
/****** Object:  Default [DF_Wierzytelnosc_wiKwotaWlasciwa]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Wierzytelnosc] ADD  CONSTRAINT [DF_Wierzytelnosc_wiKwotaWlasciwa]  DEFAULT ((0)) FOR [wiKwotaWlasciwa]
GO
/****** Object:  Default [DF_Wierzytelnosc_wiSaldo]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Wierzytelnosc] ADD  CONSTRAINT [DF_Wierzytelnosc_wiSaldo]  DEFAULT ((0)) FOR [wiSaldo]
GO
/****** Object:  Default [DF_Wierzytelnosc_wiUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Wierzytelnosc] ADD  CONSTRAINT [DF_Wierzytelnosc_wiUsuniety]  DEFAULT ((0)) FOR [wiUsuniety]
GO
/****** Object:  Default [DF_Wierzytelnosc_wiLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Wierzytelnosc] ADD  CONSTRAINT [DF_Wierzytelnosc_wiLoginDodania]  DEFAULT (original_login()) FOR [wiLoginDodania]
GO
/****** Object:  Default [DF_Wierzytelnosc_wiDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Wierzytelnosc] ADD  CONSTRAINT [DF_Wierzytelnosc_wiDataDodania]  DEFAULT (getdate()) FOR [wiDataDodania]
GO
/****** Object:  Default [DF_Zadanie_zaCzyZrealizowane]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Zadanie] ADD  CONSTRAINT [DF_Zadanie_zaCzyZrealizowane]  DEFAULT ((0)) FOR [zaCzyZrealizowane]
GO
/****** Object:  Default [DF_Zadanie_zaCzyZablokowane]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Zadanie] ADD  CONSTRAINT [DF_Zadanie_zaCzyZablokowane]  DEFAULT ((0)) FOR [zaCzyZablokowane]
GO
/****** Object:  Default [DF_Zadanie_zaUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Zadanie] ADD  CONSTRAINT [DF_Zadanie_zaUsuniety]  DEFAULT ((0)) FOR [zaUsuniety]
GO
/****** Object:  Default [DF_Zadanie_zaLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Zadanie] ADD  CONSTRAINT [DF_Zadanie_zaLoginDodania]  DEFAULT (original_login()) FOR [zaLoginDodania]
GO
/****** Object:  Default [DF_Zadanie_zaDataDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [Zadanie] ADD  CONSTRAINT [DF_Zadanie_zaDataDodania]  DEFAULT (getdate()) FOR [zaDataDodania]
GO
/****** Object:  Default [DF_StopaProcentowa_spKrotnosc]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [ZZZ_StopaProcentowa] ADD  CONSTRAINT [DF_StopaProcentowa_spKrotnosc]  DEFAULT ((1)) FOR [spKrotnosc]
GO
/****** Object:  Default [DF_StopaProcentowa_spKrotnoscRzeczywista]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [ZZZ_StopaProcentowa] ADD  CONSTRAINT [DF_StopaProcentowa_spKrotnoscRzeczywista]  DEFAULT ((1)) FOR [spKrotnoscRzeczywista]
GO
/****** Object:  Default [DF_StopaProcentowa_spUsuniety]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [ZZZ_StopaProcentowa] ADD  CONSTRAINT [DF_StopaProcentowa_spUsuniety]  DEFAULT ((0)) FOR [spUsuniety]
GO
/****** Object:  Default [DF_StopaProcentowa_spLoginDodania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [ZZZ_StopaProcentowa] ADD  CONSTRAINT [DF_StopaProcentowa_spLoginDodania]  DEFAULT (original_login()) FOR [spLoginDodania]
GO
/****** Object:  Default [DF_StopaProcentowa_spDataDadania]    Script Date: 01/07/2011 00:20:06 ******/
ALTER TABLE [ZZZ_StopaProcentowa] ADD  CONSTRAINT [DF_StopaProcentowa_spDataDadania]  DEFAULT (getdate()) FOR [spDataDadania]
GO