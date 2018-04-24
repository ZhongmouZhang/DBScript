 	
/*************************************************************

		Allow windows user/group to connect to SQL Server
		
**************************************************************/

-- Create login
exec sp_grantlogin 'PHSABC\dsheh'
exec sp_defaultdb N'PHSABC\dsheh', N'cais'
exec sp_defaultlanguage N'PHSABC\dsheh', N'us_english'

exec sp_grantlogin 'PHSABC\vhoward'
exec sp_defaultdb N'PHSABC\vhoward', N'cais'
exec sp_defaultlanguage N'PHSABC\vhoward', N'us_english'


-- grant access to a specific db
EXEC sp_grantdbaccess 'PHSABC\dsheh', 'dsheh'
EXEC sp_grantdbaccess 'PHSABC\vhoward', 'vhoward'

-- grrant permission
grant select on mail_dependent_document to [dsheh],[vhoward]
grant select on dbo.mail_distribution_log to [dsheh],[vhoward]
grant select on dbo.mail_recipient_address to [dsheh],[vhoward]
grant select on dbo.mail_patient to [dsheh],[vhoward]
grant select on dbo.mail_printer_definition to [dsheh],[vhoward]
grant select on dbo.mail_distribution_log_archive to [dsheh],[vhoward]
grant select on dbo.mail_recipient_address_archive to [dsheh],[vhoward]
grant select on dbo.mail_patient_archive to [dsheh],[vhoward]
grant select on dbo.document_type_definition to [dsheh],[vhoward]


/*********************************************************
		allow SQL Account to connect to SQl server
*********************************************************/
--create login
exec sp_addlogin '71108', '71108', 'master', 'us_english'

-- grant db access
EXEC sp_grantdbaccess '71108', '71108'

-- grant permission by adding to the roles
exec sp_addrolemember 'db_owner', '74303'
