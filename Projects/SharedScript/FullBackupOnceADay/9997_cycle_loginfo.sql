 exec msdb.dbo.sp_delete_backuphistory '2011-01-01'
exec msdb.dbo.sp_purge_jobhistory @oldest_date = '2011-01-01'
exec master.dbo.sp_cycle_errorlog
exec msdb.dbo.sp_cycle_agent_errorlog
