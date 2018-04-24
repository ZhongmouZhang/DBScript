 declare @database_name varchar(500)
declare @sttm varchar(5000)

set @database_name = ''

while @database_name is not null
begin
	select @database_name = min(name) 
	from master.dbo.sysdatabases 
	where name not in ('tempdb','distribution','master','model','msdb') and name>@database_name
		AND status & 512 != 512  -- not offline
	
	if @database_name is null 
		break
		
	set @sttm = 'use [' + @database_name + ']; exec sp_changedbowner ''sa'''
	print @sttm
end