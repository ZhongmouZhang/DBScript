 ------------------------------------------------------
-- 2. Distributor_1.sql
--    This script has to run on "Distributor" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_distribution_db_name varchar(255)
declare @P_distribution_db_data_folder varchar(255)
declare @P_distribution_db_log_folder varchar(255)
declare @P_security_mode int

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_distribution_db_name = 'CC_distribution'
set @P_distribution_db_data_folder = 'H:\SQL_Data'
set @P_distribution_db_log_folder = 'I:\SQL_Log'
set @P_security_mode = 1
------------------------------------------------------

-- it will create distribution db. Each publisher should have it's own distribution db.
use master

exec sp_adddistributiondb @database = @P_distribution_db_name, 
@data_folder = @P_distribution_db_data_folder, 
@log_folder = @P_distribution_db_log_folder, 
@log_file_size = 2, @min_distretention = 0, @max_distretention = 72, 
@history_retention = 48, @security_mode = @P_security_mode
go





------------------------------------------------------
-- 3. Distributor_3.sql
--    This script has to run on "Distributor" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_distributer_server_name varchar(255)
declare @P_distributer_password varchar(255)
declare @P_distribution_db_name varchar(255)
declare @P_publisher_server_name varchar(255)
declare @P_security_mode int
declare @P_distributor_working_folder varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_distributer_server_name = 'STVWHTDBDIST'
set @P_distributer_password = '51@&maj7IwXF$xD87^o4' -- this password has to be the same as in 1_Distributor.sql
set @P_distribution_db_name = 'CC_distribution'
set @P_security_mode = 1
set @P_publisher_server_name = 'SPDB0011.fraserhealth.org'
set @P_distributor_working_folder = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\repldata'
------------------------------------------------------

-- it will set up distribution db and add publisher for this distribution
set @Str = 
'use '+ @P_distribution_db_name + CHAR(13)+ 
'if (not exists (select * from sysobjects where name = ' + CHAR(39) + 
'UIProperties' + CHAR(39) + ' and type = ' + char(39) + 'U ' + char(39)+'))' + CHAR(13) + 
'  create table UIProperties(id int)' + CHAR(13) + 
'if (exists (select * from ::fn_listextendedproperty(' + char(39) + 
'SnapshotFolder' + CHAR(39) + ', ' + char(39) + 'user' +char(39) + 
', ' + char(39) + 'dbo' + char(39) + ', ' + char(39) + 'table' + CHAR(39) +', ' + char(39) + 'UIProperties' 
+ CHAR(39) + ', null, null))) ' + CHAR(13) +
'  EXEC sp_updateextendedproperty ' + char(39) + 'SnapshotFolder' + CHAR(39) + 
', ' + char(39) + @P_distributor_working_folder + char(39) + ', ' + char(39) + 'user' + char(39) +
', dbo, ' + char(39) + 'table' +char(39) + ', ' + char(39) + 'UIProperties' + char(39) + char(13) +
'else ' + char(13) +
'  EXEC sp_addextendedproperty ' + char(39) + 'SnapshotFolder' + char(39) + 
', ' + char(39) + @P_distributor_working_folder + char(39) +',' + char(39) + 'user' + char(39) +
', dbo, ' + char(39) + 'table' + char(39) + ',' + char(39) + 'UIProperties' + char(39) + char(13) +
'exec sp_adddistpublisher @publisher = ' + char(39) + @P_publisher_server_name + CHAR(39) +
', @distribution_db = ' + char(39) + @P_distribution_db_name + char(39) +',' + CHAR(13) +
'@security_mode =  1,' + CHAR(13) +
'@working_directory = ' + char(39) + @P_distributor_working_folder + char(39) +',' + CHAR(13) +
'@trusted = ' + char(39) + 'false' + CHAR(39) +', @thirdparty_flag = 0, @publisher_type = ' + char(39) + 'MSSQLSERVER' + CHAR(39) 

-- exec(@Str)
print @Str
GO



