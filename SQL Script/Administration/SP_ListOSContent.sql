 CREATE TABLE #fileList(line varchar(2000))
INSERT INTO #fileList 
     EXEC xp_cmdshell 'dir "\\cwfs01\Workgrps\Application_Services\Projects\Current\CAIS\Staging\01 - Cluster\Scripts\" /B'
SELECT line FROM #fileList WHERE line IS NOT NULL ORDER BY 1
DROP TABLE #fileList


CREATE TABLE #logFile(line varchar(2000))
INSERT INTO #logFile 
    EXEC xp_cmdshell 'type "C:\Backup\MaintenancePlan_20061218120033.txt" '
SELECT line FROM #logFile
DROP TABLE #logFile

-- generate a bat file to run the script files
set nocount on 
CREATE TABLE #fileList(line varchar(2000))
INSERT INTO #fileList 
     EXEC xp_cmdshell 'dir "C:\Temp\SPR Upgrade\20081222\" /B'
declare filename_cur cursor for 
SELECT line FROM #fileList WHERE line IS NOT NULL ORDER BY 1

declare @filename varchar(4000)

open filename_cur
fetch next from filename_cur into @filename
while @@fetch_status = 0
begin
	print 'oSQL -E -S ZVPNGSQA02\ZIPNGSQA02 /i  "C:\Temp\SPR Upgrade\20081222\' + @filename + '"'
	fetch next from filename_cur into @filename
end
close filename_cur
deallocate filename_cur
DROP TABLE #fileList
