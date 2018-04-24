/****** Scripting the replication setup of server CWAP11. Script Date: 5/29/2007 9:29:24 AM ******/
/****** Please note: Any password parameter was scripted with NULL or empty string for security reason. ******/

/****** Begin: Script to be run at Distributor: CWAP11 ******/
/****** Installing the server cwap11 as a Distributor. Script Date: 5/29/2007 9:29:24 AM ******/
use master
GO

exec sp_adddistributor  @distributor = N'cwap11', @password = N''
GO

-- Updating the agent profile defaults
sp_MSupdate_agenttype_default @profile_id = 1
GO
sp_MSupdate_agenttype_default @profile_id = 2
GO
sp_MSupdate_agenttype_default @profile_id = 4
GO
sp_MSupdate_agenttype_default @profile_id = 6
GO

-- Adding the distribution database
exec sp_adddistributiondb  @database = N'distribution', @data_folder = N'F:\MSSQL7\DATA', @data_file = N'distribution.MDF', @data_file_size = 2500, @log_folder = N'F:\MSSQL7\DATA', @log_file = N'distribution.LDF', @log_file_size = 1000, @min_distretention = 0, @max_distretention = 72, @history_retention = 48, @security_mode = 1
GO

-- Adding the distribution publisher
exec sp_adddistpublisher  @publisher = N'cwap11', @distribution_db = N'distribution', @security_mode = 0, @login = N'sa', @password = N'', @working_directory = N'\\cwap11\f$\mssql7\repldata', @trusted = N'true', @thirdparty_flag = 0
GO

/****** End: Script to be run at Distributor: CWAP11 ******/

/****** Begin: Script to be run at Publisher: CWAP11 ******/
-- Adding the registered subscriber
exec sp_addsubscriber @subscriber = N'CWAP06', @type = 0, @login = N'sa', @password = N'', @security_mode = 0, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 2, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235900, @description = N''
 exec sp_changesubscriber_schedule @subscriber = N'CWAP06', @agent_type = 1, @active_end_date = 0
GO

-- Adding the registered subscriber
exec sp_addsubscriber @subscriber = N'cwap11', @type = 0, @login = N'sa', @password = N'', @security_mode = 0, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @description = N'cwap11 subscriber'
 exec sp_changesubscriber_schedule @subscriber = N'cwap11', @agent_type = 1, @active_end_date = 0
GO

-- Adding the registered subscriber
exec sp_addsubscriber @subscriber = N'CWAP12', @type = 0, @login = N'sa', @password = N'', @security_mode = 0, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 2, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235900, @description = N'To allow CWAP12 to subscribe to CWAP11'
 exec sp_changesubscriber_schedule @subscriber = N'CWAP12', @agent_type = 1, @active_end_date = 0
GO

-- Adding the registered subscriber
exec sp_addsubscriber @subscriber = N'CWAP15', @type = 0, @security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 2, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235900, @description = N''
 exec sp_changesubscriber_schedule @subscriber = N'CWAP15', @agent_type = 1, @active_end_date = 0
GO

-- Adding the registered subscriber
exec sp_addsubscriber @subscriber = N'CWAP19', @type = 0, @security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 2, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235900, @description = N''
 exec sp_changesubscriber_schedule @subscriber = N'CWAP19', @agent_type = 1, @active_end_date = 0
GO

-- Adding the registered subscriber
exec sp_addsubscriber @subscriber = N'CWAP21', @type = 0, @login = N'sa', @password = N'', @security_mode = 0, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 2, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235900, @description = N''
 exec sp_changesubscriber_schedule @subscriber = N'CWAP21', @agent_type = 1, @active_end_date = 0
GO

-- Adding the registered subscriber
exec sp_addsubscriber @subscriber = N'cwsqltst01', @type = 0, @login = N'sa', @password = N'', @security_mode = 0, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @description = N'cwsqltst01 subscriber'
 exec sp_changesubscriber_schedule @subscriber = N'cwsqltst01', @agent_type = 1, @active_end_date = 0
GO

-- Adding the registered subscriber
exec sp_addsubscriber @subscriber = N'CWZAP02', @type = 0, @security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 2, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235900, @description = N''
 exec sp_changesubscriber_schedule @subscriber = N'CWZAP02', @agent_type = 1, @active_end_date = 0
GO

-- Adding the registered subscriber
exec sp_addsubscriber @subscriber = N'CWZAP12', @type = 0, @login = N'sa', @password = N'', @security_mode = 0, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 2, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235900, @description = N''
 exec sp_changesubscriber_schedule @subscriber = N'CWZAP12', @agent_type = 1, @active_end_date = 0
GO

-- Adding the registered subscriber
exec sp_addsubscriber @subscriber = N'VSQLA02\ISQA02', @type = 0, @security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 2, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235900, @description = N''
 exec sp_changesubscriber_schedule @subscriber = N'VSQLA02\ISQA02', @agent_type = 1, @active_end_date = 0
GO

-- Enabling the replication database
use master
GO

exec sp_replicationdboption @dbname = N'comet', @optname = N'publish', @value = N'true'
GO

use [comet]
GO

-- Adding the transactional publication
exec sp_addpublication @publication = N'comet_cwap12_comet1', @restricted = N'false', @sync_method = N'native', @repl_freq = N'continuous', @description = N'Transactional publication of comet database from Publisher CWAP11.', @status = N'active', @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @independent_agent = N'false', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @retention = 72
exec sp_addpublication_snapshot @publication = N'comet_cwap12_comet1',@frequency_type = 4, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959
GO

