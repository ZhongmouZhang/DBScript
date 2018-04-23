
/****************************************************************
1. Detect if there is any mirroring database. 
2. If yes, and it becomes principal database recently, 
3. If yes, check if the failover happens 10 minutes ago
4. If yes, check if there is a full backup for the database after the failover
5. If no, fully backup the database

******************************************************************/

use master
go

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
	begin
		insert into #temp values (@database_name)
		exec master.dbo.hsp_full_backup_database   --backup the specified database
	end
end
go



 