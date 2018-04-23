
/****************************************************************

		Check database integrity
		
*******************************************************************/
use master
go

IF OBJECTPROPERTY ( object_id('hsp_check_integrity'),'IsProcedure') = 1
	DROP PROC hsp_check_integrity
GO

CREATE PROCEDURE hsp_check_integrity
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @db as varchar (100),@sqlstr as varchar(1200)

	SET @db=''
	WHILE (@db IS NOT NULL)
	BEGIN
		SELECT @db=MIN(dbname) FROM #temp
		WHERE @db<dbname

		IF @db IS NULL BREAK 
		print 'Checking the integrity of the database: ' + @db + '......'
		SET @sqlstr='USE ['+@db+'];
		DBCC CHECKDB WITH NO_INFOMSGS'
		EXEC (@sqlstr);
	END
END
go

 