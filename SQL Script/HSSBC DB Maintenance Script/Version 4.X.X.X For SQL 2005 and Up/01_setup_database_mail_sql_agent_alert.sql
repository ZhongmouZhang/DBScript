 -----------------------------------------------------------------
--- Set up Database Mail for Database Services
------ ---  --- --- --- --- --- --- --- ---  -----------------
---  NOTE: SQL Agent service must be restarted afterwards
------ ---  --- --- --- --- --- --- --- --- --- -----------------
print '----------------------------- Running 01_setup_database_mail_sql_agent_alert.sql ----------------------------'
print 'execution time: ' + convert(varchar(32),getdate())
print ''
print ''

exec sp_configure 'Advanced Options', 1;
RECONFIGURE with override

GO
exec sp_configure 'Database Mail XPs', 1;
GO
RECONFIGURE with override

GO
------ ---  --- --- --- --- --- --- --- --- --- ---------------------
---  NOTE: Enter one of the values: 
---          'VCH', 'PHSA', 'ENG', or 'FHA' for @HA 
---------------------------------------------------------------------
DECLARE @HA varchar(16), @eml varchar(60), @smtp varchar(60), @ip varchar(16);
declare @server_name varchar(500)
set @server_name = replace(@@servername,'\','_')

/***************************  should not base on IP
SELECT @ip = convert (varchar(16),CONNECTIONPROPERTY('local_net_address'))
if @ip like '10.1.%'	or @ip like '10.2.%'
	set @HA = 'PHSA'
else if @ip like  '10.248.%'	or @ip like '10.251.%'
	set @HA = 'KDC'
else if @ip like  '10.42.%'	or @ip like '139.%' or @ip like '142.%' or @ip like '10.21.%'
	set @HA = 'VCH'
else if @ip like  '172.%'
	set @HA = 'FHA'
else 
	set @HA = 'KDC'
*********************************************************/

SET @eml = CASE UPPER(DEFAULT_DOMAIN()) 
				WHEN 'VCH' THEN @server_name+'@vch.ca'
				WHEN 'PHSABC' THEN @server_name+'@phsa.ca'
				WHEN 'ENG' THEN @server_name+'@phsa.ca'
				WHEN 'SFHR' THEN @server_name+'@fraserhealth.org'
				ELSE @server_name+'@hssbc.ca'
			END

SET @smtp = CASE UPPER(DEFAULT_DOMAIN()) 
				WHEN 'VCH' THEN 'smtp.vch.ca'
				WHEN 'PHSABC' THEN 'smtprelay.phsa.ca'
				WHEN 'ENG' THEN 'smtprelay.phsa.ca'
				WHEN 'SFHR' THEN 'mailserver.fraserhealth.org'
				ELSE 'smtp.healthbc.org'
			END			

EXECUTE msdb.dbo.sysmail_add_profile_sp
       @profile_name = 'Database Services',
       @description = 'Profile used for jobs e-mail notification' ;

EXECUTE msdb.dbo.sysmail_add_account_sp
    @account_name = 'DBA',
    @description = 'Mail account for Database Services e-mail notification',
    @email_address = @eml,
    @display_name = @server_name,
    @mailserver_name = @smtp ;

EXECUTE msdb.dbo.sysmail_add_profileaccount_sp
    @profile_name = 'Database Services',
    @account_name = 'DBA',
    @sequence_number = 1 ;


--------------------------------------------------------------
--- Configures SQL Agent to use the Database Mail profile
--- 1. The following three statements are good for The SQL Agent of default instance.
--- 2. The named instance has to configure the db mail by using SQL Agent properties.
--- 3. The SQL Agent has to be restarted to take the settings effect.
--------------------------------------------------------------
USE [msdb]
GO
EXEC msdb.dbo.sp_set_sqlagent_properties @email_save_in_sent_folder=1
GO
EXEC master.dbo.xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'SOFTWARE\Microsoft\MSSQLServer\SQLServerAgent', N'UseDatabaseMail', N'REG_DWORD', 1
GO
EXEC master.dbo.xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'SOFTWARE\Microsoft\MSSQLServer\SQLServerAgent', N'DatabaseMailProfile', N'REG_SZ', N'Database Services'
GO


---------------------------------------------------
--- Creates Database Services Operator  -----------
---------------------------------------------------
USE [msdb]
GO
EXEC msdb.dbo.sp_add_operator @name=N'Database Services', 
		@enabled=1, 
		@pager_days=0, 
		@email_address=N'HSSBCTSDatabaseServices@hssbc.ca'
		--		@email_address=N'james.zhang@hssbc.ca'

GO
 
