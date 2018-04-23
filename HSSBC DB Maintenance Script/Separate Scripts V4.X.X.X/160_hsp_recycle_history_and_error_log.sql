 
/**************************************************************

		Clean Up the Logs: 
		Backup/Restore log, Job Log, SQL Server Log and SQL Agent Log
		
		
*****************************************************************/
use master
go

IF OBJECTPROPERTY ( object_id('hsp_recycle_history_and_error_log'),'IsProcedure') = 1
	DROP PROC hsp_recycle_history_and_error_log
GO

create proc hsp_recycle_history_and_error_log
as
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp_1') and xtype='U')
drop table #temp_1
create table #temp_1
(
log_date datetime,
process_info varchar(100),
text varchar (8000)
)

declare @log_start_date datetime
declare @retention_day int
DECLARE @dt DATETIME

/*****************************************************

		Clean up SQL Server Error Log
		
******************************************************/
insert into #temp_1
exec xp_readerrorlog 0,1
select top 1 @log_start_date = log_date 
from #temp_1

select @retention_day = CONVERT(int, parameter_value) from master.dbo.tbl_maint_parameter
where parameter_name = '#server_error_log_retention_day'

--select @log_start_date, @retention_day

if DATEDIFF (day, @log_start_date,getdate()) > @retention_day
begin
	exec master.dbo.sp_cycle_errorlog
end

/*****************************************************

		Clean up SQL Agent Error Log
		
******************************************************/
truncate table #temp_1
insert into #temp_1
exec xp_readerrorlog 0,2
select top 1 @log_start_date = log_date 
from #temp_1

select @retention_day = CONVERT(int, parameter_value) from master.dbo.tbl_maint_parameter
where parameter_name = '#agent_error_log_retention_day'

--select @log_start_date, @retention_day

if DATEDIFF (day, @log_start_date,getdate()) > @retention_day
begin
	exec msdb.dbo.sp_cycle_agent_errorlog 
end
/******************************************************

		Clean up backup/restore history
		
******************************************************/

select @retention_day = parameter_value 
from master.dbo.tbl_maint_parameter 
where parameter_name = '#backup_restore_history_retention_day'
SET @dt = DATEADD(DAY, -@retention_day, GETDATE());
EXEC msdb.dbo.sp_delete_backuphistory @dt;

/******************************************************

		clean up job history
		
******************************************************/
select @retention_day = parameter_value 
from master.dbo.tbl_maint_parameter 
where parameter_name = '#job_history_retention_day'
SET @dt = DATEADD(DAY, -@retention_day, GETDATE());
EXEC msdb.dbo.sp_purge_jobhistory @oldest_date=@dt;



go




