delete from master.dbo.BackupLog
where status = 'deleted' and datediff (day, backuptime, getdate()) >= 7