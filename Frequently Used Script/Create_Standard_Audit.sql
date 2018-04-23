
 
/*********************************************************************

	Test if there is a corresponding database subfolder in a specified 
	path. If not, create one for the database
	
**********************************************************************/

use master
go 

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_test_create_subfolder') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_test_create_subfolder
GO

-- hsp_TestCreateSubfolder '\\srvnetapp03\SQL_Back$\ZVMSQ2K801\', 'master'

CREATE         proc hsp_test_create_subfolder
@path varchar(1024),
@dbname varchar(1024)
as

declare @stt varchar (5000)

-- delete the existing full backups
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#subfolderList') and xtype='U')
drop table #subfolderList
CREATE TABLE #subfolderList(line varchar(2000))

set @stt = 'dir "' + @path + '" /B /A:D'
INSERT INTO #subfolderList 
EXEC xp_cmdshell @stt

--select * from #subfolderList

if not exists (select * from #subfolderList where line = @dbname)
begin 
	set @stt = 'md "' + @path + @dbname +'" '
	EXEC xp_cmdshell @stt
end

go
-- select * from #subfolderList





USE [master]
GO

/****** Object:  Audit [standard_audit]    Script Date: 11/14/2017 4:31:22 PM ******/
declare @stt nvarchar(4000)
declare @subfolder varchar(500)
set @subfolder = 'SQL_Audit\' + replace(@@servername,'\','_')
exec hsp_test_create_subfolder 'K:\', @subfolder


if not exists (select * from sys.server_audits where name = 'standard_audit')
begin
	
	set @stt = 'create SERVER AUDIT [standard_audit]
	TO FILE 
	(	FILEPATH = ''K:\audit\' + replace(@@servername,'\','_')  + '\''
		,MAXSIZE = 100 MB
		,MAX_ROLLOVER_FILES = 30
		,RESERVE_DISK_SPACE = OFF
	)
	WITH
	(	QUEUE_DELAY = 1000
		,ON_FAILURE = CONTINUE
		
	)'
	exec (@stt)
	alter SERVER AUDIT [standard_audit] with (STATE = on);
end

if not exists (select * from sys.server_audit_specifications where name = 'standard_audit_specification')
begin
	create server audit specification standard_audit_specification
	for server audit standard_audit
	add (DATABASE_CHANGE_GROUP)
	,add (DATABASE_PERMISSION_CHANGE_GROUP)
	,add (DATABASE_PRINCIPAL_CHANGE_GROUP)
	,add (DATABASE_ROLE_MEMBER_CHANGE_GROUP)
	,add (SERVER_PERMISSION_CHANGE_GROUP)
	,add (SERVER_PRINCIPAL_CHANGE_GROUP)
	,add (SERVER_ROLE_MEMBER_CHANGE_GROUP)
	with (state=on);
end


GO


