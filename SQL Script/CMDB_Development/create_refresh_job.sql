USE [msdb]
GO

/****** Object:  Job [DBA -- V3: Daily Refresh Instance List]    Script Date: 4/27/2017 2:43:59 PM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 4/27/2017 2:43:59 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DBA -- V3: Daily Refresh Instance List', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [newly added instance name]    Script Date: 4/27/2017 2:44:00 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'newly added instance name', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'
insert into tbl_instance (instance_name,connection_string)
select a.name, server_name
from [msdb].[dbo].[sysmanagement_shared_registered_servers_internal] a 
	join msdb.dbo.sysmanagement_shared_server_groups_internal b 
		on a.server_group_id = b.server_group_id 
where a.name in (
select a.name 
from [msdb].[dbo].[sysmanagement_shared_registered_servers_internal] a 
	 left join dbo.tbl_instance b on a.name = b.instance_name
where b.instance_name is null )


--  get the IP address and FQN for the newly added servers
update tbl_instance
set ip = dbo.fn_InstanceIP
		(case  
			when CHARINDEX (''\'',instance_name)!=0 then SUBSTRING(instance_name, 0, charindex (''\'',instance_name))
			when CHARINDEX ('','',instance_name)!=0 then SUBSTRING(instance_name, 0, charindex ('','',instance_name))
			else instance_name
		end )


update dbo.tbl_instance
set fqn = 
	dbo.fn_InstanceFqn( 
		case when CHARINDEX(''\'', instance_name) > 1 then SUBSTRING (instance_name, 0, charindex(''\'', instance_name)) 
			when CHARINDEX('','', instance_name) > 1 then rtrim(SUBSTRING (instance_name, 0, charindex('','', instance_name))) 
			else instance_name 
		end )
where fqn is null 


', 
		@database_name=N'CMDB_V3', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Set the Connection Status for Newly Added Instance]    Script Date: 4/27/2017 2:44:00 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Set the Connection Status for Newly Added Instance', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'
declare @connection_string varchar(500)
declare @return_value nvarchar(2000)
declare @instance_id int

set @instance_id = 0
while 1=1
begin
	select @instance_id=MIN(id)
	from tbl_instance 
	where connection_status_desc is null 
		and ip != ''0.0.0.0''
		and @instance_id < id
			
	if @instance_id is null 
		break
	else
		select 	@connection_string = connection_string from tbl_instance where id=@instance_id
	set @return_value = dbo.fn_PingSQL(@connection_string)
	update tbl_instance
	set connection_status_desc = @return_value
	where id=@instance_id

end

', 
		@database_name=N'CMDB_V3', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Reset tbl_info_populating_status]    Script Date: 4/27/2017 2:44:00 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Reset tbl_info_populating_status', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'insert into tbl_info_populating_status (instance_id)
select id from tbl_instance
where id not in (select instance_id from tbl_info_populating_status)

UPDATE [dbo].[tbl_info_populating_status]
   SET [server_configuration_update_date] = ''2000-01-01''
      ,[server_configuration_status] = ''''
      ,[instance_info_update_date] = ''2000-01-01''
      ,[instance_info_status] = ''''
      ,[database_info_update_date] = ''2000-01-01''
      ,[database_info_status] = ''''
      ,[connection_tracker_update_date] = ''2000-01-01''
      ,[connection_tracker_status] = ''''
      ,[database_backup_update_date] = ''2000-01-01''
      ,[database_backup_status] = ''''
      ,[script_deployment_update_date] = ''2000-01-01''
      ,[script_deployment_status] = ''''
      ,[maint_job_info_update_date] = ''2000-01-01''
      ,[maint_job_info_status] = ''''


/*********************************

UPDATE [dbo].[tbl_info_populating_status]
   SET [server_configuration_update_date] = ''2000-01-01''
      ,[server_configuration_status] = ''''
      ,[instance_info_update_date] = ''2000-01-01''
      ,[instance_info_status] = ''''
      ,[database_info_update_date] = ''2000-01-01''
      ,[database_info_status] = ''''
      ,[connection_tracker_update_date] = ''2000-01-01''
      ,[connection_tracker_status] = ''''
      ,[database_backup_update_date] = ''2000-01-01''
      ,[database_backup_status] = ''''
      ,[script_deployment_update_date] = ''2000-01-01''
      ,[script_deployment_status] = ''''
      ,[maint_job_info_update_date] = ''2000-01-01''
      ,[maint_job_info_status] = ''''

**************************************/
', 
		@database_name=N'CMDB_V3', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Refresh SQL Version]    Script Date: 4/27/2017 2:44:00 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Refresh SQL Version', 
		@step_id=4, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=900, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'--  Get the SQL Version of the instances for the newly added instances

