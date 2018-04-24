
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

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.dbo.#tbl_disk_space_alert') and xtype='U')
drop table #tbl_disk_space_alert
create table #tbl_disk_space_alert (
 drive char(1), 
 free_mb int)


declare @str varchar(512)

INSERT INTO #free_space exec xp_fixeddrives

insert into #tbl_disk_space_alert
	select drive, free_mb from #free_space 
	where		
		(
			free_mb <
			(	select parameter_value from master.dbo.tbl_maint_setting 
				where parameter_name = '#free_disk_space_threshold' and database_name = 'default'
			) 		
			and 
			not drive in (	select database_name from master.dbo.tbl_maint_setting 
							where parameter_name = '#excluded_from_default_disk_space_check'
						  )
		)
		or 
			free_mb <
			(	select parameter_value from master.dbo.tbl_maint_setting 
				where parameter_name = '#free_disk_space_threshold' and database_name = drive
			)
	

-- select * from temp_alert_list_998990123

if (exists (select * from #tbl_disk_space_alert))
BEGIN
	DECLARE	@MailSubject nvarchar(60), @MailMsg varchar(70)
	-- build the subject --
	SET @MailSubject = 'Disk Space Alert on ' + @@SERVERNAME
	-- construct mail body
	declare @mail_body varchar(8000)
	declare @drive_id char(1), @free_mb int
	set @mail_body = 
'drive free_mb
----- ------------
'
	set @drive_id = ''
	while 1=1
	begin 
		select @drive_id = min(drive) from #tbl_disk_space_alert  where drive > @drive_id
		if @drive_id is null
			break
		select @free_mb = free_mb from #tbl_disk_space_alert where drive = @drive_id
		set @mail_body = @mail_body + @drive_id + SPACE(5)+ RIGHT(SPACE(12) + convert(varchar,@free_mb),12) +'
'
	end
		  -- send the message --
	EXEC msdb.dbo.sp_send_dbmail
		@profile_name = 'Database Services',
		--@recipients = N'james.zhang@hssbc.ca', 
		@recipients = N'HSSBCTSDatabaseServices@hssbc.ca', 
		@body = @mail_body, 
		@subject = @MailSubject
END


SET NOCOUNT OFF

go

 