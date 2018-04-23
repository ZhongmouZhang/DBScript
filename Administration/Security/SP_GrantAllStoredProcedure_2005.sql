 CREATE PROCEDURE spGrantExectoAllStoredProcs @user sysname
AS 
/*----------------------------------------------------------------------------
-- Object Name: spGrantExectoAllStoredProcs
-- Author: Edgewood Solutions
-- Development Date: 03.19.2007
-- Called By: TBD
-- Description: Issue GRANT EXEC statement for all stored procedures 
-- based on the user name that is passed in to this stored procedure
-- Project: SQL Server Security
-- Database: User defined databases 
-- Business Process: SQL Server Security
-- 
----------------------------------------------------------------------------
-- Num | CRF ID | Date Modified | Developer | Description
----------------------------------------------------------------------------
-- 001 | N\A      | 03.15.2007    | Edgewood | Original code for the GRANT 
-- EXEC process
--
-- 
*/

SET NOCOUNT ON

--declare @user sysname
--set @user = 'awpweb'

-- 1 - Variable declarations
DECLARE @CMD1 varchar(8000)
DECLARE @MAXOID int
DECLARE @OwnerName varchar(128)
DECLARE @ObjectName varchar(128)

-- 2 - Create temporary table
CREATE TABLE #StoredProcedures
(OID int IDENTITY (1,1),
StoredProcOwner varchar(128) NOT NULL,
StoredProcName varchar(128) NOT NULL)

-- 3 - Populate temporary table
INSERT INTO #StoredProcedures (StoredProcOwner, StoredProcName)
SELECT ROUTINE_SCHEMA, ROUTINE_NAME
FROM INFORMATION_SCHEMA.ROUTINES 
WHERE ROUTINE_NAME NOT LIKE 'dt_%'
AND ROUTINE_TYPE = 'PROCEDURE'

-- 4 - Capture the @MAXOID value
SELECT @MAXOID = MAX(OID) FROM #StoredProcedures

-- 5 - WHILE loop
WHILE @MAXOID > 0
BEGIN 

-- 6 - Initialize the variables
SELECT @OwnerName = StoredProcOwner,
@ObjectName = StoredProcName
FROM #StoredProcedures
WHERE OID = @MAXOID

-- 7 - Build the string
SELECT @CMD1 = 'GRANT EXEC ON ' + '[' + @OwnerName + ']' + '.' + '[' + @ObjectName + ']' + ' TO ' + @user

-- 8 - Execute the string
-- SELECT @CMD1
EXEC(@CMD1)

-- 9 - Decrement @MAXOID
SET @MAXOID = @MAXOID - 1
END

-- 10 - Drop the temporary table
DROP TABLE #StoredProcedures

SET NOCOUNT OFF
GO
