
create table master.dbo.BackupParameter
(
	backuptype varchar(20) not null default ('Full'),  -- Full , Log, Specific (to backup the database)
	dbname varchar(100),
	path   varchar(512),
	excluded int not null default (0)
)

insert into master.dbo.BackupParameter(dbname, path) values ('default','C:\MSSQL\Backup\')

insert into master.dbo.BackupParameter(dbname, path) values ('LogSwitch_FullBackup','20:00')

insert into master.dbo.BackupParameter(backuptype, dbname, path) values ('log', 'metadata','C:\zzm\')

insert into master.dbo.BackupParameter values ('model','C:\zzm\',0)

delete from master.dbo.BackupParameter where dbname='model'


