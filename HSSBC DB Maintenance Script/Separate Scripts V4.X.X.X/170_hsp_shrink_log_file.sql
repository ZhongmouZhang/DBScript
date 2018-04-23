use master
go

IF OBJECTPROPERTY ( object_id('hsp_shrink_log_file'),'IsProcedure') = 1
	DROP PROC hsp_shrink_log_file
GO

create proc hsp_shrink_log_file
as


if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp_logspace') and xtype='U')
drop table #temp_logspace
create table #temp_logspace
(
	dbname varchar(500),
	log_size float,
	used_log_size float,
	status int
)

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp_logspace_log_file_name') and xtype='U')
drop table #temp_logspace_log_file_name
create table #temp_logspace_log_file_name
(
	id int identity (1,1) primary key,
	dbname varchar(500),
	log_file_name varchar(500)
)

declare @database_name varchar(500), @log_file_name varchar(500), @stt varchar(5000), @id int, @max_id int

insert into #temp_logspace
exec ('dbcc sqlperf(logspace)')

set @database_name = ''
while 1=1
begin
	select @database_name= min(dbname) from #temp_logspace 
	where log_size > 2048 and used_log_size < 20 and dbname > @database_name
	if @database_name is null 
		break
	set @stt = 'SELECT ''' + @database_name + ''', name FROM [' 
			+ @database_name + '].sys.database_files where type = 1'
			
	insert into #temp_logspace_log_file_name (dbname, log_file_name)
	exec (@stt)
end 

select @id = 1, @max_id = max(id) from #temp_logspace_log_file_name

while @id <= @max_id
begin
	select @database_name = dbname, @log_file_name = log_file_name
	from #temp_logspace_log_file_name
	where id = @id
	
	set @stt = 'use ' + @database_name + ';dbcc shrinkfile ( ' + @log_file_name + ', 1)'
	--print @stt

	exec (@stt)
	set @id = @id + 1
end


--select * from #temp_logspace

--select * from #temp_logspace_log_file_name

go