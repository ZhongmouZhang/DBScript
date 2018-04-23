-- Dropping the transactional publication

-- NOT NEED TO DO THIS TO DROP PUBLICATION IF THE DATABASE IS NOT TO BE REFRESHED
--- DON'T EXECUTE THIS ON PRODUCTION DATABASE
use [white3]
exec sp_droppublication @publication = N'publication_white_FHA_UAT'
GO

