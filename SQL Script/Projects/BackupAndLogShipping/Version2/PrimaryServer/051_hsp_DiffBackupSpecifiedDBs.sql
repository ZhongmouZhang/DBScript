     
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_DiffBackupSpecifiedDBs_V2') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_DiffBackupSpecifiedDBs_V2
GO

CREATE         proc dbo.hsp_DiffBackupSpecifiedDBs_V2 
@now datetime
as
declare @dbname varchar(50)
declare myCur_full cursor for 
select dbname 
from master.dbo.BackupParameter 
where backuptype='Differential' 
	and datepart(hour,@now)=convert(int, substring(backuptime,1,2))
	and datepart(minute, @now) between convert(int, substring(backuptime, 4,2)) 
								and convert(int, substring(backuptime, 4,2)+5)

open myCur_full
Fetch next from myCur_full into @dbname
while @@fetch_status = 0
begin
	-- fully backup a database
	exec hsp_DiffBackupADB_V2 @dbname, @now
	
	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full

