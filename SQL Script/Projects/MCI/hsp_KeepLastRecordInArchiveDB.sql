CREATE TABLE #Temp_MCI_MessageArchive
(
	[MessageArchiveID] [int] NOT NULL,
	[ReceiveDate] [datetime] NULL,
	[ProcessFlag] [bit] NULL,
	[ADTXML] [xml] NULL,
)

insert into #Temp_MCI_MessageArchive ([MessageArchiveID],[ReceiveDate],[ProcessFlag],[ADTXML])
SELECT [MessageArchiveID]
		  ,[ReceiveDate]
		  ,[ProcessFlag]
		  ,[ADTXML]
FROM dbo.MCI_MessageArchive
where [MessageArchiveID]= (select max([MessageArchiveID]) from MCI_MessageArchive)

truncate table MCI_MessageArchive

insert into MCI_MessageArchive ([MessageArchiveID],[ReceiveDate],[ProcessFlag],[ADTXML])
SELECT [MessageArchiveID]
		  ,[ReceiveDate]
		  ,[ProcessFlag]
		  ,[ADTXML]
FROM #Temp_MCI_MessageArchive

drop table #Temp_MCI_MessageArchive

