 SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_SelectPS_JRNL_LNFromPS') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_SelectPS_JRNL_LNFromPS
GO



create       PROCEDURE hsp_SelectPS_JRNL_LNFromPS 
AS
Declare @stt nvarchar(4000)
DECLARE @Params nvarchar(500)
SET @Params = '@FilterForBookCode char(4), @FilterForBudgetLedger char(10), @FilterForBudgetScenario char(10), @FilterForCurrency char(3), @FilterForGeneralLedger char(10), @FilterForStatisticsCode char(3)'

declare @FilterForBookCodeS char(4), @FilterForBudgetLedgerS char(10), @FilterForBudgetScenarioS char(10), 
	@FilterForCurrencyS char(3), @FilterForGeneralLedgerS char(10), @FilterForStatisticsCodeS char(3)

SELECT  @FilterForBookCodeS = convert(char(4),dbo.fnsAppSetting('FilterForBookCode')) ,
	@FilterForBudgetLedgerS = convert(char(10),dbo.fnsAppSetting('FilterForBudgetLedger')),
	@FilterForBudgetScenarioS = convert(char(10),dbo.fnsAppSetting('FilterForBudgetScenario')),

	@FilterForCurrencyS = convert(char(3),dbo.fnsAppSetting('FilterForCurrency')),
	@FilterForGeneralLedgerS = convert(char(10),dbo.fnsAppSetting('FilterForGeneralLedger')) ,
	@FilterForStatisticsCodeS = convert(char(3),dbo.fnsAppSetting('FilterForStatisticsCode'))
	--dbo.fnsAppSetting('LinkedServer') AS LinkedServer,
	--dbo.fnsAppSetting('SourceDatabase') AS SourceDatabase

set @stt = 'SELECT top 100 [BUSINESS_UNIT], [JOURNAL_ID], [JOURNAL_DATE], [UNPOST_SEQ], [JOURNAL_LINE], 
	 [LEDGER], [ACCOUNT], [DEPTID], [OPERATING_UNIT], [FUND_CODE], 
	 [AFFILIATE],[AFFILIATE_INTRA1], [CHARTFIELD1], [PROJECT_ID], [CURRENCY_CD], 
	 [STATISTICS_CODE],[MONETARY_AMOUNT], [STATISTIC_AMOUNT],[JRNL_LN_REF],[SUSPENDED_LINE],
	 [LINE_DESCR],[JRNL_LINE_STATUS],[JRNL_LINE_SOURCE]
FROM [' +  convert(varchar,dbo.fnsAppSetting('LinkedServer')) + '].' + convert(varchar,dbo.fnsAppSetting('SourceDatabase'))
 + '.dbo.PS_JRNL_LN src
WHERE 
	(@FilterForBookCode IS NULL OR src.BOOK_CODE = @FilterForBookCode)
	AND 
		(	
		(@FilterForGeneralLedger IS NULL AND @FilterForBudgetLedger IS NULL)
			OR 
		(@FilterForBudgetLedger IS NULL AND src.[LEDGER] = @FilterForGeneralLedger)
			OR 
		(@FilterForGeneralLedger IS NULL AND src.[LEDGER] = @FilterForBudgetLedger)
			OR 
		(src.[LEDGER] IN (@FilterForGeneralLedger, @FilterForBudgetLedger))
		)
	AND (@FilterForBudgetScenario IS NULL OR src.[SCENARIO] = '''' OR src.[SCENARIO] = @FilterForBudgetScenario)
	AND 
		(((LEN(src.CURRENCY_CD) > 0) AND ((@FilterForCurrency IS NULL) OR (src.CURRENCY_CD = @FilterForCurrency)))
			OR
		((LEN(src.STATISTICS_CODE) > 0) AND ((@FilterForStatisticsCode IS NULL) OR (src.STATISTICS_CODE = @FilterForStatisticsCode))))'

--print @stt
exec sp_executesql @stt, @Params,
	@FilterForBookCode = @FilterForBookCodeS ,
	@FilterForBudgetLedger = @FilterForBudgetLedgerS,
	@FilterForBudgetScenario = @FilterForBudgetScenarioS,
	@FilterForCurrency = @FilterForCurrencyS,
	@FilterForGeneralLedger = @FilterForGeneralLedgerS ,
	@FilterForStatisticsCode = @FilterForStatisticsCodeS









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

