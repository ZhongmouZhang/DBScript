

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
	_next_loop:
		SELECT @db=MIN(dbname) FROM #temp
		WHERE @db<dbname

		IF @db IS NULL BREAK 

		-- if HADR is enabled and current replica is a primary replica, skip it
		if (SELECT SERVERPROPERTY ('IsHadrEnabled'))=1 
		begin
			if  sys.fn_hadr_is_primary_replica(@db) != 1
				goto _next_loop
		end

		SET @sqlstr='USE ['+@db+'];
		EXEC sp_updatestats'
		EXEC (@sqlstr);
	END
END
go

 