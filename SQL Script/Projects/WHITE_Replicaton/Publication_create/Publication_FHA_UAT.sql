-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'white3', @optname = N'publish', @value = N'true'
GO

exec [white3].sys.sp_addlogreader_agent @job_login = N'SFHR\ATHENAsvc_WHTLgRead', @job_password = N'*dzBkvpW*Zgha$h@NO%Z', @publisher_security_mode = 1
GO
exec [white3].sys.sp_addqreader_agent @job_login = null, @job_password = null, @frompublisher = 1
GO
-- Adding the transactional publication
use [white3]
exec sp_addpublication @publication = N'publication_white_FHA_UAT', @description = N'Transactional publication of database ''White3'' from Publisher ''VMT012SQL2K5''.'
	, @sync_method = N'concurrent', @retention = 0, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'true', @enabled_for_internet = N'false'
	, @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false'
	, @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'true', @allow_sync_tran = N'false', @autogen_sync_procs = N'false'
	, @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'false', @enabled_for_p2p = N'false', @enabled_for_het_sub = N'false'
GO


exec sp_addpublication_snapshot @publication = N'publication_white_FHA_UAT', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0
	, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959
	, @active_start_date = 0, @active_end_date = 0, @job_login = N'SFHR\ATHENAsvc_WHTSnpSht', @job_password = N'mjJqX*8%TIiC5*HvAq1u', @publisher_security_mode = 1
exec sp_grant_publication_access @publication = N'publication_white_FHA_UAT', @login = N'sa'
GO
exec sp_grant_publication_access @publication = N'publication_white_FHA_UAT', @login = N'NT AUTHORITY\SYSTEM'
GO
exec sp_grant_publication_access @publication = N'publication_white_FHA_UAT', @login = N'BUILTIN\Administrators'
GO
exec sp_grant_publication_access @publication = N'publication_white_FHA_UAT', @login = N'SFHR\jtong_sa'
GO
exec sp_grant_publication_access @publication = N'publication_white_FHA_UAT', @login = N'SFHR\SR HSSBC SQL Admin (CrossHA)'
GO

