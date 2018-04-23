USE CMDB_V2
GO

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_stats_ha_server_db_size_by_year_month') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_stats_ha_server_db_size_by_year_month
GO


create   proc [dbo].hsp_stats_ha_server_db_size_by_year_month
@year int,
@month int
as
select dbo.fn_HANameByFqn(fqn) HA, 
		count(distinct instance_name) ServerTotal , 
		COUNT(*) DBTotal,
		convert(decimal(12,2),SUM(n.size)/1024)  as [DBSize(GB)]
from dbo.tbl_instance a join tbl_database m on a.id = m.instance_id
		join 
		(
			select * from tbl_database_size m
			where collectedtime = (select max(collectedtime) from tbl_database_size 
			where database_id = m.database_id and year(collectedtime)= @year and month(collectedtime) = @month)		
		) n on m.id=n.database_id
group by dbo.fn_HANameByFqn(fqn)
with rollup 
order by HA




GO


