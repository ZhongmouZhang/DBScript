  
 -----------------------------------------------------------------
 --  2. restore the cais_new from K:\Restore folder
 -----------------------------------------------------------------


set nocount on
declare @logfilename varchar(500)
declare @dbname varchar(500)
declare @error_code int
set @dbname = 'cais_new'




-- get all the available log files
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))

INSERT INTO #fileList 
EXEC xp_cmdshell 'dir \\zvmcaisdb01\SQL_Backup\cais\cais_Log_*.trn /s /B'



-- restore all the log files after the last backup
declare @first_valid_log_file int
set @first_valid_log_file = 0

select top 1 @logfilename = last_Log_file_name from dbo.tbl_last_log_applied
while 1=1
begin
	select @logfilename = min(line) from #fileList
	where line > @logfilename
	
	if @logfilename is null
		break

	print 'restore log file name: ' + @logfilename
	restore Log @dbname  from disk = @logfilename  with NoRECOVERY
	set @error_code = @@error
	
	if @first_valid_log_file = 0
	begin 
		if @error_code != 0 
			update dbo.tbl_last_log_applied
			set last_Log_file_name = @logfilename
		else 
			set @first_valid_log_file = 1
	end
		
end

--select @logfilename = max(line) from #fileList where line is not null
-- restore Log @dbname  from disk = @logfilename  with RECOVERY

--select @@error