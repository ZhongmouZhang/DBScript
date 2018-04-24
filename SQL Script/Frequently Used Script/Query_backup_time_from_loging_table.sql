select start_time
	, end_time
	, datediff (MINUTE,  start_time, end_time) [backup_duration(minute)]
from
(
select eventdate start_time
	, (select eventdate from  master.dbo.[tbl_maint_logging] where id = m.id+1 and (action like '%End of Full Backup%' or action like 'End of #full_backup')) end_time
from master.dbo.[tbl_maint_logging] m 
where action like '%Begining of Full Backup%' or action like 'Starting #full_backup'
) V
