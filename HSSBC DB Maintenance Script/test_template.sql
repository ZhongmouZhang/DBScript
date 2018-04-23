 -- create a temp table to store the db names
if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

declare @current_time datetime

set @current_time = '2012-0711 14:52:00'

exec hsp_get_candidate_database_list 
'#check_integrity_day_time', '#excluded_from_default_check_integrity' ,@current_time
