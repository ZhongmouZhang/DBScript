-- =============================================
-- Script Template
-- =============================================
Set CurrFiscalYear = 2014
Set @CurrFiscalYear_PeriodStart = 1
Set @CurrFiscalYear_PeriodEnd = 2
Set @PrevFiscalYear = 2013
Set @PrevFiscalYear_PeriodStart = 11
Set @PrevFiscalYear_PeriodEnd = 12
Set @PrevFiscalYear_Period13 = 13
Set @PrevFiscalYear_AdjPeriod = 998
Set @ExceptionFiscalYear = null
Set @ExceptionFiscalYear_PeriodStart = null
Set @ExceptionFiscalYear_PeriodEnd = null



SET @vProcDetails = 'Table [FactDetails_Full]: Delete previous periods';

WHILE (@RowsToDelete > 0)
BEGIN
BEGIN TRANSACTION

DELETE TOP (100000) FROM [dbo].[syn_FactDetails_Full]
WHERE 
(FISCAL_YEAR = 2014 AND ACCOUNTING_PERIOD BETWEEN 1 AND 2)
OR    (FISCAL_YEAR = 2013 AND ACCOUNTING_PERIOD BETWEEN 11 AND 12)
OR    (FISCAL_YEAR = 2013 AND ACCOUNTING_PERIOD IN (13, 998))
OR    (FISCAL_YEAR = @ExceptionFiscalYear AND ACCOUNTING_PERIOD BETWEEN @ExceptionFiscalYear_PeriodStart AND @ExceptionFiscalYear_PeriodEnd)


---- TEST SQL Statement
select FISCAL_YEAR , ACCOUNTING_PERIOD , count(*) records
from BPP.dbo.FactDetails_Full
group by FISCAL_YEAR , ACCOUNTING_PERIOD  with rollup

order by FISCAL_YEAR , ACCOUNTING_PERIOD 

select top 100 *
from BPP.dbo.FactDetails_Full
WHERE 
(FISCAL_YEAR = 2014 AND ACCOUNTING_PERIOD BETWEEN 1 AND 2)
OR    (FISCAL_YEAR = 2013 AND ACCOUNTING_PERIOD BETWEEN 11 AND 12)
OR    (FISCAL_YEAR = 2013 AND ACCOUNTING_PERIOD IN (13, 998))

