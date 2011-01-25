-- =============================================
-- zakladamy baze - 1 obiekt
-- =============================================
USE master
GO


IF  EXISTS (SELECT name FROM sys.databases 	WHERE name = N'lucapacioli')
	DROP DATABASE lucapacioli
GO

CREATE DATABASE lucapacioli
	COLLATE Polish_CI_AS
GO