------------------------------------------------------
-- 4. Publisher.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------
declare @P_distributer_server_name varchar(255)
declare @P_distributer_password varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_distributer_server_name = 'STVWHTDBDIST'
set @P_distributer_password = '51@&maj7IwXF$xD87^o4' -- this password has to be the same as in 1_Distributor.sql
------------------------------------------------------

-- it will register remote distributer with already existing password
use master
exec sp_adddistributor @distributor = @P_distributer_server_name, @password = @P_distributer_password
GO


------------------------------------------------------
-- 5. Publisher.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_publishing_db_name varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_publishing_db_name = 'Workplace_Health01'
------------------------------------------------------

-- it will set up replication options of publishing db
set @Str = 
'use [' + @P_publishing_db_name + ']' + CHAR(13)+
'exec sp_replicationdboption @dbname = '+CHAR(39)+@P_publishing_db_name+CHAR(39)+', @optname = '+char(39)+'publish'+CHAR(39)+
', @value = '+char(39)+'true'+CHAR(39)+CHAR(13)

-- exec(@Str)
print @Str
GO



------------------------------------------------------
-- 6. Publisher.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_publishing_db_name varchar(255)
declare @P_security_mode int
declare @P_login_name varchar(255)
declare @P_login_password varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_publishing_db_name = 'Workplace_Health01'
set @P_login_name = 'PHSABC\SPDB0011svcCCLogRdr'
set @P_login_password = 'xxxxxx'
------------------------------------------------------

-- It adds a Log Reader agent for a publishing db which creates a job on Distributer server.
set @Str = 
'use [' + @P_publishing_db_name + ']' + CHAR(13)+
'exec ['+@P_publishing_db_name+'].sys.sp_addlogreader_agent @job_login = '+CHAR(39)+@P_login_name+CHAR(39)+', @job_password = '+char(39)+@P_login_password+CHAR(39)+
', @publisher_security_mode = 1, @job_name = null'+CHAR(13)


-- exec(@Str)
print @Str
GO



------------------------------------------------------
-- 7 Publisher.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_publishing_name varchar(255)
declare @P_publishing_db_name varchar(255)
declare @P_publisher_server_name varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_publishing_name = 'publication_CC'
set @P_publishing_db_name = 'Workplace_Health01'
set @P_publisher_server_name = 'SPDB0011.fraserhealth.org'
------------------------------------------------------

-- Adding the transactional publication
set @Str = 
'use [' + @P_publishing_db_name + ']' + CHAR(13)+
'exec sp_addpublication @publication = '+char(39)+@P_publishing_name+CHAR(39)+', '+CHAR(13)+
'@description = '+char(39)+'Transactional publication of database '+char(39)+char(39)+@P_publishing_db_name+char(39)+char(39)+
' from Publisher '+char(39)+char(39)+@P_publisher_server_name +char(39)+char(39)+'.'+CHAR(39)+', '+CHAR(13)+
'@sync_method = '+char(39)+'concurrent'+CHAR(39)+', @retention = 0, @allow_push = '+char(39)+'true'+CHAR(39)+
', @allow_pull = '+char(39)+'true'+CHAR(39)+', '+CHAR(13)+
'@allow_anonymous = '+char(39)+'true'+CHAR(39)+', @enabled_for_internet = '+char(39)+'false'+CHAR(39)+
', @snapshot_in_defaultfolder = '+char(39)+'true'+CHAR(39)+', '+CHAR(13)+
'@compress_snapshot = '+char(39)+'false'+CHAR(39)+', @ftp_port = 21, @ftp_login = '+char(39)+'anonymous'+CHAR(39)+
', @allow_subscription_copy = '+char(39)+'false'+CHAR(39)+', '+CHAR(13)+
'@add_to_active_directory = '+char(39)+'false'+CHAR(39)+', @repl_freq = '+char(39)+'continuous'+CHAR(39)+
', @status = '+char(39)+'active'+CHAR(39)+', @independent_agent = '+char(39)+'true'+CHAR(39)+', '+CHAR(13)+
'@immediate_sync = '+char(39)+'true'+CHAR(39)+', @allow_sync_tran = '+char(39)+'false'+CHAR(39)+
', @autogen_sync_procs = '+char(39)+'false'+CHAR(39)+', @allow_queued_tran = '+char(39)+'false'+CHAR(39)+', '+CHAR(13)+
'@allow_dts = '+char(39)+'false'+CHAR(39)+', @replicate_ddl = 1, @allow_initialize_from_backup = '+char(39)+
'false'+CHAR(39)+', @enabled_for_p2p = '+char(39)+'false'+CHAR(39)+', '+CHAR(13)+
'@enabled_for_het_sub = '+char(39)+'false'+CHAR(39)

