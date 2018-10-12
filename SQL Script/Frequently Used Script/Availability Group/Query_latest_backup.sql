
declare @server_name varchar(256)
declare @database_name varchar(64)
declare @stt varchar(4000)

set @server_name = 'SPDBSRES049'
set @database_name = 'hssbc'
set @stt = '
select m.name database_name, v.physical_device_name,backup_finish_date, server_name
from [' + @server_name + '].master.dbo.sysdatabases m left join 
(
select backup_set_id, database_name, physical_device_name, backup_start_date,backup_finish_date,type,
	convert( decimal (10,2), convert(decimal(20,2),backup_size)/(1024*1024)) as backup_size,server_name
from ['  + @server_name + '].msdb.dbo.backupset a join [' + @server_name + '].msdb.dbo.backupmediafamily b on a.media_set_id=b.media_set_id
where type = ''D''
	and backup_set_id = 
		(select max(backup_set_id) from [' + @server_name + '].msdb.dbo.backupset c where c.database_name = a.database_name and type=''D'')
) v on m.name=v.database_name
where v.physical_device_name is not null and m.name like ''' + @database_name + ''''

print @stt

exec (@stt)
