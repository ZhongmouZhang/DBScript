/***********
set nocount on
exec sp_configure 'show advanced option', '1'
reconfigure
go
exec sp_configure 'xp_cmdshell', '1'
reconfigure
go 
***************************/

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
GO

set nocount on
-- Get instance IP address
create table #temp ( inline varchar(3000))
declare @ip_address varchar(100)
declare @instance_name varchar(100)
declare @server_name varchar(100)
declare @stt varchar(2000)

if charindex('\',@@servername) = 0
begin
	set @instance_name = @@SERVERNAME
	set @server_name = @@SERVERNAME
end
else
begin
	set @instance_name = RIGHT(ltrim(rtrim(@@ServerName)), Charindex('\', ltrim(rtrim(@@ServerName))) -1)
	set @server_name = LEFT(ltrim(rtrim(@@ServerName)), Charindex('\', ltrim(rtrim(@@ServerName))) -1)	
end

set @stt = 'ping ' + @server_name
insert into #temp 
exec master..xp_cmdshell @stt

select  top 1 @ip_address = substring (inline,12, charindex(':', inline)-12) from #temp where inline like 'Reply from %'

-- Get instance port number
DECLARE @test varchar(20), @key varchar(100)
if charindex('\',@@servername,0) <>0
begin
set @key = 'SOFTWARE\MICROSOFT\Microsoft SQL Server\'
  +@@servicename+'\MSSQLServer\Supersocketnetlib\TCP'
end
else
begin
set @key = 'SOFTWARE\MICROSOFT\MSSQLServer\MSSQLServer\Supersocketnetlib\TCP'
end

EXEC master..xp_regread @rootkey='HKEY_LOCAL_MACHINE',
 @key=@key,@value_name='Tcpport',@value=@test OUTPUT
--SELECT 'Server Name: '+@@servername + ' Port Number:'+convert(varchar(10),@test)


print 'Server Name: ' + @server_name
print 'Instance Name: ' + @instance_name
print 'Instance Connection String: ' + @@servername
print 'IP Address,Port number: ' + @ip_address + ',' + convert(varchar(10),@test)

