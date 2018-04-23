if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprAppSettingAsResultSet]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprAppSettingAsResultSet]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprAppSetting_Print]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprAppSetting_Print]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_CalculateFiltersForPeriodAndYear]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_CalculateFiltersForPeriodAndYear]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_CalculateFiltersForPeriodAndYear_20051003]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_CalculateFiltersForPeriodAndYear_20051003]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_CreateOrSetCurrentValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_CreateOrSetCurrentValue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_CreateOrSetDefaultValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_CreateOrSetDefaultValue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_CreateOrSetValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_CreateOrSetValue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_IncrementFiltersForPeriodAndYear]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_IncrementFiltersForPeriodAndYear]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_SetCurrentProfile]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_SetCurrentProfile]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_SetCurrentProfileToDefault]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_SetCurrentProfileToDefault]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_SetCurrentValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_SetCurrentValue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_SetCurrentValueIfExists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_SetCurrentValueIfExists]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_SetDefaultValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_SetDefaultValue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_SetDefaultValueIfExists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_SetDefaultValueIfExists]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_SetValue]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_SetValue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_SetValueIfExists]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_SetValueIfExists]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprApplicationSettings_Statistics_ResetAll]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprApplicationSettings_Statistics_ResetAll]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprDtsLoadSimpleTables_ExecuteSQL]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprDtsLoadSimpleTables_ExecuteSQL]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprDtsLoadSimpleTables_InsertBlankRecord]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprDtsLoadSimpleTables_InsertBlankRecord]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprDtsLoadSimpleTables_SetDeletedRecordCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprDtsLoadSimpleTables_SetDeletedRecordCount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprDtsLoadSimpleTables_SetInsertedRecordCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprDtsLoadSimpleTables_SetInsertedRecordCount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprDtsLoadSimpleTables_SetLoadStatistics]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprDtsLoadSimpleTables_SetLoadStatistics]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprDtsLoadSimpleTables_SetTruncatedRecordCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprDtsLoadSimpleTables_SetTruncatedRecordCount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprDtsLoadSimpleTables_SetUpdatedRecordCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprDtsLoadSimpleTables_SetUpdatedRecordCount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprDtsLoadSimpleTables_TableSpecificSettings]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprDtsLoadSimpleTables_TableSpecificSettings]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetailsForBU_AMG]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetailsForBU_AMG]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetailsForBU_APG]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetailsForBU_APG]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetailsForBU_IFX]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetailsForBU_IFX]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetailsForBU_ING]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetailsForBU_ING]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetailsForBU_ONL]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetailsForBU_ONL]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetailsForBU_PO]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetailsForBU_PO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetailsForBU_PYG]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetailsForBU_PYG]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetails_AMG]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetails_AMG]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetails_APG]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetails_APG]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetails_IFX]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetails_IFX]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetails_ING]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetails_ING]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetails_ONL]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetails_ONL]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetails_PO]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetails_PO]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[aprJrnlDetails_PYG]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[aprJrnlDetails_PYG]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprAppSettingAsResultSet    Script Date: 5/21/2003 11:06:54 PM ******/
/****** Object:  Stored Procedure dbo.aprAppSettingAsResultSet    Script Date: 3/28/2003 3:00:02 PM ******/


CREATE  PROCEDURE aprAppSettingAsResultSet 
	@SettingName varchar(256)
AS
	SELECT dbo.fnsAppSetting(@SettingName) as Value




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprAppSetting_Print    Script Date: 5/21/2003 11:06:54 PM ******/

CREATE  PROCEDURE aprAppSetting_Print
	@SettingName varchar(256)
AS
PRINT '-- Setting Name: ' + @SettingName
PRINT CONVERT(nvarchar(4000), dbo.fnsAppSetting(@SettingName))



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  Stored Procedure dbo.aprApplicationSettings_CalculateFiltersForPeriodAndYear    Script Date: 6/5/2003 4:30:39 PM ******/


CREATE   PROCEDURE aprApplicationSettings_CalculateFiltersForPeriodAndYear 
	@LinkedServerName nvarchar(128),
	@SourceDatabaseName nvarchar(128)
AS
DECLARE @SqlToExecute nvarchar(4000),
	@PlaceHolderForLinkedServerName nvarchar(128),
	@PlaceHolderForSourceDatabaseName nvarchar(128),
	@Params nvarchar(100),
	@CalendarID char(2), @SetID char(5)

SET @SqlToExecute = 'DECLARE @CurrentPeriodStart PSDATE,
	@PreviousPeriodEnd PSDATE,
	@YearValue smallint,
	@PeriodValue smallint

SELECT @CurrentPeriodStart = BEGIN_DT,
	@YearValue = FISCAL_YEAR,
	@PeriodValue = ACCOUNTING_PERIOD

FROM <LinkedServerName>.<SourceDatabaseName>.dbo.PS_CAL_DETP_TBL src
WHERE 
	SUBSTRING(CONVERT(CHAR,GETDATE(),121),1,10) BETWEEN BEGIN_DT AND END_DT
	AND (@FilterForSetID IS NULL OR src.SETID = @FilterForSetID)
	AND (@FilterForCalendarID IS NULL OR src.CALENDAR_ID = @FilterForCalendarID)

SET @PreviousPeriodEnd = DATEADD(d, -2, @CurrentPeriodStart)

--AJ 20051003 changed to set filter for period to be current period instead of ended period
/*SELECT
	@YearValue = FISCAL_YEAR,
	@PeriodValue = ACCOUNTING_PERIOD
FROM <LinkedServerName>.<SourceDatabaseName>.dbo.PS_CAL_DETP_TBL src
WHERE 
	@PreviousPeriodEnd BETWEEN BEGIN_DT AND END_DT
	AND (@FilterForSetID IS NULL OR src.SETID = @FilterForSetID)
	AND (@FilterForCalendarID IS NULL OR src.CALENDAR_ID = @FilterForCalendarID)*/

-- Update the year setting
EXEC dbo.aprApplicationSettings_CreateOrSetCurrentValue ''FilterForFiscalYearUpToAndIncluding'', @YearValue, ''Set the year that we should be importing ledger and transaction data up until.''
	
-- And update the period setting
EXEC dbo.aprApplicationSettings_CreateOrSetCurrentValue ''FilterForPeriodUpToAndIncluding'', @PeriodValue, ''Set the period (within the year specified by the FilterForYearUpToAndIncluding value) that we should be importing ledger and transaction data up until.  This value is inclusive but will not limit records from previous years e.g. the filter criteria will be similar to WHERE Year < FilterForYearUpToAndIncluding OR (Year = FilterForYearUpToAndIncluding AND Period <= FilterForPeriodUpToAndIncluding).''
'

SET @Params = '@FilterForCalendarID char(2), @FilterForSetID char(5)'

SELECT 
	@CalendarID = CONVERT(char(2), dbo.fnsAppSetting('FilterForCalendarID')),
	@SetID = CONVERT(char(5), dbo.fnsAppSetting('FilterForSetID')),
	@PlaceHolderForLinkedServerName = ISNULL(CONVERT(nvarchar(128), dbo.fnsAppSetting('PlaceHolderForLinkedServerName')), ''),
	@PlaceHolderForSourceDatabaseName = ISNULL(CONVERT(nvarchar(128), dbo.fnsAppSetting('PlaceHolderForSourceDatabaseName')), '')

IF LEN(@PlaceHolderForLinkedServerName) > 0
	BEGIN
	SET @LinkedServerName = QUOTENAME(@LinkedServerName)

	SELECT 
		@SqlToExecute = REPLACE(@SqlToExecute, @PlaceHolderForLinkedServerName, @LinkedServerName)
	END

IF LEN(@PlaceHolderForSourceDatabaseName) > 0
	BEGIN
	SELECT 
		@SqlToExecute = REPLACE(@SqlToExecute, @PlaceHolderForSourceDatabaseName, @SourceDatabaseName)
	END


EXECUTE sp_executesql @SqlToExecute, @Params, 
	@FilterForCalendarID = @CalendarID,
	@FilterForSetID = @SetID




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  Stored Procedure dbo.aprApplicationSettings_CalculateFiltersForPeriodAndYear    Script Date: 6/5/2003 4:30:39 PM ******/


CREATE  PROCEDURE aprApplicationSettings_CalculateFiltersForPeriodAndYear_20051003 
	@LinkedServerName nvarchar(128),
	@SourceDatabaseName nvarchar(128)
AS
DECLARE @SqlToExecute nvarchar(4000),
	@PlaceHolderForLinkedServerName nvarchar(128),
	@PlaceHolderForSourceDatabaseName nvarchar(128),
	@Params nvarchar(100),
	@CalendarID char(2), @SetID char(5)

SET @SqlToExecute = 'DECLARE @CurrentPeriodStart PSDATE,
	@PreviousPeriodEnd PSDATE,
	@YearValue smallint,
	@PeriodValue smallint

SELECT @CurrentPeriodStart = BEGIN_DT
FROM <LinkedServerName>.<SourceDatabaseName>.dbo.PS_CAL_DETP_TBL src
WHERE 
	SUBSTRING(CONVERT(CHAR,GETDATE(),121),1,10) BETWEEN BEGIN_DT AND END_DT
	AND (@FilterForSetID IS NULL OR src.SETID = @FilterForSetID)
	AND (@FilterForCalendarID IS NULL OR src.CALENDAR_ID = @FilterForCalendarID)

SET @PreviousPeriodEnd = DATEADD(d, -2, @CurrentPeriodStart)

SELECT
	@YearValue = FISCAL_YEAR,
	@PeriodValue = ACCOUNTING_PERIOD
FROM <LinkedServerName>.<SourceDatabaseName>.dbo.PS_CAL_DETP_TBL src
WHERE 
	@PreviousPeriodEnd BETWEEN BEGIN_DT AND END_DT
	AND (@FilterForSetID IS NULL OR src.SETID = @FilterForSetID)
	AND (@FilterForCalendarID IS NULL OR src.CALENDAR_ID = @FilterForCalendarID)

-- Update the year setting
EXEC dbo.aprApplicationSettings_CreateOrSetCurrentValue ''FilterForFiscalYearUpToAndIncluding'', @YearValue, ''Set the year that we should be importing ledger and transaction data up until.''
	
-- And update the period setting
EXEC dbo.aprApplicationSettings_CreateOrSetCurrentValue ''FilterForPeriodUpToAndIncluding'', @PeriodValue, ''Set the period (within the year specified by the FilterForYearUpToAndIncluding value) that we should be importing ledger and transaction data up until.  This value is inclusive but will not limit records from previous years e.g. the filter criteria will be similar to WHERE Year < FilterForYearUpToAndIncluding OR (Year = FilterForYearUpToAndIncluding AND Period <= FilterForPeriodUpToAndIncluding).''
'

SET @Params = '@FilterForCalendarID char(2), @FilterForSetID char(5)'

SELECT 
	@CalendarID = CONVERT(char(2), dbo.fnsAppSetting('FilterForCalendarID')),
	@SetID = CONVERT(char(5), dbo.fnsAppSetting('FilterForSetID')),
	@PlaceHolderForLinkedServerName = ISNULL(CONVERT(nvarchar(128), dbo.fnsAppSetting('PlaceHolderForLinkedServerName')), ''),
	@PlaceHolderForSourceDatabaseName = ISNULL(CONVERT(nvarchar(128), dbo.fnsAppSetting('PlaceHolderForSourceDatabaseName')), '')

IF LEN(@PlaceHolderForLinkedServerName) > 0
	BEGIN
	SET @LinkedServerName = QUOTENAME(@LinkedServerName)

	SELECT 
		@SqlToExecute = REPLACE(@SqlToExecute, @PlaceHolderForLinkedServerName, @LinkedServerName)
	END

IF LEN(@PlaceHolderForSourceDatabaseName) > 0
	BEGIN
	SELECT 
		@SqlToExecute = REPLACE(@SqlToExecute, @PlaceHolderForSourceDatabaseName, @SourceDatabaseName)
	END


EXECUTE sp_executesql @SqlToExecute, @Params, 
	@FilterForCalendarID = @CalendarID,
	@FilterForSetID = @SetID




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprApplicationSettings_CreateOrSetCurrentValue    Script Date: 5/21/2003 11:06:54 PM ******/

