 use master
exec sp_configure 'show advanced option', '1'
reconfigure
go
exec sp_configure 'Ole Automation Procedures', '1'
exec sp_configure 'xp_cmdshell', '1'
reconfigure
go 


exec SP_RestoreLatestUniversalBackup 
		@source_dbname = 'SPR',
		@dest_dbname = 'SPR',
		@path = '\\vpngsqa02\backup$\',
		@with_clause = 	'with move ''SPR_Data'' to ''D:\MSSQL.1\MSSQL\Data\SPR_Data.mdf'',
		move ''SPR_Log'' to ''D:\MSSQL.1\MSSQL\Data\SPR_Log.ldf'',
	replace'
go

-- Setting the restored database property
use SPR
exec sp_changedbowner 'crn'
alter database SPR set  RECOVERY SIMPLE 
exec sp_dboption 'SPR','autoshrink','TRUE'
go

-- run the script to create indexes
exec master.dbo.xp_cmdshell 'oSQL -E -d SPR /i "C:\Bin\CreateIndexAndUpdateAColumn.sql" > c:\bin\out.log' 
go

use master
exec sp_configure 'Ole Automation Procedures', '0'
exec sp_configure 'xp_cmdshell', '0'
reconfigure
go
