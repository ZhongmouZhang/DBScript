 if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_EmailActualDataSize') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_EmailActualDataSize
GO

CREATE         proc dbo.sp_EmailActualDataSize
as

create table #temp
(
	name varchar(100),
	rows int,
	reserved varchar(100),
	date varchar(100),
	index_size varchar(100),
	unused varchar(100)
)

declare myCur cursor for 
--select table_name from INFORMATION_SCHEMA.TABLES
select sysusers.name + '.' + sysobjects.name name from sysobjects join sysusers on sysobjects.uid=sysusers.uid where sysobjects.xtype='U'

declare @tablename  varchar(100)

open myCur
Fetch next from myCur into @tablename

while @@fetch_status = 0
begin
	insert into #temp
	exec sp_spaceused @tablename
	Fetch next from myCur into @tablename
end

close myCur
deallocate myCur

declare @subject_str varchar(1000)
select @subject_str = 'The current data size of NMSReporting is ' + convert(varchar, sum(convert(int, substring(reserved, 1, patindex('%KB%',reserved) - 1)))/1024) + ' MB' from #temp 
EXEC master.dbo.usp_sendcdomail
@From = 'VSQLB02\ISQB02@phsa.ca', 
@To = 'jzhang2@phsa.ca',
--@To = 'rgrover2@phsa.ca; nms-phsa@bycast.com; jzhang2@phsa.ca;aamlani@phsa.ca',
@Subject = @subject_str, 
@Body = 'Please truncate the data when the size is above 1500MB'


