 
 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_restore_latest_universal_backup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_restore_latest_universal_backup
GO

/*
	hsp_restore_latest_universal_backup 
		@source_dbname = 'SPR',
		@dest_dbname = 'SPRTest',
		@path = '\\vpngsqa02\backup$\',
		@with_clause = 	'with move ''SPR_Data'' to ''D:\MSSQL.1\MSSQL\Data\SPRTES_Data.mdf'',
		move ''SPR_Log'' to ''D:\MSSQL.1\MSSQL\Data\SPRTEST_Log.ldf'',
	replace'

	
*/
CREATE         proc dbo.hsp_restore_latest_universal_backup
@source_dbname varchar(100),
@dest_dbname varchar(100),
@path varchar(200),
@with_clause varchar(1000)
as
declare @filename varchar(100)
declare @stt nvarchar(2000),@spidstr varchar(4000)

	if (@@version like 'Microsoft SQL Server 2005%' or @@version like 'Microsoft SQL Server 2008%')
	begin
		exec sp_configure 'Ole Automation Procedures', '1'
		exec sp_configure 'xp_cmdshell', '1'
		reconfigure
	end

-- get the latest backup file name
set @stt = 'dir ' + @path + ' /B'
CREATE TABLE #fileList(line varchar(2000))
INSERT INTO #fileList 
     EXEC xp_cmdshell @stt
SELECT @filename=line FROM #fileList 
WHERE line like  @source_dbname + '[_]FULL[_]%'
	and right(line,19) = 
			(select max(right(line,19)) from #fileList 
				where line like @source_dbname + '[_]FULL[_]%' and len(line)=len(@source_dbname)+25)
Drop table #fileList

-- Kill the connection 
set @spidstr=''
SELECT @spidstr=coalesce(@spidstr,',' )+'kill '+convert(varchar, spid)+ '; '
FROM master..sysprocesses WHERE dbid=db_id(@dest_dbname)
IF LEN(@spidstr) > 0 
BEGIN
	--print @spidstr
	EXEC(@spidstr)
END

--restore the database 
if (@filename is not null)
begin
	set @stt = 'restore database ' + @dest_dbname + 
	' from Disk = ''' + @path + @filename + '''
	' + @with_clause

	--EXEC(@stt)
	print @stt
end

-- send out the alert email if there is no full backup or the restore fails
if (@@error!=0 or @filename is null)
begin	
	print 'Something Wrong'	
	EXEC usp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = 'SQL_Support@phsa.ca',
			@Subject = 'Restoring SPRTest on ZVMCOG06 failed', 
			@Body = 'Please check the backup on the server'
end


 
