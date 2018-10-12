-- =============================================
--Server SPDBSC001/002; App Server: SPSCOMMS001/2/3
-- =============================================
SELECT [DisplayName]
	  ,[NetworkName]
      ,[IPAddress]
      ,[ForestDnsName]
      ,[NetbiosComputerName]
      ,[NetbiosDomainName]
      ,[LogicalProcessors]
	  ,[PhysicalProcessors]
      ,[DNSName]
      ,[DomainDnsName]
      ,[ActiveDirectorySite]
      ,[PrincipalName]
  FROM [OperationsManager].[dbo].[MT_Computer]
  order by NetbiosDomainName



  SELECT TOP 1000 [BaseManagedEntityId]
      ,[ConnectionString_239AE8FB_36B6_4313_2085_3CEDE8EC17EB] instance_name
      ,[Account_6751C840_3C4C_1D26_B77F_490ABC3850C1] Service_Account
      ,[ErrorLogLocation_241F8AE3_D185_67D9_ACDD_9468B730931D] Error_Log_Location
      ,[MasterDatabaseLocation_C63134F2_949D_AFBC_D855_A06753F75DD2] Master_DB_Location
      ,[AuthenticationMode_19A340F2_0F9F_CBF2_D5DA_48E9C81D1968] Authentication_Mode
      ,[ServicePackVersion_D080B589_4456_5A6E_85CE_235A3B68840C] SP
      ,[Edition_C294089D_3FBF_002E_06D8_2FAB53D11788] Edition
      ,[Version_F88DED9E_01CE_C201_1889_BF46DFC5CD68] SQL_Version
FROM [OperationsManager].[dbo].[MT_Microsoft$SQLServer$DBEngine]
order by instance_name