exec sp_grant_publication_access @publication = N'comet_cwap12_comet1', @login = N'BUILTIN\Administrators'
GO
exec sp_grant_publication_access @publication = N'comet_cwap12_comet1', @login = N'CWBC\sqladmin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap12_comet1', @login = N'distributor_admin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap12_comet1', @login = N'sa'
GO

-- Adding the transactional articles
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'admit_source_codes', @source_owner = N'dbo', @source_object = N'admit_source_codes', @destination_table = N'admit_source_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_admit_source_codes', @del_cmd = N'CALL sp_MSdel_admit_source_codes', @upd_cmd = N'MCALL sp_MSupd_admit_source_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'admit_type_codes', @source_owner = N'dbo', @source_object = N'admit_type_codes', @destination_table = N'admit_type_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_admit_type_codes', @del_cmd = N'CALL sp_MSdel_admit_type_codes', @upd_cmd = N'MCALL sp_MSupd_admit_type_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'admitting_privilege_codes', @source_owner = N'dbo', @source_object = N'admitting_privilege_codes', @destination_table = N'admitting_privilege_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_admitting_privilege_codes', @del_cmd = N'CALL sp_MSdel_admitting_privilege_codes', @upd_cmd = N'MCALL sp_MSupd_admitting_privilege_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'clinician_licenses', @source_owner = N'dbo', @source_object = N'clinician_licenses', @destination_table = N'clinician_licenses', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_licenses', @del_cmd = N'CALL sp_MSdel_clinician_licenses', @upd_cmd = N'MCALL sp_MSupd_clinician_licenses', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'clinician_service_codes', @source_owner = N'dbo', @source_object = N'clinician_service_codes', @destination_table = N'clinician_service_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_service_codes', @del_cmd = N'CALL sp_MSdel_clinician_service_codes', @upd_cmd = N'MCALL sp_MSupd_clinician_service_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'clinician_specialties', @source_owner = N'dbo', @source_object = N'clinician_specialties', @destination_table = N'clinician_specialties', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_specialties', @del_cmd = N'CALL sp_MSdel_clinician_specialties', @upd_cmd = N'MCALL sp_MSupd_clinician_specialties', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'clinician_specialty_codes', @source_owner = N'dbo', @source_object = N'clinician_specialty_codes', @destination_table = N'clinician_specialty_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_specialty_codes', @del_cmd = N'CALL sp_MSdel_clinician_specialty_codes', @upd_cmd = N'MCALL sp_MSupd_clinician_specialty_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'clinician_status_codes', @source_owner = N'dbo', @source_object = N'clinician_status_codes', @destination_table = N'clinician_status_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_status_codes', @del_cmd = N'CALL sp_MSdel_clinician_status_codes', @upd_cmd = N'MCALL sp_MSupd_clinician_status_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'clinician_type_codes', @source_owner = N'dbo', @source_object = N'clinician_type_codes', @destination_table = N'clinician_type_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_type_codes', @del_cmd = N'CALL sp_MSdel_clinician_type_codes', @upd_cmd = N'MCALL sp_MSupd_clinician_type_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'clinicians', @source_owner = N'dbo', @source_object = N'clinicians', @destination_table = N'clinicians', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinicians', @del_cmd = N'CALL sp_MSdel_clinicians', @upd_cmd = N'MCALL sp_MSupd_clinicians', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'consulting_clinicians', @source_owner = N'dbo', @source_object = N'consulting_clinicians', @destination_table = N'consulting_clinicians', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_consulting_clinicians', @del_cmd = N'CALL sp_MSdel_consulting_clinicians', @upd_cmd = N'MCALL sp_MSupd_consulting_clinicians', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'dc_disposition_status_codes', @source_owner = N'dbo', @source_object = N'dc_disposition_status_codes', @destination_table = N'dc_disposition_status_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_dc_disposition_status_codes', @del_cmd = N'CALL sp_MSdel_dc_disposition_status_codes', @upd_cmd = N'MCALL sp_MSupd_dc_disposition_status_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'hospital_service_codes', @source_owner = N'dbo', @source_object = N'hospital_service_codes', @destination_table = N'hospital_service_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_hospital_service_codes', @del_cmd = N'CALL sp_MSdel_hospital_service_codes', @upd_cmd = N'MCALL sp_MSupd_hospital_service_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'merges', @source_owner = N'dbo', @source_object = N'merges', @destination_table = N'merges', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_merges', @del_cmd = N'CALL sp_MSdel_merges', @upd_cmd = N'MCALL sp_MSupd_merges', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'next_of_kin', @source_owner = N'dbo', @source_object = N'next_of_kin', @destination_table = N'next_of_kin', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_next_of_kin', @del_cmd = N'CALL sp_MSdel_next_of_kin', @upd_cmd = N'MCALL sp_MSupd_next_of_kin', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'nok_relationship_codes', @source_owner = N'dbo', @source_object = N'nok_relationship_codes', @destination_table = N'nok_relationship_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_nok_relationship_codes', @del_cmd = N'CALL sp_MSdel_nok_relationship_codes', @upd_cmd = N'MCALL sp_MSupd_nok_relationship_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'patient_class_codes', @source_owner = N'dbo', @source_object = N'patient_class_codes', @destination_table = N'patient_class_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patient_class_codes', @del_cmd = N'CALL sp_MSdel_patient_class_codes', @upd_cmd = N'MCALL sp_MSupd_patient_class_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'patient_type_codes', @source_owner = N'dbo', @source_object = N'patient_type_codes', @destination_table = N'patient_type_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patient_type_codes', @del_cmd = N'CALL sp_MSdel_patient_type_codes', @upd_cmd = N'MCALL sp_MSupd_patient_type_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'patients', @source_owner = N'dbo', @source_object = N'patients', @destination_table = N'patients', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patients', @del_cmd = N'CALL sp_MSdel_patients', @upd_cmd = N'MCALL sp_MSupd_patients', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'vip_indicator_codes', @source_owner = N'dbo', @source_object = N'vip_indicator_codes', @destination_table = N'vip_indicator_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_vip_indicator_codes', @del_cmd = N'CALL sp_MSdel_vip_indicator_codes', @upd_cmd = N'MCALL sp_MSupd_vip_indicator_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap12_comet1', @article = N'visits', @source_owner = N'dbo', @source_object = N'visits', @destination_table = N'visits', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_visits', @del_cmd = N'CALL sp_MSdel_visits', @upd_cmd = N'MCALL sp_MSupd_visits', @filter = null, @sync_object = null
GO

