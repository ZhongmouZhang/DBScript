﻿
-- \\10.1.66.66\cwdp01\z_HSSBCTRP\HDTFiles\DiscoveryDataScans\HDTScanImports\_Merged\HDT_Master.xlsx


if exists (select * from sysobjects where id = object_id(N'Combine_Sheet_with_id') and xtype='U')
	drop table Combine_Sheet_with_id

CREATE TABLE [dbo].Combine_Sheet_with_id(
	id int identity (1,1) primary key,
	[Key] nvarchar (255) NULL,
	[DataSetVer1#0] [nvarchar](255) NULL,
	[HA] nvarchar (255) NULL,
	[ReqType] [nvarchar](255) NULL,
	[TRPNum] [nvarchar](255) NULL,
	[ReqNum] [nvarchar](255) NULL,
	[EventID] [nvarchar](255) NULL,
	[DeploymentSchDate] [nvarchar](255) NULL,
	[DeploymentActualDate] [nvarchar](255) NULL,
	[DeliveryDate] [nvarchar](255) NULL,
	[SiteAcronym] [nvarchar](255) NULL,
	[Site] [nvarchar](255) NULL,
	[SiteAddress] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](255) NULL,
	[Department] [nvarchar](255) NULL,
	[Building] [nvarchar](255) NULL,
	[Flr] [float] NULL,
	[Room] [nvarchar](255) NULL,
	[EUName] [nvarchar](255) NULL,
	[EULogin] [nvarchar](255) NULL,
	[EUEmail] [nvarchar](255) NULL,
	[EUPhone] [nvarchar](255) NULL,
	[TRPApproverName] [nvarchar](255) NULL,
	[TRPAppEmail] [nvarchar](255) NULL,
	[TRPAppPhone] [nvarchar](255) NULL,
	[ManagerAppName] [nvarchar](255) NULL,
	[ManagerAppLogin] [nvarchar](255) NULL,
	[ManagerAppEmail] [nvarchar](255) NULL,
	[ManagerAppPhone] [nvarchar](255) NULL,
	[CostCenter] [nvarchar](255) NULL,
	[NWSManagedYN] [nvarchar](255) NULL,
	[RebootExemptYN] [nvarchar](255) NULL,
	[EncryptExemptYN] [nvarchar](255) NULL,
	[LWSRetainIPYN] [nvarchar](255) NULL,
	[LegacySystemIP] [nvarchar](255) NULL,
	[LWSRetainNameYN] [nvarchar](255) NULL,
	[LegacySystemHostName] [nvarchar](255) NULL,
	[NewDeviceHostName] [nvarchar](255) NULL,
	[STDDevice_SpecHandlingYN] [nvarchar](255) NULL,
	[HardwareBuild1description] [nvarchar](255) NULL,
	[HardwareBuild1] [nvarchar](255) NULL,
	[HardwareBuild2] [nvarchar](255) NULL,
	[HardwareBuild3] [nvarchar](255) NULL,
	[HardwareBuild4] [nvarchar](255) NULL,
	[HardwareBuild5] [nvarchar](255) NULL,
	[HardwareBuild6] [nvarchar](255) NULL,
	[HardwareBuild7] [nvarchar](255) NULL,
	[DockingStationYN] [nvarchar](255) NULL,
	[DockingStationBuild] [nvarchar](255) NULL,
	[AddOnAccessory1] [nvarchar](255) NULL,
	[AddOnAccessory2] [nvarchar](255) NULL,
	[AddOnAccessory3] [nvarchar](255) NULL,
	[NumberofMonitors] [float] NULL,
	[SpecialInstruction1] [nvarchar](255) NULL,
	[SpecialInstruction2] [nvarchar](255) NULL,
	[DayOfInstructions] [nvarchar](255) NULL,
	[ShipStoreInstructions1] [nvarchar](255) NULL,
	[ShipStoreInstructions2] [nvarchar](255) NULL,
	[ShipStoreContactName1] [nvarchar](255) NULL,
	[ShipStoreContactPhone1] [nvarchar](255) NULL,
	[SiteContactName1] [nvarchar](255) NULL,
	[SiteContactPhone1] [nvarchar](255) NULL,
	[SiteContactName2] [nvarchar](255) NULL,
	[SiteContactPhone2] [nvarchar](255) NULL,
	[DisposalDestination] [nvarchar](255) NULL,
	[NonIBMTicket] [nvarchar](255) NULL,
	[SalesOrder] [nvarchar](255) NULL,
	[VendorPO] [nvarchar](255) NULL,
	[NewAssetNumber] [nvarchar](255) NULL,
	[NWSPN] [nvarchar](255) NULL,
	[NWSSN] [nvarchar](255) NULL,
	[NWSBrand] [nvarchar](255) NULL,
	[New_Workstation_ModelName] [nvarchar](255) NULL,
	[NWSMacAddressRequiredYN] [nvarchar](255) NULL,
	[MAC_Address] [nvarchar](255) NULL,
	[NewDockingStationPN] [nvarchar](255) NULL,
	[NewMonitor1PN] [nvarchar](255) NULL,
	[NewMonitor2PN] [nvarchar](255) NULL,
	[NewMonitor3PN] [nvarchar](255) NULL,
	[NewMonitor4PN] [nvarchar](255) NULL,
	[LegacySystemAssetTag] [nvarchar](255) NULL,
	[LegacySystemDescription] [nvarchar](255) NULL,
	[LegacySystemModel] [nvarchar](255) NULL,
	[LegacySystemFormFactor] [nvarchar](255) NULL,
	[LegacySystemSN] [nvarchar](255) NULL,
	[LegacyDockModel1] [nvarchar](255) NULL,
	[LegacyDockPN1] [nvarchar](255) NULL,
	[LegacyDockSN1] [nvarchar](255) NULL,
	[LegacyDockModel2] [nvarchar](255) NULL,
	[LegacyDockPN2] [nvarchar](255) NULL,
	[LegacyDockSN2] [nvarchar](255) NULL,
	[LegacyMonitor1Type] [nvarchar](255) NULL,
	[LegacyMonitor1Asset] [nvarchar](255) NULL,
	[LegacyMonitor1Model] [nvarchar](255) NULL,
	[LegacyMonitor1PN] [nvarchar](255) NULL,
	[LegacyMonitor1SN] [nvarchar](255) NULL,
	[LegacyMonitor2Type] [nvarchar](255) NULL,
	[LegacyMonitor2Asset] [nvarchar](255) NULL,
	[LegacyMonitor2Model] [nvarchar](255) NULL,
	[LegacyMonitor2PN] [nvarchar](255) NULL,
	[LegacyMonitor2SN] [nvarchar](255) NULL,
	[LegacyMonitor3Type] [nvarchar](255) NULL,
	[LegacyMonitor3Asset] [nvarchar](255) NULL,
	[LegacyMonitor3Model] [nvarchar](255) NULL,
	[LegacyMonitor3PN] [nvarchar](255) NULL,
	[LegacyMonitor3SN] [nvarchar](255) NULL,
	[LegacyMonitor4Type] [nvarchar](255) NULL,
	[LegacyMonitor4Asset] [nvarchar](255) NULL,
	[LegacyMonitor4Model] [nvarchar](255) NULL,
	[LegacyMonitor4PN] [nvarchar](255) NULL,
	[LegacyMonitor4SN] [nvarchar](255) NULL,
	[SD_IMACTicketNumber] [nvarchar](255) NULL,
	[IBMHSSProjectREF] [nvarchar](255) NULL,
	[DiscoveryDate] [nvarchar](255) NULL,
	[Comment1] [nvarchar](255) NULL,
	[Comment2] [nvarchar](255) NULL,
	[EP1] [nvarchar](255) NULL,
	[EP2] [nvarchar](255) NULL,
	[EP3] [nvarchar](255) NULL,
	[EP4] [nvarchar](255) NULL,
	[EP5] [nvarchar](255) NULL,
	[LegacyPeripheral1] [nvarchar](255) NULL,
	[LegacyPeripheral2] [nvarchar](255) NULL,
	[NetworkPrinters] [nvarchar](255) NULL,
	[LocalPrinters] [nvarchar](255) NULL,
	[APTANotes] [nvarchar](255) NULL,
	[NonQualityAssuredSoftware] [nvarchar](255) NULL,
	[ImageID] [nvarchar](255) NULL,
	[Vendor_or_LOB_Support] [nvarchar](255) NULL,
	[SoftwarePackage1] [nvarchar](max) NULL,
	[SoftwarePackage2] [nvarchar](255) NULL,
	[SoftwarePackage3] [nvarchar](255) NULL,
	[SoftwarePackage4] [nvarchar](255) NULL,
	[SoftwarePackage5] [nvarchar](255) NULL,
	[SoftwarePackage6] [nvarchar](255) NULL,
	[SoftwarePackage7] [nvarchar](255) NULL,
	[SoftwarePackage8] [nvarchar](255) NULL,
	[SoftwarePackage9] [nvarchar](255) NULL,
	[SoftwarePackage10] [nvarchar](255) NULL,
	[SoftwarePackage11] [nvarchar](255) NULL,
	[SoftwarePackage12] [nvarchar](255) NULL,
	[SoftwarePackage13] [nvarchar](255) NULL,
	[SoftwarePackage14] [nvarchar](255) NULL,
	[SoftwarePackage15] [nvarchar](255) NULL,
	[SoftwarePackage16] [nvarchar](255) NULL,
	[SoftwarePackage17] [nvarchar](255) NULL,
	[SoftwarePackage18] [nvarchar](255) NULL,
	[SoftwarePackage19] [nvarchar](255) NULL,
	[SoftwarePackage20] [nvarchar](255) NULL,
	[SoftwarePackage21] [nvarchar](255) NULL,
	[SoftwarePackage22] [nvarchar](255) NULL,
	[SoftwarePackage23] [nvarchar](255) NULL,
	[SoftwarePackage24] [nvarchar](255) NULL,
	[SoftwarePackage25] [nvarchar](255) NULL,
	[SoftwarePackage26] [nvarchar](255) NULL,
	[SoftwarePackage27] [nvarchar](255) NULL,
	[SoftwarePackage28] [nvarchar](255) NULL,
	[SoftwarePackage29] [nvarchar](255) NULL,
	[SoftwarePackage30] [nvarchar](255) NULL,
	[SoftwarePackage31] [nvarchar](255) NULL,
	[SoftwarePackage32] [nvarchar](255) NULL,
	[SoftwarePackage33] [nvarchar](255) NULL,
	[SoftwarePackage34] [nvarchar](255) NULL,
	[SoftwarePackage35] [nvarchar](255) NULL,
	[SoftwarePackage36] [nvarchar](255) NULL,
	[SoftwarePackage37] [nvarchar](255) NULL,
	[SoftwarePackage38] [nvarchar](255) NULL,
	[SoftwarePackage39] [nvarchar](255) NULL,
	[SoftwarePackage40] [nvarchar](255) NULL,
	[SoftwarePackage41] [nvarchar](255) NULL,
	[SoftwarePackage42] [nvarchar](255) NULL,
	[SoftwarePackage43] [nvarchar](255) NULL,
	[SoftwarePackage44] [nvarchar](255) NULL,
	[SoftwarePackage45] [nvarchar](255) NULL,
	[SoftwarePackage46] [nvarchar](255) NULL,
	[SoftwarePackage47] [nvarchar](255) NULL,
	[SoftwarePackage48] [nvarchar](255) NULL,
	[SoftwarePackage49] [nvarchar](255) NULL,
	[SoftwarePackage50] [nvarchar](255) NULL
) 