-- exec(@Str)
print @Str
GO


------------------------------------------------------
-- 8. Publisher_5.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_publishing_name varchar(255)
declare @P_publishing_db_name varchar(255)
declare @P_login_name varchar(255)
declare @P_login_password varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_publishing_name = 'publication_CC'
set @P_publishing_db_name = 'Workplace_Health01'
set @P_login_name = 'PHSABC\SPDB0011svcCCSnpSht'
set @P_login_password = 'xxxxxx'
------------------------------------------------------

-- it creates the Snapshot Agent for the specified publication and job on Distributer server
set @Str = 
'use [' + @P_publishing_db_name + ']' + CHAR(13)+
'exec sp_addpublication_snapshot @publication = '+char(39)+@P_publishing_name+ char(39)+', '+CHAR(13)+
'@frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, ' +CHAR(13)+
'@frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, '+CHAR(13)+
'@active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, '+CHAR(13)+
'@active_end_date = 0, @job_login = '+char(39)+@P_login_name+char(39)+', @job_password = '+char(39)+
@P_login_password+char(39)+', @publisher_security_mode = 1'+CHAR(13)

-- exec(@Str)
print @Str
GO

------------------------------------------------------
-- 9. Publisher.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------
declare @P_publication_name varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_publication_name = 'publication_CC'
------------------------------------------------------

-- It reates articles and adds it to a publication
-- *** IMPORTANT! Check after this script has Snapshot agent job been executed on Distributer. If not, start it manually.
-- *** in the following line replace 'White3' with real publicatio db name ***
-- Adding the transactional articles
use [Workplace_Health01]

exec sp_addarticle @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @source_owner = N'SFHR\pbrown', @source_object = N'HWCC_tbl_callcentredata', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'HWCC_tbl_callcentredata', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [dbo].[sp_MSins_SFHR\pbrownHWCC_tbl_callcentredata]', @del_cmd = N'CALL [dbo].[sp_MSdel_SFHR\pbrownHWCC_tbl_callcentredata]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_SFHR\pbrownHWCC_tbl_callcentredata]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'CCID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'HAID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'str_HA_abbr', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'str_Facility', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'dtm_DateCallRec', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'dtm_TimeCallRec', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'dtm_DateEECont', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'dtm_TimeEECont', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'dbl_CallDuration', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'dbl_TotTaskTime', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'ysn_HHComp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'ysn_ReftoImmunClinic', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'ysn_ImmunLetterSent', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'ysn_LabReqSent', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'str_reasonforcall', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'OHN_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'RFC_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'OHN_adv', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'RFC', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'str_Source_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'str_Comm_Dis', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @column = N'SSMA_TimeStamp', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
-- Adding the article synchronization object
exec sp_articleview @publication = @P_publication_name, @article = N'HWCC_tbl_callcentredata', @view_name = N'syncobj_0x4333444435303233', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1


exec sp_addarticle @publication = @P_publication_name, @article = N'HWCC_tbl_comm_dis', @source_owner = N'SFHR\pbrown', @source_object = N'HWCC_tbl_comm_dis', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'HWCC_tbl_comm_dis', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_SFHR\pbrownHWCC_tbl_comm_dis]', @del_cmd = N'CALL [dbo].[sp_MSdel_SFHR\pbrownHWCC_tbl_comm_dis]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_SFHR\pbrownHWCC_tbl_comm_dis]'

