 use [master]
go


/********************************************************************

		Log Backup Stored Procedure
		
*********************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_log_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_log_backup_database
GO

CREATE         proc dbo.hsp_log_backup_database
as
declare @dbname varchar(500)
declare @dest varchar(1000)
declare @dest_bak varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)


set @dbname = ''
while 1=1
begin 
	select @dbname = min(dbname) from #temp where dbname > @dbname
	if @dbname is null
		break
	-- select the backup folder
	if not exists ( select * from master.dbo.tbl_maint_setting 
					where database_name=@dbname and parameter_name='#backup_folder')
		select @path = parameter_value 
		from master.dbo.tbl_maint_setting 
		where database_name='default' and parameter_name='#backup_folder'
	else
		select @path = parameter_value 
		from master.dbo.tbl_maint_setting 
		where database_name=@dbname and parameter_name='#backup_folder'
	
	-- delete the obsolete full backup of the database
	exec hsp_delete_obsolete_backup 2, @dbname

	-- test if the corresponding folder exists
	exec hsp_test_create_subfolder @path,@dbname
	set @path = @path + @dbname + '\'
	
	select @dest=@path + @dbname + '_Log_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.trn'
	--print @dest
	
	-- make a full backup for newly created database.
	if ( select last_log_backup_lsn from master.sys.database_recovery_status where database_id = db_id(@dbname)) is null
	begin 
		set @dest_bak = REPLACE(@dest,'.trn','.bak')
		backup database @dbname to Disk=@dest_bak with init,stats
	end

	backup log @dbname to Disk=@dest with  Stats 
	if (@@error != 0)
	begin
		raiserror ('Log backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
end

go 


-- log the script version
-- Add three stored procedures for the mirroring database full backup
-- hsp_FullBackupASpecifiedDB, hsp_Mirror_DBFailoverTime, hsp_Mirror_DBFailover_Fullbackup

--exec master.dbo.hsp_ScriptVersionControl 'Backup', '1.0.1.0'   
 
go 


-- log the script version
-- Add three stored procedures for the mirroring database full backup
-- hsp_FullBackupASpecifiedDB, hsp_Mirror_DBFailoverTime, hsp_Mirror_DBFailover_Fullbackup

--exec master.dbo.hsp_ScriptVersionControl 'Backup', '1.0.1.0'   
 