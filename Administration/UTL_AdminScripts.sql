
-- Common command
sp_who2

DBCC OPENTRAN ('PSDM')

DBCC INPUTBUFFER (58)

sp_spaceused tblStagingLedger

sp_lock

sp_helpdb


alter database <database> set  RECOVERY SIMPLE  --RECOVERY FULL  | BULK_LOGGED | SIMPLE 



-- reset the replicated flag to make the database no longer published
Use master
GO 

UPDATE sysdatabases
SET category = 0
WHERE dbid = DB_ID('database_name') 


-- row versioning setting
ALTER DATABASE AdventureWorks
    SET READ_COMMITTED_SNAPSHOT ON;
    
ALTER DATABASE AdventureWorks
    SET ALLOW_SNAPSHOT_ISOLATION ON;
    
select name, snapshot_isolation_state, is_read_committed_snapshot_on  from sys.databases -- check the settings of the databases   
 
 
/***********************************************************************

	 Database and datafile shrink, it can be stopped at any time and retains the work already done
	 
**************************************************/
 -- relocate and release the free space to OS
 dbcc shrinkdatabase ('Peerflix_Matrix_QA', 20)
 
-- shrink a datafile, more specifi way to do the job
USE [Peerflix_Matrix_QA]
GO
DBCC SHRINKFILE (N'peerflix_Data' , 16751)  -- size MB
GO




/*************************************************************
	remaping the user
*************************************************************/
EXEC sp_change_users_login 'Update_One', '', ''

exec sp_changedbowner 'MED2020Main'

-- find the login and database user mapping
select * 
from master.dbo.sysxlogins a join cht_trak.dbo.sysusers b on a.sid=b.sid

-- find the logins and database users which have the same name
select * 
from master.dbo.sysxlogins a join cht_trak.dbo.sysusers b on a.name=b.name

-- find orphan database user
select b.*
from master.dbo.sysxlogins a right join cht_trak.dbo.sysusers b on a.sid=b.sid
where a.sid is null and b.issqluser=1 



/************************************************************************
	create user ang grant the access amd permissions on the current database
	
*************************************************************************/
-- windows account
exec sp_grantlogin 'PHSABC\rballan'
EXEC sp_grantdbaccess 'PHSABC\rballan', 'PHSABC\rballan'
exec sp_addrolemember 'db_owner', 'PHSABC\rballan'


-- SQL account
exec sp_addlogin 'EEGTech', 'p@ssword', 'master', 'us_english'
EXEC sp_grantdbaccess 'EEGTech', 'EEGTech'
exec sp_addrolemember 'db_owner', 'EEGTech'



/***********************************************************************
	find out the row number in each table
************************************************************************/

create table #temp
(
	name varchar(100),
	rows int,
	reserved varchar(100),
	date varchar(100),
	index_size varchar(100),
	unused varchar(100)
)

declare myCur cursor for 
select table_name from INFORMATION_SCHEMA.TABLES

declare @tablename  varchar(100)

open myCur
Fetch next from myCur into @tablename

while @@fetch_status = 0
begin
	insert into #temp
	exec sp_spaceused @tablename
	Fetch next from myCur into @tablename
end

close myCur
deallocate myCur


select * from #temp order by name


/**************************************************************

	Problem with running SP_HELPDB: NULL db owner
	
**************************************************************/

SELECT name, suser_sname(sid), convert(nvarchar(11), crdate),dbid, cmptlevel 
FROM master.dbo.sysdatabases


SELECT 'USE ' + name + '; EXEC sp_changedbowner ''sa'';' 
FROM master.dbo.sysdatabases WHERE suser_sname(sid) IS NULL

/**************************************************************

	find out the index usage and operation statistics
	
***************************************************************/

SELECT OBJECT_NAME(A.[OBJECT_ID]) AS [OBJECT NAME], 
       I.[NAME] AS [INDEX NAME], 
       A.LEAF_INSERT_COUNT, 
       A.LEAF_UPDATE_COUNT, 
       A.LEAF_DELETE_COUNT 
FROM   SYS.DM_DB_INDEX_OPERATIONAL_STATS (NULL,NULL,NULL,NULL ) A 
       INNER JOIN SYS.INDEXES AS I 
         ON I.[OBJECT_ID] = A.[OBJECT_ID] 
            AND I.INDEX_ID = A.INDEX_ID 
