 use master
go 
exec sp_configure 'show advanced option', '1'
reconfigure
go
exec sp_configure 'Ole Automation Procedures', '1'
exec sp_configure 'xp_cmdshell', '1'
reconfigure
go 

USE [SPR_Refresh_Utility]
GO

EXEC dbo.usp_copy_tables

EXEC dbo.SP_RestoreLatestUniversalBackup 
		@source_dbname = 'SPR',
		@dest_dbname = 'SPR',
		@path = '\\vpngsqa02\Backup\',
		@with_clause = 	'with move ''SPR_Data'' to ''H:\MSSQL.2\MSSQL.2\MSSQL\Data\SPR_Data.mdf'',
		move ''SPR_Log'' to ''H:\MSSQL.2\MSSQL.2\MSSQL\Data\SPR_Log.ldf'',
	replace'

EXEC dbo.usp_udpate_tables

-- Add by Simon Cheng (8/21/2008)
USE SPR
go

if not exists (select * from dbo.sysusers where name = N'PHSAPNG\STG-HA_Admin')
	CREATE USER [PHSAPNG\STG-HA_Admin] FOR LOGIN [PHSAPNG\STG-HA_Admin];

if not exists (select * from dbo.sysusers where name = N'PHSAPNG\STG-SPR_Admin')
	CREATE USER [PHSAPNG\STG-SPR_Admin] FOR LOGIN [PHSAPNG\STG-SPR_Admin];

if not exists (select * from dbo.sysusers where name = N'PHSAPNG\STG-SPR_User')
	CREATE USER [PHSAPNG\STG-SPR_User] FOR LOGIN [PHSAPNG\STG-SPR_User];

exec sp_addrolemember N'ha_admin', N'PHSAPNG\STG-HA_Admin';
exec sp_addrolemember N'spr_admin', N'PHSAPNG\STG-SPR_Admin';
exec sp_addrolemember N'ha_admin', N'PHSAPNG\STG-SPR_User';
exec sp_addrolemember N'surgeon', N'PHSAPNG\STG-SPR_User';

-- This update added by Aaron by request of Simon Cheng (5/27/2008)
update spr.dbo.spr_bp_rha_file_process_log
set processed_status = 4
       , export_date = getdate()
       , file_location = replace(file_location, '\\s', '\\z')
       , processing_file_location = replace(processing_file_location, '\\s', '\\z')
where processed_status <> 4
    
-- These users require read only, and on refresh need to be readadded.

exec sp_adduser 'PHSAPNG\kmao', 'PHSAPNG\kmao', 'db_datareader'
exec sp_adduser 'PHSAPNG\mlam', 'PHSAPNG\mlam', 'db_datareader'
exec sp_adduser 'PHSAPNG\d-simon', 'PHSAPNG\d-simon', 'db_datareader'
exec sp_adduser 'PHSAPNG\sxcheng', 'PHSAPNG\sxcheng', 'db_datareader'

