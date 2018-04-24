  
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
	drop table #temp
CREATE TABLE #temp (
	database_name [varchar](500) NOT NULL,
	database_size [decimal](18, 4) NULL,
	owner [varchar](50) NULL,
	database_id [int] NULL,
	create_date [datetime] NULL,
	[Status1] [int] NULL,
	[Status2] [int] NULL,
	[version] [int] NULL,
	[compatibility_level] [int] NULL,
	[filename] [varchar](200) NULL

)

declare @event_date datetime
declare @dbname varchar(500)
declare @stt nvarchar(2048)
declare @db_size decimal(9,2)
declare @server_name varchar(50)


set @server_name = 'SVMSQ08'

 set @stt = 'insert into #temp (database_name,database_id,owner,Status1,Status2,create_date,compatibility_level,filename,version)
 select * 
 from openrowset (''SQLNCLI'', ''Server=' + @server_name + ';Trusted_Connection=yes;'',
  ''select name,dbid,isnull(suser_sname(sid) ,''''UNKNOWN'''') owner,status,status2,crdate,cmptlevel, filename ,isnull(version,9999)  as version
 from master.dbo.sysdatabases'') as a'

print @stt
Exec (@stt)


set @server_name = 'SVMSQ04'

 set @stt = 'insert into #temp (database_name,database_id,owner,Status1,Status2,create_date,compatibility_level,filename,version)
 select * 
 from openrowset (''SQLNCLI'', ''Server=' + @server_name + ';Trusted_Connection=yes;'',
  ''select name,dbid,isnull(suser_sname(sid) ,''''UNKNOWN'''') owner,status,status2,crdate,cmptlevel, filename ,isnull(version,9999)  as version
 from master.dbo.sysdatabases'') as a'

print @stt
Exec (@stt)
 
insert into #temp (database_name,database_id,owner,Status1,Status2,create_date,compatibility_level,filename,version)
 select * 
 from openrowset ('SQLNCLI', 'Server=SVMSQ04;Trusted_Connection=yes;',
  'select name,dbid,isnull(suser_sname(sid) ,''UNKNOWN'') owner,status,status2,crdate,cmptlevel, filename ,isnull(version,9999)  as version
 from master.dbo.sysdatabases') as a


set @event_date = GETDATE()
set @dbname = ''

while 1=1
begin
	select @dbname =MIN(database_name) from #temp where database_name>@dbname
	if @dbname is null
		break
		
	set @stt = 'select @size = convert(decimal(9,2),sum(size)*1.0/128) from ' + @dbname + '.dbo.sysfiles'
	print @stt
	exec sp_executesql @stt, N'@size decimal(9,2) output', @db_size output
	update #temp
	set database_size = @db_size
	where database_name = @dbname
end
	
select * from #temp