/****** Object:  Stored Procedure dbo.aprApplicationSettings_CreateOrSetCurrentValue    Script Date: 3/28/2003 3:00:02 PM ******/







CREATE     PROCEDURE aprApplicationSettings_CreateOrSetCurrentValue 
	@SettingName varchar(256),
	@NewValue sql_variant,
	@Description varchar(512) = NULL
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @ErrorCode int
	DECLARE @IsDefaultValue bit
	DECLARE @ProfileID int

	SELECT @IsDefaultValue = dbo.fnsAppSettingIsDefaultValue(@SettingName)

	IF @IsDefaultValue = 0 
		SET @ProfileID = dbo.fnsAppSettingCurrentProfile()
	ELSE
		SET @ProfileID = NULL

	-- Call the aprApplicationSettings_CreateOrSetValue procedure with a
	-- ProfileID parameter returned by dbo.fnsAppSettingCurrentProfile()
	-- to set the value for the setting
	EXEC @ErrorCode = aprApplicationSettings_CreateOrSetValue @SettingName, @ProfileID, @NewValue, @Description

	-- Pass the return value back up the calling chain (remember 
	-- that this will be zero if the update was successful)
	RETURN @ErrorCode

END









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprApplicationSettings_CreateOrSetDefaultValue    Script Date: 5/21/2003 11:06:54 PM ******/

/****** Object:  Stored Procedure dbo.aprApplicationSettings_CreateOrSetDefaultValue    Script Date: 3/28/2003 3:00:02 PM ******/





CREATE    PROCEDURE aprApplicationSettings_CreateOrSetDefaultValue 
	@SettingName varchar(256),
	@NewValue sql_variant,
	@Description varchar(512) = NULL
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @ErrorCode int

	-- Call the aprApplicationSettings_CreateOrSetValue procedure with a
	-- ProfileID parameter of NULL to set the value for the setting
	EXEC @ErrorCode = aprApplicationSettings_CreateOrSetValue @SettingName, NULL, @NewValue, @Description

	-- Pass the return value back up the calling chain (remember 
	-- that this will be zero if the update was successful)
	RETURN @ErrorCode

END







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprApplicationSettings_CreateOrSetValue    Script Date: 5/21/2003 11:06:54 PM ******/

/****** Object:  Stored Procedure dbo.aprApplicationSettings_CreateOrSetValue    Script Date: 3/28/2003 3:00:02 PM ******/




CREATE   PROCEDURE aprApplicationSettings_CreateOrSetValue 
	@SettingName varchar(256),
	@ProfileID int = NULL,
	@NewValue sql_variant,
	@Description varchar(512) = NULL
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @RecordsAffected int
	DECLARE @ErrorCode int

	-- Try to just update the value
	EXEC @ErrorCode = dbo.aprApplicationSettings_SetValueIfExists @SettingName, @ProfileID, @NewValue

	IF @ErrorCode = -1  -- Then the record didn't exist
		BEGIN
		-- ALTER the value for the given setting in the given profile
		INSERT INTO tblApplicationSettings
			([Profile], [Key], [Value], [Description])
		VALUES
			(@ProfileID, @SettingName, @NewValue, @Description)

		SELECT 	@RecordsAffected = @@RowCount, @ErrorCode = @@Error

		IF @RecordsAffected = 0
			BEGIN
			DECLARE @ProfileIDString varchar(20)
			IF @ProfileID IS NULL 
				SET @ProfileIDString = '[Default]'
			ELSE
				SET @ProfileIDString = CONVERT(varchar(20), @ProfileID)
	
			RAISERROR ('The setting "%s" could not be created for profile ID "%s".', 16, 1, @SettingName, @ProfileIDString)
			SET @ErrorCode = -1
			END
		END

	-- The error code will be zero if the record was created
	-- or updated properly, otherwise it will be the error code
	-- returned by SQL Server
	RETURN @@Error

END






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprApplicationSettings_IncrementFiltersForPeriodAndYear    Script Date: 6/5/2003 4:30:39 PM ******/



/****** Object:  Stored Procedure dbo.aprIncrementFiltersForPeriodAndYear    Script Date: 3/28/2003 3:00:02 PM ******/

CREATE  PROCEDURE aprApplicationSettings_IncrementFiltersForPeriodAndYear 
AS
	DECLARE @RC int
	DECLARE @ErrorCode int
	DECLARE @PeriodValue int
	DECLARE @YearValue int
	DECLARE @NewTimeKey int
	SELECT 
		@PeriodValue = CONVERT(int, ISNULL(dbo.fnsAppSetting('FilterForPeriodUpToAndIncluding'), 0)),
		@YearValue = CONVERT(int, ISNULL(dbo.fnsAppSetting('FilterForFiscalYearUpToAndIncluding'), DATEPART(yyyy, GETDATE()))),
		@ErrorCode = 0

	-- Add the period
	SET @NewTimeKey = dbo.fnsDimTimeKey_AddPeriods(@YearValue, @PeriodValue, 1)

	-- Get the new year value
	SET @YearValue = dbo.fnsDimTimeKey_GetYear(@NewTimeKey)

	-- and update the year setting
	EXEC @RC = dbo.aprApplicationSettings_CreateOrSetCurrentValue 'FilterForFiscalYearUpToAndIncluding', @YearValue, 'Set the year that we should be importing ledger and transaction data up until.'
	
	-- Record the return value
	SET @ErrorCode = @ErrorCode + @RC

	-- Get the new period value
	SET @PeriodValue = dbo.fnsDimTimeKey_GetPeriod(@NewTimeKey)

	-- and update the period setting
	EXEC @RC = dbo.aprApplicationSettings_CreateOrSetCurrentValue 'FilterForPeriodUpToAndIncluding', @PeriodValue, 'Set the period (within the year specified by the FilterForYearUpToAndIncluding value) that we should be importing ledger and transaction data up until.  This value is inclusive but will not limit records from previous years e.g. the filter criteria will be similar to WHERE Year < FilterForYearUpToAndIncluding OR (Year = FilterForYearUpToAndIncluding AND Period <= FilterForPeriodUpToAndIncluding).'

	-- Record the return value
	SET @ErrorCode = @ErrorCode + @RC

	-- Return the combined error code value
	RETURN @ErrorCode





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetCurrentProfile    Script Date: 5/21/2003 11:06:54 PM ******/

/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetCurrentProfile    Script Date: 3/28/2003 3:00:02 PM ******/




CREATE    PROCEDURE aprApplicationSettings_SetCurrentProfile 
	@ProfileID int
AS
	SET NOCOUNT ON

	-- Set the CurrentProfile value
	UPDATE tblApplicationSettings
	SET 
		[Value] = @ProfileID,
		[Description] = CASE LEN(RTRIM(ISNULL([Description], '')))
				WHEN 0 THEN 'Determines which profile key to use when looking up setting values.  Settings that do not have a value for the current profile key will return a value from the setting record with a NULL value in the profile key (or NULL if that record does not exist)'
				ELSE [Description] END
	WHERE [Profile] IS NULL AND [Key] = 'CurrentProfile'
	
	-- Return the error code
	RETURN @@Error






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetCurrentProfileToDefault    Script Date: 5/21/2003 11:06:54 PM ******/

/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetCurrentProfileToDefault    Script Date: 3/28/2003 3:00:02 PM ******/





CREATE     PROCEDURE aprApplicationSettings_SetCurrentProfileToDefault 
AS
	SET NOCOUNT ON

	-- Set the CurrentProfile value
	UPDATE tblApplicationSettings
	SET 
		[Value] = NULL,
		[Description] = CASE LEN(RTRIM(ISNULL([Description], '')))
				WHEN 0 THEN 'Determines which profile key to use when looking up setting values.  Settings that do not have a value for the current profile key will return a value from the setting record with a NULL value in the profile key (or NULL if that record does not exist)'
				ELSE [Description] END
	WHERE [Profile] IS NULL AND [Key] = 'CurrentProfile'
	
	-- Return the error code
	RETURN @@Error







GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetCurrentValue    Script Date: 5/21/2003 11:06:54 PM ******/

/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetCurrentValue    Script Date: 3/28/2003 3:00:02 PM ******/






CREATE     PROCEDURE aprApplicationSettings_SetCurrentValue 
	@SettingName varchar(256),
	@NewValue sql_variant
AS
BEGIN
	/* 
	Use this procedure instead of calling 
	aprApplicationSettings_SetDefaultValueIfExists directly if you wish 
	to raise an error if the record for the setting does not exist.
	 */

	SET NOCOUNT ON

	DECLARE @ErrorCode int
	DECLARE @IsDefaultValue bit
	DECLARE @ProfileID int

	SELECT @IsDefaultValue = dbo.fnsAppSettingIsDefaultValue(@SettingName)

	IF @IsDefaultValue = 0 
		SET @ProfileID = dbo.fnsAppSettingCurrentProfile()
	ELSE
		SET @ProfileID = NULL

	-- Call the aprApplicationSettings_SetValue procedure with a
	-- ProfileID parameter returned by dbo.fnsAppSettingCurrentProfile()
	-- to set the value for the setting
	EXEC @ErrorCode = aprApplicationSettings_SetValue @SettingName, @ProfileID, @NewValue

	-- Pass the return value back up the calling chain (remember 
	-- that this will be zero if the update was successful)
	RETURN @ErrorCode
	
END








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetCurrentValueIfExists    Script Date: 5/21/2003 11:06:54 PM ******/

/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetCurrentValueIfExists    Script Date: 3/28/2003 3:00:02 PM ******/








CREATE       PROCEDURE aprApplicationSettings_SetCurrentValueIfExists
	@SettingName varchar(256),
	@NewValue sql_variant
AS
BEGIN
	/* 
	Use this procedure directly if you wish to set a value for
	a particular setting without raising an error if the record
	for the setting does not exist.  If the record does not exist
	then this procedure will only notify you by returning a value
	of -1.
	 */
	SET NOCOUNT ON

	DECLARE @ErrorCode int
	DECLARE @IsDefaultValue bit
	DECLARE @ProfileID int

	SELECT @IsDefaultValue = dbo.fnsAppSettingIsDefaultValue(@SettingName)

	IF @IsDefaultValue = 0 
		SET @ProfileID = dbo.fnsAppSettingCurrentProfile()
	ELSE
		SET @ProfileID = NULL

	-- Call the aprApplicationSettings_SetValueIfExists procedure with a
	-- ProfileID parameter returned by dbo.fnsAppSettingCurrentProfile()
	-- to set the value for the setting

	EXEC @ErrorCode = aprApplicationSettings_SetValueIfExists @SettingName, @ProfileID, @NewValue

	-- Pass the return value back up the calling chain (remember 
	-- that this will be zero if the update was successful)
	RETURN @ErrorCode
	

END










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetDefaultValue    Script Date: 5/21/2003 11:06:55 PM ******/

/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetDefaultValue    Script Date: 3/28/2003 3:00:02 PM ******/




CREATE    PROCEDURE aprApplicationSettings_SetDefaultValue 
	@SettingName varchar(256),
	@NewValue sql_variant
AS
BEGIN
	/* 
	Use this procedure instead of calling 
	aprApplicationSettings_SetDefaultValueIfExists directly if you wish 
	to raise an error if the record for the setting does not exist.
	 */

	SET NOCOUNT ON

	DECLARE @ErrorCode int

	-- Call the aprApplicationSettings_SetValue procedure with a
	-- ProfileID parameter of NULL to set the value for the setting
	EXEC @ErrorCode = aprApplicationSettings_SetValue @SettingName, NULL, @NewValue

	-- Pass the return value back up the calling chain (remember 
	-- that this will be zero if the update was successful)
	RETURN @ErrorCode
	
END






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetDefaultValueIfExists    Script Date: 5/21/2003 11:06:55 PM ******/

/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetDefaultValueIfExists    Script Date: 3/28/2003 3:00:02 PM ******/






CREATE      PROCEDURE aprApplicationSettings_SetDefaultValueIfExists
	@SettingName varchar(256),
	@NewValue sql_variant
