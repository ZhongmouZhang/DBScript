RESTORE DATABASE [AIS3] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_AIS3_Adhoc_20120227_111400.bak' WITH  FILE = 1,  MOVE N'AIS3' TO N'H:\SQL_Data\AIS3.mdf',  MOVE N'AIS3_log' TO N'I:\SQL_Log\AIS3.LDF',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [APLink] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_APLink_Adhoc_20120227_111400.bak' WITH  FILE = 1,  MOVE N'APLink' TO N'H:\SQL_Data\APLink.mdf',  MOVE N'APLink_log' TO N'I:\SQL_Log\APLink.LDF',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [Cerner_WTS_NonProd] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_Cerner_WTS_NonProd_Adhoc_20120227_111400.bak' WITH  FILE = 1,  MOVE N'Cerner_WTS_NonProd' TO N'H:\SQL_Data\Cerner_WTS_NonProd.mdf',  MOVE N'Cerner_WTS_NonProd_log' TO N'I:\SQL_Log\Cerner_WTS_NonProd.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [Cerner_WTS_Prod] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_Cerner_WTS_Prod_Adhoc_20120227_111400.bak' WITH  FILE = 1,  MOVE N'Cerner_WTS_Prod' TO N'H:\SQL_Data\Cerner_WTS_Prod.mdf',  MOVE N'Cerner_WTS_Prod_log' TO N'I:\SQL_Log\Cerner_WTS_Prod.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [Citrix _PHSA_PS45_DS] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_Citrix _PHSA_PS45_DS_Adhoc_20120227_111400.bak' WITH  FILE = 1,  MOVE N'Citrix _PHSA_PS45_DS' TO N'H:\SQL_Data\Citrix _PHSA_PS45_DS.mdf',  MOVE N'Citrix _PHSA_PS45_DS_log' TO N'I:\SQL_Log\Citrix _PHSA_PS45_DS.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [Citrix_EdgeSight] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_Citrix_EdgeSight_Adhoc_20120227_111400.bak' WITH  FILE = 1,  MOVE N'Citrix_EdgeSight_Data' TO N'H:\SQL_Data\Citrix_EdgeSight.mdf',  MOVE N'Citrix_EdgeSight_FG1_Data' TO N'H:\SQL_Data\Citrix_EdgeSight.ndf',  MOVE N'Citrix_EdgeSight_FG2_Data' TO N'H:\SQL_Data\Citrix_EdgeSight.ndf',  MOVE N'Citrix_EdgeSight_FG3_Data' TO N'H:\SQL_Data\Citrix_EdgeSight.ndf',  MOVE N'Citrix_EdgeSight_FG4_Data' TO N'H:\SQL_Data\Citrix_EdgeSight.ndf',  MOVE N'Citrix_EdgeSight_FG5_Data' TO N'H:\SQL_Data\Citrix_EdgeSight.ndf',  MOVE N'Citrix_EdgeSight_FG6_Data' TO N'H:\SQL_Data\Citrix_EdgeSight.ndf',  MOVE N'Citrix_EdgeSight_FG7_Data' TO N'H:\SQL_Data\Citrix_EdgeSight.ndf',  MOVE N'Citrix_EdgeSight_Log' TO N'I:\SQL_Log\Citrix_EdgeSight.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixDS_Cerner_45_NonProd] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixDS_Cerner_45_NonProd_Adhoc_20120227_112100.bak' WITH  FILE = 1,  MOVE N'CitrixDS_Cerner_45_NonProd' TO N'H:\SQL_Data\CitrixDS_Cerner_45_NonProd.mdf',  MOVE N'CitrixDS_Cerner_45_NonProd_log' TO N'I:\SQL_Log\CitrixDS_Cerner_45_NonProd.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixDS_Cerner_45_Prod] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixDS_Cerner_45_Prod_Adhoc_20120227_112100.bak' WITH  FILE = 1,  MOVE N'CitrixDS_Cerner_45_Prod' TO N'H:\SQL_Data\CitrixDS_Cerner_45_Prod.mdf',  MOVE N'CitrixDS_Cerner_45_Prod_log' TO N'I:\SQL_Log\CitrixDS_Cerner_45_Prod.ldf',  NOUNLOAD,  STATS = 10
GO


