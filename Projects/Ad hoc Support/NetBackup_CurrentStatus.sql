--oracle ZVMSC

(1) Execute the following statement to get the latest backup status
SELECT a.hostname, b.summary_status, b.START_DATE, b.FINISH_DATE
FROM  APTARE_RO.APT_V_SERVER a,  APTARE_RO.APT_V_NBU_JOB b
where a.server_id = b.client_id 
	  and b.start_date = (select max(start_date) from  APTARE_RO.APT_V_NBU_JOB c where c.CLIENT_ID = b.CLIENT_ID)
order by a.hostname 
	  	  
	  
(2) Save the output to C:\Support\DownTime\Oct\FromSCDB.xls

(3) Run SSIS package of RefreshCurrentBackupStatusFromSCDB to load the updated Excel file to FromSCDB

(4) Run the follosing on SQL Server to get the resulte needed

 select [Server ID], b.hostname, 
	case convert (int, SUMMARY_STATUS)
		when 0 then 'Successful'
		when 1 then 'Warning'
		when 2 then 'Fail'
		else NULL
	end  Status,
	start_date, finish_date
from serverlist a left join dbo.FromSCDB b 
	on rtrim(a.[Server ID])= 
		case 
			when CHARINDEX('-bck',HostName) > 0 then substring (HostName, 1, CHARINDEX('-bck',HostName)-1)
			when CHARINDEX('.', HostName) > 0 then substring (HostName, 1, CHARINDEX('.',HostName)-1)
			else HostName
		end
--where HOSTNAME is null
order by a.[Server ID]



-- Oracle
SELECT job_id, job_type, product_type, is_active, vendor_state, vendor_status, summary_status, server_id, client_id, start_date, finish_date, kilobytes, nbr_of_files, media_type, job_bitflags, nbu_job_id, parent_nbu_job_id, vendor_job_type, stream_index, policy_id, schedule_id, storage_unit_id, backup_id, target_client_id, sched_start_date, expiration_date, nbr_of_copies, try_count 
FROM APT_V_NBU_JOB

select summary_status, count(*)
FROM APT_V_NBU_JOB
group by summary_status



 


