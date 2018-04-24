 use master;
 go
 
 
declare @DB_NAME VARCHAR(256) 
declare @stt varchar(5000)
set @DB_NAME = ''

while (1=1)
begin
	SELECT @DB_NAME=MIN(name) FROM sysdatabases 
	WHERE @DB_NAME<name and not name in ('master','model','msdb','tempdb')

	if @DB_NAME is NULL 
		break
	set @stt = 'alter database ' + @db_name + ' set auto_shrink off' 
	
	exec (@stt)
	print @stt
end



