 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_CopyToDest') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_CopyToDest
GO

CREATE         proc dbo.hsp_CopyToDest 
as
create table #temp
(
	status varchar(300)
)

declare @id int
declare @stt nvarchar(1000)
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
	select @dest = path + dbo.hfn_GetFilename(@source) 
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
		exec master.dbo.hsp_InsertRestoreLog @dbname, 'Full', @now, @dest 
		if (@@error=0)
			update backuplog 
			set status = 'Copied',	dest_filename = @dest
			where id <= @id and dbname = @dbname and status != 'Deleted'     -- all the backup of the database with id equal to or less than current id is set to copied
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

-- copy log file		
declare myCur1 cursor for 
select dbname from  master.dbo.BackupParameter where backuptype = 'LogShipping'

open MyCur1
Fetch next from MyCur1 into @dbname

while @@fetch_status = 0
begin 
	set @id = 0
	while (1=1)
	begin
		select @id = min(id)
		from master.dbo.backuplog
		where backuptype='Log' and status in ('Backup' , 'CopyFailed') -- log backup copy and has not been copied to destination
			and dbname = @dbname
		
		if @id is not null
		begin
			select @source = source_filename, @dbname = dbname
			from master.dbo.backuplog
			where id = @id
			
			select @dest = path + dbo.hfn_GetFilename(@source) from master.dbo.BackupParameter
			where backuptype='LogShipping' and dbname = @dbname
			
			set @stt = 'Copy ' + @source + ' ' + @dest
			truncate table #temp
			insert into #temp (status)
			EXEC master.dbo.xp_cmdshell @stt
			
			if (exists (select * from #temp where status like '%1 file(s) copied%'))
			begin
				set @now = getdate()
				exec master.dbo.hsp_InsertRestoreLog @dbname, 'Log', @now, @dest -- insert restore log table a record 
				if (@@error=0)
					update backuplog 
					set status = 'Copied',	dest_filename = @dest
					where id = @id 
			end
			else
			begin
				update backuplog 
				set status = 'CopyFailed'
				where id = @id
				break  -- end of copy the current database's log file(s)
			end
		end
		else
		begin
			break
		end
	end
	
	-- get next log shipping database
	Fetch next from MyCur1 into @dbname
end

close myCur1
deallocate myCur1

-- sned out an alert email if there is any copy failed
if (exists (select * from master.dbo.backuplog where status='CopyFailed'))
begin		
	declare @subject_str varchar(400)
	set @subject_str = 'the copy of backup file(s) failed on server ' + @@Servername 
		EXEC usp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = 'jzhang2@phsa.ca',
			@Subject = @subject_str, 
			@Body = 'Please check the backup on the server'
end