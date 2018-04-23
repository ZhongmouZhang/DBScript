
1. change cais db to simply model

2. stop the log bakcup job

3. start the full database reindex

 /***************************************************************************
	Reindex a database
****************************************************************************/
USE cais --Enter the name of the database you want to reindex 
go

DECLARE @TableName varchar(255) 

DECLARE TableCursor CURSOR FOR 
--SELECT table_name FROM information_schema.tables 
--WHERE table_type = 'base table' 
select '[' + u.name + ']' + '.[' + o.name + ']' 
from sysobjects o join sysusers u on o.uid=u.uid where xtype='U'
order by  1


OPEN TableCursor 

FETCH NEXT FROM TableCursor INTO @TableName 
WHILE @@FETCH_STATUS = 0 
BEGIN 
DBCC DBREINDEX(@TableName,'',0) 

print @TableName
print '----------------------'
print ''

FETCH NEXT FROM TableCursor INTO @TableName 
END 

CLOSE TableCursor 

DEALLOCATE TableCursor


4. change the recovery model to FULL

5. full backup the cais db

 use master
go
 
declare @dbname varchar(1000), @folder varchar(1000)
 
set @dbname = 'cais'
set @folder = 'I:\Backups\'   -- temporary backup destination

--select top 1 @folder = path from master.dbo.BackupParameter where backuptype='Specific' or dbname = 'default'
print 'Dbname: ' + @dbname 
print 'Path: ' + @folder

declare @dest varchar(1000)
select @dest=@dbname + '_Full_'
	+convert(varchar,getdate(),112)+'_' 
	+ 
	case when datepart(hour,getdate())>9 then convert(varchar,datepart(hour,getdate()))
		 else '0' + convert(varchar,datepart(hour,getdate()))
	end
	+
	case when datepart(minute,getdate())>9 then  convert(varchar,datepart(minute,getdate()))
		 else '0' + convert(varchar,datepart(minute,getdate()))
	end
	+ '00'
	+'.bak'
	
print 'Destination: ' + @dest

backup database @dbname to Disk=@dest with init,STATS 


5.1 start log backup job


----  Start to resysn SVMCAISDB03 with production CAIS 

6. copy the full backup of cais to SVMCAISDB03
 start job "DBA - Copy CAIS Full backup from Production"

7. stop the log restore in warehouse cais
 disable job "DBA - Refresh Standby CAIS_NEW  With Log Backup"


8. restore the CAIS_New with the new bckup  
 -----------------------------------------------------------------
 --  5. restore the cais_new from 'K:\Restore_PRD_CAIS_FULL\ folder
 -----------------------------------------------------------------
exec master.dbo.hsp_restore_latest_cais_full_backup 
		@source_dbname = 'cais',
		@dest_dbname = 'cais_new',
		@path = 'K:\Restore_PRD_CAIS_FULL\',
		@with_clause = 'with move ''cais1Data'' to ''D:\SQL_Data\CAIS_New\cais_data.mdf'', move ''cais1Log'' to ''D:\SQL_Data\CAIS_New\cais_log.ldf'', stats, norecovery'

--exec hsp_apply_log_backup_onto_cais_new 0
go


9. enable the log restore job on SVMCAISDB03
 enable job "DBA - Refresh Standby CAIS_NEW  With Log Backup"
