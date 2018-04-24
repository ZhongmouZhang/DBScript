USE [TRP]
GO
USE [TRP]
GO

INSERT INTO [dbo].[tbl_employee]
           ([EULogin]
           ,[EUFirstName]
           ,[EULastName]
           ,[HA]
           ,[EUEmail]
           ,[Site]
           ,[SiteAddress]
           ,[City]
           ,[PostalCode]
           ,[Department]
           ,[Building]
           ,[Flr]
           ,[Room]
           ,[EUPhone]
           ,[EUMobile]
           ,[Manager_id]
           ,[ManagerAppFirstName]
           ,[ManagerAppLastName])
 SELECT distinct ltrim(rtrim([EULogin]))
       ,dbo.FN_GetName(euname,'F')  as EUFirstName
      ,dbo.FN_GetName(euname,'L') as [EULastName]
      ,[HA]
      ,[EUEmail]
      ,[Site]
      ,[SiteAddress]
      ,[City]
      ,[PostalCode]
      ,[Department]
      ,[Building]
      ,[Flr]
      ,[Room]
      ,dbo.FN_Getphonenumber(EUPhone,'D') as [EUPhone]

      ,dbo.FN_Getphonenumber(EUPhone,'M') as [EUMobile]
      -- ,[Manager_id]
	  , 0
      , dbo.FN_GetName(managerappname,'F') as [ManagerAppFirstName]
      ,dbo.FN_GetName(managerappname,'L')  as [ManagerAppLastName]
  FROM [dbo].combine_sheet_with_id
  where id in (
	select min(id) 
  from combine_sheet_with_id
  group by ltrim(rtrim([EULogin]))
 )
GO

USE [TRP]
GO

INSERT INTO [dbo].[tbl_computer]
           ([LegacySystemHostName]
           ,[NumberofMonitors]
           ,[LegacySystemDescription]
           ,[LegacySystemModel]
           ,[LegacySystemSN]
           ,[Comment1]
           ,[Comment2]
           ,[EP1]
           ,[ImageID])
SELECT
      ltrim(rtrim([LegacySystemHostName]))
      ,[NumberofMonitors]
      ,[LegacySystemDescription]
      ,[LegacySystemModel]
      ,[LegacySystemSN]
      ,[Comment1]
      ,[Comment2]
      ,[EP1]
      ,[ImageID]
  FROM [Combine_Sheet_with_id]
  where id in (
	select min(id) 
  from combine_sheet_with_id
  group by ltrim(rtrim([LegacySystemHostName]))
  )
GO


USE [TRP]
GO

INSERT INTO [dbo].[ln_computer_employee]
           ([LegacySystemHostName]
           ,[EULogin])
select distinct ltrim(rtrim([LegacySystemHostName])), ltrim(rtrim(EUlogin)) from [dbo].[Combine_Sheet_with_id] 


USE [TRP]
GO

INSERT INTO [dbo].[tbl_softwarepackage]
           ([LegacySystemHostName]
           ,[software])
select [LegacySystemHostName], ltrim(rtrim(name )) 
from [dbo].[Combine_Sheet_with_id] cross apply dbo.splitstring(SoftwarePackage1,';')
where id in (
	select min(id) 
  from combine_sheet_with_id
  group by [LegacySystemHostName]
  )

/**********************
select [LegacySystemHostName], [software], count(*)
from [dbo].[tbl_softwarepackage]
group by [LegacySystemHostName], [software]
having count(*)>1
order by count(*), [LegacySystemHostName], [software]

*********************************/


USE [TRP]
GO

INSERT INTO [dbo].[tbl_ipaddress]
           ([LegacySystemHostName]
           ,[ipaddress])
select [LegacySystemHostName], ltrim(rtrim(name ))
from [dbo].[Combine_Sheet_with_id] cross apply dbo.splitstring(LegacySystemIP,';')
where id in (
	select min(id) 
  from combine_sheet_with_id
  group by [LegacySystemHostName]
  )


------------------------------------------------------------------------------
USE [TRP]
GO

INSERT INTO [dbo].[tbl_monitor]
           ([LegacySystemHostName]
           ,[LegacyMonitorType]
           ,[LegacyMonitorAsset]
           ,[LegacyMonitorModel]
           ,[LegacyMonitorPN]
           ,[LegacyMonitorSN])
select [LegacySystemHostName], ltrim(rtrim(name )), '','','',''
from [dbo].[Combine_Sheet_with_id] cross apply dbo.splitstring([LegacyMonitor1Type],';')
where id in (
	select min(id) 
  from combine_sheet_with_id
  group by [LegacySystemHostName]
  )


---------------------------------------------------------------------------------------------
USE [TRP]
GO

INSERT INTO [dbo].[tbl_peripheral]
           ([LegacySystemHostName]
           ,[LegacyPeripheral])
select [LegacySystemHostName], ltrim(rtrim(name ))
from [dbo].[Combine_Sheet_with_id] cross apply dbo.splitstring([LegacyPeripheral1],';')
where id in (
	select min(id) 
  from combine_sheet_with_id
  group by [LegacySystemHostName]
  )

-----------------------------------------------------------------------
USE [TRP]
GO

INSERT INTO [dbo].[tbl_printer]
           ([LegacySystemHostName]
           ,[location]
           ,[printer])
select [LegacySystemHostName], 'Network', ltrim(rtrim(name ))
from [dbo].[Combine_Sheet_with_id] cross apply dbo.splitstring(NetworkPrinters,';')
where id in (
	select min(id) 
  from combine_sheet_with_id
  group by [LegacySystemHostName]
  )

INSERT INTO [dbo].[tbl_printer]
           ([LegacySystemHostName]
           ,[location]
           ,[printer])
select [LegacySystemHostName], 'Local', ltrim(rtrim(name ))
from [dbo].[Combine_Sheet_with_id] cross apply dbo.splitstring(LocalPrinters,';')
where id in (
	select min(id) 
  from combine_sheet_with_id
  group by [LegacySystemHostName]
  )






