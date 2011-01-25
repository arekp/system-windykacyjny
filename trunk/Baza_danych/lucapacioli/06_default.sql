-- =============================================
-- zakladamy default - 60 obiektów 
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
GO

ALTER TABLE [_NazwyTabel] ADD  CONSTRAINT [DF___NazwyTabel_LoginDodania] DEFAULT (original_login()) FOR [LoginDodania] 
GO
ALTER TABLE [Adres] ADD  CONSTRAINT [DF__Adres_adLoginDodania] DEFAULT (original_login()) FOR [adLoginDodania] 
GO
ALTER TABLE [Dokument] ADD  CONSTRAINT [DF__Dokument_doLoginDodania] DEFAULT (original_login()) FOR [doLoginDodania] 
GO
ALTER TABLE [Etap] ADD  CONSTRAINT [DF__Etap_etLoginDodania] DEFAULT (original_login()) FOR [etLoginDodania] 
GO
ALTER TABLE [Grupa] ADD  CONSTRAINT [DF__Grupa_grLoginDodania] DEFAULT (original_login()) FOR [grLoginDodania] 
GO
ALTER TABLE [HistoriaKontaktow] ADD  CONSTRAINT [DF__HistoriaKontaktow_hiLoginDodania] DEFAULT (original_login()) FOR [hiLoginDodania] 
GO
ALTER TABLE [Kontakt] ADD  CONSTRAINT [DF__Kontakt_koLoginDodania] DEFAULT (original_login()) FOR [koLoginDodania] 
GO
ALTER TABLE [Kontrahent] ADD  CONSTRAINT [DF__Kontrahent_khLoginDodania] DEFAULT (original_login()) FOR [khLoginDodania] 
GO
ALTER TABLE [P_Grupa_Rola] ADD  CONSTRAINT [DF__P_Grupa_Rola_poLoginDodania] DEFAULT (original_login()) FOR [poLoginDodania] 
GO
ALTER TABLE [P_Uzytkownik_Grupa] ADD  CONSTRAINT [DF__P_Uzytkownik_Grupa_poLoginDodania] DEFAULT (original_login()) FOR [poLoginDodania] 
GO
ALTER TABLE [P_Uzytkownik_Rola] ADD  CONSTRAINT [DF__P_Uzytkownik_Rola_poLoginDodania] DEFAULT (original_login()) FOR [poLoginDodania] 
GO
ALTER TABLE [Platnosc] ADD  CONSTRAINT [DF__Platnosc_plLoginDodania] DEFAULT (original_login()) FOR [plLoginDodania] 
GO
ALTER TABLE [Raporty] ADD  CONSTRAINT [DF__Raporty_rpLoginDodania] DEFAULT (original_login()) FOR [rpLoginDodania] 
GO
ALTER TABLE [Rola] ADD  CONSTRAINT [DF__Rola_roLoginDodania] DEFAULT (original_login()) FOR [roLoginDodania] 
GO
ALTER TABLE [Splata] ADD  CONSTRAINT [DF__Splata_stLoginDodania] DEFAULT (original_login()) FOR [stLoginDodania] 
GO
ALTER TABLE [Sprawa] ADD  CONSTRAINT [DF__Sprawa_swLoginDodania] DEFAULT (original_login()) FOR [swLoginDodania] 
GO
ALTER TABLE [Umowa] ADD  CONSTRAINT [DF__Umowa_umLoginDodania] DEFAULT (original_login()) FOR [umLoginDodania] 
GO
ALTER TABLE [Uzytkownik] ADD  CONSTRAINT [DF__Uzytkownik_urLoginDodania] DEFAULT (original_login()) FOR [urLoginDodania] 
GO
ALTER TABLE [Wierzytelnosc] ADD  CONSTRAINT [DF__Wierzytelnosc_wiLoginDodania] DEFAULT (original_login()) FOR [wiLoginDodania] 
GO
ALTER TABLE [Zadanie] ADD  CONSTRAINT [DF__Zadanie_zaLoginDodania] DEFAULT (original_login()) FOR [zaLoginDodania] 
GO
ALTER TABLE [slStawkaStopyProcentowej] ADD  CONSTRAINT [DF__slStawkaStopyProcentowej_ssLogin] DEFAULT (original_login()) FOR [ssLogin] 
GO
ALTER TABLE [slStopaProcentowa] ADD  CONSTRAINT [DF__slStopaProcentowa_spLogin] DEFAULT (original_login()) FOR [spLogin] 
GO
ALTER TABLE [Adres] ADD  CONSTRAINT [DF__Adres_adDataDodania] DEFAULT (getdate()) FOR [adDataDodania] 
GO
ALTER TABLE [Dokument] ADD  CONSTRAINT [DF__Dokument_doDataDodania] DEFAULT (getdate()) FOR [doDataDodania] 
GO
ALTER TABLE [Etap] ADD  CONSTRAINT [DF__Etap_etDataDodania] DEFAULT (getdate()) FOR [etDataDodania] 
GO
ALTER TABLE [Grupa] ADD  CONSTRAINT [DF__Grupa_grDataDodania] DEFAULT (getdate()) FOR [grDataDodania] 
GO
ALTER TABLE [HistoriaKontaktow] ADD  CONSTRAINT [DF__HistoriaKontaktow_hiDataDodania] DEFAULT (getdate()) FOR [hiDataDodania] 
GO
ALTER TABLE [Kontakt] ADD  CONSTRAINT [DF__Kontakt_koDataDodania] DEFAULT (getdate()) FOR [koDataDodania] 
GO
ALTER TABLE [Kontrahent] ADD  CONSTRAINT [DF__Kontrahent_khDataDodania] DEFAULT (getdate()) FOR [khDataDodania] 
GO
ALTER TABLE [P_Grupa_Rola] ADD  CONSTRAINT [DF__P_Grupa_Rola_poDataDodania] DEFAULT (getdate()) FOR [poDataDodania] 
GO
ALTER TABLE [P_Uzytkownik_Grupa] ADD  CONSTRAINT [DF__P_Uzytkownik_Grupa_poDataDodania] DEFAULT (getdate()) FOR [poDataDodania] 
GO
ALTER TABLE [P_Uzytkownik_Rola] ADD  CONSTRAINT [DF__P_Uzytkownik_Rola_poDataDodania] DEFAULT (getdate()) FOR [poDataDodania] 
GO
ALTER TABLE [Platnosc] ADD  CONSTRAINT [DF__Platnosc_plDataDodania] DEFAULT (getdate()) FOR [plDataDodania] 
GO
ALTER TABLE [Raporty] ADD  CONSTRAINT [DF__Raporty_rpDataDodania] DEFAULT (getdate()) FOR [rpDataDodania] 
GO
ALTER TABLE [Rola] ADD  CONSTRAINT [DF__Rola_roDataDodania] DEFAULT (getdate()) FOR [roDataDodania] 
GO
ALTER TABLE [slStopaProcentowa] ADD  CONSTRAINT [DF__slStopaProcentowa_spDataDodania] DEFAULT (getdate()) FOR [spDataDodania] 
GO
ALTER TABLE [Splata] ADD  CONSTRAINT [DF__Splata_stDataDodania] DEFAULT (getdate()) FOR [stDataDodania] 
GO
ALTER TABLE [Sprawa] ADD  CONSTRAINT [DF__Sprawa_swDataDodania] DEFAULT (getdate()) FOR [swDataDodania] 
GO
ALTER TABLE [Umowa] ADD  CONSTRAINT [DF__Umowa_umDataDodania] DEFAULT (getdate()) FOR [umDataDodania] 
GO
ALTER TABLE [Uzytkownik] ADD  CONSTRAINT [DF__Uzytkownik_urDataDodania] DEFAULT (getdate()) FOR [urDataDodania] 
GO
ALTER TABLE [Wierzytelnosc] ADD  CONSTRAINT [DF__Wierzytelnosc_wiDataDodania] DEFAULT (getdate()) FOR [wiDataDodania] 
GO
ALTER TABLE [Zadanie] ADD  CONSTRAINT [DF__Zadanie_zaDataDodania] DEFAULT (getdate()) FOR [zaDataDodania] 
GO


