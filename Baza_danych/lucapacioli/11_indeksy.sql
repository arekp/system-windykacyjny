USE [lucapacioli]
GO

/****** Object:  Index [idx_adres_kontrahent]    Script Date: 02/05/2011 18:33:07 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Adres]') AND name = N'idx_adres_kontrahent')
DROP INDEX [idx_adres_kontrahent] ON [dbo].[Adres] WITH ( ONLINE = OFF )
GO

USE [lucapacioli]
GO

/****** Object:  Index [idx_adres_kontrahent]    Script Date: 02/05/2011 18:33:08 ******/
CREATE NONCLUSTERED INDEX [idx_adres_kontrahent] ON [dbo].[Adres] 
(
	[adkhFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

/****** Object:  Index [idx_platnosc_kontahent]    Script Date: 02/05/2011 18:34:35 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Platnosc]') AND name = N'idx_platnosc_kontahent')
DROP INDEX [idx_platnosc_kontahent] ON [dbo].[Platnosc] WITH ( ONLINE = OFF )
GO

USE [lucapacioli]
GO

/****** Object:  Index [idx_platnosc_kontahent]    Script Date: 02/05/2011 18:34:35 ******/
CREATE NONCLUSTERED INDEX [idx_platnosc_kontahent] ON [dbo].[Platnosc] 
(
	[plkhFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

/****** Object:  Index [idx_splata_platnosci]    Script Date: 02/05/2011 18:36:38 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Splata]') AND name = N'idx_splata_platnosci')
DROP INDEX [idx_splata_platnosci] ON [dbo].[Splata] WITH ( ONLINE = OFF )
GO

USE [lucapacioli]
GO

/****** Object:  Index [idx_splata_platnosci]    Script Date: 02/05/2011 18:36:38 ******/
CREATE NONCLUSTERED INDEX [idx_splata_platnosci] ON [dbo].[Splata] 
(
	[stplFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
USE [lucapacioli]
GO

/****** Object:  Index [idx_splata_wierzytelnosci]    Script Date: 02/05/2011 18:36:48 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Splata]') AND name = N'idx_splata_wierzytelnosci')
DROP INDEX [idx_splata_wierzytelnosci] ON [dbo].[Splata] WITH ( ONLINE = OFF )
GO

/****** Object:  Index [idx_splata_wierzytelnosci]    Script Date: 02/05/2011 18:36:48 ******/
CREATE NONCLUSTERED INDEX [idx_splata_wierzytelnosci] ON [dbo].[Splata] 
(
	[stwiFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


/****** Object:  Index [idx_dokumenty_splaty]    Script Date: 02/05/2011 18:39:22 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Dokument]') AND name = N'idx_dokumenty_splaty')
DROP INDEX [idx_dokumenty_splaty] ON [dbo].[Dokument] WITH ( ONLINE = OFF )
GO


/****** Object:  Index [idx_dokumenty_splaty]    Script Date: 02/05/2011 18:39:23 ******/
CREATE NONCLUSTERED INDEX [idx_dokumenty_splaty] ON [dbo].[Dokument] 
(
	[dospFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO




/****** Object:  Index [idx_sprawa_uzytkownik]    Script Date: 02/05/2011 18:43:53 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sprawa]') AND name = N'idx_sprawa_uzytkownik')
DROP INDEX [idx_sprawa_uzytkownik] ON [dbo].[Sprawa] WITH ( ONLINE = OFF )
GO



/****** Object:  Index [idx_sprawa_uzytkownik]    Script Date: 02/05/2011 18:43:53 ******/
CREATE NONCLUSTERED INDEX [idx_sprawa_uzytkownik] ON [dbo].[Sprawa] 
(
	[swurFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO



/****** Object:  Index [idx_sprawa_kontrahent]    Script Date: 02/05/2011 18:44:09 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sprawa]') AND name = N'idx_sprawa_kontrahent')
DROP INDEX [idx_sprawa_kontrahent] ON [dbo].[Sprawa] WITH ( ONLINE = OFF )
GO



/****** Object:  Index [idx_sprawa_kontrahent]    Script Date: 02/05/2011 18:44:09 ******/
CREATE NONCLUSTERED INDEX [idx_sprawa_kontrahent] ON [dbo].[Sprawa] 
(
	[swkhFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


/****** Object:  Index [idx_zadanie_kontahent]    Script Date: 02/05/2011 18:45:54 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Zadanie]') AND name = N'idx_zadanie_kontahent')
DROP INDEX [idx_zadanie_kontahent] ON [dbo].[Zadanie] WITH ( ONLINE = OFF )
GO


/****** Object:  Index [idx_zadanie_kontahent]    Script Date: 02/05/2011 18:45:54 ******/
CREATE NONCLUSTERED INDEX [idx_zadanie_kontahent] ON [dbo].[Zadanie] 
(
	[zakhFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


/****** Object:  Index [idx_zadanie_uzytkownik]    Script Date: 02/05/2011 18:46:06 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Zadanie]') AND name = N'idx_zadanie_uzytkownik')
DROP INDEX [idx_zadanie_uzytkownik] ON [dbo].[Zadanie] WITH ( ONLINE = OFF )
GO



/****** Object:  Index [idx_zadanie_uzytkownik]    Script Date: 02/05/2011 18:46:06 ******/
CREATE NONCLUSTERED INDEX [idx_zadanie_uzytkownik] ON [dbo].[Zadanie] 
(
	[zaurFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


/****** Object:  Index [idx_zadanie_sprawa]    Script Date: 02/05/2011 18:46:18 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Zadanie]') AND name = N'idx_zadanie_sprawa')
DROP INDEX [idx_zadanie_sprawa] ON [dbo].[Zadanie] WITH ( ONLINE = OFF )
GO



/****** Object:  Index [idx_zadanie_sprawa]    Script Date: 02/05/2011 18:46:18 ******/
CREATE NONCLUSTERED INDEX [idx_zadanie_sprawa] ON [dbo].[Zadanie] 
(
	[zaswFK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


