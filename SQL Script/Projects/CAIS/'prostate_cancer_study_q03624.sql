 
 CREATE PROCEDURE prostate_cancer_study_q03624 AS
delete scratch..q03624
insert into scratch..q03624
SELECT  disease.agency_id, 
	dx_sha_code = pc97.small_health_area_code ,
	dx_sha_desc = null,
	Referral_status_code = 
	case disease.diag_type
		when 'R' then 1
		when 'A' then 2
		when 'P' then 2
		when 'F' then 2
	end,
	Referral_status_desc = 
	case disease.diag_type
		when 'R' then 'Registry Only'
		when 'A' then 'Full Admit'
		when 'P' then 'Full Admit'
		when 'F' then 'Full Admit'
	end,
	disease.surname, disease.fst_name, patient.snd_name, disease.sex, disease.birth_date, disease.birth_fuzz, 
	disease.known_birth_date, disease.pat_status, disease.death_date, disease.death_fuzz, disease.known_death_date, 
	disease.death_cause, disease.death_cause_desc, 
	last_contact_type_desc = l1.description, 
	disease.last_contact_date, disease.last_contact_fuzz, 
	disease.known_last_contact_date, patient.address_1, patient.address_2, 
	patient.city, patient.postal_code, patient.phone_num, disease.service_type, 
	disease.pat_type, disease.total_sites_per_pt, disease.site_num, disease.diag_type, 
	disease.diagnosis_date, disease.diagnosis_fuzz, disease.known_diagnosis_date, disease.age_at_diagnosis, 
	disease.registry_group, disease.loc_at_diag, 
	disease.site_admit_date, disease.loc_at_admit, disease.stats_group, 
	disease.treat_assess_loc, disease.tumour_group, disease.tumour_subgroup, disease.site, disease.site_desc, 
	disease.behavior, disease.hist1, disease.hist1_desc, disease.hist2, disease.hist2_desc, disease.hist3, 
	disease.hist3_desc, disease.amended_stage, disease.grade, disease.oth_clin_stg, disease.oth_clin_sys, 
	disease.oth_clin_yr, disease.oth_surg_stg, disease.oth_surg_sys, disease.oth_surg_yr, disease.tnm_clin_t, 
	disease.tnm_clin_n, disease.tnm_clin_m, disease.tnm_clin_yr, disease.tnm_surg_t, disease.tnm_surg_n, 
	disease.tnm_surg_m, disease.tnm_surg_yr, patient.fam_phys_msc_id, patient.fam_phys_last_name, 
	patient.fam_phys_first_name, patient.fam_phys_phone_num, patient.fam_phys_addr_1, patient.fam_phys_addr_2, 
	patient.fam_phys_city, patient.fam_phys_post_code,
	oth_phys_type = cast (null as varchar(20)),
	oth_phys_msc_id = null, 
	oth_phys_last_name = cast(null as varchar(50)), 
	oth_phys_first_name = cast(null as varchar(50)),
	oth_phys_phone_num = cast(null as varchar(50)),
	oth_phys_addr_1 = cast(null as varchar(50)), 
	oth_phys_addr_2 = cast(null as varchar(50)),
	oth_phys_city = cast(null as varchar(20)),
	oth_phys_post_code = cast(null as varchar(10))
FROM disease
inner join  cais..lookup_post_code_97 pc97 on disease.loc_at_diag = pc97.postal_code and isnull(pc97.small_health_area_code, '') In ('','201','202','034','035','037','038','040','041','042','043','044','045','161', '162', '163', '164', '165', '166', '169')
left join lookup l1 on disease.last_contact_type = l1.code and l1.table_num = 146,
patient
WHERE disease.pat_type Not Like '%P%' 
AND disease.agency_id = patient.agency_id
AND disease.tumour_subgroup='PR' 
AND disease.diagnosis_date Between '4/1/2003' And '9/30/2007' 
AND disease.age_at_diagnosis Between 20 And 79 
AND disease.registry_group='B' 
AND disease.behavior>'2'

