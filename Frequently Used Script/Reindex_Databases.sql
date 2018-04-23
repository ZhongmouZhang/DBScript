if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb.[dbo].#temp') and xtype='U')
drop table #temp
create table #temp
(
	dbname varchar(500)
)

insert #temp values ('XT')

exec hsp_reindex @SkipOfflineReindex=0   -- reindex all

/****************************
		SELECT name 
		FROM master.dbo.sysdatabases  
		WHERE name NOT IN ('master','model','msdb','tempdb')  
	
-- select * from #temp

******************************************/
