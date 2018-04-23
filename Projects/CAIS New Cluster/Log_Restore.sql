 
set nocount on
declare @logfilename varchar(500)
declare @dbname varchar(500)
declare @error_code int
declare @dir varchar(1000)

set @dbname = 'cais'
set @dir = 'dir \\svmcaisdb03\CAIS_PRD\cais\cais_Log_*.trn /s /B'

-- get all the available log files
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))

INSERT INTO #fileList 
EXEC xp_cmdshell @dir 


select * from #fileList

-- restore all the log files after the last backup
declare @first_valid_log_file int
set @first_valid_log_file = 0

--select top 1 @logfilename = last_Log_file_name from dbo.tbl_last_log_applied
set @logfilename = '\\svmcaisdb03\CAIS_PRD\cais\cais_Log_20140613_141112.trn'
while 1=1
begin
	select @logfilename = min(line) from #fileList
	where line > @logfilename
	
	if @logfilename is null
		break

	print 'restore log file name: ' + @logfilename
	restore Log @dbname  from disk = @logfilename  with NoRECOVERY
	set @error_code = @@error
	
end



------------------------------------  cht_trak  ------------------------------------------

 
set nocount on
declare @logfilename varchar(500)
declare @dbname varchar(500)
declare @error_code int
declare @dir varchar(1000)

set @dbname = 'cht_trak'
set @dir = 'dir \\svmcaisdb03\CAIS_PRD\cht_trak\cht_trak_Log_*.trn /s /B'



-- get all the available log files
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))

INSERT INTO #fileList 
EXEC xp_cmdshell @dir 


select * from #fileList

-- restore all the log files after the last backup
declare @first_valid_log_file int
set @first_valid_log_file = 0

--select top 1 @logfilename = last_Log_file_name from dbo.tbl_last_log_applied
set @logfilename = '\\svmcaisdb03\CAIS_PRD\cht_trak\cht_trak_Log_20140613_174234.trn'
while 1=1
begin
	select @logfilename = min(line) from #fileList
	where line > @logfilename
	
	if @logfilename is null
		break

	print 'restore log file name: ' + @logfilename
	restore Log @dbname  from disk = @logfilename  with NoRECOVERY
	set @error_code = @@error
	
end

------------------------------------------  IHACAIS
 
set nocount on
declare @logfilename varchar(500)
declare @dbname varchar(500)
declare @error_code int
declare @dir varchar(1000)

set @dbname = 'IHACAIS'
set @dir = 'dir \\svmcaisdb03\CAIS_PRD\IHACAIS\IHACAIS_Log_*.trn /s /B'



-- get all the available log files
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))

INSERT INTO #fileList 
EXEC xp_cmdshell @dir 


select * from #fileList

-- restore all the log files after the last backup
declare @first_valid_log_file int
set @first_valid_log_file = 0

--select top 1 @logfilename = last_Log_file_name from dbo.tbl_last_log_applied
set @logfilename = '\\svmcaisdb03\CAIS_PRD\IHACAIS\IHACAIS_Log_20140613_174220.trn'
while 1=1
begin
	select @logfilename = min(line) from #fileList
	where line > @logfilename
	
	if @logfilename is null
		break

	print 'restore log file name: ' + @logfilename
	restore Log @dbname  from disk = @logfilename  with NoRECOVERY
	set @error_code = @@error
	
end

-----------------------------------------------------  MisysCAIS ---------------------

 
set nocount on
declare @logfilename varchar(500)
declare @dbname varchar(500)
declare @error_code int
declare @dir varchar(1000)

set @dbname = 'MisysCAIS'
set @dir = 'dir \\svmcaisdb03\CAIS_PRD\MisysCAIS\MisysCAIS_Log_*.trn /s /B'



-- get all the available log files
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))

INSERT INTO #fileList 
EXEC xp_cmdshell @dir 


select * from #fileList

-- restore all the log files after the last backup
declare @first_valid_log_file int
set @first_valid_log_file = 0

--select top 1 @logfilename = last_Log_file_name from dbo.tbl_last_log_applied
set @logfilename = '\\svmcaisdb03\CAIS_PRD\MisysCAIS\MisysCAIS_Log_20140613_174222.trn'
while 1=1
begin
	select @logfilename = min(line) from #fileList
	where line > @logfilename
	
	if @logfilename is null
		break

	print 'restore log file name: ' + @logfilename
	restore Log @dbname  from disk = @logfilename  with NoRECOVERY
	set @error_code = @@error
	
end

