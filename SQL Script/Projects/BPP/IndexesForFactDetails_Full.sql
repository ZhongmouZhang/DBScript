 USE [BPP]
GO


/****** Object:  Table [dbo].[FactDetails_Full]    Script Date: 04/25/2013 14:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactDetails_Full](
	[GLCOMBO] [nvarchar](53) NULL,
	[BUSINESS_UNIT] [nvarchar](5) NULL,
	[HCM_SETID] [nvarchar](8) NULL,
	[FISCAL_YEAR] [smallint] NOT NULL,
	[ACCOUNTING_PERIOD] [smallint] NOT NULL,
	[TIME] [nvarchar](6) NULL,
	[JOURNAL_ID] [nvarchar](10) NOT NULL,
	[JOURNAL_DATE] [datetime] NOT NULL,
	[JOURNAL_LINE] [int] NOT NULL,
	[JRNL_LINE_STATUS] [nvarchar](10) NULL,
	[FUND_CODE] [nvarchar](5) NULL,
	[ACCOUNT] [nvarchar](10) NOT NULL,
	[DEPTID] [nvarchar](10) NULL,
	[SITE] [nvarchar](8) NULL,
	[PROJECT_ID] [nvarchar](15) NULL,
	[SUBPROJ] [nvarchar](10) NULL,
	[DEPT_SITE] [nvarchar](19) NULL,
	[JRNL_LN_REF] [nvarchar](10) NULL,
	[LINE_DESCR] [nvarchar](30) NULL,
	[REF_01] [nvarchar](10) NULL,
	[REF_02] [nvarchar](30) NULL,
	[REF_03] [nvarchar](30) NULL,
	[REF_04] [nvarchar](60) NULL,
	[REF_05] [nvarchar](60) NULL,
	[REF_06] [nvarchar](80) NULL,
	[MONETARY_AMT] [decimal](28, 3) NULL,
	[STATISTIC_AMT] [decimal](17, 2) NULL,
	[CHARTFIELD2] [nvarchar](10) NULL,
	[CHARTFIELD3] [nvarchar](10) NULL,
	[EMPL_ID] [nvarchar](11) NULL,
	[PAYCODE] [nvarchar](10) NULL,
	[JOBCODE] [nvarchar](10) NULL,
	[UNION_CD] [nvarchar](3) NULL,
	[GRADE] [nvarchar](3) NULL,
	[EE_STATUS] [nvarchar](10) NULL,
	[LINK_KEY] [nvarchar](26) NULL,
	[SUSPENSE_FLAG] [int] NULL,
	[SUSPENDED_LINE] [int] NULL,
	[TRANS_KEY] [int] NULL,
	[TRANS_KEY_DESC] [nvarchar](20) NULL,
	[SOURCE] [nvarchar](40) NULL,
	[TRANS_DATE] [nvarchar](10) NULL,
	[temp_LINK_KEY] [nvarchar](26) NULL,
	[temp_Key] [nvarchar](26) NULL,
	[FTE_PRD] [decimal](10, 4) NULL,
	[STD_HRS] [decimal](10, 2) NULL,
	[STD_HRS_P01] [decimal](10, 5) NULL,
	[STD_HRS_Pxx] [decimal](10, 5) NULL,
	[STD_HRS_P13] [decimal](10, 5) NULL,
	[seqno] [bigint] IDENTITY(1,1) NOT NULL,
	[AFFILIATE_BU] [nvarchar](5) NULL,
	[AFFILIATE_FUND] [nvarchar](5) NULL,
	[DET_AMT_SOURCE] [nvarchar](50) NULL,
 CONSTRAINT [PK_FactDails_Full_Seqno] PRIMARY KEY CLUSTERED 
(
	[seqno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [BPP]
GO


/****** Object:  Index [FactDetails_Full_I01]    Script Date: 06/27/2011 09:53:03 ******/

CREATE NONCLUSTERED INDEX [FactDetails_Full_I01] ON [dbo].[FactDetails_Full] 
(
	[BUSINESS_UNIT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO


/****** Object:  Index [FactDetails_Full_I02]    Script Date: 06/27/2011 09:53:20 ******/
CREATE NONCLUSTERED INDEX [FactDetails_Full_I02] ON [dbo].[FactDetails_Full] 
(
	[FUND_CODE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]


/****** Object:  Index [FactDetails_Full_I03]    Script Date: 06/27/2011 09:54:03 ******/
CREATE NONCLUSTERED INDEX [FactDetails_Full_I03] ON [dbo].[FactDetails_Full] 
(
	[ACCOUNT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]


/****** Object:  Index [FactDetails_Full_I05]    Script Date: 06/27/2011 09:54:19 ******/
CREATE NONCLUSTERED INDEX [FactDetails_Full_I05] ON [dbo].[FactDetails_Full] 
(
	[ACCOUNTING_PERIOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]


/****** Object:  Index [FactDetails_Full_I06]    Script Date: 06/27/2011 09:54:37 ******/
CREATE NONCLUSTERED INDEX [FactDetails_Full_I06] ON [dbo].[FactDetails_Full] 
(
	[DEPT_SITE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]


/****** Object:  Index [FactDetails_Full_I07]    Script Date: 06/27/2011 09:54:50 ******/
CREATE NONCLUSTERED INDEX [FactDetails_Full_I07] ON [dbo].[FactDetails_Full] 
(
	[EMPL_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]


/****** Object:  Index [FactDetails_Full_I08]    Script Date: 06/27/2011 09:55:03 ******/
CREATE NONCLUSTERED INDEX [FactDetails_Full_I08] ON [dbo].[FactDetails_Full] 
(
	[FISCAL_YEAR] ASC,
	[ACCOUNTING_PERIOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]


/****** Object:  Index [IX_FactDetails_Full_Dept_site_Account]    Script Date: 06/27/2011 09:55:15 ******/
CREATE NONCLUSTERED INDEX [IX_FactDetails_Full_Dept_site_Account] ON [dbo].[FactDetails_Full] 
(
	[DEPT_SITE] ASC,
	[ACCOUNT] ASC,
	[ACCOUNTING_PERIOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]



