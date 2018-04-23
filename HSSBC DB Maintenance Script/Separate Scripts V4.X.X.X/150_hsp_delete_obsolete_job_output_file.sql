/*********************************************************************

		Delete the job output file older than the retention day

**********************************************************************/
 
use [master]
go

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_delete_obsolete_job_output_file') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_delete_obsolete_job_output_file
GO

CREATE         proc dbo.hsp_delete_obsolete_job_output_file
as

declare @path varchar(1024)
declare @filename varchar (512)
declare @stt varchar (5000)
declare @RetentionDay int

-- delete the existing full backups

-- create the two temp tables for candidate file list
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#DeletingFileList') and xtype='U')
drop table #DeletingFileList
CREATE TABLE #DeletingFileList(line varchar(2000))

select @path = parameter_value from master.dbo.tbl_maint_parameter
where parameter_name = '#job_output_folder' 

select @RetentionDay = parameter_value from master.dbo.tbl_maint_parameter
where parameter_name = '#job_output_file_retention_day' 

set @stt = 'dir "' + @path + '\output_log_????????_??????.txt" /S /B'  -- return the full path for the candidate files
INSERT INTO #fileList 
EXEC xp_cmdshell @stt


insert into #DeletingFileList
SELECT line FROM #fileList 
where dateadd(hour,-@RetentionDay*24+5,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+ SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))


-- delete the to-be-deleted files
set @path = ''
while 1=1
begin 
	select @path = MIN(line) from #DeletingFileList where line > @path 
	if @path is null
		break
	set @stt = 'del "' + @path + '"'
	exec master.dbo.xp_cmdshell @stt
	-- print @stt
end

go