-- Adding the transactional subscription
exec sp_addsubscription @publication = N'comet_cwap12_comet1', @article = N'all', @subscriber = N'cwap12', @destination_db = N'comet1', @sync_type = N'automatic', @update_mode = N'read only'
GO

use [comet]
GO

-- Adding the transactional publication
exec sp_addpublication @publication = N'comet_cwap15_anes', @restricted = N'false', @sync_method = N'native', @repl_freq = N'continuous', @description = N'Transactional publication of comet database from Publisher CWAP11.', @status = N'active', @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @independent_agent = N'false', @immediate_sync = N'false', @allow_sync_tran = N'true', @autogen_sync_procs = N'true', @retention = 72
exec sp_addpublication_snapshot @publication = N'comet_cwap15_anes',@frequency_type = 4, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959
GO

exec sp_grant_publication_access @publication = N'comet_cwap15_anes', @login = N'BUILTIN\Administrators'
GO
exec sp_grant_publication_access @publication = N'comet_cwap15_anes', @login = N'CWBC\sqladmin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap15_anes', @login = N'distributor_admin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap15_anes', @login = N'sa'
GO

-- Adding the transactional articles
exec sp_addarticle @publication = N'comet_cwap15_anes', @article = N'patients', @source_owner = N'dbo', @source_object = N'patients', @destination_table = N'tblPatients', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patients', @del_cmd = N'CALL sp_MSdel_patients', @upd_cmd = N'MCALL sp_MSupd_patients', @filter = null, @sync_object = null
GO

use [comet]
GO

-- Adding the transactional publication
exec sp_addpublication @publication = N'comet_cwap15_bcchmh', @restricted = N'false', @sync_method = N'native', @repl_freq = N'continuous', @description = N'Transactional publication of comet database from Publisher CWAP11.', @status = N'active', @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @independent_agent = N'false', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @retention = 72
exec sp_addpublication_snapshot @publication = N'comet_cwap15_bcchmh',@frequency_type = 4, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959
GO

exec sp_grant_publication_access @publication = N'comet_cwap15_bcchmh', @login = N'BUILTIN\Administrators'
GO
exec sp_grant_publication_access @publication = N'comet_cwap15_bcchmh', @login = N'CWBC\sqladmin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap15_bcchmh', @login = N'distributor_admin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap15_bcchmh', @login = N'sa'
GO

-- Adding the transactional articles
exec sp_addarticle @publication = N'comet_cwap15_bcchmh', @article = N'clinician_status_codes', @source_owner = N'dbo', @source_object = N'clinician_status_codes', @destination_table = N'adtClinician_status_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_status_codes', @del_cmd = N'CALL sp_MSdel_clinician_status_codes', @upd_cmd = N'MCALL sp_MSupd_clinician_status_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap15_bcchmh', @article = N'clinicians', @source_owner = N'dbo', @source_object = N'clinicians', @destination_table = N'adtClinicians', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinicians', @del_cmd = N'CALL sp_MSdel_clinicians', @upd_cmd = N'MCALL sp_MSupd_clinicians', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap15_bcchmh', @article = N'merges', @source_owner = N'dbo', @source_object = N'merges', @destination_table = N'adtMerges', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_merges', @del_cmd = N'CALL sp_MSdel_merges', @upd_cmd = N'MCALL sp_MSupd_merges', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap15_bcchmh', @article = N'patients', @source_owner = N'dbo', @source_object = N'patients', @destination_table = N'adtPatients', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patients', @del_cmd = N'CALL sp_MSdel_patients', @upd_cmd = N'MCALL sp_MSupd_patients', @filter = null, @sync_object = null
GO

-- Adding the transactional subscription
exec sp_addsubscription @publication = N'comet_cwap15_bcchmh', @article = N'all', @subscriber = N'CWAP15', @destination_db = N'bcchmh', @sync_type = N'automatic', @update_mode = N'read only'
GO

use [comet]
GO

