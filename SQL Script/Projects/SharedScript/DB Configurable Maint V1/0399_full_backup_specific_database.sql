use [master]
go

/********************************************************************

		Full Backup Stored Procedure to backup a specified database
		
exec hsp_full_backup_specific_database 'master'
*********************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_full_backup_specific_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_full_backup_specific_database
GO

CREATE         proc dbo.hsp_full_backup_specific_database @dbname sysname
as

declare @dest varchar(1000)
declare @path varchar(512)

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
	
-- test/create corresponding subfolder
exec hsp_test_create_subfolder @path,@dbname
set @path = @path + @dbname + '\'
	 
select @dest=@path + @dbname + '_Full_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.bak'
--select @dest

backup database @dbname to Disk=@dest with init,stats
if (@@error != 0)
begin
	raiserror ('Full backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
end

go


 