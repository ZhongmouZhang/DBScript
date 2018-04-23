 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_sendcdomail') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_sendcdomail
GO


CREATE PROCEDURE hsp_sendcdomail
   @From varchar(1000) ,
   @To varchar(1000) ,
   @Subject varchar(1000)=" ",
   @Body varchar(4000) =" "
   
   
/*********************************************************************

This stored procedure takes the parameters and sends an e-mail.
All the mail configurations are hard-coded in the stored procedure.
Comments are added to the stored procedure where necessary.
References to the CDOSYS objects are at the following MSDN Web site:
http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cdosys/html/_cdosys_messaging.asp

***********************************************************************/
   AS
   Declare @iMsg int
   Declare @hr int
   Declare @source varchar(255)
   Declare @description varchar(500)
   Declare @output varchar(1000)


--************* Create the CDO.Message Object ************************
   EXEC @hr = sp_OACreate 'CDO.Message', @iMsg OUT

--***************Configuring the Message Object ******************
-- This is to configure a remote SMTP server.
-- http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cdosys/html/_cdosys_schema_configuration_sendusing.asp
   EXEC @hr = sp_OASetProperty @iMsg, 'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/sendusing").Value','2'
-- This is to configure the Server Name or IP address.
-- Replace MailServerName by the name or IP of your SMTP Server.
   EXEC @hr = sp_OASetProperty @iMsg, 'Configuration.fields("http://schemas.microsoft.com/cdo/configuration/smtpserver").Value', 'srvexht01' -- New PNG Mail Relay: SVMPNGSMTP
																				-- 10.1.46.51 PGN mail server

-- Save the configurations to the message object.
   EXEC @hr = sp_OAMethod @iMsg, 'Configuration.Fields.Update', null

-- Set the e-mail parameters.
   EXEC @hr = sp_OASetProperty @iMsg, 'To', @To
   EXEC @hr = sp_OASetProperty @iMsg, 'From', @From
   EXEC @hr = sp_OASetProperty @iMsg, 'Subject', @Subject

-- If you are using HTML e-mail, use 'HTMLBody' instead of 'TextBody'.
   EXEC @hr = sp_OASetProperty @iMsg, 'TextBody', @Body
   
   --   EXEC @hr = sp_OAMethod @iMsg, 'AddAttachment', NULL, @attachment

   EXEC @hr = sp_OAMethod @iMsg, 'Send', NULL

-- Sample error handling.
   IF @hr <>0
     select @hr
     BEGIN
       EXEC @hr = sp_OAGetErrorInfo NULL, @source OUT, @description OUT
       IF @hr = 0
         BEGIN
           SELECT @output = '  Source: ' + @source
           PRINT  @output
           SELECT @output = '  Description: ' + @description
           PRINT  @output
         END
       ELSE
         BEGIN
           PRINT '  sp_OAGetErrorInfo failed.'
           RETURN
         END
     END

-- Do some error handling after each step if you have to.
-- Clean up the objects created.
   EXEC @hr = sp_OADestroy @iMsg
   
GO


/*********************************************************************

		Delete the backup older than the retention day
		
**********************************************************************/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_DeleteOldBackup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_DeleteOldBackup
GO

CREATE         proc dbo.hsp_DeleteOldBackup
@flag int -- 1: delete full backup   2: delete log backup
as

declare @path varchar(1024)
declare @filename varchar (512)
declare @stt varchar (5000)
declare @RetentionDay int

-- delete the existing full backups
if (@@version like 'Microsoft SQL Server 2005%' or @@version like 'Microsoft SQL Server 2008%')
begin
	exec sp_configure 'show advanced option', '1'
	reconfigure
	exec sp_configure 'Ole Automation Procedures', '1'
	exec sp_configure 'xp_cmdshell', '1'
	reconfigure
end

select @RetentionDay = convert(int,path) from dbo.BackupParameter where dbname = '#RetentionDay'
--print @RetentionDay

CREATE TABLE #fileList(line varchar(2000))
CREATE TABLE #DeletingFileList(line varchar(2000))

declare myCur_path_full cursor for
select distinct path from master.dbo.BackupParameter where excluded != 1 and not dbname like '#%'
open myCur_path_full 
fetch next from myCur_path_full into @path
while @@fetch_status=0
begin
	-- get the file list in the folder
	
	set @stt = 'dir "' + @path + '" /B'

	truncate table #fileList
	INSERT INTO #fileList 
    EXEC xp_cmdshell @stt
    
    if (@flag = 1)  -- delete full backups
		insert into #DeletingFileList
		SELECT @path + line FROM #fileList 
		WHERE line like  '%[_]Full[_]%.bak'
			and LEN (line) > 25
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 18, 8)) = 1
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 9, 6)) = 1
			and dateadd(hour,-@RetentionDay*24+5,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+ SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))
	else 	-- delete log backups			
		insert into #DeletingFileList
		SELECT @path + line FROM #fileList 
		WHERE line like '%[_]Log[_]%.bak'
			and LEN (line) > 25
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 18, 8)) = 1
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 9, 6)) = 1
			and dateadd(day,-@RetentionDay,getdate())>= 
				convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+SUBSTRING(line, LEN(line) - 9, 2)+':'+
							SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2))
	
	fetch next from myCur_path_full into @path
