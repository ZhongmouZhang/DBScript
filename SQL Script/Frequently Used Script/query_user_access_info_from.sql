select i.instance_name, v.*
from tbl_instance i join 
(
select instance_id, database_name, login_account, max(latest_login) last_login_time
from [tbl_connection_tracker_last_batch]
where instance_id in (427, 436, 437, 499, 521, 522)
	and database_name not in ('master','msdb','model','tempdb')
	and login_account not in ('NT AUTHORITY\SYSTEM','', 'PHSABC\sa-Brian.Chiu', 'PHSABC\x-james','VCH\jtong_sa','VCH\rraoofi_SA', 'SFHR\dgee_sa')
group by instance_id, database_name, login_account
) v on i.id = v.instance_id
order by v.instance_id, v.database_name, v.login_account