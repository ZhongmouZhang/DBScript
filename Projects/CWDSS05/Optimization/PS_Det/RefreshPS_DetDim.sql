-- DimDeptSite
truncate table dbo.DimDeptSite
INSERT INTO [PS_Det].[dbo].[DimDeptSite](
	[ID], [ParentID], [SortOrder], [Descr], [DeptID], 
	[SiteID], [DeptCode], [SiteCode])
SELECT [ID], [ParentID], [SortOrder], [Descr], [DeptID], 
	[SiteID], [DeptCode], [SiteCode] 
FROM [ZVMDSS05\CASESENSITIVE].[PSDM].[dbo].[DimDeptSite]


-- dbo.tblDimAccounts
truncate table dbo.tblDimAccounts
INSERT INTO [PS_Det].[dbo].[tblDimAccounts](
	[AccountKey], [Code], [EffectiveDate], [EffectiveStatus], [Descr], 
	[DescrShort], [TypeCode], [Type], [Formula], [Option], 
	[UnaryOp])
SELECT [AccountKey], [Code], [EffectiveDate], [EffectiveStatus], [Descr], 
	[DescrShort], [TypeCode], [Type], [Formula], [Option], 
	[UnaryOp] 
FROM [ZVMDSS05\CASESENSITIVE].[PSDM].[dbo].[tblDimAccounts]

------------------------------------
truncate table [PS_Det].[dbo].[tblDimBusinessUnits]
INSERT INTO [PS_Det].[dbo].[tblDimBusinessUnits](
	[BusinessUnitKey], [Code], [EffectiveDate], [Descr], [DescrShort], [EliminationsOnly])
SELECT [BusinessUnitKey], [Code], [EffectiveDate], [Descr], [DescrShort], [EliminationsOnly] 
FROM [ZVMDSS05\CASESENSITIVE].[PSDM].[dbo].[tblDimBusinessUnits]


--------------------------------
truncate table [PS_Det].[dbo].[tblDimDepartments]
INSERT INTO [PS_Det].[dbo].[tblDimDepartments](
	[DepartmentKey], [Code], [EffectiveDate], [EffectiveStatus], [Descr], [DescrShort])
SELECT [DepartmentKey], [Code], [EffectiveDate], [EffectiveStatus], [Descr], [DescrShort] 
FROM [ZVMDSS05\CASESENSITIVE].[PSDM].[dbo].[tblDimDepartments]



-------------------------------
truncate table [PS_Det].[dbo].[tblDimFundCodes]
INSERT INTO [PS_Det].[dbo].[tblDimFundCodes](
	[FundCodeKey], [Code], [EffectiveDate], [EffectiveStatus], [Descr], [DescrShort])
SELECT [FundCodeKey], [Code], [EffectiveDate], [EffectiveStatus], [Descr], [DescrShort] 
FROM [ZVMDSS05\CASESENSITIVE].[PSDM].[dbo].[tblDimFundCodes]


------------------------------------
truncate table [PS_Det].[dbo].[tblDimOperatingUnits]
INSERT INTO [PS_Det].[dbo].[tblDimOperatingUnits](
	[OperatingUnitKey], [Code], [EffectiveDate], [EffectiveStatus], [Descr], [DescrShort])
SELECT [OperatingUnitKey], [Code], [EffectiveDate], [EffectiveStatus], [Descr], [DescrShort]
FROM [ZVMDSS05\CASESENSITIVE].[PSDM].[dbo].[tblDimOperatingUnits]


----------------------
truncate table [PS_Det].[dbo].[tblDimProjects]
INSERT INTO [PS_Det].[dbo].[tblDimProjects](
	[ProjectKey], [Code], [EffectiveStatus], [Descr], [DescrLong])
SELECT [ProjectKey], [Code], [EffectiveStatus], [Descr], [DescrLong] 
FROM [ZVMDSS05\CASESENSITIVE].[PSDM].[dbo].[tblDimProjects]



-------------------------
Truncate table [PS_Det].[dbo].[tblDimSubProjects]
INSERT INTO [PS_Det].[dbo].[tblDimSubProjects](
	[SubProjectKey], [Code], [EffectiveDate], [EffectiveStatus], [Descr], 
	[DescrShort])
SELECT [SubProjectKey], [Code], [EffectiveDate], [EffectiveStatus], [Descr], [DescrShort] 
FROM [ZVMDSS05\CASESENSITIVE].[PSDM].[dbo].[tblDimSubProjects]