exec sp_addarticle @publication = @P_publication_name, @article = N'HWCC_tbl_Fac', @source_owner = N'SFHR\pbrown', @source_object = N'HWCC_tbl_Fac', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'HWCC_tbl_Fac', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_SFHR\pbrownHWCC_tbl_Fac]', @del_cmd = N'CALL [dbo].[sp_MSdel_SFHR\pbrownHWCC_tbl_Fac]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_SFHR\pbrownHWCC_tbl_Fac]'

exec sp_addarticle @publication = @P_publication_name, @article = N'HWCC_tbl_HA', @source_owner = N'SFHR\pbrown', @source_object = N'HWCC_tbl_HA', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'none', @destination_table = N'HWCC_tbl_HA', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_SFHR\pbrownHWCC_tbl_HA]', @del_cmd = N'CALL [dbo].[sp_MSdel_SFHR\pbrownHWCC_tbl_HA]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_SFHR\pbrownHWCC_tbl_HA]'

exec sp_addarticle @publication = @P_publication_name, @article = N'HWCC_tbl_reasonforcall', @source_owner = N'SFHR\pbrown', @source_object = N'HWCC_tbl_reasonforcall', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'HWCC_tbl_reasonforcall', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_SFHR\pbrownHWCC_tbl_reasonforcall]', @del_cmd = N'CALL [dbo].[sp_MSdel_SFHR\pbrownHWCC_tbl_reasonforcall]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_SFHR\pbrownHWCC_tbl_reasonforcall]'
-------------
--exec sp_addarticle @publication = @P_publication_name, @article = N'ICC_tbl_Call_Backs_or_Attempts', @source_owner = N'SFHR\pbrown', @source_object = N'ICC_tbl_Call_Backs_or_Attempts', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'ICC_tbl_Call_Backs_or_Attempts', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_SFHR\pbrownICC_tbl_Call_Backs_or_Attempts]', @del_cmd = N'CALL [dbo].[sp_MSdel_SFHR\pbrownICC_tbl_Call_Backs_or_Attempts]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_SFHR\pbrownICC_tbl_Call_Backs_or_Attempts]'
exec sp_addarticle @publication = @P_publication_name, @article = N'ICC_tbl_Call_Backs_or_Attempts', @source_owner = N'SFHR\pbrown', @source_object = N'ICC_tbl_Call_Backs_or_Attempts', 
@type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', 
@destination_table = N'ICC_tbl_Call_Backs_or_Attempts', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', 
@ins_cmd = N'CALL [dbo].[sp_MSins_SFHR\pbrownICC_tbl_Call_Backs_or_Attempts]', @del_cmd = N'CALL [dbo].[sp_MSdel_SFHR\pbrownICC_tbl_Call_Backs_or_Attempts]', 
@upd_cmd = N'SCALL [dbo].[sp_MSupd_SFHR\pbrownICC_tbl_Call_Backs_or_Attempts]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Call_Backs_or_Attempts', @column = N'CB_or_CA_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Call_Backs_or_Attempts', @column = N'dtm_Call_Back_Date', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Call_Backs_or_Attempts', @column = N'dtm_Call_Back_Time', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Call_Backs_or_Attempts', @column = N'Notif_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Call_Backs_or_Attempts', @column = N'CB_or_CA_Method_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Call_Backs_or_Attempts', @column = N'CB_or_CA_Num_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Call_Backs_or_Attempts', @column = N'CB_or_CA_Target_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Call_Backs_or_Attempts', @column = N'CB_or_CA_Source_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Call_Backs_or_Attempts', @column = N'int_LongDistDuration', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = @P_publication_name, @article = N'ICC_tbl_Call_Backs_or_Attempts', @view_name = N'syncobj_0x4333544435303238', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

--------------
exec sp_addarticle @publication = @P_publication_name, @article = N'ICC_tbl_Lookup_Type', @source_owner = N'SFHR\pbrown', @source_object = N'ICC_tbl_Lookup_Type', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'ICC_tbl_Lookup_Type', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_SFHR\pbrownICC_tbl_Lookup_Type]', @del_cmd = N'CALL [dbo].[sp_MSdel_SFHR\pbrownICC_tbl_Lookup_Type]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_SFHR\pbrownICC_tbl_Lookup_Type]'

