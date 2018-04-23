-- =============================================
-- Script Template
-- =============================================
-----------------------------------------------------------------
 --  1. delete the old cais database files from 
 --     disable the log restore job for cais_new
 -----------------------------------------------------------------
 if exists (select * from sysobjects where id = object_id(N'fileList') and xtype='U')
drop table fileList
CREATE TABLE fileList(line varchar(2000))

while (1=1)
begin
	INSERT INTO fileList 
	EXEC xp_cmdshell 'dir D:\SQL_Data\CAIS_Old\*.* /s /B'
	delete from fileList where line is null
	if ((select count(*) from fileList)=0)
		break
	EXEC xp_cmdshell 'Del /Q D:\SQL_Data\CAIS_Old\*.*'
	delete from fileList
	waitfor delay '00:00:05'
end



 -----------------------------------------------------------------
 --  2. seal the cais_new database
 -----------------------------------------------------------------
exec hsp_apply_log_backup_onto_cais_new 1


-----------------------------------------------------------------
 --  3. detach cais database and move database file to 
 -----------------------------------------------------------------
if exists (select * from sysobjects where id = object_id(N'fileList') and xtype='U')
drop table fileList
CREATE TABLE fileList(line varchar(2000))

while (1=1)
begin
	INSERT INTO fileList 
	EXEC xp_cmdshell 'dir D:\SQL_Data\CAIS_Current\*.* /s /B'
	delete from fileList where line is null
	if ((select count(*) from fileList)=0)
		break
		
	exec kill_users_in_db 'cais'
	waitfor delay '00:00:05'
	exec kill_users_in_db 'cais'
	exec kill_users_in_db 'cais'

	exec sp_detach_db 'cais'
	EXEC xp_cmdshell 'move D:\SQL_Data\CAIS_Current\*.* D:\SQL_Data\CAIS_Old\'
	delete from fileList
end


--------------------------------------------------------------------------------------
--  4. move the cais_new database files to current folder and rename it as cais
--------------------------------------------------------------------------------------
exec kill_users_in_db 'cais_new'
waitfor delay '00:00:05'
exec sp_detach_db 'cais_new'
EXEC xp_cmdshell 'move D:\SQL_Data\CAIS_New\*.* D:\SQL_Data\CAIS_Current\'
exec sp_attach_db @dbname= N'cais',
	@filename1 = N'D:\SQL_Data\CAIS_Current\cais_data.mdf',
	@filename2 = N'D:\SQL_Data\CAIS_Current\cais_log.ldf'


-----------------------------------------------------------------
 --  5. restore the cais_new from 'K:\Restore_PRD_CAIS_FULL\ folder
 -----------------------------------------------------------------
exec master.dbo.hsp_restore_latest_cais_full_backup 
		@source_dbname = 'cais',
		@dest_dbname = 'cais_new',
		@path = 'K:\Restore_PRD_CAIS_FULL\',
		@with_clause = 'with move ''cais1Data'' to ''D:\SQL_Data\CAIS_New\cais_data.mdf'', move ''cais1Log'' to ''D:\SQL_Data\CAIS_New\cais_log.ldf'', stats, norecovery'

--exec hsp_apply_log_backup_onto_cais_new 0
go
