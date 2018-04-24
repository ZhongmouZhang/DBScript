 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_DeleteFullBackupAndLogBefore') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_DeleteFullBackupAndLogBefore
GO

CREATE         proc dbo.hsp_DeleteFullBackupAndLogBefore 
as
declare myCur cursor for 
	select bkl.id, source_filename
	from master.dbo.backuplog bkl 
		join 
		(
		select id, DBName from master.dbo.backuplog m
		where backuptype ='Full' 
			and id = (select max(id) from master.dbo.backuplog s where s.dbname=m.dbname and s.backuptype ='Full' )
		) v on bkl.dbname = v.dbname
	where  bkl.id <= v.id
		and bkl.status != 'deleted'
		
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


