select name from master.dbo.sysdatabases
where name not in ('master','tempdb','model','msdb','distribution')

/********************************
	for backup with device
*********************************/
sp_addumpdevice 'disk', 'device name', 'D:\test\test.bak'
backup database comet to Comet_Backup with init

-- check the backup
BACKUP DATABASE [FINP] TO [finp_bk] WITH  INIT ,  NOUNLOAD ,  NAME = N'FINP backup',  NOSKIP ,  STATS = 10,  NOFORMAT DECLARE @i INT
select @i = position from msdb..backupset where database_name='FINP'and type!='F' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name='FINP')
RESTORE VERIFYONLY FROM  [finp_bk]  WITH FILE = @i

/***********************************
	Send Email Sproc
************************************/
exec usp_sendcdomail 'vsqla01@phsa.ca','rgrover2@phsa.ca','Backup job for ORTHO db failed','Please check server SRVSQA01 for failed ORTHO Full Backup backup job on cluster node VSQLA01\ISQA01.'

/************************************
	Show Server Settings
*************************************/
use master
exec sp_configure 'show advanced option', '1'
reconfigure
exec sp_configure


/**************************************************
	execute CMD
***************************************************/
EXEC master.dbo.xp_cmdshell 'osql -S VSQLB02\ISQB02 -E -Q"use NMSReporting select case when groupid=0 then ''Log'' else ''DB'' end [name], convert(decimal(9,2) ,size*1.0/128) [   size(MB)], convert (decimal(9,2),maxsize*1.0/128) [   maxsize(MB)] from sysfiles " -o"J:\MSSQL$ISQB02\Temp\NMSReporting_dbsize.txt" -s"" '

