 USE [PS_Det]
GO
/****** Object:  Index [IX_tblFullDetails]    Script Date: 11/15/2006 09:54:32 ******/
if exists (select * from dbo.sysindexes where name = N'IX_tblFullDetails' and id = object_id(N'[dbo].[tblFullDetails]'))
drop index [dbo].[tblFullDetails].[IX_tblFullDetails]
GO


-- add primary key
alter table dbo.tblFullDetails
add Primary Key clustered (ID)


/****** Object:  Index [IX_tblFullDetails]    Script Date: 11/15/2006 09:54:48 ******/
 CREATE  INDEX [IX_tblFullDetails] ON [dbo].[tblFullDetails]([BUSINESS_UNIT], [FISCAL_YEAR], [ACCOUNTING_PERIOD], [ACCOUNT], [DEPTID], [OPERATING_UNIT], [FUND_CODE], [PROJECT_ID], [CHARTFIELD1]) ON [PRIMARY]
GO


