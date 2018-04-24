  1.  Ensure target server is same build revision as source server.  Patch accordingly.

2.  Start target server in single user mode (sqlservr -s <instancename> -c -m -f)

3.  Connect to SQL Server using sqlcmd

4.  Restore master database (Note - does not require WITH MOVE option).  
    When done, SQL Server stops automatically.

5.  Start target server in single user mode (sqlservr -c -m -f -T3608)

6.  Connect to SQL Server using sqlcmd

7.  Use ALTER DATABASE command to point SQL Server to the mssqlsystemresource database:

    ALTER DATABASE mssqlsystemresource
    MODIFY FILE (name = data, filename = ' \mssqlsystemresource.mdf')
    GO

    ALTER DATABASE mssqlsystemresource
    MODIFY FILE (name = log, filename = ' \mssqlsystemresource.ldf')
    GO

8.  Stop SQL Server (Ctrl-C).  Start in single user mode.

9.  Use ALTER DATABASE command to point SQL Server to the model, msdb & tempdb databases:

    modeldev = model.mdf
    modellog = modellog.ldf
    msdbdata = msdbdata.mdf
    msdblog  = msdblog.ldf
    tempdev  = tempdb.mdf
    templog  = templog.ldf

10. Stop SQL Server.  Start SQL Server (either from cmd or as service).

11. Restore msdb, model if required.



/********************************************************************

	T-SQL for restoring all the system databases
	
*********************************************************************/
-- backup version
RESTORE HEADERONLY
FROM DISK = 'd:\temp\master176.bak'

-- instance version
select @@version


restore database master 
from disk = 'D:\DSSTest\MSSQL\master_Full_20081120_170347.bak'
with replace, recovery

ALTER DATABASE mssqlsystemresource
    MODIFY FILE (name = data, filename = 'D:\MSSQL.1\MSSQL\Data\mssqlsystemresource.mdf')
    GO
   ALTER DATABASE mssqlsystemresource
    MODIFY FILE (name = log, filename = 'D:\MSSQL.1\MSSQL\Data\mssqlsystemresource.ldf')
    GO


alter database model
modify file (name = modeldev, filename = 'D:\MSSQL.1\MSSQL\Data\model.mdf' )
go

alter database model
modify file (name = modellog, filename = 'D:\MSSQL.1\MSSQL\Data\modellog.ldf' )
go

alter database msdb
modify file (name = msdbdata, filename = 'D:\MSSQL.1\MSSQL\Data\msdbdata.mdf' )
go

alter database msdb
modify file (name = msdblog, filename = 'D:\MSSQL.1\MSSQL\Data\msdblog.ldf' )
go

alter database tempdb
modify file (name = tempdev, filename = 'D:\MSSQL.1\MSSQL\Data\tempdb.mdf' )
go

alter database tempdb
modify file (name = templog, filename = 'D:\MSSQL.1\MSSQL\Data\templog.ldf' )
go


restore database model
from disk = 'D:\DSSTest\MSSQL\model_Full_20081120_170349.bak'
with move 'modeldev' to 'D:\MSSQL.1\MSSQL\Data\model.mdf',
	 move 'modellog' to 'D:\MSSQL.1\MSSQL\Data\modellog.ldf',replace, STATS
	 
	 

/***********************************
	uninstall SQL 2005 completely
************************************/
"%ProgramFiles%\Microsoft SQL Server\90\Setup Bootstrap\ARPWrapper.exe /Remove"