-- Adding the transactional publication
exec sp_addpublication @publication = N'comet_cwap15_oncology', @restricted = N'false', @sync_method = N'native', @repl_freq = N'continuous', @description = N'Transactional publication of comet database from Publisher CWAP11.', @status = N'active', @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @independent_agent = N'false', @immediate_sync = N'false', @allow_sync_tran = N'true', @autogen_sync_procs = N'true', @retention = 72
exec sp_addpublication_snapshot @publication = N'comet_cwap15_oncology',@frequency_type = 4, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959
GO

exec sp_grant_publication_access @publication = N'comet_cwap15_oncology', @login = N'BUILTIN\Administrators'
GO
exec sp_grant_publication_access @publication = N'comet_cwap15_oncology', @login = N'CWBC\sqladmin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap15_oncology', @login = N'distributor_admin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap15_oncology', @login = N'sa'
GO

-- Adding the transactional articles
exec sp_addarticle @publication = N'comet_cwap15_oncology', @article = N'merges', @source_owner = N'dbo', @source_object = N'merges', @destination_table = N'tblmerges', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @destination_owner = N'dbo', @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_merges', @del_cmd = N'CALL sp_MSdel_merges', @upd_cmd = N'MCALL sp_MSupd_merges', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap15_oncology', @article = N'patients', @source_owner = N'dbo', @source_object = N'patients', @destination_table = N'tblpatient', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @destination_owner = N'dbo', @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patients', @del_cmd = N'CALL sp_MSdel_patients', @upd_cmd = N'MCALL sp_MSupd_patients', @filter = null, @sync_object = null
GO

-- Adding the transactional subscription
exec sp_addsubscription @publication = N'comet_cwap15_oncology', @article = N'all', @subscriber = N'CWAP15', @destination_db = N'Oncology', @sync_type = N'automatic', @update_mode = N'read only'
GO

-- Adding the transactional subscription
exec sp_addsubscription @publication = N'comet_cwap15_oncology', @article = N'all', @subscriber = N'CWAP15', @destination_db = N'scn', @sync_type = N'automatic', @update_mode = N'read only'
GO

use [comet]
GO

-- Adding the transactional publication
exec sp_addpublication @publication = N'comet_cwap15_tmladt', @restricted = N'false', @sync_method = N'native', @repl_freq = N'continuous', @description = N'Transactional publication of comet database from Publisher CWAP11.', @status = N'active', @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @independent_agent = N'false', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @retention = 72
exec sp_addpublication_snapshot @publication = N'comet_cwap15_tmladt',@frequency_type = 4, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959
GO

exec sp_grant_publication_access @publication = N'comet_cwap15_tmladt', @login = N'BUILTIN\Administrators'
GO
exec sp_grant_publication_access @publication = N'comet_cwap15_tmladt', @login = N'CWBC\sqladmin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap15_tmladt', @login = N'distributor_admin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap15_tmladt', @login = N'sa'
GO

-- Adding the transactional articles
exec sp_addarticle @publication = N'comet_cwap15_tmladt', @article = N'merges', @source_owner = N'dbo', @source_object = N'merges', @destination_table = N'merges', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_merges', @del_cmd = N'CALL sp_MSdel_merges', @upd_cmd = N'MCALL sp_MSupd_merges', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap15_tmladt', @article = N'patients', @source_owner = N'dbo', @source_object = N'patients', @destination_table = N'patients', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patients', @del_cmd = N'CALL sp_MSdel_patients', @upd_cmd = N'MCALL sp_MSupd_patients', @filter = null, @sync_object = null
GO

-- Adding the transactional subscription
exec sp_addsubscription @publication = N'comet_cwap15_tmladt', @article = N'all', @subscriber = N'CWAP15', @destination_db = N'TMLADT', @sync_type = N'automatic', @update_mode = N'read only'
GO

use [comet]
GO

-- Adding the transactional publication
exec sp_addpublication @publication = N'comet_cwap19_comet', @restricted = N'false', @sync_method = N'native', @repl_freq = N'continuous', @description = N'Transactional publication of comet database from Publisher CWAP11.', @status = N'active', @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @independent_agent = N'false', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @retention = 72
exec sp_addpublication_snapshot @publication = N'comet_cwap19_comet',@frequency_type = 4, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959
GO

exec sp_grant_publication_access @publication = N'comet_cwap19_comet', @login = N'BUILTIN\Administrators'
GO
exec sp_grant_publication_access @publication = N'comet_cwap19_comet', @login = N'CWBC\sqladmin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap19_comet', @login = N'distributor_admin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap19_comet', @login = N'sa'
GO

