-- =============================================
-- zakladamy FK - 34 obiektów 

/*
WERYFIKCACJA:

SELECT TABLE_NAME, CONSTRAINT_NAME
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
  WHERE CONSTRAINT_TYPE = 'FOREIGN KEY' 
  */
-- =============================================

use lucapacioli
go

/****** Object:  ForeignKey [FK_Adres_Kontakt]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Adres_Kontakt]') AND parent_object_id = OBJECT_ID(N'[dbo].[Adres]'))
ALTER TABLE [dbo].[Adres]  WITH CHECK ADD  CONSTRAINT [FK_Adres_Kontakt] FOREIGN KEY([adkoFK])
REFERENCES [dbo].[Kontakt] ([koPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Adres_Kontakt]') AND parent_object_id = OBJECT_ID(N'[dbo].[Adres]'))
ALTER TABLE [dbo].[Adres] CHECK CONSTRAINT [FK_Adres_Kontakt]
GO
/****** Object:  ForeignKey [FK_Adres_Kontrahent]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Adres_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Adres]'))
ALTER TABLE [dbo].[Adres]  WITH CHECK ADD  CONSTRAINT [FK_Adres_Kontrahent] FOREIGN KEY([adkhFK])
REFERENCES [dbo].[Kontrahent] ([khPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Adres_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Adres]'))
ALTER TABLE [dbo].[Adres] CHECK CONSTRAINT [FK_Adres_Kontrahent]
GO
/****** Object:  ForeignKey [FK_Adres_slTypAdresu]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Adres_slTypAdresu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Adres]'))
ALTER TABLE [dbo].[Adres]  WITH CHECK ADD  CONSTRAINT [FK_Adres_slTypAdresu] FOREIGN KEY([adslFKTypAdresu])
REFERENCES [dbo].[slTypAdresu] ([taPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Adres_slTypAdresu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Adres]'))
ALTER TABLE [dbo].[Adres] CHECK CONSTRAINT [FK_Adres_slTypAdresu]
GO
/****** Object:  ForeignKey [FK_Adres_slWojewodztwo]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Adres_slWojewodztwo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Adres]'))
ALTER TABLE [dbo].[Adres]  WITH CHECK ADD  CONSTRAINT [FK_Adres_slWojewodztwo] FOREIGN KEY([adwoFK])
REFERENCES [dbo].[slWojewodztwo] ([woPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Adres_slWojewodztwo]') AND parent_object_id = OBJECT_ID(N'[dbo].[Adres]'))
ALTER TABLE [dbo].[Adres] CHECK CONSTRAINT [FK_Adres_slWojewodztwo]
GO
/****** Object:  ForeignKey [FK_Dokument_Sprawa]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dokument_Sprawa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dokument]'))
ALTER TABLE [dbo].[Dokument]  WITH CHECK ADD  CONSTRAINT [FK_Dokument_Sprawa] FOREIGN KEY([dospFK])
REFERENCES [dbo].[Sprawa] ([swPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Dokument_Sprawa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Dokument]'))
ALTER TABLE [dbo].[Dokument] CHECK CONSTRAINT [FK_Dokument_Sprawa]
GO
/****** Object:  ForeignKey [FK_Etap_slEtapSprawy]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Etap_slEtapSprawy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Etap]'))
ALTER TABLE [dbo].[Etap]  WITH CHECK ADD  CONSTRAINT [FK_Etap_slEtapSprawy] FOREIGN KEY([etslESFK])
REFERENCES [dbo].[slEtapSprawy] ([esPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Etap_slEtapSprawy]') AND parent_object_id = OBJECT_ID(N'[dbo].[Etap]'))
ALTER TABLE [dbo].[Etap] CHECK CONSTRAINT [FK_Etap_slEtapSprawy]
GO
/****** Object:  ForeignKey [FK_Etap_Sprawa]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Etap_Sprawa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Etap]'))
ALTER TABLE [dbo].[Etap]  WITH CHECK ADD  CONSTRAINT [FK_Etap_Sprawa] FOREIGN KEY([etswFK])
REFERENCES [dbo].[Sprawa] ([swPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Etap_Sprawa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Etap]'))
ALTER TABLE [dbo].[Etap] CHECK CONSTRAINT [FK_Etap_Sprawa]
GO
/****** Object:  ForeignKey [FK_HistoriaKontaktow_Kontrahent]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoriaKontaktow_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoriaKontaktow]'))
ALTER TABLE [dbo].[HistoriaKontaktow]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaKontaktow_Kontrahent] FOREIGN KEY([hikhFK])
REFERENCES [dbo].[Kontrahent] ([khPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoriaKontaktow_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoriaKontaktow]'))
ALTER TABLE [dbo].[HistoriaKontaktow] CHECK CONSTRAINT [FK_HistoriaKontaktow_Kontrahent]
GO
/****** Object:  ForeignKey [FK_HistoriaKontaktow_slTypKontaktu]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoriaKontaktow_slTypKontaktu]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoriaKontaktow]'))
ALTER TABLE [dbo].[HistoriaKontaktow]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaKontaktow_slTypKontaktu] FOREIGN KEY([hitkFK])
REFERENCES [dbo].[slTypKontaktu] ([tkPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoriaKontaktow_slTypKontaktu]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoriaKontaktow]'))
ALTER TABLE [dbo].[HistoriaKontaktow] CHECK CONSTRAINT [FK_HistoriaKontaktow_slTypKontaktu]
GO
/****** Object:  ForeignKey [FK_HistoriaKontaktow_Sprawa]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoriaKontaktow_Sprawa]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoriaKontaktow]'))
ALTER TABLE [dbo].[HistoriaKontaktow]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaKontaktow_Sprawa] FOREIGN KEY([hiswFK])
REFERENCES [dbo].[Sprawa] ([swPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoriaKontaktow_Sprawa]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoriaKontaktow]'))
ALTER TABLE [dbo].[HistoriaKontaktow] CHECK CONSTRAINT [FK_HistoriaKontaktow_Sprawa]
GO
/****** Object:  ForeignKey [FK_HistoriaKontaktow_Uzytkownik]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoriaKontaktow_Uzytkownik]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoriaKontaktow]'))
ALTER TABLE [dbo].[HistoriaKontaktow]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaKontaktow_Uzytkownik] FOREIGN KEY([hiurFK])
REFERENCES [dbo].[Uzytkownik] ([urPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoriaKontaktow_Uzytkownik]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoriaKontaktow]'))
ALTER TABLE [dbo].[HistoriaKontaktow] CHECK CONSTRAINT [FK_HistoriaKontaktow_Uzytkownik]
GO
/****** Object:  ForeignKey [FK_HistoriaKontaktow_Zadanie]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoriaKontaktow_Zadanie]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoriaKontaktow]'))
ALTER TABLE [dbo].[HistoriaKontaktow]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaKontaktow_Zadanie] FOREIGN KEY([hizaFK])
REFERENCES [dbo].[Zadanie] ([zaPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoriaKontaktow_Zadanie]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistoriaKontaktow]'))
ALTER TABLE [dbo].[HistoriaKontaktow] CHECK CONSTRAINT [FK_HistoriaKontaktow_Zadanie]
GO
/****** Object:  ForeignKey [FK_Kontakt_Kontrahent]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Kontakt_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Kontakt]'))
ALTER TABLE [dbo].[Kontakt]  WITH CHECK ADD  CONSTRAINT [FK_Kontakt_Kontrahent] FOREIGN KEY([kokhFK])
REFERENCES [dbo].[Kontrahent] ([khPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Kontakt_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Kontakt]'))
ALTER TABLE [dbo].[Kontakt] CHECK CONSTRAINT [FK_Kontakt_Kontrahent]
GO
/****** Object:  ForeignKey [FK_Kontakt_slStanowisko]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Kontakt_slStanowisko]') AND parent_object_id = OBJECT_ID(N'[dbo].[Kontakt]'))
ALTER TABLE [dbo].[Kontakt]  WITH CHECK ADD  CONSTRAINT [FK_Kontakt_slStanowisko] FOREIGN KEY([kokhFK])
REFERENCES [dbo].[slStanowisko] ([soPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Kontakt_slStanowisko]') AND parent_object_id = OBJECT_ID(N'[dbo].[Kontakt]'))
ALTER TABLE [dbo].[Kontakt] CHECK CONSTRAINT [FK_Kontakt_slStanowisko]
GO
/****** Object:  ForeignKey [FK_P_Uzytkownik_Grupa_Grupa]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_P_Uzytkownik_Grupa_Grupa]') AND parent_object_id = OBJECT_ID(N'[dbo].[P_Uzytkownik_Grupa]'))
ALTER TABLE [dbo].[P_Uzytkownik_Grupa]  WITH CHECK ADD  CONSTRAINT [FK_P_Uzytkownik_Grupa_Grupa] FOREIGN KEY([pogrFK])
REFERENCES [dbo].[Grupa] ([grPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_P_Uzytkownik_Grupa_Grupa]') AND parent_object_id = OBJECT_ID(N'[dbo].[P_Uzytkownik_Grupa]'))
ALTER TABLE [dbo].[P_Uzytkownik_Grupa] CHECK CONSTRAINT [FK_P_Uzytkownik_Grupa_Grupa]
GO
/****** Object:  ForeignKey [FK_P_Uzytkownik_Grupa_Uzytkownik]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_P_Uzytkownik_Grupa_Uzytkownik]') AND parent_object_id = OBJECT_ID(N'[dbo].[P_Uzytkownik_Grupa]'))
ALTER TABLE [dbo].[P_Uzytkownik_Grupa]  WITH CHECK ADD  CONSTRAINT [FK_P_Uzytkownik_Grupa_Uzytkownik] FOREIGN KEY([pourFK])
REFERENCES [dbo].[Uzytkownik] ([urPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_P_Uzytkownik_Grupa_Uzytkownik]') AND parent_object_id = OBJECT_ID(N'[dbo].[P_Uzytkownik_Grupa]'))
ALTER TABLE [dbo].[P_Uzytkownik_Grupa] CHECK CONSTRAINT [FK_P_Uzytkownik_Grupa_Uzytkownik]
GO
/****** Object:  ForeignKey [FK_P_Uzytkownik_Rola_Rola]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_P_Uzytkownik_Rola_Rola]') AND parent_object_id = OBJECT_ID(N'[dbo].[P_Uzytkownik_Rola]'))
ALTER TABLE [dbo].[P_Uzytkownik_Rola]  WITH CHECK ADD  CONSTRAINT [FK_P_Uzytkownik_Rola_Rola] FOREIGN KEY([poroFK])
REFERENCES [dbo].[Rola] ([roPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_P_Uzytkownik_Rola_Rola]') AND parent_object_id = OBJECT_ID(N'[dbo].[P_Uzytkownik_Rola]'))
ALTER TABLE [dbo].[P_Uzytkownik_Rola] CHECK CONSTRAINT [FK_P_Uzytkownik_Rola_Rola]
GO
/****** Object:  ForeignKey [FK_P_Uzytkownik_Rola_Uzytkownik]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_P_Uzytkownik_Rola_Uzytkownik]') AND parent_object_id = OBJECT_ID(N'[dbo].[P_Uzytkownik_Rola]'))
ALTER TABLE [dbo].[P_Uzytkownik_Rola]  WITH CHECK ADD  CONSTRAINT [FK_P_Uzytkownik_Rola_Uzytkownik] FOREIGN KEY([pourFK])
REFERENCES [dbo].[Uzytkownik] ([urPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_P_Uzytkownik_Rola_Uzytkownik]') AND parent_object_id = OBJECT_ID(N'[dbo].[P_Uzytkownik_Rola]'))
ALTER TABLE [dbo].[P_Uzytkownik_Rola] CHECK CONSTRAINT [FK_P_Uzytkownik_Rola_Uzytkownik]
GO
/****** Object:  ForeignKey [FK_Platnosc_Kontrahent]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Platnosc_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Platnosc]'))
ALTER TABLE [dbo].[Platnosc]  WITH CHECK ADD  CONSTRAINT [FK_Platnosc_Kontrahent] FOREIGN KEY([plkhFK])
REFERENCES [dbo].[Kontrahent] ([khPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Platnosc_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Platnosc]'))
ALTER TABLE [dbo].[Platnosc] CHECK CONSTRAINT [FK_Platnosc_Kontrahent]
GO
/****** Object:  ForeignKey [FK_slStawkaStopyProcentowej_slStopaProcentowa]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_slStawkaStopyProcentowej_slStopaProcentowa]') AND parent_object_id = OBJECT_ID(N'[dbo].[slStawkaStopyProcentowej]'))
ALTER TABLE [dbo].[slStawkaStopyProcentowej]  WITH CHECK ADD  CONSTRAINT [FK_slStawkaStopyProcentowej_slStopaProcentowa] FOREIGN KEY([ssspFK])
REFERENCES [dbo].[slStopaProcentowa] ([spPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_slStawkaStopyProcentowej_slStopaProcentowa]') AND parent_object_id = OBJECT_ID(N'[dbo].[slStawkaStopyProcentowej]'))
ALTER TABLE [dbo].[slStawkaStopyProcentowej] CHECK CONSTRAINT [FK_slStawkaStopyProcentowej_slStopaProcentowa]
GO
/****** Object:  ForeignKey [FK_Splata_Platnosc]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Splata_Platnosc]') AND parent_object_id = OBJECT_ID(N'[dbo].[Splata]'))
ALTER TABLE [dbo].[Splata]  WITH CHECK ADD  CONSTRAINT [FK_Splata_Platnosc] FOREIGN KEY([stplFK])
REFERENCES [dbo].[Platnosc] ([plPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Splata_Platnosc]') AND parent_object_id = OBJECT_ID(N'[dbo].[Splata]'))
ALTER TABLE [dbo].[Splata] CHECK CONSTRAINT [FK_Splata_Platnosc]
GO
/****** Object:  ForeignKey [FK_Splata_Wierzytelnosc]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Splata_Wierzytelnosc]') AND parent_object_id = OBJECT_ID(N'[dbo].[Splata]'))
ALTER TABLE [dbo].[Splata]  WITH CHECK ADD  CONSTRAINT [FK_Splata_Wierzytelnosc] FOREIGN KEY([stwiFK])
REFERENCES [dbo].[Wierzytelnosc] ([wiPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Splata_Wierzytelnosc]') AND parent_object_id = OBJECT_ID(N'[dbo].[Splata]'))
ALTER TABLE [dbo].[Splata] CHECK CONSTRAINT [FK_Splata_Wierzytelnosc]
GO
/****** Object:  ForeignKey [FK_Sprawa_Kontrahent]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sprawa_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sprawa]'))
ALTER TABLE [dbo].[Sprawa]  WITH CHECK ADD  CONSTRAINT [FK_Sprawa_Kontrahent] FOREIGN KEY([swkhFK])
REFERENCES [dbo].[Kontrahent] ([khPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sprawa_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sprawa]'))
ALTER TABLE [dbo].[Sprawa] CHECK CONSTRAINT [FK_Sprawa_Kontrahent]
GO
/****** Object:  ForeignKey [FK_Sprawa_Umowa]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sprawa_Umowa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sprawa]'))
ALTER TABLE [dbo].[Sprawa]  WITH CHECK ADD  CONSTRAINT [FK_Sprawa_Umowa] FOREIGN KEY([swumFK])
REFERENCES [dbo].[Umowa] ([umPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sprawa_Umowa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sprawa]'))
ALTER TABLE [dbo].[Sprawa] CHECK CONSTRAINT [FK_Sprawa_Umowa]
GO
/****** Object:  ForeignKey [FK_Sprawa_Uzytkownik]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sprawa_Uzytkownik]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sprawa]'))
ALTER TABLE [dbo].[Sprawa]  WITH CHECK ADD  CONSTRAINT [FK_Sprawa_Uzytkownik] FOREIGN KEY([swurFK])
REFERENCES [dbo].[Uzytkownik] ([urPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sprawa_Uzytkownik]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sprawa]'))
ALTER TABLE [dbo].[Sprawa] CHECK CONSTRAINT [FK_Sprawa_Uzytkownik]
GO
/****** Object:  ForeignKey [FK_Umowa_Kontrahent]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Umowa_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Umowa]'))
ALTER TABLE [dbo].[Umowa]  WITH CHECK ADD  CONSTRAINT [FK_Umowa_Kontrahent] FOREIGN KEY([umkhFK])
REFERENCES [dbo].[Kontrahent] ([khPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Umowa_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Umowa]'))
ALTER TABLE [dbo].[Umowa] CHECK CONSTRAINT [FK_Umowa_Kontrahent]
GO
/****** Object:  ForeignKey [FK_Umowa_Uzytkownik]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Umowa_Uzytkownik]') AND parent_object_id = OBJECT_ID(N'[dbo].[Umowa]'))
ALTER TABLE [dbo].[Umowa]  WITH CHECK ADD  CONSTRAINT [FK_Umowa_Uzytkownik] FOREIGN KEY([umurFK])
REFERENCES [dbo].[Uzytkownik] ([urPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Umowa_Uzytkownik]') AND parent_object_id = OBJECT_ID(N'[dbo].[Umowa]'))
ALTER TABLE [dbo].[Umowa] CHECK CONSTRAINT [FK_Umowa_Uzytkownik]
GO
/****** Object:  ForeignKey [FK_Wierzytelnosc_slStopaProcentowa]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Wierzytelnosc_slStopaProcentowa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Wierzytelnosc]'))
ALTER TABLE [dbo].[Wierzytelnosc]  WITH CHECK ADD  CONSTRAINT [FK_Wierzytelnosc_slStopaProcentowa] FOREIGN KEY([wislSPFK])
REFERENCES [dbo].[slStopaProcentowa] ([spPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Wierzytelnosc_slStopaProcentowa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Wierzytelnosc]'))
ALTER TABLE [dbo].[Wierzytelnosc] CHECK CONSTRAINT [FK_Wierzytelnosc_slStopaProcentowa]
GO
/****** Object:  ForeignKey [FK_Wierzytelnosc_slTypDokumentu]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Wierzytelnosc_slTypDokumentu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Wierzytelnosc]'))
ALTER TABLE [dbo].[Wierzytelnosc]  WITH CHECK ADD  CONSTRAINT [FK_Wierzytelnosc_slTypDokumentu] FOREIGN KEY([wislTDFK])
REFERENCES [dbo].[slTypDokumentu] ([tdPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Wierzytelnosc_slTypDokumentu]') AND parent_object_id = OBJECT_ID(N'[dbo].[Wierzytelnosc]'))
ALTER TABLE [dbo].[Wierzytelnosc] CHECK CONSTRAINT [FK_Wierzytelnosc_slTypDokumentu]
GO
/****** Object:  ForeignKey [FK_Wierzytelnosc_Sprawa]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Wierzytelnosc_Sprawa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Wierzytelnosc]'))
ALTER TABLE [dbo].[Wierzytelnosc]  WITH CHECK ADD  CONSTRAINT [FK_Wierzytelnosc_Sprawa] FOREIGN KEY([wiswFK])
REFERENCES [dbo].[Sprawa] ([swPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Wierzytelnosc_Sprawa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Wierzytelnosc]'))
ALTER TABLE [dbo].[Wierzytelnosc] CHECK CONSTRAINT [FK_Wierzytelnosc_Sprawa]
GO
/****** Object:  ForeignKey [FK_Zadanie_Etap]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Zadanie_Etap]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zadanie]'))
ALTER TABLE [dbo].[Zadanie]  WITH CHECK ADD  CONSTRAINT [FK_Zadanie_Etap] FOREIGN KEY([zaetFK])
REFERENCES [dbo].[Etap] ([etPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Zadanie_Etap]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zadanie]'))
ALTER TABLE [dbo].[Zadanie] CHECK CONSTRAINT [FK_Zadanie_Etap]
GO
/****** Object:  ForeignKey [FK_Zadanie_Kontrahent]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Zadanie_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zadanie]'))
ALTER TABLE [dbo].[Zadanie]  WITH CHECK ADD  CONSTRAINT [FK_Zadanie_Kontrahent] FOREIGN KEY([zakhFK])
REFERENCES [dbo].[Kontrahent] ([khPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Zadanie_Kontrahent]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zadanie]'))
ALTER TABLE [dbo].[Zadanie] CHECK CONSTRAINT [FK_Zadanie_Kontrahent]
GO
/****** Object:  ForeignKey [FK_Zadanie_Sprawa]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Zadanie_Sprawa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zadanie]'))
ALTER TABLE [dbo].[Zadanie]  WITH CHECK ADD  CONSTRAINT [FK_Zadanie_Sprawa] FOREIGN KEY([zaswFK])
REFERENCES [dbo].[Sprawa] ([swPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Zadanie_Sprawa]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zadanie]'))
ALTER TABLE [dbo].[Zadanie] CHECK CONSTRAINT [FK_Zadanie_Sprawa]
GO
/****** Object:  ForeignKey [FK_Zadanie_Uzytkownik]    Script Date: 01/07/2011 20:45:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Zadanie_Uzytkownik]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zadanie]'))
ALTER TABLE [dbo].[Zadanie]  WITH CHECK ADD  CONSTRAINT [FK_Zadanie_Uzytkownik] FOREIGN KEY([zaurFK])
REFERENCES [dbo].[Uzytkownik] ([urPK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Zadanie_Uzytkownik]') AND parent_object_id = OBJECT_ID(N'[dbo].[Zadanie]'))
ALTER TABLE [dbo].[Zadanie] CHECK CONSTRAINT [FK_Zadanie_Uzytkownik]
GO
