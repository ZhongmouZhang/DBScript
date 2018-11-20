

use master
go

/*******************************
set @server_name = 'SVMSQ05'
set @source_database_name = 'ACCESSCONTROL_CDC'
set @destination_database_name = 'ACCESSCONTROL_CDC_TST'

set @backup_folder = 'K:\SQL_Backup'
set @backup_folder_UNC = '\\svmsq05\SQL_Backup'

set @with_clause = ' with stats, replace, norecovery'
set @running_till = '2018-11-16 15:15:00'   -- dateadd(minute, GETDATE(), 15)

requirements: 
    1. linked server to the source instance
    2. UNC for the backup folder 

****************************/

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_restore_backup_remotely') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_restore_backup_remotely
GO

CREATE         proc hsp_restore_backup_remotely
@server_name varchar(64), 
@source_database_name varchar(256), 
@destination_database_name varchar(256), 
@backup_folder varchar(128), 
@backup_folder_UNC varchar(128),
@with_clause varchar(128) = ' with stats, replace, norecovery', 
@running_till datetime = '2018-01-01'
as

-- create a temp table to store the db names
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	id int identity primary key,
	dbname varchar(128),
	physical_device_name varchar(512),
	backup_start_date datetime, 
	[type] char(1),
	is_applied char(1)
)

set nocount on

declare @backup_filename varchar(128)
declare @id int
declare @stt varchar(4000)



exec hsp_get_backup_list_for_restore_remotely 
	@server_name = @server_name
	, @database_name = @source_database_name
	, @backup_folder = @backup_folder
	, @backup_folder_UNC = @backup_folder_UNC
	
	
while exists (select * from #temp where is_applied = 'N') or @running_till > GETDATE()
begin
	
	while exists (select * from #temp where is_applied = 'N')
	begin
		select @id = min(id) from #temp where is_applied = 'N'
		select @backup_filename = physical_device_name from #temp where id = @id
		if @id = 1
			set @stt = 'restore database ' + @destination_database_name + 
				' from disk = ''' + @backup_filename + '''
				' + @with_clause
		else
			set @stt = 'restore log ' + @destination_database_name + 
				' from disk = ''' + @backup_filename + ''' with norecovery'
		
		print @stt
		exec (@stt)
		update #temp  set is_applied = 'Y'  where id = @id
	end
	
	waitfor delay '00:00:20'
	
	exec hsp_get_backup_list_for_restore_remotely 
		@server_name = @server_name
		, @database_name = @source_database_name
		, @backup_folder = @backup_folder
		, @backup_folder_UNC = @backup_folder_UNC
end	
	
set @stt = 'restore database ' + @destination_database_name + ' with recovery'
print @stt 
exec (@stt)



-- select * from #temp