UNION

SELECT  disease.agency_id, 
dx_sha_code = null ,
dx_sha_desc = null,
Referral_status_code = 
	case disease.diag_type
	when 'R' then 1
	when 'A' then 2
	when 'P' then 2
	when 'F' then 2
	end,
Referral_status_desc = 
	case disease.diag_type
	when 'R' then 'Registry Only'
	when 'A' then 'Full Admit'
	when 'P' then 'Full Admit'
	when 'F' then 'Full Admit'
	end,
disease.surname, disease.fst_name, patient.snd_name, disease.sex, disease.birth_date, disease.birth_fuzz, 
disease.known_birth_date, disease.pat_status, disease.death_date, disease.death_fuzz, disease.known_death_date, 
disease.death_cause, disease.death_cause_desc, 
last_contact_type_desc = l1.description, 
disease.last_contact_date, disease.last_contact_fuzz, 
disease.known_last_contact_date, patient.address_1, patient.address_2, 
patient.city, patient.postal_code, patient.phone_num, disease.service_type, 
disease.pat_type, disease.total_sites_per_pt, disease.site_num, disease.diag_type, 
disease.diagnosis_date, disease.diagnosis_fuzz, disease.known_diagnosis_date, disease.age_at_diagnosis, 
disease.registry_group, disease.loc_at_diag, 
disease.site_admit_date, disease.loc_at_admit, disease.stats_group, 
disease.treat_assess_loc, disease.tumour_group, disease.tumour_subgroup, disease.site, disease.site_desc, 
disease.behavior, disease.hist1, disease.hist1_desc, disease.hist2, disease.hist2_desc, disease.hist3, 
disease.hist3_desc, disease.amended_stage, disease.grade, disease.oth_clin_stg, disease.oth_clin_sys, 
disease.oth_clin_yr, disease.oth_surg_stg, disease.oth_surg_sys, disease.oth_surg_yr, disease.tnm_clin_t, 
disease.tnm_clin_n, disease.tnm_clin_m, disease.tnm_clin_yr, disease.tnm_surg_t, disease.tnm_surg_n, 
disease.tnm_surg_m, disease.tnm_surg_yr, patient.fam_phys_msc_id, patient.fam_phys_last_name, 
patient.fam_phys_first_name, patient.fam_phys_phone_num, patient.fam_phys_addr_1, patient.fam_phys_addr_2, 
patient.fam_phys_city, patient.fam_phys_post_code,
oth_phys_type = null,
oth_phys_msc_id = null, 
oth_phys_last_name = null, 
oth_phys_first_name = null,
oth_phys_phone_num = null,
oth_phys_addr_1 = null, 
oth_phys_addr_2 = null,
oth_phys_city = null,
oth_phys_post_code = null 
FROM disease
left join lookup l1 on disease.last_contact_type = l1.code and l1.table_num = 146,
patient
WHERE disease.pat_type Not Like '%P%' 
And Not Exists ( Select * from cais..lookup_post_code_97 pc97
    where disease.loc_at_diag = pc97.postal_code)
AND disease.agency_id = patient.agency_id
AND disease.tumour_subgroup='PR' 
AND disease.diagnosis_date Between '4/1/2003' And '9/30/2007' 
AND disease.age_at_diagnosis Between 20 And 79 
AND disease.registry_group='B' 
AND disease.behavior>'2'
ORDER BY disease.agency_id, disease.site_num;

update scratch..q03624
	set oth_phys_type = 'Registering',
	oth_phys_msc_id = p.msc_id, 
	oth_phys_last_name = p.last_name, 
	oth_phys_first_name = p.first_name,
	oth_phys_phone_num = pp.phone_num,
	oth_phys_addr_1 = pa.address_1, 
	oth_phys_addr_2 = pa.address_2,
	oth_phys_city = pa.city,
	oth_phys_post_code = pa.post_code
