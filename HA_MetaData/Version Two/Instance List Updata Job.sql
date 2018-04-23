--------------Step 1: newly added instance name ------------------

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



-- update the status of instance no longer in user if the instance is deteled from Central Management
update tbl_instance
set is_in_use='N', is_connectable='N' 
where not instance_name in (select name from msdb.dbo.sysmanagement_shared_registered_servers_internal)
	and is_in_use != 'N'


--  get the IP address and FQN for the newly added servers
update tbl_instance
set ip = 	cmdb.dbo.fn_InstanceIP
		(case when CHARINDEX ('\',instance_name)=0 then instance_name
		 else SUBSTRING(instance_name, 0, charindex ('\',instance_name))
		end )
where info_update_date = '2000-01-01'
	and (ip is null or ip='0.0.0.0')
	and is_connectable = 'Y'

update dbo.tbl_instance
set fqn = 
	cmdb.dbo.fn_InstanceFqn( 
		case when CHARINDEX('\', instance_name) = 0 then instance_name 
			else SUBSTRING (instance_name, 0, charindex('\', instance_name)) end )
where fqn is null 


-- update the instance's description
update tbl_instance
set [description] = s.description
from msdb.dbo.sysmanagement_shared_registered_servers_internal s
where tbl_instance.connection_string=s.server_name



--------step 2: Get the SQL Version for newly added Instance

--  Get the SQL Version of the instances for the newly added instances

declare @connection_string varchar(500)
declare @stt nvarchar(2000)

set @connection_string = ''
while 1=1
begin
	select @connection_string=MIN(connection_string)
	from tbl_instance 
	where connection_string > @connection_string 
		and sql_version is null 
		and ip !='0.0.0.0' 
		and is_in_use = 'Y' 
		and is_connectable ='Y'
		-- and datediff (day, info_update_date,getdate())>0
		and info_update_date = '2000-01-01'
	if @connection_string is null 
		break
	
	update tbl_instance 
	set info_update_status = 'SQL_Version', info_update_date = getdate()
	where connection_string=@connection_string
	
	set @stt = 'update dbo.tbl_instance 
set sql_version = convert (varchar(200),a.SQLVersion), 
	product_version=convert (varchar(50),a.ProductVersion), 
	sp=convert (varchar(50),a.ProductLevel),
	edition=convert (varchar(50),a.Edition)
 from openrowset (''SQLNCLI'', ''Server= ' 
 + @connection_string 
 + ';Trusted_Connection=yes;'',
 '' SELECT @@VERSION AS SQLVersion, SERVERPROPERTY(''''ProductVersion'''') AS ProductVersion,
SERVERPROPERTY(''''ProductLevel'''') AS ProductLevel,
SERVERPROPERTY(''''Edition'''') AS Edition '') as a
where connection_string=''' 
+ @connection_string +''''

	print @stt
	exec (@stt)	
	
	if @@error=0
	begin 
		update tbl_instance 
		set info_update_status = 'Success_of_SQL_Version', info_update_date = getdate()
		where connection_string=@connection_string
	end
	

end


--------------  step 3: setup Linked Server
-- =============================================
-- Script Template
-- =============================================

declare @instance_name nvarchar(256)


set @instance_name = ''

while 1=1
begin
	select @instance_name = min (connection_string )
	from cmdb_v2.dbo.vw_all_connectable_instance
	where connection_string > @instance_name 
		and connection_string not in (select name from sys.servers)
	
	if @instance_name is null
		break
	
	print @instance_name

	EXEC master.dbo.sp_addlinkedserver @server = @instance_name, @srvproduct=N'SQL Server'
 	EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=@instance_name,@useself=N'True',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL
	
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N'collation compatible', @optvalue=N'false'
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N'data access', @optvalue=N'true'
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N'dist', @optvalue=N'false'
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N'pub', @optvalue=N'false'
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N'rpc', @optvalue=N'true'
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N'rpc out', @optvalue=N'true'
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N'sub', @optvalue=N'false'
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N'connect timeout', @optvalue=N'0'
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N'collation name', @optvalue=null
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N'lazy schema validation', @optvalue=N'false'
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N'query timeout', @optvalue=N'0'
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N'use remote collation', @optvalue=N'true'
	EXEC master.dbo.sp_serveroption @server=@instance_name, @optname=N'remote proc transaction promotion', @optvalue=N'true'
end




