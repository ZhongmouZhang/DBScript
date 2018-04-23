-- instance without contact info
select instance_name, ip, instance_type, contact, description from tbl_instance
where (ip like '10.248%' or ip like '10.251%')
	and is_in_use = 'Y'
	and contact='' 
	--and description=''
order by instance_name



-- instance without DB information
select a.instance_name, a.ip, a.sql_version 
from tbl_instance a left join tbl_database b on a.id=b.instance_id
where b.instance_id is null and is_in_use='Y' and (ip like '10.248%' or ip like '10.251%')




update tbl_instance
set contact = ISNULL(contact,''), description= ISNULL(description,''), instance_type=ISNULL(instance_type,'')
