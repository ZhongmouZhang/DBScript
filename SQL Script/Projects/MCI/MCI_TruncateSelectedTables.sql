 use TEST_MCI
go

drop table cais_step1
drop table cais_step2
drop table cais_step3
drop table step1
drop table step2
drop table step3
go

/*
declare @beginid int, @endid int
select @beginid = min(ActionAuditID), @endid = max(ActionAuditID) from ActionAudit
exec dbo.SP_DeleteUpdateWithRange 'delete from ActionAudit where ActionAuditID between @RangeB and @RangeE', @beginid,@endID, 100000
*/

truncate table ActionAudit
truncate table CompositeClient
truncate table CompositeClientHistory
truncate table CompositeClientLink
truncate table CompositeClientLinkHistory
truncate table MessageArchive
truncate table RecordAudit
truncate table SourceClient
truncate table SourceClientLink
truncate table SSISInternalProcess
truncate table SSISPatientSearch
truncate table SSISPatientSearchResult
truncate table WorkQueue 
truncate table WorkQueueCompositeClient
truncate table WorkQueueMessage
truncate table WorkQueueSourceClient

