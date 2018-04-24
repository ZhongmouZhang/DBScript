  
 -- hsp_InsertRestoreLog 'TEST_LogSHipping', 'FULL', '2007-02-07 15:00:00', '\\76421xp\sharedfolder\test.log'
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_InsertRestoreLog_V2') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_InsertRestoreLog_V2
GO

CREATE         proc dbo.hsp_InsertRestoreLog_V2
@dbname varchar(100),
@backupType varchar(10),
@CopyTime datetime,
@Restore_FileName varchar(200)

as

declare @stt nvarchar(2000)

set @stt = 'INSERT INTO [' + dbo.hfn_GetServerName_V2( @Restore_FileName)
			+ '].[master].[dbo].[RestoreLog] ([DBname],[BackupType],[CopyTime],[Restore_filename]) '
			+ ' VALUES(@P_dbname, @P_backupType, @P_CopyTime, @P_Restore_FileName)'

exec sp_executesql @stt, 
	N'@P_dbname varchar(100), @P_backupType varchar(10), @P_CopyTime datetime, @P_Restore_FileName varchar(200)',
	@P_dbname = @dbname, 
	@P_backupType = @backupType,
	@P_CopyTime = @CopyTime,
	@P_Restore_FileName = @Restore_FileName