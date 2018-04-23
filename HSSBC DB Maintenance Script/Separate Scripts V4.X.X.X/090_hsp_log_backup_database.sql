 


/********************************************************************

		Log Backup Stored Procedure
		
*********************************************************************/
use [master]
go

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



truncate table #temp
insert into #temp 
SELECT rtrim(name)
FROM master.sys.databases  
WHERE name NOT IN ('master','model','msdb','tempdb')  
   AND DATABASEPROPERTYEX(name, 'Recovery') IN ('FULL','BULK_LOGGED') 
   and  state = 0
	and is_read_only=0
order by name

set @dbname = ''

while 1=1
begin 
_next_loop:
	select @dbname = min(dbname) from #temp where dbname > @dbname
	if @dbname is null
		break
	-- select the backup folder
	select @path = dbo.hfn_get_backup_path ('#log_backup_folder',@dbname)
	
	-- delete the obsolete full backup of the database
	exec hsp_delete_obsolete_backup 2, @dbname


	-- if HADR is enabled and current replica is not a preferred backup, skip it
	if (SELECT SERVERPROPERTY ('IsHadrEnabled'))=1 
	begin
		if  sys.fn_hadr_backup_is_preferred_replica (@dbname) != 1
			goto _next_loop
	end

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
		set @dest_bak = REPLACE(@dest_bak,'_Log_','_Full_')
	
		-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
		if exists (select * from master.dbo.tbl_maint_parameter
					where parameter_name='#litespeed_for_full_backup' and parameter_value = 'Y')
		begin
			set @stt = 'xp_backup_database @database = ''' + @dbname + ''', @filename = ''' + @dest_bak + ''''
		end
		else
		begin
			set @stt = 'backup database [' + @dbname + '] to Disk=''' + @dest_bak + ''' with init,stats'
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
	end

	-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
	if exists (select * from master.dbo.tbl_maint_parameter
				where parameter_name='#litespeed_for_log_backup' and parameter_value = 'Y')
	begin
		set @stt = 'xp_backup_log @database = ''' + @dbname + ''', @filename = ''' + @dest + ''''
	end
	else
	begin
		set @stt = 'backup log [' + @dbname + '] to Disk=''' + @dest + ''' with init,stats'
		if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
			charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
		begin
			set @stt = @stt + ', compression'
		end
	end

print ' '
print '--------------------------------------------------------------------------------------'
print 'Log backup start at: ' + convert (varchar (50), getdate(), 120)
print ' '

	print 'Log backup command: ' + @stt
	print ' '
	EXEC (@stt)

print ' '
Print 'Log Backup end at: ' + convert (varchar (50), getdate(), 120)
	
	if (@@error != 0)
	begin
		raiserror ('Log backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
end

go 



