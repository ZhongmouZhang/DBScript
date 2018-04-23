exec master.dbo.xp_restore_database @database = N'LiteSpeed_Test' ,
@filename = N'G:\SQL_Restore\MOSS_Intranet_Content_VCH\MOSS_Intranet_Content_VCH_backup_LS1.bak',
@filenumber = 1,
@with = N'STATS = 10',
@with = N'MOVE N''MOSS_Intranet_Content_VCH'' TO N''E:\SQL_Data\LiteSpeed_Test.mdf''',
@with = N'MOVE N''MOSS_Intranet_Content_VCH_log'' TO N''E:\SQL_Log\LiteSpeed_Test_log.LDF''',
@affinity = 0,
@logging = 0


GO