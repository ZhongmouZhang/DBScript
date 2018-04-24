
-- restore the backup files in a folder and move data file/log file to different location

set nocount on

declare @backup_folder varchar (500)
set @backup_folder = '\\srvnetapp01\sql_back$\Adhoc'

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

-- create a temp db
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
	drop table #fileList
CREATE TABLE #fileList(line varchar(2000))


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
--select * from #fileList

     
-- enumerating every backup file
declare @logicalname varchar(200), @physicalname varchar(200), @dbname varchar(64)

set @filename=''
while 1=1
begin
	select @filename=min(line) from #fileList 
	where line > @filename and not (line like 'master%' or line like 'msdb%' or line like 'model%')
	
	if (@filename is null)
		break
	
	-- get the db name by using restore headeronly
	set @stt = '
SELECT * into temp_restore_headeronly
FROM OPENROWSET(''SQLNCLI'',
                ''Server=.;Trusted_Connection=yes;'',
''SET NOCOUNT ON;SET FMTONLY OFF;EXEC(''''
RESTORE headeronly 
FROM DISK = ''''''''' + @filename + '''''''''
'''')''
) '
	if exists (select * from sysobjects where id = object_id(N'temp_restore_headeronly') and xtype='U')
		drop table temp_restore_headeronly
	exec (@stt)
	select @dbname = DatabaseName from temp_restore_headeronly
		
	-- print 'File Name Is:' + @filename +  'DB Name is:' + @dbname
	-- get logical and physical name by using restore filelistonly
	set @stt = '
SELECT * into temp_restore_filelistonly
FROM OPENROWSET(''SQLNCLI'',
                ''Server=.;Trusted_Connection=yes;'',
''SET NOCOUNT ON;SET FMTONLY OFF;EXEC(''''
RESTORE filelistonly 
FROM DISK = ''''''''' + @filename + '''''''''
'''')''
) '
	if exists (select * from sysobjects where id = object_id(N'temp_restore_filelistonly') and xtype='U')
		drop table temp_restore_filelistonly
	exec (@stt)
	
	-- form the restore statement
	set @stt = 'restore database ' + @dbname + '
from disk=''' + @filename + '''
with ' 
	set @logicalname = ''
	while 1=1
	begin
		select 	@logicalname = min(LogicalName) 
		from 	temp_restore_filelistonly
		where LogicalName>@logicalname
		
		if @logicalname is null
			break
		select @physicalname = 	
					case [Type] 
						when 'D' then @sql_data + reverse (left (reverse(PhysicalName),charindex('\',reverse (PhysicalName),-1)))
						else @sql_log + reverse (left (reverse(PhysicalName),charindex('\',reverse (PhysicalName),-1)))
					end
					
		from temp_restore_filelistonly
		where LogicalName = @logicalname
		
		set @stt = @stt + ' move ''' + @logicalname + ''' to ''' + @physicalname + ''', 
	'
	end
		set @stt = @stt + ' stats' 
	
	print @stt
	print ''

end    