ALTER TABLE [Adres] ADD  CONSTRAINT [DF__Adres_adUsuniety] DEFAULT ((0)) FOR [adUsuniety] 
GO
ALTER TABLE [Dokument] ADD  CONSTRAINT [DF__Dokument_doUsuniety] DEFAULT ((0)) FOR [doUsuniety] 
GO
ALTER TABLE [Etap] ADD  CONSTRAINT [DF__Etap_etUsuniety] DEFAULT ((0)) FOR [etUsuniety] 
GO
ALTER TABLE [Grupa] ADD  CONSTRAINT [DF__Grupa_grUsuniety] DEFAULT ((0)) FOR [grUsuniety] 
GO
ALTER TABLE [HistoriaKontaktow] ADD  CONSTRAINT [DF__HistoriaKontaktow_hiUsuniety] DEFAULT ((0)) FOR [hiUsuniety] 
GO
ALTER TABLE [Kontakt] ADD  CONSTRAINT [DF__Kontakt_koUsuniety] DEFAULT ((0)) FOR [koUsuniety] 
GO
ALTER TABLE [Kontrahent] ADD  CONSTRAINT [DF__Kontrahent_khUsuniety] DEFAULT ((0)) FOR [khUsuniety] 
GO
ALTER TABLE [P_Grupa_Rola] ADD  CONSTRAINT [DF__P_Grupa_Rola_poUsuniety] DEFAULT ((0)) FOR [poUsuniety] 
GO
ALTER TABLE [P_Uzytkownik_Grupa] ADD  CONSTRAINT [DF__P_Uzytkownik_Grupa_poUsuniety] DEFAULT ((0)) FOR [poUsuniety] 
GO
ALTER TABLE [P_Uzytkownik_Rola] ADD  CONSTRAINT [DF__P_Uzytkownik_Rola_poUsuniety] DEFAULT ((0)) FOR [poUsuniety] 
GO
ALTER TABLE [Platnosc] ADD  CONSTRAINT [DF__Platnosc_plUsuniety] DEFAULT ((0)) FOR [plUsuniety] 
GO
ALTER TABLE [Rola] ADD  CONSTRAINT [DF__Rola_roUsuniety] DEFAULT ((0)) FOR [roUsuniety] 
GO
ALTER TABLE [Splata] ADD  CONSTRAINT [DF__Splata_stUsuniety] DEFAULT ((0)) FOR [stUsuniety] 
GO
ALTER TABLE [Sprawa] ADD  CONSTRAINT [DF__Sprawa_swUsuniety] DEFAULT ((0)) FOR [swUsuniety] 
GO
ALTER TABLE [Umowa] ADD  CONSTRAINT [DF__Umowa_umUsuniety] DEFAULT ((0)) FOR [umUsuniety] 
GO
ALTER TABLE [Uzytkownik] ADD  CONSTRAINT [DF__Uzytkownik_urUsuniety] DEFAULT ((0)) FOR [urUsuniety] 
GO
ALTER TABLE [Wierzytelnosc] ADD  CONSTRAINT [DF__Wierzytelnosc_wiUsuniety] DEFAULT ((0)) FOR [wiUsuniety] 
GO
ALTER TABLE [Zadanie] ADD  CONSTRAINT [DF__Zadanie_zaUsuniety] DEFAULT ((0)) FOR [zaUsuniety] 
GO
