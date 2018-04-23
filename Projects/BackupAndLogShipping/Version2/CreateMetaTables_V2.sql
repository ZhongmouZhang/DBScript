 /***************************************
	Create BackupParameter table
****************************************/

create table master.dbo.BackupParameter
(
	backuptype varchar(20) not null default ('Full'),   -- Full , Differential, Log
														--LogShipping: path is the destination
	dbname varchar(100) not null ,	-- default: specify the default backup folder 
									--          and full backup time for all the databases
									-- specific database name: specify the special feature about this database 
	backuptime varchar(10),			-- Null: don't need the backup for the dbname
									-- HH:MM : the full or differenctial backup scheduled at this time
									--	       there may are more than one full/differential backup 
									--		   for a specific database daily
	path   varchar(512) ,			-- the folder for the backup files or the copied files
	
	excluded int not null default (0)
)

CREATE CLUSTERED INDEX [IX_BackupParameter_DBName] ON [dbo].[BackupParameter] 
(
	[DBname] ASC,
	backuptype ASC
)

/*
insert into master.dbo.BackupParameter(dbname, backuptime, path) values ('default','20:00', 'C:\MSSQL\Backup\')

insert into master.dbo.BackupParameter(backuptype, dbname, path) values ('log', 'metadata','C:\zzm\')

insert into master.dbo.BackupParameter (backuptype, dbname, path) values ('LogShipping','Test_LogShipping','\\76421xp\sharedfoler\')

*/
/***********************************************
	Create BackupLog table on production server, only use this table to control logshipping and restoration
***********************************************/
create table master.dbo.BackupLog
(
	ID int identity,
	DBname varchar(100),
	BackupType varchar(20),
	backuptime datetime,
	Source_filename varchar(200),
	Dest_filename varchar(200),
	status varchar(20) -- Backup, CopyFailed, Copied, Deleted
)

USE [master]
GO

ALTER TABLE [dbo].[BackupLog] ADD  CONSTRAINT [PK_BackupLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)

USE [master]
GO

CREATE NONCLUSTERED INDEX [IX_BackupLog] ON [dbo].[BackupLog] 
(
	[DBname] ASC,
	[ID] DESC
)

/***********************************************
	Create RestoreLog table on standby server
***********************************************/
create table master.dbo.RestoreLog
(
	ID int identity,
	DBname varchar(100),
	BackupType varchar(20),
	CopyTime datetime,
	Restore_filename varchar(200),
	status varchar(20)  default 'Copied' -- Copied, RestoreFailed, Restored, Deleted
)

ALTER TABLE [dbo].restoreLog ADD  CONSTRAINT [PK_RestoreLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)

USE [master]
GO

CREATE NONCLUSTERED INDEX [IX_RestoreLog] ON [dbo].[RestoreLog] 
(
	[DBname] ASC,
	[ID] DESC
)


/***********************************************************

	create restore parameter table on the standby database
	
***********************************************************/
create table master.dbo.RestoreParameter
(
	DBname varchar(100),
	Logical_File_Name varchar(200),
	OS_File_Name varchar(200)
)

insert into master.dbo.RestoreParameter(dbname, Logical_File_Name,OS_File_Name)
values ('TEST_LogShipping','TEST_LogShipping','C:\MSSQL\Data\TEST_LogShipping.mdf')
insert into master.dbo.RestoreParameter(dbname, Logical_File_Name,OS_File_Name)
values ('TEST_LogShipping','TEST_LogShipping_log','C:\MSSQL\Data\TEST_LogShipping_log.ldf')
