
select count(distinct a.instance_name) Total_server
	, count (b.database_name) total_database
	, sum (c.size/(1024)) [total_size(GB)]
from tbl_instance a join tbl_database b on a.id = b.instance_id
	join tbl_database_size c on b.id = c.database_id
where c.collectedtime = (select max(collectedtime) from tbl_database_size 
						where database_id = c.database_id and collectedtime between  '2013-07-01' and '2013-08-01')
	and c.collectedtime between  '2013-07-01' and '2013-08-01'

select count(distinct a.instance_name) Total_server
	, count (b.database_name) total_database
	, sum (c.size/(1024)) [total_size(GB)]
from tbl_instance a join tbl_database b on a.id = b.instance_id
	join tbl_database_size c on b.id = c.database_id
where c.collectedtime = (select max(collectedtime) from tbl_database_size 
						where database_id = c.database_id and collectedtime between  '2016-09-01' and '2016-10-01')
	and c.collectedtime between   '2016-09-01' and '2016-10-01'







