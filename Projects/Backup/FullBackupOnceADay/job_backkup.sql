 exec sp_configure 'show advanced option', '1'
reconfigure
go
exec sp_configure 'Ole Automation Procedures', '1'
exec sp_configure 'xp_cmdshell', '1'
reconfigure
go 

exec master.dbo.hsp_LogSwitchAndLogBackup
go

use master
exec sp_configure 'Ole Automation Procedures', '0'
exec sp_configure 'xp_cmdshell', '0'
reconfigure