declare @connection_string varchar(500)
declare @stt nvarchar(2000)
declare @instance_id int

set @instance_id = 0
while 1=1
begin
	select @instance_id=MIN(id)
	from  [dbo].[vw_all_connectable_instance]
	where id >  @instance_id
		and sql_version is null 
		and exists (select  *
			from tbl_info_populating_status 
			where instance_id=[vw_all_connectable_instance].id and  instance_info_update_date = ''2000-01-01'')
			
	if @instance_id is null 
		break
	else
		select 	@connection_string = connection_string from tbl_instance where id=@instance_id
	
	update [dbo].tbl_info_populating_status
	set instance_info_update_date = getdate(), instance_info_status = ''Starting''
	where instance_id = @instance_id
	
	set @stt = ''update dbo.tbl_instance 
set sql_version = convert (varchar(200),a.SQLVersion), 
	product_version=convert (varchar(50),a.ProductVersion), 
	sp=convert (varchar(50),a.ProductLevel),
	edition=convert (varchar(50),a.Edition)
 from openrowset (''''SQLNCLI'''', ''''Server= '' 
 + @connection_string 
 + '';Trusted_Connection=yes;'''',
 '''' SELECT @@VERSION AS SQLVersion, SERVERPROPERTY(''''''''ProductVersion'''''''') AS ProductVersion,
SERVERPROPERTY(''''''''ProductLevel'''''''') AS ProductLevel,
SERVERPROPERTY(''''''''Edition'''''''') AS Edition '''') as a
where connection_string='''''' 
+ @connection_string +''''''''

	print ''==================================================================================''
	print @connection_string
	-- print @stt
	exec (@stt)	
	
	if @@error=0
	begin 
		update [dbo].tbl_info_populating_status
		set instance_info_update_date = getdate(), instance_info_status = ''Success''
		where instance_id = @instance_id
	end
	

end

', 
		@database_name=N'CMDB_V3', 
		@output_file_name=N'D:\CMSInst\SQL_Backup\CMDB_Log', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Refresh Server Configuration]    Script Date: 4/27/2017 2:44:00 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Refresh Server Configuration', 
		@step_id=5, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=1000, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'
declare @instance_id int
declare @connection_string varchar(500)
declare @stt nvarchar(2000)

set @instance_id = 0
while 1=1
begin
	select @instance_id=MIN(id)
	from [dbo].[vw_all_connectable_instance]
	where id > @instance_id
		and not exists (select * from dbo.tbl_server_configuration where instance_id=id)
		and exists (select server_configuration_update_date 
			from tbl_info_populating_status 
			where instance_id=[dbo].[vw_all_connectable_instance].id and  server_configuration_update_date = ''2000-01-01'') 
	
	if @instance_id is null 
		break
	else
		select 	@connection_string = connection_string from tbl_instance where id=@instance_id
	
	-- start to collect the database information
	update [dbo].tbl_info_populating_status
	set server_configuration_update_date = getdate(), server_configuration_status = ''Starting''
	where instance_id = @instance_id

	set @stt = ''insert into dbo.tbl_server_configuration
