  
 
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_BackupControl_V2') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_BackupControl_V2
GO

CREATE          proc [dbo].[hsp_BackupControl_V2]
as
declare @now datetime
Declare @SwitchLogFile int
declare @switchHr int
declare @switchMin int

set @now = getdate()

-- Is it default full backup time
if (exists 
		(select * from master.dbo.BackupParameter 
		where backuptype='Full' 
			and dbname = 'default'
			and datepart(hour,@now)=convert(int, substring(backuptime,1,2))
			and datepart(minute, @now) between convert(int, substring(backuptime, 4,2)) 
												and convert(int, substring(backuptime, 4,2)+5)))
begin
	exec hsp_FullBackupAllDBs_V2 @now -- it is time to fully backup all the databases
	--print 'exec hsp_FullBackupAllDB_V2'
end
else 
begin
		exec hsp_FullBackupSpecifiedDBs_V2 @now -- it is time to fully backup the specified databases
		print 'exec hsp_FullBackupSpecifiedDBs_V2'
		exec hsp_LogBackupSpecifiedDBs_V2 @now
		print 'exec hsp_LogBackupSpecifiedDBs_V2'
end

