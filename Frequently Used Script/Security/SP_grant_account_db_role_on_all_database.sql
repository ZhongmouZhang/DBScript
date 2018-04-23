use [master]
go


if exists (select * from dbo.sysobjects where id = object_id(N'hsp_grant_account_db_role_on_all_databases') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_grant_account_db_role_on_all_databases
GO


CREATE         proc hsp_grant_account_db_role_on_all_databases
@account nvarchar(500),
@role nvarchar(100)

as

DECLARE @dbname VARCHAR(50)   
DECLARE @statement NVARCHAR(max)

-- set @account = 'PHSABC\jzhang2'
-- set @role = 'db_owner'
DECLARE db_cursor CURSOR 
LOCAL FAST_FORWARD
FOR  
SELECT name
FROM MASTER.dbo.sysdatabases
WHERE name NOT IN ('master','model','msdb','tempdb','distribution')  
OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @dbname  
WHILE @@FETCH_STATUS = 0  
BEGIN  

SELECT @statement = 'use '+@dbname +';'+ 'IF NOT EXISTS (SELECT name 
                FROM [sys].[database_principals]
                WHERE name = N''' + @account +''')
Begin
    CREATE USER [' + @account +'] 
    FOR LOGIN ['+ @account +'] WITH DEFAULT_SCHEMA=[dbo];
end
ALTER ROLE [' + @role + '] ADD MEMBER [' + @account + '];'

-- print @statement
-- print '------------------'
-- print ''
exec sp_executesql @statement

FETCH NEXT FROM db_cursor INTO @dbname  
END  
CLOSE db_cursor  
DEALLOCATE db_cursor 

