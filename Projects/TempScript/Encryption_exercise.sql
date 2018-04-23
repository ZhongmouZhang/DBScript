 USE EncryptTest
GO
CREATE TABLE TestTable (FirstCol INT, SecondCol VARCHAR(50))
GO
INSERT INTO TestTable (FirstCol, SecondCol)
SELECT 1,'First'
UNION ALL
SELECT 2,'Second'
UNION ALL
SELECT 3,'Third'
UNION ALL
SELECT 4,'Fourth'
UNION ALL
SELECT 5,'Fifth'
GO
/* Check the content of the TestTable */
USE EncryptTest
GO
SELECT *
FROM TestTable
GO

/* Create Database Master Key */
USE EncryptTest
GO
CREATE MASTER KEY ENCRYPTION
BY PASSWORD = 'SQLAuthority'
GO


/* Create Encryption Certificate */
USE EncryptTest
GO
CREATE CERTIFICATE EncryptTestCert
WITH SUBJECT = 'SQLAuthority'
GO


/* Create Symmetric Key */
USE EncryptTest
GO
CREATE SYMMETRIC KEY TestTableKey
WITH ALGORITHM = TRIPLE_DES ENCRYPTION
BY CERTIFICATE EncryptTestCert
GO


/*  Encrypt Data using Key and Certificate
Add Columns which will hold the encrypted data in binary */
USE EncryptTest
GO
ALTER TABLE TestTable
ADD EncryptSecondCol VARBINARY(256)
GO


/* Update binary column with encrypted data created by certificate and key */
USE EncryptTest
GO
OPEN SYMMETRIC KEY TestTableKey DECRYPTION
BY CERTIFICATE EncryptTestCert
UPDATE TestTable
SET EncryptSecondCol = ENCRYPTBYKEY(KEY_GUID('TestTableKey'),SecondCol)
GO


/* Check the content of the TestTable */
USE EncryptTest
GO
SELECT *
FROM TestTable
GO


/* Decrypt the data of the SecondCol  */
USE EncryptTest
GO
OPEN SYMMETRIC KEY TestTableKey DECRYPTION
BY CERTIFICATE EncryptTestCert
SELECT CONVERT(VARCHAR(50),DECRYPTBYKEY(EncryptSecondCol)) AS DecryptSecondCol
FROM TestTable
GO


/* View princip and permission in a database  */
SELECT * FROM sys.fn_builtin_permissions(default)

select * from sys.database_permissions
select * from sys.database_principals
SELECT DATABASE_PRINCIPAL_ID('db_owner');
GO


grant control on certificate::EncryptTestCert to [PHSABC\jzhang2]
grant view definition on Symmetric key :: TestTableKey to [PHSABC\jzhang2]