AS
BEGIN
	/* 
	Use this procedure directly if you wish to set a value for
	a particular setting without raising an error if the record
	for the setting does not exist.  If the record does not exist
	then this procedure will only notify you by returning a value
	of -1.
	 */
	SET NOCOUNT ON

	DECLARE @ErrorCode int

	-- Call the aprApplicationSettings_SetValueIfExists procedure with a
	-- ProfileID parameter of NULL to set the value for the setting
	EXEC @ErrorCode = aprApplicationSettings_SetValueIfExists @SettingName, NULL, @NewValue

	-- Pass the return value back up the calling chain (remember 
	-- that this will be zero if the update was successful)
	RETURN @ErrorCode
	

END








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetValue    Script Date: 5/21/2003 11:06:55 PM ******/

/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetValue    Script Date: 3/28/2003 3:00:02 PM ******/



CREATE   PROCEDURE aprApplicationSettings_SetValue 
	@SettingName varchar(256),
	@ProfileID int = NULL,
	@NewValue sql_variant
AS
BEGIN
	/* 
	Use this procedure instead of calling 
	aprApplicationSettings_SetValueIfExists directly if you wish 
	to raise an error if the record for the setting does not exist.
	 */

	SET NOCOUNT ON

	DECLARE @ErrorCode int

	-- Call the aprApplicationSettings_SetValueIfExists procedure
	-- to set the value for the setting
	EXEC @ErrorCode = dbo.aprApplicationSettings_SetValueIfExists @SettingName, @ProfileID, @NewValue

	IF @ErrorCode = -1
		BEGIN
		-- Then the record for the setting didn't exist
		-- so raise an error to notify the calling program
		DECLARE @ProfileIDString varchar(20)
		IF @ProfileID IS NULL 
			SET @ProfileIDString = '[Default]'
		ELSE
			SET @ProfileIDString = CONVERT(varchar(20), @ProfileID)

		RAISERROR ('The setting "%s" could not be found for profile ID "%s".', 16, 1, @SettingName, @ProfileIDString)
		END

	-- Pass the return value back up the calling chain (remember 
	-- that this will be zero if the update was successful)
	RETURN @ErrorCode
	

END





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetValueIfExists    Script Date: 5/21/2003 11:06:55 PM ******/

/****** Object:  Stored Procedure dbo.aprApplicationSettings_SetValueIfExists    Script Date: 3/28/2003 3:00:02 PM ******/






CREATE      PROCEDURE aprApplicationSettings_SetValueIfExists
	@SettingName varchar(256),
	@ProfileID int = NULL,
	@NewValue sql_variant
AS
BEGIN
	/* 
	Use this procedure directly if you wish to set a value for
	a particular setting without raising an error if the record
	for the setting does not exist.  If the record does not exist
	then this procedure will only notify you by returning a value
	of -1.
	 */
	SET NOCOUNT ON

	DECLARE @RecordsAffected int
	DECLARE @ErrorCode int

	-- Set the value for the given setting in the given profile
	UPDATE tblApplicationSettings
	SET [Value] = @NewValue
	WHERE ([Profile] = @ProfileID OR (@ProfileID IS NULL AND [Profile] IS NULL)) 
		AND [Key] = @SettingName

	SELECT 	@RecordsAffected = @@RowCount, @ErrorCode = @@Error

	IF @ErrorCode > 0
		-- Return the error code
		RETURN @ErrorCode
	ELSE IF @RecordsAffected = 0
		BEGIN
		RETURN -1
		END
	ELSE IF @RecordsAffected <> 1
		RETURN (-1 * @RecordsAffected)
	ELSE
		RETURN 0
	

END








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  Stored Procedure dbo.aprApplicationSettings_Statistics_ResetAll    Script Date: 5/21/2003 11:06:55 PM ******/




CREATE  PROC  dbo.aprApplicationSettings_Statistics_ResetAll
AS 
	UPDATE dbo.tblApplicationSettings
	SET [Value] = NULL
	WHERE [Key] LIKE '%[_]Stats[_]%'




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_ExecuteSQL    Script Date: 5/21/2003 11:06:55 PM ******/





/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_ExecuteSQL    Script Date: 3/28/2003 3:00:02 PM ******/


CREATE      PROCEDURE aprDtsLoadSimpleTables_ExecuteSQL 
	@SqlToExecute nvarchar(4000) = NULL, 
	@AccountTypes varchar(255) = NULL,
	@BookCode char(4) = NULL,
	@BudgetLedger char(10) = NULL,
	@BudgetScenario char(10) = NULL,
	@CalendarID char(2) = NULL,
	@Currency char(3) = NULL,
	@FiscalYearUpToAndIncluding smallint = NULL,
	@GeneralLedger char(10) = NULL,
	@PeriodUpToAndIncluding smallint = NULL,
	@SetID char(5) = NULL,
	@StatisticsCode char(3) = NULL,
	@TableName nvarchar(128) = NULL

AS
DECLARE @Params nvarchar(500)
SET @Params = '@FilterForAccountTypes varchar(255), @FilterForBookCode char(4), @FilterForBudgetLedger char(10), @FilterForBudgetScenario char(10), @FilterForCalendarID char(2), @FilterForCurrency char(3), @FilterForFiscalYearUpToAndIncluding smallint, @FilterForGeneralLedger char(10), @FilterForPeriodUpToAndIncluding smallint, @FilterForSetID char(5), @FilterForStatisticsCode char(3), @TableNameToLoad nvarchar(128)'

EXECUTE sp_executesql @SqlToExecute, @Params, 
	@FilterForAccountTypes = @AccountTypes,
	@FilterForBookCode = @BookCode,
	@FilterForBudgetLedger = @BudgetLedger,
	@FilterForBudgetScenario = @BudgetScenario,
	@FilterForCalendarID = @CalendarID,
	@FilterForCurrency = @Currency,
	@FilterForFiscalYearUpToAndIncluding = @FiscalYearUpToAndIncluding,
	@FilterForGeneralLedger = @GeneralLedger,
	@FilterForPeriodUpToAndIncluding = @PeriodUpToAndIncluding,
	@FilterForSetID = @SetID,
	@FilterForStatisticsCode = @StatisticsCode,
	@TableNameToLoad = @TableName









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_InsertBlankRecord    Script Date: 5/21/2003 11:06:55 PM ******/




CREATE    PROCEDURE aprDtsLoadSimpleTables_InsertBlankRecord 
	@TableName nvarchar(128) = NULL
AS
	DECLARE @BlankCode nvarchar(4000)	
	DECLARE @BlankDescr nvarchar(4000)	
	DECLARE @BlankKey int	

	IF @TableName IS NULL
		BEGIN
		DECLARE @msg varchar(400)
SET @msg = 'A NULL table name is not allowed.

You must provide a table name and the following settings should 
exist in the application settings table (substituting the 
actual table name for <Table Name>):
	- <Table Name>_BlankRecordCode, 
	- <Table Name>_BlankRecordDescr, 
	- <Table Name>_BlankRecordKey'
		RAISERROR (@msg, 16, 1)
		RETURN -1
		END

	IF LEFT(LOWER(@TableName), 4) = 'dbo.'
		SET @TableName = SUBSTRING(@TableName, 5, LEN(@TableName) - 4)

PRINT @TableName

	SELECT @BlankKey = CONVERT(int, dbo.fnsAppSetting(@TableName + '_BlankRecordKey'))
