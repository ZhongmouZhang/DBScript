select top 10 * from mci.dbo.MessageArchive
where MessageArchiveID <= (select max(MessageArchiveID)+1 from MCI_Archive.dbo.MCI_MessageArchive )
order by MessageArchiveID desc


select top 10 * from MCI_Archive.dbo.MCI_MessageArchive order by MessageArchiveID desc


-- select XML content
select top 1 ADTXML
from dbo.MCI_MessageArchive
where ADTXML.value('declare namespace ns="http://PHSA.ca/MCI";
(/ns:MCISearchRequest/ns:SourceSystemId)[1]','varchar(50)') =  '1243884'

