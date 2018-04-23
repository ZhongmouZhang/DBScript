print '----------------------------- Running 03_post_installation.sql ----------------------------'
print 'execution time: ' + convert(varchar(32),getdate())
print ''
print ''

/**************************************************************

	Configure the tempDB based on the CPU number

***************************************************************/
declare @cpu_count int, @cmdstr nvarchar(3000), @count int;

select @cpu_count = [cpu_count] FROM [sys].[dm_os_sys_info]

ALTER DATABASE tempdb
MODIFY FILE (NAME = tempdev, FILENAME = 'J:\SQL_TempDB\tempdb.mdf', SIZE = 2048, filegrowth = 512 MB);

ALTER DATABASE tempdb
MODIFY FILE (NAME = templog, FILENAME = 'J:\SQL_TempDB\templog.ldf', filegrowth = 256 MB);

set @count = 2;
while @count <= @cpu_count
begin
	set @cmdstr = 'ALTER DATABASE tempdb add FILE (NAME = tempdev' 
				+ convert(varchar(2),@count) 
				+ ', FILENAME = ''J:\SQL_TempDB\tempdb'
				+ convert(varchar(2),@count)
				+'.mdf'', SIZE = 2048, filegrowth = 512 MB)'
	print @cmdstr
	exec (@cmdstr)
	set @count = @count + 1;
end

go

/***************************************************************

	Set backup compression to 1

****************************************************************/
USE master;
GO
EXEC sp_configure 'backup compression default', '1';
RECONFIGURE WITH OVERRIDE;

go

/*********************************************************

	send notification email to declare the finish of installation

**********************************************************/
declare @mail_body varchar(4000), @mail_subject varchar(256);
set @mail_subject = 'SQL Server is Installed on ' + @@SERVERNAME + ' Successfully'
set @mail_body = 'The SQL Server Edition is 
	' + @@VERSION
	EXEC msdb.dbo.sp_send_dbmail
		@profile_name = 'Database Services',
		@recipients = N'james.zhang@hssbc.ca', 
		-- @recipients = N'HSSBCTSDatabaseServices@hssbc.ca', 
		@body = @mail_body, 
		@subject = @mail_subject
go