WHERE  OBJECTPROPERTY(A.[OBJECT_ID],'IsUserTable') = 1


/**************************************************************

	restore system database
	
***************************************************************/

sqlservr -c -m -T3608 -T4022

select * from sysdatabases
select * from sysaltfiles


restore filelistonly 
from disk = 'D:\MSSQL\BACKUP\master_Full_20070517_124228.bak'


restore database master
from disk = 'D:\MSSQL\BACKUP\master_Full_20070517_124228.bak'
with move 'master' to 'D:\MSSQL\data\master.mdf' ,
	move 'mastlog' to 'D:\MSSQL\data\mastlog.ldf'


restore database model
from disk = 'D:\BACKUP\model_Full_20070517_124235.bak'
with move 'modeldev' to 'D:\MSSQL\data\model.mdf' ,
	move 'modellog' to 'D:\MSSQL\data\modellog.ldf'


/********************************************************************************
	Send out message with SQL Server
*********************************************************************************/
		EXEC master..xp_startmail
		EXEC  master..xp_sendmail 'jzhang2@phsa.ca', 'TEST Message', @SUBJECT = 'PAF Reminder'
		EXEC  master..xp_stopmail


/**************************************************************************
	Insert a new server in ServerList
	
**************************************************************************/
insert into serverlist(Groupname, Servername,comment) 
values('PNG','zvmpnghadb01','HIV Test DB')


/*************************************************************************
	Test if a file exists
**************************************************************************/
SET NOCOUNT ON 
DECLARE @FileName varchar(255) 
DECLARE @File_Exists int 
SELECT @FileName='C:\boot.ini' 
EXEC Master.dbo.xp_fileexist @FileName, @File_Exists OUT 
IF @File_Exists = 1 
PRINT 'File Found' 
ELSE PRINT 'File Not Found' 
GO

/**********************************************************************

	Find Job Owner
	
***********************************************************************/
USE MSDB
GO
SELECT GETDATE() AS 'ExecutionTime'
GO
SELECT @@SERVERNAME AS 'SQLServerInstance'
GO
SELECT j.[name] AS 'JobName', 
Enabled = CASE WHEN j.Enabled = 0 THEN 'No'
ELSE 'Yes'
END,
l.[name] AS 'OwnerName'
FROM MSDB.dbo.sysjobs j
INNER JOIN Master.dbo.syslogins l
ON j.owner_sid = l.sid
ORDER BY j.[name] 
GO


/*************************************************************************
	change job owner
**************************************************************************/SET NOCOUNT ON

SELECT 'EXEC MSDB.dbo.sp_update_job ' + char(13) +
'@job_name = ' + char(39) + j.[Name] + char(39) + ',' + char(13) + 
'@owner_login_name = ' + char(39) + 'sa' + char(39) + char(13) + char(13)
FROM MSDB.dbo.sysjobs j
INNER JOIN Master.dbo.syslogins l
ON j.owner_sid = l.sid
WHERE l.[name] <> 'sa' 
ORDER BY j.[name]  
Example Output: 
EXEC MSDB.dbo.sp_update_job 
@job_name = 'Full Backups - Daily', 
@owner_login_name = 'sa' 

EXEC MSDB.dbo.sp_update_job 
@job_name = 'Full Backups - Policy Test', 
@owner_login_name = 'sa'
 


/*********************************************************************

	Get database users' accounts 
*********************************************************************/

select  suser_sname(sid) --, *  
from dbo.sysusers 
where issqlrole = 0 
	and suser_sname(sid) is not null
order by upper(suser_sname(sid))


exec sp_helprole

exec sp_helprolemember 'dvs_death_query'

EXEC sp_helpuser 'BCCA\lkan'

-- role an permissions
select b.name RoleName, c.name ObjectName, 
	case c.xtype 
		when 'U' then 'User table'
		when 'V' then 'View'
		when 'P' then 'Stored Procedure'
		when 'S' then 'System table'
		when 'FN' then 'Scalar function'
		when 'X' then 'Extened stored procedure'
		else xtype
	end Objecttype,
	case d.action
		when 26  then  'REFERENCES'
		when 178 then 'CREATE FUNCTION'
		when 193 then 'SELECT'
		when 195 then 'INSERT'
		when 196 then 'DELETE'
		when 197 then 'UPDATE'
		when 198 then 'CREATE TABLE'
		when 203 then 'CREATE DATABASE'
		when 207 then 'CREATE VIEW'
		when 222 then 'CREATE PROCEDURE'
		when 224 then 'EXECUTE'
		when 228 then 'BACKUP DATABASE'
		when 233 then 'CREATE DEFAULT'
		when 235 then 'BACKUP LOG'
		when 236 then 'CREATE RULE'
		else 'other'
	end Permission
