 
1.  Ensure target server is same build revision as source server.  Patch accordingly.

2.  Start target server in single user mode (sqlservr -s <instancename> -c -m -f)

3.  Connect to SQL Server using sqlcmd

 restore database master 
from disk = 'K:\From_SRVEHDB01\Full_Backup\SRVEHDB01_master_Adhoc_20120511_141400.bak'
with replace, recovery

4. start server with sqlservr -c -m -f -T3608

use master

exec sp_detach_db 'msdb' 
go 
exec sp_detach_db 'model' 
go 

 -T3608
use master 
go 
exec sp_attach_db 'model', 'H:\SQL_Data\MSSQL\Data\model.mdf', 'H:\SQL_Data\MSSQL\Data\modellog.ldf' 
go 

exec sp_attach_db 'msdb', 'H:\SQL_Data\MSSQL\Data\msdbdata.mdf', 'H:\SQL_Data\MSSQL\Data\msdblog.ldf' 
go 

alter database tempdb modify file (name = tempdev
   , filename = 'H:\SQL_Data\MSSQL\Data\tempdb.mdf') 
go 
alter database tempdb modify file (name = templog
   , filename = 'H:\SQL_Data\MSSQL\Data\templog.ldf') 
go 


--  detach user databsae

exec sp_detach_db 'MisysEVE' 
go 

exec sp_detach_db 'NBSORU' 
go 

exec sp_detach_db 'affinity_live' 
go 

exec sp_detach_db 'cw_ehr' 
go 

exec sp_detach_db 'scratch' 
go 


5. start server with sqlservr -c 

restore database model
from disk = 'K:\From_SRVEHDB01\Full_Backup\SRVEHDB01_model_Adhoc_20120511_141500.bak'
with replace, STATS

go
	

restore database msdb
from disk = 'K:\From_SRVEHDB01\Full_Backup\SRVEHDB01_msdb_Adhoc_20120511_141400.bak'
with replace, STATS

go

/********************************************


*********************************************/	
6. Change @@Servername

use master
go

select @@servername

sp_dropserver 'SRVEHDB01'
go

sp_addserver 'SRVEHDB01T', 'local'
go

7. check job originating_server value


-- verify if all jobs have the correct server name for originating_server
-- If not, update this value with the correct server name by running following script
SELECT *
FROM msdb..sysjobs

USE msdb
GO
DECLARE @server sysname
SET @server = CAST(SERVERPROPERTY('ServerName')AS sysname)
UPDATE sysjobs
SET originating_server = @server
WHERE originating_server = 'srvehdb01'


8. Enable Jobs

DECLARE @job_id UNIQUEIDENTIFIER

SET @job_id = 'D6226B53-BB0E-426A-A041-FD16110ACE6F'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = 'BE74B520-C55F-44E2-AD99-3B9FDB54429D'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = '462691E0-6DC6-4710-8A69-2D03D8D7D843'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = '78652085-AA81-4DEA-8CEC-725C639878AD'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = '960B6B13-9F20-4B86-926A-643D286C38A4'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = '2D485937-63D2-40F0-AC06-F5D3BFA39607'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = 'B4733317-B9B1-4294-9887-568806528720'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = '8B900114-10D8-431F-849B-B423CA2213E2'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = 'FB07C15A-069A-4572-B025-D011F7FA37FC'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = 'DF98B334-0F80-4ED2-8DC6-C621A76664DD'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = 'AE2A7931-72F0-4F46-9DD4-B149BF70E258'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = '68606406-CA32-4538-84BE-4D684D8B9B3E'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = 'DADBA970-B39B-47D6-A607-F4B7AD1BE8B5'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = 'C58882F7-BFC9-4E32-ACDD-AC1B39505654'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = '40E85840-AE07-4428-8D0F-EA228D460D43'
EXEC sp_update_job @job_id = @job_id , @enabled = 1

SET @job_id = '43CD357D-34AA-401F-B242-346230A38E68'
EXEC sp_update_job @job_id = @job_id , @enabled = 1



9. Enable AWE

sp_configure 'show advanced options', 1
RECONFIGURE
GO
sp_configure 'awe enabled', 1
RECONFIGURE
GO
sp_configure 'max server memory', 7000
RECONFIGURE
GO
