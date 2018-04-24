  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_DeleteBackupOneDayOlder_V2') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_DeleteBackupOneDayOlder_V2 
GO

CREATE         proc dbo.hsp_DeleteBackupOneDayOlder_V2 
@dbname varchar(100),
@now datetime

as
declare myCur cursor for 
	select bkl.id, source_filename
	from master.dbo.backuplog bkl 
	where dbname = @dbname
		and status != 'Deleted'
		and id <= (select max(id) from master.dbo.backuplog
					where dbname = @dbname
						and backuptype = 'full'
						and backuptime < dateadd(minute, 5, dateadd(day,-1,@now)))
		
declare @id int, @filename varchar(300), @stt varchar(3000)

open myCur 
fetch next from myCur into @id, @filename
while @@fetch_status=0
begin
	set @stt = 'del "' + @filename + '"'
	--print @stt
	exec master.dbo.xp_cmdshell @stt
	update master.dbo.Backuplog
	set status = 'Deleted'
	where id = @id
	fetch next from myCur into @id, @filename
end
close myCur
deallocate myCur


