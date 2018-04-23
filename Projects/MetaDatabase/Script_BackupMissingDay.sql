 
select v.* --, b.event_date-- v.instance_name, v.database_name
from 
(
select convert(varchar(30),event_date,102) event_date,instance_name,database_name
from phsa_db
where  event_date = 
			(select max (event_date) 
			from phsa_db 
			where event_date<'2009.08.18') and status = 'Online'
) v left join 
(
select instance_name, database_name 
from phsa_backuphistory 
where convert (datetime, convert (varchar(30),backup_start_date,102)) = '2009-08-18'
) b
	on v.instance_name = b.instance_name and v.database_name = b.database_name 
	left join dbo.PHSA_DBBackup_Flag f 
		on v.instance_name = f.instance_name and v.database_name = f.database_name
	join ServerList s on v.instance_name=s.instancename

where b.database_name is null and f.database_name is null and s.Needbackup = 'Y'






select * from dbo.PHSA_BackupHistory 
where convert (varchar(30),backup_start_date,102) = '2009.09.18'
	and instance_name = 'ZVMBPPSQ02'



select * 
from 
(
select instance_name, database_name from dbo.VPHSA_Current_DB where instance_name = 'SRVEHDB01'
) v left join 
(
select * from dbo.PHSA_BackupHistory 
where instance_name = 'SRVEHDB01'and physical_device_name like 'V%' and type = 'd'
	and convert (datetime, convert (varchar(30),backup_start_date,102)) = '2009-08-18'
) b 
 on v.instance_name = b.instance_name and v.database_name = b.database_name 
where b.database_name is null



select database_name,backup_start_date, backup_finish_date, datediff (second, backup_start_date, backup_finish_date)/3600.0 time_consuming
from dbo.PHSA_BackupHistory 
where instance_name = 'SRVEHDB01'and type = 'd' 
		and datediff (second, backup_start_date, backup_finish_date) > 3600
order by datediff (second, backup_start_date, backup_finish_date) desc, database_name, backup_start_date 
