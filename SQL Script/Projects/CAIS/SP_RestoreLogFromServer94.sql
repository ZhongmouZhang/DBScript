--use tempdb

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

select @a='restore headeronly from SERVER50_cais_trans'
insert #temp  exec (@a)

select @MaxPosition = max(Position) from #temp
set @loop = 1
while (@loop<=@MaxPosition)
begin
	print 'Restore File = ' + convert(varchar,@loop)
	restore Log cais
	from SERVER50_cais_trans
	with file = @loop, NoRECOVERY, 
		move 'cais1Data' to 'H:\MSSQL$ICAISDB01\Data\cais_data.mdf',
		move 'cais1Log' to 'H:\MSSQL$ICAISDB01\Data\cais_log.ldf'
		
	set @loop = @loop + 1
end

-- restore database cais with recovery

drop table #temp
