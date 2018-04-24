
-- latest backup for no backup yesterday
select db.name, v.* 
from sys.databases db left join 
	(
	select backup_set_id, database_name, physical_device_name, backup_start_date,backup_finish_date,type,
		convert( decimal (10,2), convert(decimal(20,2),backup_size)/(1024*1024)) as backup_size,server_name
	from msdb.dbo.backupset a left join msdb.dbo.backupmediafamily b on a.media_set_id=b.media_set_id
	where type = 'D' 
		and backup_start_date = (select max(backup_start_date) from msdb.dbo.backupset where backupset.database_name = a.database_name and type = 'D')
	) v on db.name = v.database_name
where db.name <>'tempdb' 
	and backup_start_date is null or backup_start_date < convert (varchar(20),dateadd(d,-1,getdate()),112)




-- Backup history
select backup_set_id, database_name, physical_device_name, backup_start_date,backup_finish_date,type,
	convert( decimal (10,2), convert(decimal(20,2),backup_size)/(1024*1024)) as backup_size,server_name
    from msdb.dbo.backupset a join msdb.dbo.backupmediafamily b on a.media_set_id=b.media_set_id
	where type = 'D'
    order by backup_set_id
    
-- lastest backup for all databases on the instance
select m.name All_DBs, v.* 
from master.dbo.sysdatabases m left join 
(
select backup_set_id, database_name, physical_device_name, backup_start_date,backup_finish_date,type,
	convert( decimal (10,2), convert(decimal(20,2),backup_size)/(1024*1024)) as backup_size,server_name
from msdb.dbo.backupset a join msdb.dbo.backupmediafamily b on a.media_set_id=b.media_set_id
where type = 'D'
	and backup_set_id = 
		(select max(backup_set_id) from msdb.dbo.backupset c where c.database_name = a.database_name and type='D')
) v on m.name=v.database_name
order by m.name



--  Check the recovery model of the databases
SELECT name  
FROM master.dbo.sysdatabases  
WHERE name NOT IN ('master','model','msdb','tempdb')  
   AND DATABASEPROPERTYEX(name, 'Recovery') IN ('FULL','BULK_LOGGED') 

-- Restore History

select * from msdb.dbo.restorehistory 
order by restore_date desc