
declare @server_name nvarchar(128)

set @server_name=''

while 1=1
begin

	select @server_name =  min(replica_server_name )
	from sys.availability_replicas
	where replica_server_name != @@SERVERNAME and replica_server_name > @server_name

	if @server_name is null
		break

	if not exists (select * from sys.servers where name = @server_name)
	begin
		EXEC master.dbo.sp_addlinkedserver @server = @server_name, @srvproduct=N'SQL Server'
 		EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=@server_name,@useself=N'True',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL
	
		EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'collation compatible', @optvalue=N'false'
		EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'data access', @optvalue=N'true'
		EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'dist', @optvalue=N'false'
		EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'pub', @optvalue=N'false'
		EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'rpc', @optvalue=N'true'
		EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'rpc out', @optvalue=N'true'
		EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'sub', @optvalue=N'false'
		EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'connect timeout', @optvalue=N'0'
		EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'collation name', @optvalue=null
		EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'lazy schema validation', @optvalue=N'false'
		EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'query timeout', @optvalue=N'0'
		EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'use remote collation', @optvalue=N'true'
		EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'remote proc transaction promotion', @optvalue=N'true'
	end
end



