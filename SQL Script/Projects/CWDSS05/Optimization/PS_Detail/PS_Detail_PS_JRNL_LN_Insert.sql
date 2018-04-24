 --select * from dbo.tblApplicationSettings 
exec sp_executesql N'EXEC dbo.aprDtsLoadSimpleTables_ExecuteSQL @P1, @P2, @P3, @P4, @P5, @P6, @P7, @P8, @P9, @P10, @P11, @P12, @P13', N'@P1 nvarchar(4000),@P2 varchar(255),@P3 varchar(4),@P4 varchar(10),@P5 varchar(10),@P6 varchar(2),@P7 varchar(3),@P8 smallint,@P9 varchar(10),@P10 smallint,@P11 varchar(5),@P12 varchar(3),@P13 nvarchar(128)',
 N'INSERT INTO dbo.PS_JRNL_LN
	([BUSINESS_UNIT], 
	 [JOURNAL_ID], 
	 [JOURNAL_DATE], 
	 [UNPOST_SEQ], 
	 [JOURNAL_LINE], 
	 [LEDGER], 
	 [ACCOUNT], 
	 [DEPTID], 
	 [OPERATING_UNIT], 
	 [FUND_CODE], 
	 [AFFILIATE],
	 [AFFILIATE_INTRA1], 
	 [CHARTFIELD1], 
	 [PROJECT_ID], 
	 [CURRENCY_CD], 
	 [STATISTICS_CODE],
	 [MONETARY_AMOUNT], 
	 [STATISTIC_AMOUNT],
	 [JRNL_LN_REF],
	 [SUSPENDED_LINE],
	 [LINE_DESCR],
	 [JRNL_LINE_STATUS],
	 [JRNL_LINE_SOURCE])
SELECT
	[BUSINESS_UNIT], 
	 [JOURNAL_ID], 
	 [JOURNAL_DATE], 
	 [UNPOST_SEQ], 
	 [JOURNAL_LINE], 
	 [LEDGER], 
	 [ACCOUNT], 
	 [DEPTID], 
	 [OPERATING_UNIT], 
	 [FUND_CODE], 
	 [AFFILIATE],
	 [AFFILIATE_INTRA1], 
	 [CHARTFIELD1], 
	 [PROJECT_ID], 
	 [CURRENCY_CD], 
	 [STATISTICS_CODE],
	 [MONETARY_AMOUNT], 
	 [STATISTIC_AMOUNT],
	 [JRNL_LN_REF],
	 [SUSPENDED_LINE],
	 [LINE_DESCR],
	 [JRNL_LINE_STATUS],
	 [JRNL_LINE_SOURCE]
FROM [PHSAPSD4].FS84TST.dbo.PS_JRNL_LN src
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
		((LEN(src.STATISTICS_CODE) > 0) AND ((@FilterForStatisticsCode IS NULL) OR (src.STATISTICS_CODE = @FilterForStatisticsCode))))
	AND (NOT EXISTS
		  (SELECT *
		    FROM dbo.PS_JRNL_LN dst
		    WHERE src.[BUSINESS_UNIT] = dst.[BUSINESS_UNIT]
			AND src.[JOURNAL_ID] = dst.[JOURNAL_ID]
			AND src.[JOURNAL_DATE] = dst.[JOURNAL_DATE]
			AND src.[UNPOST_SEQ] = dst.[UNPOST_SEQ]
			AND src.[JOURNAL_LINE] = dst.[JOURNAL_LINE]
			AND src.[LEDGER] = dst.[LEDGER])); EXEC dbo.aprDtsLoadSimpleTables_SetInsertedRecordCount ''PS_JRNL_LN'', @@ROWCOUNT', 'ER', NULL, 'BUDGETS', 'CRRNT', '01', 'CAD', 2007, 'ACTUALS', 13, 'SET00', 'HRS', N'PS_JRNL_LN'