PRINT @BlankKey
	If @BlankKey IS NOT NULL
		BEGIN
		-- Then we should check for the existence of the blank key in the source table
		-- and insert it if it doesn't exist already
		DECLARE @SqlToExecute nvarchar(4000)
		DECLARE @Params nvarchar(100)
		DECLARE @KeyName nvarchar(128)

		SET @KeyName = SUBSTRING(@TableName, 7, LEN(@TableName) - 7) + 'Key'

		SET @SqlToExecute = CONVERT(nvarchar(4000), 'IF NOT EXISTS (SELECT * FROM ' + @TableName + ' WHERE ' + @KeyName + ' = @BlankRecordKey)
	BEGIN
	SET IDENTITY_INSERT ' + @TableName + ' ON
		
	INSERT INTO ' + @TableName + '
		(' + @KeyName + ')
	VALUES 
		(@BlankRecordKey)
	
	SET IDENTITY_INSERT ' + @TableName + ' OFF
	END')
PRINT @SqlToExecute
		SET @Params = N'@BlankRecordKey int'

		EXECUTE sp_executesql @SqlToExecute, @Params, 
					@BlankRecordKey = @BlankKey
		END





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_SetDeletedRecordCount    Script Date: 5/21/2003 11:06:55 PM ******/


/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_SetDeletedRecordCount    Script Date: 3/28/2003 3:00:02 PM ******/


CREATE   PROCEDURE aprDtsLoadSimpleTables_SetDeletedRecordCount
	@TableName nvarchar(128), 
	@RecordsAffected int = -1
AS
	DECLARE @SettingName varchar(256)
	DECLARE @SettingDescription varchar(512)

	SET @SettingName = @TableName + '_Stats_RecordsDeletedThisTime'
	SET @SettingDescription = 'The count of records deleted from ' + @TableName + ' during the last import run.  These records would be ones that no longer had one or more matching keys in the PeopleSoft source database table.'

	-- Set the table's deleted record count statistic
	EXEC dbo.aprApplicationSettings_CreateOrSetCurrentValue 
		@SettingName, 
		@RecordsAffected, 
		@SettingDescription






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_SetInsertedRecordCount    Script Date: 5/21/2003 11:06:55 PM ******/


/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_SetInsertedRecordCount    Script Date: 3/28/2003 3:00:02 PM ******/


CREATE   PROCEDURE aprDtsLoadSimpleTables_SetInsertedRecordCount
	@TableName nvarchar(128), 
	@RecordsAffected int = -1
AS
	DECLARE @SettingName varchar(256)
	DECLARE @SettingDescription varchar(512)

	SET @SettingName = @TableName + '_Stats_RecordsInsertedThisTime'
	SET @SettingDescription = 'The count of records inserted into ' + @TableName + ' during the last import run.  These records would be new records from the PeopleSoft source database table.'

	-- Set the table's deleted record count statistic
	EXEC dbo.aprApplicationSettings_CreateOrSetCurrentValue 
		@SettingName, 
		@RecordsAffected, 
		@SettingDescription






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_SetLoadStatistics    Script Date: 5/21/2003 11:06:55 PM ******/


/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_SetLoadStatistics    Script Date: 3/28/2003 3:00:02 PM ******/


CREATE   PROCEDURE aprDtsLoadSimpleTables_SetLoadStatistics
	@TableName nvarchar(128), 
	@RecordsDeleted int = -1,
	@RecordsInserted int = -1,
	@RecordsTruncated int = -1,
	@RecordsUpdated int = -1
AS
	EXEC dbo.aprDtsLoadSimpleTables_SetDeletedRecordCount @TableName, -1
	EXEC dbo.aprDtsLoadSimpleTables_SetInsertedRecordCount @TableName, -1
	EXEC dbo.aprDtsLoadSimpleTables_SetTruncatedRecordCount @TableName, -1
	EXEC dbo.aprDtsLoadSimpleTables_SetUpdatedRecordCount @TableName, -1





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_SetTruncatedRecordCount    Script Date: 5/21/2003 11:06:55 PM ******/


/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_SetTruncatedRecordCount    Script Date: 3/28/2003 3:00:02 PM ******/


CREATE   PROCEDURE aprDtsLoadSimpleTables_SetTruncatedRecordCount
	@TableName nvarchar(128), 
	@RecordsAffected int = -1
AS
	DECLARE @SettingName varchar(256)
	DECLARE @SettingDescription varchar(512)

	SET @SettingName = @TableName + '_Stats_RecordsTruncatedThisTime'
	SET @SettingDescription = 'The count of records truncated from ' + @TableName + ' during the last import run.  This is the count of the existing records in the destination (or data mart) table prior to issuing the TRUNCATE statement.'

	-- Set the table's deleted record count statistic
	EXEC dbo.aprApplicationSettings_CreateOrSetCurrentValue 
		@SettingName, 
		@RecordsAffected, 
		@SettingDescription






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_SetUpdatedRecordCount    Script Date: 5/21/2003 11:06:55 PM ******/


/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_SetUpdatedRecordCount    Script Date: 3/28/2003 3:00:02 PM ******/


CREATE   PROCEDURE aprDtsLoadSimpleTables_SetUpdatedRecordCount
	@TableName nvarchar(128), 
	@RecordsAffected int = -1
AS
	DECLARE @SettingName varchar(256)
	DECLARE @SettingDescription varchar(512)

	SET @SettingName = @TableName + '_Stats_RecordsUpdatedThisTime'
	SET @SettingDescription = 'The count of records updated in ' + @TableName + ' during the last import run.  These records would be ones where the record in the PeopleSoft source table with a matching key had a more recent effective date.'

	-- Set the table's deleted record count statistic
	EXEC dbo.aprApplicationSettings_CreateOrSetCurrentValue 
		@SettingName, 
		@RecordsAffected, 
		@SettingDescription






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO













/****** Object:  Stored Procedure dbo.aprDtsLoadSimpleTables_TableSpecificSettings    Script Date: 3/28/2003 3:00:02 PM ******/






CREATE                           PROCEDURE aprDtsLoadSimpleTables_TableSpecificSettings
	@NameOfTableToLoad nvarchar(128),
	@LinkedServerName nvarchar(128),
	@SourceDatabaseName nvarchar(128)
AS
	DECLARE @DeleteSQL nvarchar(4000)	
	DECLARE @ExcludeFromTruncateAll bit	
	DECLARE @InsertSQL nvarchar(4000)	
	DECLARE @TruncateTableOnLoad bit	
	DECLARE @TruncateSQL nvarchar(4000)	
	DECLARE @UpdateSQL nvarchar(4000)	

	IF @NameOfTableToLoad IS NULL
		BEGIN
		DECLARE @msg varchar(400)
SET @msg = 'A NULL table name is not allowed.

You must provide a table name and the following settings should
 exist in the application settings table (substituting the 
actual table name for <Table Name>):
	- <Table Name>_LoadSimpleTables_DeleteSQL, 
	- <Table Name>_LoadSimpleTables_InsertSQL, 
	- <Table Name>_TruncateTableOnLoad, 
	- <Table Name>_LoadSimpleTables_UpdateSQL'
		RAISERROR (@msg, 16, 1)
		END

	DECLARE @PlaceHolderForLinkedServerName nvarchar(128)
	DECLARE @PlaceHolderForSourceDatabaseName nvarchar(128)
	DECLARE @PlaceHolderForDestinationTableName nvarchar(128)
	DECLARE @PlaceHolderForSourceTableName nvarchar(128)
	DECLARE @SourceTableName nvarchar(128)

	SELECT 
		@DeleteSQL = CONVERT(nvarchar(4000), dbo.fnsAppSetting(@NameOfTableToLoad + '_LoadSimpleTables_DeleteSQL')),
		@ExcludeFromTruncateAll = ISNULL(CONVERT(bit, dbo.fnsAppSetting(@NameOfTableToLoad + '_ExcludeFromAllTablesTruncate')), 0),
		@InsertSQL = CONVERT(nvarchar(4000), dbo.fnsAppSetting(@NameOfTableToLoad + '_LoadSimpleTables_InsertSQL')),
		@TruncateTableOnLoad = ISNULL(CONVERT(bit, dbo.fnsAppSetting(@NameOfTableToLoad + '_TruncateTableOnLoad')), 0),
		@TruncateSQL = CONVERT(nvarchar(4000), 'DECLARE @RecordsAffected int; SELECT @RecordsAffected = COUNT(*) FROM ' + @NameOfTableToLoad + '; TRUNCATE TABLE ' + @NameOfTableToLoad + '; EXEC dbo.aprDtsLoadSimpleTables_SetTruncatedRecordCount ''' + @NameOfTableToLoad + ''', @RecordsAffected'),
		@UpdateSQL = CONVERT(varchar(4000), dbo.fnsAppSetting(@NameOfTableToLoad + '_LoadSimpleTables_UpdateSQL')), 
		@PlaceHolderForLinkedServerName = ISNULL(CONVERT(nvarchar(128), dbo.fnsAppSetting('PlaceHolderForLinkedServerName')), ''),
		@PlaceHolderForSourceDatabaseName = ISNULL(CONVERT(nvarchar(128), dbo.fnsAppSetting('PlaceHolderForSourceDatabaseName')), ''),
		@PlaceHolderForDestinationTableName = ISNULL(CONVERT(nvarchar(128), dbo.fnsAppSetting('PlaceHolderForDestinationTableName')), ''),
		@PlaceHolderForSourceTableName = ISNULL(CONVERT(nvarchar(128), dbo.fnsAppSetting('PlaceHolderForSourceTableName')), ''),
		@SourceTableName = ISNULL(CONVERT(nvarchar(128), dbo.fnsAppSetting(@NameOfTableToLoad + '_LoadSimpleTables_SourceTableName')), '')

	IF LEN(@SourceTableName) = 0
		SET @SourceTableName = @NameOfTableToLoad

	IF LOWER(LEFT(@DeleteSQL, 13)) = 'use template:'
		BEGIN
		SET @DeleteSQL = RTRIM(LTRIM(SUBSTRING(@DeleteSQL, 14, LEN(@DeleteSQL) - 13)))
		SET @DeleteSQL = CONVERT(nvarchar(4000), dbo.fnsAppSetting(@DeleteSQL))
		END 

	IF LOWER(LEFT(@InsertSQL, 13)) = 'use template:'
		BEGIN
		SET @InsertSQL = RTRIM(LTRIM(SUBSTRING(@InsertSQL, 14, LEN(@InsertSQL) - 13)))
		SET @InsertSQL = CONVERT(nvarchar(4000), dbo.fnsAppSetting(@InsertSQL))
		END 

	IF LOWER(LEFT(@UpdateSQL, 13)) = 'use template:'
		BEGIN
		SET @UpdateSQL = RTRIM(LTRIM(SUBSTRING(@UpdateSQL, 14, LEN(@UpdateSQL) - 13)))
		SET @UpdateSQL = CONVERT(nvarchar(4000), dbo.fnsAppSetting(@UpdateSQL))
		END 

	IF LEN(@PlaceHolderForLinkedServerName) > 0
		BEGIN
		SET @LinkedServerName = QUOTENAME(@LinkedServerName)

		SELECT 
			@DeleteSQL = REPLACE(@DeleteSQL, @PlaceHolderForLinkedServerName, @LinkedServerName),
			@InsertSQL = REPLACE(@InsertSQL, @PlaceHolderForLinkedServerName, @LinkedServerName), 
			@UpdateSQL = REPLACE(@UpdateSQL, @PlaceHolderForLinkedServerName, @LinkedServerName)
		END

	IF LEN(@PlaceHolderForSourceDatabaseName) > 0
		BEGIN
		SELECT 
			@DeleteSQL = REPLACE(@DeleteSQL, @PlaceHolderForSourceDatabaseName, @SourceDatabaseName),
			@InsertSQL = REPLACE(@InsertSQL, @PlaceHolderForSourceDatabaseName, @SourceDatabaseName), 
			@UpdateSQL = REPLACE(@UpdateSQL, @PlaceHolderForSourceDatabaseName, @SourceDatabaseName)
		END

	IF LEN(@PlaceHolderForDestinationTableName) > 0
		BEGIN
		SELECT 
			@DeleteSQL = REPLACE(@DeleteSQL, @PlaceHolderForDestinationTableName, @NameOfTableToLoad),
			@InsertSQL = REPLACE(@InsertSQL, @PlaceHolderForDestinationTableName, @NameOfTableToLoad), 
			@UpdateSQL = REPLACE(@UpdateSQL, @PlaceHolderForDestinationTableName, @NameOfTableToLoad)
		END

	IF LEN(@PlaceHolderForSourceTableName) > 0
		BEGIN
		SELECT 
			@DeleteSQL = REPLACE(@DeleteSQL, @PlaceHolderForSourceTableName, @SourceTableName),
			@InsertSQL = REPLACE(@InsertSQL, @PlaceHolderForSourceTableName, @SourceTableName), 
			@UpdateSQL = REPLACE(@UpdateSQL, @PlaceHolderForSourceTableName, @SourceTableName)
		END


	SELECT 
		CASE WHEN @DeleteSQL IS NULL THEN '-- Setting Not Found! ; EXEC dbo.aprDtsLoadSimpleTables_SetDeletedRecordCount ''' + @NameOfTableToLoad + ''', -1' 
			ELSE @DeleteSQL + '; EXEC dbo.aprDtsLoadSimpleTables_SetDeletedRecordCount ''' + @NameOfTableToLoad + ''', @@ROWCOUNT' 
		END AS DeleteSQL,
		@ExcludeFromTruncateAll AS ExcludeFromTruncateAll,
		CASE WHEN @InsertSQL IS NULL THEN '-- Setting Not Found! ; EXEC dbo.aprDtsLoadSimpleTables_SetInsertedRecordCount ''' + @NameOfTableToLoad + ''', -1' 
			ELSE @InsertSQL + '; EXEC dbo.aprDtsLoadSimpleTables_SetInsertedRecordCount ''' + @NameOfTableToLoad + ''', @@ROWCOUNT'
		END AS InsertSQL,
		@TruncateTableOnLoad AS TruncateTableOnLoad,
		@TruncateSQL AS TruncateSQL,
		CASE WHEN @DeleteSQL IS NULL THEN '-- Setting Not Found! ; EXEC dbo.aprDtsLoadSimpleTables_SetUpdatedRecordCount ''' + @NameOfTableToLoad + ''', -1' 
			ELSE @UpdateSQL + '; EXEC dbo.aprDtsLoadSimpleTables_SetUpdatedRecordCount ''' + @NameOfTableToLoad + ''', @@ROWCOUNT' 
		END AS UpdateSQL










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROC dbo.aprJrnlDetailsForBU_AMG
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT, @FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT, @BU nvarchar(10))
AS
SELECT     dbo.PS_JRNL_LN.BUSINESS_UNIT, dbo.PS_JRNL_HEADER.FISCAL_YEAR, dbo.PS_JRNL_HEADER.ACCOUNTING_PERIOD, 
                      dbo.PS_JRNL_HEADER.JOURNAL_ID, dbo.PS_JRNL_HEADER.JOURNAL_DATE, 
                      dbo.PS_JRNL_LN.JOURNAL_LINE, dbo.PS_JRNL_LN.JRNL_LN_REF, dbo.PS_JRNL_HEADER.SOURCE, dbo.PS_JRNL_LN.ACCOUNT, 
                      dbo.PS_JRNL_LN.DEPTID, dbo.PS_JRNL_LN.OPERATING_UNIT, dbo.PS_JRNL_LN.FUND_CODE, dbo.PS_JRNL_LN.PROJECT_ID, 
                      dbo.PS_JRNL_LN.CHARTFIELD1, dbo.PS_JRNL_HEADER.REVERSAL_CD, 
		dbo.PS_JRNL_LN.MONETARY_AMOUNT,
		dbo.PS_JRNL_LN.STATISTIC_AMOUNT, 
                      dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS, dbo.PS_JRNL_LN.LINE_DESCR, dbo.qryAMDetails.JRNL_LN_REF AS JRNL_LN_REF2, 
                      dbo.qryAMDetails.PH_REF_CHAR_01, dbo.qryAMDetails.PH_REF_CHAR_02, dbo.qryAMDetails.PH_REF_CHAR_03, dbo.qryAMDetails.PH_REF_CHAR_04, 
                      dbo.qryAMDetails.PH_REF_CHAR_05, dbo.qryAMDetails.PH_REF_CHAR_06 ,
ISNULL(dbo.qryAMDetails.MONETARY_AMOUNT, dbo.PS_JRNL_LN.MONETARY_AMOUNT)  AS  DET_AMT, 
ISNULL(dbo.qryAMDetails.STATISTIC_AMOUNT, dbo.PS_JRNL_LN.STATISTIC_AMOUNT)  AS DET_STAT_AMT
FROM         dbo.PS_JRNL_HEADER INNER JOIN
                      dbo.PS_JRNL_LN ON dbo.PS_JRNL_HEADER.JOURNAL_ID = dbo.PS_JRNL_LN.JOURNAL_ID AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_DATE = dbo.PS_JRNL_LN.JOURNAL_DATE AND 

                      dbo.PS_JRNL_HEADER.BUSINESS_UNIT = dbo.PS_JRNL_LN.BUSINESS_UNIT

                      AND dbo.PS_JRNL_HEADER.UNPOST_SEQ = dbo.PS_JRNL_LN.UNPOST_SEQ
		LEFT OUTER JOIN
                      dbo.qryAMDetails ON dbo.PS_JRNL_LN.JOURNAL_ID = dbo.qryAMDetails.JOURNAL_ID AND 
                      dbo.PS_JRNL_LN.JOURNAL_LINE = dbo.qryAMDetails.JOURNAL_LINE
WHERE     ((dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'P') OR
                      (dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'U')) AND
		(dbo.PS_JRNL_HEADER.SOURCE = 'AMG')
		AND (dbo.PS_JRNL_LN.JRNL_LINE_STATUS <> 1) 
		AND ((PS_JRNL_HEADER.FISCAL_YEAR = @FY AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (PS_JRNL_HEADER.FISCAL_YEAR = @FY2 AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
		and (PS_JRNL_LN.BUSINESS_UNIT = @BU)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROC dbo.aprJrnlDetailsForBU_APG
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT,@FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT, @BU nvarchar(10))
AS
SELECT     dbo.PS_JRNL_LN.BUSINESS_UNIT, dbo.PS_JRNL_HEADER.FISCAL_YEAR, dbo.PS_JRNL_HEADER.ACCOUNTING_PERIOD, 
                dbo.PS_JRNL_HEADER.JOURNAL_ID, dbo.PS_JRNL_HEADER.JOURNAL_DATE, 
                dbo.PS_JRNL_LN.JOURNAL_LINE, dbo.PS_JRNL_LN.JRNL_LN_REF, dbo.PS_JRNL_HEADER.SOURCE, dbo.PS_JRNL_LN.ACCOUNT, 
                dbo.PS_JRNL_LN.DEPTID, dbo.PS_JRNL_LN.OPERATING_UNIT, dbo.PS_JRNL_LN.FUND_CODE, dbo.PS_JRNL_LN.PROJECT_ID, 
                dbo.PS_JRNL_LN.CHARTFIELD1, dbo.PS_JRNL_HEADER.REVERSAL_CD, 
		dbo.PS_JRNL_LN.MONETARY_AMOUNT,
		dbo.PS_JRNL_LN.STATISTIC_AMOUNT, 
                dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS, dbo.PS_JRNL_LN.LINE_DESCR, dbo.qryAPDetails.JRNL_LN_REF AS JRNL_LN_REF2, 
                dbo.qryAPDetails.PH_REF_CHAR_01, dbo.qryAPDetails.PH_REF_CHAR_02, dbo.qryAPDetails.PH_REF_CHAR_03, dbo.qryAPDetails.PH_REF_CHAR_04, 
                dbo.qryAPDetails.PH_REF_CHAR_05, dbo.qryAPDetails.PH_REF_CHAR_06 ,
		ISNULL(dbo.qryAPDetails.MONETARY_AMOUNT, dbo.PS_JRNL_LN.MONETARY_AMOUNT)  AS  DET_AMT, 
		ISNULL(dbo.qryAPDetails.STATISTIC_AMOUNT, dbo.PS_JRNL_LN.STATISTIC_AMOUNT)  AS DET_STAT_AMT
FROM         dbo.PS_JRNL_HEADER INNER JOIN
                      dbo.PS_JRNL_LN ON dbo.PS_JRNL_HEADER.JOURNAL_ID = dbo.PS_JRNL_LN.JOURNAL_ID AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_DATE = dbo.PS_JRNL_LN.JOURNAL_DATE AND 

                      dbo.PS_JRNL_HEADER.BUSINESS_UNIT = dbo.PS_JRNL_LN.BUSINESS_UNIT  

                      AND dbo.PS_JRNL_HEADER.UNPOST_SEQ = dbo.PS_JRNL_LN.UNPOST_SEQ 
		LEFT OUTER JOIN
                      dbo.qryAPDetails ON dbo.PS_JRNL_LN.JOURNAL_ID = dbo.qryAPDetails.JOURNAL_ID AND 
                      dbo.PS_JRNL_LN.JOURNAL_LINE = dbo.qryAPDetails.JOURNAL_LINE
WHERE     ((dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'P') OR
                      (dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'U')) AND
		(dbo.PS_JRNL_HEADER.SOURCE = 'APG')
		AND (dbo.PS_JRNL_LN.JRNL_LINE_STATUS <> 1) 
		AND ((PS_JRNL_HEADER.FISCAL_YEAR = @FY AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (PS_JRNL_HEADER.FISCAL_YEAR = @FY2 AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
		and (PS_JRNL_LN.BUSINESS_UNIT = @BU)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


CREATE PROC dbo.aprJrnlDetailsForBU_IFX
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT,@FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT, @BU nvarchar(10))
AS
SELECT      dbo.PS_JRNL_LN.BUSINESS_UNIT, dbo.PS_JRNL_HEADER.FISCAL_YEAR, dbo.PS_JRNL_HEADER.ACCOUNTING_PERIOD, 
                      dbo.PS_JRNL_HEADER.JOURNAL_ID, dbo.PS_JRNL_HEADER.JOURNAL_DATE, 
                      dbo.PS_JRNL_LN.JOURNAL_LINE, dbo.PS_JRNL_LN.JRNL_LN_REF, dbo.PS_JRNL_HEADER.SOURCE, dbo.PS_JRNL_LN.ACCOUNT, 
                      dbo.PS_JRNL_LN.DEPTID, dbo.PS_JRNL_LN.OPERATING_UNIT, dbo.PS_JRNL_LN.FUND_CODE, dbo.PS_JRNL_LN.PROJECT_ID, 
                      dbo.PS_JRNL_LN.CHARTFIELD1, dbo.PS_JRNL_HEADER.REVERSAL_CD, 
		dbo.PS_JRNL_LN.MONETARY_AMOUNT,
		dbo.PS_JRNL_LN.STATISTIC_AMOUNT, 
                      dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS, dbo.PS_JRNL_LN.LINE_DESCR, dbo.qryIFXDetails.JRNL_LN_REF AS JRNL_LN_REF2, 
                      dbo.qryIFXDetails.PH_REF_CHAR_01, dbo.qryIFXDetails.PH_REF_CHAR_02, dbo.qryIFXDetails.PH_REF_CHAR_03, dbo.qryIFXDetails.PH_REF_CHAR_04, 
                      dbo.qryIFXDetails.PH_REF_CHAR_05, dbo.qryIFXDetails.PH_REF_CHAR_06, 
		ISNULL(CASE WHEN PS_JRNL_HEADER.REVERSAL_CD = 'R'  AND PS_JRNL_HEADER.SYSTEM_SOURCE = 'GOT'
				THEN qryIFXDetails.MONETARY_AMOUNT * -1 ELSE qryIFXDetails.MONETARY_AMOUNT END, 
			CASE WHEN PS_JRNL_HEADER.REVERSAL_CD = 'R'   AND PS_JRNL_HEADER.SYSTEM_SOURCE = 'GOT'
				THEN dbo.PS_JRNL_LN.MONETARY_AMOUNT * -1 ELSE dbo.PS_JRNL_LN.MONETARY_AMOUNT END) AS DET_AMT, 
		ISNULL(CASE WHEN PS_JRNL_HEADER.REVERSAL_CD = 'R'   AND PS_JRNL_HEADER.SYSTEM_SOURCE = 'GOT'
				THEN qryIFXDetails.STATISTIC_AMOUNT * -1 ELSE qryIFXDetails.STATISTIC_AMOUNT END, 
			CASE WHEN PS_JRNL_HEADER.REVERSAL_CD = 'R'   AND PS_JRNL_HEADER.SYSTEM_SOURCE = 'GOT'
				THEN dbo.PS_JRNL_LN.STATISTIC_AMOUNT * -1 ELSE dbo.PS_JRNL_LN.STATISTIC_AMOUNT END) AS DET_STAT_AMT
FROM         dbo.PS_JRNL_HEADER INNER JOIN
                      dbo.PS_JRNL_LN ON dbo.PS_JRNL_HEADER.JOURNAL_ID = dbo.PS_JRNL_LN.JOURNAL_ID AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_DATE = dbo.PS_JRNL_LN.JOURNAL_DATE AND 

                      dbo.PS_JRNL_HEADER.BUSINESS_UNIT = dbo.PS_JRNL_LN.BUSINESS_UNIT 

                       AND dbo.PS_JRNL_HEADER.UNPOST_SEQ = dbo.PS_JRNL_LN.UNPOST_SEQ 
		LEFT OUTER JOIN
                      dbo.qryIFXDetails ON dbo.PS_JRNL_LN.JOURNAL_ID = dbo.qryIFXDetails.JOURNAL_ID AND 
                      dbo.PS_JRNL_LN.JOURNAL_LINE = dbo.qryIFXDetails.JOURNAL_LINE
WHERE     ((dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'P') OR
                      (dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'U')) AND
			(dbo.PS_JRNL_HEADER.SOURCE = 'IFX')
		AND (dbo.PS_JRNL_LN.JRNL_LINE_STATUS <> 1) 
		AND ((PS_JRNL_HEADER.FISCAL_YEAR = @FY AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (PS_JRNL_HEADER.FISCAL_YEAR = @FY2 AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
		and (PS_JRNL_LN.BUSINESS_UNIT = @BU)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROC dbo.aprJrnlDetailsForBU_ING
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT, @FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT, @BU nvarchar(10))
AS
-- ADDED 2004/01/31
-- AMIN J.
SELECT     dbo.PS_JRNL_LN.BUSINESS_UNIT, dbo.PS_JRNL_HEADER.FISCAL_YEAR, dbo.PS_JRNL_HEADER.ACCOUNTING_PERIOD, 
                      dbo.PS_JRNL_HEADER.JOURNAL_ID, dbo.PS_JRNL_HEADER.JOURNAL_DATE, 
                      dbo.PS_JRNL_LN.JOURNAL_LINE, dbo.PS_JRNL_LN.JRNL_LN_REF, dbo.PS_JRNL_HEADER.SOURCE, dbo.PS_JRNL_LN.ACCOUNT, 
                      dbo.PS_JRNL_LN.DEPTID, dbo.PS_JRNL_LN.OPERATING_UNIT, dbo.PS_JRNL_LN.FUND_CODE, dbo.PS_JRNL_LN.PROJECT_ID, 
                      dbo.PS_JRNL_LN.CHARTFIELD1, dbo.PS_JRNL_HEADER.REVERSAL_CD, 
		dbo.PS_JRNL_LN.MONETARY_AMOUNT,
		dbo.PS_JRNL_LN.STATISTIC_AMOUNT, 
                      dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS, dbo.PS_JRNL_LN.LINE_DESCR, dbo.qryINDetails.JRNL_LN_REF AS JRNL_LN_REF2, 
                      dbo.qryINDetails.PH_REF_CHAR_01, dbo.qryINDetails.PH_REF_CHAR_02, dbo.qryINDetails.PH_REF_CHAR_03, dbo.qryINDetails.PH_REF_CHAR_04, 
                      dbo.qryINDetails.PH_REF_CHAR_05, dbo.qryINDetails.PH_REF_CHAR_06 ,
ISNULL(dbo.qryINDetails.MONETARY_AMOUNT, dbo.PS_JRNL_LN.MONETARY_AMOUNT)  AS  DET_AMT, 
ISNULL(dbo.qryINDetails.STATISTIC_AMOUNT, dbo.PS_JRNL_LN.STATISTIC_AMOUNT)  AS DET_STAT_AMT
FROM         dbo.PS_JRNL_HEADER INNER JOIN
                      dbo.PS_JRNL_LN ON dbo.PS_JRNL_HEADER.JOURNAL_ID = dbo.PS_JRNL_LN.JOURNAL_ID AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_DATE = dbo.PS_JRNL_LN.JOURNAL_DATE AND 

                      dbo.PS_JRNL_HEADER.BUSINESS_UNIT = dbo.PS_JRNL_LN.BUSINESS_UNIT

                      AND dbo.PS_JRNL_HEADER.UNPOST_SEQ = dbo.PS_JRNL_LN.UNPOST_SEQ
		LEFT OUTER JOIN
                      dbo.qryINDetails ON dbo.PS_JRNL_LN.JOURNAL_ID = dbo.qryINDetails.JOURNAL_ID AND 
                      dbo.PS_JRNL_LN.JOURNAL_LINE = dbo.qryINDetails.JOURNAL_LINE
WHERE     ((dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'P') OR
                      (dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'U')) AND
		(dbo.PS_JRNL_HEADER.SOURCE = 'ING')
		AND (dbo.PS_JRNL_LN.JRNL_LINE_STATUS <> 1) 
		AND ((PS_JRNL_HEADER.FISCAL_YEAR = @FY AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (PS_JRNL_HEADER.FISCAL_YEAR = @FY2 AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
		and (PS_JRNL_LN.BUSINESS_UNIT = @BU)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROC dbo.aprJrnlDetailsForBU_ONL
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT, @FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT, @BU nvarchar(10))
AS
SELECT     dbo.PS_JRNL_LN.BUSINESS_UNIT, dbo.PS_JRNL_HEADER.FISCAL_YEAR, dbo.PS_JRNL_HEADER.ACCOUNTING_PERIOD, 
                      dbo.PS_JRNL_HEADER.JOURNAL_ID, dbo.PS_JRNL_HEADER.JOURNAL_DATE, dbo.PS_JRNL_LN.JOURNAL_LINE, dbo.PS_JRNL_LN.JRNL_LN_REF, 
                      dbo.PS_JRNL_HEADER.SOURCE, dbo.PS_JRNL_LN.ACCOUNT, dbo.PS_JRNL_LN.DEPTID, dbo.PS_JRNL_LN.OPERATING_UNIT, 
                      dbo.PS_JRNL_LN.FUND_CODE, dbo.PS_JRNL_LN.PROJECT_ID, dbo.PS_JRNL_LN.CHARTFIELD1, dbo.PS_JRNL_HEADER.REVERSAL_CD, 
                      dbo.PS_JRNL_LN.MONETARY_AMOUNT, dbo.PS_JRNL_LN.STATISTIC_AMOUNT, dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS, 
                      dbo.PS_JRNL_LN.LINE_DESCR, '' AS JRNL_LN_REF2,  ''  AS PH_REF_CHAR_01, dbo.PS_JRNL_HEADER.DESCR AS PH_REF_CHAR_02, 
                      '' AS PH_REF_CHAR_03, '' AS PH_REF_CHAR_04, '' AS PH_REF_CHAR_05, '' AS PH_REF_CHAR_06, 
                      dbo.PS_JRNL_LN.MONETARY_AMOUNT AS DET_AMT, dbo.PS_JRNL_LN.STATISTIC_AMOUNT AS DET_STAT
FROM         dbo.PS_JRNL_HEADER INNER JOIN
                      dbo.PS_JRNL_LN ON dbo.PS_JRNL_HEADER.BUSINESS_UNIT = dbo.PS_JRNL_LN.BUSINESS_UNIT AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_DATE = dbo.PS_JRNL_LN.JOURNAL_DATE AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_ID = dbo.PS_JRNL_LN.JOURNAL_ID
                     AND dbo.PS_JRNL_HEADER.UNPOST_SEQ = dbo.PS_JRNL_LN.UNPOST_SEQ 

WHERE     (dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'P' OR
                      dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'U') AND (dbo.PS_JRNL_HEADER.SOURCE NOT IN ('APG', 'PYG', 'IFX','AMG','ING','PO'))
		AND (dbo.PS_JRNL_LN.JRNL_LINE_STATUS <> 1) 
		AND ((PS_JRNL_HEADER.FISCAL_YEAR = @FY AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (PS_JRNL_HEADER.FISCAL_YEAR = @FY2 AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
		and (PS_JRNL_LN.BUSINESS_UNIT = @BU)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



CREATE PROC dbo.aprJrnlDetailsForBU_PO
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT,@FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT, @BU nvarchar(10))
AS
SELECT     dbo.PS_JRNL_LN.BUSINESS_UNIT, dbo.PS_JRNL_HEADER.FISCAL_YEAR, dbo.PS_JRNL_HEADER.ACCOUNTING_PERIOD, 
                      dbo.PS_JRNL_HEADER.JOURNAL_ID, dbo.PS_JRNL_HEADER.JOURNAL_DATE, 
                      dbo.PS_JRNL_LN.JOURNAL_LINE, dbo.PS_JRNL_LN.JRNL_LN_REF, dbo.PS_JRNL_HEADER.SOURCE, dbo.PS_JRNL_LN.ACCOUNT, 
                      dbo.PS_JRNL_LN.DEPTID, dbo.PS_JRNL_LN.OPERATING_UNIT, dbo.PS_JRNL_LN.FUND_CODE, dbo.PS_JRNL_LN.PROJECT_ID, 
                      dbo.PS_JRNL_LN.CHARTFIELD1, dbo.PS_JRNL_HEADER.REVERSAL_CD, 
		dbo.PS_JRNL_LN.MONETARY_AMOUNT,
		dbo.PS_JRNL_LN.STATISTIC_AMOUNT, 
                      dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS, dbo.PS_JRNL_LN.LINE_DESCR, dbo.qryPODetails.JRNL_LN_REF AS JRNL_LN_REF2, 
                      dbo.qryPODetails.PH_REF_CHAR_01, dbo.qryPODetails.PH_REF_CHAR_02, dbo.qryPODetails.PH_REF_CHAR_03, dbo.qryPODetails.PH_REF_CHAR_04, 
                      dbo.qryPODetails.PH_REF_CHAR_05, dbo.qryPODetails.PH_REF_CHAR_06 ,
ISNULL(dbo.qryPODetails.MONETARY_AMOUNT, dbo.PS_JRNL_LN.MONETARY_AMOUNT)  AS  DET_AMT, 
ISNULL(dbo.qryPODetails.STATISTIC_AMOUNT, dbo.PS_JRNL_LN.STATISTIC_AMOUNT)  AS DET_STAT_AMT
FROM         dbo.PS_JRNL_HEADER INNER JOIN
                      dbo.PS_JRNL_LN ON dbo.PS_JRNL_HEADER.JOURNAL_ID = dbo.PS_JRNL_LN.JOURNAL_ID AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_DATE = dbo.PS_JRNL_LN.JOURNAL_DATE AND 

                      dbo.PS_JRNL_HEADER.BUSINESS_UNIT = dbo.PS_JRNL_LN.BUSINESS_UNIT

                      AND dbo.PS_JRNL_HEADER.UNPOST_SEQ = dbo.PS_JRNL_LN.UNPOST_SEQ
		LEFT OUTER JOIN
                      dbo.qryPODetails ON dbo.PS_JRNL_LN.JOURNAL_ID = dbo.qryPODetails.JOURNAL_ID AND 
                      dbo.PS_JRNL_LN.JOURNAL_LINE = dbo.qryPODetails.JOURNAL_LINE
WHERE     ((dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'P') OR
                      (dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'U')) AND
		(dbo.PS_JRNL_HEADER.SOURCE = 'PO')
		AND (dbo.PS_JRNL_LN.JRNL_LINE_STATUS <> 1) 
		AND ((PS_JRNL_HEADER.FISCAL_YEAR = @FY AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (PS_JRNL_HEADER.FISCAL_YEAR = @FY2 AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
		and (PS_JRNL_LN.BUSINESS_UNIT = @BU)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE  proc dbo.aprJrnlDetailsForBU_PYG
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT, @FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT, @BU nvarchar(10))
AS
SELECT     l.BUSINESS_UNIT, h.FISCAL_YEAR, h.ACCOUNTING_PERIOD, 
                      h.JOURNAL_ID, h.JOURNAL_DATE, 
                      l.JOURNAL_LINE, l.JRNL_LN_REF, h.SOURCE, l.ACCOUNT, 
                      l.DEPTID, l.OPERATING_UNIT, l.FUND_CODE, l.PROJECT_ID, 
                      l.CHARTFIELD1, h.REVERSAL_CD, 
		l.MONETARY_AMOUNT,
		l.STATISTIC_AMOUNT,
                      h.JRNL_HDR_STATUS, l.LINE_DESCR, dbo.qryPYDetails.JRNL_LN_REF AS JRNL_LN_REF2, 
                      dbo.qryPYDetails.PH_REF_CHAR_01, dbo.qryPYDetails.PH_REF_CHAR_02, dbo.qryPYDetails.PH_REF_CHAR_03, dbo.qryPYDetails.PH_REF_CHAR_04, 
                      dbo.qryPYDetails.PH_REF_CHAR_05, dbo.qryPYDetails.PH_REF_CHAR_06, 
		ISNULL(CASE WHEN h.REVERSAL_CD = 'R' THEN qryPYDetails.MONETARY_AMOUNT * -1 ELSE qryPYDetails.MONETARY_AMOUNT END, CASE WHEN h.REVERSAL_CD = 'R' THEN l.MONETARY_AMOUNT * -1 ELSE l.MONETARY_AMOUNT END) AS DET_AMT, 
		ISNULL(CASE WHEN h.REVERSAL_CD = 'R' THEN qryPYDetails.STATISTIC_AMOUNT * -1 ELSE qryPYDetails.STATISTIC_AMOUNT END, CASE WHEN h.REVERSAL_CD = 'R' THEN l.STATISTIC_AMOUNT * -1 ELSE l.STATISTIC_AMOUNT END) AS DET_STAT_AMT

FROM         /*[VSQLFSM\INSTFSM].FS84PRD.*/ dbo.PS_JRNL_HEADER h INNER JOIN
                     /*[VSQLFSM\INSTFSM].FS84PRD.*/ dbo.PS_JRNL_LN l ON h.JOURNAL_ID = l.JOURNAL_ID AND 
                      h.JOURNAL_DATE = l.JOURNAL_DATE AND 

                      h.BUSINESS_UNIT = l.BUSINESS_UNIT 

                      AND h.UNPOST_SEQ = l.UNPOST_SEQ  

		LEFT OUTER JOIN
                      dbo.qryPYDetails ON l.JOURNAL_ID = dbo.qryPYDetails.JOURNAL_ID AND 
                      l.JOURNAL_LINE = dbo.qryPYDetails.JOURNAL_LINE
WHERE     ((h.JRNL_HDR_STATUS = 'P') OR
                      (h.JRNL_HDR_STATUS = 'U')) AND
			(h.SOURCE = 'PYG')
		AND (l.JRNL_LINE_STATUS <> 1)
		AND ((h.FISCAL_YEAR = @FY AND h.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (h.FISCAL_YEAR = @FY2 AND h.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
		and (l.BUSINESS_UNIT = @BU)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROC dbo.aprJrnlDetails_AMG
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT, @FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT)
AS
-- ADDED 2004/01/31
-- AMIN J.
SELECT     dbo.PS_JRNL_LN.BUSINESS_UNIT, dbo.PS_JRNL_HEADER.FISCAL_YEAR, dbo.PS_JRNL_HEADER.ACCOUNTING_PERIOD, 
                      dbo.PS_JRNL_HEADER.JOURNAL_ID, dbo.PS_JRNL_HEADER.JOURNAL_DATE, 
                      dbo.PS_JRNL_LN.JOURNAL_LINE, dbo.PS_JRNL_LN.JRNL_LN_REF, dbo.PS_JRNL_HEADER.SOURCE, dbo.PS_JRNL_LN.ACCOUNT, 
                      dbo.PS_JRNL_LN.DEPTID, dbo.PS_JRNL_LN.OPERATING_UNIT, dbo.PS_JRNL_LN.FUND_CODE, dbo.PS_JRNL_LN.PROJECT_ID, 
                      dbo.PS_JRNL_LN.CHARTFIELD1, dbo.PS_JRNL_HEADER.REVERSAL_CD, 
		dbo.PS_JRNL_LN.MONETARY_AMOUNT,
		dbo.PS_JRNL_LN.STATISTIC_AMOUNT, 
                      dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS, dbo.PS_JRNL_LN.LINE_DESCR, dbo.qryAMDetails.JRNL_LN_REF AS JRNL_LN_REF2, 
                      dbo.qryAMDetails.PH_REF_CHAR_01, dbo.qryAMDetails.PH_REF_CHAR_02, dbo.qryAMDetails.PH_REF_CHAR_03, dbo.qryAMDetails.PH_REF_CHAR_04, 
                      dbo.qryAMDetails.PH_REF_CHAR_05, dbo.qryAMDetails.PH_REF_CHAR_06 ,
ISNULL(dbo.qryAMDetails.MONETARY_AMOUNT, dbo.PS_JRNL_LN.MONETARY_AMOUNT)  AS  DET_AMT, 
ISNULL(dbo.qryAMDetails.STATISTIC_AMOUNT, dbo.PS_JRNL_LN.STATISTIC_AMOUNT)  AS DET_STAT_AMT
FROM         dbo.PS_JRNL_HEADER INNER JOIN
                      dbo.PS_JRNL_LN ON dbo.PS_JRNL_HEADER.JOURNAL_ID = dbo.PS_JRNL_LN.JOURNAL_ID AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_DATE = dbo.PS_JRNL_LN.JOURNAL_DATE AND 

                      dbo.PS_JRNL_HEADER.BUSINESS_UNIT = dbo.PS_JRNL_LN.BUSINESS_UNIT

                      AND dbo.PS_JRNL_HEADER.UNPOST_SEQ = dbo.PS_JRNL_LN.UNPOST_SEQ
		LEFT OUTER JOIN
                      dbo.qryAMDetails ON dbo.PS_JRNL_LN.JOURNAL_ID = dbo.qryAMDetails.JOURNAL_ID AND 
                      dbo.PS_JRNL_LN.JOURNAL_LINE = dbo.qryAMDetails.JOURNAL_LINE
WHERE     ((dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'P') OR
                      (dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'U')) AND
		(dbo.PS_JRNL_HEADER.SOURCE = 'AMG')
		AND (dbo.PS_JRNL_LN.JRNL_LINE_STATUS <> 1) -- 20041115
		/*20050427 AND PS_JRNL_HEADER.FISCAL_YEAR = @FY
		AND (PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)*/
		AND ((PS_JRNL_HEADER.FISCAL_YEAR = @FY AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (PS_JRNL_HEADER.FISCAL_YEAR = @FY2 AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROC dbo.aprJrnlDetails_APG
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT,@FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT)
AS
SELECT     dbo.PS_JRNL_LN.BUSINESS_UNIT, dbo.PS_JRNL_HEADER.FISCAL_YEAR, dbo.PS_JRNL_HEADER.ACCOUNTING_PERIOD, 
                dbo.PS_JRNL_HEADER.JOURNAL_ID, dbo.PS_JRNL_HEADER.JOURNAL_DATE, 
                dbo.PS_JRNL_LN.JOURNAL_LINE, dbo.PS_JRNL_LN.JRNL_LN_REF, dbo.PS_JRNL_HEADER.SOURCE, dbo.PS_JRNL_LN.ACCOUNT, 
                dbo.PS_JRNL_LN.DEPTID, dbo.PS_JRNL_LN.OPERATING_UNIT, dbo.PS_JRNL_LN.FUND_CODE, dbo.PS_JRNL_LN.PROJECT_ID, 
                dbo.PS_JRNL_LN.CHARTFIELD1, dbo.PS_JRNL_HEADER.REVERSAL_CD, 
		dbo.PS_JRNL_LN.MONETARY_AMOUNT,
		dbo.PS_JRNL_LN.STATISTIC_AMOUNT, 
                dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS, dbo.PS_JRNL_LN.LINE_DESCR, dbo.qryAPDetails.JRNL_LN_REF AS JRNL_LN_REF2, 
                dbo.qryAPDetails.PH_REF_CHAR_01, dbo.qryAPDetails.PH_REF_CHAR_02, dbo.qryAPDetails.PH_REF_CHAR_03, dbo.qryAPDetails.PH_REF_CHAR_04, 
                dbo.qryAPDetails.PH_REF_CHAR_05, dbo.qryAPDetails.PH_REF_CHAR_06 ,
		ISNULL(dbo.qryAPDetails.MONETARY_AMOUNT, dbo.PS_JRNL_LN.MONETARY_AMOUNT)  AS  DET_AMT, 
		ISNULL(dbo.qryAPDetails.STATISTIC_AMOUNT, dbo.PS_JRNL_LN.STATISTIC_AMOUNT)  AS DET_STAT_AMT
FROM         dbo.PS_JRNL_HEADER INNER JOIN
                      dbo.PS_JRNL_LN ON dbo.PS_JRNL_HEADER.JOURNAL_ID = dbo.PS_JRNL_LN.JOURNAL_ID AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_DATE = dbo.PS_JRNL_LN.JOURNAL_DATE AND 

                      dbo.PS_JRNL_HEADER.BUSINESS_UNIT = dbo.PS_JRNL_LN.BUSINESS_UNIT  --added 2003/07/14

                      AND dbo.PS_JRNL_HEADER.UNPOST_SEQ = dbo.PS_JRNL_LN.UNPOST_SEQ --removed 2003/08/5
		LEFT OUTER JOIN
                      dbo.qryAPDetails ON dbo.PS_JRNL_LN.JOURNAL_ID = dbo.qryAPDetails.JOURNAL_ID AND 
                      dbo.PS_JRNL_LN.JOURNAL_LINE = dbo.qryAPDetails.JOURNAL_LINE
WHERE     ((dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'P') OR
                      (dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'U')) AND
		(dbo.PS_JRNL_HEADER.SOURCE = 'APG')
		AND (dbo.PS_JRNL_LN.JRNL_LINE_STATUS <> 1) -- 20041115
		/*20050427AND PS_JRNL_HEADER.FISCAL_YEAR = @FY
		AND (PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)*/
		AND ((PS_JRNL_HEADER.FISCAL_YEAR = @FY AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (PS_JRNL_HEADER.FISCAL_YEAR = @FY2 AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROC dbo.aprJrnlDetails_IFX
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT,@FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT)
AS
SELECT      dbo.PS_JRNL_LN.BUSINESS_UNIT, dbo.PS_JRNL_HEADER.FISCAL_YEAR, dbo.PS_JRNL_HEADER.ACCOUNTING_PERIOD, 
                      dbo.PS_JRNL_HEADER.JOURNAL_ID, dbo.PS_JRNL_HEADER.JOURNAL_DATE, 
                      dbo.PS_JRNL_LN.JOURNAL_LINE, dbo.PS_JRNL_LN.JRNL_LN_REF, dbo.PS_JRNL_HEADER.SOURCE, dbo.PS_JRNL_LN.ACCOUNT, 
                      dbo.PS_JRNL_LN.DEPTID, dbo.PS_JRNL_LN.OPERATING_UNIT, dbo.PS_JRNL_LN.FUND_CODE, dbo.PS_JRNL_LN.PROJECT_ID, 
                      dbo.PS_JRNL_LN.CHARTFIELD1, dbo.PS_JRNL_HEADER.REVERSAL_CD, 
		dbo.PS_JRNL_LN.MONETARY_AMOUNT,
		dbo.PS_JRNL_LN.STATISTIC_AMOUNT, 
                      dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS, dbo.PS_JRNL_LN.LINE_DESCR, dbo.qryIFXDetails.JRNL_LN_REF AS JRNL_LN_REF2, 
                      dbo.qryIFXDetails.PH_REF_CHAR_01, dbo.qryIFXDetails.PH_REF_CHAR_02, dbo.qryIFXDetails.PH_REF_CHAR_03, dbo.qryIFXDetails.PH_REF_CHAR_04, 
                      dbo.qryIFXDetails.PH_REF_CHAR_05, dbo.qryIFXDetails.PH_REF_CHAR_06, 
		ISNULL(CASE WHEN PS_JRNL_HEADER.REVERSAL_CD = 'R'  AND PS_JRNL_HEADER.SYSTEM_SOURCE = 'GOT'
				THEN qryIFXDetails.MONETARY_AMOUNT * -1 ELSE qryIFXDetails.MONETARY_AMOUNT END, 
			CASE WHEN PS_JRNL_HEADER.REVERSAL_CD = 'R'   AND PS_JRNL_HEADER.SYSTEM_SOURCE = 'GOT'
				THEN dbo.PS_JRNL_LN.MONETARY_AMOUNT * -1 ELSE dbo.PS_JRNL_LN.MONETARY_AMOUNT END) AS DET_AMT, 
		ISNULL(CASE WHEN PS_JRNL_HEADER.REVERSAL_CD = 'R'   AND PS_JRNL_HEADER.SYSTEM_SOURCE = 'GOT'
				THEN qryIFXDetails.STATISTIC_AMOUNT * -1 ELSE qryIFXDetails.STATISTIC_AMOUNT END, 
			CASE WHEN PS_JRNL_HEADER.REVERSAL_CD = 'R'   AND PS_JRNL_HEADER.SYSTEM_SOURCE = 'GOT'
				THEN dbo.PS_JRNL_LN.STATISTIC_AMOUNT * -1 ELSE dbo.PS_JRNL_LN.STATISTIC_AMOUNT END) AS DET_STAT_AMT
FROM         dbo.PS_JRNL_HEADER INNER JOIN
                      dbo.PS_JRNL_LN ON dbo.PS_JRNL_HEADER.JOURNAL_ID = dbo.PS_JRNL_LN.JOURNAL_ID AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_DATE = dbo.PS_JRNL_LN.JOURNAL_DATE AND 

                      dbo.PS_JRNL_HEADER.BUSINESS_UNIT = dbo.PS_JRNL_LN.BUSINESS_UNIT --added 2003/07/14

                       AND dbo.PS_JRNL_HEADER.UNPOST_SEQ = dbo.PS_JRNL_LN.UNPOST_SEQ 
		LEFT OUTER JOIN
                      dbo.qryIFXDetails ON dbo.PS_JRNL_LN.JOURNAL_ID = dbo.qryIFXDetails.JOURNAL_ID AND 
                      dbo.PS_JRNL_LN.JOURNAL_LINE = dbo.qryIFXDetails.JOURNAL_LINE
WHERE     ((dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'P') OR
                      (dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'U')) AND
			(dbo.PS_JRNL_HEADER.SOURCE = 'IFX')
		AND (dbo.PS_JRNL_LN.JRNL_LINE_STATUS <> 1) -- 20041115
		/*20050427 AND PS_JRNL_HEADER.FISCAL_YEAR = @FY
		AND (PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)*/
		AND ((PS_JRNL_HEADER.FISCAL_YEAR = @FY AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (PS_JRNL_HEADER.FISCAL_YEAR = @FY2 AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROC dbo.aprJrnlDetails_ING
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT, @FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT)
AS
-- ADDED 2004/01/31
-- AMIN J.
SELECT     dbo.PS_JRNL_LN.BUSINESS_UNIT, dbo.PS_JRNL_HEADER.FISCAL_YEAR, dbo.PS_JRNL_HEADER.ACCOUNTING_PERIOD, 
                      dbo.PS_JRNL_HEADER.JOURNAL_ID, dbo.PS_JRNL_HEADER.JOURNAL_DATE, 
                      dbo.PS_JRNL_LN.JOURNAL_LINE, dbo.PS_JRNL_LN.JRNL_LN_REF, dbo.PS_JRNL_HEADER.SOURCE, dbo.PS_JRNL_LN.ACCOUNT, 
                      dbo.PS_JRNL_LN.DEPTID, dbo.PS_JRNL_LN.OPERATING_UNIT, dbo.PS_JRNL_LN.FUND_CODE, dbo.PS_JRNL_LN.PROJECT_ID, 
                      dbo.PS_JRNL_LN.CHARTFIELD1, dbo.PS_JRNL_HEADER.REVERSAL_CD, 
		dbo.PS_JRNL_LN.MONETARY_AMOUNT,
		dbo.PS_JRNL_LN.STATISTIC_AMOUNT, 
                      dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS, dbo.PS_JRNL_LN.LINE_DESCR, dbo.qryINDetails.JRNL_LN_REF AS JRNL_LN_REF2, 
                      dbo.qryINDetails.PH_REF_CHAR_01, dbo.qryINDetails.PH_REF_CHAR_02, dbo.qryINDetails.PH_REF_CHAR_03, dbo.qryINDetails.PH_REF_CHAR_04, 
                      dbo.qryINDetails.PH_REF_CHAR_05, dbo.qryINDetails.PH_REF_CHAR_06 ,
ISNULL(dbo.qryINDetails.MONETARY_AMOUNT, dbo.PS_JRNL_LN.MONETARY_AMOUNT)  AS  DET_AMT, 
ISNULL(dbo.qryINDetails.STATISTIC_AMOUNT, dbo.PS_JRNL_LN.STATISTIC_AMOUNT)  AS DET_STAT_AMT
FROM         dbo.PS_JRNL_HEADER INNER JOIN
                      dbo.PS_JRNL_LN ON dbo.PS_JRNL_HEADER.JOURNAL_ID = dbo.PS_JRNL_LN.JOURNAL_ID AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_DATE = dbo.PS_JRNL_LN.JOURNAL_DATE AND 

                      dbo.PS_JRNL_HEADER.BUSINESS_UNIT = dbo.PS_JRNL_LN.BUSINESS_UNIT

                      AND dbo.PS_JRNL_HEADER.UNPOST_SEQ = dbo.PS_JRNL_LN.UNPOST_SEQ
		LEFT OUTER JOIN
                      dbo.qryINDetails ON dbo.PS_JRNL_LN.JOURNAL_ID = dbo.qryINDetails.JOURNAL_ID AND 
                      dbo.PS_JRNL_LN.JOURNAL_LINE = dbo.qryINDetails.JOURNAL_LINE
WHERE     ((dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'P') OR
                      (dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'U')) AND
		(dbo.PS_JRNL_HEADER.SOURCE = 'ING')
		AND (dbo.PS_JRNL_LN.JRNL_LINE_STATUS <> 1) -- 20041115
		/*20050427 AND PS_JRNL_HEADER.FISCAL_YEAR = @FY
		AND (PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)*/
		AND ((PS_JRNL_HEADER.FISCAL_YEAR = @FY AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (PS_JRNL_HEADER.FISCAL_YEAR = @FY2 AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROC dbo.aprJrnlDetails_ONL
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT, @FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT)
AS
SELECT     dbo.PS_JRNL_LN.BUSINESS_UNIT, dbo.PS_JRNL_HEADER.FISCAL_YEAR, dbo.PS_JRNL_HEADER.ACCOUNTING_PERIOD, 
                      dbo.PS_JRNL_HEADER.JOURNAL_ID, dbo.PS_JRNL_HEADER.JOURNAL_DATE, dbo.PS_JRNL_LN.JOURNAL_LINE, dbo.PS_JRNL_LN.JRNL_LN_REF, 
                      dbo.PS_JRNL_HEADER.SOURCE, dbo.PS_JRNL_LN.ACCOUNT, dbo.PS_JRNL_LN.DEPTID, dbo.PS_JRNL_LN.OPERATING_UNIT, 
                      dbo.PS_JRNL_LN.FUND_CODE, dbo.PS_JRNL_LN.PROJECT_ID, dbo.PS_JRNL_LN.CHARTFIELD1, dbo.PS_JRNL_HEADER.REVERSAL_CD, 
                      dbo.PS_JRNL_LN.MONETARY_AMOUNT, dbo.PS_JRNL_LN.STATISTIC_AMOUNT, dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS, 
                      dbo.PS_JRNL_LN.LINE_DESCR, '' AS JRNL_LN_REF2,  ''  AS PH_REF_CHAR_01, dbo.PS_JRNL_HEADER.DESCR AS PH_REF_CHAR_02, 
                      '' AS PH_REF_CHAR_03, '' AS PH_REF_CHAR_04, '' AS PH_REF_CHAR_05, '' AS PH_REF_CHAR_06, 
                      dbo.PS_JRNL_LN.MONETARY_AMOUNT AS DET_AMT, dbo.PS_JRNL_LN.STATISTIC_AMOUNT AS DET_STAT
FROM         dbo.PS_JRNL_HEADER INNER JOIN
                      dbo.PS_JRNL_LN ON dbo.PS_JRNL_HEADER.BUSINESS_UNIT = dbo.PS_JRNL_LN.BUSINESS_UNIT AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_DATE = dbo.PS_JRNL_LN.JOURNAL_DATE AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_ID = dbo.PS_JRNL_LN.JOURNAL_ID
                     AND dbo.PS_JRNL_HEADER.UNPOST_SEQ = dbo.PS_JRNL_LN.UNPOST_SEQ --removed 2003/08/5

WHERE     (dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'P' OR
                      dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'U') AND (dbo.PS_JRNL_HEADER.SOURCE NOT IN ('APG', 'PYG', 'IFX','AMG','ING','PO'))
		AND (dbo.PS_JRNL_LN.JRNL_LINE_STATUS <> 1) -- 20041115
		/*20050427 AND PS_JRNL_HEADER.FISCAL_YEAR = @FY
		AND (PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)*/
		AND ((PS_JRNL_HEADER.FISCAL_YEAR = @FY AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (PS_JRNL_HEADER.FISCAL_YEAR = @FY2 AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROC dbo.aprJrnlDetails_PO
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT,@FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT)
AS
-- ADDED 2004/01/31
-- AMIN J.
SELECT     dbo.PS_JRNL_LN.BUSINESS_UNIT, dbo.PS_JRNL_HEADER.FISCAL_YEAR, dbo.PS_JRNL_HEADER.ACCOUNTING_PERIOD, 
                      dbo.PS_JRNL_HEADER.JOURNAL_ID, dbo.PS_JRNL_HEADER.JOURNAL_DATE, 
                      dbo.PS_JRNL_LN.JOURNAL_LINE, dbo.PS_JRNL_LN.JRNL_LN_REF, dbo.PS_JRNL_HEADER.SOURCE, dbo.PS_JRNL_LN.ACCOUNT, 
                      dbo.PS_JRNL_LN.DEPTID, dbo.PS_JRNL_LN.OPERATING_UNIT, dbo.PS_JRNL_LN.FUND_CODE, dbo.PS_JRNL_LN.PROJECT_ID, 
                      dbo.PS_JRNL_LN.CHARTFIELD1, dbo.PS_JRNL_HEADER.REVERSAL_CD, 
		dbo.PS_JRNL_LN.MONETARY_AMOUNT,
		dbo.PS_JRNL_LN.STATISTIC_AMOUNT, 
                      dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS, dbo.PS_JRNL_LN.LINE_DESCR, dbo.qryPODetails.JRNL_LN_REF AS JRNL_LN_REF2, 
                      dbo.qryPODetails.PH_REF_CHAR_01, dbo.qryPODetails.PH_REF_CHAR_02, dbo.qryPODetails.PH_REF_CHAR_03, dbo.qryPODetails.PH_REF_CHAR_04, 
                      dbo.qryPODetails.PH_REF_CHAR_05, dbo.qryPODetails.PH_REF_CHAR_06 ,
ISNULL(dbo.qryPODetails.MONETARY_AMOUNT, dbo.PS_JRNL_LN.MONETARY_AMOUNT)  AS  DET_AMT, 
ISNULL(dbo.qryPODetails.STATISTIC_AMOUNT, dbo.PS_JRNL_LN.STATISTIC_AMOUNT)  AS DET_STAT_AMT
FROM         dbo.PS_JRNL_HEADER INNER JOIN
                      dbo.PS_JRNL_LN ON dbo.PS_JRNL_HEADER.JOURNAL_ID = dbo.PS_JRNL_LN.JOURNAL_ID AND 
                      dbo.PS_JRNL_HEADER.JOURNAL_DATE = dbo.PS_JRNL_LN.JOURNAL_DATE AND 

                      dbo.PS_JRNL_HEADER.BUSINESS_UNIT = dbo.PS_JRNL_LN.BUSINESS_UNIT

                      AND dbo.PS_JRNL_HEADER.UNPOST_SEQ = dbo.PS_JRNL_LN.UNPOST_SEQ
		LEFT OUTER JOIN
                      dbo.qryPODetails ON dbo.PS_JRNL_LN.JOURNAL_ID = dbo.qryPODetails.JOURNAL_ID AND 
                      dbo.PS_JRNL_LN.JOURNAL_LINE = dbo.qryPODetails.JOURNAL_LINE
WHERE     ((dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'P') OR
                      (dbo.PS_JRNL_HEADER.JRNL_HDR_STATUS = 'U')) AND
		(dbo.PS_JRNL_HEADER.SOURCE = 'PO')
		AND (dbo.PS_JRNL_LN.JRNL_LINE_STATUS <> 1) -- 20041115
		/*20050427AND PS_JRNL_HEADER.FISCAL_YEAR = @FY
		AND (PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)*/
		AND ((PS_JRNL_HEADER.FISCAL_YEAR = @FY AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (PS_JRNL_HEADER.FISCAL_YEAR = @FY2 AND PS_JRNL_HEADER.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE  proc dbo.aprJrnlDetails_PYG
(@FY SMALLINT, @P SMALLINT, @PB SMALLINT, @FY2 SMALLINT, @P2 SMALLINT, @PB2 SMALLINT)
AS
SELECT     l.BUSINESS_UNIT, h.FISCAL_YEAR, h.ACCOUNTING_PERIOD, 
                      h.JOURNAL_ID, h.JOURNAL_DATE, 
                      l.JOURNAL_LINE, l.JRNL_LN_REF, h.SOURCE, l.ACCOUNT, 
                      l.DEPTID, l.OPERATING_UNIT, l.FUND_CODE, l.PROJECT_ID, 
                      l.CHARTFIELD1, h.REVERSAL_CD, 
		l.MONETARY_AMOUNT,
		l.STATISTIC_AMOUNT,
                      h.JRNL_HDR_STATUS, l.LINE_DESCR, dbo.qryPYDetails.JRNL_LN_REF AS JRNL_LN_REF2, 
                      dbo.qryPYDetails.PH_REF_CHAR_01, dbo.qryPYDetails.PH_REF_CHAR_02, dbo.qryPYDetails.PH_REF_CHAR_03, dbo.qryPYDetails.PH_REF_CHAR_04, 
                      dbo.qryPYDetails.PH_REF_CHAR_05, dbo.qryPYDetails.PH_REF_CHAR_06, 
		ISNULL(CASE WHEN h.REVERSAL_CD = 'R' THEN qryPYDetails.MONETARY_AMOUNT * -1 ELSE qryPYDetails.MONETARY_AMOUNT END, CASE WHEN h.REVERSAL_CD = 'R' THEN l.MONETARY_AMOUNT * -1 ELSE l.MONETARY_AMOUNT END) AS DET_AMT, 
		ISNULL(CASE WHEN h.REVERSAL_CD = 'R' THEN qryPYDetails.STATISTIC_AMOUNT * -1 ELSE qryPYDetails.STATISTIC_AMOUNT END, CASE WHEN h.REVERSAL_CD = 'R' THEN l.STATISTIC_AMOUNT * -1 ELSE l.STATISTIC_AMOUNT END) AS DET_STAT_AMT
-- changed to linked server 20060612
FROM         /*[VSQLFSM\INSTFSM].FS84PRD.*/ dbo.PS_JRNL_HEADER h INNER JOIN
                     /*[VSQLFSM\INSTFSM].FS84PRD.*/ dbo.PS_JRNL_LN l ON h.JOURNAL_ID = l.JOURNAL_ID AND 
                      h.JOURNAL_DATE = l.JOURNAL_DATE AND 

                      h.BUSINESS_UNIT = l.BUSINESS_UNIT --added 2003/07/14

                      AND h.UNPOST_SEQ = l.UNPOST_SEQ  --removed 2003/08/05

		LEFT OUTER JOIN
                      dbo.qryPYDetails ON l.JOURNAL_ID = dbo.qryPYDetails.JOURNAL_ID AND 
                      l.JOURNAL_LINE = dbo.qryPYDetails.JOURNAL_LINE
WHERE     ((h.JRNL_HDR_STATUS = 'P') OR
                      (h.JRNL_HDR_STATUS = 'U')) AND
			(h.SOURCE = 'PYG')
		AND (l.JRNL_LINE_STATUS <> 1) -- 20041115
		/*20050427 AND h.FISCAL_YEAR = @FY
		AND (h.ACCOUNTING_PERIOD BETWEEN @P AND @PB)*/
		AND ((h.FISCAL_YEAR = @FY AND h.ACCOUNTING_PERIOD BETWEEN @P AND @PB)
		OR (h.FISCAL_YEAR = @FY2 AND h.ACCOUNTING_PERIOD BETWEEN @P2 AND @PB2))
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

