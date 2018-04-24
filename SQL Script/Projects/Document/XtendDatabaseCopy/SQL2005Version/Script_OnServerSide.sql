--step 1
-- step 1 create non-patient backup 

declare @From_str varchar(500)

backup database XtendConsole to Disk='J:\MSSQL.1\MSSQL\Backup\XtendConsole_Full.bak' with init,STATS 

restore database temp_XtendConsole
from disk = 'J:\MSSQL.1\MSSQL\Backup\XtendConsole_Full.bak'
with move 'XtendConsole' to 'J:\MSSQL.1\MSSQL\Data\temp_XtendConsole_data.mdf',
	 move 'XtendConsole_Log'  to 'J:\MSSQL.1\MSSQL\Data\temp_XtendConsole_log.ldf',replace, stats

if (@@error != 0)
begin
		set @From_str = @@Servername + '@phsa.ca'
		EXEC usp_sendcdomail
			@From = @From_str, 
			@To = 'jzhang2@phsa.ca',
			@Subject = 'The restoration of temp_XtendConsole database failed' , 
			@Body = 'Please check the prepare non-patient database job on the server'
end

alter database temp_XtendConsole set  RECOVERY SIMPLE 
go

use temp_XtendConsole
go

delete from temp_XtendConsole.dbo.xkm where format=9
truncate table dbo.Statistic
go

waitfor delay '00:00:20'
use master
go

declare @From_str varchar(100)
backup database temp_XtendConsole
to disk = 'J:\MSSQL.1\MSSQL\Backup\NonPatientXtendConsole.bak'
with init,stats

if (@@error != 0)
begin
		set @From_str = @@Servername + '@phsa.ca'
		EXEC usp_sendcdomail
			@From = @From_str, 
			@To = 'jzhang2@phsa.ca',
			@Subject = 'The backup of temp_XtendConsole database failed' , 
			@Body = 'Please check the prepare non-patient database job on the server'
end
go

use master
go

drop database temp_XtendConsole
go 

-- step 2 Pushing the backup to workstations

 exec sp_configure 'show advanced option', '1'
reconfigure
go
exec sp_configure 'Ole Automation Procedures', '1'
exec sp_configure 'xp_cmdshell', '1'
reconfigure
go 

declare @retry int
declare @destFolder varchar(500)
declare @sourceFile varchar(500)
declare @returnedCode int
declare @subject_str varchar(500)
declare @From_str varchar(500)
declare @sttm_str varchar (5000)

-- drop table #temp
create TABLE #temp(
	[EventDate] [datetime] NULL ,
	[SourceFileName] [varchar] (500)  ,
	Destination varchar(500),
	[Status] [varchar] (50)  
)


declare  @workstation table
(
	wk_folder varchar(50)
)

insert into @workstation values ('\\79404cw\restore\')  -- admin
insert into @workstation values ('\\79405cw\restore\')  -- admin
insert into @workstation values ('\\79406cw\restore\')  -- admin
insert into @workstation values ('\\79415cw\restore\')  -- admin
insert into @workstation values ('\\79416cw\restore\')  -- admin
insert into @workstation values ('\\79417cw\restore\')  -- admin
insert into @workstation values ('\\79516phsait\restore\')  -- admin



set @sourceFile = 'J:\MSSQL.1\MSSQL\Backup\NonPatientXtendConsole.bak'

declare myCur cursor for 
select wk_folder from @workstation

open MyCur
Fetch next from MyCur into @destFolder

while @@fetch_status = 0
begin 
	set @retry = 0
	set @returnedCode = 0

	-- try the copy three time
	while (@retry < 3)
	begin
		set @sttm_str = 'copy ' + @sourceFile + '  ' + @destFolder
		--print @sttm_str
		truncate table #temp
		insert into #temp (status)
		EXEC master.dbo.xp_cmdshell @sttm_str
		update #temp
		set EventDate = getdate(), 
			SourceFilename=@sourceFile, 
			Destination = @destFolder
		insert into master.dbo.FilePushLog
		select * from #temp where status is not null

		set @returnedCode = @@error
		if @returnedCode=0
			break
	    else 
		begin
			set @retry = @retry + 1
			-- sleep certain time
			waitfor delay '00:01:00'
		end
	end
	Fetch next from MyCur into @destFolder
end

close myCur
deallocate myCur

drop table #temp
go


-- step 3 refresh XtendArchive
exec master.dbo.usp_killDBConnections 'XtendArchive'

restore database XtendArchive
from disk = 'J:\MSSQL.1\MSSQL\Backup\XtendConsole_Full.bak'
with move 'XtendConsole' to 'J:\MSSQL.1\MSSQL\Data\XtendArchive_data.mdf',
	 move 'XtendConsole_Log'  to 'J:\MSSQL.1\MSSQL\Data\XtendArchive_log.ldf',replace, stats

if (@@error != 0)
begin
		set @From_str = @@Servername + '@phsa.ca'
		EXEC usp_sendcdomail
			@From = @From_str, 
			@To = 'jzhang2@phsa.ca',
			@Subject = 'The restoration of temp_XtendConsole database failed' , 
			@Body = 'Please check the prepare non-patient database job on the server'
end