from syspermissions a join sysusers b on a.grantee = b.uid
	join sysobjects c on a.id=c.id
	join sysprotects d on d.id=c.id and b.uid=d.uid
where b.issqlrole = 1 
order by b.name


/****************************************************************

	Rebuild SQL 2005 system databases

*****************************************************************/

start /wait C:\Temp\CD\Servers\setup.exe /qb INSTANCENAME=Momentum REINSTALL=SQL_Engine REBUILDDATABASE=1 SAPWD=Zzm930915 SQLCOLLATION=Latin1_General_BIN


/******************************************************************

	Find SQL Statement running on SQL 2005 by using DM View
	
************************************************************/

SELECT TOP 50 
total_worker_time/execution_count AS [Avg CPU Time], total_worker_time,execution_count,
(SELECT SUBSTRING(text,statement_start_offset/2,(CASE WHEN statement_end_offset = -1 then LEN(CONVERT(nvarchar(max), text)) * 2 ELSE statement_end_offset end -statement_start_offset)/2) FROM sys.dm_exec_sql_text(sql_handle)) AS query_text 
FROM sys.dm_exec_query_stats 
ORDER BY [Avg CPU Time] DESC


/*******************************************************************

	list index fragmentattion
	
********************************************************************/
-- select indexes on a specific table
SELECT a.index_id, name, avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats (DB_ID(), OBJECT_ID(N'Production.Product'),
     NULL, NULL, NULL) AS a
    JOIN sys.indexes AS b ON a.object_id = b.object_id AND a.index_id = b.index_id;


-- select all the indexes    
SELECT a.object_id table_id, object_name(a.object_id) table_name, a.index_id, b.name index_name, avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL,NULL, NULL, NULL) AS a
    JOIN sys.indexes AS b ON a.object_id = b.object_id AND a.index_id = b.index_id
order by avg_fragmentation_in_percent desc


-- filegroup usage

	SELECT filename, groupid, size/128.0 [File_Size(MB)], size/128.0-CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 [Free_Space (MB)]
	FROM dbo.sysfiles 


-- backup statue query

select database_name, backup_start_date, backup_finish_date, 
	datediff (day, backup_start_date, backup_finish_date) day,
	convert(varchar, backup_finish_date-backup_start_date,108) time
from msdb.dbo.backupset 
where type='D' and database_name = 'cw_ehr'
order by backup_start_date


where type='D' and backup_start_date>= convert(varchar, dateadd(day, -1, getdate()), 102)

-- select all the databases which have not been backed up in the last 24 hours.
select name from master.dbo.sysdatabases db
where name not in ('tempdb','distribution')
	and db.status & 512 != 512
	and not exists (select * from msdb.dbo.backupset 
					where database_name=db.name and type='D' 
							and backup_start_date>= dateadd(day, -1, getdate()))


-- create a snapshot database 
if (exists (select * from sys.databases where name = 'SPR_Snapshot'))
	drop database SPR_Snapshot

Create database SPR_Snapshot
on (  name = SPR_data, filename = 'H:\MSSQL.2\MSSQL\Data\SPR_Snapshot.ss')
as snapshot of SPR

-- if @@servername return NULL
Use Master
go
Sp_DropServer 'instance name'
GO
Use Master
go
Sp_Addserver 'instance name', 'local'
GO
Stop and Start SQL Services


/**************************************************

	 Security issue for SQL 2005 before SP3
	
****************************************************/
-- deny access to public
USE [master] 
GO 
DENY EXECUTE ON [sys].[sp_replwritetovarbin] TO [public] 
GO  

-- if you also want to drop sp_replwritetovarbin extended stored procedure
USE [master] 
GO 
EXECUTE dbo.sp_dropextendedproc 'sp_replwritetovarbin' 
GO 
 
