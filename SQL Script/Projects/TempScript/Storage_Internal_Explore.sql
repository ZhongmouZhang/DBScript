 CREATE TABLE tExample3(
 
strEmplCode int identity(1001,1),
 
strFirstName varchar(100),
 
strDeptCode char(6) NOT NULL,
 
strAddress varchar(500),
 
intSalary int)
 
GO


select so.name, so.object_id, sp.index_id, internals.total_pages, internals.used_pages, internals.data_pages, first_iam_page, first_page, root_page
 
      from sys.objects so
 
      inner join sys.partitions sp on so.object_id = sp.object_id
 
      inner join sys.allocation_units sa on sa.container_id = sp.hobt_id
 
      inner join sys.system_internals_allocation_units internals on internals.container_id = sa.container_id
 
where so.object_id = object_id('tExample3')
 
go


INSERT INTO tExample3(strFirstName, strDeptCode, strAddress, intSalary)
 
VALUES('AAAAA', 'DEPT01', 'CHENNAI', '12500')
 
GO 1000

/* a table page details  */
DBCC TRACEON(3604)
 
DBCC IND('LearningInternals', 'tExample3', -1)
 
DBCC TRACEOFF(3604)



/*   Here is the query to list all tables and pages allocated to each table.
 
 */
 
select so.name, so.object_id, sp.index_id, sp.partition_id, sp.hobt_id, sa.container_id, internals.total_pages, internals.used_pages, internals.data_pages, first_page, root_page, first_iam_page
 
      from sys.objects so
 
      inner join sys.partitions sp on so.object_id = sp.object_id
 
      inner join sys.allocation_units sa on sa.container_id = sp.hobt_id
 
      inner join sys.system_internals_allocation_units internals on internals.container_id = sa.container_id
 
where so.name not like 'sys%'

