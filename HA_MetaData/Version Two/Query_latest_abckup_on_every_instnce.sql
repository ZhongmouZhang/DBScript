-- select the latest backup on every istance
select b.instance_name ,*
from tbl_database_backup n  join tbl_instance b on n.instance_id = b.id
where backup_set_id = 
	(
	select max (backup_set_id)
	from 
		(
		select * 
		from dbo.tbl_database_backup m
		where backup_start_date = 
			(select MAX(backup_start_date) from tbl_database_backup where m.instance_id = instance_id)
		) v
	where n.instance_id = instance_id
	)
	and is_connectable = 'Y'
	and sql_version is not null
order by backup_start_date


