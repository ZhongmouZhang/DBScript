
USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_restore_latest_cais_full_backup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_restore_latest_cais_full_backup
GO



create  proc dbo.hsp_restore_latest_cais_full_backup

@source_dbname varchar(100),
@dest_dbname varchar(100),
@path varchar(200),
@with_clause varchar(1000)
as
declare @filename varchar(100), @filename_second varchar(100)
declare @stt nvarchar(2000),@spidstr varchar(4000)

-- get the latest backup file name
set @stt = 'dir ' + @path + ' /B'
CREATE TABLE #fileList(line varchar(2000))
INSERT INTO #fileList 
     EXEC xp_cmdshell @stt
SELECT @filename_second= min(line) FROM #fileList 
WHERE line like  @source_dbname + '%.bak'

SELECT @filename=max(line) FROM #fileList 
WHERE line like  @source_dbname + '%.bak'


--print 'Filename=' + @filename
--print 'filename_second=' + @filename_second

--Drop table #fileList

-- Kill the connection 
set @spidstr=''
SELECT @spidstr=coalesce(@spidstr,',' )+'kill '+convert(varchar, spid)+ '; '
FROM master..sysprocesses WHERE dbid=db_id(@dest_dbname)
IF LEN(@spidstr) > 0 
BEGIN
	print @spidstr
	--EXEC(@spidstr)
END

--restore the database 
if (@filename is not null)
begin
	set @stt = 'restore database ' + @dest_dbname + 
	' from Disk = ''' + @path + @filename + '''
	' + @with_clause

	print @stt
	EXEC(@stt)
	
end

if @@error!=0
begin
	set @stt = 'restore database ' + @dest_dbname + 
	' from Disk = ''' + @path + @filename_second + '''
	' + @with_clause

	print @stt
	EXEC(@stt)
-- send out the alert email if there is no full backup or the restore fails
	if (@@error!=0 or @filename is null)
	begin	
		print 'Something Wrong'	
		EXEC usp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = 'jzhang2@phsa.ca',
			@Subject = 'full backup reastore of CAIS on SVMCAISDB03 failed', 
			@Body = 'Please check it'
	end
end

truncate table master.dbo.tbl_last_log_applied


 


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

