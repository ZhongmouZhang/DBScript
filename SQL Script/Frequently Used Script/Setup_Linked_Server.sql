 
 ---  set up a default linked server
 USE [master]
go

declare @server_name varchar(256)

set @server_name = 'SPDBSRES048'

EXEC master.dbo.sp_addlinkedserver @server = @server_name, @srvproduct=N'SQL Server'


EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'collation compatible', @optvalue=N'false'

EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'data access', @optvalue=N'true'

EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'dist', @optvalue=N'false'

EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'pub', @optvalue=N'false'

EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'rpc', @optvalue=N'false'

EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'rpc out', @optvalue=N'false'

EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'sub', @optvalue=N'false'

EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'connect timeout', @optvalue=N'0'

EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'collation name', @optvalue=null

EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'lazy schema validation', @optvalue=N'false'

EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'query timeout', @optvalue=N'0'

EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'use remote collation', @optvalue=N'true'

EXEC master.dbo.sp_serveroption @server=@server_name, @optname=N'remote proc transaction promotion', @optvalue=N'true'

USE [master]

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname = @server_name, @locallogin = NULL , @useself = N'True'


 
 
 
 
 
 
 
 
 
 
 
 
 /****** Object:  LinkedServer [vchpsphrdb02]    Script Date: 06/21/2012 13:26:55 ******/
EXEC master.dbo.sp_addlinkedserver @server = N'vchpsphrdb02', @srvproduct=N'SQL Server'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'vchpsphrdb02',@useself=N'False',@locallogin=N'vchweb',@rmtuser=N'awpread',@rmtpassword='readawp'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'vchpsphrdb02',@useself=N'False',@locallogin=N'PHSABC\x-james',@rmtuser=N'awpread',@rmtpassword='readawp'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'vchpsphrdb02',@useself=N'False',@locallogin=N'VCH\AReyes4',@rmtuser=N'awpread',@rmtpassword='readawp'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'vchpsphrdb02',@useself=N'False',@locallogin=N'VCH\tpascal',@rmtuser=N'awpread',@rmtpassword='readawp'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'vchpsphrdb02',@useself=N'False',@locallogin=N'PHSABC\jho4',@rmtuser=N'awpread',@rmtpassword='readawp'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'vchpsphrdb02',@useself=N'False',@locallogin=N'VCH\tpascal',@rmtuser=N'awpread',@rmtpassword='readawp'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'vchpsphrdb02',@useself=N'False',@locallogin=N'VCH\jloh',@rmtuser=N'awpread',@rmtpassword='readawp'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'vchpsphrdb02',@useself=N'False',@locallogin=N'VCH\jloh_sa',@rmtuser=N'awpread',@rmtpassword='readawp'

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'vchpsphrdb02',@useself=N'False',@locallogin=N'PHSABC\svc_svmsq06',@rmtuser=N'awpread',@rmtpassword='readawp'

GO

EXEC master.dbo.sp_serveroption @server=N'vchpsphrdb02', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'vchpsphrdb02', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'vchpsphrdb02', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'vchpsphrdb02', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'vchpsphrdb02', @optname=N'rpc', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'vchpsphrdb02', @optname=N'rpc out', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'vchpsphrdb02', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'vchpsphrdb02', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'vchpsphrdb02', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'vchpsphrdb02', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'vchpsphrdb02', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'vchpsphrdb02', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'vchpsphrdb02', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


/****************************

	Grant login to use the linked server
	
**********************************/
 1)grant public role in master database
 2)Grant execute on sys.xp_prop_oledb_provider to [login];
 USE master;
Grant execute on sys.xp_prop_oledb_provider to [VCH\AReyes4];
Grant execute on sys.xp_prop_oledb_provider to [VCH\JLoh];
Grant execute on sys.xp_prop_oledb_provider to [VCH\jloh_sa];
Grant execute on sys.xp_prop_oledb_provider to [VCH\tpascal];
Grant execute on sys.xp_prop_oledb_provider to [vchweb];
Grant execute on sys.xp_prop_oledb_provider to [PHSABC\jho4];

GO
