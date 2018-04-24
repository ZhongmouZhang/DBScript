USE [master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_differential_backup_database') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_differential_backup_database
GO


create        proc [dbo].hsp_differential_backup_database
as

declare @dest varchar(1000)
declare @path varchar(512)
declare @stt varchar (5000)
declare @dbname varchar(128)


-- backup all the databases in #temp table
set @dbname = ''
while 1=1
begin 
_next_loop:
	select @dbname =MIN(dbname) from #temp where dbname>@dbname
	if @dbname is null
		break
	-- select the backup folder
	select @path = dbo.hfn_get_backup_path('#differential_backup_folder',@dbname)
	
	-- delete the obsolete differential backup of the database
	exec hsp_delete_obsolete_backup 3, @dbname

	-- if HADR is enabled and current replica is not a preferred backup, skip it
	if (SELECT SERVERPROPERTY ('IsHadrEnabled'))=1 
	begin
		if  sys.fn_hadr_backup_is_preferred_replica (@dbname) != 1
			goto _next_loop
	end

	exec hsp_test_create_subfolder @path,@dbname
	set @path = @path + @dbname + '\'
	 
	select @dest=@path + @dbname + '_diff_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.bak'
	
	-- Backup statement based on lietSpeed, Compression (SQL 2008) or normal
	if exists (select * from master.dbo.tbl_maint_parameter
				where parameter_name='#litespeed_for_full_backup' and parameter_value = 'Y')
	begin
		set @stt = 'xp_backup_database @database = ''' + @dbname + ''', @filename = ''' + @dest + ''''
	end
	else
	begin
		set @stt = 'backup database [' + @dbname + '] to Disk=''' + @dest + ''' with DIFFERENTIAL, init,stats'
		if convert (int, substring (convert(varchar (20),SERVERPROPERTY ('ProductVersion')),1, 
			charindex ('.',convert(varchar (20),SERVERPROPERTY ('ProductVersion')))-1)) >= 10
		begin
			-- backup database @dbname to Disk=@dest with init,stats, compression
			set @stt = @stt + ', compression'
		end
	end

print ' '
print '--------------------------------------------------------------------------------------'
print 'Differential backup start at: ' + convert (varchar (50), getdate(), 120)
print ' '
	print 'differential backup command: ' + @stt
	print ' '
	EXEC (@stt)
print ' '
Print 'Differenctial Backup end at: ' + convert (varchar (50), getdate(), 120)

	
	if (@@error != 0)
	begin
		raiserror ('differential backup of the %s database on instance %s failed',11,1, @dbname, @@Servername)
	end
end


go


