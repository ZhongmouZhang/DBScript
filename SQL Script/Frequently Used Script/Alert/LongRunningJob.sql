
-- the jobs which have been running for more than 30 minutes

select j.name, jact.*
from msdb..sysjobs j join msdb..sysjobactivity jact on j.job_id = jact.job_id
where jact.start_execution_date is not null and jact.start_execution_date is null
	and DATEDIFF (minute, jact.start_execution_date, getdate()) > 30