from cais..pers_phys
	left join cais..physician p on p.agency_id = cais..pers_phys.phys_agency_id
	left join cais..physician_address pa on pa.phys_sys_id = p.phys_sys_id
	left join cais..physician_phone pp on pp.phys_sys_id = p.phys_sys_id and pp.voice_flag = 'Y'
where scratch..q03624.agency_id = cais..pers_phys.pers_agency_id
and cais..pers_phys.pers_phys_type = 'G'
and isnull(scratch..q03624.fam_phys_msc_id, '') = ''
and isnull(oth_phys_type,'')=''

update scratch..q03624
	set oth_phys_type = 'Referring',
	oth_phys_msc_id = p.msc_id, 
	oth_phys_last_name = p.last_name, 
	oth_phys_first_name = p.first_name,
	oth_phys_phone_num = pp.phone_num,
	oth_phys_addr_1 = pa.address_1, 
	oth_phys_addr_2 = pa.address_2,
	oth_phys_city = pa.city,
	oth_phys_post_code = pa.post_code
from cais..pers_phys
	left join cais..physician p on p.agency_id = cais..pers_phys.phys_agency_id
	left join cais..physician_address pa on pa.phys_sys_id = p.phys_sys_id
	left join cais..physician_phone pp on pp.phys_sys_id = p.phys_sys_id and pp.voice_flag = 'Y'
where scratch..q03624.agency_id = cais..pers_phys.pers_agency_id
and cais..pers_phys.pers_phys_type = 'R'
and isnull(scratch..q03624.fam_phys_msc_id, '') = ''
and isnull(oth_phys_type,'')=''

update scratch..q03624
	set oth_phys_type = 'Consulting',
	oth_phys_msc_id = p.msc_id, 
	oth_phys_last_name = p.last_name, 
	oth_phys_first_name = p.first_name,
	oth_phys_phone_num = pp.phone_num,
	oth_phys_addr_1 = pa.address_1, 
	oth_phys_addr_2 = pa.address_2,
	oth_phys_city = pa.city,
	oth_phys_post_code = pa.post_code
from cais..pers_phys
	left join cais..physician p on p.agency_id = cais..pers_phys.phys_agency_id
	left join cais..physician_address pa on pa.phys_sys_id = p.phys_sys_id
	left join cais..physician_phone pp on pp.phys_sys_id = p.phys_sys_id and pp.voice_flag = 'Y'
where scratch..q03624.agency_id = cais..pers_phys.pers_agency_id
and cais..pers_phys.pers_phys_type = 'C'
and isnull(scratch..q03624.fam_phys_msc_id, '') = ''
and isnull(oth_phys_type,'')=''

update scratch..q03624
	set oth_phys_type = 'Other',
	oth_phys_msc_id = p.msc_id, 
	oth_phys_last_name = p.last_name, 
	oth_phys_first_name = p.first_name,
	oth_phys_phone_num = pp.phone_num,
	oth_phys_addr_1 = pa.address_1, 
	oth_phys_addr_2 = pa.address_2,
	oth_phys_city = pa.city,
	oth_phys_post_code = pa.post_code
from cais..pers_phys
	left join cais..physician p on p.agency_id = cais..pers_phys.phys_agency_id
	left join cais..physician_address pa on pa.phys_sys_id = p.phys_sys_id
	left join cais..physician_phone pp on pp.phys_sys_id = p.phys_sys_id and pp.voice_flag = 'Y'
where scratch..q03624.agency_id = cais..pers_phys.pers_agency_id
and cais..pers_phys.pers_phys_type = 'O'
and isnull(scratch..q03624.fam_phys_msc_id, '') = ''
and isnull(oth_phys_type,'')=''

update scratch..q03624
set dx_sha_desc = l.description
from lookup l 
where table_num = 117
and scratch..q03624.dx_sha_code = l.code
GO
