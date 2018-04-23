-- =============================================
-- Script Template
-- =============================================


--query_newly_added_database 'SVMSQ05'


IF OBJECTPROPERTY ( object_id('query_newly_added_database'),'IsProcedure') = 1
	DROP PROC query_newly_added_database
GO

CREATE PROC query_newly_added_database 
@servername varchar(100) = ''
AS
 declare @querystring varchar(4096)

if @servername = ''
begin
	print 'Server name cannot be empty'
	return
end
 
 set @querystring='SELECT a.*, b.*
FROM OPENROWSET(''SQLNCLI'', ''Server=' + @servername 
+ ';Trusted_Connection=yes;'',
     ''SELECT name FROM master.sys.databases'' ) AS a 
     full join HA_MetaData.dbo.tbl_database_contact b on a.name=b.database_name
where not a.name in (''master'',''tempdb'',''model'',''msdb'') 
		and ( b.database_name is null or a.name is null)'
 
 exec (@querystring)
 
