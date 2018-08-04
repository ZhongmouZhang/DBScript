------------------------------------------------------
-- Drop Subscription.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------

declare @publication_name varchar(256)
------------------------------------------------------
--    Insert in following line appropriate publication name
------------------------------------------------------
set @publication_name = 'publication_white_FHA'

EXEC sp_dropsubscription 
  @publication = @publication_name,
  @article = N'all',
  @subscriber = N'all';