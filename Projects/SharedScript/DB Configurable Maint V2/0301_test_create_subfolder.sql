use [master]
go

/*********************************************************************

	Test if there is a corresponding database subfolder in a specified 
	path. If not, create one for the database
	
**********************************************************************/

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
if (@@version like 'Microsoft SQL Server 2005%' or @@version like 'Microsoft SQL Server 2008%')
begin
	exec sp_configure 'show advanced option', '1'
	reconfigure with override
	exec sp_configure 'Ole Automation Procedures', '1'
	exec sp_configure 'xp_cmdshell', '1'
	reconfigure with override
end

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

