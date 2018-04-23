
if exists (select * from sysobjects where id = object_id(N'tbl_monitor') and xtype='U')
	drop table tbl_monitor
create table tbl_monitor
(
	[LegacySystemHostName] [nvarchar](32) not NULL,
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
	[LegacySystemHostName] [nvarchar](32) not NULL,
	[LegacyDockModel] [nvarchar](255) NULL,
	[LegacyDockPN] [nvarchar](255) NULL,
	[LegacyDockSN] [nvarchar](255) NULL
)


if exists (select * from sysobjects where id = object_id(N'tbl_peripheral') and xtype='U')
	drop table tbl_peripheral
create table tbl_peripheral
(
	[LegacySystemHostName] [nvarchar](32) not NULL,
	LegacyPeripheral [nvarchar](64) not NULL
)


if exists (select * from sysobjects where id = object_id(N'tbl_ipaddress') and xtype='U')
	drop table tbl_ipaddress
create table tbl_ipaddress
(
	[LegacySystemHostName] [nvarchar](32) not NULL,
	ipaddress varchar(20)
)


if exists (select * from sysobjects where id = object_id(N'tbl_printer') and xtype='U')
	drop table tbl_printer
create table tbl_printer
(	[LegacySystemHostName] [nvarchar](32) not NULL,
	location varchar(10), -- local/network
	printer varchar(256)
)


if exists (select * from sysobjects where id = object_id(N'tbl_softwarepackage') and xtype='U')
	drop table tbl_softwarepackage
create table tbl_softwarepackage
(
	[LegacySystemHostName] [nvarchar](32) not NULL,
	software varchar(256)
)

-- create unique index IX_Softwarepackage on tbl_softwarepackage([LegacySystemHostName],software);

if exists (select * from sysobjects where id = object_id(N'ln_computer_employee') and xtype='U')
	drop table ln_computer_employee
create table ln_computer_employee
(
	[LegacySystemHostName] [nvarchar](32) not NULL,
	[EULogin] [nvarchar](64)
)

create unique index IX_hostname_login on ln_computer_employee([LegacySystemHostName],[EULogin])


-------------------------------------------------------------------------------------------------
if exists (select * from sysobjects where id = object_id(N'tbl_employee') and xtype='U')
	drop table tbl_employee
CREATE TABLE tbl_employee(
	id int identity(1,1) primary key,
	[EULogin] [nvarchar](64) not null,
	[EUFirstName] [nvarchar](64)   null,
	[EULastName] [nvarchar](64)   null,
	HA varchar(8)  null,
	[EUEmail] [nvarchar](64)   null,
	[Site] [nvarchar](64) NULL,
	[SiteAddress] [nvarchar](64) NULL,
	[City] [nvarchar](64) NULL,
	[PostalCode] [nvarchar](64) NULL,
	[Department] [nvarchar](256) NULL,
	[Building] [nvarchar](64) NULL,
	[Flr] nvarchar(64) NULL,
	[Room] [nvarchar](64) NULL,
	[EUPhone] [nvarchar](64) NULL,
	EUMobile nvarchar(64) null,
	Manager_id int,
	[ManagerAppFirstName] [nvarchar](64) NULL,
	[ManagerAppLastName] [nvarchar](64) NULL
	)

create unique index IX_employee_EULogin on tbl_employee(eulogin)

if exists (select * from sysobjects where id = object_id(N'tbl_employee') and xtype='U')
	drop table tbl_computer
create table tbl_computer 
(
	id int identity(1,1) primary key,
	[LegacySystemHostName] [nvarchar](32) not NULL,
	[NumberofMonitors] int  NULL,
	[LegacySystemDescription] [nvarchar](64) NULL,
	[LegacySystemModel] [nvarchar](64) NULL,
	[LegacySystemSN] [nvarchar](64) NULL,
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


