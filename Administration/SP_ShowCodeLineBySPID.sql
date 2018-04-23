 IF EXISTS
(
	SELECT 1
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_NAME = 'SP_ShowCodeLineBySPID'
	AND ROUTINE_SCHEMA = 'dbo'
	AND ROUTINE_TYPE = 'PROCEDURE'
)
BEGIN
	PRINT 'Procedure SP_ShowCodeLineBySPID already exists...Dropping it and recreating'
	DROP PROC dbo.SP_ShowCodeLineBySPID
END
ELSE
BEGIN
	PRINT 'Creating procedure SP_ShowCodeLineBySPID'
END
GO

CREATE PROC dbo.SP_ShowCodeLineBySPID
(
	@SPID smallint,
	@WAIT tinyint = 0,    -- Wait time Second
	@NoLoop bit = 0		-- Loop or no
)
AS
BEGIN
	
	SET NOCOUNT ON
 
	DECLARE @sql_handle binary(20), @handle_found bit
	DECLARE @stmt_start int, @stmt_end int
	DECLARE @line nvarchar(4000), @wait_str varchar(8)
 
	SET @handle_found = 0
 
	IF @WAIT NOT BETWEEN 0 AND 60
	BEGIN
		RAISERROR('Valid values for @WAIT are from 0 to 60 seconds', 16, 1)
		RETURN -1
	END
	ELSE
	BEGIN
		SET @wait_str = '00:00:' + RIGHT('00' + CAST(@WAIT AS varchar(2)), 2)
	END
 
	WHILE 1 = 1
	BEGIN
		SELECT	@sql_handle = sql_handle,
			@stmt_start = stmt_start/2,
			@stmt_end = CASE WHEN stmt_end = -1 THEN -1 ELSE stmt_end/2 END
			FROM master.dbo.sysprocesses
			WHERE	spid = @SPID
				AND ecid = 0
  
		IF @sql_handle = 0x0
		
		/*
			--If you are running this on SQL Server 2005, then change the above line to the following:

			IF(@sql_handle = 0x0) OR (@stmt_start = 0 AND @stmt_end = 0)

			--Without this change, this procedure might go into an infinite loop and needs to be killed
			--In SQL Server 2000, as soon as a batch completed, 
			--the sql_handle column in sysprocesses becomes 0, but that's not the case in SQL Server 2005
		*/
		
		BEGIN
			IF @handle_found = 0
			BEGIN
				RAISERROR('Cannot find handle or the SPID is invalid', 16, 1)
				RETURN -1
			END
			ELSE
			BEGIN
				RAISERROR('Query/Stored procedure completed', 0, 1)
				RETURN 0
			END
		END
		ELSE
		BEGIN
			SET @handle_found = 1
		END
 
		SET @line = 
		(
			SELECT 
				SUBSTRING(	text,
						COALESCE(NULLIF(@stmt_start, 0), 1),
						CASE @stmt_end 
							WHEN -1 
								THEN DATALENGTH(text) 
							ELSE 
								(@stmt_end - @stmt_start) 
    						END
					) 
   			FROM ::fn_get_sql(@sql_handle)
  		)
 
		RAISERROR(@line, 0, 1) WITH NOWAIT
 
		IF @NoLoop = 1
		BEGIN
			RETURN 0
		END
 
		WAITFOR DELAY @wait_str
 
	END
 
END
GO