/***************************************************
	upgrade SQL 2005 from ...
****************************************************/
start /wait setup.exe ADDLOCAL=SQL_Engine INSTANCENAME=OVOPS UPGRADE=SQL_Engine SKUUPGRADE=1 /qb

/***********************************
	uninstall SQL 2005 completely
************************************/
"%ProgramFiles%\Microsoft SQL Server\90\Setup Bootstrap\ARPWrapper.exe /Remove"


/***************************************************

	temporary save for Backup report project
	
*****************************************************/
-- list the latest backup for all the database
select m.* 
from PHSA_BackupHistory m join Current_PHSA_DB db 
	on m.instance_name=db.instance_name and m.database_name=db.database_name
where backup_start_date = 
	(select max(backup_start_date) from PHSA_BackupHistory n 
	 where m.instance_name=n.instance_name and m.database_name=n.database_name)
	and type ='D'
order by m.instance_name,m.database_name

-- no backup yesterday

select db.* from metadata.dbo.current_PHSA_DB db join ServerList sl on db.instance_name=sl.instancename
where ( sl.NeedBackup='Y' 
		or exists (select * from metadata.dbo.PHSA_DBBackup_flag fg 
					where fg.database_name=db.database_name and fg.instance_name=db.instance_name and fg.backup_flag='Y')
	) -- list all the databases which need to be backed up
	and not exists (select * from metadata.dbo.PHSA_BackupHistory HIS
					where HIS.database_name=db.database_name and HIS.type='D' 
							and HIS.backup_start_date>= dateadd(day, -1, getdate()))
	and  not exists (select * from metadata.dbo.PHSA_DBBackup_flag fg 
					where fg.database_name=db.database_name and fg.instance_name=db.instance_name and fg.backup_flag='N')
order by db.instance_name

-- insert the databases which don't need the backup
insert into phsa_dbbackup_flag (instance_name,database_name)
select db.instance_name,db.database_name from metadata.dbo.current_PHSA_DB db join ServerList sl on db.instance_name=sl.instancename
where sl.NeedBackup='Y' 
	and not exists (select * from metadata.dbo.PHSA_BackupHistory HIS
					where HIS.database_name=db.database_name and HIS.type='D' 
							and HIS.backup_start_date>= dateadd(day, -1, getdate()))
	and  not exists (select * from metadata.dbo.PHSA_DBBackup_flag fg 
					where fg.database_name=db.database_name and fg.instance_name=db.instance_name and fg.backup_flag='N')
	and instance_name = 'SRVHEAT01'
order by db.instance_name

insert into PHSA_DBBackup_flag (instance_name,database_name) values ('QUADRANT','ESP_Train')


-- show the latest backups for the databases which did not have backup yesterday.
select v_no_backup_yesterday.instance_name, v_no_backup_yesterday.database_name, v_no_backup_yesterday.created,
	v_latest_backup.*
from 
(select db.* from metadata.dbo.current_PHSA_DB db join ServerList sl on db.instance_name=sl.instancename
where ( sl.NeedBackup='Y' 
		or exists (select * from metadata.dbo.PHSA_DBBackup_flag fg 
					where fg.database_name=db.database_name and fg.instance_name=db.instance_name and fg.backup_flag='Y')
	) -- list all the databases which need to be backed up
	and not exists (select * from metadata.dbo.PHSA_BackupHistory HIS
					where HIS.database_name=db.database_name and HIS.type='D' 
							and HIS.backup_start_date>= dateadd(day, -1, getdate()))
	and  not exists (select * from metadata.dbo.PHSA_DBBackup_flag fg 
					where fg.database_name=db.database_name and fg.instance_name=db.instance_name and fg.backup_flag='N')
) v_no_backup_yesterday
left join 
(
select m.* 
from PHSA_BackupHistory m join Current_PHSA_DB db 
	on m.instance_name=db.instance_name and m.database_name=db.database_name
where backup_start_date = 
	(select max(backup_start_date) from PHSA_BackupHistory n 
	 where m.instance_name=n.instance_name and m.database_name=n.database_name  and type='D')
	and type ='D'
) v_latest_backup
on v_no_backup_yesterday.instance_name = v_latest_backup.instance_name
	and v_no_backup_yesterday.database_name= v_latest_backup.database_name
order by v_no_backup_yesterday.instance_name, v_no_backup_yesterday.database_name

