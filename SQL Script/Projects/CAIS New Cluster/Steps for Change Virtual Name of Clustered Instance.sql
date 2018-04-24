
Installing the test instance:

1) create the alias name ZVSPDBSCAIS\ZICAISDB01 with named pipes protocol on both nodes


2) installing SQL Server:  
	Virtual Server name: ZVSPDBSCAIS
	Instance name: ZICAISDB01
	collate: binary
	account: x-james


3) Set AWE 
	exec sp_configure 'awe enabled',1
	exec sp_configure 'max server memory (MB)' , 12000
	exec sp_configure 'min server memory (MB)' , 1024
	reconfigure with override
	go

4) changes the SQL service account to PHSABC\srvsqcais


5) change the virtural Server name from ZVSPDBSCAIS to ZVCAISDB01:

	1) delete the client alias name for ZVCAISDB01\ZICAISDB01

	2) In server network utility, change named pipe protocol setting to \\.\pipe\$$\ZVCAISDB01\MSSQL$ZICAISDB01\sql\query
	   (Later testing shows that this step looks no necessary????)

	3). take the SQL Server resource offline

	4) take the Network resourvce offline
	5) change the Network Name to ZVCAISDB01, bring the Network resource online
	6) bring SQL Server resource online





	3. launch Client Network Utility, change the alia name in Alias tab to reflect the new name if Named pipe protocol is used or use IP protocol

	1. bring SQL Server resource online. It may fail at first. It will work later eventually. 

	2. launch Server network Utility, Change the named pipe value to reflect the new name;


 