


exec master.dbo.hsp_restore_latest_universal_backup @source_dbname='Hssbc',
	 @dest_dbname = 'Hssbc', 
	 @path = '\\Spdbsbslm006\SQL_Backup\full\Hssbc\', 
	 @with_clause = 'with replace, stats'
go



exec master.dbo.hsp_restore_latest_universal_backup @source_dbname='HssbcTicket',
	 @dest_dbname = 'HssbcTicket', 
	 @path = '\\Spdbsbslm006\SQL_Backup\full\HssbcTicket\', 
	 @with_clause = 'with replace, stats'
go


exec master.dbo.hsp_restore_latest_universal_backup @source_dbname='ContractRegistry',
	 @dest_dbname = 'ContractRegistry', 
	 @path = '\\Spdbsbslm006\SQL_Backup\full\ContractRegistry\', 
	 @with_clause = 'with replace, stats'
go



exec master.dbo.hsp_restore_latest_universal_backup @source_dbname='MIMSystem',
	 @dest_dbname = 'MIMSystem', 
	 @path = '\\Spdbsbslm006\SQL_Backup\full\MIMSystem\', 
	 @with_clause = 'with replace, stats'
go



exec master.dbo.hsp_restore_latest_universal_backup @source_dbname='InnoIntake',
	 @dest_dbname = 'InnoIntake', 
	 @path = '\\Spdbsbslm006\SQL_Backup\full\InnoIntake\', 
	 @with_clause = 'with replace, stats'
go



exec master.dbo.hsp_restore_latest_universal_backup @source_dbname='EnvironmentConfig',
	 @dest_dbname = 'EnvironmentConfig', 
	 @path = '\\Spdbsbslm006\SQL_Backup\full\EnvironmentConfig\', 
	 @with_clause = 'with replace, stats'
go




-----------------------------------------------------------------------------------------------
IF  EXISTS (SELECT name FROM sys.databases WHERE name = 'HSSBC_Yesterday')
			DROP DATABASE HSSBC_Yesterday;

CREATE DATABASE HSSBC_Yesterday ON
	( NAME = HSSBC, FILENAME = 'H:\SQL_Data\HSSBC_Yesterday_Snapshot.mdf' )
	AS SNAPSHOT OF Hssbc;
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = 'HssbcTicket_Yesterday')
			DROP DATABASE HssbcTicket_Yesterday;

CREATE DATABASE HssbcTicket_Yesterday ON
	( NAME = HSSBC, FILENAME = 'H:\SQL_Data\HssbcTicket_Yesterday_Snapshot.mdf' )
	AS SNAPSHOT OF Hssbc;
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = 'ContractRegistry_Yesterday')
			DROP DATABASE ContractRegistry_Yesterday;

CREATE DATABASE ContractRegistry_Yesterday ON
	( NAME = HSSBC, FILENAME = 'H:\SQL_Data\ContractRegistry_Yesterday_Snapshot.mdf' )
	AS SNAPSHOT OF Hssbc;
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = 'MIMSystem_Yesterday')
			DROP DATABASE MIMSystem_Yesterday;

CREATE DATABASE MIMSystem_Yesterday ON
	( NAME = HSSBC, FILENAME = 'H:\SQL_Data\MIMSystem_Yesterday_Snapshot.mdf' )
	AS SNAPSHOT OF Hssbc;
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = 'InnoIntake_Yesterday')
			DROP DATABASE InnoIntake_Yesterday;

CREATE DATABASE InnoIntake_Yesterday ON
	( NAME = HSSBC, FILENAME = 'H:\SQL_Data\InnoIntake_Yesterday_Snapshot.mdf' )
	AS SNAPSHOT OF Hssbc;
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = 'EnvironmentConfig_Yesterday')
			DROP DATABASE EnvironmentConfig_Yesterday;

CREATE DATABASE EnvironmentConfig_Yesterday ON
	( NAME = HSSBC, FILENAME = 'H:\SQL_Data\EnvironmentConfig_Yesterday_Snapshot.mdf' )
	AS SNAPSHOT OF Hssbc;
GO
















--------------------------------------------------------------------------------------------------------------------------------

From: Ko, Yancey [BCCSS] [Yancey.Ko@hssbc.ca]
Sent: Monday, May, 14, 2018 10:57 PM
To: Service Desk (IT Contact PHSA) [BCCSS] [ITContact@hssbc.ca]
Subject: Backup/Restore Databases

Hi there,


Please connect to DBA teams to backup/restore databases:


1). Source Database Server - SPDBSBSLM006

      -> Hssbc

      -> HssbcTicket

      -> ContractRegistry

      -> MIMSystem

      -> InnoIntake

      -> EnvironmentConfig


2). Destination Database Server - SPDBSBSLM005


3). Setup Snapshots per database above on SPDBSBSLM005 just like SPDBSBSLM006


4). Create daily backup on SPDBSBSLM005


Please connect with me prior to doing any of the above; there needs to coordinate with PHSA Web IT Solutions Team.


Thanks,

  Yancey