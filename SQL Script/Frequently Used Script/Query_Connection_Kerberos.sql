-- check if Kerberos is enabled

SELECT auth_scheme FROM sys.dm_exec_connections WHERE session_id = @@spid ;

-- Verify SPN has been successfully registered Using SETSPN Command Line Utility
--In Command Line enter the following command: setspn -L <Domain\SQL Service Account Name> 

