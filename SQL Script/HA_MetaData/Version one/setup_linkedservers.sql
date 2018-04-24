-- =============================================
-- Script Template
-- =============================================

declare @instance_name nvarchar(256)


set @instance_name = ''

while 1=1
begin
	select @instance_name = min (connection_string )
	from cmdb.dbo.vw_all_connectable_instance
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



