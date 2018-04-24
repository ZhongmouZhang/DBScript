   if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_RestoreStandByDBs_V2') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_RestoreStandByDBs_V2
GO

CREATE         proc dbo.hsp_RestoreStandByDBs_V2
as

declare @stt nvarchar(2000)
declare MyCur_2 cursor for
	select distinct dbo.hfn_GetServerName_V2(path) from master.dbo.BackupParameter
	where backuptype='LogShipping'
declare @srvname varchar(50)

open myCur_2
fetch next from myCur_2 into @srvname
while @@fetch_status=0
begin
	-- Restore database or log
	set @stt = '[' + @srvname + '].[master].[dbo].[hsp_RestoreDB_V2]'
	exec sp_executesql @stt
	
	-- Delete the restored backup files
	set @stt = '[' + @srvname + '].[master].[dbo].[hsp_DeleteRestoredFile_V2]'
	exec sp_executesql @stt

	fetch next from myCur_2 into @srvname
end
close myCur_2
deallocate myCur_2


