 restore database CAP 
from disk = 'K:\Backup_From_SERVER11B\'
with move 'CAP' to 'H:\SQL_Data\CAP_Data.mdf',
	 move 'CAP_Log' to 'I:\SQL_Log\CAP_Log.ldf', replace, STATS



restore database csp_registry
from disk = 'K:\Backup_From_SERVER11B\'
with move 'csp_registry_Data' to 'H:\SQL_Data\csp_registry_Data.mdf',
	 move 'csp_registry_Log' to 'I:\SQL_Log\csp_registry_Log.ldf', replace, STATS



restore database csp_warehouse
from disk = 'K:\Backup_From_SERVER11B\'
with move 'csp_warehouse_Data' to 'H:\SQL_Data\csp_warehouse_Data.mdf',
	 move 'csp_warehouse_Log' to 'I:\SQL_Log\csp_warehouse_Log.ldf', replace, STATS


restore database cytology
from disk = 'K:\Backup_From_SERVER11B\'
with move 'cytology_Data' to 'H:\SQL_Data\cytology_Data.mdf',
	 move 'cytology_Log' to 'I:\SQL_Log\cytology_Log.ldf', replace, STATS



restore database cytology2
from disk = 'K:\Backup_From_SERVER11B\'
with move 'cytology2_Data' to 'H:\SQL_Data\cytology2_Data.mdf',
	 move 'cytology2_Log' to 'I:\SQL_Log\cytology2_Log.ldf', replace, STATS


restore database cytology3
from disk = 'K:\Backup_From_SERVER11B\'
with move 'cytology3_Data' to 'H:\SQL_Data\cytology3_Data.mdf',
	 move 'cytology3_Log' to 'I:\SQL_Log\cytology3_Log.ldf', replace, STATS



restore database cytology4
from disk = 'K:\Backup_From_SERVER11B\'
with move 'cytology4_Data' to 'H:\SQL_Data\cytology4_Data.mdf',
	 move 'cytology4_Log' to 'I:\SQL_Log\cytology4_Log.ldf', replace, STATS



restore database cytology5
from disk = 'K:\Backup_From_SERVER11B\'
with move 'cytology5_Data' to 'H:\SQL_Data\cytology5_Data.mdf',
	 move 'cytology5_Log' to 'I:\SQL_Log\cytology5_Log.ldf', replace, STATS



restore database oscar
from disk = 'K:\Backup_From_SERVER11B\'
with move 'oscar_Data' to 'H:\SQL_Data\oscar_Data.mdf',
	 move 'oscar_Log' to 'I:\SQL_Log\oscar_Log.ldf', replace, STATS



restore database PeopleSoftORMED
from disk = 'K:\Backup_From_SERVER11B\'
with move 'PeopleSoftORMED_Data' to 'H:\SQL_Data\PeopleSoftORMED_Data.mdf',
	 move 'PeopleSoftORMED_Log' to 'I:\SQL_Log\PeopleSoftORMED_Log.ldf', replace, STATS



restore database physician
from disk = 'K:\Backup_From_SERVER11B\'
with move 'physician_Data' to 'H:\SQL_Data\physician_Data.mdf',
	 move 'physician_Log' to 'I:\SQL_Log\physician_Log.ldf', replace, STATS




restore database scratch
from disk = 'K:\Backup_From_SERVER11B\'
with move 'scratch_Data' to 'H:\SQL_Data\scratch_Data.mdf',
	 move 'scratch_Log' to 'I:\SQL_Log\scratch_Log.ldf', replace, STATS




restore database warehouse
from disk = 'K:\Backup_From_SERVER11B\'
with move 'warehouse_Data' to 'H:\SQL_Data\warehouse_Data.mdf',
	move 'warehouse_data_1' to 'H:\SQL_Data\warehouse_data_1.ndf',
	 move 'warehouse_Log' to 'I:\SQL_Log\warehouse_Log.ldf', replace, STATS



---------------------  restore log files of warehouse

  
 
set nocount on
declare @logfilename varchar(500)
declare @dbname varchar(500)
declare @dir varchar(500)

set @dbname = 'warehouse'
set @dir = 'dir \\sd11blnr001\Backup_from_SERVER11B\logs\Server11B_warehouse_Log_*.trn /s /B'

-- get all the available log files
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))

INSERT INTO #fileList 
EXEC xp_cmdshell @dir

-- restore all the log files after the last backup
set @logfilename = ''
while 1=1
begin
	select @logfilename = min(line) from #fileList
	where line > @logfilename
	
	if @logfilename is null
		break

	print 'restore log ' + @dbname + ' from disk =  '''  +  @logfilename + '''  with NoRECOVERY'
	--restore Log @dbname  from disk = @logfilename  with NoRECOVERY
end



