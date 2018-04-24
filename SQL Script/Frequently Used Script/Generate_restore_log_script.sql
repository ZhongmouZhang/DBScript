  
 
set nocount on
declare @logfilename varchar(500)
declare @dbname varchar(500)
declare @dir varchar(500)

set @dbname = 'cht_trak'
set @dir = 'dir \\svmcaisdb03\CAIS_PRD\' + @dbname +'\' + @dbname + '_Log_*.trn /s /B'

-- get all the available log files
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))

INSERT INTO #fileList 
EXEC xp_cmdshell @dir

-- restore all the log files after the last backup
set @logfilename = ''
while 1=1
begin
	select @logfilename = min(line) from #fileList
	where line > @logfilename
	
	if @logfilename is null
		break

	print 'restore log ' + @dbname + ' from disk =  '''  +  @logfilename + '''  with NoRECOVERY'
	--restore Log @dbname  from disk = @logfilename  with NoRECOVERY
end

