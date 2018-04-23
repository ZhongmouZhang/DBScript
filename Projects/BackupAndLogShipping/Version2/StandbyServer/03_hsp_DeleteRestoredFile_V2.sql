  
 
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_DeleteRestoredFile_V2') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_DeleteRestoredFile_V2
GO

CREATE         proc dbo.hsp_DeleteRestoredFile_V2
as
declare myCur cursor for 
	select id, Restore_FileName
	from master.dbo.Restorelog where status = 'Restored'
	
declare @id int, @filename varchar(300), @stt varchar(3000)

open myCur 
fetch next from myCur into @id, @filename
while @@fetch_status=0
begin
	set @stt = 'del "' + @filename + '"'
	--print @stt
	exec master.dbo.xp_cmdshell @stt
	update master.dbo.Restorelog
	set status = 'Deleted'
	where id = @id
	fetch next from myCur into @id, @filename
end
close myCur
deallocate myCur


