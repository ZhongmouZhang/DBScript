 -- create a credential
 create credential PS_IMPORT with identity = 'PHSABC\svcp_spappnsi001', secret='Doc$har3'

-- create a proxy based on the credential
USE msdb ;
GO

EXEC dbo.sp_add_proxy
    @proxy_name = 'PeopleSoft Import proxy',
    @enabled = 1,
    @description = 'Importing Data from a CVS file',
    @credential_name = 'PS_IMPORT' ;
GO

-- add the proxy to a pre-defined subsystem.

