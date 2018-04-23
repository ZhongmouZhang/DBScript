USE master;  
GO  
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '<UseStrongPasswordHere>';  -- create database master key
go  
CREATE CERTIFICATE MyServerCert WITH SUBJECT = 'My DEK Certificate';   -- create a certificate used to encrypt database encryption key
go  
USE AdventureWorks2012;  
GO  
CREATE DATABASE ENCRYPTION KEY  -- create database encryption key
WITH ALGORITHM = AES_128  
ENCRYPTION BY SERVER CERTIFICATE MyServerCert;  
GO  
ALTER DATABASE AdventureWorks2012  
SET ENCRYPTION ON;  
GO  


----------------------------------------- TDE views and dynamic management views   -------------------------
sys.databases
sys.certificates
sys.dm_database_encryption_keys
