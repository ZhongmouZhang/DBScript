-- restore to norecovery status

 
 
restore database cht_trak
from disk='D:\Backup_From_Production\cht_trak_Full_20140612_203500.bak'
with  move 'data_dev1' to 'H:\SQL_Data\cht_trak_data_1.ndf', 
	 move 'data_dev2' to 'H:\SQL_Data\cht_trak_data_2.mdf', 
	 move 'log_dev' to 'I:\SQL_Log\cht_trak_log.ldf', 
	 norecovery, stats
 
restore database IHACAIS
from disk='D:\Backup_From_Production\IHACAIS_Full_20140612_193000.bak'
with  move 'IHACAIS_Data' to 'H:\SQL_Data\IHACAIS_Data.MDF', 
	 move 'IHACAIS_Log' to 'I:\SQL_Log\IHACAIS_Log.LDF', 
	 norecovery,stats
 
restore database MisysCAIS
from disk='D:\Backup_From_Production\MisysCAIS_Full_20140612_194200.bak'
with  move 'MisysCAIS_Data' to 'H:\SQL_Data\MisysCAIS_data.mdf', 
	 move 'MisysCAIS_Log' to 'I:\SQL_Log\MisysCAIS_log.ldf', 
	 norecovery,stats
 


restore database cais
from disk = 'D:\Backup_From_Production\cais_Full_20140612_195500.bak'
with move 'cais1Data' to 'H:\SQL_Data\cais_data.mdf', 
	move 'cais1Log' to 'I:\SQL_Log\cais_log.ldf', norecovery, stats


----  restore databases to recovery status