RESTORE DATABASE [CitrixDS_Cerner_NonProd] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixDS_Cerner_NonProd_Adhoc_20120227_112100.bak' WITH  FILE = 1,  MOVE N'CitrixDS_Cerner_NonProd' TO N'H:\SQL_Data\CitrixDS_Cerner_NonProd.mdf',  MOVE N'CitrixDS_Cerner_NonProd_log' TO N'I:\SQL_Log\CitrixDS_Cerner_NonProd.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixDS_Cerner_Prod] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixDS_Cerner_Prod_Adhoc_20120227_112100.bak' WITH  FILE = 1,  MOVE N'CitrixDS_Cerner_Prod' TO N'H:\SQL_Data\CitrixDS_Cerner_Prod.mdf',  MOVE N'CitrixDS_Cerner_Prod_log' TO N'I:\SQL_Log\CitrixDS_Cerner_Prod.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixDS_PHSA_40_Prod] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixDS_PHSA_40_Prod_Adhoc_20120227_112100.bak' WITH  FILE = 1,  MOVE N'CitrixDS_PHSA_40_Prod' TO N'H:\SQL_Data\CitrixDS_PHSA_40_Prod.mdf',  MOVE N'CitrixDS_PHSA_40_Prod_log' TO N'I:\SQL_Log\CitrixDS_PHSA_40_Prod.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixDS_PHSA_40_Test] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixDS_PHSA_40_Test_Adhoc_20120227_112100.bak' WITH  FILE = 1,  MOVE N'CitrixDS_PHSA_40_Test' TO N'H:\SQL_Data\CitrixDS_PHSA_40_Test.mdf',  MOVE N'CitrixDS_PHSA_40_Test_log' TO N'I:\SQL_Log\CitrixDS_PHSA_40_Test.ldf',  NOUNLOAD,  STATS = 10
GO


RESTORE DATABASE [CitrixDS_PS40_Prod] 
FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixDS_PS40_Prod_Adhoc_20120227_112100.bak' 
WITH  FILE = 1,  MOVE N'CitrixDS_PS40_Prod' TO N'H:\SQL_Data\CitrixDS_PS40_Prod.mdf',  
MOVE N'CitrixDS_PS40_Prod_log' TO N'I:\SQL_Log\CitrixDS_PS40_Prod_1.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixDS_PS45_Prod] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixDS_PS45_Prod_Adhoc_20120227_112100.bak' WITH  FILE = 1,  MOVE N'CitrixDS_PS45_Prod' TO N'H:\SQL_Data\CitrixDS_PS45_Prod.mdf',  MOVE N'CitrixDS_PS45_Prod_log' TO N'I:\SQL_Log\CitrixDS_PS45_Prod.ldf',  NOUNLOAD,  STATS = 10
GO


RESTORE DATABASE [CitrixDS_Varian_45_Test] 
FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixDS_Varian_45_Test_Adhoc_20120227_112100.bak' 
WITH  FILE = 1,  MOVE N'CitrixDS_Varian_45_Test' TO N'H:\SQL_Data\CitrixDS_Varian_45_Test.mdf',  
MOVE N'CitrixDS_Varian_45_Test_log' TO N'I:\SQL_Log\CitrixDS_Varian_45_Test_1.ldf',  NOUNLOAD,  STATS = 10
GO


