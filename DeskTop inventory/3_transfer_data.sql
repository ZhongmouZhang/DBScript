
if exists (select * from sysobjects where id = object_id(N'tbl_monitor') and xtype='U')
	drop table tbl_monitor
create table tbl_monitor
(
	[LegacySystemHostName] [nvarchar](255) not NULL,
	[LegacyMonitorType] [nvarchar](255) NULL,
	[LegacyMonitorAsset] [nvarchar](255) NULL,
	[LegacyMonitorModel] [nvarchar](255) NULL,
	[LegacyMonitorPN] [nvarchar](255) NULL,
	[LegacyMonitorSN] [nvarchar](255) NULL
)

if exists (select * from sysobjects where id = object_id(N'tbl_dock') and xtype='U')
	drop table tbl_dock
create table tbl_dock
(
	[LegacySystemHostName] [nvarchar](255) not NULL,
	[LegacyDockModel] [nvarchar](255) NULL,
	[LegacyDockPN] [nvarchar](255) NULL,
	[LegacyDockSN] [nvarchar](255) NULL
)


if exists (select * from sysobjects where id = object_id(N'tbl_peripheral') and xtype='U')
	drop table tbl_peripheral
create table tbl_peripheral
(
	[LegacySystemHostName] [nvarchar](255) not NULL,
	LegacyPeripheral [nvarchar](255) not NULL
)


if exists (select * from sysobjects where id = object_id(N'tbl_ipaddress') and xtype='U')
	drop table tbl_ipaddress
create table tbl_ipaddress
(
	[LegacySystemHostName] [nvarchar](255) not NULL,
	ipaddress varchar(255)
)


if exists (select * from sysobjects where id = object_id(N'tbl_printer') and xtype='U')
	drop table tbl_printer
create table tbl_printer
(	[LegacySystemHostName] [nvarchar](255) not NULL,
	location varchar(255), -- local/network
	printer varchar(255)
)


if exists (select * from sysobjects where id = object_id(N'tbl_softwarepackage') and xtype='U')
	drop table tbl_softwarepackage
create table tbl_softwarepackage
(
	[LegacySystemHostName] [nvarchar](255) not NULL,
	software varchar(256)
)

-- create unique index IX_Softwarepackage on tbl_softwarepackage([LegacySystemHostName],software);

if exists (select * from sysobjects where id = object_id(N'ln_computer_employee') and xtype='U')
	drop table ln_computer_employee
create table ln_computer_employee
(
	[LegacySystemHostName] [nvarchar](255) not NULL,
	[EULogin] [nvarchar](255)
)

create unique index IX_hostname_login on ln_computer_employee([LegacySystemHostName],[EULogin])


-------------------------------------------------------------------------------------------------
if exists (select * from sysobjects where id = object_id(N'tbl_employee') and xtype='U')
	drop table tbl_employee
CREATE TABLE tbl_employee(
	id int identity(1,1) primary key,
	[EULogin] [nvarchar](255) not null,
	[EUFirstName] [nvarchar](255)   null,
	[EULastName] [nvarchar](255)   null,
	HA varchar(255)  null,
	[EUEmail] [nvarchar](255)   null,
	[Site] [nvarchar](255) NULL,
	[SiteAddress] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](255) NULL,
	[Department] [nvarchar](256) NULL,
	[Building] [nvarchar](255) NULL,
	[Flr] nvarchar(255) NULL,
	[Room] [nvarchar](255) NULL,
	[EUPhone] [nvarchar](255) NULL,
	EUMobile nvarchar(255) null,
	Manager_id int,
	[ManagerAppFirstName] [nvarchar](255) NULL,
	[ManagerAppLastName] [nvarchar](255) NULL
	)

create unique index IX_employee_EULogin on tbl_employee(eulogin)

if exists (select * from sysobjects where id = object_id(N'tbl_employee') and xtype='U')
	drop table tbl_computer
create table tbl_computer 
(
	id int identity(1,1) primary key,
	[LegacySystemHostName] [nvarchar](255) not NULL,
	[NumberofMonitors] int  NULL,
	[LegacySystemDescription] [nvarchar](255) NULL,
	[LegacySystemModel] [nvarchar](255) NULL,
	[LegacySystemSN] [nvarchar](255) NULL,
	[Comment1] [nvarchar](255) NULL,
	[Comment2] [nvarchar](255) NULL,
	[EP1] [nvarchar](255) NULL,
	[ImageID] [nvarchar](255) NULL,
	)
create unique index IX_computer_hostname on tbl_computer([LegacySystemHostName])


alter table [dbo].[ln_computer_employee]
add constraint FK_ln_computer_employee_computer Foreign key ([LegacySystemHostName]) references [dbo].[tbl_computer] ([LegacySystemHostName])


alter table [dbo].[ln_computer_employee]
add constraint FK_ln_computer_employee_employee Foreign key ([EULogin]) references [dbo].[tbl_employee] ([EULogin])

alter table [dbo].[tbl_dock]
add constraint FK_dock_computer foreign key ([LegacySystemHostName]) references tbl_computer ([LegacySystemHostName])

alter table [dbo].[tbl_ipaddress]
add constraint FK_ipaddress_computer foreign key ([LegacySystemHostName]) references tbl_computer ([LegacySystemHostName])

alter table [dbo].tbl_monitor
add constraint FK_monitor_computer foreign key ([LegacySystemHostName]) references tbl_computer ([LegacySystemHostName])

alter table [dbo].tbl_peripheral
add constraint FK_peripheral_computer foreign key ([LegacySystemHostName]) references tbl_computer ([LegacySystemHostName])

alter table [dbo].tbl_printer
add constraint FK_printer_computer foreign key ([LegacySystemHostName]) references tbl_computer ([LegacySystemHostName])

alter table [dbo].tbl_softwarepackage
add constraint FK_softwarepackage_computer foreign key ([LegacySystemHostName]) references tbl_computer ([LegacySystemHostName])


---------------------------------------------------------------------------------------------------------------------------------------------

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


INSERT INTO [dbo].[ln_computer_employee]
           ([LegacySystemHostName]
           ,[EULogin])
select distinct ltrim(rtrim([LegacySystemHostName])), ltrim(rtrim(EUlogin)) from [dbo].[Combine_Sheet_with_id] 


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


-- truncate the loaded data
truncate table [dbo].[Combine_Sheet_with_id]





