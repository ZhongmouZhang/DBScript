
/*********************************************
		change instance name:
**********************************************/
 select @@servername

sp_dropserver 'SQLSERVER'

sp_addserver 'ZVMSASSQASQ01', local


/*********************************************

	enable service broke for DB Mail
	
**********************************************/

use master
go

alter database msdb set new_broker  -- give a new broker ID for restored DB
go

ALTER DATABASE msdb SET ENABLE_BROKER with rollback immediate



SELECT is_broker_enabled, db_name (database_id) FROM sys.databases 

WHERE database_id = DB_ID() ;

