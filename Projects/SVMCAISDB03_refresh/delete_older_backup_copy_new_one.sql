 
-- deleing the older copies and copy the new one from production

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))

INSERT INTO #fileList 
EXEC xp_cmdshell 'dir K:\Restore_PRD_CAIS_FULL\cais_Full_*.bak /s /B'

delete from #fileList where line is null

declare @deletingfile varchar(100)
declare @stt varchar(1024)

set @deletingfile=''
while ((select count(*) from #fileList)>1)
begin
	select @deletingfile=min(line) from #fileList where line>@deletingfile
	set @stt = 'del "' + @deletingfile + '"'
	exec master.dbo.xp_cmdshell @stt
	delete from #fileList where line=@deletingfile
end

EXEC xp_cmdshell 'copy \\vcaisdb01\i$\Backups\cais_Full_*.bak K:\Restore_PRD_CAIS_FULL\'



