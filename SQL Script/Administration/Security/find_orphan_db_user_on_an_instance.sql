 if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500),
	username varchar(500),
	usertype varchar(30)
)

 declare @database_name varchar(500)
declare @sttm varchar(5000)

set @database_name = ''

while @database_name is not null
begin
	select @database_name = min(name) 
	from master.dbo.sysdatabases 
	where name not in ('tempdb','distribution','master','model','msdb') and name>@database_name
	
	if @database_name is null 
		break
	
	set @sttm = 'use [' + @database_name + ']; 	insert into #temp select ''' 
		+ @database_name + ''', b.name, b.type_desc
	from master.sys.syslogins a right join sys.database_principals b on a.sid=b.sid
	where a.sid is null and b.type in (''S'', ''U'', ''G'') '
	
	exec (@sttm)
	print @sttm
	
end

select * from #temp