-- Adding the transactional articles
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'admit_source_codes', @source_owner = N'dbo', @source_object = N'admit_source_codes', @destination_table = N'admit_source_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_admit_source_codes', @del_cmd = N'CALL sp_MSdel_admit_source_codes', @upd_cmd = N'MCALL sp_MSupd_admit_source_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'admit_type_codes', @source_owner = N'dbo', @source_object = N'admit_type_codes', @destination_table = N'admit_type_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_admit_type_codes', @del_cmd = N'CALL sp_MSdel_admit_type_codes', @upd_cmd = N'MCALL sp_MSupd_admit_type_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'admitting_privilege_codes', @source_owner = N'dbo', @source_object = N'admitting_privilege_codes', @destination_table = N'admitting_privilege_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_admitting_privilege_codes', @del_cmd = N'CALL sp_MSdel_admitting_privilege_codes', @upd_cmd = N'MCALL sp_MSupd_admitting_privilege_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'clinician_licenses', @source_owner = N'dbo', @source_object = N'clinician_licenses', @destination_table = N'clinician_licenses', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_licenses', @del_cmd = N'CALL sp_MSdel_clinician_licenses', @upd_cmd = N'MCALL sp_MSupd_clinician_licenses', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'clinician_service_codes', @source_owner = N'dbo', @source_object = N'clinician_service_codes', @destination_table = N'clinician_service_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_service_codes', @del_cmd = N'CALL sp_MSdel_clinician_service_codes', @upd_cmd = N'MCALL sp_MSupd_clinician_service_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'clinician_specialties', @source_owner = N'dbo', @source_object = N'clinician_specialties', @destination_table = N'clinician_specialties', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_specialties', @del_cmd = N'CALL sp_MSdel_clinician_specialties', @upd_cmd = N'MCALL sp_MSupd_clinician_specialties', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'clinician_specialty_codes', @source_owner = N'dbo', @source_object = N'clinician_specialty_codes', @destination_table = N'clinician_specialty_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_specialty_codes', @del_cmd = N'CALL sp_MSdel_clinician_specialty_codes', @upd_cmd = N'MCALL sp_MSupd_clinician_specialty_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'clinician_status_codes', @source_owner = N'dbo', @source_object = N'clinician_status_codes', @destination_table = N'clinician_status_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_status_codes', @del_cmd = N'CALL sp_MSdel_clinician_status_codes', @upd_cmd = N'MCALL sp_MSupd_clinician_status_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'clinician_type_codes', @source_owner = N'dbo', @source_object = N'clinician_type_codes', @destination_table = N'clinician_type_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_type_codes', @del_cmd = N'CALL sp_MSdel_clinician_type_codes', @upd_cmd = N'MCALL sp_MSupd_clinician_type_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'clinicians', @source_owner = N'dbo', @source_object = N'clinicians', @destination_table = N'clinicians', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinicians', @del_cmd = N'CALL sp_MSdel_clinicians', @upd_cmd = N'MCALL sp_MSupd_clinicians', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'consulting_clinicians', @source_owner = N'dbo', @source_object = N'consulting_clinicians', @destination_table = N'consulting_clinicians', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_consulting_clinicians', @del_cmd = N'CALL sp_MSdel_consulting_clinicians', @upd_cmd = N'MCALL sp_MSupd_consulting_clinicians', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'dc_disposition_status_codes', @source_owner = N'dbo', @source_object = N'dc_disposition_status_codes', @destination_table = N'dc_disposition_status_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_dc_disposition_status_codes', @del_cmd = N'CALL sp_MSdel_dc_disposition_status_codes', @upd_cmd = N'MCALL sp_MSupd_dc_disposition_status_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'hospital_service_codes', @source_owner = N'dbo', @source_object = N'hospital_service_codes', @destination_table = N'hospital_service_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_hospital_service_codes', @del_cmd = N'CALL sp_MSdel_hospital_service_codes', @upd_cmd = N'MCALL sp_MSupd_hospital_service_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'merges', @source_owner = N'dbo', @source_object = N'merges', @destination_table = N'merges', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_merges', @del_cmd = N'CALL sp_MSdel_merges', @upd_cmd = N'MCALL sp_MSupd_merges', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'next_of_kin', @source_owner = N'dbo', @source_object = N'next_of_kin', @destination_table = N'next_of_kin', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_next_of_kin', @del_cmd = N'CALL sp_MSdel_next_of_kin', @upd_cmd = N'MCALL sp_MSupd_next_of_kin', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'nok_relationship_codes', @source_owner = N'dbo', @source_object = N'nok_relationship_codes', @destination_table = N'nok_relationship_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_nok_relationship_codes', @del_cmd = N'CALL sp_MSdel_nok_relationship_codes', @upd_cmd = N'MCALL sp_MSupd_nok_relationship_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'patient_class_codes', @source_owner = N'dbo', @source_object = N'patient_class_codes', @destination_table = N'patient_class_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patient_class_codes', @del_cmd = N'CALL sp_MSdel_patient_class_codes', @upd_cmd = N'MCALL sp_MSupd_patient_class_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'patient_type_codes', @source_owner = N'dbo', @source_object = N'patient_type_codes', @destination_table = N'patient_type_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patient_type_codes', @del_cmd = N'CALL sp_MSdel_patient_type_codes', @upd_cmd = N'MCALL sp_MSupd_patient_type_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'patients', @source_owner = N'dbo', @source_object = N'patients', @destination_table = N'patients', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patients', @del_cmd = N'CALL sp_MSdel_patients', @upd_cmd = N'MCALL sp_MSupd_patients', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'vip_indicator_codes', @source_owner = N'dbo', @source_object = N'vip_indicator_codes', @destination_table = N'vip_indicator_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_vip_indicator_codes', @del_cmd = N'CALL sp_MSdel_vip_indicator_codes', @upd_cmd = N'MCALL sp_MSupd_vip_indicator_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_comet', @article = N'visits', @source_owner = N'dbo', @source_object = N'visits', @destination_table = N'visits', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_visits', @del_cmd = N'CALL sp_MSdel_visits', @upd_cmd = N'MCALL sp_MSupd_visits', @filter = null, @sync_object = null
GO

-- Adding the transactional subscription
exec sp_addsubscription @publication = N'comet_cwap19_comet', @article = N'all', @subscriber = N'CWAP19', @destination_db = N'comet1', @sync_type = N'automatic', @update_mode = N'read only'
GO

use [comet]
GO

