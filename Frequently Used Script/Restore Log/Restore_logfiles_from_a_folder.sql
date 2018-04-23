set nocount on

declare @path varchar(500)
declare @dbname_source varchar(100)
declare @dbname_dest varchar(100)

declare @stt varchar(5000)

declare @logfilename varchar(500)
declare @MaxPosition int, @loop int
declare @a varchar(128)


set @path='K:\From_SRVEHDB01\Log_backup_From_20120531\'
set @dbname_source = 'NBSORU'
set @dbname_dest = 'NBSORU'

-- store all the log files
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))

-- for every log file
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp 
(BackupName nvarchar(128),
BackupDescription nvarchar(255),
BackupType smallint,
ExpirationDate datetime,
Compressed tinyint,
Position smallint,
DeviceType tinyint,
UserName nvarchar(128),
ServerName nvarchar(128),
DatabaseName nvarchar(128),
DatabaseVersion int,
DatabaseCreationDate datetime,
BackupSize numeric(20,0),
FirstLSN numeric(25,0),
LastLSN numeric(25,0),
CheckpointLSN numeric(25,0),
DatabaseBackupLSN numeric(25,0),
BackupStartDate datetime,
BackupFinishDate datetime,
SortOrder smallint,
CodePage smallint,
UnicodeLocaleId int,
UnicodeComparisonStyle int,
CompatibilityLevel tinyint,
SoftwareVendorId int,
SoftwareVersionMajor int,
SoftwareVersionMinor int,
SoftwareVersionBuild int,
MachineName nvarchar(128),
Flags int,
BindingID uniqueidentifier,
RecoveryForkID uniqueidentifier,
Collation nvarchar(128))


-- get all the logfiles
set @stt = 'dir "' + @path + @dbname_source +'_Log_*' + '" /S /B'  -- return the full path for the candidate files
INSERT INTO #fileList 
EXEC xp_cmdshell @stt

--select * from #fileList

set @logfilename =''

while 1=1
begin
	select @logfilename = min(line) from #fileList
	where line > @logfilename
	
	if @logfilename is null
		break
print ''
print ''
print '============= restoring the log file: ' + @logfilename
	-- restore the logfile
	select @a='restore headeronly from disk = ''' + @logfilename + ''''
	truncate table #temp
	insert #temp  exec (@a)

	select @MaxPosition = max(Position) from #temp
	set @loop = 1
	while (@loop<=@MaxPosition)
	begin
		print '			Restore File = ' + convert(varchar,@loop)
		restore Log @dbname_dest  from disk = @logfilename  with file = @loop, NoRECOVERY
		
		set @loop = @loop + 1
	end
end

