-- =============================================
-- Script Template
-- =============================================
restore database master 
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_master_Adhoc_20130503_162700.bak'
with replace, recovery



exec sp_detach_db model
exec sp_detach_db msdb


use master 
go 
exec sp_attach_db 'model', 'H:\SQL_Data\MSSQL$ZICAISDB01\Data\model.mdf', 'H:\SQL_Data\MSSQL$ZICAISDB01\Data\modellog.ldf' 
go 

exec sp_attach_db 'msdb', 'H:\SQL_Data\MSSQL$ZICAISDB01\Data\msdbdata.mdf', 'H:\SQL_Data\MSSQL$ZICAISDB01\Data\msdblog.ldf' 
go 

alter database tempdb modify file (name = tempdev
   , filename = 'H:\SQL_Data\MSSQL$ZICAISDB01\Data\tempdb.mdf') 
go 
alter database tempdb modify file (name = templog
   , filename = 'H:\SQL_Data\MSSQL$ZICAISDB01\Data\templog.ldf') 
go 


exec sp_detach_db 
exec sp_detach_db 
exec sp_detach_db 
exec sp_detach_db EDDS_Restore
exec sp_detach_db IHACAIS
exec sp_detach_db MisysCAIS
exec sp_detach_db NHACAIS
exec sp_detach_db Stress
exec sp_detach_db TMLCAIS
exec sp_detach_db cais
exec sp_detach_db cais_STG
exec sp_detach_db canadian_cancer_registry
exec sp_detach_db cht_trak
exec sp_detach_db hl7
exec sp_detach_db hl7_2
exec sp_detach_db hl7_3

exec sp_detach_db CAIS_ANON

exec sp_detach_db scratch

exec sp_detach_db tml
exec sp_detach_db vhub







restore database model
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_model_Adhoc_20130503_162700.bak'
with replace, STATS

go

restore database msdb
from disk = 'K:\Backup_from_old_cluster\ZVCAISDB01_ZICAISDB01_msdb_Adhoc_20130503_162700.bak'
with replace, STATS



