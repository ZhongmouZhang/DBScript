
 /******************************************************************

	Update Statistics
	
*******************************************************************/
use master
go

SET QUOTED_IDENTIFIER ON
GO
IF OBJECTPROPERTY ( object_id('hsp_update_statistics'),'IsProcedure') = 1
	DROP PROC hsp_update_statistics
GO


CREATE PROCEDURE hsp_update_statistics
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
		SET @sqlstr='USE ['+@db+'];
		EXEC sp_updatestats'
		EXEC (@sqlstr);
	END
END
go

 