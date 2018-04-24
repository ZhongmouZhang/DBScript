  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_RestoreDB') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_RestoreDB
GO

CREATE         proc dbo.hsp_RestoreDB 
as
declare @id int, @dbname varchar(30), @backuptype varchar(10), @RestoreFilename varchar(200)
declare @LogicalName varchar(50), @PhysicalName varchar(300)
declare @stt nvarchar(2000)

while (exists (select * from master.dbo.RestoreLog where status in ('Copied', 'RestoreFailed')))
begin
	select top 1 @id=id, @dbname = dbname, @backuptype=backuptype, @RestoreFilename=restore_filename 
	from master.dbo.RestoreLog
	where status in ('Copied', 'RestoreFailed')
	order by id
	if (@backuptype='Full')
		set @stt='restore database ' + @dbname + ' from disk=''' + @RestoreFilename + '''' + ' with '
	else 
		set @stt='restore log ' + @dbname + ' from disk=''' + @RestoreFilename + '''' + ' with '

	-- add the move clause
	declare MyCur cursor for 
	select Logical_File_Name,OS_File_Name from master.dbo.RestoreParameter where dbname=@dbname

	open myCur 
	fetch next from myCur into @LogicalName, @PhysicalName
	while @@fetch_status=0
	begin
		set @stt = @stt + 'move ''' + @LogicalName + ''' to ''' + @PhysicalName +''','
		fetch next from myCur into @LogicalName, @PhysicalName
	end
	close myCur
	deallocate myCur

	set @stt = @stt + ' norecovery, replace'

	--print @stt
	exec sp_executesql @stt

	if (@@error=0)
		update master.dbo.RestoreLog 
		set status='Restored'	
		where id = @id
	else
	begin
		update master.dbo.RestoreLog 
		set status='RestoreFailed'	
		where id = @id
		return -1     -- exit when restore fails
	end
end

-- send out an alert email if there is any restore failed
if (exists (select * from master.dbo.Restorelog where status='RestoreFailed'))
begin		
	declare @subject_str varchar(400)
	set @subject_str = 'the restoration failed on server ' + @@Servername 
		EXEC usp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = 'jzhang2@phsa.ca',
			@Subject = @subject_str, 
			@Body = 'Please check the backup on the server'
end