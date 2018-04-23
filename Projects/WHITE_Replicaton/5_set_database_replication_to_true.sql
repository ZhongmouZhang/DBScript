use master  -- FHA_UAT at VMT012SQL2K5
exec sp_replicationdboption @dbname = N'white3', @optname = N'publish', @value = N'true'
GO
