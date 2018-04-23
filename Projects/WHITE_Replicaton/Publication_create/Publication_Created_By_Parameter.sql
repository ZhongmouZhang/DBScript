

declare @p_dbname varchar(64)
declare @p_name varchar(256)
declare @log_reader_account varchar(256)
declare @log_reader_account_pwd varchar(256)
declare @snapshot_account varchar(256)
declare @snapshot_account_pwd varchar(256)
declare @stt varchar(4000)

/*****************************************
set @p_dbname = 'BCEHS_WHITE3'
set @p_name = 'publication_white_BCEHS_UAT'
set @log_reader_account = 'PHSABC\svcSPDBSWHT001LogRdr'
set @log_reader_account_pwd = '6Qg#A2$PcHJrPPGQhxzM'
set @snapshot_account = 'PHSABC\svcSPDBSWHT001SnpSht'
set @snapshot_account_pwd = 'M$7QjC4pXV#pcAH4w4XT'

*********************/

set @p_dbname = 'FHA_WHITE3'
set @p_name = 'publication_white_FHA_UAT'
set @log_reader_account = 'PHSABC\SVC_SPDBWHTDIST_LgRd'
set @log_reader_account_pwd = 'Z30Lf)nE2Yj1&u)UXdV65NT*(q2PXxhJ)OKfjju^'
set @snapshot_account = 'PHSABC\SVC_SPDBWHTDIST_SnpS'
set @snapshot_account_pwd = '^!YkbwArWEF)Yz2HjCh8fwY0Y0Q^g^ohF2yTeaox'


-- Enabling the replication database
set @stt = 'use master; exec sp_replicationdboption @dbname = N''' + @p_dbname + ''', @optname = N''publish'', @value = N''true'''
exec (@stt)


set @stt = 'use ' + @p_dbname + '; exec sp_addlogreader_agent @job_login = N''' + @log_reader_account + ''', @job_password = N''' 
		+ @log_reader_account_pwd + ''', @publisher_security_mode = 1'
exec (@stt)


-- Adding the transactional publication
set @stt = 'use ' + @p_dbname + '; exec sp_addpublication @publication = N''' + @p_name + ''',  
@description = N''Transactional publication'', 
@sync_method = N''concurrent'', @retention = 0, @allow_push = N''true'', @allow_pull = N''true'', @allow_anonymous = N''true'', 
@enabled_for_internet = N''false'', @snapshot_in_defaultfolder = N''true'', @compress_snapshot = N''false'', @ftp_port = 21, 
@ftp_login = N''anonymous'', @allow_subscription_copy = N''false'', @add_to_active_directory = N''false'', @repl_freq = N''continuous'', 
@status = N''active'', @independent_agent = N''true'', @immediate_sync = N''true'', @allow_sync_tran = N''false'', @autogen_sync_procs = N''false'', 
@allow_queued_tran = N''false'', @allow_dts = N''false'', @replicate_ddl = 1, @allow_initialize_from_backup = N''false'', @enabled_for_p2p = N''false'', 
@enabled_for_het_sub = N''false''; 

exec sp_addpublication_snapshot @publication = N''' + @p_name + ''', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0,
	@frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, 
	@active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0,
	@job_login = N''' + @snapshot_account + ''', @job_password = N''' + @snapshot_account_pwd + ''', @publisher_security_mode = 1'

exec (@stt)



