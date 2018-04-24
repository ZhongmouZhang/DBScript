-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'VCH_WHITE3', @optname = N'publish', @value = N'true'
GO

use VCH_WHITE3;
exec VCH_WHITE3.sys.sp_addlogreader_agent @job_login = N'VCH\svcVCHDBP02WHTLogRdr', @job_password = N'Exgm&QS3q8KFpP6GRbYJ', @publisher_security_mode = 1
GO
-- Adding the transactional publication
use VCH_WHITE3;
exec sp_addpublication @publication = N'publication_white_VCH_UAT', 
@description = N'Transactional publication of database ''VCH_WHITE3'' from Publisher ''SDDBSWHT003''.', 
@sync_method = N'concurrent', @retention = 0, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'true', 
@enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, 
@ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', 
@status = N'active', @independent_agent = N'true', @immediate_sync = N'true', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', 
@allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'false', @enabled_for_p2p = N'false', 
@enabled_for_het_sub = N'false'
GO


exec sp_addpublication_snapshot @publication = N'publication_white_VCH_UAT', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = N'VCH\svcVCHDBP02WHTSnpSht', @job_password = N'CMUihiyZ#VoXOMzM6j)z', @publisher_security_mode = 1
exec sp_grant_publication_access @publication = N'publication_white_VCH_UAT', @login = N'sa'
GO

exec sp_grant_publication_access @publication = N'publication_white_VCH_UAT', @login = N'HEALTHBC\Database Services Group (HSSBC) - (SA)'
GO
exec sp_grant_publication_access @publication = N'publication_white_VCH_UAT', @login = N'NT SERVICE\SQLSERVERAGENT'
GO
exec sp_grant_publication_access @publication = N'publication_white_VCH_UAT', @login = N'NT SERVICE\MSSQLSERVER'
GO


