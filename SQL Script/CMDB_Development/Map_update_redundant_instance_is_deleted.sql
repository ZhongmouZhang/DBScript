begin tran
update tbl_sql_instance
set is_deleted = 'Y'
where instance_name in 

(
	select dup_instance + '.vch.ca'
	from 
	(
	select replace(instance_name,'.vch.ca','') dup_instance, count(*) [count]
	from tbl_sql_instance
	where is_deleted = 'N'
	group by replace(instance_name,'.vch.ca','')
	having count(*)>1
	) v
)
-- commit tran
