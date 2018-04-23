 -- Proxy Account in SQL 2000
 
 USE master 
GO
-- Create a test login called testuser
EXEC sp_addlogin 'testuser', 'testuser'
-- Add a Windows domain account PoweDomain\PowerUser as the proxy account. 
EXECUTE xp_sqlagent_proxy_account N'SET' , N'PowerDomain' , N'PowerUser' , N'P@ssw0rd' 
-- Enable non-sysadmin logins to run Active Scripting job steps and execute xp_cmdshell. 
EXECUTE msdb..sp_set_sqlagent_properties @sysadmin_only = 0 
-- Grant database access to the SQL Server login account that you want to provide access.
EXEC sp_grantdbaccess 'testuser' 
-- Grant execute permission on xp_cmdshell to the SQL Server login account. 
GRANT exec ON xp_cmdshell TO [testuser] 
GO


--------------------------------------------------------------------------------------
------  SQL 2005& 2008 to allow a non-sysadmin login to execute xp_cmdshell
---------------------------------------------------------------------------------------
USE master 
GO
-- Create a test login called testuser
CREATE LOGIN testuser WITH PASSWORD='P3h4jek@x'
-- Create a proxy credential for xp_cmdshell.
EXEC sp_xp_cmdshell_proxy_account 'PowerDomain\PowerUser', 'P@ssw0rd';
-- Grant database access to the SQL Server login account that you want to provide access.
EXEC sp_grantdbaccess 'testuser'
-- Grant execute permission on xp_cmdshell to the SQL Server login account. 
GRANT exec ON sys.xp_cmdshell TO [testuser] 
GO

----------------------------------------------------------------------------------------
------ Create a SSIS proxy
-----------------------------------------------------------------------------------------
-- Create a credential containing the domain account PowerDomain\PowerUser and its password
CREATE CREDENTIAL PowerUser WITH IDENTITY = N'PowerDomain\PowerUser', SECRET = N'P@ssw0rd'
GO
USE [msdb]
GO
-- Create a new proxy called SSISProxy and assign the PowerUser credentail to it
EXEC msdb.dbo.sp_add_proxy @proxy_name=N'SSISProxy',@credential_name=N'PowerUser',@enabled=1
-- Grant SSISProxy access to the "SSIS package execution" subsystem
EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'SSISProxy', @subsystem_id=11
-- Grant the login testUser the permissions to use SSISProxy
EXEC msdb.dbo.sp_grant_login_to_proxy @login_name = N'testUser', @proxy_name=N'SSISProxy'
GO

Value Description 

2    Microsoft ActiveX Script

3    Operating System (CmdExec) 

4    Replication Snapshot Agent

5    Replication Log Reader Agent

6    Replication Distribution Agent

7    Replication Merge Agent

8    Replication Queue Reader Agent

9    Analysis Services Command

10   Analysis Services Query

11   SSIS package execution



SQL Server 2008 adds one more subsystem for the integration of PowerShell.

12   PowerShell Script

