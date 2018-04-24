/********************************************************

	Check free disk space
	
*********************************************************/

USE [master]
GO
IF OBJECTPROPERTY ( object_id('hsp_check_disk_space'),'IsProcedure') = 1
	DROP PROC hsp_check_disk_space
GO

CREATE PROC hsp_check_disk_space 
AS
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#free_space') and xtype='U')
drop table #free_space
CREATE TABLE #free_space(
 drive char(1), 
 free_mb int)

if exists (select * from sysobjects where id = object_id(N'temp_alert_list_998990123') and xtype='U')
drop table temp_alert_list_998990123
create table temp_alert_list_998990123 (
 drive char(1), 
 free_mb int)


declare @str varchar(512)

INSERT INTO #free_space exec xp_fixeddrives

insert into temp_alert_list_998990123
	select drive, free_mb from #free_space 
	where free_mb <
		(	select parameter_value from master.dbo.tbl_maint_setting 
			where parameter_name = '#free_disk_space_threshold' and database_name = 'default'
		)
		or 
		free_mb <
		(	select parameter_value from master.dbo.tbl_maint_setting 
			where parameter_name = '#free_disk_space_threshold' and database_name = drive
		)
		

-- select * from temp_alert_list_998990123

if (exists (select * from temp_alert_list_998990123))
BEGIN
	DECLARE	@MailSubject varchar(60), @MailMsg varchar(70)
	-- build the subject --
	SET @MailSubject = 'Disk Space Alert on ' + @@SERVERNAME
	
		  -- send the message --
	EXEC msdb.dbo.sp_send_dbmail
		@profile_name = 'Database Services',
		--@recipients = N'james.zhang@hssbc.ca', 
		@recipients = N'HSSBCTSDatabaseServices@fraserhealth.ca', 
		@query = 'select distinct * from temp_alert_list_998990123', 
		@subject = @MailSubject
END

if exists (select * from sysobjects where id = object_id(N'temp_alert_list_998990123') and xtype='U')
drop table temp_alert_list_998990123

SET NOCOUNT OFF
go
