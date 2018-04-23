 
 
  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_BackupControl') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_BackupControl
GO

CREATE         proc dbo.hsp_BackupControl
as
declare @now datetime
Declare @SwitchLogFile int
declare @switchHr int
declare @switchMin int

set @now = getdate()
select @switchHr=convert(int, substring(path,1,2)), @switchMin = convert(int, substring(path, 4,2)) 
from master.dbo.BackupParameter
where dbname = 'LogSwitch_FullBackup'
	
-- Swithc log at specified time every day 
if (datepart(hour,@now)=@switchHr and datepart(minute, @now) between @switchMin and @switchMin+5)
begin
	exec hsp_DeleteFullBackupAndLogBefore
	exec hsp_FullBackupAllDB
end
else
	exec hsp_LogBackup

