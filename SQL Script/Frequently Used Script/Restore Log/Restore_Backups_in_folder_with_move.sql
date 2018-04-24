
-- restore the backup files in a folder and move data file/log file to different location

set nocount on

declare @backup_folder varchar (500)
set @backup_folder = 'K:\From_Old_Production'

declare @filename_prefix varchar(64)
set @filename_prefix = 'VSQLS2K801_ISQLS2K801_'

declare @backup_file varchar(500)
set @backup_file=''

declare @backup_type varchar(10)
set @backup_type = '_adhoc_'

declare @sql_data varchar(64) 
set @sql_data='H:\SQL_Data'
declare @sql_log varchar(64) 
set @sql_log= 'I:\SQL_Log'


declare @filename varchar(500)

declare @stt nvarchar(3000)

-- create two temp db
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
	drop table #fileList
CREATE TABLE #fileList(line varchar(2000))

if exists (select * from sysobjects where id = object_id(N'temp_listfileonly') and xtype='U')
	drop table temp_listfileonly

if  @@version like 'Microsoft SQL Server  2000%'
begin
	set @stt = 'create TABLE temp_listfileonly
		(LogicalName varchar(128),[PhysicalName] varchar(128), 
			[Type] varchar, [FileGroupName] varchar(128), [Size] varchar(128), 
            [MaxSize] varchar(128)
		)'
end
else if @@version like 'Microsoft SQL Server 2005%'
begin
	set @stt = 'create TABLE temp_listfileonly
				(LogicalName varchar(128),[PhysicalName] varchar(128), 
				[Type] varchar, [FileGroupName] varchar(128), [Size] varchar(128), 
				[MaxSize] varchar(128), [FileId]varchar(128), [CreateLSN]varchar(128), 
				[DropLSN]varchar(128), [UniqueId]varchar(128), [ReadOnlyLSN]varchar(128), 
				[ReadWriteLSN]varchar(128), [BackupSizeInBytes]varchar(128), 
				[SourceBlockSize]varchar(128), [FileGroupId]varchar(128), 
				[LogGroupGUID]varchar(128), [DifferentialBaseLSN]varchar(128), 
				[DifferentialBaseGUID]varchar(128), [IsReadOnly]varchar(128), 
				[IsPresent]varchar(128)
	)'
end
else
begin
	set @stt = 'create TABLE temp_listfileonly
		(LogicalName varchar(128),[PhysicalName] varchar(128), 
					[Type] varchar, [FileGroupName] varchar(128), [Size] varchar(128), 
					[MaxSize] varchar(128), [FileId]varchar(128), [CreateLSN]varchar(128), 
					[DropLSN]varchar(128), [UniqueId]varchar(128), [ReadOnlyLSN]varchar(128), 
					[ReadWriteLSN]varchar(128), [BackupSizeInBytes]varchar(128), 
					[SourceBlockSize]varchar(128), [FileGroupId]varchar(128), 
					[LogGroupGUID]varchar(128), [DifferentialBaseLSN]varchar(128), 
					[DifferentialBaseGUID]varchar(128), [IsReadOnly]varchar(128), 
					[IsPresent]varchar(128), [TDEThumbprint]varchar(128)
		)'
end

exec (@stt)



-- insert backup list into #fileList table
if @backup_file=''
begin
	set @stt = 'dir "' + @backup_folder + '\*' + @backup_type + '*.bak" /B /S'
	INSERT INTO #fileList 
		 EXEC xp_cmdshell @stt
end
else
	insert into #fileList 
	select @backup_file

--print @stt
select * from #fileList

     
-- enumerating every backup file
declare @logicalname varchar(200), @physicalname varchar(200), @dbname varchar(64)

set @filename=''
while 1=1
begin
	select @filename=min(line) from #fileList 
	where line > @filename and not (line like 'master%' or line like 'msdb%' or line like 'model%')
	
	if (@filename is null)
		break
	
	-- get the db name by backup file name
	set @dbname = reverse (left (reverse(@filename),charindex('\',reverse (@filename),-1)-1))
--print 'DB name:' + @dbname
	select @dbname = left (@dbname, patindex ('%'+@backup_type+'%', lower(@dbname))-1)
	set @dbname = REPLACE(@dbname, @filename_prefix,'')
	
	-- print 'File Name Is:' + @filename +  'DB Name is:' + @dbname

	truncate table temp_listfileonly
	INSERT INTO temp_listfileonly
	EXEC('
	RESTORE FILELISTONLY 
	   FROM DISK=''' + @filename + '''
	   ')   
	   
	-- form the restore string
	set @stt = 'restore database ' + @dbname + '
from disk=''' + @filename + '''
with ' 
	set @logicalname = ''
	while 1=1
	begin
		select 	@logicalname = min(LogicalName) 
		from 	temp_listfileonly
		where LogicalName>@logicalname
		
		if @logicalname is null
			break
		select @physicalname = 	
					case [Type] 
						when 'D' then @sql_data + reverse (left (reverse(PhysicalName),charindex('\',reverse (PhysicalName),-1)))
						else @sql_log + reverse (left (reverse(PhysicalName),charindex('\',reverse (PhysicalName),-1)))
					end
					
		from temp_listfileonly
		where LogicalName = @logicalname
		
		set @stt = @stt + ' move ''' + @logicalname + ''' to ''' + @physicalname + ''', 
	'
	end
		set @stt = @stt + ' stats' 
	
	print @stt
	print ''

end    

/*****
-- select * from #fileList
select * from temp_listfileonly

select LogicalName, PhysicalName, 
	case [Type] when 'D' 
		then 'H:\SQL_Data' + reverse (left (reverse(PhysicalName),charindex('\',reverse (PhysicalName),-1)))
		else 'I:\SQL_Log' + reverse (left (reverse(PhysicalName),charindex('\',reverse (PhysicalName),-1)))
	end NewPhysicalName
			
from temp_listfileonly


********/