   
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_FullBackupSpecifiedDBs_V2') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_FullBackupSpecifiedDBs_V2
GO

CREATE         proc dbo.hsp_FullBackupSpecifiedDBs_V2 
@now datetime
as
declare @dbname varchar(50)
declare myCur_full cursor for 
select dbname 
from master.dbo.BackupParameter 
where backuptype='Full' 
	and dbname !='default'
	and datepart(hour,@now)=convert(int, substring(backuptime,1,2))
	and datepart(minute, @now) between convert(int, substring(backuptime, 4,2)) 
								and convert(int, substring(backuptime, 4,2)+5)

open myCur_full
Fetch next from myCur_full into @dbname
while @@fetch_status = 0
begin
	-- delete the backup one day older
	exec hsp_DeleteBackupOnedayOlder_V2 @dbname, @now
	
	-- fully backup a database
	exec hsp_FullBackupADB_V2 @dbname, @now
	
	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full

