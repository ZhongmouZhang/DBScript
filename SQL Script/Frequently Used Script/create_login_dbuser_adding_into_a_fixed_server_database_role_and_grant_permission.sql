
-------------- create a login -------------------------------------------
--     Public server role need to have view any database permission to list all the database on the server

if not exists (select * from sys.server_principals where name = N'PHSABC\jzhang2')
begin
	CREATE LOGIN [PHSABC\jzhang2] FROM WINDOWS;  
end
 


/******************
CREATE LOGIN shcooper   
   WITH PASSWORD = 'Baz1nga' MUST_CHANGE,  
   CREDENTIAL = RestrictedFaculty;  
GO  

********************/

---------------------------create a databse user and add into a fixed database role------------------------------------------------
USE [SM9_FHA]
GO


IF NOT EXISTS (SELECT name 
                FROM [sys].[database_principals]
                WHERE name = N'HEALTHBC\PG2014_SA')
Begin
    CREATE USER [HEALTHBC\PG2014_SA] 
    FOR LOGIN [HEALTHBC\PG2014_SA] WITH DEFAULT_SCHEMA=[dbo]
end
ALTER ROLE [db_datareader] ADD MEMBER [HEALTHBC\PG2014_SA]
GO


IF NOT EXISTS (SELECT name 
                FROM [sys].[database_principals]
                WHERE name = N'VCH\VBROOKS_SA')
Begin
    CREATE USER [VCH\VBROOKS_SA] 
    FOR LOGIN [VCH\VBROOKS_SA] WITH DEFAULT_SCHEMA=[dbo]
end
ALTER ROLE [db_datareader] ADD MEMBER [VCH\VBROOKS_SA]
GO

IF NOT EXISTS (SELECT name 
                FROM [sys].[database_principals]
                WHERE name = N'HEALTHBC\RT2290_SA')
Begin
    CREATE USER [HEALTHBC\RT2290_SA] 
    FOR LOGIN [HEALTHBC\RT2290_SA] WITH DEFAULT_SCHEMA=[dbo]
end
ALTER ROLE [db_datareader] ADD MEMBER [HEALTHBC\RT2290_SA]
GO


-----------------------create a dabase user and grant SQL agent management permission------------------------------------------------------
use msdb
go


IF NOT EXISTS (SELECT name 
                FROM [sys].[database_principals]
                WHERE name = N'HEALTHBC\PG2014_SA')
Begin
    CREATE USER [HEALTHBC\PG2014_SA] 
    FOR LOGIN [HEALTHBC\PG2014_SA] WITH DEFAULT_SCHEMA=[dbo]
end
ALTER ROLE [SQLAgentOperatorRole] ADD MEMBER [HEALTHBC\PG2014_SA]
GO


IF NOT EXISTS (SELECT name 
                FROM [sys].[database_principals]
                WHERE name = N'VCH\VBROOKS_SA')
Begin
    CREATE USER [VCH\VBROOKS_SA] 
    FOR LOGIN [VCH\VBROOKS_SA] WITH DEFAULT_SCHEMA=[dbo]
end
ALTER ROLE [SQLAgentOperatorRole] ADD MEMBER [VCH\VBROOKS_SA]
GO

--------------------add a login into a fixed server role --------------------------------------------------------
EXEC sp_addsrvrolemember 'HEALTHBC\PG2014_SA', 'securityadmin';  
EXEC sp_addsrvrolemember 'VCH\VBROOKS_SA', 'securityadmin';  

GO 





