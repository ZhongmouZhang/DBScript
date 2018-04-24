-- restore temp_XtendConsole
-- RESTORE FILELISTONLY from  disk = 'C:\XTEND\Restore\XtendConsole_Full_.bak'
--sp_who2


declare @From_str varchar(100)

/************************** 
	step 1
	Restore the XtendConsole for the last two days of every month
	
*********************************/
if (datepart(month,dateadd(day, 2, getdate()))<> datepart(month, getdate()))
begin
	restore database XtendConsole
	from disk = 'C:\MSSQL\Restore\XtendConsole_Full_.bak'
	with move 'XtendConsole_Data' to 'C:\MSSQL\data\XtendConsole_data.mdf',
		 move 'XtendConsole_Log'  to 'C:\MSSQL\data\XtendConsole_log.ldf'

	if (@@error != 0)
	begin
			set @From_str = @@Servername + '@phsa.ca'
			EXEC usp_sendcdomail
				@From = @From_str, 
				@To = 'jzhang2@phsa.ca',
				@Subject = 'The restoration of XtendConsole database failed' , 
				@Body = 'Please check the prepare non-patient database job on the server'
	end
end

/*******************************************************************
	step 2
		Restore the temp_XtendConsole for failsafe purpose
********************************************************************/
restore database temp_XtendConsole
from disk = 'C:\MSSQL\Restore\XtendConsole_Full_.bak'
with move 'XtendConsole_Data' to 'C:\MSSQL\data\temp_XtendConsole_data.mdf',
	 move 'XtendConsole_Log'  to 'C:\MSSQL\data\temp_XtendConsole_log.ldf'

if (@@error != 0)
begin
		set @From_str = @@Servername + '@phsa.ca'
		EXEC usp_sendcdomail
			@From = @From_str, 
			@To = 'jzhang2@phsa.ca',
			@Subject = 'The restoration of temp_XtendConsole database failed' , 
			@Body = 'Please check the prepare non-patient database job on the server'
end
else
begin
	EXEC master.dbo.xp_cmdshell 'del C:\MSSQL\Restore\*.bak'
end
go

-- step 3
alter database temp_XtendConsole set  RECOVERY SIMPLE 
go

use temp_XtendConsole
go

delete from temp_XtendConsole.dbo.xkm where format=9
truncate table dbo.Statistic
go

declare @From_str varchar(100)
backup database temp_XtendConsole
--to disk = 'C:\XTEND\Restore\NonPatientXtendConsole.bak'
to disk = 'C:\MSSQL\backup\NonPatientXtendConsole.bak'
with init

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


-- step 4 Push the backup to workstations
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

insert into @workstation values ('\\74667xp\restore\')  -- admin
insert into @workstation values ('\\74724xp\restore\')  -- Bunker
insert into @workstation values ('\\74685xp\restore\')  -- Bunker


insert into @workstation values ('\\74695xp\restore\')  -- E400 
insert into @workstation values ('\\74681xp\restore\')  -- E400 
insert into @workstation values ('\\75166xp\restore\')  -- E400 




-- set @sourceFile = 'C:\XTEND\Restore\NonPatientXtendConsole.bak'
set @sourceFile = 'C:\MSSQL\backup\NonPatientXtendConsole.bak'

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
		insert into FilePushLog
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


--select * from #temp
