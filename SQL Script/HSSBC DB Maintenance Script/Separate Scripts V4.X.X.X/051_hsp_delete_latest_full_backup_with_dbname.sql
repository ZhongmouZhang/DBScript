
/*****************************************************************************

	Delete the latest backup file

******************************************************************************/

use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_delete_latest_full_backup_with_dbname') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_delete_latest_full_backup_with_dbname
GO


CREATE  proc hsp_delete_latest_full_backup_with_dbname
@dbname varchar(100)

as
declare @path varchar(500)
declare @filename varchar(100)
declare @stt nvarchar(2000),@spidstr varchar(4000)

if (@@version like 'Microsoft SQL Server 2005%' or @@version like 'Microsoft SQL Server 2008%')
begin
	exec sp_configure 'Ole Automation Procedures', '1'
	exec sp_configure 'xp_cmdshell', '1'
	reconfigure with override
end

-- get the backup folder
if not exists ( select * from master.dbo.tbl_maint_setting 
				where database_name=@dbname and parameter_name='#backup_folder')
	select @path = parameter_value 
	from master.dbo.tbl_maint_setting 
	where database_name='default' and parameter_name='#backup_folder'
else
	select @path = parameter_value 
	from master.dbo.tbl_maint_setting 
	where database_name=@dbname and parameter_name='#backup_folder'
	

-- get the latest backup file name
set @stt = 'dir ' + @path + @dbname + ' /B'
CREATE TABLE #fileList(line varchar(2000))
INSERT INTO #fileList 
     EXEC xp_cmdshell @stt
SELECT @filename=line FROM #fileList 
WHERE line like  @dbname + '[_]FULL[_]%'
	and right(line,19) = 
			(select max(right(line,19)) from #fileList 
				where line like @dbname + '[_]FULL[_]%' and len(line)=len(@dbname)+25)
Drop table #fileList

--print @path + @dbname + '\' + @filename
set @stt = 'del ' + @path + @dbname + '\' + @filename
exec xp_cmdshell @stt


go



 