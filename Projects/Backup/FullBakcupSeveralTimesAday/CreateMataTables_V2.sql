/***************************************************
		Create Backup parameter table
***************************************************/
--drop table master.dbo.BackupParameter
 create table master.dbo.BackupParameter
(
	backuptype varchar(20) not null default ('Full'),  -- Full , Log, differential
	dbname varchar(100),		-- default: specify the default backup folder 
								--          and full backup time for all the databases
								-- specific database name: specify the special feature about this database 
	backuptime varchar(10),		-- Null: don't need the backup for the dbname
	path   varchar(512),		-- backup path. 
	excluded int not null default (0)
)

insert into master.dbo.BackupParameter(dbname, backuptime, path) 
values ('default','20:00','C:\MSSQL\Backup\')

insert into master.dbo.BackupParameter(backuptype, backuptime, dbname, path) 
values ('full', '10:00', 'metadata','C:\MSSQL\Backup\')

insert into master.dbo.BackupParameter(backuptype, dbname, path) values ('log', 'metadata','C:\MSSQL\Backup\')


-- drop table master.dbo.BackupLog
create table master.dbo.BackupLog
(
	ID int identity,
	DBname varchar(100),
	BackupType varchar(20),
	backuptime datetime,
	Source_filename varchar(200),
	status varchar(20) -- Backup, Deleted
)

USE [master]
GO

ALTER TABLE [dbo].[BackupLog] ADD  CONSTRAINT [PK_BackupLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