-- Adding the transactional publication
exec sp_addpublication @publication = N'comet_cwap19_shhcpidata', @restricted = N'false', @sync_method = N'native', @repl_freq = N'continuous', @description = N'Transactional publication of comet database from Publisher CWAP11.', @status = N'active', @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @independent_agent = N'false', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @retention = 72
exec sp_addpublication_snapshot @publication = N'comet_cwap19_shhcpidata',@frequency_type = 4, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959
GO

exec sp_grant_publication_access @publication = N'comet_cwap19_shhcpidata', @login = N'BUILTIN\Administrators'
GO
exec sp_grant_publication_access @publication = N'comet_cwap19_shhcpidata', @login = N'CWBC\sqladmin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap19_shhcpidata', @login = N'distributor_admin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap19_shhcpidata', @login = N'sa'
GO

-- Adding the transactional articles
exec sp_addarticle @publication = N'comet_cwap19_shhcpidata', @article = N'merges', @source_owner = N'dbo', @source_object = N'merges', @destination_table = N'adtMerges', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_merges', @del_cmd = N'CALL sp_MSdel_merges', @upd_cmd = N'MCALL sp_MSupd_merges', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_shhcpidata', @article = N'next_of_kin', @source_owner = N'dbo', @source_object = N'next_of_kin', @destination_table = N'adtNextofkin', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_next_of_kin', @del_cmd = N'CALL sp_MSdel_next_of_kin', @upd_cmd = N'MCALL sp_MSupd_next_of_kin', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_shhcpidata', @article = N'patients', @source_owner = N'dbo', @source_object = N'patients', @destination_table = N'adtPatients', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patients', @del_cmd = N'CALL sp_MSdel_patients', @upd_cmd = N'MCALL sp_MSupd_patients', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap19_shhcpidata', @article = N'visits', @source_owner = N'dbo', @source_object = N'visits', @destination_table = N'adtVisits', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x0000000000000073, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_visits', @del_cmd = N'CALL sp_MSdel_visits', @upd_cmd = N'MCALL sp_MSupd_visits', @filter = null, @sync_object = null
GO

-- Adding the transactional subscription
exec sp_addsubscription @publication = N'comet_cwap19_shhcpidata', @article = N'all', @subscriber = N'CWAP19', @destination_db = N'shhcpidata', @sync_type = N'automatic', @update_mode = N'read only'
GO

use [comet]
GO

-- Adding the transactional publication
exec sp_addpublication @publication = N'comet_cwap21_adt', @restricted = N'false', @sync_method = N'native', @repl_freq = N'continuous', @description = N'Transactional publication of comet database from Publisher CWAP11.', @status = N'active', @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @independent_agent = N'false', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @retention = 72
exec sp_addpublication_snapshot @publication = N'comet_cwap21_adt',@frequency_type = 4, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959
GO

exec sp_grant_publication_access @publication = N'comet_cwap21_adt', @login = N'BUILTIN\Administrators'
GO
exec sp_grant_publication_access @publication = N'comet_cwap21_adt', @login = N'comdel'
GO
exec sp_grant_publication_access @publication = N'comet_cwap21_adt', @login = N'CWBC\sqladmin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap21_adt', @login = N'distributor_admin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap21_adt', @login = N'phsabc\afrench'
GO
exec sp_grant_publication_access @publication = N'comet_cwap21_adt', @login = N'phsabc\sqladmindss'
GO
exec sp_grant_publication_access @publication = N'comet_cwap21_adt', @login = N'sa'
GO

-- Adding the transactional articles
exec sp_addarticle @publication = N'comet_cwap21_adt', @article = N'patients', @source_owner = N'dbo', @source_object = N'patients', @destination_table = N'patients', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patients', @del_cmd = N'CALL sp_MSdel_patients', @upd_cmd = N'MCALL sp_MSupd_patients', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap21_adt', @article = N'visits', @source_owner = N'dbo', @source_object = N'visits', @destination_table = N'visits', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_visits', @del_cmd = N'CALL sp_MSdel_visits', @upd_cmd = N'MCALL sp_MSupd_visits', @filter = null, @sync_object = null
GO

use [comet]
GO

-- Adding the transactional publication
exec sp_addpublication @publication = N'comet_cwap21_comet_2', @restricted = N'false', @sync_method = N'native', @repl_freq = N'continuous', @description = N'Transactional publication of comet database from Publisher CWAP11.', @status = N'active', @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @independent_agent = N'false', @immediate_sync = N'false', @allow_sync_tran = N'true', @autogen_sync_procs = N'true', @retention = 72
exec sp_addpublication_snapshot @publication = N'comet_cwap21_comet_2',@frequency_type = 4, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959
GO

exec sp_grant_publication_access @publication = N'comet_cwap21_comet_2', @login = N'BUILTIN\Administrators'
GO
exec sp_grant_publication_access @publication = N'comet_cwap21_comet_2', @login = N'CWBC\afrench'
GO
exec sp_grant_publication_access @publication = N'comet_cwap21_comet_2', @login = N'CWBC\rjavier'
GO
exec sp_grant_publication_access @publication = N'comet_cwap21_comet_2', @login = N'CWBC\sqladmin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap21_comet_2', @login = N'distributor_admin'
GO
exec sp_grant_publication_access @publication = N'comet_cwap21_comet_2', @login = N'sa'
GO

