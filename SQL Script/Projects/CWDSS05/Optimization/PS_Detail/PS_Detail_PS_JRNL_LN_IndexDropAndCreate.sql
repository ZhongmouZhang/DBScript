 if exists (select * from dbo.sysindexes where name = N'IX_PS_JRNL_LN' and id = object_id(N'[dbo].[PS_JRNL_LN]'))
drop index [dbo].[PS_JRNL_LN].[IX_PS_JRNL_LN]
GO

if exists (select * from dbo.sysindexes where name = N'IX_PS_JRNL_LN_JOURNAL_ID' and id = object_id(N'[dbo].[PS_JRNL_LN]'))
drop index [dbo].[PS_JRNL_LN].[IX_PS_JRNL_LN_JOURNAL_ID]
GO


-------------------------------------------------
CREATE  UNIQUE  INDEX [IX_PS_JRNL_LN] ON [dbo].[PS_JRNL_LN]([BUSINESS_UNIT], [JOURNAL_ID], [JOURNAL_DATE], [UNPOST_SEQ], [JOURNAL_LINE], [LEDGER]) WITH  FILLFACTOR = 90 ON [PRIMARY]
GO

CREATE  INDEX [IX_PS_JRNL_LN_JOURNAL_ID] ON [dbo].[PS_JRNL_LN]([JOURNAL_ID]) ON [PRIMARY]
GO