end
close myCur_path_full
deallocate myCur_path_full

declare MyCur_DeletingFile cursor for select line from #DeletingFileList
open MyCur_DeletingFile 
fetch next from MyCur_DeletingFile into @path
while @@fetch_status=0
begin
	set @stt = 'del "' + @path + '"'
	exec master.dbo.xp_cmdshell @stt
	--print @stt
	fetch next from MyCur_DeletingFile into @path
end
close MyCur_DeletingFile
deallocate MyCur_DeletingFile

drop table #fileList
drop table #DeletingFileList

go

/****************************************************************

	SELECT convert (datetime, SUBSTRING(line, LEN(line) - 18, 8)+ ' '+SUBSTRING(line, LEN(line) - 9, 2)+':'+SUBSTRING(line, LEN(line) - 7, 2)+':'+SUBSTRING(line, LEN(line) - 5, 2)), line
	FROM #fileList 
	WHERE (line like  '%[_]FULL[_]%.bak' or line like '%[_]Log[_]%.bak')
			and LEN (line) > 25
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 18, 8)) = 1
			and ISNUMERIC(SUBSTRING(line, LEN(line) - 9, 6)) = 1
			and convert(varchar, dateadd(day,-1,getdate()),112) >= SUBSTRING(line, LEN(line) - 18, 8)

**********************************************************************/



/********************************************************************

		Full Backup Stored Procedure
		
*********************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_FullBackupAllDB') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[hsp_FullBackupAllDB]
GO

CREATE         proc dbo.hsp_FullBackupAllDB 
as
declare @dbname varchar(500)
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)
declare @to_str varchar(500)

-- delete the older full backup
exec hsp_DeleteOldBackup 1

-- backup all the database fully
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

insert into #temp 
select name from master.dbo.sysdatabases db
where name not in ('tempdb','distribution')
	and not exists (select dbname from master.dbo.BackupParameter bp where excluded = 1 and db.name=bp.dbname)
	and db.status & 512 != 512   -- off line 
	--and db.status & 1073741824  != 1073741824  -- cleanly shutdown
order by name

declare myCur_full cursor for 
select dbname from #temp 


open myCur_full
Fetch next from myCur_full into @dbname

while @@fetch_status = 0
begin
	if (not exists (select * from master.dbo.BackupParameter where dbname=@dbname and backuptype='full'))
		select @path = path from master.dbo.BackupParameter where dbname='default'
	else
		select @path = path from master.dbo.BackupParameter where dbname=@dbname  and backuptype='full'
		 
	select @dest=@path + @dbname + '_Full_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.bak'
	-- select @dest

	backup database @dbname to Disk=@dest with init,stats
	if (@@error != 0)
	begin
		set @subject_str = 'backup of the ' +@dbname+ ' database on server ' + @@Servername +' failed'
		select @to_str = path from master.dbo.BackupParameter where dbname='#EmailTo' 
		set @to_str = isnull(@to_str,'phsamonitor@phsa.ca')
		EXEC hsp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = @to_str,
			@Subject = @subject_str, 
			@Body = 'Please check the backup on the server'
	end


	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full

go


/********************************************************************

		Log Backup Stored Procedure
		
*********************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_LogSwitchAndLogBackup') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_LogSwitchAndLogBackup
GO

CREATE         proc dbo.hsp_LogSwitchAndLogBackup
as
declare @dbname varchar(500)
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)
declare @to_str varchar(500)

---- Is it time to do full backup

if exists (select * from master.dbo.BackupParameter 
where dbname = '#FullBackupTime' 
		and datepart(hour,getdate())=convert(int, substring(path,1,2))
		and datepart(minute,getdate())between convert(int, substring(path, 4,2)) and convert(int, substring(path, 4,2))+10)
begin 
--	exec hsp_DeleteOldBackup 1
	exec hsp_FullBackupAllDB
end

-- delete log backups
exec hsp_DeleteOldBackup 2

-- backup the all of the databases logs
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

insert into #temp 
SELECT name  
FROM master.dbo.sysdatabases  
WHERE name NOT IN ('master','model','msdb','tempdb')  
   AND DATABASEPROPERTYEX(name, 'Recovery') IN ('FULL','BULK_LOGGED') 
   and  status & 512 != 512
   and  status & 32 != 32
order by name

declare myCur_full cursor for 
select dbname from #temp 


open myCur_full
Fetch next from myCur_full into @dbname

while @@fetch_status = 0
begin
	if (not exists (select * from master.dbo.BackupParameter where dbname=@dbname and backuptype='Log'))
		select @path = path from master.dbo.BackupParameter where dbname='default'
	else
		select @path = path from master.dbo.BackupParameter where dbname=@dbname  and backuptype='Log'
		 
	select @dest=@path + @dbname + '_Log_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.bak'
	--print @dest

	backup log @dbname to Disk=@dest with  Stats 
	if (@@error != 0)
	begin
		set @subject_str = 'Log backup of the ' +@dbname+ ' database on server ' + @@Servername +' failed'
		select @to_str = path from master.dbo.BackupParameter where dbname='#EmailTo' 
		set @to_str = isnull(@to_str,'phsamonitor@phsa.ca')
		EXEC hsp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = @to_str,
			@Subject = @subject_str, 
			@Body = 'Please check the backup on the server'
	end


	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full

go