exec sp_addarticle @publication = @P_publication_name, @article = N'ICC_tbl_Lookups', @source_owner = N'SFHR\pbrown', @source_object = N'ICC_tbl_Lookups', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'ICC_tbl_Lookups', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [dbo].[sp_MSins_SFHR\pbrownICC_tbl_Lookups]', @del_cmd = N'CALL [dbo].[sp_MSdel_SFHR\pbrownICC_tbl_Lookups]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_SFHR\pbrownICC_tbl_Lookups]'

exec sp_addarticle @publication = @P_publication_name, @article = N'ICC_tbl_Notifications', @source_owner = N'SFHR\pbrown', @source_object = N'ICC_tbl_Notifications', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'ICC_tbl_Notifications', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [dbo].[sp_MSins_SFHR\pbrownICC_tbl_Notifications]', @del_cmd = N'CALL [dbo].[sp_MSdel_SFHR\pbrownICC_tbl_Notifications]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_SFHR\pbrownICC_tbl_Notifications]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Notifications', @column = N'Notif_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Notifications', @column = N'dtm_Date_1st_Notif', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Notifications', @column = N'dtm_Time_1st_Notif', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Notifications', @column = N'dtm_Date_Report_Taken', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Notifications', @column = N'int_Duration_Report', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Notifications', @column = N'str_Incident_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Notifications', @column = N'Call_Priority_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Notifications', @column = N'HA_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Notifications', @column = N'Type_of_Call_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Notifications', @column = N'WIRA_ID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'ICC_tbl_Notifications', @column = N'upsize_ts', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = @P_publication_name, @article = N'ICC_tbl_Notifications', @view_name = N'syncobj_0x4333444435303231', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

exec sp_addarticle @publication = @P_publication_name, @article = N'IInvDB_IncidentCategory', @source_owner = N'SFHR\pbrown', @source_object = N'IInvDB_IncidentCategory', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'IInvDB_IncidentCategory', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [dbo].[sp_MSins_SFHR\pbrownIInvDB_IncidentCategory]', @del_cmd = N'CALL [dbo].[sp_MSdel_SFHR\pbrownIInvDB_IncidentCategory]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_SFHR\pbrownIInvDB_IncidentCategory]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentCategory', @column = N'CatID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentCategory', @column = N'IncidentROWID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentCategory', @column = N'int_Category', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentCategory', @column = N'dtm_Category', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentCategory', @column = N'upsize_ts', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = @P_publication_name, @article = N'IInvDB_IncidentCategory', @view_name = N'syncobj_0x4333444435303222', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1


exec sp_addarticle @publication = @P_publication_name, @article = N'IInvDB_IncidentChecked', @source_owner = N'SFHR\pbrown', @source_object = N'IInvDB_IncidentChecked', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'none', @destination_table = N'IInvDB_IncidentChecked', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [dbo].[sp_MSins_SFHR\pbrownIInvDB_IncidentChecked]', @del_cmd = N'CALL [dbo].[sp_MSdel_SFHR\pbrownIInvDB_IncidentChecked]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_SFHR\pbrownIInvDB_IncidentChecked]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentChecked', @column = N'IncidentID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentChecked', @column = N'ysn_IncIDNew', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentChecked', @column = N'upsize_ts', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentChecked', @column = N'FACI_NAME', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = @P_publication_name, @article = N'IInvDB_IncidentChecked', @view_name = N'syncobj_0x4333444435303221', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1


exec sp_addarticle @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @source_owner = N'SFHR\pbrown', @source_object = N'IInvDB_IncidentInvest', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'IInvDB_IncidentInvest', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'true', @ins_cmd = N'CALL [dbo].[sp_MSins_SFHR\pbrownIInvDB_IncidentInvest]', @del_cmd = N'CALL [dbo].[sp_MSdel_SFHR\pbrownIInvDB_IncidentInvest]', @upd_cmd = N'SCALL [dbo].[sp_MSupd_SFHR\pbrownIInvDB_IncidentInvest]'

