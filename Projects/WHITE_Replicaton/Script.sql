1. Publisher: SQL Server instance in all HA 
	VCHSQLDBP02: TEST and Prod of VCH, PHC

1) find the distributor:
	USE master
	EXEC sp_helpdistributor;
	GO

1.1. Publications:
1.1.1 Articles:

2. distributor: SPDBWHTDIST

1) list all the distribution database
	USE master
	EXEC sp_helpdistributiondb;
	GO

3. Subscribor: SPDBWHTSUB