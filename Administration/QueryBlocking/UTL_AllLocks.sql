 /*********************************************************************
	Find out all the locks on a server
**********************************************************************/
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	spid int,
	dbid int,
	objid int,
	indid int,
	type varchar(16),
	Resource varchar(200),
	Mode varchar(16),
	status varchar(16)
)

insert into #temp
exec sp_lock

select #temp.*, db.name, obj.name, obj.type, obj.type_desc
from #temp join sys.databases db on #temp.dbid=db.database_id
		join sys.all_objects obj on #temp.objid = obj.object_id
		


