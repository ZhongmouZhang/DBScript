-- =============================================
-- Script Template
-- =============================================

restore filelistonly 
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_cht_trak_Adhoc_20130503_161500.bak'

restore database cht_trak
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_cht_trak_Adhoc_20130503_161500.bak'
with move 'data_dev1' to 'H:\SQL_Data\cht_trak_Data_1.MDF', 
move 'data_dev2' to 'H:\SQL_Data\cht_trak_Data_2.MDF', 
	move 'log_dev' to 'I:\SQL_Log\cht_trak_Log.LDF', recovery, stats



restore filelistonly 
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_EDDSTrace_Adhoc_20130503_153100.bak'

restore database EDDSTrace
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_EDDSTrace_Adhoc_20130503_153100.bak'

with move 'EDDSTrace_Data' to 'H:\SQL_Data\EDDSTrace_Data_1.MDF', 
	move 'EDDSTrace_Log' to 'I:\SQL_Log\EDDSTrace_Log.LDF', recovery, stats


restore filelistonly 
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_hl7_2_Adhoc_20130503_162700.bak'

restore database hl7_2
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_hl7_2_Adhoc_20130503_162700.bak'

with move 'data_dev5' to 'H:\SQL_Data\hl7_2_Data.MDF', 
	move 'data_dev5Log' to 'I:\SQL_Log\hl7_2_Log.LDF', recovery, stats

	restore database hl7_3
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_hl7_3_Adhoc_20130503_162700.bak'

with move 'data_dev5' to 'H:\SQL_Data\hl7_3_Data.MDF', 
	move 'data_dev5Log' to 'I:\SQL_Log\hl7_3_Log.LDF', recovery, stats


restore database hl7
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_hl7_Adhoc_20130503_162700.bak'

with move 'data_dev5' to 'H:\SQL_Data\hl7_Data.MDF', 
	move 'data_dev5Log' to 'I:\SQL_Log\hl7_Log.LDF', recovery, stats

restore database IHACAIS
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_IHACAIS_Adhoc_20130503_153200.bak'

with move 'IHACAIS_Data' to 'H:\SQL_Data\IHACAIS_Data.MDF', 
	move 'IHACAIS_Log' to 'I:\SQL_Log\IHACAIS_Log.LDF', recovery, stats

restore database MisysCAIS
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_MisysCAIS_Adhoc_20130503_153200.bak'

with move 'MisysCAIS_Data' to 'H:\SQL_Data\MisysCAIS_Data.MDF', 
	move 'MisysCAIS_Log' to 'I:\SQL_Log\MisysCAIS_Log.LDF', recovery, stats


restore database NHACAIS
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_NHACAIS_Adhoc_20130503_155200.bak'

with move  'NHACAIS_Data' to 'H:\SQL_Data\NHACAIS_Data.MDF', 
	move 'NHACAIS_Log' to 'I:\SQL_Log\NHACAIS_Log.LDF', recovery, stats

restore database scratch
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_scratch_Adhoc_20130503_162700.bak'

with move  'data_dev6' to 'H:\SQL_Data\scratch_Data.MDF', 
	move 'data_dev6Log' to 'I:\SQL_Log\scratch_Log.LDF', recovery, stats

restore database Stress
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_Stress_Adhoc_20130503_155200.bak'

with move 'Stress_Data' to 'H:\SQL_Data\Stress_Data.MDF', 
	move 'Stress_Log' to 'I:\SQL_Log\Stress_Log.LDF', recovery, stats

restore database tml
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_tml_Adhoc_20130503_163000.bak'

with move 'tml_Data' to 'H:\SQL_Data\tml_Data.MDF', 
	move 'tml_Log' to 'I:\SQL_Log\tml_Log.LDF', recovery, stats

restore database TMLCAIS
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_TMLCAIS_Adhoc_20130503_155200.bak'

with move  'TMLCAIS_Data' to 'H:\SQL_Data\TMLCAIS_Data.MDF', 
	move 'TMLCAIS_Log' to 'I:\SQL_Log\TMLCAIS_Log.LDF', recovery, stats



restore database vhub
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_vhub_Adhoc_20130503_163200.bak'

with move 'vhub' to 'H:\SQL_Data\vhub_Data.MDF', 
	move 'vhub_log' to 'I:\SQL_Log\vhub_Log.LDF', recovery, stats