/*****************************************************

insert into [dbo].[Combine_Sheet_with_id]
select * from [dbo].[Combine_Sheet]



if exists (select * from sysobjects where id = object_id(N'Combine_Sheet') and xtype='U')
	drop table Combine_Sheet

CREATE TABLE [dbo].Combine_Sheet (
	[Key] nvarchar (255) NULL,
	[DataSetVer1#0] [nvarchar](255) NULL,
	[HA] nvarchar (255) NULL,
	[ReqType] [nvarchar](255) NULL,
	[TRPNum] [nvarchar](255) NULL,
	[ReqNum] [nvarchar](255) NULL,
	[EventID] [nvarchar](255) NULL,
	[DeploymentSchDate] [nvarchar](255) NULL,
	[DeploymentActualDate] [nvarchar](255) NULL,
	[DeliveryDate] [nvarchar](255) NULL,
	[SiteAcronym] [nvarchar](255) NULL,
	[Site] [nvarchar](255) NULL,
	[SiteAddress] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](255) NULL,
	[Department] [nvarchar](255) NULL,
	[Building] [nvarchar](255) NULL,
	[Flr] [float] NULL,
	[Room] [nvarchar](255) NULL,
	[EUName] [nvarchar](255) NULL,
	[EULogin] [nvarchar](255) NULL,
	[EUEmail] [nvarchar](255) NULL,
	[EUPhone] [nvarchar](255) NULL,
	[TRPApproverName] [nvarchar](255) NULL,
	[TRPAppEmail] [nvarchar](255) NULL,
	[TRPAppPhone] [nvarchar](255) NULL,
	[ManagerAppName] [nvarchar](255) NULL,
	[ManagerAppLogin] [nvarchar](255) NULL,
	[ManagerAppEmail] [nvarchar](255) NULL,
	[ManagerAppPhone] [nvarchar](255) NULL,
	[CostCenter] [nvarchar](255) NULL,
	[NWSManagedYN] [nvarchar](255) NULL,
	[RebootExemptYN] [nvarchar](255) NULL,
	[EncryptExemptYN] [nvarchar](255) NULL,
	[LWSRetainIPYN] [nvarchar](255) NULL,
	[LegacySystemIP] [nvarchar](255) NULL,
	[LWSRetainNameYN] [nvarchar](255) NULL,
	[LegacySystemHostName] [nvarchar](255) NULL,
	[NewDeviceHostName] [nvarchar](255) NULL,
	[STDDevice_SpecHandlingYN] [nvarchar](255) NULL,
	[HardwareBuild1description] [nvarchar](255) NULL,
	[HardwareBuild1] [nvarchar](255) NULL,
	[HardwareBuild2] [nvarchar](255) NULL,
	[HardwareBuild3] [nvarchar](255) NULL,
	[HardwareBuild4] [nvarchar](255) NULL,
	[HardwareBuild5] [nvarchar](255) NULL,
	[HardwareBuild6] [nvarchar](255) NULL,
	[HardwareBuild7] [nvarchar](255) NULL,
	[DockingStationYN] [nvarchar](255) NULL,
	[DockingStationBuild] [nvarchar](255) NULL,
	[AddOnAccessory1] [nvarchar](255) NULL,
	[AddOnAccessory2] [nvarchar](255) NULL,
	[AddOnAccessory3] [nvarchar](255) NULL,
	[NumberofMonitors] [float] NULL,
	[SpecialInstruction1] [nvarchar](255) NULL,
	[SpecialInstruction2] [nvarchar](255) NULL,
	[DayOfInstructions] [nvarchar](255) NULL,
	[ShipStoreInstructions1] [nvarchar](255) NULL,
	[ShipStoreInstructions2] [nvarchar](255) NULL,
	[ShipStoreContactName1] [nvarchar](255) NULL,
	[ShipStoreContactPhone1] [nvarchar](255) NULL,
	[SiteContactName1] [nvarchar](255) NULL,
	[SiteContactPhone1] [nvarchar](255) NULL,
	[SiteContactName2] [nvarchar](255) NULL,
	[SiteContactPhone2] [nvarchar](255) NULL,
	[DisposalDestination] [nvarchar](255) NULL,
	[NonIBMTicket] [nvarchar](255) NULL,
	[SalesOrder] [nvarchar](255) NULL,
	[VendorPO] [nvarchar](255) NULL,
	[NewAssetNumber] [nvarchar](255) NULL,
	[NWSPN] [nvarchar](255) NULL,
	[NWSSN] [nvarchar](255) NULL,
	[NWSBrand] [nvarchar](255) NULL,
	[New_Workstation_ModelName] [nvarchar](255) NULL,
	[NWSMacAddressRequiredYN] [nvarchar](255) NULL,
	[MAC_Address] [nvarchar](255) NULL,
	[NewDockingStationPN] [nvarchar](255) NULL,
	[NewMonitor1PN] [nvarchar](255) NULL,
	[NewMonitor2PN] [nvarchar](255) NULL,
	[NewMonitor3PN] [nvarchar](255) NULL,
	[NewMonitor4PN] [nvarchar](255) NULL,
	[LegacySystemAssetTag] [nvarchar](255) NULL,
	[LegacySystemDescription] [nvarchar](255) NULL,
	[LegacySystemModel] [nvarchar](255) NULL,
	[LegacySystemFormFactor] [nvarchar](255) NULL,
	[LegacySystemSN] [nvarchar](255) NULL,
	[LegacyDockModel1] [nvarchar](255) NULL,
	[LegacyDockPN1] [nvarchar](255) NULL,
	[LegacyDockSN1] [nvarchar](255) NULL,
	[LegacyDockModel2] [nvarchar](255) NULL,
	[LegacyDockPN2] [nvarchar](255) NULL,
	[LegacyDockSN2] [nvarchar](255) NULL,
	[LegacyMonitor1Type] [nvarchar](255) NULL,
	[LegacyMonitor1Asset] [nvarchar](255) NULL,
	[LegacyMonitor1Model] [nvarchar](255) NULL,
	[LegacyMonitor1PN] [nvarchar](255) NULL,
	[LegacyMonitor1SN] [nvarchar](255) NULL,
	[LegacyMonitor2Type] [nvarchar](255) NULL,
	[LegacyMonitor2Asset] [nvarchar](255) NULL,
	[LegacyMonitor2Model] [nvarchar](255) NULL,
	[LegacyMonitor2PN] [nvarchar](255) NULL,
	[LegacyMonitor2SN] [nvarchar](255) NULL,
	[LegacyMonitor3Type] [nvarchar](255) NULL,
	[LegacyMonitor3Asset] [nvarchar](255) NULL,
	[LegacyMonitor3Model] [nvarchar](255) NULL,
	[LegacyMonitor3PN] [nvarchar](255) NULL,
	[LegacyMonitor3SN] [nvarchar](255) NULL,
	[LegacyMonitor4Type] [nvarchar](255) NULL,
	[LegacyMonitor4Asset] [nvarchar](255) NULL,
	[LegacyMonitor4Model] [nvarchar](255) NULL,
	[LegacyMonitor4PN] [nvarchar](255) NULL,
	[LegacyMonitor4SN] [nvarchar](255) NULL,
	[SD_IMACTicketNumber] [nvarchar](255) NULL,
	[IBMHSSProjectREF] [nvarchar](255) NULL,
	[DiscoveryDate] [nvarchar](255) NULL,
	[Comment1] [nvarchar](255) NULL,
	[Comment2] [nvarchar](255) NULL,
	[EP1] [nvarchar](255) NULL,
	[EP2] [nvarchar](255) NULL,
	[EP3] [nvarchar](255) NULL,
	[EP4] [nvarchar](255) NULL,
	[EP5] [nvarchar](255) NULL,
	[LegacyPeripheral1] [nvarchar](255) NULL,
	[LegacyPeripheral2] [nvarchar](255) NULL,
	[NetworkPrinters] [nvarchar](255) NULL,
	[LocalPrinters] [nvarchar](255) NULL,
	[APTANotes] [nvarchar](255) NULL,
	[NonQualityAssuredSoftware] [nvarchar](255) NULL,
	[ImageID] [nvarchar](255) NULL,
	[Vendor_or_LOB_Support] [nvarchar](255) NULL,
	[SoftwarePackage1] [nvarchar](max) NULL,
	[SoftwarePackage2] [nvarchar](255) NULL,
	[SoftwarePackage3] [nvarchar](255) NULL,
	[SoftwarePackage4] [nvarchar](255) NULL,
	[SoftwarePackage5] [nvarchar](255) NULL,
	[SoftwarePackage6] [nvarchar](255) NULL,
	[SoftwarePackage7] [nvarchar](255) NULL,
	[SoftwarePackage8] [nvarchar](255) NULL,
	[SoftwarePackage9] [nvarchar](255) NULL,
	[SoftwarePackage10] [nvarchar](255) NULL,
	[SoftwarePackage11] [nvarchar](255) NULL,
	[SoftwarePackage12] [nvarchar](255) NULL,
	[SoftwarePackage13] [nvarchar](255) NULL,
	[SoftwarePackage14] [nvarchar](255) NULL,
	[SoftwarePackage15] [nvarchar](255) NULL,
	[SoftwarePackage16] [nvarchar](255) NULL,
	[SoftwarePackage17] [nvarchar](255) NULL,
	[SoftwarePackage18] [nvarchar](255) NULL,
	[SoftwarePackage19] [nvarchar](255) NULL,
	[SoftwarePackage20] [nvarchar](255) NULL,
	[SoftwarePackage21] [nvarchar](255) NULL,
	[SoftwarePackage22] [nvarchar](255) NULL,
	[SoftwarePackage23] [nvarchar](255) NULL,
	[SoftwarePackage24] [nvarchar](255) NULL,
	[SoftwarePackage25] [nvarchar](255) NULL,
	[SoftwarePackage26] [nvarchar](255) NULL,
	[SoftwarePackage27] [nvarchar](255) NULL,
	[SoftwarePackage28] [nvarchar](255) NULL,
	[SoftwarePackage29] [nvarchar](255) NULL,
	[SoftwarePackage30] [nvarchar](255) NULL,
	[SoftwarePackage31] [nvarchar](255) NULL,
	[SoftwarePackage32] [nvarchar](255) NULL,
	[SoftwarePackage33] [nvarchar](255) NULL,
	[SoftwarePackage34] [nvarchar](255) NULL,
	[SoftwarePackage35] [nvarchar](255) NULL,
	[SoftwarePackage36] [nvarchar](255) NULL,
	[SoftwarePackage37] [nvarchar](255) NULL,
	[SoftwarePackage38] [nvarchar](255) NULL,
	[SoftwarePackage39] [nvarchar](255) NULL,
	[SoftwarePackage40] [nvarchar](255) NULL,
	[SoftwarePackage41] [nvarchar](255) NULL,
	[SoftwarePackage42] [nvarchar](255) NULL,
	[SoftwarePackage43] [nvarchar](255) NULL,
	[SoftwarePackage44] [nvarchar](255) NULL,
	[SoftwarePackage45] [nvarchar](255) NULL,
	[SoftwarePackage46] [nvarchar](255) NULL,
	[SoftwarePackage47] [nvarchar](255) NULL,
	[SoftwarePackage48] [nvarchar](255) NULL,
	[SoftwarePackage49] [nvarchar](255) NULL,
	[SoftwarePackage50] [nvarchar](255) NULL
) 


**************************/