SELECT '' + convert (varchar(32), @instance_id) + '', * 
FROM OPENROWSET(''''SQLNCLI'''',
                ''''Server='' + @connection_string +'';Trusted_Connection=yes;'''',
''''SET NOCOUNT ON;SET FMTONLY OFF;EXEC(''''''''xp_msver'''''''')'''')''

	-- print @stt

	exec (@stt)

	if @@ERROR!=0
		break
	


	update [dbo].tbl_info_populating_status
	set server_configuration_update_date = getdate(), server_configuration_status = ''Success''
	where instance_id = @instance_id
end

', 
		@database_name=N'CMDB_V3', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Refresh Database Info]    Script Date: 4/27/2017 2:44:00 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Refresh Database Info', 
		@step_id=6, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=1000, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'


declare @instance_id int
declare @connection_string varchar(500)
declare @stt nvarchar(2000)

set nocount on;

set @instance_id = 0
while 1=1
begin
	select @instance_id=MIN(id)
	from [vw_all_connectable_instance]
	where id > @instance_id
		and exists (select * 
			from tbl_info_populating_status 
			where instance_id=[vw_all_connectable_instance].id and  database_info_update_date = ''2000-01-01'')
			 		
	if @instance_id is null 
		break
	else
		select 	@connection_string = connection_string from tbl_instance where id=@instance_id

	print ''=========================================================================''
	print @connection_string
	
	-- start to collect the database information
	update [dbo].tbl_info_populating_status
	set database_info_update_date = getdate(), database_info_status = ''Starting''
	where instance_id = @instance_id

	-- create #temp table to store all the databases for the current connection string
	if exists (select * from tempdb.dbo.sysobjects where id = object_id(N''tempdb.[dbo].#temp'') and xtype=''U'')
	drop table #temp
	CREATE TABLE #temp (
		[database_name] [varchar](500) NOT NULL,
		[owner] [varchar](50) NULL,
		[size] [decimal](9, 2) NULL default 0,
		[dbid] [int] NULL,
		[created] [datetime] NULL,
		[status] [varchar](10) NULL,
		[updateability] [varchar](50) NULL,
		[user_access] [varchar](50) NULL,
		[recovery_model] [varchar](50) NULL,
		[Version] [int] NULL,
		[compatibility_Level] [int] NULL,
		[filename] [varchar](200) NULL,
		[status1] [int] NULL,
		[status2] [int] NULL,
		[collectedtime] [datetime] NULL,
	)

	set @stt = ''insert into #temp (database_name,dbid,owner,status1, status2,created,compatibility_Level,filename,Version)
	select name,dbid,owner,status,status2,crdate,cmptlevel, filename ,isnull(version,9999) 
	from openquery(['' +   @connection_string + ''], ''''select *,isnull(suser_sname(sid),''''''''UNKNOWN'''''''') owner from master.dbo.sysdatabases'''')''

	-- print @stt

	exec (@stt)

	if @@ERROR!=0
		break
	
	-- update the status columns
	update #temp
	set status = case when status1 & 512 = 512 then ''Offline'' when status1 & 32 = 32 then ''Loading'' else ''Online'' end,
	updateability = case when status1 & 1024 = 1024 then ''ReadOnly'' else ''Read_Write'' end, 
	User_Access = case when status1 & 2048 = 2048 then ''DBO_User_Only'' when status1 & 4096 = 4096 then ''Single_User'' else ''Multi_Users'' end, 
	Recovery_Model = case when status1 & 8 = 8 then ''Simple'' when status1 & 4 = 4 then ''Bulk-Logged'' else ''Full'' end
	, [collectedtime] = getdate()

	-- get the database sizes
	declare @database_name varchar(256)
	set @database_name = ''''
	
	while 1=1
	begin
		select @database_name = min(database_name)
		from #temp
		where database_name>@database_name and status=''Online''
		if @database_name is null
			break
			
		set @stt = ''update #temp set size = (select convert(decimal(9,2),sum(size)*1.0/128) size from  openquery(['' 
				+@connection_string + ''], ''''select * from ['' + @database_name + ''].dbo.sysfiles''''))
	where database_name='''''' + @database_name + ''''''''


		-- print @stt
		exec (@stt)
	end

	-- Insert new databases
	INSERT INTO [tbl_database]
           ([instance_id] ,[database_name] ,[owner] ,[dbid] ,[created] ,[status]  ,[updateability]
           ,[user_access],[recovery_model] ,[Version] ,[compatibility_Level] ,[filename]
           ,[Status1] ,[Status2] ,[collectedtime])
	select  @instance_id, database_name,owner,dbid, created,status, updateability,
				user_access, recovery_model, version, compatibility_Level,filename,
				status1, status2, [collectedtime]
	from #temp
	where not exists (select * from tbl_database where instance_id=@instance_id and database_name=#temp.database_name)

	-- update the existing databases
	update tbl_database
	set [owner] = #temp.owner ,
		[dbid] = #temp.dbid
		,[created] = #temp.created 
		,[status] = #temp.status  
		,[updateability] = #temp.updateability
        ,[user_access] = #temp.user_access
        ,[recovery_model] = #temp.recovery_model
        ,[Version] = #temp.version
        ,[compatibility_Level] = #temp.compatibility_level 
        ,[filename] = #temp.filename
        ,[Status1] = #temp.status1
        ,[Status2] = #temp.status2
        ,[collectedtime] = #temp.[collectedtime]
     from #temp
     where tbl_database.instance_id=@instance_id and tbl_database.database_name=#temp.database_name
     
     -- update the status to Deleted if the database does not exist in #temp
     update tbl_database
     set [status] = ''Deleted''
     where instance_id=@instance_id
		and not exists (select * from #temp where #temp.database_name=tbl_database.database_name)  
     
	
	insert into dbo.tbl_database_size (database_id,size,collectedtime)
	select b.ID, a.size , GETDATE()
	from #temp a join tbl_database b on a.database_name=b.database_name
	where b.instance_id=@instance_id

	-- get the disk space information
	set @stt =  ''insert into dbo.tbl_disk_space
SELECT getdate() ,'' + convert (varchar(32), @instance_id) + '', * 
FROM OPENROWSET(''''SQLNCLI'''',
                ''''Server='' +  @connection_string  +'';Trusted_Connection=yes;'''',
''''SET NOCOUNT ON;SET FMTONLY OFF;EXEC(''''''''hsp_get_disk_space'''''''')'''')''

	exec (@stt)


	-- Upate status
	update [dbo].tbl_info_populating_status
	set database_info_update_date = getdate(), database_info_status = ''Success''
	where instance_id = @instance_id
end



-- select * from #temp
', 
		@database_name=N'CMDB_V3', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Refresh Database Backup Info]    Script Date: 4/27/2017 2:44:01 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Refresh Database Backup Info', 
		@step_id=7, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=1000, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'

declare @instance_id int
declare @connection_string varchar(500)
declare @stt nvarchar(2000)

set @instance_id = 0
while 1=1
begin
	select @instance_id=MIN(id)
	from [dbo].[vw_all_connectable_instance]
	where id > @instance_id
		and sql_version is not null 
		and exists (select * 
			from tbl_info_populating_status 
			where instance_id=[vw_all_connectable_instance].id and  database_backup_update_date = ''2000-01-01'')
			 		
	if @instance_id is null 
		break
	else
		select 	@connection_string = connection_string from tbl_instance where id=@instance_id
	
	-- start to collect the database information
	update [dbo].tbl_info_populating_status
	set database_backup_update_date = getdate(), database_backup_status = ''Starting''
	where instance_id = @instance_id

	-- create #temp table to store all the databases for the current connection string
	if exists (select * from tempdb.dbo.sysobjects where id = object_id(N''tempdb.[dbo].#temp'') and xtype=''U'')
	drop table #temp
	
	CREATE TABLE #temp (
		[database_name] [varchar](512) NULL,
		[backup_set_id] [int] NULL,
		[physical_device_name] [varchar](512) NULL,
		[backup_start_date] [datetime] NULL,
		[backup_finish_date] [datetime] NULL,
		[type] [char](1) NULL,
		[backup_size] [decimal](20, 2) NULL,
		[server_name] [varchar](64) NULL	
		)
		

set @stt = ''insert into #temp (database_name,backup_set_id, physical_device_name,backup_start_date,backup_finish_date,type,backup_size,server_name)
select * from openquery(['' + @connection_string + ''], ''''

select m.name database_name
	, backup_set_id
	, physical_device_name
	, backup_start_date
	, backup_finish_date
	, type
	, backup_size
	, server_name
from master.dbo.sysdatabases m left join 
(
select backup_set_id, database_name, physical_device_name, backup_start_date,backup_finish_date,type,
	convert( decimal (20,2), convert(decimal(20,2),backup_size)/(1024*1024)) as backup_size,server_name
from msdb.dbo.backupset a join msdb.dbo.backupmediafamily b on a.media_set_id=b.media_set_id
where type = ''''''''D''''''''
	and backup_set_id = 
		(select max(backup_set_id) from msdb.dbo.backupset c where c.database_name = a.database_name and type=''''''''D'''''''')
) v on m.name=v.database_name
where m.name != ''''''''tempdb'''''''' '''')''

	print @stt

	exec (@stt)

	if @@ERROR!=0
		break
	
	-- Insert new databases 
	INSERT INTO [tbl_database_backup]
           ([instance_id] 
           ,[database_name] 
           ,[backup_set_id]
           ,[physical_device_name]
           ,[backup_start_date]
           ,[backup_finish_date]
           ,[type]
           ,[backup_size]
           ,[server_name]
           )
			
	select  @instance_id, *
	from #temp
	where not exists (select * from [tbl_database_backup] where instance_id=@instance_id and database_name=#temp.database_name)

	-- update the existing databases
	update [tbl_database_backup]
	set [backup_set_id] = #temp.[backup_set_id] 
		,[physical_device_name] = #temp.[physical_device_name]
		,[backup_start_date] = #temp.[backup_start_date] 
		,[backup_finish_date] = #temp.[backup_finish_date]  
		,[type] = #temp.[type]
        ,[backup_size] = #temp.[backup_size]
        ,[server_name] = #temp.[server_name]
     from #temp
     where [tbl_database_backup].instance_id=@instance_id and [tbl_database_backup].database_name=#temp.database_name
     

	-- Upate status
	update [dbo].tbl_info_populating_status
	set database_backup_update_date = getdate(), database_backup_status = ''Success''
	where instance_id = @instance_id
end



-- select * from #temp
', 
		@database_name=N'CMDB_V3', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [setup Linked Server]    Script Date: 4/27/2017 2:44:01 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'setup Linked Server', 
		@step_id=8, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'declare @instance_name nvarchar(256)


set @instance_name = ''''

while 1=1
begin
	select @instance_name = min (connection_string )
	from vw_all_connectable_instance
	where connection_string > @instance_name 
		and connection_string not in (select name from sys.servers)
		and sql_version is not null
	
	if @instance_name is null
		break
	
	print @instance_name

	EXEC master.dbo.sp_addlinkedserver @server = @instance_name, @srvproduct=N''SQL Server''
 	EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=@instance_name,@useself=N''True'',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL
	
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N''collation compatible'', @optvalue=N''false''
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N''data access'', @optvalue=N''true''
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N''dist'', @optvalue=N''false''
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N''pub'', @optvalue=N''false''
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N''rpc'', @optvalue=N''true''
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N''rpc out'', @optvalue=N''true''
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N''sub'', @optvalue=N''false''
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N''connect timeout'', @optvalue=N''0''
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N''collation name'', @optvalue=null
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N''lazy schema validation'', @optvalue=N''false''
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N''query timeout'', @optvalue=N''0''
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N''use remote collation'', @optvalue=N''true''
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N''remote proc transaction promotion'', @optvalue=N''true''
end




', 
		@database_name=N'CMDB_V3', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20130429, 
		@active_end_date=99991231, 
		@active_start_time=10000, 
		@active_end_time=235959, 
		@schedule_uid=N'05a5cc2f-d7d0-44aa-8fff-39391d903ba7'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO



---------------------------------  Job Manually run a script on all the servers

USE [msdb]
GO

/****** Object:  Job [DBA -- V3: Manually Run A Script On All Servers]    Script Date: 4/27/2017 2:48:57 PM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 4/27/2017 2:48:57 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DBA -- V3: Manually Run A Script On All Servers', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [stpe]    Script Date: 4/27/2017 2:48:58 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'stpe', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'-- =============================================
-- Script Template
-- =============================================


-- initialize the time stamp
/**************

insert into tbl_info_populating_status (instance_id)
select id from tbl_instance
where id not in (select instance_id from tbl_info_populating_status)

update tbl_info_populating_status
set   [script_deployment_update_date]= ''2000-01-01'', [script_deployment_status]=''''


********************/

-- start the refresh database_size table
set nocount on
declare @instance_id int
declare @connection_string varchar(500)
declare @stt nvarchar(2000)

set @instance_id = 0
while 1=1
begin
	select @instance_id=MIN(id)
	from [dbo].[vw_all_connectable_instance] v
	where id > @instance_id
		and exists (select * 
			from tbl_info_populating_status 
			where instance_id=v.id and  [script_deployment_update_date] = ''2000-01-01'')
			 		
	if @instance_id is null 
		break
	else
		select 	@connection_string = connection_string from tbl_instance where id=@instance_id
	
	-- start to collect the database information
	update [dbo].tbl_info_populating_status
	set [script_deployment_update_date] = getdate(), [script_deployment_status] = ''Starting''
	where instance_id = @instance_id


	set @stt = ''C:\BatchScript\BatchCmd "'' + @connection_string + ''"  C:\BatchScript\On_All_Servers_Create_Get_Disk_Space_SP.sql'' + '' >> C:\BatchScript\output.log''
	print @stt
	print ''''
	exec xp_cmdshell @stt

	if @@error = 0 
		update [dbo].tbl_info_populating_status
		set [script_deployment_status] = ''Success''
		where instance_id = @instance_id
	
end



-- select * from #temp
', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
















----------------------------------------------------   Session tracking job   ----------------------------------------------


USE [msdb]
GO

/****** Object:  Job [DBA -- V3: Daily Refresh Connection Tracker For Last Batch]    Script Date: 4/27/2017 2:47:39 PM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 4/27/2017 2:47:39 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DBA -- V3: Daily Refresh Connection Tracker For Last Batch', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Reset Daily Refresh Status]    Script Date: 4/27/2017 2:47:39 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Reset Daily Refresh Status', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=1000, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'insert into tbl_info_populating_status (instance_id)
select id from tbl_instance
where id not in (select instance_id from tbl_info_populating_status)

update tbl_info_populating_status
set   /*connection_tracker_update_date= ''2000-01-01'', */connection_tracker_status=''''
', 
		@database_name=N'CMDB_V3', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [ConnectionTracker]    Script Date: 4/27/2017 2:47:40 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'ConnectionTracker', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=500, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'if exists (select * from sysobjects where id = object_id(N''temp_connection_tracker_last_batch'') and xtype=''U'')
drop table temp_connection_tracker_last_batch
create table temp_connection_tracker_last_batch
(
		id int identity(1,1) primary key,
		instance_id int,
		computer_name [varchar] (128)
		,login_account [varchar] (128)  
		,database_name varchar(128)NULL 
		,[program_Name] [varchar](128) null		
		,latest_batch [datetime] NULL 
		,latest_login [datetime] NULL 
)



declare @connection_string varchar(500), @instance_id int
declare @stt nvarchar(2000)
declare @error int

set @instance_id = 0
while 1=1
begin
	select @instance_id=MIN(id)
	from  [dbo].[vw_all_connectable_instance]
	where id > @instance_id
		and sql_version is not null 	
		and exists (select server_configuration_update_date 
			from tbl_info_populating_status 
			where instance_id=[vw_all_connectable_instance].id and connection_tracker_status='''' /* and  connection_tracker_update_date = ''2000-01-01''*/) 
			
	if @instance_id is null 
		break
	else
		select 	@connection_string = connection_string from tbl_instance where id=@instance_id
	
	
	update [dbo].tbl_info_populating_status
	set connection_tracker_update_date = getdate(), connection_tracker_status = ''Starting''
	where instance_id = @instance_id
	
	truncate table temp_connection_tracker_last_batch
	
set @stt = ''
insert into temp_connection_tracker_last_batch
select '' + convert (varchar(20),@instance_id) + '',* 
from openrowset (''''SQLNCLI'''',''''Server='' + @connection_string + '';Trusted_Connection=yes;'''',''''
   select hostname computer_name, loginame login_account, db_name (dbid) database_name, program_name, max(last_batch) latest_batch, max(login_time)
   from  master.dbo.sysprocesses sp1
where sp1.spid <> @@SPID and sp1.spid > 50
group by hostname, loginame, sp1.dbid, program_name'''')''


	--print @stt
	exec (@stt)	
	SET @error = @@ERROR; IF @error <> 0 GOTO ERROR

	-- set BLANK to all of the records which have blank or null comupter name
	-- then only keep the one with the latest login stamp
	update temp_connection_tracker_last_batch
	set computer_name = ''BLANK'', program_Name = ''BLANK''
	where computer_name = '''' or computer_name is null
	SET @error = @@ERROR; IF @error <> 0 GOTO ERROR
		
	delete from temp_connection_tracker_last_batch
	where computer_name = ''BLANK'' and id <> 
			(	select top 1 id from temp_connection_tracker_last_batch 
				where computer_name = ''BLANK'' 
					and latest_batch = (select MAX(latest_batch) from temp_connection_tracker_last_batch where computer_name = ''BLANK'')
			)
	SET @error = @@ERROR; IF @error <> 0 GOTO ERROR
	

	-- Insert any newly found connections [THIS FAILS with # columns supplied not matched up]
	Insert into dbo.tbl_connection_tracker_last_batch
		(instance_id,computer_name,login_account,database_name,program_Name,latest_batch, latest_login)
	select instance_id,computer_name,login_account,database_name,program_Name,latest_batch, latest_login
	from  temp_connection_tracker_last_batch sp1
	where not exists (select * from tbl_connection_tracker_last_batch
				where sp1.instance_id=instance_id 
					and sp1.computer_name = computer_name
					and sp1.login_account = login_account
					and sp1.database_name = database_name
					and sp1.program_name = program_name )
	SET @error = @@ERROR; IF @error <> 0 GOTO ERROR

	--Update stats on any existing connections that are found
	Update tbl_connection_tracker_last_batch
	Set latest_batch = sp.latest_batch, latest_login=sp.latest_login
	FROM temp_connection_tracker_last_batch sp JOIN tbl_connection_tracker_last_batch at
		on  at.instance_id = sp.instance_id 
			and at.computer_name = sp.computer_name 
			and at.login_account = sp.login_account 
			and sp.database_name = at.database_name
			and sp.program_name = at.program_name
	SET @error = @@ERROR; IF @error <> 0 GOTO ERROR
			
	--break
	
	update [dbo].tbl_info_populating_status
	set connection_tracker_update_date = getdate(), connection_tracker_status = ''Success''
	where instance_id = @instance_id
	CONTINUE
ERROR:
	update [dbo].tbl_info_populating_status
	set connection_tracker_status = ''Failed - Error: '' + CAST(@error AS VARCHAR(10))
	where instance_id = @instance_id
end

', 
		@database_name=N'CMDB_V3', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Save errors]    Script Date: 4/27/2017 2:47:40 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Save errors', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'if exists (select * from sysobjects where id = object_id(N''dbo.temp_connection_tracker_last_batch_errors'') and xtype=''U'')
drop table dbo.temp_connection_tracker_last_batch_errors

select i.instance_name, connection_tracker_update_date,connection_tracker_status 
into temp_connection_tracker_last_batch_errors
from dbo.tbl_info_populating_status ps
inner join dbo.tbl_instance i on i.id = ps.instance_id
where connection_tracker_status like ''failed%'' or connection_tracker_status = ''Starting'' order by instance_id', 
		@database_name=N'CMDB_V3', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=30, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140710, 
		@active_end_date=99991231, 
		@active_start_time=700, 
		@active_end_time=235959, 
		@schedule_uid=N'1e13445c-590c-4b76-9a5d-7a515889e2b1'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO


