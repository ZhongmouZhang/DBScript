  /***************************************
	Create BackupParameter table
****************************************/

create table master.dbo.BackupParameter
(
	backuptype varchar(50) not null default ('Full'),   -- Full , Differential, Log
														--LogShipping: path is the destination
														--RemoteBackup_Log, _Full, _Differential
														
														-- DeleteBackupOneDayOlder: Delete all the backup before the time point
														
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
	dbname ASC,
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
	id int identity,
	dbname varchar(100),
	backuptype varchar(20),
	backuptime datetime,
	source_filename varchar(200),
	dest_filename varchar(200),
	status varchar(20) -- Backup, CopyFailed, Copied, Deleted
)

USE [master]
GO

ALTER TABLE [dbo].[BackupLog] ADD  CONSTRAINT [PK_BackupLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)

