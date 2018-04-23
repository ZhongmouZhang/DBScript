/************************************************************
	log in Oracle with Windows account
************************************************************/
1. add my windows account into ORA_DBA group
2. set ORACLE_SID=BCTS
3. sqlplus
	/ as sysdba
	
C:\oracle\ora92\network\admin\tnsnames.ora contains all the definitions of Oracle Services.


/**************************************************************
	Listener Control
**************************************************************/

lsnrctll

 
/*****************************************************************
		Common View
*****************************************************************/
V$Version;



/****************************************************************

	Objects in a tablespace
	
******************************************************************/
select	OWNER,
	SEGMENT_NAME,
	SEGMENT_TYPE,
	TABLESPACE_NAME,
	BYTES
from 	dba_segments
where	OWNER='BCTS'
order 	by OWNER, SEGMENT_NAME


select	distinct TABLESPACE_NAME
from 	dba_segments
where	OWNER='BCTS'
order 	by OWNER, SEGMENT_NAME




/*************************************************************
		pfile and spfile
**************************************************************/
show parameter spfile
create spfile from pfile
create pfile from spfile

-------------------------------------------------------------
		comment stuff
-------------------------------------------------------------------
startup nomount

alter database mount

alter database open


select * from v$instance, v$parameter, v$database

select name, value from v$parameter where name = 'spfile';

--------------------------------------------------------------
		 start Oracle with/without archivinglog
-------------------------------------------------------------------
sqlplus /nolog

connect sys/zzmzzm as sysdba

SHUTDOWN;

STARTUP MOUNT EXCLUSIVE;

(1) Changing the database archiving mode
	ALTER DATABASE NOARCHIVELOG (Archivelog);
	ALTER DATABASE OPEN;
	
(2) Enabling/Disabling Automatic Archiving
	LOG_ARCHIVE_START=TRUE/FALSE
	or 
	ALTER SYSTEM ARCHIVE LOG START/STOP
	
(3) Performing Manual Archivin
	ALTER SYSTEM ARCHIVE LOG ALL
	
(4) Specifying Archive Destinations
	LOG_ARCHIVE_DEST_N='LOCATION=C:\DESTINATION_FOLDER'
	or
	LOG_ARCHIVE_DEST_N='SERVICE=srvc1'   -- Net8 service name
	
(5) List ARCHIVE INFO in SQLPLUS
	ARCHIVE LOG LIST;



-------------------------------------------------------------------
		 enable flashback database
-------------------------------------------------------------------
1)Make sure the database is in archive mode.
2) Configure the recovery area by setting the two parameters:
	db_recovery_file_dest
	db_recovery_file_dest_size

	ALTER SYSTEM SET db_recovery_file_dest = "C:\oracle" SCOPE=SPFILE
	ALTER SYSTEM SET db_recovery_file_dest_size = 20G SCOPE=MEMORY
	ALTER SYSTEM SET db_recovery_file_dest_size = 20G SCOPE=SPFILE

	ALter system statement can be used to modify all the parameters in spfile.

3) Open the database in MOUNT EXCLUSIVE mode and turn on the flashback 
feature:
	SQL> STARTUP MOUNT EXCLUSIVE;
	SQL> ALTER DATABASE FLASHBACK ON;
4) Set the Flashback Database retention target:
	db_flashback_retention_target

5) Determine if Flashback Database is enabled:

	sQL> select flashback_on
    	  2  from   v$database;

------------------------------------------------------------------
		dump explanation
------------------------------------------------------------------
./admin folder
adump: audit
bdump: backgroud
cdump: core
dpdump:data pump
pfile:
udump: user
udump:



----------------------------------------------------------------
		Manually configure the oracle 10g EM dbconsole
-------------------------------------------------------------------
(1) Create the Database Control Repository and setup the OC4J Application 
Server

Make sure, that you can connect to the Repository Database (Test it with 
SQL*Plus). Examples for Setup Files can be found here:

Windows            Linux

LISTENER.ORA       listener.ora
SQLNET.ORA         sqlnet.ora
TNSNAMES.ORA       tnsnames.ora


(2) start the Oracle EM dbconsole Build Script ($ORACLE_HOME/bin/emca for 
Linux and $ORACLE_HOME\Bin\emca.bat for Windows).

$ emca -repos create
$ emca -config dbcontrol db


------------------------------------------------------------
		 delete all the flash recovery area
----------------------------------------------------------------
RMAN> connect target sys/<password>
RMAN> delete archivelog all;
RMAN>crosscheck archivelog all;


----------------------------------------------------------------
		RMAN operations
----------------------------------------------------------------
backup database  # full backup

SQL 'ALTER SYSTEM ARCHIVE LOG CURRENT'; # switches logs and archives all
logs. The generated log file log all the changes during the full database
backup time

-- most typical rman statement for backup the database with incrementally 
updated backups:
RUN {
   RECOVER COPY OF DATABASE WITH TAG 'incr_update';
   BACKUP INCREMENTAL LEVEL 1 FOR RECOVER OF COPY WITH TAG 'incr_update'
       DATABASE;
   }

-- following statement providing a seven day window:
RUN {
   RECOVER COPY OF DATABASE WITH TAG 'incr_update'
       UNTIL TIME 'SYSDATE - 7';
   BACKUP INCREMENTAL LEVEL 1 FOR RECOVER OF COPY WITH TAG 'incr_update'
       DATABASE;
   }


-- enabling and disabling change tracking for speeding up the differential 
backup
SQL> alter database enable block change tracking


/*******************************************************
	tables and their row numbers
*******************************************************/

select table_name, num_rows from all_tables where owner='HR61'


