

use CMDB_V2
go

declare @instance_id int
declare @connection_string varchar(500)
declare @stt nvarchar(2000)

set @instance_id = 0
while 1=1
begin
	select @instance_id=MIN(id)
	from tbl_instance
	where id > @instance_id
		and id not in (select id from dbo.tbl_instance_phsa_account_only)
		and sql_version is not null 
		and datediff (day, info_update_date,getdate())>0
		
	if @instance_id is null 
		break
	else
		select 	@connection_string = connection_string from tbl_instance where id=@instance_id
	
	-- start to collect the database information
	update [dbo].tbl_instance
	set info_update_status = 'Database_Info', info_update_date = getdate()
	where id = @instance_id

	-- create #temp table to store all the databases for the current connection string
	if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
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

	set @stt = 'insert into #temp (database_name,dbid,owner,status1, status2,created,compatibility_Level,filename,Version)
	select name,dbid,owner,status,status2,crdate,cmptlevel, filename ,isnull(version,9999) 
	from openquery([' +   @connection_string + '], ''select *,isnull(suser_sname(sid),''''UNKNOWN'''') owner from master.dbo.sysdatabases'')'

	print @stt

	exec (@stt)

	if @@ERROR!=0
		break
	
	-- update the status columns
	update #temp
	set status = case when status1 & 512 = 512 then 'Offline' when status1 & 32 = 32 then 'Loading' else 'Online' end,
	updateability = case when status1 & 1024 = 1024 then 'ReadOnly' else 'Read_Write' end, 
	User_Access = case when status1 & 2048 = 2048 then 'DBO_User_Only' when status1 & 4096 = 4096 then 'Single_User' else 'Multi_Users' end, 
	Recovery_Model = case when status1 & 8 = 8 then 'Simple' when status1 & 4 = 4 then 'Bulk-Logged' else 'Full' end

	-- get the database sizes
	declare @database_name varchar(256)
	set @database_name = ''
	
	while 1=1
	begin
		select @database_name = min(database_name)
		from #temp
		where database_name>@database_name and status='Online'
		if @database_name is null
			break
			
		set @stt = 'update #temp set size = (select convert(decimal(9,2),sum(size)*1.0/128) size from  openquery([' 
				+@connection_string + '], ''select * from [' + @database_name + '].dbo.sysfiles''))
	where database_name=''' + @database_name + ''''


		print @stt
		exec (@stt)
	end

	INSERT INTO [CMDB_V2].[dbo].[tbl_database]
           ([instance_id] ,[database_name] ,[owner] ,[dbid] ,[created] ,[status]  ,[updateability]
           ,[user_access],[recovery_model] ,[Version] ,[compatibility_Level] ,[filename]
           ,[Status1] ,[Status2] ,[collectedtime])
	select  @instance_id, database_name,owner,dbid, created,status, updateability,
				user_access, recovery_model, version, compatibility_Level,filename,
				status1, status2, GETDATE()
	from #temp
	where not exists (select * from tbl_database where instance_id=@instance_id and database_name=#temp.database_name)

	insert into dbo.tbl_database_size (database_id,size,collectedtime)
	select b.ID, a.size , GETDATE()
	from #temp a join tbl_database b on a.database_name=b.database_name
	where b.instance_id=@instance_id


	update [dbo].tbl_instance
	set info_update_status = 'Success_of_Database_Info', info_update_date = getdate()
	where connection_string=@connection_string
end



-- select * from #temp
