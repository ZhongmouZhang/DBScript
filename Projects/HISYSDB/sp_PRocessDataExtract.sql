 USE [HISYSDB]

GO

/****** Object:  StoredProcedure [dbo].[sp_ProcessDataExtract]    Script Date: 09/03/2008 14:23:36 ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

 

ALTER PROCEDURE [dbo].[sp_ProcessDataExtract]
AS
EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_Configuration" queryout G:\HaisysExport\c_Configuration.txt -c -T -x -S VPNGSQA01\IPNGSQA01 -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_User" queryout G:\HaisysExport\c_User.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_ChartRisk" queryout G:\HaisysExport\h_ChartRisk.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_FileStatus" queryout G:\HaisysExport\h_FileStatus.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "EXEC [HISYSDB].[dbo].[sp_Export_h_Encounter]" queryout G:\HaisysExport\h_Encounter.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_HSDA" queryout G:\HaisysExport\c_HSDA.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_ChartPDR" queryout G:\HaisysExport\h_ChartPDR.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_TestSource" queryout G:\HaisysExport\c_TestSource.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_ProvinceCountry" queryout G:\HaisysExport\c_ProvinceCountry.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_HIVStage" queryout G:\HaisysExport\c_HIVStage.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_EndemicCountry" queryout G:\HaisysExport\c_EndemicCountry.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterHIVSurveillance" queryout G:\HaisysExport\h_EncounterHIVSurveillance.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterHIVOrderingTest" queryout G:\HaisysExport\h_EncounterHIVOrderingTest.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterReason" queryout G:\HaisysExport\h_EncounterReason.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_STDRegion" queryout G:\HaisysExport\c_STDRegion.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

--EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_PostalCode" queryout G:\HaisysExport\c_PostalCode.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

--
EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterAIDSEncounterStatus" queryout G:\HaisysExport\h_EncounterAIDSEncounterStatus.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_ImportLog" queryout G:\HaisysExport\h_ImportLog.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_Physician" queryout G:\HaisysExport\c_Physician.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterAIDSPhysician" queryout G:\HaisysExport\h_EncounterAIDSPhysician.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterTransfer" queryout G:\HaisysExport\h_EncounterTransfer.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterHIVAdministration" queryout G:\HaisysExport\h_EncounterHIVAdministration.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_POCKit" queryout G:\HaisysExport\c_POCKit.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_Test" queryout G:\HaisysExport\c_Test.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_Clinic" queryout G:\HaisysExport\c_Clinic.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_HCPType" queryout G:\HaisysExport\c_HCPType.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterHIVTracking" queryout G:\HaisysExport\h_EncounterHIVTracking.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterHIVLabResult" queryout G:\HaisysExport\h_EncounterHIVLabResult.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_TestType" queryout G:\HaisysExport\c_TestType.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_Access" queryout G:\HaisysExport\c_Access.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_ReasonForTest" queryout G:\HaisysExport\c_ReasonForTest.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterFileStatus" queryout G:\HaisysExport\h_EncounterFileStatus.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_Risk" queryout G:\HaisysExport\c_Risk.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

--EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_RawImport" queryout G:\HaisysExport\h_RawImport.txt -c -T -x -S VPNGSQA01\IPNGSQA01'
--
EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_AIDSIndicativeDisease" queryout G:\HaisysExport\c_AIDSIndicativeDisease.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "EXEC [HISYSDB].[dbo].[sp_Export_h_Chart]" queryout G:\HaisysExport\h_Chart.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_Testinptions" queryout G:\HaisysExport\c_Testinptions.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

--EXEC master.dbo.xp_cmdshell 'bcp "SELECT ContactId,Address,CityId,PostalCode,Phone FROM HISYSDB.dbo.h_Contact" queryout G:\HaisysExport\h_Contact.txt -c -T -x -S VPNGSQA01\IPNGSQA01'
--
EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_ChartNote" queryout G:\HaisysExport\h_ChartNote.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_ChartConsent" queryout G:\HaisysExport\h_ChartConsent.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_LHA" queryout G:\HaisysExport\c_LHA.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

--EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_PostalCityHsda" queryout G:\HaisysExport\c_PostalCityHsda.txt -c -T -x -S VPNGSQA01\IPNGSQA01'
--
EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_UserPreference" queryout G:\HaisysExport\c_UserPreference.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterHIVLabTestResult" queryout G:\HaisysExport\h_EncounterHIVLabTestResult.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterHIVTestingHistory" queryout G:\HaisysExport\h_EncounterHIVTestingHistory.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterHIVPointOfCare" queryout G:\HaisysExport\h_EncounterHIVPointOfCare.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterAIDSDiagnosis" queryout G:\HaisysExport\h_EncounterAIDSDiagnosis.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_Gender" queryout G:\HaisysExport\c_Gender.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_VitalStatus" queryout G:\HaisysExport\c_VitalStatus.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_FileStatusTransition" queryout G:\HaisysExport\h_FileStatusTransition.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_City" queryout G:\HaisysExport\c_City.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_Province" queryout G:\HaisysExport\c_Province.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_Ethnicity" queryout G:\HaisysExport\c_Ethnicity.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.h_EncounterHIVPartnerInformation" queryout G:\HaisysExport\h_EncounterHIVPartnerInformation.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_Country" queryout G:\HaisysExport\c_Country.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_EncounterType" queryout G:\HaisysExport\c_EncounterType.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_EncounterReason" queryout G:\HaisysExport\c_EncounterReason.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_EncounterDiagnosis" queryout G:\HaisysExport\c_EncounterDiagnosis.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_FileStatus" queryout G:\HaisysExport\c_FileStatus.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_Role" queryout G:\HaisysExport\c_Role.txt -c -T -x -S VPNGSQA01\IPNGSQA01'

EXEC master.dbo.xp_cmdshell 'bcp "SELECT * FROM HISYSDB.dbo.c_EncounterStatus" queryout G:\HaisysExport\c_EncounterStatus.txt -c -T -x -S VPNGSQA01\IPNGSQA01'
