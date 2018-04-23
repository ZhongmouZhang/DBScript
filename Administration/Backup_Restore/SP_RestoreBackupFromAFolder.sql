
/****************************************************************
	The stored procedure is used to restore the database backed up by 
	unversal backup job. 
****************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_RestoreBackupFromAFolder') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].SP_RestoreBackupFromAFolder
GO

--SP_RestoreBackupFromAFolder 'WR_CH_LIVE', '\\srvwinrecs01\backup\'
CREATE         proc dbo.SP_RestoreBackupFromAFolder
@dbname varchar (100),
@folder varchar (500)
as
declare @stt nvarchar(1000)
declare @filename varchar(500)

set @folder = 'dir "' + @folder + '" /B'
CREATE TABLE #fileList(line varchar(2000))
INSERT INTO #fileList 
     EXEC xp_cmdshell @folder
     
declare MyCur cursor for
	SELECT line FROM #fileList 
	WHERE line like  @dbname + '%'
		and right(line,19) >= 
			(select max(right(line,19)) from #fileList where line like @dbname + '_Full_' + '%')
	ORDER BY right(line,19)
	
open MyCur
fetch next from MyCur into @filename
while (@@fetch_status=0)
begin
	if (patindex('%_Full_%', @filename)>0)
		set @stt = 'restore database ' + @dbname + 'from disk=''' + @filename + '''	with norecovery'
	else
		set @stt = 'restore log ' + @dbname + 'from disk=''' + @filename + '''	with norecovery'

	--exec (@stt)	
	print @stt
	
	fetch next from MyCur into @filename
end

--restore database @dbname with recovery

close myCur
deallocate myCur

drop table #fileList
			

