/**************************** 1 ***************************************************/
 create table #temp 
( feedback_head_id bigint)

select distinct feedback_head_id 
insert into #temp (feedback_head_id)
		select max(feedback_head_id)
		from spr_bp_feedback_head
		where feedback_record_type = 4
			and pat_id is not null
		group by rha_id, fac_id, pat_id
		union
		select max(feedback_head_id)
		from spr_bp_feedback_head
		where feedback_record_type = 2
			and orb_booking_no is not null
		group by rha_id, fac_id, orb_booking_no
		union
		select max(feedback_head_id)
		from spr_bp_feedback_head
		where feedback_record_type = 3
			and orb_case_no is not null
		group by rha_id, fac_id, orb_case_no


update spr_bp_feedback_head
set latest_upload = 1
from #temp 
where spr_bp_feedback_head.feedback_head_id=#temp.feedback_head_id



/******************************  2  ********************************************/

-- set feedback head error status
UPDATE spr_bp_feedback_head
SET		err_status_id = 1 -- outstanding
where result_code <> 4 and fixed_date is null


/******************************  3   *****************************************/
-- set feedback head error status "Fixed Batch"
update spr_bp_feedback_head
SET err_status_id = 2 -- Fixed Batch
WHERE result_code <> 4 and fixed_date is not null


/********************************  4  ***************************************/
update t1
set t1.err_status_id = 2,
	t1.fixed_date = t2.fixed_date
from spr_bp_feedback_head t1
	inner join (select rha_id, fac_id, pat_id, max(create_date) fixed_date
		from spr_bp_feedback_head
		where feedback_record_type = 4
			and pat_id is not null
			and result_code = 4
			and latest_upload = 1
		group by rha_id, fac_id, pat_id) AS t2
	on t1.rha_id = t2.rha_id and t1.fac_id = t2.fac_id and t1.pat_id = t2.pat_id
where t1.result_code <> 4 and t1.latest_upload = 0 and t1.fixed_date is null
