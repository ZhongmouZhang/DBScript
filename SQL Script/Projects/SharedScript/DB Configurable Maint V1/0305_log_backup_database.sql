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
declare @path varchar(512)
declare @stt varchar (5000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)
declare @to_str varchar(500)

-- Is it time to do full backup
if exists 
	(select * from master.dbo.tbl_maint_setting
			where  parameter_name= '#full_backup_time' 
				and getdate() between convert (datetime, CONVERT(varchar(30), getdate(), 102) + ' ' + parameter_value + ':00')
							 and dateadd(minute, 10, convert (datetime, CONVERT(varchar(30), getdate(), 102) + ' ' + parameter_value + ':00'))
	)
begin 
	exec dbo.hsp_full_backup_database 2,''  -- doing the backup based on the settting table
end

-- whether it needs a full backup for mirroring databases
exec hsp_mirror_db_failover_fullbackup

-- backup the all of the databases logs
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

insert into #temp 
SELECT rtrim(name)
FROM master.dbo.sysdatabases  
WHERE name NOT IN ('master','model','msdb','tempdb')  
   AND DATABASEPROPERTYEX(name, 'Recovery') IN ('FULL','BULK_LOGGED') 
   and  status & 512 != 512
   and  status & 32 != 32
   and  status & 1024 != 1024 --ready only
order by name

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
	
	-- make a log backup only after there is a full backup for the database.
	if exists (select * from msdb.dbo.backupset where type = 'D' and database_name = @dbname)
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
 