-- Adding the transactional articles
exec sp_addarticle @publication = N'comet_cwap21_comet_2', @article = N'merges', @source_owner = N'dbo', @source_object = N'merges', @destination_table = N'merges', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000000CEF3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_merges', @del_cmd = N'CALL sp_MSdel_merges', @upd_cmd = N'MCALL sp_MSupd_merges', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwap21_comet_2', @article = N'next_of_kin', @source_owner = N'dbo', @source_object = N'next_of_kin', @destination_table = N'next_of_kin', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000000CEF3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_next_of_kin', @del_cmd = N'CALL sp_MSdel_next_of_kin', @upd_cmd = N'MCALL sp_MSupd_next_of_kin', @filter = null, @sync_object = null
GO

use [comet]
GO

-- Adding the transactional publication
exec sp_addpublication @publication = N'comet_cwzap12_comet', @restricted = N'false', @sync_method = N'native', @repl_freq = N'continuous', @description = N'Transactional publication of comet database from Publisher CWAP11.', @status = N'active', @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @independent_agent = N'false', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @retention = 72
exec sp_addpublication_snapshot @publication = N'comet_cwzap12_comet',@frequency_type = 4, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959
GO

exec sp_grant_publication_access @publication = N'comet_cwzap12_comet', @login = N'BUILTIN\Administrators'
GO
exec sp_grant_publication_access @publication = N'comet_cwzap12_comet', @login = N'CWBC\sqladmin'
GO
exec sp_grant_publication_access @publication = N'comet_cwzap12_comet', @login = N'distributor_admin'
GO
exec sp_grant_publication_access @publication = N'comet_cwzap12_comet', @login = N'sa'
GO

-- Adding the transactional articles
exec sp_addarticle @publication = N'comet_cwzap12_comet', @article = N'admit_source_codes', @source_owner = N'dbo', @source_object = N'admit_source_codes', @destination_table = N'admit_source_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_admit_source_codes', @del_cmd = N'CALL sp_MSdel_admit_source_codes', @upd_cmd = N'MCALL sp_MSupd_admit_source_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwzap12_comet', @article = N'admit_type_codes', @source_owner = N'dbo', @source_object = N'admit_type_codes', @destination_table = N'admit_type_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_admit_type_codes', @del_cmd = N'CALL sp_MSdel_admit_type_codes', @upd_cmd = N'MCALL sp_MSupd_admit_type_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwzap12_comet', @article = N'admitting_privilege_codes', @source_owner = N'dbo', @source_object = N'admitting_privilege_codes', @destination_table = N'admitting_privilege_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_admitting_privilege_codes', @del_cmd = N'CALL sp_MSdel_admitting_privilege_codes', @upd_cmd = N'MCALL sp_MSupd_admitting_privilege_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwzap12_comet', @article = N'clinicians', @source_owner = N'dbo', @source_object = N'clinicians', @destination_table = N'clinicians', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinicians', @del_cmd = N'CALL sp_MSdel_clinicians', @upd_cmd = N'MCALL sp_MSupd_clinicians', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwzap12_comet', @article = N'consulting_clinicians', @source_owner = N'dbo', @source_object = N'consulting_clinicians', @destination_table = N'consulting_clinicians', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_consulting_clinicians', @del_cmd = N'CALL sp_MSdel_consulting_clinicians', @upd_cmd = N'MCALL sp_MSupd_consulting_clinicians', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwzap12_comet', @article = N'hospital_service_codes', @source_owner = N'dbo', @source_object = N'hospital_service_codes', @destination_table = N'hospital_service_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_hospital_service_codes', @del_cmd = N'CALL sp_MSdel_hospital_service_codes', @upd_cmd = N'MCALL sp_MSupd_hospital_service_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwzap12_comet', @article = N'merges', @source_owner = N'dbo', @source_object = N'merges', @destination_table = N'merges', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_merges', @del_cmd = N'CALL sp_MSdel_merges', @upd_cmd = N'MCALL sp_MSupd_merges', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwzap12_comet', @article = N'patient_class_codes', @source_owner = N'dbo', @source_object = N'patient_class_codes', @destination_table = N'patient_class_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patient_class_codes', @del_cmd = N'CALL sp_MSdel_patient_class_codes', @upd_cmd = N'MCALL sp_MSupd_patient_class_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwzap12_comet', @article = N'patient_type_codes', @source_owner = N'dbo', @source_object = N'patient_type_codes', @destination_table = N'patient_type_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patient_type_codes', @del_cmd = N'CALL sp_MSdel_patient_type_codes', @upd_cmd = N'MCALL sp_MSupd_patient_type_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwzap12_comet', @article = N'patients', @source_owner = N'dbo', @source_object = N'patients', @destination_table = N'patients', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patients', @del_cmd = N'CALL sp_MSdel_patients', @upd_cmd = N'MCALL sp_MSupd_patients', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_cwzap12_comet', @article = N'visits', @source_owner = N'dbo', @source_object = N'visits', @destination_table = N'visits', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_visits', @del_cmd = N'CALL sp_MSdel_visits', @upd_cmd = N'MCALL sp_MSupd_visits', @filter = null, @sync_object = null
GO

use [comet]
GO

