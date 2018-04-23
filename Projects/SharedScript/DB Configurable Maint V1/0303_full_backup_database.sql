use [master]
go


/********************************************************************

		Full Backup Stored Procedure
		
		exec hsp_full_backup_database 3, 'TEST'
*********************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_full_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_full_backup_database
GO

CREATE         proc dbo.hsp_full_backup_database 
@flag int ,-- 1: backup all dbs 2: backup the dbs based on the configureation table; 3: backup a specific db
@dbname varchar(500) = ''
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


if @flag = 1   -- backup all the database on the instance  
begin
	insert into #temp 
	select rtrim(name) from master.dbo.sysdatabases db
	where name not in ('tempdb','distribution')
		and not exists (select * from master.dbo.tbl_maint_setting bp 
						where parameter_name = '#excluded_from_default_full_backup' and db.name=bp.database_name)
		and  status & 512 != 512 -- off line 
		and  status & 32 != 32
		and  status & 1024 != 1024 --ready only 
			--and db.status & 1073741824  != 1073741824  -- cleanly shutdown
end
else if @flag = 2  -- backup databases based on the maintenace setting table
begin
	if exists (	select * from master.dbo.tbl_maint_setting
				where  database_name= 'default' 
					and parameter_name = '#full_backup_time'
					and datepart(hour,getdate())=convert(int, substring(parameter_value,1,2))
					and datepart(minute,getdate())between convert(int, substring(parameter_value, 4,2)) 
													and convert(int, substring(parameter_value, 4,2))+10)
	begin  -- it is default full backup time
		insert into #temp 
		select rtrim(name) from master.dbo.sysdatabases db
		where name not in ('tempdb','distribution')
			and not exists (select * from master.dbo.tbl_maint_setting bp 
							where parameter_name in ('#excluded_from_default_full_backup', '#full_backup_time') 
								and db.name=bp.database_name)
			and  status & 512 != 512 -- off line 
			and  status & 32 != 32
			and  status & 1024 != 1024 --ready only 
	end

	insert into #temp 
	select database_name from master.dbo.tbl_maint_setting 
	where parameter_name = '#full_backup_time' and database_name <> 'default'
		and datepart(hour,getdate())=convert(int, substring(parameter_value,1,2))
		and datepart(minute,getdate())between convert(int, substring(parameter_value, 4,2)) 
										and convert(int, substring(parameter_value, 4,2))+10
		and  status & 512 != 512 -- off line 
		and  status & 32 != 32
		and  status & 1024 != 1024 --ready only 
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


 