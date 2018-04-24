 if exists (select * from dbo.sysobjects where id = object_id(N'sp_restore_log_file_from_folder') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_restore_log_file_from_folder
GO

CREATE         proc dbo.sp_restore_log_file_from_folder
 @dbname varchar(500)
 , @dir varchar(1000)
 , @final_status varchar(16) = 'norecovery'  -- recovery or norecovery
as

set nocount on
declare @logfilename varchar(500)
declare @error_code int


-- set @dbname = 'cais_new'
-- set @dir = 'dir \\zvmcaisdb01\SQL_Backup\cais\cais_Log_*.trn /s /B'



-- get all the available log files
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))

INSERT INTO #fileList 
EXEC xp_cmdshell @dir 



-- restore all the log files after the last backup
declare @first_valid_log_file int
set @first_valid_log_file = 0

--select top 1 @logfilename = last_Log_file_name from dbo.tbl_last_log_applied
set @logfilename = ''
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

if @final_status='recovery'
begin
	restore Log @dbname  with RECOVERY
end

--select @logfilename = max(line) from #fileList where line is not null
-- restore Log @dbname  from disk = @logfilename  with RECOVERY

--select @@error