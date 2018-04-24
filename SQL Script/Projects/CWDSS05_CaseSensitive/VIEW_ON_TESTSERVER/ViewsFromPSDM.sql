if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_BI_ACCOUNT_BS_B_V1_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_BI_ACCOUNT_BS_B_V1_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_BI_ACCOUNT_PL_B_V1_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_BI_ACCOUNT_PL_B_V1_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT2_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT2_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BACKUP_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BACKUP_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BCCHF_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BCCHF_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BCRI_06_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BCRI_06_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BCRI_07_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BCRI_07_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BCRI_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BCRI_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BDGT_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BDGT_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BI_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BI_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BS2_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BS2_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BS_AUDI_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BS_AUDI_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BS_BCCA_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BS_BCCA_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BS_LEAD_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BS_LEAD_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BS_MOH_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BS_MOH_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BS_ORIG_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BS_ORIG_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_FOUNDTN_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_FOUNDTN_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_FS_TEST_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_FS_TEST_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_FS_TST1_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_FS_TST1_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_FS_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_FS_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_PL_AUDI_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_PL_AUDI_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_PL_MOH_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_PL_MOH_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_PL_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_PL_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCTROLLUP_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCTROLLUP_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_AM_ACCOUNT_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_AM_ACCOUNT_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_GL_CIP_ACCOUNTS_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_GL_CIP_ACCOUNTS_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimBusinessUnits_CT_BUS_UNIT_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimBusinessUnits_CT_BUS_UNIT_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimDepartments_PH_DEPARTMENT_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimDepartments_PH_DEPARTMENT_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimFundCodes_PH_FUND_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimFundCodes_PH_FUND_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimOperatingUnits_PH_SITE_BI_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimOperatingUnits_PH_SITE_BI_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimOperatingUnits_PH_SITE_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimOperatingUnits_PH_SITE_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_BI_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_BI_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimSubProjects_PH_SUBPROJECT_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimSubProjects_PH_SUBPROJECT_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryAJ_FTE]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryAJ_FTE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryAJ_FTE_Frozen]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryAJ_FTE_Frozen]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BDGT_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BDGT_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_FS_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_FS_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_PL_MOH_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_PL_MOH_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimBusinessUnits_CT_BUS_UNIT_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimBusinessUnits_CT_BUS_UNIT_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimBusinessUnits_PH_CONSOLIDATION_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimBusinessUnits_PH_CONSOLIDATION_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimDepartments_PH_DEPARTMENT_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimDepartments_PH_DEPARTMENT_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimFundCodes_PH_FUND_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimFundCodes_PH_FUND_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimOperatingUnits_PH_SITE_BI_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimOperatingUnits_PH_SITE_BI_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimOperatingUnits_PH_SITE_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimOperatingUnits_PH_SITE_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_BI_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_BI_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimSubProjects_PH_SUBPROJECT_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimSubProjects_PH_SUBPROJECT_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFinancialWithSeparateMeasures_Method_3A]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFinancialWithSeparateMeasures_Method_3A]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFinancialWithSeparateMeasures_Method_3A_Frozen]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFinancialWithSeparateMeasures_Method_3A_Frozen]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryAJ_MedFTE_Annual_Bud]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryAJ_MedFTE_Annual_Bud]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryAJ_MedFTE_Annual_Bud_Frozen]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryAJ_MedFTE_Annual_Bud_Frozen]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryAJ_OtherFTE_Annual_Bud]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryAJ_OtherFTE_Annual_Bud]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryAJ_OtherFTE_Annual_Bud_Frozen]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryAJ_OtherFTE_Annual_Bud_Frozen]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimBusinessUnits_CT_BUS_UNIT_TreeView_aj]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimBusinessUnits_CT_BUS_UNIT_TreeView_aj]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimDepartments_PH_DEPARTMENT_RPT_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimDepartments_PH_DEPARTMENT_RPT_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimDepartments_PH_DEPT_BCCHF_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimDepartments_PH_DEPT_BCCHF_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimDepartments_PH_DEPT_FOUNDTN_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimDepartments_PH_DEPT_FOUNDTN_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_GL_CIP_PROJECTS_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_GL_CIP_PROJECTS_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_BCCHF_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_BCCHF_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_BCRI2_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_BCRI2_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_BCRI_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_BCRI_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_CAPITAL_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_CAPITAL_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_CATEG_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_CATEG_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_CW_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_CW_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_TEMP_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_TEMP_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimSubProjects_PH_GL_CIP_SUBPROJ_TreeView]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimSubProjects_PH_GL_CIP_SUBPROJ_TreeView]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactActual]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactActual]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactBudget]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactBudget]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFinancialValues_0102andUp]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFinancialValues_0102andUp]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFinancialValues_0304]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFinancialValues_0304]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFinancialValues_0405]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFinancialValues_0405]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFinancialWithSeparateMeasures_Method_3]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFinancialWithSeparateMeasures_Method_3]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFinancialWithSeparateMeasures_Method_3A_20050504]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFinancialWithSeparateMeasures_Method_3A_20050504]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryStagingTreeNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryStagingTreeNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_Cube_Validation_Publishing_Results]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_Cube_Validation_Publishing_Results]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_hw_tblDimAccounts_PH_ACCOUNT_TreeView_CWOnly]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_hw_tblDimAccounts_PH_ACCOUNT_TreeView_CWOnly]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryAJ_BalFwd]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryAJ_BalFwd]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryAdminSupport_Criteria_1_UNWANTED_AS]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryAdminSupport_Criteria_1_UNWANTED_AS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryApplicationSettings_BlankRecordKeys]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryApplicationSettings_BlankRecordKeys]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryApplicationSettings_CurrentProfileSpecificSettings]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryApplicationSettings_CurrentProfileSpecificSettings]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryApplicationSettings_DtsLoadSimpleTables]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryApplicationSettings_DtsLoadSimpleTables]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryApplicationSettings_Errors]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryApplicationSettings_Errors]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryApplicationSettings_Filters]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryApplicationSettings_Filters]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryApplicationSettings_Scripts]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryApplicationSettings_Scripts]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryApplicationSettings_ServersAndDatabases]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryApplicationSettings_ServersAndDatabases]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryApplicationSettings_Statistics]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryApplicationSettings_Statistics]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryApplicationSettings_TruncateSettings]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryApplicationSettings_TruncateSettings]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryBudFix]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryBudFix]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_BI_ACCOUNT_BS_B_V1_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_BI_ACCOUNT_BS_B_V1_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_BI_ACCOUNT_PL_B_V1_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_BI_ACCOUNT_PL_B_V1_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT2_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT2_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BACKUP_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BACKUP_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BCCHF_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BCCHF_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BCRI_06_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BCRI_06_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BCRI_07_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BCRI_07_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BCRI_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BCRI_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BI_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BI_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BS2_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BS2_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BS_AUDI_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BS_AUDI_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BS_BCCA_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BS_BCCA_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BS_LEAD_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BS_LEAD_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BS_MOH_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BS_MOH_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_BS_ORIG_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_BS_ORIG_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_FOUNDTN_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_FOUNDTN_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_FS_TEST_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_FS_TEST_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_FS_TST1_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_FS_TST1_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_PL_AUDI_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_PL_AUDI_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCOUNT_PL_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCOUNT_PL_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_ACCTROLLUP_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_ACCTROLLUP_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_AM_ACCOUNT_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_AM_ACCOUNT_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAccounts_PH_GL_CIP_ACCOUNTS_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAccounts_PH_GL_CIP_ACCOUNTS_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimAffiliateBusinessUnits]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimAffiliateBusinessUnits]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimBusinessUnits_CT_BUS_UNIT_LeafNodes_aj]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimBusinessUnits_CT_BUS_UNIT_LeafNodes_aj]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimBusinessUnits_PH_BUS_UNIT_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimBusinessUnits_PH_BUS_UNIT_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimDepartments_PH_DEPARTMENT_RPT_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimDepartments_PH_DEPARTMENT_RPT_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimDepartments_PH_DEPT_BCCHF_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimDepartments_PH_DEPT_BCCHF_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimDepartments_PH_DEPT_FOUNDTN_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimDepartments_PH_DEPT_FOUNDTN_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimDeptSiteFlat]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimDeptSiteFlat]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_GL_CIP_PROJECTS_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_GL_CIP_PROJECTS_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_BCCHF_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_BCCHF_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_BCRI2_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_BCRI2_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_BCRI_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_BCRI_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_CAPITAL_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_CAPITAL_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_CATEG_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_CATEG_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_CW_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_CW_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimProjects_PH_PROJECT_TEMP_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimProjects_PH_PROJECT_TEMP_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimSubProjects_PH_GL_CIP_SUBPROJ_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimSubProjects_PH_GL_CIP_SUBPROJ_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimValues_CalculatedMeasures_LE]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimValues_CalculatedMeasures_LE]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFS]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFS_backup_20070213]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFS_backup_20070213]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFinancial]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFinancial]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFinancialWithSeparateMeasures_Method_1]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFinancialWithSeparateMeasures_Method_1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFinancialWithSeparateMeasures_Method_2]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFinancialWithSeparateMeasures_Method_2]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFinancialWithSeparateMeasures_Method_2_Frozen]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFinancialWithSeparateMeasures_Method_2_Frozen]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFinancialWithSeparateMeasures_Method_4]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFinancialWithSeparateMeasures_Method_4]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFactFinancialWithSeparateMeasures_Method_4A]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFactFinancialWithSeparateMeasures_Method_4A]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFact_BDGT]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFact_BDGT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFact_MOH]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFact_MOH]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryFact_MOH_20060531]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryFact_MOH_20060531]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_Cube_Validation_PeopleSoft]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_Cube_Validation_PeopleSoft]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_Cube_Validation_PeopleSoft_20051005]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_Cube_Validation_PeopleSoft_20051005]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_Cube_Validation_Publishing]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_Cube_Validation_Publishing]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_DeptSite_Diagnostic_Imaging]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_DeptSite_Diagnostic_Imaging]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_Fact_Diagnostic_Imaging]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_Fact_Diagnostic_Imaging]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_Fact_LabEnterprise]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_Fact_LabEnterprise]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_hw_Accounts_CWOnly]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_hw_Accounts_CWOnly]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_hw_Department_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_hw_Department_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_hw_DeptList_ByBusinessUnit]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_hw_DeptList_ByBusinessUnit]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_hw_DeptSiteList_ByBusinessUnit]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_hw_DeptSiteList_ByBusinessUnit]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_hw_DeptSite_CWOnly]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_hw_DeptSite_CWOnly]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_hw_Dept_DeptSite_Crossmatch_AS]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_hw_Dept_DeptSite_Crossmatch_AS]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_hw_DimDeptSite_CWOnly]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_hw_DimDeptSite_CWOnly]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_hw_Dim_DeptSite_Department_Crossmatch_AS_ONLY]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_hw_Dim_DeptSite_Department_Crossmatch_AS_ONLY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vw_Fact_2005]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vw_Fact_2005]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimDeptSite_LeafNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimDeptSite_LeafNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryDimFundCodes_PH_FUND_TreeView_ReversedParentNodes]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryDimFundCodes_PH_FUND_TreeView_ReversedParentNodes]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qryTreeviews]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qryTreeviews]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_Cube_Validation_PeopleSoft_Results]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_Cube_Validation_PeopleSoft_Results]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_hw_DimDepartments_AS_List]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_hw_DimDepartments_AS_List]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_hw_DimDeptSite_AS_List]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_hw_DimDeptSite_AS_List]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_hw_DimDeptSite_AS_ONLY]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_hw_DimDeptSite_AS_ONLY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[qry_hw_Dim_Department_AS_ONLY]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[qry_hw_Dim_Department_AS_ONLY]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.qryDimDeptSite_LeafNodes
AS
SELECT     dbo.DimDeptSite.*, SiteID AS EXPR1
FROM         dbo.DimDeptSite
WHERE     (NOT (DeptID IS NULL)) AND (NOT (SiteID IS NULL))


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_Cube_Validation_PeopleSoft_Results
AS
SELECT     TOP 100 PERCENT BU_Cube, Fund_Cube, Time_Cube, ValueType, Value_Cube, Value_PS, CAST(Value_Cube AS Int) - CAST(Value_PS AS Int) 
                      AS Variance
FROM         dbo.qry_Cube_Validation_PeopleSoft
WHERE     (CAST(Value_Cube AS Int) - CAST(Value_PS AS Int) > 1000 OR
                      CAST(Value_Cube AS Int) - CAST(Value_PS AS Int) < - 1000)
ORDER BY ValueType, BU_Cube, Fund_Cube


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_hw_DimDepartments_AS_List
AS
SELECT     TOP 100 PERCENT DepartmentKey, RTRIM(Code) AS DepartmentCode, Descr
FROM         dbo.tblDimDepartments_PH_DEPARTMENT_TreeView_AdminSupport
GROUP BY RTRIM(Code), Descr, DepartmentKey
HAVING      (RTRIM(Code) <> '')
ORDER BY RTRIM(Code)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_hw_DimDeptSite_AS_List
AS
SELECT     TOP 100 PERCENT DeptID, RTRIM(DeptCode) AS DepartmentCode
FROM         dbo.DimDeptSite_AdminSupport_MOH
GROUP BY RTRIM(DeptCode), DeptID
HAVING      (RTRIM(DeptCode) <> '')
ORDER BY RTRIM(DeptCode)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_hw_DimDeptSite_AS_ONLY
AS
SELECT     TOP 100 PERCENT DeptID, RTRIM(DeptCode) AS DeptCode
FROM         dbo.DimDeptSite_AdminSupport_MOH_AS_ONLY
WHERE     (RTRIM(DeptCode) <> '')
ORDER BY RTRIM(DeptCode)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_hw_Dim_Department_AS_ONLY
AS
SELECT     TOP 100 PERCENT DepartmentKey, RTRIM(Code) AS DeptCode, Descr
FROM         dbo.tblDimDepartments_PH_DEPARTMENT_TreeView_AdminSupport_AS_ONLY
WHERE     (RTRIM(Code) <> '')
ORDER BY DepartmentKey

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryAJ_BalFwd
AS
SELECT     dbo.DimDeptSite.ID AS DeptSiteKey, 0 AS FactFinancialKey, dbo.tblDimTime.TimeKey, dbo.tblStagingLedger.AccountKey, 
                      dbo.tblStagingLedger.BudgetScenarioKey, dbo.tblStagingLedger.BusinessUnitKey, dbo.tblStagingLedger.DepartmentKey, 
                      dbo.tblStagingLedger.FundCodeKey, dbo.tblStagingLedger.OperatingUnitKey, dbo.tblStagingLedger.ProjectKey, dbo.tblStagingLedger.SubProjectKey, 
                      dbo.tblStagingLedger.AmountTypeKey, dbo.tblStagingLedger.Amount AS [Value], 51 AS ValueKey
FROM         dbo.tblStagingLedger INNER JOIN
                      dbo.tblDimTime ON dbo.tblStagingLedger.FISCAL_YEAR = dbo.tblDimTime.YearKey LEFT OUTER JOIN
                      dbo.DimDeptSite ON dbo.tblStagingLedger.DepartmentKey = dbo.DimDeptSite.DeptID AND 
                      dbo.tblStagingLedger.OperatingUnitKey = dbo.DimDeptSite.SiteID
