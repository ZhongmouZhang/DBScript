 use [master]
go
 

 /*****************************************
The Stored procedure returns the time when the specified database failover happens

declare @switch_time datetime
exec master.dbo.hsp_Mirror_DBFailoverTime 'SS_Prod', @switch_time output
select @switch_time
go
*********************************************/

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

/****************************************************************
1. Detect if there is any mirroring database. 
2. If yes, and it becomes principal database recently, 
3. If yes, check if the failover happens 10 minutes ago
4. If yes, check if there is a full backup for the database after the failover
5. If no, fully backup the database

******************************************************************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_mirror_db_failover_fullbackup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_mirror_db_failover_fullbackup
GO
create procedure hsp_mirror_db_failover_fullbackup
as
declare @database_name varchar(128)
set @database_name = ''

declare @switch_time datetime

while 1=1
begin
	select @database_name = min(DB_NAME(database_id)) 
	from master.sys.database_mirroring 
	where mirroring_guid is not null 
			and mirroring_role = 1                -- Principal mirroring database
			and DB_NAME(database_id) > @database_name
	if @database_name is null 
		break
	-- print 'DB Name: ' + @database_name
	
	exec master.dbo.hsp_mirror_db_failover_time @database_name, @switch_time output
	if (@switch_time is null or DATEDIFF (minute, @switch_time,getdate()) < 10)    -- perform the full backup at least 10 minutes after the switch
		continue
		

	if not exists (select * from msdb.dbo.backupset
					where type = 'D' and database_name = @database_name and backup_start_date > @switch_time)
		exec master.dbo.hsp_full_backup_database 3,@database_name  --backup the specified database
end
go
