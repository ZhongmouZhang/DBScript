
/****************************************************************
	The stored procedure is used to generate a script based on a backup folder. all the backups are
	done with universal backup script .

	SP_GeneratingRestoreScript 'D:\DSSTest\MSSQL\', 'D:\MSSQL.1\MSSQL\Data'
****************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].SP_GeneratingRestoreScript') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].SP_GeneratingRestoreScript
GO

--SP_RestoreBackupFromAFolder 'WR_CH_LIVE', '\\srvwinrecs01\backup\'
CREATE         proc dbo.SP_GeneratingRestoreScript
@src_folder varchar (500),
@dest_folder varchar(500)
as
declare @stt nvarchar(1000)
declare @filename varchar(500)
declare @dbname varchar (500)
declare @tempstr varchar(1000)
declare @cmdstr varchar(1000)

set @cmdstr = 'dir "' + @src_folder + '" /B'

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#fileList') and xtype='U')
drop table #fileList
CREATE TABLE #fileList(line varchar(2000))

if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(	LogicalName varchar(100),
	PhysicalName varchar(1000),
	Type varchar(2),
	FileGroupName varchar(50),
	Size bigint,
	Maxsize numeric(30),
	fileID int,
	CreateSN numeric(30),
	DropSN numeric(30),
	UniqueID varbinary(100),
	ReadOnlySN numeric(30),
	ReadWriteLSN numeric(30),
	BackupSizeInBytes numeric(30),
	SourceBlockSize numeric(30),
	Filegroupid int,
	LogGroupGUID varbinary(100),
	DefferentialBaseLsn numeric(30),
	DefferentialBaseGUID varbinary(100),
	IsReadOnly int,
	IsPresent int
)
	
	
INSERT INTO #fileList 
     EXEC xp_cmdshell @cmdstr
     
declare MyCur cursor for
	SELECT line FROM #fileList where line like '%_full_%'
	
open MyCur
fetch next from MyCur into @filename
while (@@fetch_status=0)
begin
	truncate table #temp
	-- print 'restore filelistonly from disk = ''' + @src_folder + @filename + '''' 
	insert into #temp
	exec ('restore filelistonly from disk = ''' + @src_folder + @filename + '''' )
	set @tempstr =''
	select @tempstr = @tempstr + '    move ''' + LogicalName + ''' to ''' + dbo.Fn_ReplacePath(PhysicalName,@dest_folder)
		+ ''',' + char(0x0a)
	from #temp
	
	print 'restore database ' + substring (@filename, 1, patindex('%_full_%', @filename) -1)
	print 'from disk = ''' + @src_folder + @filename + ''''
	print 'with '
	print @tempstr
	print 'replace, Stats'
	print ''
	print ''
	fetch next from MyCur into @filename
end

--restore database @dbname with recovery

close myCur
deallocate myCur

drop table #fileList
			

 