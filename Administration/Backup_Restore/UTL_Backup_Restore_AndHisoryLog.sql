 /****************************************************************

		-- Full databse Back up

****************************************************************/
declare @dbname varchar(1000), @folder varchar(1000)
 
set @dbname = ''
--set @folder = '\\cwdp01\Temp_shared_backup\'   -- temporary backup destination

select top 1 @folder = path from master.dbo.BackupParameter where backuptype='Specific' or dbname = 'default'
print 'Dbname: ' + @dbname 
print 'Path: ' + @folder

declare @dest varchar(1000)
select @dest=@folder + @dbname + '_Adhoc_'
	+convert(varchar,getdate(),112)+'_' 
	+ 
	case when datepart(hour,getdate())>9 then convert(varchar,datepart(hour,getdate()))
		 else '0' + convert(varchar,datepart(hour,getdate()))
	end
	+
	case when datepart(minute,getdate())>9 then  convert(varchar,datepart(minute,getdate()))
		 else '0' + convert(varchar,datepart(hour,getdate()))
	end
	+ '00'
	+'.bak'
--select @dest

backup database @dbname to Disk=@dest with init,STATS 


/***************************************************************************************

	Restore A database
	
***************************************************************************************/
restore FILELISTONLY 
from disk = ''

restore database 
from disk = ''
with move 'PS_Det_Data' to 'c:\mssql\data\PS_Det.mdf',
	 move 'PS_Det_Log' to 'C:\mssql\data\PS_Det_Log.ldf',replace, STATS



/***************************************************************

	recycle error log
	
***************************************************************/
EXEC master..sp_cycle_errorlog


/*************************************************************
		History
		
*****************************************************************/

select bmf.media_set_id, bmf.physical_device_name, database_name, server_name, machine_name,backup_start_date, backup_finish_date
from msdb.dbo.backupmediafamily bmf join msdb.dbo.backupmediaset bms on bmf.media_set_id = bms.media_set_id
		join msdb.dbo.backupset bs on bs.media_set_id = bms.media_set_id
order by convert(varchar,backup_start_date,102) desc, database_name


select restore_history_id,restore_date,destination_database_name,user_name
from msdb.dbo.restorehistory
order by restore_history_id desc