WHERE     (dbo.tblStagingLedger.ACCOUNTING_PERIOD = 0) AND (dbo.tblStagingLedger.AmountTypeKey = 1)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryAdminSupport_Criteria_1_UNWANTED_AS
AS
SELECT     dbo.tblFact_AdminSupport.FactFinancialKey, dbo.tblFact_AdminSupport.AccountKey, dbo.tblFact_AdminSupport.DepartmentKey, 
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView_AdminSupport.Code AS AccCode, 
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView_AdminSupport.FullDescr AS AccDesc, 
                      dbo.tblDimDepartments_PH_DEPARTMENT_TreeView_AdminSupport.Code AS DeptCode, 
                      dbo.tblDimDepartments_PH_DEPARTMENT_TreeView_AdminSupport.FullDescr AS DeptDesc
FROM         dbo.tblFact_AdminSupport INNER JOIN
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView_AdminSupport ON 
                      dbo.tblFact_AdminSupport.AccountKey = dbo.tblDimAccounts_PH_ACCOUNT_TreeView_AdminSupport.AccountKey INNER JOIN
                      dbo.tblDimDepartments_PH_DEPARTMENT_TreeView_AdminSupport ON 
                      dbo.tblFact_AdminSupport.DepartmentKey = dbo.tblDimDepartments_PH_DEPARTMENT_TreeView_AdminSupport.DepartmentKey
WHERE     (dbo.tblFact_AdminSupport.AccountKey IN
                          (SELECT     AccountKey
                            FROM          tblAccountFilter)) AND (NOT (dbo.tblFact_AdminSupport.DepartmentKey IN
                          (SELECT     DepartmentKey
                            FROM          tblDepartmentFilter)))

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  View dbo.qryApplicationSettings_BlankRecordKey    Script Date: 6/2/2003 4:48:01 PM ******/



CREATE   VIEW qryApplicationSettings_BlankRecordKeys
AS 
	SELECT * FROM dbo.tblApplicationSettings
	WHERE [Key] LIKE '%[_]BlankRecordKey'




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



/****** Object:  View dbo.qryApplicationSettings_BlankRecordKey    Script Date: 6/2/2003 4:48:01 PM ******/



CREATE   VIEW qryApplicationSettings_CurrentProfileSpecificSettings
AS 
	SELECT ap.* 
	FROM dbo.tblApplicationSettings ap
		INNER JOIN (SELECT CONVERT(int, [Value]) AS CurrentProfile
				FROM dbo.tblApplicationSettings
				WHERE [Profile] IS NULL 
					AND [Key] = 'CurrentProfile') cp
		ON ap.[Profile] = cp.CurrentProfile






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  View dbo.qryApplicationSettings_DtsLoadSimpleTables    Script Date: 6/2/2003 4:48:02 PM ******/



CREATE   VIEW qryApplicationSettings_DtsLoadSimpleTables
AS 
	SELECT * FROM dbo.tblApplicationSettings
	WHERE [Key] LIKE '%LoadSimpleTables[_]%'




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  View dbo.qryApplicationSettings_Errors    Script Date: 6/2/2003 4:48:02 PM ******/




CREATE   VIEW qryApplicationSettings_Errors
AS 
	SELECT [Profile], 
		CONVERT(varchar(256),[Key]) AS [Key], 
		[Value], 
		[Description] 
	FROM dbo.tblApplicationSettings
	WHERE [Key] LIKE '%[_]Errors[_]%'



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  View dbo.qryApplicationSettings_Filters    Script Date: 6/2/2003 4:48:02 PM ******/


CREATE  VIEW qryApplicationSettings_Filters
AS 
	SELECT * FROM dbo.tblApplicationSettings
	WHERE [Key] LIKE 'FilterFor%'



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  View dbo.qryApplicationSettings_Scripts    Script Date: 6/2/2003 4:48:02 PM ******/


CREATE  VIEW qryApplicationSettings_Scripts
AS 
	SELECT * FROM dbo.tblApplicationSettings
	WHERE [Key] LIKE 'Script%'



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  View dbo.qryApplicationSettings_ServersAndDatabases    Script Date: 6/2/2003 4:48:02 PM ******/


CREATE  VIEW qryApplicationSettings_ServersAndDatabases
AS 
	SELECT * FROM dbo.tblApplicationSettings
	WHERE [Key] LIKE '%Server' 
		OR [Key] LIKE '%Database' 



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


/****** Object:  View dbo.qryApplicationSettings_Statistics    Script Date: 6/2/2003 4:48:02 PM ******/



CREATE   VIEW qryApplicationSettings_Statistics
AS 
	SELECT [Profile], 
		CONVERT(varchar(256),[Key]) AS [Key], 
		[Value], 
		[Description] 
	FROM dbo.tblApplicationSettings
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


/****** Object:  View dbo.qryApplicationSettings_TruncateSettings    Script Date: 6/2/2003 4:48:02 PM ******/




CREATE    VIEW qryApplicationSettings_TruncateSettings
	([Profile], [Key], [Value], [Description])
AS 
	SELECT [Profile], [Key], [Value], [Description]
	FROM dbo.tblApplicationSettings
	WHERE [Key] = 'AllTablesTruncateAndReloadRecordsOnNextImport'
		OR [Key] LIKE '%[_]TruncateTableOnLoad'





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryBudFix
AS
SELECT    Left(TimeKey,4) as FY ,  right(TimeKey,2) as Period,tblDimValues.DescrShort As ActOrBud,tblDimDepartments.Code AS Dept, tblDimOperatingUnits.Code as Site, 
	a.Code as Account,
	case when a.Code = '3504040' then ([Value]) end As UPPBen,
	case when a.Code >='3501000' and a.Code <= '3503999' Then ([Value]) 
	end as UPPSal
FROM         tblFact INNER JOIN
                      tblDimAccounts a ON tblFact.AccountKey = a.AccountKey INNER JOIN
                      tblDimDepartments ON tblFact.DepartmentKey = tblDimDepartments.DepartmentKey INNER JOIN
                      tblDimValues ON tblFact.ValueKey = tblDimValues.ValueKey INNER JOIN
		tblDimOperatingUnits on tblFact.OperatingUnitKey = tblDimOperatingUnits.OperatingUnitKey
WHERE     (tblFact.BusinessUnitKey = 2) AND (tblFact.FundCodeKey = 1)
--Group by TimeKey, tblDimValues.DescrShort, tblDimDepartments.Code, a.Code
 AND (tblDimValues.DescrShort = 'Act' OR
                      tblDimValues.DescrShort = 'Bud')
	AND a.Code Between '3501000' and '3504040'
	And TimeKey Between 200301 and 200413
	and AmountTypeKey in (1)






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_BI_ACCOUNT_BS_B_V1_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'BI_ACCOUNT_BS_B_V1'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_BI_ACCOUNT_PL_B_V1_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'BI_ACCOUNT_PL_B_V1'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT2_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT2'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BACKUP_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_BACKUP'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BCCHF_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_BCCHF'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BCRI_06_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_BCRI_06'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BCRI_07_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_BCRI_07'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BCRI_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_BCRI'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BI_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_BI'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BS2_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_BS2'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BS_AUDI_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_BS_AUDI'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BS_BCCA_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_BS_BCCA'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BS_LEAD_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_BS_LEAD'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BS_MOH_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_BS_MOH'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BS_ORIG_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_BS_ORIG'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_FOUNDTN_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_FOUNDTN'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_FS_TEST_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_FS_TEST'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_FS_TST1_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_FS_TST1'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_PL_AUDI_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_PL_AUDI'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_PL_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_PL'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCTROLLUP_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCTROLLUP'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_AM_ACCOUNT_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_AM_ACCOUNT'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_GL_CIP_ACCOUNTS_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_GL_CIP_ACCOUNTS'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.qryDimAffiliateBusinessUnits
AS
SELECT     BusinessUnitKey as AffiliateKey, Code, EffectiveDate, Descr, DescrShort, EliminationsOnly, RTRIM(Code) + ': ' + Descr AS DescrFull
FROM         dbo.tblDimBusinessUnits

/*union

select 0, '', '1901-01-01', '<no business unit>','<no BU>', 'N', '<no business unit>'*/



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryDimBusinessUnits_CT_BUS_UNIT_LeafNodes_aj
	(LeafNode, BusinessUnitKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [EliminationsOnly])
AS
SELECT     ln.TREE_NODE, src.BusinessUnitKey, ln.TREE_NODE_NUM, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')) 
                      AS EXPR1, ln.SortOrder + STR(lr.SortOrder, 5, 0) + src.Code AS EXPR2, src.DescrShort, RTRIM(ISNULL(src.Code, '')) 
                      + ': ' + RTRIM(ISNULL(src.DescrShort, '')) AS EXPR3, src.EliminationsOnly
