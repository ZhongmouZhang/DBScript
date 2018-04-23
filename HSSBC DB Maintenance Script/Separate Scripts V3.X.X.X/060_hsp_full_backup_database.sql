
/********************************************************************

		Full Backup Stored Procedure
		
*********************************************************************/
use master
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_full_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_full_backup_database
GO

CREATE         proc dbo.hsp_full_backup_database 
as
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @dbname varchar(128)


-- backup all the databases in #temp table
set @dbname = ''
while 1=1
begin 
	select @dbname =MIN(dbname) from #temp where dbname>@dbname
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
	exec hsp_delete_obsolete_backup 1, @dbname

	exec hsp_test_create_subfolder @path,@dbname
	set @path = @path + @dbname + '\'
	 
	select @dest=@path + @dbname + '_Full_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.bak'
	
	-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
	if exists (select * from master.dbo.tbl_maint_setting 
				where parameter_name='#litespeed_for_full_backup' and parameter_value = 'Y')
	begin
		set @stt = 'xp_backup_database @database = ''' + @dbname + ''', @filename = ''' + @dest + ''''
	end
	else
	begin
		set @stt = 'backup database [' + @dbname + '] to Disk=''' + @dest + ''' with init,stats'
		if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
			charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
		begin
			-- backup database @dbname to Disk=@dest with init,stats, compression
			set @stt = @stt + ', compression'
		end
	end

	print 'Full backup command: ' + @stt
	print ' '
	EXEC (@stt)
	
	if (@@error != 0)
	begin
		raiserror ('Full backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
end

go
  