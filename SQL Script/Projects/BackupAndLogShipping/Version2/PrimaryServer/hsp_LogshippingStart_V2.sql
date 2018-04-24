  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_LogShippingStart') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_LogShippingStart
GO

CREATE         proc dbo.hsp_LogShippingStart
as
create table #temp
(
	status varchar(300)
)

declare @id int
declare @stt nvarchar(2000)
declare @source varchar(100)
declare @dest varchar(100)
declare @dbname varchar(100)
declare @filename varchar(100)
declare @loop int
declare @now datetime

-- set the start point
set @id = 0

-- Copy the full backup files
declare MyCur cursor for
	select id, source_FileName, dbname from master.dbo.backuplog m
	where id = (select max(id) from master.dbo.backuplog s where m.dbname=s.dbname and backuptype='full')
		and dbname in (select dbname from master.dbo.BackupParameter where backuptype='LogShipping')
		and status in ('Backup' , 'CopyFailed') -- full backup copy and has not been copied to destination

open myCur 
fetch next from myCur into @id, @source, @dbname
while @@fetch_status=0
begin
	select @dest = path + dbo.hfn_GetFilename_V2(@source) 
	from master.dbo.BackupParameter
	where backuptype='LogShipping' and dbname = @dbname
		
	set @stt = 'Copy ' + @source + ' ' + @dest
	truncate table #temp
	insert into #temp (status)
	EXEC master.dbo.xp_cmdshell @stt
	print @stt
		
	if (exists (select * from #temp where status like '%1 file(s) copied%'))
	begin
		set @now = getdate()
		exec master.dbo.hsp_InsertRestoreLog_V2 @dbname, 'Full', @now, @dest 
		if (@@error=0)
		begin
			update backuplog 
			set status = 'Copied',	dest_filename = @dest
			where id <= @id and dbname = @dbname and status != 'Deleted'     -- all the backup of the database with id equal to or less than current id is set to copied
			
			update backuplog
			set status = 'Backup'
			where id > @id and dbname = @dbname 
	end
	else
	begin
		update backuplog 
		set status = 'CopyFailed'
		where id = @id
	end
	fetch next from myCur into @id, @source, @dbname
end
close myCur
deallocate myCur


-- restore the databsaes on the standby servers
exec master.dbo.hsp_RestoreStandByDBs_V2
