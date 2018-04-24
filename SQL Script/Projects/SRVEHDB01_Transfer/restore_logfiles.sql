 --use tempdb
create procedure hsp_restore_log_file
@path varchar(500),
@dbname varchar (100)
as

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

declare @MaxPosition int, @loop int
declare @a varchar(128)
--declare @path varchar(500)
--declare @dbname varchar(100)

-- set @path = 'K:\From_SRVEHDB01\Log_Backup_From_20120514\affinity_live_Log_20120530.bak'
--set @path = 'K:\From_SRVEHDB01\Log_Backup_From_20120514\cw_ehr_Log_20120517.bak'
--set @dbname = 'cw_ehr'

select @a='restore headeronly from disk = ''' + @path + ''''
insert #temp  exec (@a)

select @MaxPosition = max(Position) from #temp
set @loop = 1
while (@loop<=@MaxPosition)
begin
	print 'Restore File = ' + convert(varchar,@loop)
	--restore Log affinity_live
	restore Log @dbname
	--restore Log affinity_live
	--restore Log affinity_live
	--restore Log affinity_live
	from disk = @path
	with file = @loop, NoRECOVERY
		
	set @loop = @loop + 1
end

-- restore database cais with recovery

drop table #temp