-- Adding the transactional publication
exec sp_addpublication @publication = N'comet_shhcpiy2k', @restricted = N'false', @sync_method = N'native', @repl_freq = N'continuous', @description = N'Transactional publication of comet database from Publisher CWAP11.', @status = N'active', @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @independent_agent = N'false', @immediate_sync = N'false', @allow_sync_tran = N'true', @autogen_sync_procs = N'true', @retention = 72
exec sp_addpublication_snapshot @publication = N'comet_shhcpiy2k',@frequency_type = 4, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 8, @frequency_subday_interval = 1, @active_start_date = 0, @active_end_date = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959
GO

exec sp_grant_publication_access @publication = N'comet_shhcpiy2k', @login = N'BUILTIN\Administrators'
GO
exec sp_grant_publication_access @publication = N'comet_shhcpiy2k', @login = N'CWBC\sqladmin'
GO
exec sp_grant_publication_access @publication = N'comet_shhcpiy2k', @login = N'distributor_admin'
GO
exec sp_grant_publication_access @publication = N'comet_shhcpiy2k', @login = N'sa'
GO

-- Adding the transactional articles
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'admit_source_codes', @source_owner = N'dbo', @source_object = N'admit_source_codes', @destination_table = N'admit_source_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000000CEF3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_admit_source_codes', @del_cmd = N'CALL sp_MSdel_admit_source_codes', @upd_cmd = N'MCALL sp_MSupd_admit_source_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'admit_type_codes', @source_owner = N'dbo', @source_object = N'admit_type_codes', @destination_table = N'admit_type_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000000CEF3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_admit_type_codes', @del_cmd = N'CALL sp_MSdel_admit_type_codes', @upd_cmd = N'MCALL sp_MSupd_admit_type_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'clinician_licenses', @source_owner = N'dbo', @source_object = N'clinician_licenses', @destination_table = N'clinician_licenses', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000000CEF3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_licenses', @del_cmd = N'CALL sp_MSdel_clinician_licenses', @upd_cmd = N'MCALL sp_MSupd_clinician_licenses', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'clinician_service_codes', @source_owner = N'dbo', @source_object = N'clinician_service_codes', @destination_table = N'clinician_service_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000000CEF3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_service_codes', @del_cmd = N'CALL sp_MSdel_clinician_service_codes', @upd_cmd = N'MCALL sp_MSupd_clinician_service_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'clinician_specialties', @source_owner = N'dbo', @source_object = N'clinician_specialties', @destination_table = N'clinician_specialties', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000000CEF3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_specialties', @del_cmd = N'CALL sp_MSdel_clinician_specialties', @upd_cmd = N'MCALL sp_MSupd_clinician_specialties', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'clinician_specialty_codes', @source_owner = N'dbo', @source_object = N'clinician_specialty_codes', @destination_table = N'clinician_specialty_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000000CEF3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_specialty_codes', @del_cmd = N'CALL sp_MSdel_clinician_specialty_codes', @upd_cmd = N'MCALL sp_MSupd_clinician_specialty_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'clinician_status_codes', @source_owner = N'dbo', @source_object = N'clinician_status_codes', @destination_table = N'clinician_status_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000000CEF3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_status_codes', @del_cmd = N'CALL sp_MSdel_clinician_status_codes', @upd_cmd = N'MCALL sp_MSupd_clinician_status_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'clinician_type_codes', @source_owner = N'dbo', @source_object = N'clinician_type_codes', @destination_table = N'clinician_type_codes', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000000CEF3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinician_type_codes', @del_cmd = N'CALL sp_MSdel_clinician_type_codes', @upd_cmd = N'MCALL sp_MSupd_clinician_type_codes', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'clinicians', @source_owner = N'dbo', @source_object = N'clinicians', @destination_table = N'clinicians', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000000CEF3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_clinicians', @del_cmd = N'CALL sp_MSdel_clinicians', @upd_cmd = N'MCALL sp_MSupd_clinicians', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'consulting_clinicians', @source_owner = N'dbo', @source_object = N'consulting_clinicians', @destination_table = N'consulting_clinicians', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x000000000000CEF3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_consulting_clinicians', @del_cmd = N'CALL sp_MSdel_consulting_clinicians', @upd_cmd = N'MCALL sp_MSupd_consulting_clinicians', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'merges', @source_owner = N'dbo', @source_object = N'merges', @destination_table = N'adtMerges', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_merges', @del_cmd = N'CALL sp_MSdel_merges', @upd_cmd = N'MCALL sp_MSupd_merges', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'next_of_kin', @source_owner = N'dbo', @source_object = N'next_of_kin', @destination_table = N'adtNextofkin', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_next_of_kin', @del_cmd = N'CALL sp_MSdel_next_of_kin', @upd_cmd = N'MCALL sp_MSupd_next_of_kin', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'patients', @source_owner = N'dbo', @source_object = N'patients', @destination_table = N'adtPatients', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_patients', @del_cmd = N'CALL sp_MSdel_patients', @upd_cmd = N'MCALL sp_MSupd_patients', @filter = null, @sync_object = null
GO
exec sp_addarticle @publication = N'comet_shhcpiy2k', @article = N'visits', @source_owner = N'dbo', @source_object = N'visits', @destination_table = N'adtVisits', @type = N'logbased', @creation_script = null, @description = null, @pre_creation_cmd = N'drop', @schema_option = 0x00000000000000F3, @status = 16, @vertical_partition = N'false', @ins_cmd = N'CALL sp_MSins_visits', @del_cmd = N'CALL sp_MSdel_visits', @upd_cmd = N'MCALL sp_MSupd_visits', @filter = null, @sync_object = null
GO

/****** End: Script to be run at Publisher: CWAP11 ******/