RESTORE DATABASE [CitrixLog_Cerner_45_NonProd] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixLog_Cerner_45_NonProd_Adhoc_20120227_112100.bak' WITH  FILE = 1,  MOVE N'CitrixLog_Cerner_45_NonProd' TO N'H:\SQL_Data\CitrixLog_Cerner_45_NonProd.mdf',  MOVE N'CitrixLog_Cerner_45_NonProd_log' TO N'I:\SQL_Log\CitrixLog_Cerner_45_NonProd_1.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixLog_Cerner_45_Prod] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixLog_Cerner_45_Prod_Adhoc_20120227_112100.bak' WITH  FILE = 1,  MOVE N'CitrixLog_Cerner_45_Prod' TO N'H:\SQL_Data\CitrixLog_Cerner_45_Prod.mdf',  MOVE N'CitrixLog_Cerner_45_Prod_log' TO N'I:\SQL_Log\CitrixLog_Cerner_45_Prod_1.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixLog_Varian_45_Test] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixLog_Varian_45_Test_Adhoc_20120227_112200.bak' WITH  FILE = 1,  MOVE N'CitrixLog_Varian_45_Test' TO N'H:\SQL_Data\CitrixLog_Varian_45_Test.mdf',  MOVE N'CitrixLog_Varian_45_Test_log' TO N'I:\SQL_Log\CitrixLog_Varian_45_Test_1.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixRM_Cerner_45_NonProd] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixRM_Cerner_45_NonProd_Adhoc_20120227_112200.bak' WITH  FILE = 1,  MOVE N'CitrixRM_Cerner_45_NonProd' TO N'H:\SQL_Data\CitrixRM_Cerner_45_NonProd.mdf',  MOVE N'CitrixRM_Cerner_45_NonProd_log' TO N'I:\SQL_Log\CitrixRM_Cerner_45_NonProd_1.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixRM_Cerner_45_Prod] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixRM_Cerner_45_Prod_Adhoc_20120227_112200.bak' WITH  FILE = 1,  MOVE N'CitrixRM_Cerner_45_Prod' TO N'H:\SQL_Data\CitrixRM_Cerner_45_Prod.mdf',  MOVE N'CitrixRM_Cerner_45_Prod_log' TO N'I:\SQL_Log\CitrixRM_Cerner_45_Prod_1.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixRM_Cerner_NonProd] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixRM_Cerner_NonProd_Adhoc_20120227_112200.bak' WITH  FILE = 1,  MOVE N'CitrixRM_Cerner_NonProd' TO N'H:\SQL_Data\CitrixRM_Cerner_NonProd.mdf',  MOVE N'CitrixRM_Cerner_NonProd_log' TO N'I:\SQL_Log\CitrixRM_Cerner_NonProd_1.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixRM_Cerner_Prod] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixRM_Cerner_Prod_Adhoc_20120227_112200.bak' WITH  FILE = 1,  MOVE N'CitrixRM_Cerner_Prod' TO N'H:\SQL_Data\CitrixRM_Cerner_Prod.mdf',  MOVE N'CitrixRM_Cerner_Prod_log' TO N'I:\SQL_Log\CitrixRM_Cerner_Prod_1.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixRM_PHSA_40_Prod] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixRM_PHSA_40_Prod_Adhoc_20120227_112200.bak' WITH  FILE = 1,  MOVE N'CitrixRM_PHSA_40_Prod' TO N'H:\SQL_Data\CitrixRM_PHSA_40_Prod.mdf',  MOVE N'CitrixRM_PHSA_40_Prod_log' TO N'I:\SQL_Log\CitrixRM_PHSA_40_Prod_1.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixRM_PHSA_40_Test] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixRM_PHSA_40_Test_Adhoc_20120227_112200.bak' WITH  FILE = 1,  MOVE N'CitrixRM_PHSA_40_Test' TO N'H:\SQL_Data\CitrixRM_PHSA_40_Test.mdf',  MOVE N'CitrixRM_PHSA_40_Test_log' TO N'I:\SQL_Log\CitrixRM_PHSA_40_Test_1.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [CitrixRM_PS40_Prod] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixRM_PS40_Prod_Adhoc_20120227_112200.bak' WITH  FILE = 1,  MOVE N'CitrixRM_PS40_Prod' TO N'H:\SQL_Data\CitrixRM_PS40_Prod.mdf',  MOVE N'CitrixRM_PS40_Prod_log' TO N'I:\SQL_Log\CitrixRM_PS40_Prod_1.ldf',  NOUNLOAD,  STATS = 10
GO


