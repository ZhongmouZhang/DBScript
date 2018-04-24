 SELECT name AS 'File Name' , size/128 AS 'Total Size in MB',
size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 AS 'Available Space In MB', *
FROM sysfiles;

declare @result varchar (6000);set @result = '';
select @result = @result + name  + '; '
from master.dbo.sysdatabases db 
where name NOT IN ('master','model','msdb','tempdb')  
   	AND DATABASEPROPERTYEX(name, 'Recovery') IN ('FULL','BULK_LOGGED') 
	and db.status & 512 != 512 
	and not name in (
		select database_name 
		from msdb.dbo.backupset 
		where type='L' and backup_start_date>= dateadd(day, -1, getdate())) order by name; 
select @result



select patindex('%7.00 - 7.%',@@version)