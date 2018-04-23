 use [master]
go


/********************************************************************

		Manually Full Backup Stored Procedure 
		
		exec hsp_full_backup_database 3, 'TEST'
*********************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_manual_full_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_manual_full_backup_database
GO

CREATE         proc dbo.hsp_manual_full_backup_database 
@dbname varchar(500) = ''  
	-- '': backup all databases; '<db_name.' backup the specified db
as
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)
declare @to_str varchar(500)


-- create a temp table for the database name
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)


if @dbname = ''   -- backup all the database on the instance  
begin
	insert into #temp 
	select rtrim(name) from master.dbo.sysdatabases db
	where name not in ('tempdb','distribution')
		and  status & 512 != 512 -- off line 
		and  status & 32 != 32
		and  status & 1024 != 1024 --ready only 
			--and db.status & 1073741824  != 1073741824  -- cleanly shutdown
end
else    -- backup an individual database
begin  		
	insert into #temp values(@dbname)
end		

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
	--print @dest

	backup database @dbname to Disk=@dest with init,stats
	if (@@error != 0)
	begin
		raiserror ('Full backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
end

go


 