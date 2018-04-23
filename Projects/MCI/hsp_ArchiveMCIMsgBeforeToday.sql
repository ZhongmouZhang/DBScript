if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_ArchiveMCIMsgBeforeToday') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_ArchiveMCIMsgBeforeToday
GO

CREATE         proc dbo.hsp_ArchiveMCIMsgBeforeToday
as

declare @startID bigint
declare @today datetime

SET XACT_ABORT ON
SET NOCOUNT ON 

select @startID = isnull(max([MessageArchiveID]),4115793) + 1
from [MCI_Archive].[dbo].[MCI_MessageArchive]
set @today = convert(varchar,getdate(),112)

--select @startid, @today

print 'Begining MessageArchiveID=' + convert(varchar(30),@startID) 

while ((select receiveDate from MCI.[dbo].[MessageArchive] where [MessageArchiveID]=@startid) < @today)
begin

	begin tran

	INSERT INTO [MCI_Archive].[dbo].[MCI_MessageArchive]
			   ([MessageArchiveID]
			   ,[ReceiveDate]
			   ,[ProcessFlag]
			   ,[ADTXML])
	SELECT [MessageArchiveID]
		  ,[ReceiveDate]
		  ,[ProcessFlag]
		  ,[ADTXML]
	FROM MCI.[dbo].[MessageArchive]
	where [MessageArchiveID]=@startid


	update MCI.[dbo].[MessageArchive]
	set adtxml = null
	where [MessageArchiveID]=@startid

	commit tran
	
	if (@startid % 1000 = 0)
	begin
		print 'Processed MessageArchiveID=' + convert(varchar(30),@startid) 
		waitfor delay '00:00:02'
	end
	
	set @startid = @startid + 1
	
end

print 'Ending MessageArchiveID=' + convert(varchar(30),@startid-1) 


--rollback tran