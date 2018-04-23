

 /*****************************************
The Stored procedure returns the time when the specified database failover happens

declare @switch_time datetime
exec master.dbo.hsp_Mirror_DBFailoverTime 'SS_Prod', @switch_time output
select @switch_time
go
*********************************************/
use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_mirror_db_failover_time') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_mirror_db_failover_time
GO

create procedure hsp_mirror_db_failover_time @database_name sysname, @switch_time datetime output 
as
begin
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#mirroring_status') and xtype='U')
drop table #mirroring_status
create table #mirroring_status
(
	database_name sysname,
	role int,
	mirroring_state int,
	witness_status int,
	log_generation_rate int,
	unsent_log int,
	send_rate int,
	unrestored_log int,
	recovery_rate int,
	trasaction_delay int,
	transactions_per_second int,
	average_delay int,
	time_record datetime,
	time_behind datetime,
	local_time time
)
insert into #mirroring_status
exec msdb.dbo.sp_dbmmonitorresults @database_name, 4

declare @time_diff int
set @time_diff = DATEDIFF(hour, getutcdate(),getdate())
select @switch_time = dateadd(hour,@time_diff, MIN(time_record))
from #mirroring_status
where role = 1 and time_record > (select MAX(time_record) from #mirroring_status where role = 2)
end

go



 