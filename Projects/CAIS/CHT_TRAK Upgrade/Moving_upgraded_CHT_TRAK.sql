 restore FILELISTONLY 
from disk = '\\zvmsqlupgrade\BACKUP\cht_trak_Adhoc_20080610_102400.bak'

restore database cht_trak
from disk = '\\zvmsqlupgrade\BACKUP\cht_trak_Adhoc_20080610_102400.bak'
with move 'data_dev2' to 'H:\MSSQL$ZICAISDB01\Data\cht_trak_data_1.mdf',
	move 'data_dev1' to 'H:\MSSQL$ZICAISDB01\Data\cht_trak_data_2.ndf',
	move 'log_dev' to 'H:\MSSQL$ZICAISDB01\Data\cht_trak_log.ldf',	 
	replace, STATS


/******************************************************************************

	find unused login on ZVCAISDB01\ZICAISDB01
	
*******************************************************************************/

-- find the login and database user mapping
select a.sid 
from master.dbo.sysxlogins a join ByCast.dbo.sysusers b on a.sid=b.sid

union
select a.sid 
from master.dbo.sysxlogins a join MisysCAIS.dbo.sysusers b on a.sid=b.sid

union
select a.sid 
from master.dbo.sysxlogins a join cais.dbo.sysusers b on a.sid=b.sid

union
select a.sid 
from master.dbo.sysxlogins a join canadian_cancer_registry.dbo.sysusers b on a.sid=b.sid

union
select a.sid 
from master.dbo.sysxlogins a join cht_trak.dbo.sysusers b on a.sid=b.sid

union
select a.sid 
from master.dbo.sysxlogins a join hl7.dbo.sysusers b on a.sid=b.sid

union
select a.sid 
from master.dbo.sysxlogins a join hl7_2.dbo.sysusers b on a.sid=b.sid

union
select a.sid 
from master.dbo.sysxlogins a join master.dbo.sysusers b on a.sid=b.sid

union
select a.sid 
from master.dbo.sysxlogins a join model.dbo.sysusers b on a.sid=b.sid

union
select a.sid 
from master.dbo.sysxlogins a join msdb.dbo.sysusers b on a.sid=b.sid

union
select a.sid 
from master.dbo.sysxlogins a join scratch.dbo.sysusers b on a.sid=b.sid

union
select a.sid 
from master.dbo.sysxlogins a join tml.dbo.sysusers b on a.sid=b.sid