RESTORE DATABASE [CitrixRM_PS45_Prod] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_CitrixRM_PS45_Prod_Adhoc_20120227_112200.bak' WITH  FILE = 1,  MOVE N'CitrixRM_PS45_Prod' TO N'H:\SQL_Data\CitrixRM_PS45_Prod.mdf',  MOVE N'CitrixRM_PS45_Prod_log' TO N'I:\SQL_Log\CitrixRM_PS45_Prod_1.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [DIA] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_DIA_Adhoc_20120227_112700.bak' WITH  FILE = 1,  MOVE N'DIA' TO N'H:\SQL_Data\DIA.mdf',  MOVE N'DIA_log' TO N'I:\SQL_Log\DIA_1.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [EMPI] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_EMPI_Adhoc_20120227_112700.bak' WITH  FILE = 1,  MOVE N'EMPI_Data_1' TO N'H:\SQL_Data\EMPI_1.mdf',  MOVE N'EMPI_Data_3' TO N'H:\SQL_Data\EMPI_3.mdf',  MOVE N'EMPI_Log_1' TO N'I:\SQL_Log\EMPI_log_1.ldf',  NOUNLOAD,  STATS = 10
GO


RESTORE DATABASE [IWAY_PRD] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_IWAY_PRD_Adhoc_20120227_112700.bak' WITH  FILE = 1,  MOVE N'iway_stg' TO N'H:\SQL_Data\IWAY_PRD.mdf',  MOVE N'iway_stg_log' TO N'I:\SQL_Log\IWAY_PRD_1.LDF',  NOUNLOAD,  STATS = 10
GO


RESTORE DATABASE [Pilot_Reporting] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_Pilot_Reporting_Adhoc_20120227_112700.bak' WITH  FILE = 1,  MOVE N'Pilot_Reporting' TO N'H:\SQL_Data\Pilot_Reporting.mdf',  MOVE N'Pilot_Reporting_log' TO N'I:\SQL_Log\Pilot_Reporting_1.ldf',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [ReportServer] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_ReportServer_Adhoc_20120227_112700.bak' WITH  FILE = 1,  MOVE N'ReportServer' TO N'H:\SQL_Data\ReportServer.mdf',  MOVE N'ReportServer_log' TO N'I:\SQL_Log\ReportServer_1.LDF',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [ReportServerTempDB] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_ReportServerTempDB_Adhoc_20120227_112700.bak' WITH  FILE = 1,  MOVE N'ReportServerTempDB' TO N'H:\SQL_Data\ReportServerTempDB.mdf',  MOVE N'ReportServerTempDB_log' TO N'I:\SQL_Log\ReportServerTempDB_1.LDF',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [SOFTRICITY] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_SOFTRICITY_Adhoc_20120227_112700.bak' WITH  FILE = 1,  MOVE N'SOFTRICITY' TO N'H:\SQL_Data\SOFTRICITY.mdf',  MOVE N'SOFTRICITY_log' TO N'I:\SQL_Log\SOFTRICITY_1.LDF',  NOUNLOAD,  STATS = 10
GO

RESTORE DATABASE [TMSNG] FROM  DISK = N'K:\Restore\VSQ2K5_ISQ2K5_TMSNG_Adhoc_20120227_112800.bak' WITH  FILE = 1,  MOVE N'TMSNG' TO N'H:\SQL_Data\TMSNG.mdf',  MOVE N'TMSNG_log' TO N'I:\SQL_Log\TMSNG_1.ldf',  NOUNLOAD,  STATS = 10
GO