FROM         dbo.tblStagingCustomTreeNodes ln INNER JOIN
                      dbo.tblStagingCustomTreeLeafRanges lr ON ln.TREE_NODE_NUM = lr.TREE_NODE_NUM AND ln.TREE_NAME = lr.TREE_NAME INNER JOIN
                      dbo.tblDimBusinessUnits src ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE     (ln.TREE_NAME = 'CT_BUS_UNIT')



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE VIEW dbo.[qryDimBusinessUnits_PH_BUS_UNIT_LeafNodes]
	(LeafNode, BusinessUnitKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 

SELECT 
	ln.Descr, src.BusinessUnitKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimBusinessUnits src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_CONSOLIDATION' OR      ln.TreeName = 'CT_BUS_UNIT'



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimDepartments_PH_DEPARTMENT_RPT_LeafNodes]
	(LeafNode, DepartmentKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.DepartmentKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimDepartments src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_DEPARTMENT_RPT'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimDepartments_PH_DEPT_BCCHF_LeafNodes]
	(LeafNode, DepartmentKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.DepartmentKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimDepartments src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_DEPT_BCCHF'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimDepartments_PH_DEPT_FOUNDTN_LeafNodes]
	(LeafNode, DepartmentKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.DepartmentKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimDepartments src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_DEPT_FOUNDTN'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW [dbo].[qryDimDeptSiteFlat]
AS
SELECT     L1.[ID] AS L1ID, L2.[ID] AS L2ID, L3.[ID] AS L3ID, L4.[ID] AS L4ID, L5.[ID] AS L5ID, L6.[ID] AS L6ID,
L1.Descr AS L1Descr, L2.Descr AS L2Descr, L3.Descr AS L3Descr, L4.Descr AS L4Descr, L5.Descr AS L5Descr, L6.Descr AS L6Descr,
L2.SortOrder as L2Sort, L2.DeptCode as L2D, L2.SiteCode AS L2S, L3.SortOrder as L3Sort, L3.DeptCode AS L3D, L3.SiteCode AS L3S, 
L4.SortOrder as L4Sort, L4.DeptCode as L4D, L4.SiteCode AS L4S, L5.SortOrder as L5Sort, L5.DeptCode AS L5D, L5.SiteCode AS L5S, 
L6.DeptCode AS L6D, L6.SiteCode AS L6S
FROM         DimDeptSite L1 LEFT OUTER JOIN
                      DimDeptSite L2 ON L2.ParentID = L1.ID LEFT OUTER JOIN
                      DimDeptSite L3 ON L3.ParentID = ISNULL(L2.ID, L1.ID) LEFT OUTER JOIN
                      DimDeptSite L4 ON L4.ParentID = ISNULL(L3.ID, ISNULL(L2.ID, L1.ID)) LEFT OUTER JOIN
                      DimDeptSite L5 ON L5.ParentID = ISNULL(L4.ID, ISNULL(L3.ID, ISNULL(L2.ID, L1.ID))) LEFT OUTER JOIN
                      DimDeptSite L6 ON L6.ParentID = ISNULL(L5.ID, ISNULL(L4.ID, ISNULL(L3.ID, ISNULL(L2.ID, L1.ID))))
WHERE     (L1.ParentID = 0)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_GL_CIP_PROJECTS_LeafNodes]
	(LeafNode, ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.ProjectKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrLong], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrLong, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimProjects src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_GL_CIP_PROJECTS'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_BCCHF_LeafNodes]
	(LeafNode, ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.ProjectKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrLong], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrLong, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimProjects src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_PROJECT_BCCHF'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_BCRI2_LeafNodes]
	(LeafNode, ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.ProjectKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrLong], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrLong, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimProjects src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_PROJECT_BCRI2'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_BCRI_LeafNodes]
	(LeafNode, ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.ProjectKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrLong], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrLong, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimProjects src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_PROJECT_BCRI'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_CAPITAL_LeafNodes]
	(LeafNode, ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.ProjectKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrLong], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrLong, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimProjects src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_PROJECT_CAPITAL'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_CATEG_LeafNodes]
	(LeafNode, ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.ProjectKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrLong], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrLong, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimProjects src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_PROJECT_CATEG'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_CW_LeafNodes]
	(LeafNode, ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.ProjectKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrLong], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrLong, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimProjects src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_PROJECT_CW'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_LeafNodes]
	(LeafNode, ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.ProjectKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrLong], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrLong, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimProjects src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_PROJECT'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_TEMP_LeafNodes]
	(LeafNode, ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.ProjectKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrLong], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrLong, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimProjects src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_PROJECT_TEMP'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimSubProjects_PH_GL_CIP_SUBPROJ_LeafNodes]
	(LeafNode, SubProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.SubProjectKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimSubProjects src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_GL_CIP_SUBPROJ'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.viw_tblDimValues_CalculatedMeasures_LE
AS
SELECT     ValueKey, Code, Descr, DescrShort, DescrLong, SortOrder, Formula, SolveOrder
FROM         dbo.tblDimValues_CalculatedMeasures
WHERE     (NOT (ValueKey IN (72, 74)))

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.qryFactFS
AS

--Actual rows
select --top 100  
TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
3 as ValueKey, POSTED_TOTAL_AMT as Amount
from dbo.tblStagingLedger
where IsBudgetRecord = 0
and ACCOUNTING_PERIOD between 1 and 13
AND AmountTypeKey = 1 ----20070213 cwust FS cube changed to include Hours & FTE

union
--adjustment period rows (actual only)
select --top 100 
FISCAL_YEAR * 1000 + ACCOUNTING_PERIOD as TimeKey, 
AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
3 as ValueKey, POSTED_TOTAL_AMT  as Amount
from dbo.tblStagingLedger
where IsBudgetRecord = 0
and ACCOUNTING_PERIOD > 13
AND AmountTypeKey = 1 ----20070213 cwust FS cube changed to include Hours & FTE

Union
--balance forward rows (actual only)
select --top 100  
t.TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
51 as ValueKey, POSTED_TOTAL_AMT  as Amount
from dbo.tblStagingLedger, tblDimTime1 t
where IsBudgetRecord = 0
and ACCOUNTING_PERIOD = 0
--and t.PeriodKey <= 13
AND AmountTypeKey = 1 ----20070213 cwust FS cube changed to include Hours & FTE
and FISCAL_YEAR = t.YearKey

Union 
--Budget rows
select --top 100  
TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
4 as ValueKey, POSTED_TOTAL_AMT as Amount
from dbo.tblStagingLedger
where IsBudgetRecord = 1
and ACCOUNTING_PERIOD > 0
AND AmountTypeKey = 1 ----20070213 cwust FS cube changed to include Hours & FTE


/* -- disabled 2006-06-23 to include non consolidating bus units.
--Actual rows
select --top 100  
TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
3 as ValueKey, POSTED_TOTAL_AMT as Amount
from dbo.tblStagingLedger
where IsBudgetRecord = 0
and ACCOUNTING_PERIOD between 1 and 13
AND AmountTypeKey = 1
and (BusinessUnitKey IN
                          (SELECT 
    BusinessUnitKey
                            
FROM          tblDimBusinessUnits_CT_BUS_UNIT_TreeView))

union
--adjustment period rows (actual only)
select --top 100 
FISCAL_YEAR * 1000 + ACCOUNTING_PERIOD as TimeKey, 
AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
3 as ValueKey, POSTED_TOTAL_AMT  as Amount
from dbo.tblStagingLedger
where IsBudgetRecord = 0
and ACCOUNTING_PERIOD > 13
AND AmountTypeKey = 1
and (BusinessUnitKey IN
                          (SELECT 
    BusinessUnitKey
                            
FROM          tblDimBusinessUnits_CT_BUS_UNIT_TreeView))

Union
--balance forward rows (actual only)
select --top 100  
t.TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
51 as ValueKey, POSTED_TOTAL_AMT  as Amount
from dbo.tblStagingLedger, tblDimTime1 t
where IsBudgetRecord = 0
and ACCOUNTING_PERIOD = 0
--and t.PeriodKey <= 13
AND AmountTypeKey = 1
and FISCAL_YEAR = t.YearKey
and (BusinessUnitKey IN
                          (SELECT 
    BusinessUnitKey
                            
FROM          tblDimBusinessUnits_CT_BUS_UNIT_TreeView))

Union 
--Budget rows
select --top 100  
TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 

AffiliateKey, AffiliateIntra1Key,
4 as ValueKey, POSTED_TOTAL_AMT as Amount
from dbo.tblStagingLedger
where IsBudgetRecord = 1
and ACCOUNTING_PERIOD > 0
AND AmountTypeKey = 1
and (BusinessUnitKey IN
                          (SELECT 
    BusinessUnitKey
                            
FROM          tblDimBusinessUnits_CT_BUS_UNIT_TreeView))
*/


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryFactFS_backup_20070213
AS

--Actual rows
select --top 100  
TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
3 as ValueKey, POSTED_TOTAL_AMT as Amount
from dbo.tblStagingLedger
where IsBudgetRecord = 0
and ACCOUNTING_PERIOD between 1 and 13
AND AmountTypeKey = 1

union
--adjustment period rows (actual only)
select --top 100 
FISCAL_YEAR * 1000 + ACCOUNTING_PERIOD as TimeKey, 
AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
3 as ValueKey, POSTED_TOTAL_AMT  as Amount
from dbo.tblStagingLedger
where IsBudgetRecord = 0
and ACCOUNTING_PERIOD > 13
AND AmountTypeKey = 1

Union
--balance forward rows (actual only)
select --top 100  
t.TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
51 as ValueKey, POSTED_TOTAL_AMT  as Amount
from dbo.tblStagingLedger, tblDimTime1 t
where IsBudgetRecord = 0
and ACCOUNTING_PERIOD = 0
--and t.PeriodKey <= 13
AND AmountTypeKey = 1
and FISCAL_YEAR = t.YearKey

Union 
--Budget rows
select --top 100  
TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
4 as ValueKey, POSTED_TOTAL_AMT as Amount
from dbo.tblStagingLedger
where IsBudgetRecord = 1
and ACCOUNTING_PERIOD > 0
AND AmountTypeKey = 1


/* -- disabled 2006-06-23 to include non consolidating bus units.
--Actual rows
select --top 100  
TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
3 as ValueKey, POSTED_TOTAL_AMT as Amount
from dbo.tblStagingLedger
where IsBudgetRecord = 0
and ACCOUNTING_PERIOD between 1 and 13
AND AmountTypeKey = 1
and (BusinessUnitKey IN
                          (SELECT 
    BusinessUnitKey
                            
FROM          tblDimBusinessUnits_CT_BUS_UNIT_TreeView))

union
--adjustment period rows (actual only)
select --top 100 
FISCAL_YEAR * 1000 + ACCOUNTING_PERIOD as TimeKey, 
AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
3 as ValueKey, POSTED_TOTAL_AMT  as Amount
from dbo.tblStagingLedger
where IsBudgetRecord = 0
and ACCOUNTING_PERIOD > 13
AND AmountTypeKey = 1
and (BusinessUnitKey IN
                          (SELECT 
    BusinessUnitKey
                            
FROM          tblDimBusinessUnits_CT_BUS_UNIT_TreeView))

Union
--balance forward rows (actual only)
select --top 100  
t.TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
51 as ValueKey, POSTED_TOTAL_AMT  as Amount
from dbo.tblStagingLedger, tblDimTime1 t
where IsBudgetRecord = 0
and ACCOUNTING_PERIOD = 0
--and t.PeriodKey <= 13
AND AmountTypeKey = 1
and FISCAL_YEAR = t.YearKey
and (BusinessUnitKey IN
                          (SELECT 
    BusinessUnitKey
                            
FROM          tblDimBusinessUnits_CT_BUS_UNIT_TreeView))

Union 
--Budget rows
select --top 100  
TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, 
FundCodeKey, OperatingUnitKey, ProjectKey, SubProjectKey, AmountTypeKey, 
AffiliateKey, AffiliateIntra1Key,
4 as ValueKey, POSTED_TOTAL_AMT as Amount
from dbo.tblStagingLedger
where IsBudgetRecord = 1
and ACCOUNTING_PERIOD > 0
AND AmountTypeKey = 1
and (BusinessUnitKey IN
                          (SELECT 
    BusinessUnitKey
                            
FROM          tblDimBusinessUnits_CT_BUS_UNIT_TreeView))
*/


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE   VIEW dbo.qryFactFinancial
	(FactFinancialKey, TimeKey, AccountKey,
	BudgetScenarioKey, BusinessUnitKey, DepartmentKey,
	FundCodeKey, OperatingUnitKey, ProjectKey,
	SubProjectKey, AFFILIATE, AFFILIATE_INTRA1,
	AmountTypeKey, LastUpdatedActual, LastUpdatedBudget,
	[2P Prior Act], [1P Prior Act], Actual,
	Budget, [YTD Act], [YTD Bud],
	[Annual Bud], [Prior Yr YTD Act], [Prior Yr Per],
	[Prior 2Yr Per])
AS 
SELECT
	ff.FactFinancialKey, fm.TimeKey, ff.AccountKey,
	fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, fm.LastUpdatedActual, fm.LastUpdatedBudget,
	fm.[2P Prior Act], fm.[1P Prior Act], fm.Actual,
	fm.Budget, fm.[YTD Act], fm.[YTD Bud],
	fm.[Annual Bud], fm.[Prior Yr YTD Act], fm.[Prior Yr Per],
	fm.[Prior 2Yr Per]
FROM dbo.tblFactFinancial ff 
	INNER JOIN dbo.tblFactFinancialMeasures fm 
	ON ff.FactFinancialKey = fm.FactFinancialKey




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE    VIEW dbo.qryFactFinancialWithSeparateMeasures_Method_1
	(FactFinancialKey, TimeKey, AccountKey,
	BudgetScenarioKey, BusinessUnitKey, DepartmentKey,
	FundCodeKey, OperatingUnitKey, ProjectKey,
	SubProjectKey, AFFILIATE, AFFILIATE_INTRA1,
	AmountTypeKey, Value, ValueKey)
AS 
SELECT
	ff.FactFinancialKey, fm.TimeKey, ff.AccountKey,
	fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, fm.[2P Prior Act] AS Value, 1 AS ValueKey
FROM dbo.tblFactFinancial ff 
	INNER JOIN dbo.tblFactFinancialMeasures fm 
	ON ff.FactFinancialKey = fm.FactFinancialKey
WHERE NOT fm.[2P Prior Act] IS NULL
UNION
SELECT
	ff.FactFinancialKey, fm.TimeKey, ff.AccountKey,
	fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, fm.[1P Prior Act] AS Value, 2 AS ValueKey
FROM dbo.tblFactFinancial ff 
	INNER JOIN dbo.tblFactFinancialMeasures fm 
	ON ff.FactFinancialKey = fm.FactFinancialKey
WHERE NOT fm.[1P Prior Act] IS NULL
UNION
SELECT
	ff.FactFinancialKey, fm.TimeKey, ff.AccountKey,
	fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, fm.Actual AS Value, 3 AS ValueKey
FROM dbo.tblFactFinancial ff 
	INNER JOIN dbo.tblFactFinancialMeasures fm 
	ON ff.FactFinancialKey = fm.FactFinancialKey
WHERE NOT fm.Actual IS NULL
UNION
SELECT
	ff.FactFinancialKey, fm.TimeKey, ff.AccountKey,
	fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, fm.Budget AS Value, 4 AS ValueKey
FROM dbo.tblFactFinancial ff 
	INNER JOIN dbo.tblFactFinancialMeasures fm 
	ON ff.FactFinancialKey = fm.FactFinancialKey
WHERE NOT fm.Budget IS NULL
UNION
SELECT
	ff.FactFinancialKey, fm.TimeKey, ff.AccountKey,
	fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, fm.[YTD Act] AS Value, 5 AS ValueKey
FROM dbo.tblFactFinancial ff 
	INNER JOIN dbo.tblFactFinancialMeasures fm 
	ON ff.FactFinancialKey = fm.FactFinancialKey
WHERE NOT fm.[YTD Act] IS NULL
UNION
SELECT
	ff.FactFinancialKey, fm.TimeKey, ff.AccountKey,
	fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, fm.[YTD Bud] AS Value, 6 AS ValueKey
FROM dbo.tblFactFinancial ff 
	INNER JOIN dbo.tblFactFinancialMeasures fm 
	ON ff.FactFinancialKey = fm.FactFinancialKey
WHERE NOT fm.[YTD Bud] IS NULL
UNION
SELECT
	ff.FactFinancialKey, fm.TimeKey, ff.AccountKey,
	fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, fm.[Annual Bud] AS Value, 7 AS ValueKey
FROM dbo.tblFactFinancial ff 
	INNER JOIN dbo.tblFactFinancialMeasures fm 
	ON ff.FactFinancialKey = fm.FactFinancialKey
WHERE NOT fm.[Annual Bud] IS NULL
UNION
SELECT
	ff.FactFinancialKey, fm.TimeKey, ff.AccountKey,
	fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, fm.[Prior Yr YTD Act] AS Value, 8 AS ValueKey
FROM dbo.tblFactFinancial ff 
	INNER JOIN dbo.tblFactFinancialMeasures fm 
	ON ff.FactFinancialKey = fm.FactFinancialKey
WHERE NOT fm.[Prior Yr YTD Act] IS NULL
UNION
SELECT
	ff.FactFinancialKey, fm.TimeKey, ff.AccountKey,
	fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, fm.[Prior Yr Per] AS Value, 9 AS ValueKey
FROM dbo.tblFactFinancial ff 
	INNER JOIN dbo.tblFactFinancialMeasures fm 
	ON ff.FactFinancialKey = fm.FactFinancialKey
WHERE NOT fm.[Prior Yr Per] IS NULL
UNION
SELECT
	ff.FactFinancialKey, fm.TimeKey, ff.AccountKey,
	fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, fm.[Prior 2Yr Per] AS Value, 10 AS ValueKey
FROM dbo.tblFactFinancial ff 
	INNER JOIN dbo.tblFactFinancialMeasures fm 
	ON ff.FactFinancialKey = fm.FactFinancialKey
WHERE NOT fm.[Prior 2Yr Per] IS NULL




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




CREATE    VIEW dbo.qryFactFinancialWithSeparateMeasures_Method_2
	(FactFinancialKey, TimeKey, AccountKey,
	BudgetScenarioKey, BusinessUnitKey, DepartmentKey,
	FundCodeKey, OperatingUnitKey, ProjectKey,
	SubProjectKey, AFFILIATE, AFFILIATE_INTRA1,
	AmountTypeKey, Value, ValueKey)
AS 
SELECT
	ff.FactFinancialKey, all_fm.TimeKey, ff.AccountKey,
	all_fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, all_fm.Value, all_fm.ValueKey
FROM dbo.tblFactFinancial ff 
	INNER JOIN (SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[2P Prior Act] AS Value, 1 AS ValueKey
			FROM dbo.tblFactFinancialMeasures fm
			WHERE NOT fm.[2P Prior Act] IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[1P Prior Act] AS Value, 2 AS ValueKey
			FROM dbo.tblFactFinancialMeasures fm 
			WHERE NOT fm.[1P Prior Act] IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.Actual AS Value, 3 AS ValueKey
			FROM dbo.tblFactFinancialMeasures fm 
			WHERE NOT fm.Actual IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.Budget AS Value, 4 AS ValueKey
			FROM dbo.tblFactFinancialMeasures fm 
			WHERE NOT fm.Budget IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[YTD Act] AS Value, 5 AS ValueKey
			FROM dbo.tblFactFinancialMeasures fm 
			WHERE NOT fm.[YTD Act] IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[YTD Bud] AS Value, 6 AS ValueKey
			FROM dbo.tblFactFinancialMeasures fm 
			WHERE NOT fm.[YTD Bud] IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[Annual Bud] AS Value, 7 AS ValueKey
			FROM dbo.tblFactFinancialMeasures fm 
			WHERE NOT fm.[Annual Bud] IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[Prior Yr YTD Act] AS Value, 8 AS ValueKey
			FROM dbo.tblFactFinancialMeasures fm 
			WHERE NOT fm.[Prior Yr YTD Act] IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[Prior Yr Per] AS Value, 9 AS ValueKey
			FROM dbo.tblFactFinancialMeasures fm 
			WHERE NOT fm.[Prior Yr Per] IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[Prior 2Yr Per] AS Value, 10 AS ValueKey
			FROM dbo.tblFactFinancialMeasures fm 
			WHERE NOT fm.[Prior 2Yr Per] IS NULL) all_fm
	ON ff.FactFinancialKey = all_fm.FactFinancialKey



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE    VIEW dbo.qryFactFinancialWithSeparateMeasures_Method_2_Frozen
	(FactFinancialKey, TimeKey, AccountKey,
	BudgetScenarioKey, BusinessUnitKey, DepartmentKey,
	FundCodeKey, OperatingUnitKey, ProjectKey,
	SubProjectKey, AFFILIATE, AFFILIATE_INTRA1,
	AmountTypeKey, Value, ValueKey)
AS 
SELECT
	ff.FactFinancialKey, all_fm.TimeKey, ff.AccountKey,
	all_fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, all_fm.Value, all_fm.ValueKey
FROM dbo.tblFactFinancialFrozen ff 
	INNER JOIN (/*SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[2P Prior Act] AS Value, 1 AS ValueKey
			FROM dbo.tblFactFinancialMeasuresFrozen fm
			WHERE NOT fm.[2P Prior Act] IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[1P Prior Act] AS Value, 2 AS ValueKey
			FROM dbo.tblFactFinancialMeasuresFrozen fm 
			WHERE NOT fm.[1P Prior Act] IS NULL
			UNION*/
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.Actual AS Value, 3 AS ValueKey
			FROM dbo.tblFactFinancialMeasuresFrozen fm 
			WHERE NOT fm.Actual IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.Budget AS Value, 4 AS ValueKey
			FROM dbo.tblFactFinancialMeasuresFrozen fm 
			WHERE NOT fm.Budget IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[YTD Act] AS Value, 5 AS ValueKey
			FROM dbo.tblFactFinancialMeasuresFrozen fm 
			WHERE NOT fm.[YTD Act] IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[YTD Bud] AS Value, 6 AS ValueKey
			FROM dbo.tblFactFinancialMeasuresFrozen fm 
			WHERE NOT fm.[YTD Bud] IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[Annual Bud] AS Value, 7 AS ValueKey
			FROM dbo.tblFactFinancialMeasuresFrozen fm 
			WHERE NOT fm.[Annual Bud] IS NULL
			/*UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[Prior Yr YTD Act] AS Value, 8 AS ValueKey
			FROM dbo.tblFactFinancialMeasuresFrozen fm 
			WHERE NOT fm.[Prior Yr YTD Act] IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[Prior Yr Per] AS Value, 9 AS ValueKey
			FROM dbo.tblFactFinancialMeasuresFrozen fm 
			WHERE NOT fm.[Prior Yr Per] IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.[Prior 2Yr Per] AS Value, 10 AS ValueKey
			FROM dbo.tblFactFinancialMeasuresFrozen fm 
			WHERE NOT fm.[Prior 2Yr Per] IS NULL */) all_fm
	ON ff.FactFinancialKey = all_fm.FactFinancialKey




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE    VIEW dbo.qryFactFinancialWithSeparateMeasures_Method_4
	(FactFinancialKey, TimeKey, AccountKey,
	BudgetScenarioKey, BusinessUnitKey, DepartmentKey,
	FundCodeKey, OperatingUnitKey, ProjectKey,
	SubProjectKey, AFFILIATE, AFFILIATE_INTRA1,
	AmountTypeKey, DeptSiteKey, Value, ValueKey)
AS 
SELECT
	ff.FactFinancialKey, all_fm.TimeKey, ff.AccountKey,
	all_fm.BudgetScenarioKey, ff.BusinessUnitKey, ff.DepartmentKey,
	ff.FundCodeKey, ff.OperatingUnitKey, ff.ProjectKey,
	ff.SubProjectKey, ff.AFFILIATE, ff.AFFILIATE_INTRA1,
	ff.AmountTypeKey, ds.[ID], all_fm.Value, all_fm.ValueKey
FROM dbo.tblFactFinancial ff 
	INNER JOIN (SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.Actual AS Value, 3 AS ValueKey
			FROM dbo.tblFactFinancialMeasures fm 
			WHERE NOT fm.Actual IS NULL
			UNION
			SELECT
				fm.FactFinancialKey, fm.TimeKey, fm.BudgetScenarioKey, 
				fm.Budget AS Value, 4 AS ValueKey
			FROM dbo.tblFactFinancialMeasures fm 
			WHERE NOT fm.Budget IS NULL) all_fm
	ON ff.FactFinancialKey = all_fm.FactFinancialKey
	INNER JOIN dbo.qryDimDeptSite_LeafNodes ds
	ON ds.DeptID = ff.DepartmentKey AND ds.SiteID = ff.OperatingUnitKey

--ADDED 20040208 by AJ to include Bal Forward. 
--
-- ** THIS WILL WORK ONLY WHEN THE STAGING TABLE IS FULLY REFRESHED.  incremental refresh of PSDM will cause this to be incomplete.
--
UNION 

SELECT     
	0 AS FactFinancialKey, dbo.tblDimTime.TimeKey, sl.AccountKey,
	sl.BudgetScenarioKey, sl.BusinessUnitKey, sl.DepartmentKey,
	sl.FundCodeKey, sl.OperatingUnitKey, sl.ProjectKey,
	sl.SubProjectKey, sl.AFFILIATE, sl.AFFILIATE_INTRA1,
	sl.AmountTypeKey, dbo.DimDeptSite.[ID], sl.Amount AS [Value], 51 AS ValueKey
FROM         dbo.tblStagingLedger sl INNER JOIN
                      dbo.tblDimTime ON sl.FISCAL_YEAR = dbo.tblDimTime.YearKey LEFT OUTER JOIN
                      dbo.DimDeptSite ON sl.DepartmentKey = dbo.DimDeptSite.DeptID AND 
                      sl.OperatingUnitKey = dbo.DimDeptSite.SiteID
WHERE     (sl.ACCOUNTING_PERIOD = 0) AND (sl.AmountTypeKey = 1)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE    VIEW dbo.qryFactFinancialWithSeparateMeasures_Method_4A
	(FactFinancialKey, TimeKey, AccountKey,
	BudgetScenarioKey, BusinessUnitKey, DepartmentKey,
	FundCodeKey, OperatingUnitKey, ProjectKey,
	SubProjectKey, AFFILIATE, AFFILIATE_INTRA1,
	AmountTypeKey, DeptSiteKey, Value, ValueKey)
AS 
select 
FactFinancialKey,TimeKey,AccountKey,
	BudgetScenarioKey, BusinessUnitKey, DepartmentKey,
	FundCodeKey, OperatingUnitKey, ProjectKey,
	SubProjectKey, AFFILIATE, AFFILIATE_INTRA1,
	AmountTypeKey, DeptSiteKey, Value, ValueKey

from dbo.tblFact
where ValueKey in (3,4,5,6,7)

UNION 

SELECT     
	0 AS FactFinancialKey, dbo.tblDimTime.TimeKey, sl.AccountKey,
	sl.BudgetScenarioKey, sl.BusinessUnitKey, sl.DepartmentKey,
	sl.FundCodeKey, sl.OperatingUnitKey, sl.ProjectKey,
	sl.SubProjectKey, sl.AFFILIATE, sl.AFFILIATE_INTRA1,
	sl.AmountTypeKey, dbo.DimDeptSite.[ID], sl.Amount AS [Value], 51 AS ValueKey
FROM         dbo.tblStagingLedger sl INNER JOIN
                      dbo.tblDimTime ON sl.FISCAL_YEAR = dbo.tblDimTime.YearKey LEFT OUTER JOIN
                      dbo.DimDeptSite ON sl.DepartmentKey = dbo.DimDeptSite.DeptID AND 
                      sl.OperatingUnitKey = dbo.DimDeptSite.SiteID
WHERE     (sl.ACCOUNTING_PERIOD = 0) AND (sl.AmountTypeKey = 1)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryFact_BDGT
AS
SELECT     DeptSiteKey, FactFinancialKey, TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, FundCodeKey, OperatingUnitKey, 
                      ProjectKey, SubProjectKey, AFFILIATE, AFFILIATE_INTRA1, AmountTypeKey, [Value], ValueKey
FROM         dbo.tblFact
WHERE     (TimeKey >= 200401) AND (AccountKey IN
                          (SELECT     AccountKey
                            FROM          tblDimAccounts
                            WHERE      TypeCode IN ('E', 'R')))

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryFact_MOH
AS
SELECT     DeptSiteKey, FactFinancialKey, TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, FundCodeKey, OperatingUnitKey, 
                      ProjectKey, SubProjectKey, AFFILIATE, AFFILIATE_INTRA1, AmountTypeKey, [Value], ValueKey
FROM         dbo.tblFact
WHERE     (TimeKey >= 200401) /*AND (NOT (DepartmentKey IN
                          (SELECT     DepartmentKey
                            FROM          tblDimDepartments
                            WHERE      Code BETWEEN '90000000' AND '99999999')))*/
	and  --added 20060619
	(AccountKey in 
		(select AccountKey
			from tblDimAccounts
			where TypeCode in ('E', 'R')))






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.qryFact_MOH_20060531
AS
SELECT     DeptSiteKey, FactFinancialKey, TimeKey, AccountKey, BudgetScenarioKey, BusinessUnitKey, DepartmentKey, FundCodeKey, OperatingUnitKey, 
                      ProjectKey, SubProjectKey, AFFILIATE, AFFILIATE_INTRA1, AmountTypeKey, [Value], ValueKey
FROM         dbo.tblFact
WHERE     (TimeKey >= 200401)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE  VIEW dbo.qry_Cube_Validation_PeopleSoft
AS
SELECT     dbo.Results_PeopleSoft.BU AS BU_PS, dbo.Results.BU AS BU_Cube, dbo.Results.Fund AS Fund_Cube, dbo.Results_PeopleSoft.Fund AS Fund_PS, 
                      dbo.Results.[Time] AS Time_Cube, dbo.Results_PeopleSoft.[Time] AS Time_PS, dbo.Results.[YTD Bud] AS Value_Cube, 
                      dbo.Results_PeopleSoft.[Value] AS Value_PS, dbo.Results_PeopleSoft.ValueType
FROM         dbo.Results INNER JOIN
                      dbo.Results_PeopleSoft ON LEFT(dbo.Results.BU, 5) = dbo.Results_PeopleSoft.BU AND 
                      dbo.Results.[Time] = 'P' + RIGHT(RTRIM(dbo.Results_PeopleSoft.[Time]), 2) + '-' + SUBSTRING(dbo.Results_PeopleSoft.[Time], 3, 2) AND 
                      LEFT(dbo.Results.Fund, 2) = dbo.Results_PeopleSoft.Fund
WHERE     (dbo.Results_PeopleSoft.ValueType = 'YTD Bud')
UNION
SELECT     dbo.Results_PeopleSoft.BU AS BU_PS, dbo.Results.BU AS BU_Cube, dbo.Results.Fund AS Fund_Cube, dbo.Results_PeopleSoft.Fund AS Fund_PS, 
                      dbo.Results.[Time] AS Time_Cube, dbo.Results_PeopleSoft.[Time] AS Time_PS, dbo.Results.[YTD Act] AS Value_Cube, 
                      dbo.Results_PeopleSoft.[Value] AS Value_PS, dbo.Results_PeopleSoft.ValueType
FROM         dbo.Results INNER JOIN
                      dbo.Results_PeopleSoft ON LEFT(dbo.Results.BU, 5) = dbo.Results_PeopleSoft.BU AND 
                      dbo.Results.[Time] = 'P' + RIGHT(RTRIM(dbo.Results_PeopleSoft.[Time]), 2) + '-' + SUBSTRING(dbo.Results_PeopleSoft.[Time], 3, 2) AND 
                      LEFT(dbo.Results.Fund, 2) = dbo.Results_PeopleSoft.Fund
WHERE     (dbo.Results_PeopleSoft.ValueType = 'YTD Act')
/*--AJ 20051005 TO USE validation time filters
	and (dbo.Results_PeopleSoft.[Time] <= CONVERT(smallint, dbo.fnsAppSetting('FilterForFiscalYearForValidation'))*100 +
		CONVERT(smallint, dbo.fnsAppSetting('FilterForPeriodForValidation')))*/
UNION
SELECT     dbo.Results_PeopleSoft.BU AS BU_PS, dbo.Results.BU AS BU_Cube, dbo.Results.Fund AS Fund_Cube, dbo.Results_PeopleSoft.Fund AS Fund_PS, 
                      dbo.Results.[Time] AS Time_Cube, dbo.Results_PeopleSoft.[Time] AS Time_PS, dbo.Results.[Annual Bud] AS Value_Cube, 
                      dbo.Results_PeopleSoft.[Value] AS Value_PS, dbo.Results_PeopleSoft.ValueType
FROM         dbo.Results INNER JOIN
                      dbo.Results_PeopleSoft ON LEFT(dbo.Results.BU, 5) = dbo.Results_PeopleSoft.BU AND 
                      dbo.Results.[Time] = 'P' + RIGHT(RTRIM(dbo.Results_PeopleSoft.[Time]), 2) + '-' + SUBSTRING(dbo.Results_PeopleSoft.[Time], 3, 2) AND 
                      LEFT(dbo.Results.Fund, 2) = dbo.Results_PeopleSoft.Fund
WHERE     (dbo.Results_PeopleSoft.ValueType = 'Annual Bud')



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.qry_Cube_Validation_PeopleSoft_20051005
AS
SELECT     dbo.Results_PeopleSoft.BU AS BU_PS, dbo.Results.BU AS BU_Cube, dbo.Results.Fund AS Fund_Cube, dbo.Results_PeopleSoft.Fund AS Fund_PS, 
                      dbo.Results.[Time] AS Time_Cube, dbo.Results_PeopleSoft.[Time] AS Time_PS, dbo.Results.[YTD Bud] AS Value_Cube, 
                      dbo.Results_PeopleSoft.[Value] AS Value_PS, dbo.Results_PeopleSoft.ValueType
FROM         dbo.Results INNER JOIN
                      dbo.Results_PeopleSoft ON LEFT(dbo.Results.BU, 5) = dbo.Results_PeopleSoft.BU AND 
                      dbo.Results.[Time] = 'P' + RIGHT(RTRIM(dbo.Results_PeopleSoft.[Time]), 2) + '-' + SUBSTRING(dbo.Results_PeopleSoft.[Time], 3, 2) AND 
                      LEFT(dbo.Results.Fund, 2) = dbo.Results_PeopleSoft.Fund
WHERE     (dbo.Results_PeopleSoft.ValueType = 'YTD Bud')
UNION
SELECT     dbo.Results_PeopleSoft.BU AS BU_PS, dbo.Results.BU AS BU_Cube, dbo.Results.Fund AS Fund_Cube, dbo.Results_PeopleSoft.Fund AS Fund_PS, 
                      dbo.Results.[Time] AS Time_Cube, dbo.Results_PeopleSoft.[Time] AS Time_PS, dbo.Results.[YTD Act] AS Value_Cube, 
                      dbo.Results_PeopleSoft.[Value] AS Value_PS, dbo.Results_PeopleSoft.ValueType
FROM         dbo.Results INNER JOIN
                      dbo.Results_PeopleSoft ON LEFT(dbo.Results.BU, 5) = dbo.Results_PeopleSoft.BU AND 
                      dbo.Results.[Time] = 'P' + RIGHT(RTRIM(dbo.Results_PeopleSoft.[Time]), 2) + '-' + SUBSTRING(dbo.Results_PeopleSoft.[Time], 3, 2) AND 
                      LEFT(dbo.Results.Fund, 2) = dbo.Results_PeopleSoft.Fund
WHERE     (dbo.Results_PeopleSoft.ValueType = 'YTD Act')
UNION
SELECT     dbo.Results_PeopleSoft.BU AS BU_PS, dbo.Results.BU AS BU_Cube, dbo.Results.Fund AS Fund_Cube, dbo.Results_PeopleSoft.Fund AS Fund_PS, 
                      dbo.Results.[Time] AS Time_Cube, dbo.Results_PeopleSoft.[Time] AS Time_PS, dbo.Results.[Annual Bud] AS Value_Cube, 
                      dbo.Results_PeopleSoft.[Value] AS Value_PS, dbo.Results_PeopleSoft.ValueType
FROM         dbo.Results INNER JOIN
                      dbo.Results_PeopleSoft ON LEFT(dbo.Results.BU, 5) = dbo.Results_PeopleSoft.BU AND 
                      dbo.Results.[Time] = 'P' + RIGHT(RTRIM(dbo.Results_PeopleSoft.[Time]), 2) + '-' + SUBSTRING(dbo.Results_PeopleSoft.[Time], 3, 2) AND 
                      LEFT(dbo.Results.Fund, 2) = dbo.Results_PeopleSoft.Fund
WHERE     (dbo.Results_PeopleSoft.ValueType = 'Annual Bud')


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_Cube_Validation_Publishing
AS
SELECT     TOP 100 PERCENT dbo.Results.BU, dbo.Results.Fund, dbo.Results.[Time], ROUND(dbo.Results.[Annual Bud] - dbo.Results_Published.[Annual Bud], 0) 
                      AS [Annual Bud Variance], ROUND(dbo.Results.[YTD Act] - dbo.Results_Published.[YTD Act], 0) AS [YTD Act Variance], 
                      ROUND(dbo.Results.[YTD Bud] - dbo.Results_Published.[YTD Bud], 0) AS [YTD Bud Variance]
FROM         dbo.Results INNER JOIN
                      dbo.Results_Published ON dbo.Results.BU = dbo.Results_Published.BU AND dbo.Results.Fund = dbo.Results_Published.Fund AND 
                      dbo.Results.[Time] = dbo.Results_Published.[Time]
ORDER BY dbo.Results.BU, dbo.Results.Fund, dbo.Results.[Time]

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_DeptSite_Diagnostic_Imaging
AS
SELECT     dbo.DimDeptSite.ID, 0 AS ParentID, dbo.DimDeptSite.SortOrder, dbo.DimDeptSite.Descr, dbo.DimDeptSite.DeptID, dbo.DimDeptSite.SiteID, 
                      dbo.DimDeptSite.DeptCode, dbo.DimDeptSite.SiteCode
FROM         dbo.DimDeptSite_DiagnosticImaging INNER JOIN
                      dbo.DimDeptSite ON dbo.DimDeptSite_DiagnosticImaging.DeptCode = dbo.DimDeptSite.DeptCode AND 
                      dbo.DimDeptSite_DiagnosticImaging.SiteCode = dbo.DimDeptSite.SiteCode

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_Fact_Diagnostic_Imaging
AS
SELECT     dbo.tblFact.*, CAST(RIGHT(TimeKey, 2) AS Int) AS PeriodKey
FROM         dbo.tblFact

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_Fact_LabEnterprise
AS
SELECT     dbo.tblFact.*, CAST(RIGHT(TimeKey, 2) AS Int) AS PeriodKey
FROM         dbo.tblFact

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_hw_Accounts_CWOnly
AS
SELECT     TOP 100 PERCENT dbo.tblFact.AccountKey, dbo.tblDimAccounts_PH_ACCOUNT_TreeView.Code, 
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView.FullDescr, dbo.tblFact.BusinessUnitKey, dbo.tblFact.ValueKey
FROM         dbo.tblFact INNER JOIN
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView ON dbo.tblFact.AccountKey = dbo.tblDimAccounts_PH_ACCOUNT_TreeView.AccountKey
WHERE     (dbo.tblFact.OperatingUnitKey = 3) OR
                      (dbo.tblFact.OperatingUnitKey = 4)
GROUP BY dbo.tblFact.AccountKey, dbo.tblDimAccounts_PH_ACCOUNT_TreeView.Code, dbo.tblDimAccounts_PH_ACCOUNT_TreeView.FullDescr, 
                      dbo.tblFact.BusinessUnitKey, dbo.tblFact.ValueKey
HAVING      (dbo.tblFact.BusinessUnitKey = 2) AND (dbo.tblFact.ValueKey = 3)
ORDER BY dbo.tblDimAccounts_PH_ACCOUNT_TreeView.Code

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_hw_Department_LeafNodes
AS
SELECT     TOP 100 PERCENT DepartmentKey, Code, Descr, FullDescr, SortOrder, DescrShort, FullDescrShort
FROM         dbo.tblDimDepartments_PH_DEPARTMENT_TreeView
WHERE     (RTRIM(Code) <> '')
ORDER BY Code

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_hw_DeptList_ByBusinessUnit
AS
SELECT     TOP 100 PERCENT dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.Code AS DeptCode, 
                      dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.FullDescr AS DeptDescr, dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.BusinessUnitKey, 
                      dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.Descr AS BU, dbo.tblDimOperatingUnits_PH_SITE_TreeView.Code, 
                      dbo.tblDimOperatingUnits_PH_SITE_TreeView.Descr
FROM         dbo.tblFact INNER JOIN
                      dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView ON 
                      dbo.tblFact.BusinessUnitKey = dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.BusinessUnitKey INNER JOIN
                      dbo.tblDimDepartments_PH_DEPARTMENT_TreeView ON 
                      dbo.tblFact.DepartmentKey = dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.DepartmentKey INNER JOIN
                      dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes ON 
                      dbo.tblFact.FundCodeKey = dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.FundCodeKey INNER JOIN
                      dbo.tblDimOperatingUnits_PH_SITE_TreeView ON 
                      dbo.tblFact.OperatingUnitKey = dbo.tblDimOperatingUnits_PH_SITE_TreeView.OperatingUnitKey
WHERE     (dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.Code = '01')
GROUP BY dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.BusinessUnitKey, dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.Descr, 
                      dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.Code, dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.FullDescr, 
                      dbo.tblDimOperatingUnits_PH_SITE_TreeView.Code, dbo.tblDimOperatingUnits_PH_SITE_TreeView.Descr
ORDER BY dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.Code, dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.BusinessUnitKey, 
                      dbo.tblDimOperatingUnits_PH_SITE_TreeView.Code

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_hw_DeptSiteList_ByBusinessUnit
AS
SELECT     TOP 100 PERCENT dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.Code AS FundCode, 
                      dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.Descr AS FundDescr, 
                      dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.BusinessUnitKey, dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.Descr AS BU, 
                      dbo.DimDeptSite.DeptCode, dbo.DimDeptSite.SiteCode, dbo.DimDeptSite.Descr
FROM         dbo.tblFact INNER JOIN
                      dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView ON 
                      dbo.tblFact.BusinessUnitKey = dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.BusinessUnitKey INNER JOIN
                      dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes ON 
                      dbo.tblFact.FundCodeKey = dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.FundCodeKey INNER JOIN
                      dbo.DimDeptSite ON dbo.tblFact.DeptSiteKey = dbo.DimDeptSite.ID
GROUP BY dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.BusinessUnitKey, dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.Descr, 
                      dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.Code, dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.Descr, 
                      dbo.DimDeptSite.DeptCode, dbo.DimDeptSite.SiteCode, dbo.DimDeptSite.Descr
HAVING      (dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.BusinessUnitKey = 5)
ORDER BY dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.Code, dbo.DimDeptSite.DeptCode, dbo.DimDeptSite.SiteCode

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_hw_DeptSite_CWOnly
AS
SELECT     TOP 100 PERCENT dbo.tblFact.DeptSiteKey, dbo.DimDeptSite.Descr, dbo.tblFact.BusinessUnitKey, dbo.tblFact.ValueKey
FROM         dbo.tblFact INNER JOIN
                      dbo.DimDeptSite ON dbo.tblFact.DeptSiteKey = dbo.DimDeptSite.ID
WHERE     (dbo.tblFact.OperatingUnitKey = 3) OR
                      (dbo.tblFact.OperatingUnitKey = 4)
GROUP BY dbo.tblFact.BusinessUnitKey, dbo.tblFact.ValueKey, dbo.tblFact.DeptSiteKey, dbo.DimDeptSite.Descr
HAVING      (dbo.tblFact.BusinessUnitKey = 2) AND (dbo.tblFact.ValueKey = 3)
ORDER BY dbo.DimDeptSite.Descr

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_hw_Dept_DeptSite_Crossmatch_AS
AS
SELECT     dbo.qry_hw_DimDepartments_AS_List.DepartmentKey AS DeptID_D, dbo.qry_hw_DimDepartments_AS_List.DepartmentCode AS DeptCode_D, 
                      dbo.qry_hw_DimDepartments_AS_List.Descr AS DeptDesc_D, dbo.qry_hw_DimDeptSite_AS_List.DeptID AS DeptID_DS, 
                      dbo.qry_hw_DimDeptSite_AS_List.DepartmentCode AS DeptCode_DS
FROM         dbo.qry_hw_DimDeptSite_AS_List FULL OUTER JOIN
                      dbo.qry_hw_DimDepartments_AS_List ON 
                      dbo.qry_hw_DimDeptSite_AS_List.DepartmentCode = dbo.qry_hw_DimDepartments_AS_List.DepartmentCode
WHERE     (dbo.qry_hw_DimDepartments_AS_List.DepartmentKey IS NULL) OR
                      (dbo.qry_hw_DimDeptSite_AS_List.DeptID IS NULL)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_hw_DimDeptSite_CWOnly
AS
SELECT     TOP 100 PERCENT ID, ParentID, SortOrder, Descr, DeptID, SiteID, DeptCode, SiteCode
FROM         dbo.DimDeptSite
WHERE     (ID IN
                          (SELECT     DeptSiteKey
                            FROM          qry_hw_DeptSite_CWOnly)) OR
                      (DeptID IS NULL) AND (SiteID IS NULL)
ORDER BY ID

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_hw_Dim_DeptSite_Department_Crossmatch_AS_ONLY
AS
SELECT     TOP 100 PERCENT dbo.qry_hw_Dim_Department_AS_ONLY.DepartmentKey, dbo.qry_hw_Dim_Department_AS_ONLY.DeptCode, 
                      dbo.qry_hw_Dim_Department_AS_ONLY.Descr, dbo.qry_hw_DimDeptSite_AS_ONLY.DeptCode AS DeptCode_DS
FROM         dbo.qry_hw_Dim_Department_AS_ONLY FULL OUTER JOIN
                      dbo.qry_hw_DimDeptSite_AS_ONLY ON dbo.qry_hw_Dim_Department_AS_ONLY.DeptCode = dbo.qry_hw_DimDeptSite_AS_ONLY.DeptCode
ORDER BY dbo.qry_hw_DimDeptSite_AS_ONLY.DeptCode, dbo.qry_hw_Dim_Department_AS_ONLY.DepartmentKey

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create view vw_Fact_2005
as 
select *
from tblLastTwoYear
union
select *
from tblForecastFact


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryAJ_MedFTE_Annual_Bud
AS
SELECT     dbo.tblFactFinancial.FactFinancialKey, SUM(dbo.tblFactFinancialMeasures.BaseBudget) / SUM(dbo.tblStagingAlternateStatisticalFactors.MedicalFactor) 
                      AS FTE,  tblFactFinancialMeasures.YearKey AS [year] --LEFT(tblFactFinancialMeasures.TimeKey, 4) AS [year]
FROM         dbo.tblFactFinancialMeasures INNER JOIN
                      dbo.tblFactFinancial ON dbo.tblFactFinancialMeasures.FactFinancialKey = dbo.tblFactFinancial.FactFinancialKey INNER JOIN
                      dbo.tblDimAccounts ON dbo.tblFactFinancial.AccountKey = dbo.tblDimAccounts.AccountKey INNER JOIN
                      dbo.tblStagingAlternateStatisticalFactors ON dbo.tblFactFinancialMeasures.TimeKey = dbo.tblStagingAlternateStatisticalFactors.TimeKey
WHERE     (dbo.tblDimAccounts.Code BETWEEN '3900000' AND '3999999') AND 
                      (dbo.tblFactFinancialMeasures.TimeKey BETWEEN --convert(int, left(tblFactFinancialMeasures.TimeKey,4))*100 + 1 AND convert(int, left(tblFactFinancialMeasures.TimeKey,4))*100 + 13) 
                      tblFactFinancialMeasures.TimeKeyFirst AND tblFactFinancialMeasures.TimeKeyLast) AND 
                      (dbo.tblFactFinancial.AmountTypeKey = 3)
GROUP BY dbo.tblFactFinancial.FactFinancialKey, tblFactFinancialMeasures.YearKey--LEFT(tblFactFinancialMeasures.TimeKey, 4) 


/*2004-11-26
SELECT     dbo.tblFactFinancial.FactFinancialKey, SUM(dbo.tblFactFinancialMeasures.BaseBudget) / SUM(dbo.tblStagingAlternateStatisticalFactors.MedicalFactor) 
                      AS FTE, LEFT(tblFactFinancialMeasures.TimeKey, 4) AS [year]
FROM         dbo.tblFactFinancialMeasures INNER JOIN
                      dbo.tblFactFinancial ON dbo.tblFactFinancialMeasures.FactFinancialKey = dbo.tblFactFinancial.FactFinancialKey INNER JOIN
                      dbo.tblDimAccounts ON dbo.tblFactFinancial.AccountKey = dbo.tblDimAccounts.AccountKey INNER JOIN
                      dbo.tblStagingAlternateStatisticalFactors ON dbo.tblFactFinancialMeasures.TimeKey = dbo.tblStagingAlternateStatisticalFactors.TimeKey
WHERE     (dbo.tblDimAccounts.Code BETWEEN '3900000' AND '3999999') AND 
                      (dbo.tblFactFinancialMeasures.TimeKey BETWEEN convert(int, left(tblFactFinancialMeasures.TimeKey,4))*100 + 1 AND convert(int, left(tblFactFinancialMeasures.TimeKey,4))*100 + 13) AND 
                      (dbo.tblFactFinancial.AmountTypeKey = 3)
GROUP BY dbo.tblFactFinancial.FactFinancialKey, LEFT(tblFactFinancialMeasures.TimeKey, 4) 
*/

/* 2004-08-05
SELECT     dbo.tblFactFinancial.FactFinancialKey, SUM(dbo.tblFactFinancialMeasures.BaseBudget) / SUM(dbo.tblStagingAlternateStatisticalFactors.MedicalFactor) 
                      AS FTE
FROM         dbo.tblFactFinancialMeasures INNER JOIN
                      dbo.tblFactFinancial ON dbo.tblFactFinancialMeasures.FactFinancialKey = dbo.tblFactFinancial.FactFinancialKey INNER JOIN
                      dbo.tblDimAccounts ON dbo.tblFactFinancial.AccountKey = dbo.tblDimAccounts.AccountKey INNER JOIN
                      dbo.tblStagingAlternateStatisticalFactors ON dbo.tblFactFinancialMeasures.TimeKey = dbo.tblStagingAlternateStatisticalFactors.TimeKey
WHERE     (dbo.tblDimAccounts.Code BETWEEN '3900000' AND '3999999') AND (dbo.tblFactFinancialMeasures.TimeKey BETWEEN convert(int, dbo.fnsAppSetting('FilterForFiscalYearUpToAndIncluding'))*100 + 1 
         		AND convert(int, dbo.fnsAppSetting('FilterForFiscalYearUpToAndIncluding'))*100 + 13) AND 
                      (dbo.tblFactFinancial.AmountTypeKey = 3)
GROUP BY dbo.tblFactFinancial.FactFinancialKey
*/



/* old code (20040727)
SELECT     dbo.tblFactFinancial.FactFinancialKey, SUM(dbo.tblFactFinancialMeasures.BaseBudget) / SUM(dbo.tblStagingAlternateStatisticalFactors.MedicalFactor) 
                      AS FTE
FROM         dbo.tblFactFinancialMeasures INNER JOIN
                      dbo.tblFactFinancial ON dbo.tblFactFinancialMeasures.FactFinancialKey = dbo.tblFactFinancial.FactFinancialKey INNER JOIN
                      dbo.tblDimAccounts ON dbo.tblFactFinancial.AccountKey = dbo.tblDimAccounts.AccountKey INNER JOIN
                      dbo.tblStagingAlternateStatisticalFactors ON dbo.tblFactFinancialMeasures.TimeKey = dbo.tblStagingAlternateStatisticalFactors.TimeKey
WHERE     (dbo.tblDimAccounts.Code BETWEEN '3900000' AND '3999999') AND (dbo.tblFactFinancialMeasures.TimeKey BETWEEN 200401 AND 200413) AND 
                      (dbo.tblFactFinancial.AmountTypeKey = 3)
GROUP BY dbo.tblFactFinancial.FactFinancialKey
*/





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.qryAJ_MedFTE_Annual_Bud_Frozen
AS
SELECT     f.FactFinancialKey, SUM(m.BaseBudget) / SUM(dbo.tblStagingAlternateStatisticalFactors.MedicalFactor) 
                      AS FTE,  m.YearKey AS [year] 
FROM         dbo.tblFactFinancialMeasuresFrozen m INNER JOIN
                      dbo.tblFactFinancialFrozen f ON m.FactFinancialKey = f.FactFinancialKey INNER JOIN
                      dbo.tblDimAccounts ON f.AccountKey = dbo.tblDimAccounts.AccountKey INNER JOIN
                      dbo.tblStagingAlternateStatisticalFactors ON m.TimeKey = dbo.tblStagingAlternateStatisticalFactors.TimeKey
WHERE     (dbo.tblDimAccounts.Code BETWEEN '3900000' AND '3999999') AND 
                      (m.TimeKey BETWEEN 
                      m.TimeKeyFirst AND m.TimeKeyLast) AND 
                      (f.AmountTypeKey = 3)
GROUP BY f.FactFinancialKey, m.YearKey






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryAJ_OtherFTE_Annual_Bud
AS
SELECT     dbo.tblFactFinancial.FactFinancialKey, SUM(dbo.tblFactFinancialMeasures.BaseBudget) / SUM(dbo.tblStagingAlternateStatisticalFactors.OtherFactor) 
                      AS FTE, tblFactFinancialMeasures.YearKey AS [year] --LEFT(tblFactFinancialMeasures.TimeKey, 4)  as [year]
FROM         dbo.tblFactFinancialMeasures INNER JOIN
                      dbo.tblFactFinancial ON dbo.tblFactFinancialMeasures.FactFinancialKey = dbo.tblFactFinancial.FactFinancialKey INNER JOIN
                      dbo.tblDimAccounts ON dbo.tblFactFinancial.AccountKey = dbo.tblDimAccounts.AccountKey INNER JOIN
                      dbo.tblStagingAlternateStatisticalFactors ON dbo.tblFactFinancialMeasures.TimeKey = dbo.tblStagingAlternateStatisticalFactors.TimeKey
WHERE     (NOT (dbo.tblDimAccounts.Code BETWEEN '3900000' AND '3999999')) AND 
                      (dbo.tblFactFinancialMeasures.TimeKey BETWEEN --convert(int, left(tblFactFinancialMeasures.TimeKey,4))*100 + 1 
         		--AND convert(int, left(tblFactFinancialMeasures.TimeKey,4))*100 + 13) 
                      tblFactFinancialMeasures.TimeKeyFirst AND tblFactFinancialMeasures.TimeKeyLast)
                      AND (dbo.tblFactFinancial.AmountTypeKey = 3)
GROUP BY dbo.tblFactFinancial.FactFinancialKey, tblFactFinancialMeasures.YearKey --LEFT(tblFactFinancialMeasures.TimeKey, 4) 

/*2004-11-26
SELECT     dbo.tblFactFinancial.FactFinancialKey, SUM(dbo.tblFactFinancialMeasures.BaseBudget) / SUM(dbo.tblStagingAlternateStatisticalFactors.OtherFactor) 
                      AS FTE, LEFT(tblFactFinancialMeasures.TimeKey, 4)  as [year]
FROM         dbo.tblFactFinancialMeasures INNER JOIN
                      dbo.tblFactFinancial ON dbo.tblFactFinancialMeasures.FactFinancialKey = dbo.tblFactFinancial.FactFinancialKey INNER JOIN
                      dbo.tblDimAccounts ON dbo.tblFactFinancial.AccountKey = dbo.tblDimAccounts.AccountKey INNER JOIN
                      dbo.tblStagingAlternateStatisticalFactors ON dbo.tblFactFinancialMeasures.TimeKey = dbo.tblStagingAlternateStatisticalFactors.TimeKey
WHERE     (NOT (dbo.tblDimAccounts.Code BETWEEN '3900000' AND '3999999')) AND 
                      (dbo.tblFactFinancialMeasures.TimeKey BETWEEN convert(int, left(tblFactFinancialMeasures.TimeKey,4))*100 + 1 
         		AND convert(int, left(tblFactFinancialMeasures.TimeKey,4))*100 + 13) 
                      AND (dbo.tblFactFinancial.AmountTypeKey = 3)
GROUP BY dbo.tblFactFinancial.FactFinancialKey, LEFT(tblFactFinancialMeasures.TimeKey, 4) 
*/
/*2004-08-06
SELECT     dbo.tblFactFinancial.FactFinancialKey, SUM(dbo.tblFactFinancialMeasures.BaseBudget) / SUM(dbo.tblStagingAlternateStatisticalFactors.OtherFactor) 
                      AS FTE
FROM         dbo.tblFactFinancialMeasures INNER JOIN
                      dbo.tblFactFinancial ON dbo.tblFactFinancialMeasures.FactFinancialKey = dbo.tblFactFinancial.FactFinancialKey INNER JOIN
                      dbo.tblDimAccounts ON dbo.tblFactFinancial.AccountKey = dbo.tblDimAccounts.AccountKey INNER JOIN
                      dbo.tblStagingAlternateStatisticalFactors ON dbo.tblFactFinancialMeasures.TimeKey = dbo.tblStagingAlternateStatisticalFactors.TimeKey
WHERE     (NOT (dbo.tblDimAccounts.Code BETWEEN '3900000' AND '3999999')) AND 
                      (dbo.tblFactFinancialMeasures.TimeKey BETWEEN convert(int, dbo.fnsAppSetting('FilterForFiscalYearUpToAndIncluding'))*100 + 1 AND 
                      convert(int, dbo.fnsAppSetting('FilterForFiscalYearUpToAndIncluding'))*100 + 13) 
                      AND (dbo.tblFactFinancial.AmountTypeKey = 3)
GROUP BY dbo.tblFactFinancial.FactFinancialKey
*/


/* old code 20040727

SELECT     dbo.tblFactFinancial.FactFinancialKey, SUM(dbo.tblFactFinancialMeasures.BaseBudget) / SUM(dbo.tblStagingAlternateStatisticalFactors.OtherFactor) 
                      AS FTE
FROM         dbo.tblFactFinancialMeasures INNER JOIN
                      dbo.tblFactFinancial ON dbo.tblFactFinancialMeasures.FactFinancialKey = dbo.tblFactFinancial.FactFinancialKey INNER JOIN
                      dbo.tblDimAccounts ON dbo.tblFactFinancial.AccountKey = dbo.tblDimAccounts.AccountKey INNER JOIN
                      dbo.tblStagingAlternateStatisticalFactors ON dbo.tblFactFinancialMeasures.TimeKey = dbo.tblStagingAlternateStatisticalFactors.TimeKey
WHERE     (NOT (dbo.tblDimAccounts.Code BETWEEN '3900000' AND '3999999')) AND (dbo.tblFactFinancialMeasures.TimeKey BETWEEN 200401 AND 200413) 
                      AND (dbo.tblFactFinancial.AmountTypeKey = 3)
GROUP BY dbo.tblFactFinancial.FactFinancialKey
*/




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.qryAJ_OtherFTE_Annual_Bud_Frozen
AS
SELECT     f.FactFinancialKey, SUM(m.BaseBudget) / SUM(dbo.tblStagingAlternateStatisticalFactors.OtherFactor) 
                      AS FTE, m.YearKey AS [year] 
FROM         dbo.tblFactFinancialMeasuresFrozen m INNER JOIN
                      dbo.tblFactFinancialFrozen f ON m.FactFinancialKey = f.FactFinancialKey INNER JOIN
                      dbo.tblDimAccounts ON f.AccountKey = dbo.tblDimAccounts.AccountKey INNER JOIN
                      dbo.tblStagingAlternateStatisticalFactors ON m.TimeKey = dbo.tblStagingAlternateStatisticalFactors.TimeKey
WHERE     (NOT (dbo.tblDimAccounts.Code BETWEEN '3900000' AND '3999999')) AND 
                      (m.TimeKey BETWEEN 
                      m.TimeKeyFirst AND m.TimeKeyLast)
                      AND (f.AmountTypeKey = 3)
GROUP BY f.FactFinancialKey, m.YearKey 


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.[qryDimBusinessUnits_CT_BUS_UNIT_TreeView_aj]
	(BusinessUnitKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [EliminationsOnly])
AS 
SELECT 
	tn.TREE_NODE_NUM, tn.PARENT_NODE_NUM, tn.TREE_NODE, tn.TREE_NODE, tn.TREE_NODE, tn.SortOrder, NULL, NULL, ('N')
FROM dbo.tblStagingCustomTreeNodes tn
WHERE 
     tn.TREE_NAME = 'CT_BUS_UNIT'
UNION
SELECT 
	BusinessUnitKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [EliminationsOnly]
FROM qryDimBusinessUnits_CT_BUS_UNIT_LeafNodes_aj sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [EliminationsOnly]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'CT_BUS_UNIT'



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimDepartments_PH_DEPARTMENT_RPT_TreeView]
	(DepartmentKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_DEPARTMENT_RPT'
UNION
SELECT 
	DepartmentKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM qryDimDepartments_PH_DEPARTMENT_RPT_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_DEPARTMENT_RPT'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimDepartments_PH_DEPT_BCCHF_TreeView]
	(DepartmentKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_DEPT_BCCHF'
UNION
SELECT 
	DepartmentKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM qryDimDepartments_PH_DEPT_BCCHF_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_DEPT_BCCHF'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimDepartments_PH_DEPT_FOUNDTN_TreeView]
	(DepartmentKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_DEPT_FOUNDTN'
UNION
SELECT 
	DepartmentKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM qryDimDepartments_PH_DEPT_FOUNDTN_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_DEPT_FOUNDTN'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_GL_CIP_PROJECTS_TreeView]
	(ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_GL_CIP_PROJECTS'
UNION
SELECT 
	ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM qryDimProjects_PH_GL_CIP_PROJECTS_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_GL_CIP_PROJECTS'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_BCCHF_TreeView]
	(ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_PROJECT_BCCHF'
UNION
SELECT 
	ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM qryDimProjects_PH_PROJECT_BCCHF_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_PROJECT_BCCHF'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_BCRI2_TreeView]
	(ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_PROJECT_BCRI2'
UNION
SELECT 
	ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM qryDimProjects_PH_PROJECT_BCRI2_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_PROJECT_BCRI2'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_BCRI_TreeView]
	(ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_PROJECT_BCRI'
UNION
SELECT 
	ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM qryDimProjects_PH_PROJECT_BCRI_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_PROJECT_BCRI'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_CAPITAL_TreeView]
	(ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_PROJECT_CAPITAL'
UNION
SELECT 
	ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM qryDimProjects_PH_PROJECT_CAPITAL_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_PROJECT_CAPITAL'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_CATEG_TreeView]
	(ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_PROJECT_CATEG'
UNION
SELECT 
	ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM qryDimProjects_PH_PROJECT_CATEG_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_PROJECT_CATEG'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_CW_TreeView]
	(ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_PROJECT_CW'
UNION
SELECT 
	ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM qryDimProjects_PH_PROJECT_CW_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_PROJECT_CW'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_TEMP_TreeView]
	(ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_PROJECT_TEMP'
UNION
SELECT 
	ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM qryDimProjects_PH_PROJECT_TEMP_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_PROJECT_TEMP'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_TreeView]
	(ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_PROJECT'
UNION
SELECT 
	ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM qryDimProjects_PH_PROJECT_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_PROJECT'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimSubProjects_PH_GL_CIP_SUBPROJ_TreeView]
	(SubProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_GL_CIP_SUBPROJ'
UNION
SELECT 
	SubProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM qryDimSubProjects_PH_GL_CIP_SUBPROJ_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_GL_CIP_SUBPROJ'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.qryFactActual
AS
SELECT     *
FROM         dbo.qryFactFinancial
WHERE     (Actual IS NOT NULL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.qryFactBudget
AS
SELECT     *
FROM         dbo.qryFactFinancial
WHERE     (Budget IS NOT NULL)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryFactFinancialValues_0102andUp
AS
SELECT     dbo.qryFactFinancialWithSeparateMeasures_Method_4A.FactFinancialKey, dbo.tblDimAccounts_PH_ACCOUNT_TreeView.Code AS AcctCode, 
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView.FullDescr AS AcctDescr, dbo.tblDimAccounts_PH_ACCOUNT_TreeView.TypeCode AS AcctTypeCode, 
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView.Type AS AcctType, dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.Code AS DeptCode, 
                      dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.FullDescr AS DeptDescr, dbo.tblDimOperatingUnits_PH_SITE_TreeView.Code AS SiteCode, 
                      dbo.tblDimOperatingUnits_PH_SITE_TreeView.FullDescr AS SiteDescr, dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.Code AS BUCode, 
                      dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.FullDescr AS BUDescr, 
                      dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.Code AS FundCode, 
                      dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.FullDescr AS FundDescr, dbo.tblDimTime.TimeKey, dbo.tblDimTime.YearKey, 
                      dbo.tblDimTime.YearDescr, dbo.tblDimTime.PeriodKey, dbo.tblDimTime.PeriodDescr, dbo.tblDimTime.StartDate, dbo.tblDimTime.EndDate, 
                      dbo.tblDimProjects_PH_PROJECT_TreeView.Code AS ProjCode, dbo.tblDimProjects_PH_PROJECT_TreeView.FullDescr AS ProjDescr, 
                      dbo.tblDimSubProjects_PH_SUBPROJECT_TreeView.Code AS SubProjCode, 
                      dbo.tblDimSubProjects_PH_SUBPROJECT_TreeView.FullDescr AS SubProjDescr, dbo.tblDimValues_CalculatedMeasures.Code AS ValueCode, 
                      dbo.tblDimValues_CalculatedMeasures.Descr AS ValueDescr, dbo.tblDimValues_CalculatedMeasures.ValueKey, 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.[Value], dbo.qryFactFinancialWithSeparateMeasures_Method_4A.AmountTypeKey, 
                      dbo.tblDimAmountTypes.Descr AS AmountTypeDesc
FROM         dbo.qryFactFinancialWithSeparateMeasures_Method_4A INNER JOIN
                      dbo.tblDimTime ON dbo.qryFactFinancialWithSeparateMeasures_Method_4A.TimeKey = dbo.tblDimTime.TimeKey INNER JOIN
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.AccountKey = dbo.tblDimAccounts_PH_ACCOUNT_TreeView.AccountKey INNER JOIN
                      dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.BusinessUnitKey = dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.BusinessUnitKey INNER
                       JOIN
                      dbo.tblDimDepartments_PH_DEPARTMENT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.DepartmentKey = dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.DepartmentKey INNER
                       JOIN
                      dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.FundCodeKey = dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.FundCodeKey
                       INNER JOIN
                      dbo.tblDimOperatingUnits_PH_SITE_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.OperatingUnitKey = dbo.tblDimOperatingUnits_PH_SITE_TreeView.OperatingUnitKey INNER JOIN
                      dbo.tblDimProjects_PH_PROJECT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.ProjectKey = dbo.tblDimProjects_PH_PROJECT_TreeView.ProjectKey INNER JOIN
                      dbo.tblDimSubProjects_PH_SUBPROJECT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.SubProjectKey = dbo.tblDimSubProjects_PH_SUBPROJECT_TreeView.SubProjectKey INNER JOIN
                      dbo.tblDimValues_CalculatedMeasures ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.ValueKey = dbo.tblDimValues_CalculatedMeasures.ValueKey INNER JOIN
                      dbo.tblDimAmountTypes ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.AmountTypeKey = dbo.tblDimAmountTypes.AmountTypeKey
WHERE     (dbo.tblDimTime.TimeKey >= 200201) AND (dbo.tblDimValues_CalculatedMeasures.ValueKey >= 3) AND 
                      (dbo.tblDimValues_CalculatedMeasures.ValueKey <= 7)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryFactFinancialValues_0304
AS
SELECT     dbo.qryFactFinancialWithSeparateMeasures_Method_4A.FactFinancialKey, dbo.tblDimAccounts_PH_ACCOUNT_TreeView.Code AS AcctCode, 
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView.FullDescr AS AcctDescr, dbo.tblDimAccounts_PH_ACCOUNT_TreeView.TypeCode AS AcctTypeCode, 
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView.Type AS AcctType, dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.Code AS DeptCode, 
                      dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.FullDescr AS DeptDescr, dbo.tblDimOperatingUnits_PH_SITE_TreeView.Code AS SiteCode, 
                      dbo.tblDimOperatingUnits_PH_SITE_TreeView.FullDescr AS SiteDescr, dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.Code AS BUCode, 
                      dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.FullDescr AS BUDescr, 
                      dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.Code AS FundCode, 
                      dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.FullDescr AS FundDescr, dbo.tblDimTime.TimeKey, dbo.tblDimTime.YearKey, 
                      dbo.tblDimTime.YearDescr, dbo.tblDimTime.PeriodKey, dbo.tblDimTime.PeriodDescr, dbo.tblDimTime.StartDate, dbo.tblDimTime.EndDate, 
                      dbo.tblDimProjects_PH_PROJECT_TreeView.Code AS ProjCode, dbo.tblDimProjects_PH_PROJECT_TreeView.FullDescr AS ProjDescr, 
                      dbo.tblDimSubProjects_PH_SUBPROJECT_TreeView.Code AS SubProjCode, 
                      dbo.tblDimSubProjects_PH_SUBPROJECT_TreeView.FullDescr AS SubProjDescr, dbo.tblDimValues_CalculatedMeasures.Code AS ValueCode, 
                      dbo.tblDimValues_CalculatedMeasures.Descr AS ValueDescr, dbo.tblDimValues_CalculatedMeasures.ValueKey, 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.[Value]
FROM         dbo.qryFactFinancialWithSeparateMeasures_Method_4A INNER JOIN
                      dbo.tblDimTime ON dbo.qryFactFinancialWithSeparateMeasures_Method_4A.TimeKey = dbo.tblDimTime.TimeKey INNER JOIN
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.AccountKey = dbo.tblDimAccounts_PH_ACCOUNT_TreeView.AccountKey INNER JOIN
                      dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.BusinessUnitKey = dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.BusinessUnitKey INNER
                       JOIN
                      dbo.tblDimDepartments_PH_DEPARTMENT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.DepartmentKey = dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.DepartmentKey INNER
                       JOIN
                      dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.FundCodeKey = dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.FundCodeKey
                       INNER JOIN
                      dbo.tblDimOperatingUnits_PH_SITE_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.OperatingUnitKey = dbo.tblDimOperatingUnits_PH_SITE_TreeView.OperatingUnitKey INNER JOIN
                      dbo.tblDimProjects_PH_PROJECT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.ProjectKey = dbo.tblDimProjects_PH_PROJECT_TreeView.ProjectKey INNER JOIN
                      dbo.tblDimSubProjects_PH_SUBPROJECT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.SubProjectKey = dbo.tblDimSubProjects_PH_SUBPROJECT_TreeView.SubProjectKey INNER JOIN
                      dbo.tblDimValues_CalculatedMeasures ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.ValueKey = dbo.tblDimValues_CalculatedMeasures.ValueKey
WHERE     (dbo.tblDimTime.TimeKey >= 200401 AND dbo.tblDimTime.TimeKey <= 200501) AND (dbo.tblDimValues_CalculatedMeasures.ValueKey = 3 OR
                      dbo.tblDimValues_CalculatedMeasures.ValueKey = 5) AND (dbo.qryFactFinancialWithSeparateMeasures_Method_4A.AmountTypeKey = 1)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryFactFinancialValues_0405
AS
SELECT     dbo.qryFactFinancialWithSeparateMeasures_Method_4A.FactFinancialKey, dbo.tblDimAccounts_PH_ACCOUNT_TreeView.Code AS AcctCode, 
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView.FullDescr AS AcctDescr, dbo.tblDimAccounts_PH_ACCOUNT_TreeView.TypeCode AS AcctTypeCode, 
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView.Type AS AcctType, dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.Code AS DeptCode, 
                      dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.FullDescr AS DeptDescr, dbo.tblDimOperatingUnits_PH_SITE_TreeView.Code AS SiteCode, 
                      dbo.tblDimOperatingUnits_PH_SITE_TreeView.FullDescr AS SiteDescr, dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.Code AS BUCode, 
                      dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.FullDescr AS BUDescr, 
                      dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.Code AS FundCode, 
                      dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.FullDescr AS FundDescr, dbo.tblDimTime.TimeKey, dbo.tblDimTime.YearKey, 
                      dbo.tblDimTime.YearDescr, dbo.tblDimTime.PeriodKey, dbo.tblDimTime.PeriodDescr, dbo.tblDimTime.StartDate, dbo.tblDimTime.EndDate, 
                      dbo.tblDimProjects_PH_PROJECT_TreeView.Code AS ProjCode, dbo.tblDimProjects_PH_PROJECT_TreeView.FullDescr AS ProjDescr, 
                      dbo.tblDimSubProjects_PH_SUBPROJECT_TreeView.Code AS SubProjCode, 
                      dbo.tblDimSubProjects_PH_SUBPROJECT_TreeView.FullDescr AS SubProjDescr, dbo.tblDimValues_CalculatedMeasures.Code AS ValueCode, 
                      dbo.tblDimValues_CalculatedMeasures.Descr AS ValueDescr, dbo.tblDimValues_CalculatedMeasures.ValueKey, 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.[Value], dbo.qryFactFinancialWithSeparateMeasures_Method_4A.AmountTypeKey, 
                      dbo.tblDimAmountTypes.Descr AS AmountTypeDesc
FROM         dbo.qryFactFinancialWithSeparateMeasures_Method_4A INNER JOIN
                      dbo.tblDimTime ON dbo.qryFactFinancialWithSeparateMeasures_Method_4A.TimeKey = dbo.tblDimTime.TimeKey INNER JOIN
                      dbo.tblDimAccounts_PH_ACCOUNT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.AccountKey = dbo.tblDimAccounts_PH_ACCOUNT_TreeView.AccountKey INNER JOIN
                      dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.BusinessUnitKey = dbo.tblDimBusinessUnits_CT_BUS_UNIT_TreeView.BusinessUnitKey INNER
                       JOIN
                      dbo.tblDimDepartments_PH_DEPARTMENT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.DepartmentKey = dbo.tblDimDepartments_PH_DEPARTMENT_TreeView.DepartmentKey INNER
                       JOIN
                      dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.FundCodeKey = dbo.tblDimFundCodes_PH_FUND_TreeView_ReversedParentNodes.FundCodeKey
                       INNER JOIN
                      dbo.tblDimOperatingUnits_PH_SITE_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.OperatingUnitKey = dbo.tblDimOperatingUnits_PH_SITE_TreeView.OperatingUnitKey INNER JOIN
                      dbo.tblDimProjects_PH_PROJECT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.ProjectKey = dbo.tblDimProjects_PH_PROJECT_TreeView.ProjectKey INNER JOIN
                      dbo.tblDimSubProjects_PH_SUBPROJECT_TreeView ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.SubProjectKey = dbo.tblDimSubProjects_PH_SUBPROJECT_TreeView.SubProjectKey INNER JOIN
                      dbo.tblDimValues_CalculatedMeasures ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.ValueKey = dbo.tblDimValues_CalculatedMeasures.ValueKey INNER JOIN
                      dbo.tblDimAmountTypes ON 
                      dbo.qryFactFinancialWithSeparateMeasures_Method_4A.AmountTypeKey = dbo.tblDimAmountTypes.AmountTypeKey
WHERE     (dbo.tblDimTime.TimeKey >= 200401) AND (dbo.tblDimValues_CalculatedMeasures.ValueKey >= 3) AND 
                      (dbo.tblDimValues_CalculatedMeasures.ValueKey <= 7)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO





CREATE     VIEW dbo.qryFactFinancialWithSeparateMeasures_Method_3
	(DeptSiteKey, FactFinancialKey, TimeKey, AccountKey,
	BudgetScenarioKey, BusinessUnitKey, DepartmentKey,
	FundCodeKey, OperatingUnitKey, ProjectKey,
	SubProjectKey, AFFILIATE, AFFILIATE_INTRA1,
	AmountTypeKey, Value, ValueKey)
AS
SELECT ds.ID, m2.*
FROM qryDimDeptSite_LeafNodes ds, 
qryFactFinancialWithSeparateMeasures_Method_2 m2
WHERE ds.DeptID = m2.DepartmentKey and ds.SiteID = m2.OperatingUnitKey




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE     VIEW dbo.qryFactFinancialWithSeparateMeasures_Method_3A_20050504
	(DeptSiteKey, FactFinancialKey, TimeKey, AccountKey,
	BudgetScenarioKey, BusinessUnitKey, DepartmentKey,
	FundCodeKey, OperatingUnitKey, ProjectKey,
	SubProjectKey, AFFILIATE, AFFILIATE_INTRA1,
	AmountTypeKey, Value, ValueKey)
AS
-- AJ 20040309 for Hybrid Model.
SELECT ds.ID, m2.*
FROM qryDimDeptSite_LeafNodes ds, 
qryFactFinancialWithSeparateMeasures_Method_2 m2
WHERE ds.DeptID = m2.DepartmentKey and ds.SiteID = m2.OperatingUnitKey
AND ValueKey in (3,4,5,6,7)

UNION ALL

SELECT     DimDeptSite.ID, 
           0 AS FactFinancialKey, 
           tblDimTime.TimeKey, 
           sl.AccountKey, 
           sl.BudgetScenarioKey, 
           sl.BusinessUnitKey, 
           sl.DepartmentKey, 
           sl.FundCodeKey, 
           sl.OperatingUnitKey, 
           sl.ProjectKey, 
           sl.SubProjectKey, 
           sl.AFFILIATE, 
           sl.AFFILIATE_INTRA1, 
           sl.AmountTypeKey, 
           sl.Amount AS [Value], 
           51 AS ValueKey
FROM         tblStagingLedger sl INNER JOIN
                      tblDimTime ON sl.FISCAL_YEAR = tblDimTime.YearKey LEFT OUTER JOIN
                      DimDeptSite ON sl.DepartmentKey = DimDeptSite.DeptID AND sl.OperatingUnitKey = DimDeptSite.SiteID
WHERE     (sl.ACCOUNTING_PERIOD = 0) AND (sl.AmountTypeKey = 1)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE       VIEW qryStagingTreeNodes
	(SortOrder,
	 TreeNodeKey,
	 SafeNodeKey,
	 ParentNodeKey,
	 SafeParentNodeKey,
	 Code,
	 Descr,
	 FullDescr,
	 TreeName,
	 NodeDescr)
AS 
SELECT 
	SortOrder,
	TREE_NODE_NUM,
	(TREE_NODE_NUM * -1),
	PARENT_NODE_NUM,
	(PARENT_NODE_NUM * -1),
	'',
	CONVERT(char(30), TREE_NODE),
	CONVERT(char(40), TREE_NODE),
	TREE_NAME, 
	dbo.fnsTreeNodeDescr(TREE_NODE) --2006-06-16
FROM dbo.tblStagingTreeNodes





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_Cube_Validation_Publishing_Results
AS
SELECT     BU, Fund, [Time], [Annual Bud Variance], [YTD Act Variance], [YTD Bud Variance]
FROM         dbo.qry_Cube_Validation_Publishing
WHERE     ([Annual Bud Variance] > 0) OR
                      ([YTD Act Variance] > 0) OR
                      ([YTD Bud Variance] > 0)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qry_hw_tblDimAccounts_PH_ACCOUNT_TreeView_CWOnly
AS
SELECT     AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, DescrShort, FullDescrShort, TypeCode, Type, Formula, [Option], UnaryOp
FROM         dbo.tblDimAccounts_PH_ACCOUNT_TreeView
WHERE     (AccountKey IN
                          (SELECT     AccountKey
                            FROM          qry_hw_Accounts_CWOnly)) OR
                      (Code = '')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryAJ_FTE
AS
SELECT     dbo.tblFactFinancialMeasures.FactFinancialKey, dbo.tblFactFinancialMeasures.TimeKey, dbo.tblFactFinancialMeasures.BaseActual, 
                      dbo.tblFactFinancialMeasures.BaseBudget, dbo.tblFactFinancialMeasures.FactorActual, dbo.tblFactFinancialMeasures.FactorBudget, 
                      dbo.tblFactFinancialMeasures.[YTD Act], dbo.tblFactFinancialMeasures.[YTD Bud], dbo.tblDimAccounts.Code, 
                      dbo.fnsLookupAlternateStatisticalFactor('xxx', dbo.tblFactFinancialMeasures.TimeKey, dbo.tblDimAccounts.Code) AS factor, 
                      dbo.tblFactFinancial.AmountTypeKey
FROM         dbo.tblFactFinancialMeasures INNER JOIN
                      dbo.tblFactFinancial ON dbo.tblFactFinancialMeasures.FactFinancialKey = dbo.tblFactFinancial.FactFinancialKey INNER JOIN
                      dbo.tblDimAccounts ON dbo.tblFactFinancial.AccountKey = dbo.tblDimAccounts.AccountKey
WHERE     (dbo.tblFactFinancial.AmountTypeKey = 3)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.qryAJ_FTE_Frozen
AS
SELECT     m.FactFinancialKey, m.TimeKey, m.BaseActual, 
                      m.BaseBudget, m.FactorActual, m.FactorBudget, 
                      m.[YTD Act], m.[YTD Bud], dbo.tblDimAccounts.Code, 
                      dbo.fnsLookupAlternateStatisticalFactor('xxx', m.TimeKey, dbo.tblDimAccounts.Code) AS factor, 
                      f.AmountTypeKey
FROM         dbo.tblFactFinancialMeasuresFrozen m INNER JOIN
                      dbo.tblFactFinancialFrozen f ON m.FactFinancialKey = f.FactFinancialKey INNER JOIN
                      dbo.tblDimAccounts ON f.AccountKey = dbo.tblDimAccounts.AccountKey
WHERE     (f.AmountTypeKey = 3)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BDGT_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_BDGT'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_FS_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_FS'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_PL_MOH_LeafNodes]
	(LeafNode, AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.AccountKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[TypeCode], src.[Type], src.[Formula], src.[Option], src.[UnaryOp]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimAccounts src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_ACCOUNT_PL_MOH'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimBusinessUnits_CT_BUS_UNIT_LeafNodes]
	(LeafNode, BusinessUnitKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [EliminationsOnly])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.BusinessUnitKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, '')), src.[EliminationsOnly]
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimBusinessUnits src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'CT_BUS_UNIT'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.qryDimBusinessUnits_PH_CONSOLIDATION_LeafNodes
AS
SELECT     src.BusinessUnitKey, src.Code AS BUSINESS_UNIT, src.Descr, ln.SafeNodeKey AS ParentNodeKey, ln.NodeDescr AS ParentDescr, 
                      RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')) AS FullDescr, src.DescrShort, src.EliminationsOnly
FROM         dbo.qryStagingTreeNodes ln INNER JOIN
                      dbo.tblStagingTreeLeafRanges lr ON ln.TreeNodeKey = lr.TREE_NODE_NUM AND ln.TreeName = lr.TREE_NAME INNER JOIN
                      dbo.tblDimBusinessUnits src ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE     (ln.TreeName = 'PH_CONSOLIDATION')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimDepartments_PH_DEPARTMENT_LeafNodes]
	(LeafNode, DepartmentKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.DepartmentKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimDepartments src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_DEPARTMENT'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimFundCodes_PH_FUND_LeafNodes]
	(LeafNode, FundCodeKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.FundCodeKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimFundCodes src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_FUND'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimOperatingUnits_PH_SITE_BI_LeafNodes]
	(LeafNode, OperatingUnitKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.OperatingUnitKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimOperatingUnits src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_SITE_BI'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimOperatingUnits_PH_SITE_LeafNodes]
	(LeafNode, OperatingUnitKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.OperatingUnitKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimOperatingUnits src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_SITE'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_BI_LeafNodes]
	(LeafNode, ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.ProjectKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrLong], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrLong, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimProjects src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_PROJECT_BI'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimSubProjects_PH_SUBPROJECT_LeafNodes]
	(LeafNode, SubProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
-- WARNING!  
-- 	This query was dynamically generated during the import process.  Do not make changes  
-- 	it directly as they will be overwritten during the next import!

SELECT 
	ln.Descr, src.SubProjectKey, ln.SafeNodeKey, src.Code, src.Descr, RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.Descr, '')), (ln.SortOrder + STR(lr.SortOrder,5, 0) + src.Code), src.[DescrShort], RTRIM(ISNULL(src.Code, '')) + ': ' + RTRIM(ISNULL(src.DescrShort, ''))
FROM dbo.qryStagingTreeNodes ln
	INNER JOIN dbo.tblStagingTreeLeafRanges lr
		ON ln.TreeNodeKey = lr.TREE_NODE_NUM
		AND ln.TreeName = lr.TREE_NAME
	INNER JOIN tblDimSubProjects src
		ON src.Code BETWEEN lr.RANGE_FROM AND lr.RANGE_TO
WHERE
     ln.TreeName = 'PH_SUBPROJECT'


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE      VIEW dbo.qryFactFinancialWithSeparateMeasures_Method_3A
	(DeptSiteKey, FactFinancialKey, TimeKey, AccountKey,
	BudgetScenarioKey, BusinessUnitKey, DepartmentKey,
	FundCodeKey, OperatingUnitKey, ProjectKey,
	SubProjectKey, AFFILIATE, AFFILIATE_INTRA1,
	AmountTypeKey, Value, ValueKey)
AS
-- AJ 20040309 for Hybrid Model.
SELECT ds.ID, m2.*
FROM qryDimDeptSite_LeafNodes ds, 
qryFactFinancialWithSeparateMeasures_Method_2 m2
WHERE ds.DeptID = m2.DepartmentKey and ds.SiteID = m2.OperatingUnitKey
AND ValueKey in (3,4,5,6,7)

UNION ALL

SELECT     DimDeptSite.ID, 
           0 AS FactFinancialKey, 
           tblDimTime.TimeKey, 
           sl.AccountKey, 
           sl.BudgetScenarioKey, 
           sl.BusinessUnitKey, 
           sl.DepartmentKey, 
           sl.FundCodeKey, 
           sl.OperatingUnitKey, 
           sl.ProjectKey, 
           sl.SubProjectKey, 
           sl.AFFILIATE, 
           sl.AFFILIATE_INTRA1, 
           sl.AmountTypeKey, 
           sl.Amount AS [Value], 
           51 AS ValueKey
FROM         tblStagingLedger sl INNER JOIN
                      tblDimTime ON sl.FISCAL_YEAR = tblDimTime.YearKey LEFT OUTER JOIN
                      DimDeptSite ON sl.DepartmentKey = DimDeptSite.DeptID AND sl.OperatingUnitKey = DimDeptSite.SiteID
WHERE     (sl.ACCOUNTING_PERIOD = 0) AND (sl.AmountTypeKey = 1)
--modified 20050504 aj
	and sl.FISCAL_YEAR >= CONVERT(INT, dbo.fnsAppSetting('FilterforStartYear'))


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE     VIEW dbo.qryFactFinancialWithSeparateMeasures_Method_3A_Frozen
	(DeptSiteKey, FactFinancialKey, TimeKey, AccountKey,
	BudgetScenarioKey, BusinessUnitKey, DepartmentKey,
	FundCodeKey, OperatingUnitKey, ProjectKey,
	SubProjectKey, AFFILIATE, AFFILIATE_INTRA1,
	AmountTypeKey, Value, ValueKey)
AS
-- AJ 20040309 for Hybrid Model.
SELECT ds.ID, m2.*
FROM qryDimDeptSite_LeafNodes ds, 
qryFactFinancialWithSeparateMeasures_Method_2_Frozen m2
WHERE ds.DeptID = m2.DepartmentKey and ds.SiteID = m2.OperatingUnitKey
AND ValueKey in (3,4,5,6,7)

UNION ALL

SELECT     DimDeptSite.ID, 
           0 AS FactFinancialKey, 
           tblDimTime.TimeKey, 
           sl.AccountKey, 
           sl.BudgetScenarioKey, 
           sl.BusinessUnitKey, 
           sl.DepartmentKey, 
           sl.FundCodeKey, 
           sl.OperatingUnitKey, 
           sl.ProjectKey, 
           sl.SubProjectKey, 
           sl.AFFILIATE, 
           sl.AFFILIATE_INTRA1, 
           sl.AmountTypeKey, 
           sl.Amount AS [Value], 
           51 AS ValueKey
FROM         tblStagingLedger sl INNER JOIN
                      tblDimTime ON sl.FISCAL_YEAR = tblDimTime.YearKey LEFT OUTER JOIN
                      DimDeptSite ON sl.DepartmentKey = DimDeptSite.DeptID AND sl.OperatingUnitKey = DimDeptSite.SiteID
WHERE     (sl.ACCOUNTING_PERIOD = 0) AND (sl.AmountTypeKey = 1) and (sl.FISCAL_YEAR < CONVERT(int, dbo.fnsAppSetting('FilterForStartYear')))


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_BI_ACCOUNT_BS_B_V1_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'BI_ACCOUNT_BS_B_V1'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_BI_ACCOUNT_BS_B_V1_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'BI_ACCOUNT_BS_B_V1'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_BI_ACCOUNT_PL_B_V1_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'BI_ACCOUNT_PL_B_V1'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_BI_ACCOUNT_PL_B_V1_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'BI_ACCOUNT_PL_B_V1'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT2_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT2'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT2_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT2'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BACKUP_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_BACKUP'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_BACKUP_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_BACKUP'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BCCHF_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_BCCHF'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_BCCHF_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_BCCHF'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BCRI_06_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_BCRI_06'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_BCRI_06_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_BCRI_06'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BCRI_07_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_BCRI_07'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_BCRI_07_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_BCRI_07'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BCRI_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') WHEN 0 THEN 'E' ELSE 'R' END), (CASE dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') WHEN 0 THEN -1 ELSE 1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_BCRI'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_BCRI_LeafNodes sv

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BDGT_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_BDGT'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_BDGT_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_BDGT'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BI_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_BI'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_BI_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_BI'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BS2_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_BS2'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_BS2_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_BS2'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BS_AUDI_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_BS_AUDI'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_BS_AUDI_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_BS_AUDI'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BS_BCCA_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_BS_BCCA'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_BS_BCCA_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_BS_BCCA'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BS_LEAD_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_BS_LEAD'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_BS_LEAD_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_BS_LEAD'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BS_MOH_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_BS_MOH'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_BS_MOH_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_BS_MOH'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_BS_ORIG_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_BS_ORIG'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_BS_ORIG_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_BS_ORIG'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_FOUNDTN_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_FOUNDTN'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_FOUNDTN_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_FOUNDTN'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_FS_TEST_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_FS_TEST'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_FS_TEST_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_FS_TEST'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_FS_TST1_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_FS_TST1'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_FS_TST1_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_FS_TST1'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_FS_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.NodeDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_FS'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_FS_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_FS'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_PL_AUDI_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_PL_AUDI'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_PL_AUDI_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_PL_AUDI'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_PL_MOH_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_PL_MOH'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_PL_MOH_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_PL_MOH'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_PL_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT_PL'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_PL_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT_PL'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCOUNT_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCOUNT'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCOUNT_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCOUNT'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_ACCTROLLUP_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_ACCTROLLUP'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_ACCTROLLUP_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_ACCTROLLUP'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_AM_ACCOUNT_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_AM_ACCOUNT'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_AM_ACCOUNT_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_AM_ACCOUNT'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimAccounts_PH_GL_CIP_ACCOUNTS_TreeView]
	(AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
	OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
	THEN 'R' ELSE 'E' END), (CASE WHEN dbo.fnsTreeNodeHasThisAncestor(tn.TreeName, tn.TreeNodeKey, 'REVENUE') <> 0 
		OR Descr = 'AMORT REV' OR Descr = 'AMORTIZED REVENUE' 
		THEN 1 ELSE -1 END), NULL, NULL, (CASE Descr 
WHEN 'REVENUE' THEN '-' 
WHEN 'AMORT REV' THEN '-' WHEN 'AMORTIZED REVENUE' THEN '-' 
ELSE '+' END)
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_GL_CIP_ACCOUNTS'
UNION
SELECT 
	AccountKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM qryDimAccounts_PH_GL_CIP_ACCOUNTS_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [TypeCode], [Type], [Formula], [Option], [UnaryOp]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_GL_CIP_ACCOUNTS'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimBusinessUnits_CT_BUS_UNIT_TreeView]
	(BusinessUnitKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [EliminationsOnly])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL, ('N')
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'CT_BUS_UNIT'
UNION
SELECT 
	BusinessUnitKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [EliminationsOnly]
FROM qryDimBusinessUnits_CT_BUS_UNIT_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort], [EliminationsOnly]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'CT_BUS_UNIT'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimDepartments_PH_DEPARTMENT_TreeView]
	(DepartmentKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_DEPARTMENT'
UNION
SELECT 
	DepartmentKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM qryDimDepartments_PH_DEPARTMENT_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_DEPARTMENT'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimFundCodes_PH_FUND_TreeView]
	(FundCodeKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_FUND'
UNION
SELECT 
	FundCodeKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM qryDimFundCodes_PH_FUND_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_FUND'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimOperatingUnits_PH_SITE_BI_TreeView]
	(OperatingUnitKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_SITE_BI'
UNION
SELECT 
	OperatingUnitKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM qryDimOperatingUnits_PH_SITE_BI_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_SITE_BI'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimOperatingUnits_PH_SITE_TreeView]
	(OperatingUnitKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_SITE'
UNION
SELECT 
	OperatingUnitKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM qryDimOperatingUnits_PH_SITE_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_SITE'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimProjects_PH_PROJECT_BI_TreeView]
	(ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_PROJECT_BI'
UNION
SELECT 
	ProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM qryDimProjects_PH_PROJECT_BI_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrLong], [FullDescrLong]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_PROJECT_BI'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE VIEW dbo.[qryDimSubProjects_PH_SUBPROJECT_TreeView]
	(SubProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort])
AS 
SELECT 
	tn.SafeNodeKey, tn.SafeParentNodeKey, tn.Code, tn.Descr, tn.FullDescr, tn.SortOrder, NULL, NULL
FROM dbo.qryStagingTreeNodes tn
WHERE 
     tn.TreeName = 'PH_SUBPROJECT'
UNION
SELECT 
	SubProjectKey, ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM qryDimSubProjects_PH_SUBPROJECT_LeafNodes sv
UNION
SELECT 
	[Key], ParentNodeKey, Code, Descr, FullDescr, SortOrder, [DescrShort], [FullDescrShort]
FROM dbo.tblStagingCustomMembers 
WHERE 
     TreeName = 'PH_SUBPROJECT'

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW qryDimFundCodes_PH_FUND_TreeView_ReversedParentNodes
AS 
SELECT 
	[FundCodeKey], 
	[ParentNodeKey], 
	[Code], 
	[Descr], 
	[FullDescr], 
	CONVERT(char(34), 
		CASE WHEN FundCodeKey > 0 
			THEN LEFT(SortOrder, 11) + str(2147483647 + ISNULL([ParentNodeKey], 0), 11, 0) + '+' + ISNULL(STR([FundCodeKey], 11, 0), '') 
			ELSE LEFT(SortOrder, 11) + str(2147483647 + ISNULL([FundCodeKey], 0), 11, 0) + ' ' + ISNULL(STR([FundCodeKey], 11, 0), '')
		END) AS SortOrder, 
	[DescrShort], 
	[FullDescrShort]
FROM dbo.qryDimFundCodes_PH_FUND_TreeView
--ORDER BY SortOrder



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE  VIEW qryTreeviews
AS 
SELECT 
	A.SETID, A.TREE_NAME, (CONVERT(CHAR(10),A.EFFDT,121)) AS EFFDT, 
	A.EFF_STATUS, B.PARENT_NODE_NUM, B.PARENT_NODE_NAME, 
	B.TREE_NODE_NUM, B.TREE_NODE, C.RANGE_FROM, 
	C.RANGE_TO
FROM PSTREEDEFN A, PSTREENODE B, PSTREELEAF C
WHERE A.EFFDT =
        (SELECT MAX(A_ED.EFFDT) FROM PSTREEDEFN A_ED
        WHERE A.SETID = A_ED.SETID
          AND A.TREE_NAME = A_ED.TREE_NAME
          AND A_ED.EFFDT <= SUBSTRING(CONVERT(CHAR,GETDATE(),121), 1, 10))
     AND A.SETID = B.SETID
     AND A.TREE_NAME = B.TREE_NAME
     AND B.EFFDT =
        (SELECT MAX(B_ED.EFFDT) FROM PSTREENODE B_ED
        WHERE B.SETID = B_ED.SETID
          AND B.TREE_NAME = B_ED.TREE_NAME
          AND B_ED.EFFDT <= A.EFFDT)
     AND B.SETID = B.SETID
     AND  B.TREE_NAME *=  C.TREE_NAME
     AND  B.TREE_NODE_NUM *=  C.TREE_NODE_NUM
     AND  B.TREE_BRANCH *=  C.TREE_BRANCH AND 1 = '1'
     AND C.EFFDT =
        (SELECT MAX(C_ED.EFFDT) FROM PSTREELEAF C_ED
        WHERE C.SETID = C_ED.SETID
          AND C.TREE_NAME = C_ED.TREE_NAME
          AND C_ED.EFFDT <= B.EFFDT)
  --ORDER BY 2, 5, 7



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

