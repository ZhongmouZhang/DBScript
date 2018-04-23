 restore database WR_CH_Test
from disk = '\\srvap07\winrecs_backups$\MSSQL\Backup\WR_CH_LIVE_Full_20070531_200008.bak'
with move 'Med2020BlankBC_Data' to 'D:\MSSQL\Data\WR_CH_Test_Data.mdf',
	 move 'Med2020BlankBC_Log' to 'D:\MSSQL\Data\WR_CH_Test_Log.ldf',
	replace

alter database WR_CH_Test set  RECOVERY SIMPLE 
exec sp_dboption 'WR_CH_Test','autoshrink','TRUE'

-----------------------------------------------------------------------------------------
restore database WR_WFH_Test
from disk = '\\srvap07\winrecs_backups$\MSSQL\Backup\WR_WFH_LIVE_Full_20070531_201112.bak'
with move 'Med2020BlankBC_Data' to 'D:\MSSQL\Data\WR_WFH_Test_Data.mdf',
	 move 'Med2020BlankBC_Log' to 'D:\MSSQL\Data\WR_WFH_Test_Log.ldf',
	replace

alter database WR_WFH_Test set  RECOVERY SIMPLE 
exec sp_dboption 'WR_WFH_Test','autoshrink','TRUE'
