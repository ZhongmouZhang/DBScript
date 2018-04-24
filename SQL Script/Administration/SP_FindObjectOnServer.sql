-- sp_FindObjOnServer 'test'
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_FindObjOnServer') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_FindObjOnServer]
GO

CREATE         proc dbo.sp_FindObjOnServer
@objname varchar(100)
 
as
declare @dbname varchar(50)
declare @dest varchar(1000)
declare @path varchar(512)
declare @stt nvarchar (4000)
declare @subject_str varchar(1000)
declare @from_str varchar(500)

-- backup all the database fully
create table #temp
(
	dbname varchar(500)
)

create table #objectFound
(
	dbname varchar(500),
	objname varchar (100),
	xtype char(2)
)

insert into #temp 
select name from master.dbo.sysdatabases db
where name not in ('tempdb','distribution')
order by name

declare myCur_full cursor for 
select dbname from #temp 


open myCur_full
Fetch next from myCur_full into @dbname

while @@fetch_status = 0
begin
	set @stt = 'insert into #objectFound (dbname, objname, xtype)
	select ''' + @dbname + ''', name, xtype
	from ' + @dbname + '.dbo.sysobjects
	where name like ''%' +@objname + '%'''

	--print @stt
	exec (@stt)
	Fetch next from myCur_full into @dbname
end
close myCur_full
deallocate myCur_full

select * from #objectFound order by dbname, objname