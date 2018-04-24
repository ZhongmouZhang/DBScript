SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



-- hsp_apply_log_backup_onto_cais_new 1
ALTER          proc dbo.hsp_apply_log_backup_onto_cais_new
@is_in_recovery int  = 0    -- 1: yes, the cais_nwe will be sealed after applying the log backups
	                    -- 0: no, the cais_new keeps in unrecovery status
as
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
EXEC xp_cmdshell 'dir K:\SQL_Backup\CAIS_PRD\cais\cais_Log_*.trn /s /B'

--select * from #fileList
-- restore all the log files after the last backup
declare @first_valid_log_file int
set @first_valid_log_file = 0

if exists (select * from master.dbo.tbl_last_log_applied)
	select top 1 @logfilename = last_Log_file_name from dbo.tbl_last_log_applied
else
	select @logfilename = min(line) from #fileList

while 1=1
begin
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
	select @logfilename = min(line) from #fileList
	where line > @logfilename
	if @logfilename is null
		break

end

if (@first_valid_log_file=0)
begin
 	EXEC usp_sendcdomail
			@From = 'dbserver@phsa.ca', 
			@To = 'jzhang2@phsa.ca',
			@Subject = 'The log restore of CAIS_New on SVMCAISDB03 is out of sync', 
			@Body = ''
	truncate table master.dbo.tbl_last_log_applied
end
else if @is_in_recovery = 1  -- the cais_new will be sealed in recovery status
begin
	select @logfilename = max(line) from #fileList where line is not null
	print 'restore Log @dbname  from disk = ' + @logfilename + '  with RECOVERY'
	restore Log @dbname  from disk = @logfilename  with RECOVERY
end
else    -- the cais_new will keep in unrecovery status
begin
	select @logfilename = max(line) from #fileList where line is not null
	if exists (select * from master.dbo.tbl_last_log_applied )
		update master.dbo.tbl_last_log_applied 	set last_Log_file_name = @logfilename
	else
		insert into master.dbo.tbl_last_log_applied values (@logfilename)
end

		


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

