 if exists (select * from dbo.sysobjects where id = object_id(N'query_db_contact') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure query_db_contact
GO

-- exec query_db_contact 'SVMSQ04'
CREATE         proc query_db_contact
@instance_name varchar (64)  = 'ALL'
as

if @instance_name = 'ALL'
	select contact1 from dbo.tbl_database_contact
	union
	select contact2 from dbo.tbl_database_contact
	union
	select contact3 from dbo.tbl_database_contact
else 
	select contact1 from dbo.tbl_database_contact where instance_name=@instance_name
	union
	select contact2 from dbo.tbl_database_contact where instance_name=@instance_name
	union
	select contact3 from dbo.tbl_database_contact where instance_name=@instance_name




--select database_name, contact1, isnull (contact2,''), isnull (contact3 ,'')
--from dbo.tbl_database_contact where instance_name='SVMSQ06'
--order by database_name
 