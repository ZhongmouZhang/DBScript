
use master
go

/*******************************

set @server_name = 'SVMSQ05'
set @database_name = 'ACCESSCONTROL_CDC'
set @backup_folder = 'K:\SQL_Backup'
set @backup_folder_UNC = '\\svmsq05\SQL_Backup'
****************************/

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_get_backup_list_for_restore_remotely') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_get_backup_list_for_restore_remotely
GO

CREATE         proc hsp_get_backup_list_for_restore_remotely
@server_name varchar(32), @database_name varchar(64),
@backup_folder varchar(256), @backup_folder_UNC varchar(256)
as

declare @stt varchar(4000)
declare @latest_backup_date datetime




if not exists (select * from #temp)
begin 
	set @stt = 'select database_name, physical_device_name, backup_start_date,type, ''N''
	from ' + @server_name + '.msdb.dbo.backupset a join ' + @server_name + '.msdb.dbo.backupmediafamily b on a.media_set_id=b.media_set_id
	where database_name = ''' + @database_name + '''
		and backup_start_date >= (select max([backup_start_date]) from ' + @server_name + '.msdb.[dbo].[backupset]
									where type=''D'' and database_name = ''' + @database_name + ''')
	order by backup_start_date'
end
else
begin
	select @latest_backup_date = max(backup_start_date) from #temp
	set @stt = 'select database_name, physical_device_name, backup_start_date,type, ''N''
	from ' + @server_name + '.msdb.dbo.backupset a join ' + @server_name + '.msdb.dbo.backupmediafamily b on a.media_set_id=b.media_set_id
	where database_name = ''' + @database_name + '''
		and backup_start_date > '''+ CONVERT(varchar(30), @latest_backup_date, 121) + '''
		and type = ''L''
	order by backup_start_date'
end

insert into #temp
exec (@stt)


update #temp
set physical_device_name = REPLACE(physical_device_name, @backup_folder, @backup_folder_UNC)

