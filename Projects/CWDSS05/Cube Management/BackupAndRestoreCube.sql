 --Backup the Cube on CWDSS02
-- ["command-path]msmdarch["] /a Server "OLAPDataPath" "DatabaseName" "BackupFileName" ["LogFileName" ["TempDirectory"]]


declare @AnalysisServer sysname
declare @AnalysisDBName sysname
declare @BackupExe varchar(8000)
declare @DataFolder varchar(8000)
declare @BackupFolder varchar(8000)
declare @Exec varchar(8000)

set @AnalysisServer= 'CWDSS02'  --'SVMFINREPAP01'
set @AnalysisDBName='PYDM'
set @BackupExe='D:\MSAS\Bin\msmdarch.exe'
set @DataFolder='\\CWDSS02\CubeData\'   --source database folder
set @BackupFolder='\\svmfinrepap01\BACKUP\Archives\'   -- backup folder


set @Exec='"'+@BackupExe+'" /a '+@AnalysisServer
+' "'+@DataFolder+'" "'+@AnalysisDBName
+'" "'+@BackupFolder+''+@AnalysisDBName + '"' --+'-'+convert(char(8),getdate(),112)+replace(convert(char(8),getdate(),108),':','')+'.CAB"'

DECLARE @object int
DECLARE @hr int
Print @Exec
EXEC @hr = sp_OACreate 'WScript.Shell', @object OUT
EXEC @hr = sp_OAMethod @object, 'Run', NULL, @Exec


---------------------------  Restore

--Restore the cube on CWDSS05

--Wait three minute to let the cube archive in the previous step
WAITFOR DELAY '000:05:00'

declare @AnalysisServer sysname
declare @AnalysisDBName sysname
declare @RestoreExe varchar(8000)
declare @DataFolder varchar(8000)
declare @BackupFolder varchar(8000)
declare @Exec varchar(8000)
declare @Log varchar(8000)

set @AnalysisServer='SVMFINREPAP01'
set @AnalysisDBName='PHSA V8a Admin Support'
set @RestoreExe='D:\MSAS\Bin\msmdarch.exe'
set @DataFolder='\\SVMFINREPAP01\CubeData\' --'D:\mssql\data analysis\Data\'
set @BackupFolder='E:\mssql\BACKUP\Archives\'
set @Log='D:\DTS\ProcessLog\AS_CubeRestoreLog.txt'
set @Exec='"'+@RestoreExe+'" /r '+@AnalysisServer
+' "'+@DataFolder
+'" "'+@BackupFolder+''+@AnalysisDBName +'.cab"' + ' "' + @Log + '"'--+'-'+convert(char(8),getdate(),112)+replace(convert(char(8),getdate(),108),':','')+'.CAB"'

Print @Exec
DECLARE @object int
DECLARE @hr int
EXEC @hr = sp_OACreate 'WScript.Shell', @object OUT
EXEC @hr = sp_OAMethod @object, 'Run', NULL, @Exec

WAITFOR DELAY '000:04:00'

WAITFOR DELAY '000:02:00'