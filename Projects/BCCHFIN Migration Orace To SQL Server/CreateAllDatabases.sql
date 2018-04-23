IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'PROD_CE')
	DROP DATABASE PROD_CE
GO

CREATE DATABASE PROD_CE  
ON (NAME = N'PROD_CE_Data', FILENAME = N'D:\MSSQL\DATA\PROD_CE_Data.MDF' , SIZE = 50, FILEGROWTH = 10%) 
LOG ON (NAME = N'PROD_CE_Log', FILENAME = N'D:\MSSQL\DATA\PROD_CE_Log.LDF' , SIZE = 10, FILEGROWTH = 10%)
COLLATE SQL_Latin1_General_CP1_CI_AS
GO

alter database PROD_CE set   RECOVERY SIMPLE 
go


--- check the tables between Oracle and SQL Server schema

select a.name, b.* 
from ( select name from dbo.sysobjects where xtype = 'U') a 
full join master.dbo.Oracle_tables b on a.name = b.table_name
where b.owner = substring (db_name(),6,20)
order by b.table_name

