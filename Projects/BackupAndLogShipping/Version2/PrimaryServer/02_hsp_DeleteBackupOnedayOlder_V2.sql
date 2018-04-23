   if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_DeleteBackupOneDayOlder_V2') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_DeleteBackupOneDayOlder_V2 
GO

CREATE         proc dbo.hsp_DeleteBackupOneDayOlder_V2 
@dbname varchar(100),
@now datetime

as
declare myCur cursor for 
	select bkl.id, source_filename, dest_filename
	from master.dbo.BackupLog bkl 
	where dbname = @dbname
		and status != 'Deleted'
		and id <= (select max(id) from master.dbo.BackupLog
					where dbname = @dbname
						and backuptype = 'full'
						and backuptime < dateadd(minute, 5, dateadd(day,-1,@now)))
		
declare @id int, @filename varchar(300), @dest varchar(300), @stt varchar(3000)

open myCur 
fetch next from myCur into @id, @filename, @dest
while @@fetch_status=0
begin
	set @stt = 'del "' + @filename + '"'
	print @stt
	exec master.dbo.xp_cmdshell @stt
	
	-- 
	-- delete remote copies used by PeopleSoft backup
	--
	if (@dest is not null)
	begin 
		set @stt = 'del "' + @dest + '"'
		print @stt
		exec master.dbo.xp_cmdshell @stt
	end

	update master.dbo.Backuplog
	set status = 'Deleted'
	where id = @id
	fetch next from myCur into @id, @filename, @dest
end
close myCur
deallocate myCur


