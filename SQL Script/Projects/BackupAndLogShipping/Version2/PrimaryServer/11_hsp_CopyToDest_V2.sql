  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_CopyToDest_V2') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_CopyToDest_V2
GO

CREATE         proc dbo.hsp_CopyToDest_V2 
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
			and id > (select isnull(max(id), 0) from master.dbo.backuplog 
						where dbname = @dbname and status='Copied' and backuptype='full' )
		
		if @id is not null
		begin
			select @source = source_filename, @dbname = dbname
			from master.dbo.backuplog
			where id = @id
			
			select @dest = path + dbo.hfn_GetFilename_V2(@source) from master.dbo.BackupParameter
			where backuptype='LogShipping' and dbname = @dbname
			
			set @stt = 'Copy ' + @source + ' ' + @dest
			truncate table #temp
			insert into #temp (status)
			EXEC master.dbo.xp_cmdshell @stt
			
			if (exists (select * from #temp where status like '%1 file(s) copied%'))
			begin
				set @now = getdate()
				exec master.dbo.hsp_InsertRestoreLog_V2 @dbname, 'Log', @now, @dest -- insert restore log table a record 
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