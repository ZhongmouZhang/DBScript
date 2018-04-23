 -----------------------------------------------------------------
--- Set up Database Mail for Database Services
------ ---  --- --- --- --- --- --- --- ---  -----------------
---  NOTE: SQL Agent service must be restarted afterwards
------ ---  --- --- --- --- --- --- --- --- --- -----------------
sp_configure 'Advanced Options', 1;
RECONFIGURE with override

GO
sp_configure 'Database Mail XPs', 1;
GO
RECONFIGURE with override

GO
------ ---  --- --- --- --- --- --- --- --- --- ---------------------
---  NOTE: Enter one of the values: 
---          'VCH', 'PHSA', 'ENG', or 'FHA' for @HA 
---------------------------------------------------------------------
DECLARE @HA varchar(5), @eml varchar(60), @smtp varchar(60);
declare @server_name varchar(500)
set @server_name = replace(@@servername,'\','_')

SET @HA='PHSA';

SET @eml = CASE UPPER(@HA) 
				WHEN 'VCH' THEN @server_name+'@vch.ca'
				WHEN 'PHSA' THEN @server_name+'@phsa.ca'
				WHEN 'ENG' THEN @server_name+'@phsa.ca'
				WHEN 'FHA' THEN @server_name+'@fraserhealth.org'
				WHEN 'KDC' THEN @server_name+'@hssbc.ca'
			END

SET @smtp = CASE UPPER(@HA) 
				WHEN 'VCH' THEN 'smtp.vch.ca'
				WHEN 'PHSA' THEN 'SRVEXHT01.phsabc.ehcnet.ca'
				WHEN 'ENG' THEN 'SVMPNGSMTP.phsabc.ehcnet.ca'
				WHEN 'FHA' THEN 'mailserver.fraserhealth.org'
				WHEN 'KDC' THEN 'smtp.healthbc.org'
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
 
