 USE master
GO
EXEC sp_addlinkedserver 
    'SEATTLESales',
    N'SQL Server'
GO

EXEC    sp_addlinkedserver    
	@server='TEST_LinkedServer', 
	@srvproduct='',
    @provider='SQLOLEDB', 
	@datasrc='ZVCAISDB01\ZICAISDB01', 
	@catalog = 'master'
                                

-- Using their own user credentials
EXEC sp_addlinkedsrvlogin 'TEST_LinkedServer'
Or
EXEC sp_addlinkedsrvlogin '<remote_server>', 'true'

-- all the local logins map to a specific account
EXEC sp_addlinkedsrvlogin 'Accounts', 'false', NULL, 'SQLUser', 'Password'

-- a specific local login map to a specific account
EXEC sp_addlinkedsrvlogin 'Accounts', 'false', 'Domain\Mary', 'MaryP', 'NewPassword'
                               