-- Adding the article's partition column(s)
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'InvID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'IncidentROWID', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'int_Priority', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'dtm_Priority', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'dtm_InvReturned', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'str_InvRet5days', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_Par_ByPersKnw', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_Par_EE', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_Par_Wit', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_Par_JshUnn', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_Par_jshUnnAtmpt', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_IncDesc_Clr', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_IncDesc_RelInfo', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_CsCf_all', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_CA_ImmSTActCntrl', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_CA_Idfd', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_CA_IdfdNtAdd', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_CA_RespAss', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_CA_DtmIdfd', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_Satis', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_UnSatis', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'ysn_Clsd_InCmplt', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'upsize_ts', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
exec sp_articlecolumn @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @column = N'dtm_InvCmntSent', @operation = N'add', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1

-- Adding the article synchronization object
exec sp_articleview @publication = @P_publication_name, @article = N'IInvDB_IncidentInvest', @view_name = N'syncobj_0x4333444435303220', @filter_clause = N'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1




------------------------------------------------------
-- 10. Subscriber_1.sql
--    This script has to run on "Subscription" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_newdb varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_newdb = 'CC_SUB'
------------------------------------------------------

-- it will create Subscription db on Subscription server.
set @Str =
'create database ' + @P_newdb

-- exec(@Str)
print @Str



------------------------------------------------------
-- 11. Publisher.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------
declare @Str varchar(8000)
declare @P_publishing_name varchar(255)
declare @P_publishing_db_name varchar(255)
declare @P_subscriber_server_name varchar(255)
declare @P_subscription_db_name varchar(255)
declare @P_login_name varchar(255)
declare @P_login_password varchar(255)

------------------------------------------------------
-- This section has to fill varables values. It contains initial values as an example!
------------------------------------------------------
set @P_publishing_name = 'publication_CC'
set @P_publishing_db_name = 'Workplace_Health01'
set @P_subscriber_server_name = 'STVWHTDBSUB'
set @P_subscription_db_name = 'CC_SUB'
set @P_login_name = 'PHSABC\svc_SPDBWHTDIST_CC'
set @P_login_password = 'xxxxxx'
------------------------------------------------------

-- It adds a subscription to a publication and sets the Subscriber status. Also adds a new agent job used to synchronize a push subscription to a transactional publication
set @Str = 
'use ['+@P_publishing_db_name+']'+ CHAR(13)+
'exec sp_addsubscription @publication = '+char(39)+@P_publishing_name+char(39)+', '+CHAR(13)+
'@subscriber = '+char(39)+@P_subscriber_server_name+char(39)+', @destination_db = '+char(39)+@P_subscription_db_name+char(39)+', '+CHAR(13)+
'@subscription_type = '+char(39)+'Push'+char(39)+', @sync_type = '+char(39)+'automatic'+char(39)+', @article = '+char(39)+'all'+char(39)+', '+CHAR(13)+
'@update_mode = '+char(39)+'read only'+char(39)+', @subscriber_type = 0'+CHAR(13)+
'
exec sp_addpushsubscription_agent @publication = '+char(39)+@P_publishing_name+char(39)+', '+CHAR(13)+
'@subscriber = '+char(39)+@P_subscriber_server_name+char(39)+', @subscriber_db = '+char(39)+@P_subscription_db_name+char(39)+', '+char(13)+
'@job_login = '+char(39)+@P_login_name+char(39)+', @job_password = '+char(39)+@P_login_password+char(39)+', @subscriber_security_mode = 1,'+char(13)+
'@frequency_type = 64, @frequency_interval = 0, @frequency_relative_interval = 0,'+char(13)+ 
'@frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0,'+char(13)+ 
'@active_start_time_of_day = 0, @active_end_time_of_day = 235959,'+char(13)+ 
'@active_start_date = 20111007, @active_end_date = 99991231, @enabled_for_syncmgr = '+char(39)+'False'+char(39)+', '+char(13)+
'@dts_package_location = '+char(39)+'Distributor'+CHAR(39)+char(13)

-- exec(@Str)
print @Str
GO












