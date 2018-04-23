USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_adhoc_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_adhoc_backup_database
GO


create        proc [dbo].hsp_adhoc_backup_database
as
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @database_name varchar(128)
declare @id int
declare @action varchar(64)
declare	@mail_subject nvarchar(600), @mail_body varchar(700), @email_address varchar(800)



select @id = MIN(id)
from dbo.tbl_maint_action 
where next_start_date_time < GETDATE()
		and ( last_start_date_time is null or last_start_date_time < next_start_date_time)
		and [action] = '#adhoc_backup'
		
if (@id is null)
	goto _the_end
		
select @action = [action] , @database_name = database_name
from dbo.tbl_maint_action
where [id]=@id
	
update tbl_maint_action
set last_start_date_time = GETDATE(), [status] = 'running'
where [id]=@id
	
exec hsp_maint_log @is_begin='Y', @action=@action
	
	

-- adhoc backup a databases
	
-- select the backup folder
select @path = dbo.hfn_get_backup_path('#adhoc_backup_folder',@database_name)
select @email_address = dbo.hfn_get_backup_path('#adhoc_backup_notification_email',@database_name)
if @path is null
	goto _the_end 

exec hsp_test_create_subfolder @path,@database_name
set @path = @path + @database_name + '\'
	 
select @dest=@path + @database_name + '_adhoc_' + convert(varchar,getdate(),112)+'_' 
	+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
	+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
	+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
	+'.bak'
	
		set @stt = 'backup database [' + @database_name + '] to Disk=''' + @dest + ''' with init,stats'
		if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
			charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
		begin
			-- backup database @dbname to Disk=@dest with init,stats, compression
			set @stt = @stt + ', compression'
		end
	
EXEC (@stt)

if @@ERROR = 0
begin 
	set @mail_subject = 'The adhoc backup of ' +@@SERVERNAME + '\' + @database_name + ' is done'
	set @mail_body = 'The backup file name: ' + @dest
	EXEC msdb.dbo.sp_send_dbmail
		@profile_name = 'Database Services',
		--@recipients = N'james.zhang@hssbc.ca', 
		@recipients = @email_address, 
		@body = @mail_body, 
		@subject = @mail_subject
end 


	
update tbl_maint_action
set [status] = 'successful'
where [id]=@id

exec hsp_maint_log 'N', @action

-- calculating the next run time
exec hsp_calculate_next_run_time
 
	

_the_end:

go


