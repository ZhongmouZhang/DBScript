/******************************************************************************
 
            Drop all the foreign keys  
 
*******************************************************************************/
 
ALTER TABLE spr_assm_stat_defn_audt
DROP  CONSTRAINT FK_spr_assm_stat_defn_audt_spr_assm_stat_defn
 
ALTER TABLE spr_bp_feedback_detail
DROP  CONSTRAINT FK_spr_bp_feedback_detail_spr_bp_feedback_head
 
ALTER TABLE spr_bp_feedback_head
DROP  CONSTRAINT FK_spr_bp_feedback_head_spr_bp_rha_file_process_log
 
ALTER TABLE spr_bp_rha_booking_rec_in
DROP  CONSTRAINT FK_spr_bp_rha_booking_rec_in_spr_bp_rha_file_process_log
 
ALTER TABLE spr_bp_rha_pat_rec_in
DROP  CONSTRAINT FK_spr_bp_rha_pat_rec_in_spr_bp_rha_file_process_log
 
ALTER TABLE spr_bp_rha_postsurg_rec_in
DROP  CONSTRAINT FK_spr_bp_rha_postsurg_rec_in_spr_bp_rha_file_process_log
 
ALTER TABLE spr_cancel_reason_defn_audt
DROP  CONSTRAINT FK_spr_cancel_reason_defn_audt_spr_cancel_reason_defn
 
ALTER TABLE spr_cancel_reason_list
DROP  CONSTRAINT FK_spr_cancel_reason_list_spr_rha_defn
 
ALTER TABLE spr_cancel_reason_list_audt
DROP  CONSTRAINT FK_spr_cancel_reason_list_audt_spr_cancel_reason_list
 
ALTER TABLE spr_enct_type_defn_audt
DROP  CONSTRAINT FK_spr_enct_type_defn_audt_spr_enct_type_defn
 
ALTER TABLE spr_enct_type_list
DROP  CONSTRAINT FK_spr_enct_type_list_spr_rha_defn
 
ALTER TABLE spr_enct_type_list_audt
DROP  CONSTRAINT FK_spr_enct_type_list_audt_spr_enct_type_list
 
ALTER TABLE spr_eval_defn
DROP  CONSTRAINT FK_spr_eval_defn_spr_surg_serv_defn
 
ALTER TABLE spr_eval_defn_audt
DROP  CONSTRAINT FK_spr_eval_defn_audt_spr_eval_defn
 
ALTER TABLE spr_eval_qstn
DROP  CONSTRAINT FK_spr_eval_qstn_spr_eval_defn
 
ALTER TABLE spr_eval_qstn_audt
DROP  CONSTRAINT FK_spr_eval_qstn_audt_spr_eval_qstn
 
ALTER TABLE spr_eval_qstn_choi
DROP  CONSTRAINT FK_spr_eval_qstn_choi_spr_eval_qstn_part
 
ALTER TABLE spr_eval_qstn_choi_audt
DROP  CONSTRAINT FK_spr_eval_qstn_choi_audt_spr_eval_qstn_choi
 
ALTER TABLE spr_eval_qstn_part
DROP  CONSTRAINT FK_spr_eval_qstn_part_spr_eval_qstn
 
ALTER TABLE spr_eval_qstn_part_audt
DROP  CONSTRAINT FK_spr_eval_qstn_part_audt_spr_eval_qstn_part
 
ALTER TABLE spr_fac_defn
DROP  CONSTRAINT FK_spr_fac_defn_spr_hsda_defn
 
ALTER TABLE spr_fac_defn
DROP  CONSTRAINT FK_spr_fac_defn_spr_postpone_reason_list
 
ALTER TABLE spr_fac_defn
DROP  CONSTRAINT FK_spr_fac_defn_spr_rha_defn
 
ALTER TABLE spr_fac_defn
DROP  CONSTRAINT FK_spr_fac_defn_spr_proc_list
 
ALTER TABLE spr_fac_defn
DROP  CONSTRAINT FK_spr_fac_defn_spr_cancel_reason_list
 
ALTER TABLE spr_fac_defn
DROP  CONSTRAINT FK_spr_fac_defn_spr_enct_type_list
 
ALTER TABLE spr_fac_defn_audt
DROP  CONSTRAINT FK_spr_fac_defn_audt_spr_fac_defn
 
ALTER TABLE spr_iact_defn_audt
DROP  CONSTRAINT FK_spr_iact_defn_audt_spr_iact_defn
 
ALTER TABLE spr_inac_assm_xpln_defn_audt
DROP  CONSTRAINT FK_spr_inac_assm_xpln_defn_audt_spr_inac_assm_xpln_defn
 
ALTER TABLE spr_md
DROP  CONSTRAINT FK_spr_md_spr_providers
 
ALTER TABLE spr_md
DROP  CONSTRAINT FK_spr_md_spr_rha_defn
 
ALTER TABLE spr_md
DROP  CONSTRAINT FK_spr_md_spr_spec_defn
 
ALTER TABLE spr_md_audt
DROP  CONSTRAINT FK_spr_md_audt_spr_md
 
ALTER TABLE spr_md_ref
DROP  CONSTRAINT FK_spr_md_ref_spr_rha_defn
 
ALTER TABLE spr_pat
DROP  CONSTRAINT FK_spr_pat_spr_pat_alt_id_type
 
ALTER TABLE spr_pat
DROP  CONSTRAINT FK_spr_pat_spr_rha_defn
 
ALTER TABLE spr_pat
DROP  CONSTRAINT FK_spr_pat_spr_sex
 
ALTER TABLE spr_pat
DROP  CONSTRAINT FK_spr_pat_spr_province
 
ALTER TABLE spr_pat
DROP  CONSTRAINT FK_spr_pat_spr_spec_postal_code
 
ALTER TABLE spr_pat
DROP  CONSTRAINT FK_spr_pat_spr_spec_postal_code1
 
ALTER TABLE spr_pat
DROP  CONSTRAINT FK_spr_pat_spr_province1
 
ALTER TABLE spr_pat_alt_id_type_audt
DROP  CONSTRAINT FK_spr_pat_id_type_audt_spr_pat_id_type
 
ALTER TABLE spr_pat_audt
DROP  CONSTRAINT FK_spr_pat_audt_spr_pat
 
ALTER TABLE spr_pat_err
DROP  CONSTRAINT FK_spr_pat_err_spr_pat
 
ALTER TABLE spr_pat_err_audt
DROP  CONSTRAINT FK_spr_pat_err_audt_spr_pat_err
 
ALTER TABLE spr_pat_eval
DROP  CONSTRAINT FK_spr_pat_eval_spr_assm_stat_defn
 
ALTER TABLE spr_pat_eval
DROP  CONSTRAINT FK_spr_pat_eval_spr_eval_defn
 
ALTER TABLE spr_pat_eval
DROP  CONSTRAINT FK_spr_pat_eval_spr_inac_assm_xpln_defn
 
ALTER TABLE spr_pat_eval
DROP  CONSTRAINT FK_spr_pat_eval_spr_wait_list_cat_defn
 
ALTER TABLE spr_pat_eval
DROP  CONSTRAINT FK_spr_pat_eval_spr_pat
 
ALTER TABLE spr_pat_eval
DROP  CONSTRAINT FK_spr_pat_eval_spr_rha_defn
 
ALTER TABLE spr_pat_eval_answ
DROP  CONSTRAINT FK_spr_pat_eval_answ_spr_pat_eval
 
ALTER TABLE spr_pat_eval_answ_audt
DROP  CONSTRAINT FK_spr_pat_eval_answ_audt_spr_pat_eval_answ
 
ALTER TABLE spr_pat_eval_answ_err
DROP  CONSTRAINT FK_spr_pat_eval_answ_err_spr_pat_eval
 
ALTER TABLE spr_pat_eval_answ_err_audt
DROP  CONSTRAINT FK_spr_pat_eval_answ_err_audt_spr_pat_eval_answ_err
 
ALTER TABLE spr_pat_eval_audt
DROP  CONSTRAINT FK_spr_pat_eval_audt_spr_pat_eval
 
ALTER TABLE spr_pat_eval_err
DROP  CONSTRAINT FK_spr_pat_eval_err_spr_pat_eval
 
ALTER TABLE spr_pat_eval_err_audt
DROP  CONSTRAINT FK_spr_pat_eval_err_audt_spr_pat_eval_err
 
ALTER TABLE spr_pat_unvl_defn_audt
DROP  CONSTRAINT FK_spr_pat_unvl_defn_audt_spr_pat_unvl_defn
 
ALTER TABLE spr_post_code_rha_xref
DROP  CONSTRAINT FK_spr_post_code_rha_xref_spr_rha_defn
 
ALTER TABLE spr_post_code_rha_xref_audt
DROP  CONSTRAINT FK_spr_post_code_rha_xref_audt_spr_post_code_rha_xref
 
ALTER TABLE spr_postpone_reason_defn_audt
DROP  CONSTRAINT FK_spr_defr_xpln_defn_audt_spr_defr_xpln_defn
 
ALTER TABLE spr_postpone_reason_list
DROP  CONSTRAINT FK_spr_postpone_reason_list_spr_rha_defn
 
ALTER TABLE spr_postpone_reason_list_audt
DROP  CONSTRAINT FK_spr_postpone_reason_list_audt_spr_postpone_reason_list
 
ALTER TABLE spr_proc_defn
DROP  CONSTRAINT FK_spr_proc_defn_spr_surg_serv_defn
 
ALTER TABLE spr_proc_defn_audt
DROP  CONSTRAINT FK_spr_proc_defn_audt_spr_proc_defn
 
ALTER TABLE spr_proc_list
DROP  CONSTRAINT FK_spr_proc_list_spr_rha_defn
 
ALTER TABLE spr_proc_list_audt
DROP  CONSTRAINT FK_spr_proc_list_audt_spr_proc_list
 
ALTER TABLE spr_providers_audt
DROP  CONSTRAINT FK_spr_providers_audt_spr_providers
 
ALTER TABLE spr_province_audt
DROP  CONSTRAINT FK_spr_province_audt_spr_province
 
ALTER TABLE spr_rha_cancel_reason_defn
DROP  CONSTRAINT FK_spr_rha_cancel_reason_defn_spr_cancel_reason_defn
 
ALTER TABLE spr_rha_cancel_reason_defn
DROP  CONSTRAINT FK_spr_rha_cancel_reason_defn_spr_cancel_reason_list1
 
ALTER TABLE spr_rha_cancel_reason_defn_audt
DROP  CONSTRAINT FK_spr_rha_cancel_reason_defn_audt_spr_rha_cancel_reason_defn
 
ALTER TABLE spr_rha_defn_audt
DROP  CONSTRAINT FK_spr_rha_defn_audt_spr_rha_defn
 
ALTER TABLE spr_rha_enct_type_defn
DROP  CONSTRAINT FK_spr_rha_enct_type_defn_spr_enct_type_defn
 
ALTER TABLE spr_rha_enct_type_defn
DROP  CONSTRAINT FK_spr_rha_enct_type_defn_spr_enct_type_list
 
ALTER TABLE spr_rha_enct_type_defn_audt
DROP  CONSTRAINT FK_spr_rha_enct_type_defn_audt_spr_rha_enct_type_defn
 
ALTER TABLE spr_rha_postpone_reason_defn
DROP  CONSTRAINT FK_spr_rha_postpone_reason_defn_spr_postpone_reason_defn
 
ALTER TABLE spr_rha_postpone_reason_defn
DROP  CONSTRAINT FK_spr_rha_postpone_reason_defn_spr_postpone_reason_list
 
ALTER TABLE spr_rha_postpone_reason_defn_audt
DROP  CONSTRAINT FK_spr_rha_postpone_reason_defn_audt_spr_rha_postpone_reason_defn
 
ALTER TABLE spr_rha_proc
DROP  CONSTRAINT FK_spr_rha_proc_spr_proc_defn
 
ALTER TABLE spr_rha_proc
DROP  CONSTRAINT FK_spr_rha_proc_spr_proc_list
 
ALTER TABLE spr_rha_proc_audt
DROP  CONSTRAINT FK_spr_rha_proc_audt_spr_rha_proc
 
ALTER TABLE spr_sex_audt
DROP  CONSTRAINT FK_spr_sex_audt_spr_sex
 
ALTER TABLE spr_side_audt
DROP  CONSTRAINT FK_spr_side_audt_spr_side
 
ALTER TABLE spr_spec_defn_audt
DROP  CONSTRAINT FK_spr_spec_defn_audt_spr_spec_defn
 
ALTER TABLE spr_spec_postal_code_audt
DROP  CONSTRAINT FK_spr_spec_postal_code_audt_spr_spec_postal_code
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_iact_defn
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_rha_proc
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_pat_unvl_defn2
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_rha_proc2
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_rha_proc3
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_rha_proc1
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_rha_cancel_reason_defn
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_pat_eval
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_rha_enct_type_defn
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_rha_postpone_reason_defn
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_pat_unvl_defn1
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_pat_unvl_defn
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_side
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_fac_defn
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_side1
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_side2
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_pat_rha
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_side3
 
ALTER TABLE spr_surg_case
DROP  CONSTRAINT FK_spr_surg_case_spr_surg_stat_defn
 
ALTER TABLE spr_surg_case_audt
DROP  CONSTRAINT FK_spr_surg_case_audt_spr_surg_case
 
ALTER TABLE spr_surg_case_err
DROP  CONSTRAINT FK_spr_surg_case_err_spr_surg_case
 
ALTER TABLE spr_surg_case_err_audt
DROP  CONSTRAINT FK_spr_surg_case_err_audt_spr_surg_case_err
 
ALTER TABLE spr_surg_post_op
DROP  CONSTRAINT FK_spr_surg_post_op_spr_pat_rha
 
ALTER TABLE spr_surg_post_op
DROP  CONSTRAINT FK_spr_surg_post_op_spr_fac_defn
 
ALTER TABLE spr_surg_post_op
DROP  CONSTRAINT FK_spr_surg_post_op_spr_side1
 
ALTER TABLE spr_surg_post_op
DROP  CONSTRAINT FK_spr_surg_post_op_spr_side2
 
ALTER TABLE spr_surg_post_op
DROP  CONSTRAINT FK_spr_surg_post_op_spr_side3
 
ALTER TABLE spr_surg_post_op
DROP  CONSTRAINT FK_spr_surg_post_op_spr_surg_case
 
ALTER TABLE spr_surg_post_op
DROP  CONSTRAINT FK_spr_surg_post_op_spr_rha_proc
 
ALTER TABLE spr_surg_post_op
DROP  CONSTRAINT FK_spr_surg_post_op_spr_rha_proc1
 
ALTER TABLE spr_surg_post_op
DROP  CONSTRAINT FK_spr_surg_post_op_spr_rha_proc2
 
ALTER TABLE spr_surg_post_op
DROP  CONSTRAINT FK_spr_surg_post_op_spr_rha_proc3
 
ALTER TABLE spr_surg_post_op
DROP  CONSTRAINT FK_spr_surg_post_op_spr_side
 
ALTER TABLE spr_surg_post_op_audt
DROP  CONSTRAINT FK_spr_surg_post_op_audt_spr_surg_post_op
 
ALTER TABLE spr_surg_post_op_err
DROP  CONSTRAINT FK_spr_surg_post_op_err_spr_surg_post_op
 
ALTER TABLE spr_surg_post_op_err_audt
DROP  CONSTRAINT FK_spr_surg_post_op_err_audt_spr_surg_post_op_err
 
ALTER TABLE spr_surg_serv_defn_audt
DROP  CONSTRAINT FK_spr_surg_serv_defn_audt_spr_surg_serv_defn
 
ALTER TABLE spr_surg_stat_defn_audt
DROP  CONSTRAINT FK_spr_surg_stat_defn_audt_spr_surg_stat_defn
 
ALTER TABLE spr_wait_list_cat_defn_audt
DROP  CONSTRAINT FK_spr_wait_list_cat_defn_audt_spr_wait_list_cat_defn
 
ALTER TABLE spr_xsys_data_dict_audt
DROP  CONSTRAINT FK_spr_xsys_data_dict_audt_spr_xsys_data_dict
 
ALTER TABLE spr_xsys_err_defn_audt
DROP  CONSTRAINT FK_spr_xsys_err_defn_audt_spr_xsys_err_defn
 
ALTER TABLE spr_xsys_err_grp_xref
DROP  CONSTRAINT FK_spr_xsys_err_grp_xref_spr_xsys_err_defn
 
ALTER TABLE spr_xsys_err_grp_xref
DROP  CONSTRAINT FK_spr_xsys_err_grp_xref_spr_xsys_grp_defn
 
ALTER TABLE spr_xsys_err_grp_xref_audt
DROP  CONSTRAINT FK_spr_xsys_err_grp_xref_audt_spr_xsys_err_grp_xref
 
ALTER TABLE spr_xsys_grp_defn_audt
DROP  CONSTRAINT FK_spr_xsys_grp_defn_audt_spr_xsys_grp_defn
 
ALTER TABLE spr_xsys_rpt_cat_defn_audt
DROP  CONSTRAINT FK_spr_xsys_rpt_cat_defn_audt_spr_xsys_rpt_cat_defn
 
ALTER TABLE spr_xsys_rpt_defn
DROP  CONSTRAINT FK_spr_xsys_rpt_defn_spr_xsys_rpt_cat_defn
 
ALTER TABLE spr_xsys_rpt_defn_audt
DROP  CONSTRAINT FK_spr_xsys_rpt_defn_audt_spr_xsys_rpt_defn
 
ALTER TABLE spr_xsys_rpt_grp_xref
DROP  CONSTRAINT FK_spr_xsys_rpt_grp_xref_spr_xsys_grp_defn
 
ALTER TABLE spr_xsys_rpt_grp_xref
DROP  CONSTRAINT FK_spr_xsys_rpt_grp_xref_spr_xsys_rpt_defn
 
ALTER TABLE spr_xsys_rpt_grp_xref_audt
DROP  CONSTRAINT FK_spr_xsys_rpt_grp_xref_audt_spr_xsys_rpt_grp_xref
 
ALTER TABLE spr_xsys_user_audt
DROP  CONSTRAINT FK_spr_xsys_user_audt_spr_xsys_user
 
ALTER TABLE spr_xsys_user_grp_xref
DROP  CONSTRAINT FK_spr_xsys_user_grp_xref_spr_xsys_grp_defn
 
ALTER TABLE spr_xsys_user_grp_xref
DROP  CONSTRAINT FK_spr_xsys_user_grp_xref_spr_xsys_user
 
ALTER TABLE spr_xsys_user_grp_xref_audt
DROP  CONSTRAINT FK_spr_xsys_user_grp_xref_audt_spr_xsys_user_grp_xref
 
ALTER TABLE spr_xsys_user_rha_xref
DROP  CONSTRAINT FK_spr_xsys_user_rha_xref_spr_rha_defn
 
ALTER TABLE spr_xsys_user_rha_xref
DROP  CONSTRAINT FK_spr_xsys_user_rha_xref_spr_xsys_user
 
ALTER TABLE spr_xsys_user_rha_xref_audt
DROP  CONSTRAINT FK_spr_xsys_user_rha_xref_audt_spr_xsys_user_rha_xref
 
ALTER TABLE spr_xsys_user_srgn_xref
DROP  CONSTRAINT FK_spr_xsys_user_srgn_xref_spr_rha_defn
 
ALTER TABLE spr_xsys_user_srgn_xref
DROP  CONSTRAINT FK_spr_xsys_user_srgn_xref_spr_xsys_user
 
ALTER TABLE spr_xsys_user_srgn_xref_audt
DROP  CONSTRAINT FK_spr_xsys_user_srgn_xref_audt_spr_xsys_user_srgn_xref
 
ALTER TABLE spr_xsys_web_page_grp_xref
DROP  CONSTRAINT FK_spr_xsys_web_page_grp_xref_spr_xsys_grp_defn
 
ALTER TABLE spr_xsys_web_page_grp_xref_audt
DROP  CONSTRAINT FK_spr_xsys_web_page_grp_xref_audt_spr_xsys_web_page_grp_xref
 
 /************************************************  
 
     1) Scrambling [SPR_STG].[dbo].[md_quik_info]....
 
 ***************************************************/
print '1: Scrambling [SPR_STG].[dbo].[md_quik_info]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[md_quik_info_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[md_quik_info_CH]
 
select * into [SPR_STG].[dbo].[md_quik_info_CH] from [SPR_STG].[dbo].[md_quik_info] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[md_quik_info]'))
    set identity_insert [SPR_STG].[dbo].[md_quik_info_CH] on
 
insert into [SPR_STG].[dbo].[md_quik_info_CH]
        (md_id
        ,md_no
        ,clnc_no
        ,md_lastname
        ,md_given_name
        ,addr_line_1
        ,addr_line_2
        ,cmty_desc
        ,post_code
        ,prov
        ,tel_no
        ,born_date
        ,sex
        ,spcl_desc
        ,clnc_name
        ,clnc_addr_line_1
        ,clnc_addr_line_2
        ,clnc_cmty_desc
        ,clnc_prov
        ,clnc_post_code
        ,clnc_tel_no
        ,run_date
        ,serv_prov_src
        ,msp_id
        )
SELECT Metadata.dbo.[HFn_GetScrambledString](md_id)
      ,Metadata.dbo.[HFn_GetScrambledString](md_no)
      ,Metadata.dbo.[HFn_GetScrambledString](clnc_no)
      ,Metadata.dbo.[HFn_GetScrambledString](md_lastname)
      ,Metadata.dbo.[HFn_GetScrambledString](md_given_name)
      ,Metadata.dbo.[HFn_GetScrambledString](addr_line_1)
      ,Metadata.dbo.[HFn_GetScrambledString](addr_line_2)
      ,Metadata.dbo.[HFn_GetScrambledString](cmty_desc)
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,prov
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no)
      ,Metadata.dbo.[HFn_GetScrambledDate](born_date)
      ,sex
      ,spcl_desc
      ,Metadata.dbo.[HFn_GetScrambledString](clnc_name)
      ,Metadata.dbo.[HFn_GetScrambledString](clnc_addr_line_1)
      ,Metadata.dbo.[HFn_GetScrambledString](clnc_addr_line_2)
      ,Metadata.dbo.[HFn_GetScrambledString](clnc_cmty_desc)
      ,clnc_prov
      ,Metadata.dbo.[HFn_GetScrambledString](clnc_post_code)
      ,Metadata.dbo.[HFn_GetScrambledString](clnc_tel_no)
      ,run_date
      ,serv_prov_src
      ,Metadata.dbo.[HFn_GetScrambledString](msp_id)
FROM [SPR_STG].[dbo].[md_quik_info]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[md_quik_info]'))
    set identity_insert [SPR_STG].[dbo].[md_quik_info_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[md_quik_info_CH]
ADD CONSTRAINT PK_md_quik_info_CH
PRIMARY KEY CLUSTERED 
(
md_no ASC
)
 
 
drop table [SPR_STG].[dbo].[md_quik_info]
exec sp_rename 'md_quik_info_CH', 'md_quik_info'
 
 /************************************************  
 
     2) Scrambling [SPR_STG].[dbo].[spr_bp_feedback_head]....
 
 ***************************************************/
print '2: Scrambling [SPR_STG].[dbo].[spr_bp_feedback_head]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_bp_feedback_head_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_bp_feedback_head_CH]
 
select * into [SPR_STG].[dbo].[spr_bp_feedback_head_CH] from [SPR_STG].[dbo].[spr_bp_feedback_head] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_bp_feedback_head]'))
    set identity_insert [SPR_STG].[dbo].[spr_bp_feedback_head_CH] on
 
insert into [SPR_STG].[dbo].[spr_bp_feedback_head_CH]
        (feedback_head_id
        ,feedback_record_type
        ,rha_id
        ,fac_id
        ,pat_id
        ,orb_booking_no
        ,orb_case_no
        ,create_date
        ,pat_eval_id
        ,surg_case_id
        ,surg_post_op_id
        ,result_code
        ,result_msg
        ,orb_interface_data
        ,unused1
        ,unused2
        ,unused3
        ,unused4
        ,file_id
        ,row_id
        ,action_code
        ,fixed_date
        )
SELECT feedback_head_id
      ,feedback_record_type
      ,rha_id
      ,fac_id
      ,Metadata.dbo.[HFn_GetScrambledString](pat_id)
      ,orb_booking_no
      ,orb_case_no
      ,create_date
      ,pat_eval_id
      ,surg_case_id
      ,surg_post_op_id
      ,result_code
      ,result_msg
      ,orb_interface_data
      ,unused1
      ,unused2
      ,unused3
      ,unused4
      ,file_id
      ,row_id
      ,action_code
      ,fixed_date
FROM [SPR_STG].[dbo].[spr_bp_feedback_head]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_bp_feedback_head]'))
    set identity_insert [SPR_STG].[dbo].[spr_bp_feedback_head_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_bp_feedback_head_CH]
ADD CONSTRAINT PK_spr_bp_feedback_head_CH
PRIMARY KEY CLUSTERED 
(
feedback_head_id ASC
)
 
 
Create NONCLUSTERED INDEX _dta_index_spr_bp_feedback_head_11_1683081332__K2_K3_K10_K21_K1_K22_4_5_8_9_14_CH
ON [SPR_STG].[dbo].[spr_bp_feedback_head_CH]
(
feedback_record_type ASC, rha_id ASC, create_date ASC, file_id ASC, feedback_head_id ASC, row_id ASC
)
INCLUDE
(
fac_id, pat_id, orb_booking_no, orb_case_no, result_code
)
 
Create NONCLUSTERED INDEX _dta_index_spr_bp_feedback_head_11_1683081332__K21_K2_K10_4_22_CH
ON [SPR_STG].[dbo].[spr_bp_feedback_head_CH]
(
file_id ASC, feedback_record_type ASC, create_date ASC
)
INCLUDE
(
fac_id, row_id
)
 
Create NONCLUSTERED INDEX idx_bp_feedback_head_rec_file_id_CH
ON [SPR_STG].[dbo].[spr_bp_feedback_head_CH]
(
file_id ASC
)
 
drop table [SPR_STG].[dbo].[spr_bp_feedback_head]
exec sp_rename 'spr_bp_feedback_head_CH', 'spr_bp_feedback_head'
 
 /************************************************  
 
     3) Scrambling [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in]....
 
 ***************************************************/
print '3: Scrambling [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_bp_rha_booking_rec_in_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in_CH]
 
select * into [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in_CH] from [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_bp_rha_booking_rec_in]'))
    set identity_insert [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in_CH] on
 
insert into [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in_CH]
        (row_id
        ,file_id
        ,ins_date
        ,processed_status
        ,processed_date
        ,src_create_date
        ,rec_type
        ,action_code
        ,surg_case_id
        ,orbs_book_id
        ,rqst_date
        ,rha_case_no
        ,rha_id
        ,fac_id
        ,pat_eval_id
        ,pat_id
        ,post_code
        ,city
        ,decision_date
        ,is_cancer_related
        ,pat_unvl_start_perd_1
        ,pat_unvl_end_perd_1
        ,pat_unvl_xpln_id_perd_1
        ,pat_unvl_start_perd_2
        ,pat_unvl_end_perd_2
        ,pat_unvl_xpln_id_perd_2
        ,pat_unvl_start_perd_3
        ,pat_unvl_end_perd_3
        ,pat_unvl_xpln_id_perd_3
        ,refr_date
        ,init_srgn_visit_date
        ,rha_srgn_alt_id
        ,sscn_srgn_id
        ,prim_proc_code
        ,side
        ,free_text_desc
        ,scnd_proc_code_1
        ,side_1
        ,free_text_desc_1
        ,scnd_proc_code_2
        ,side_2
        ,free_text_desc_2
        ,scnd_proc_code_3
        ,side_3
        ,free_text_desc_3
        ,enct_type_code
        ,surg_schd_date
        ,surg_stat_id
        ,surg_defr_date
        ,cancel_reason_code
        ,postpone_reason_code
        ,surg_iatv_date
        ,surg_iatv_xpln_id
        ,general_comments
        ,pre_operative_diagnosis
        ,unused1
        ,unused2
        ,unused3
        ,unused4
        ,orb_interface_data
        )
SELECT row_id
      ,file_id
      ,ins_date
      ,processed_status
      ,processed_date
      ,src_create_date
      ,rec_type
      ,action_code
      ,surg_case_id
      ,orbs_book_id
      ,Metadata.dbo.[HFn_GetScrambledDate](rqst_date)
      ,rha_case_no
      ,rha_id
      ,fac_id
      ,pat_eval_id
      ,Metadata.dbo.[HFn_GetScrambledString](pat_id)
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,Metadata.dbo.[HFn_GetScrambledString](city)
      ,Metadata.dbo.[HFn_GetScrambledDate](decision_date)
      ,is_cancer_related
      ,pat_unvl_start_perd_1
      ,pat_unvl_end_perd_1
      ,pat_unvl_xpln_id_perd_1
      ,pat_unvl_start_perd_2
      ,pat_unvl_end_perd_2
      ,pat_unvl_xpln_id_perd_2
      ,pat_unvl_start_perd_3
      ,pat_unvl_end_perd_3
      ,pat_unvl_xpln_id_perd_3
      ,Metadata.dbo.[HFn_GetScrambledDate](refr_date)
      ,Metadata.dbo.[HFn_GetScrambledDate](init_srgn_visit_date)
      ,Metadata.dbo.[HFn_GetScrambledString](rha_srgn_alt_id)
      ,Metadata.dbo.[HFn_GetScrambledString](sscn_srgn_id)
      ,prim_proc_code
      ,side
      ,free_text_desc
      ,scnd_proc_code_1
      ,side_1
      ,free_text_desc_1
      ,scnd_proc_code_2
      ,side_2
      ,free_text_desc_2
      ,scnd_proc_code_3
      ,side_3
      ,free_text_desc_3
      ,enct_type_code
      ,Metadata.dbo.[HFn_GetScrambledDate](surg_schd_date)
      ,surg_stat_id
      ,Metadata.dbo.[HFn_GetScrambledDate](surg_defr_date)
      ,cancel_reason_code
      ,postpone_reason_code
      ,surg_iatv_date
      ,surg_iatv_xpln_id
      ,Metadata.dbo.[HFn_GetScrambledString](general_comments)
      ,pre_operative_diagnosis
      ,unused1
      ,unused2
      ,unused3
      ,unused4
      ,orb_interface_data
FROM [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_bp_rha_booking_rec_in]'))
    set identity_insert [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in_CH]
ADD CONSTRAINT PK_spr_bp_HA_Book_Rec_In_CH
PRIMARY KEY CLUSTERED 
(
row_id ASC
)
 
 
Create NONCLUSTERED INDEX idx_bp_booking_rec_file_id_CH
ON [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in_CH]
(
file_id ASC
)
 
drop table [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in]
exec sp_rename 'spr_bp_rha_booking_rec_in_CH', 'spr_bp_rha_booking_rec_in'
 
 /************************************************  
 
     4) Scrambling [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in]....
 
 ***************************************************/
print '4: Scrambling [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_bp_rha_pat_rec_in_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in_CH]
 
select * into [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in_CH] from [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_bp_rha_pat_rec_in]'))
    set identity_insert [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in_CH] on
 
insert into [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in_CH]
        (row_id
        ,file_id
        ,ins_date
        ,processed_status
        ,processed_date
        ,src_create_date
        ,rec_type
        ,action_code
        ,rha_id
        ,fac_id
        ,pat_id
        ,alt_pat_id_type
        ,alt_pat_id
        ,name_last
        ,name_given_1
        ,name_preferred
        ,name_given_2
        ,name_given_3
        ,born_date
        ,sex
        ,addr_line_1
        ,addr_line_2
        ,addr_line_3
        ,city
        ,prov_code
        ,post_code
        ,tel_no_home_area
        ,tel_no_home
        ,tel_no_work_area
        ,tel_no_work
        ,tel_no_cell_area
        ,tel_no_cell
        ,ctac_name
        ,ctac_addr_line_1
        ,ctac_addr_line_2
        ,ctac_addr_line_3
        ,ctac_city
        ,ctac_prov_code
        ,ctac_post_code
        ,ctac_tel_no_area
        ,ctac_tel_no
        ,unused1
        ,unused2
        ,unused3
        ,unused4
        ,orb_interface_data
        )
SELECT row_id
      ,file_id
      ,ins_date
      ,processed_status
      ,processed_date
      ,src_create_date
      ,rec_type
      ,action_code
      ,rha_id
      ,fac_id
      ,Metadata.dbo.[HFn_GetScrambledString](pat_id)
      ,alt_pat_id_type
      ,Metadata.dbo.[HFn_GetScrambledString](alt_pat_id)
      ,Metadata.dbo.[HFn_GetScrambledString](name_last)
      ,Metadata.dbo.[HFn_GetScrambledString](name_given_1)
      ,Metadata.dbo.[HFn_GetScrambledString](name_preferred)
      ,Metadata.dbo.[HFn_GetScrambledString](name_given_2)
      ,Metadata.dbo.[HFn_GetScrambledString](name_given_3)
      ,Metadata.dbo.[HFn_GetScrambledDate](born_date)
      ,sex
      ,Metadata.dbo.[HFn_GetScrambledString](addr_line_1)
      ,Metadata.dbo.[HFn_GetScrambledString](addr_line_2)
      ,Metadata.dbo.[HFn_GetScrambledString](addr_line_3)
      ,Metadata.dbo.[HFn_GetScrambledString](city)
      ,prov_code
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,tel_no_home_area
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no_home)
      ,tel_no_work_area
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no_work)
      ,tel_no_cell_area
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no_cell)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_name)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_addr_line_1)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_addr_line_2)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_addr_line_3)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_city)
      ,ctac_prov_code
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_post_code)
      ,ctac_tel_no_area
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_tel_no)
      ,unused1
      ,unused2
      ,unused3
      ,unused4
      ,orb_interface_data
FROM [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_bp_rha_pat_rec_in]'))
    set identity_insert [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in_CH]
ADD CONSTRAINT PK_spr_bp_HA_Pat_Rec_In_CH
PRIMARY KEY CLUSTERED 
(
row_id ASC
)
 
 
Create NONCLUSTERED INDEX idx_bp_pat_rec_file_id_CH
ON [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in_CH]
(
file_id ASC
)
 
Create NONCLUSTERED INDEX _dta_index_spr_bp_rha_pat_rec_in_11_306920265__K1_14_15_19_CH
ON [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in_CH]
(
row_id ASC
)
INCLUDE
(
name_last, name_given_1, born_date
)
 
drop table [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in]
exec sp_rename 'spr_bp_rha_pat_rec_in_CH', 'spr_bp_rha_pat_rec_in'
 
 /************************************************  
 
     5) Scrambling [SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in]....
 
 ***************************************************/
print '5: Scrambling [SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in_CH]
 
select * into [SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in_CH] from [SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in]'))
    set identity_insert [SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in_CH] on
 
insert into [SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in_CH]
        (row_id
        ,file_id
        ,ins_date
        ,processed_status
        ,processed_date
        ,src_create_date
        ,rec_type
        ,action_code
        ,surg_cmpl_date
        ,surg_post_op_id
        ,surg_case_id
        ,orbs_book_id
        ,rha_case_no
        ,rha_id
        ,fac_id
        ,pat_id
        ,city
        ,post_code
        ,rha_srgn_alt_id
        ,sscn_srgn_id
        ,prim_proc_code
        ,side
        ,scnd_proc_code_1
        ,side_1
        ,scnd_proc_code_2
        ,side_2
        ,scnd_proc_code_3
        ,side_3
        ,emrg_surg
        ,unused1
        ,unused2
        ,unused3
        ,unused4
        ,orb_interface_data
        )
SELECT row_id
      ,file_id
      ,ins_date
      ,processed_status
      ,processed_date
      ,src_create_date
      ,rec_type
      ,action_code
      ,Metadata.dbo.[HFn_GetScrambledDate](surg_cmpl_date)
      ,surg_post_op_id
      ,surg_case_id
      ,orbs_book_id
      ,rha_case_no
      ,rha_id
      ,fac_id
      ,Metadata.dbo.[HFn_GetScrambledString](pat_id)
      ,Metadata.dbo.[HFn_GetScrambledString](city)
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,Metadata.dbo.[HFn_GetScrambledString](rha_srgn_alt_id)
      ,Metadata.dbo.[HFn_GetScrambledString](sscn_srgn_id)
      ,prim_proc_code
      ,side
      ,scnd_proc_code_1
      ,side_1
      ,scnd_proc_code_2
      ,side_2
      ,scnd_proc_code_3
      ,side_3
      ,emrg_surg
      ,unused1
      ,unused2
      ,unused3
      ,unused4
      ,orb_interface_data
FROM [SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in]'))
    set identity_insert [SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in_CH]
ADD CONSTRAINT PK_spr_bp_rha_postsurg_rec_in_CH
PRIMARY KEY CLUSTERED 
(
row_id ASC
)
 
 
Create NONCLUSTERED INDEX idx_bp_postsurg_rec_file_id_CH
ON [SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in_CH]
(
file_id ASC
)
 
drop table [SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in]
exec sp_rename 'spr_bp_rha_postsurg_rec_in_CH', 'spr_bp_rha_postsurg_rec_in'
 
 /************************************************  
 
     6) Scrambling [SPR_STG].[dbo].[spr_md]....
 
 ***************************************************/
print '6: Scrambling [SPR_STG].[dbo].[spr_md]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_md_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_md_CH]
 
select * into [SPR_STG].[dbo].[spr_md_CH] from [SPR_STG].[dbo].[spr_md] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_md]'))
    set identity_insert [SPR_STG].[dbo].[spr_md_CH] on
 
insert into [SPR_STG].[dbo].[spr_md_CH]
        (spr_md_id
        ,rha_id
        ,provider_id
        ,college_id
        ,msp_id
        ,md_spec_id
        ,name_last
        ,name_1st
        ,addr_str
        ,cmty_desc
        ,prov_code
        ,post_code
        ,ctry
        ,tel_no_area
        ,tel_no
        ,tel_no_ext
        ,eff_date
        ,exp_date
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        )
SELECT Metadata.dbo.[HFn_GetScrambledString](spr_md_id)
      ,rha_id
      ,Metadata.dbo.[HFn_GetScrambledString](provider_id)
      ,Metadata.dbo.[HFn_GetScrambledString](college_id)
      ,Metadata.dbo.[HFn_GetScrambledString](msp_id)
      ,md_spec_id
      ,Metadata.dbo.[HFn_GetScrambledString](name_last)
      ,Metadata.dbo.[HFn_GetScrambledString](name_1st)
      ,Metadata.dbo.[HFn_GetScrambledString](addr_str)
      ,Metadata.dbo.[HFn_GetScrambledString](cmty_desc)
      ,prov_code
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,Metadata.dbo.[HFn_GetScrambledString](ctry)
      ,tel_no_area
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no)
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no_ext)
      ,eff_date
      ,exp_date
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
FROM [SPR_STG].[dbo].[spr_md]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_md]'))
    set identity_insert [SPR_STG].[dbo].[spr_md_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_md_CH]
ADD CONSTRAINT PK_spr_md_1_CH
PRIMARY KEY CLUSTERED 
(
spr_md_id ASC, rha_id ASC
)
 
 
drop table [SPR_STG].[dbo].[spr_md]
exec sp_rename 'spr_md_CH', 'spr_md'
 
 /************************************************  
 
     7) Scrambling [SPR_STG].[dbo].[spr_md_audt]....
 
 ***************************************************/
print '7: Scrambling [SPR_STG].[dbo].[spr_md_audt]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_md_audt_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_md_audt_CH]
 
select * into [SPR_STG].[dbo].[spr_md_audt_CH] from [SPR_STG].[dbo].[spr_md_audt] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_md_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_md_audt_CH] on
 
insert into [SPR_STG].[dbo].[spr_md_audt_CH]
        (spr_md_id
        ,rha_id
        ,provider_id
        ,college_id
        ,msp_id
        ,md_spec_id
        ,name_last
        ,name_1st
        ,addr_str
        ,cmty_desc
        ,prov_code
        ,post_code
        ,ctry
        ,tel_no_area
        ,tel_no
        ,tel_no_ext
        ,eff_date
        ,exp_date
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        ,row_exp_date
        ,row_exp_xpln
        ,row_exp_user_id
        )
SELECT Metadata.dbo.[HFn_GetScrambledString](spr_md_id)
      ,rha_id
      ,Metadata.dbo.[HFn_GetScrambledString](provider_id)
      ,Metadata.dbo.[HFn_GetScrambledString](college_id)
      ,Metadata.dbo.[HFn_GetScrambledString](msp_id)
      ,md_spec_id
      ,Metadata.dbo.[HFn_GetScrambledString](name_last)
      ,Metadata.dbo.[HFn_GetScrambledString](name_1st)
      ,Metadata.dbo.[HFn_GetScrambledString](addr_str)
      ,Metadata.dbo.[HFn_GetScrambledString](cmty_desc)
      ,prov_code
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,Metadata.dbo.[HFn_GetScrambledString](ctry)
      ,tel_no_area
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no)
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no_ext)
      ,eff_date
      ,exp_date
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
      ,row_exp_date
      ,row_exp_xpln
      ,row_exp_user_id
FROM [SPR_STG].[dbo].[spr_md_audt]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_md_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_md_audt_CH] off
 
drop table [SPR_STG].[dbo].[spr_md_audt]
exec sp_rename 'spr_md_audt_CH', 'spr_md_audt'
 
 /************************************************  
 
     8) Scrambling [SPR_STG].[dbo].[spr_md_ref]....
 
 ***************************************************/
print '8: Scrambling [SPR_STG].[dbo].[spr_md_ref]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_md_ref_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_md_ref_CH]
 
select * into [SPR_STG].[dbo].[spr_md_ref_CH] from [SPR_STG].[dbo].[spr_md_ref] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_md_ref]'))
    set identity_insert [SPR_STG].[dbo].[spr_md_ref_CH] on
 
insert into [SPR_STG].[dbo].[spr_md_ref_CH]
        (rha_id
        ,ref_md_id
        ,md_name
        ,msp_id
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        )
SELECT rha_id
      ,Metadata.dbo.[HFn_GetScrambledString](ref_md_id)
      ,Metadata.dbo.[HFn_GetScrambledString](md_name)
      ,Metadata.dbo.[HFn_GetScrambledString](msp_id)
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
FROM [SPR_STG].[dbo].[spr_md_ref]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_md_ref]'))
    set identity_insert [SPR_STG].[dbo].[spr_md_ref_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_md_ref_CH]
ADD CONSTRAINT PK_spr_md_ref_CH
PRIMARY KEY CLUSTERED 
(
rha_id ASC, ref_md_id ASC
)
 
 
drop table [SPR_STG].[dbo].[spr_md_ref]
exec sp_rename 'spr_md_ref_CH', 'spr_md_ref'
 
 /************************************************  
 
     9) Scrambling [SPR_STG].[dbo].[spr_md_ref_audt]....
 
 ***************************************************/
print '9: Scrambling [SPR_STG].[dbo].[spr_md_ref_audt]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_md_ref_audt_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_md_ref_audt_CH]
 
select * into [SPR_STG].[dbo].[spr_md_ref_audt_CH] from [SPR_STG].[dbo].[spr_md_ref_audt] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_md_ref_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_md_ref_audt_CH] on
 
insert into [SPR_STG].[dbo].[spr_md_ref_audt_CH]
        (rha_id
        ,ref_md_id
        ,md_name
        ,msp_id
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        ,row_exp_date
        ,row_exp_xpln
        ,row_exp_user_id
        )
SELECT rha_id
      ,Metadata.dbo.[HFn_GetScrambledString](ref_md_id)
      ,Metadata.dbo.[HFn_GetScrambledString](md_name)
      ,Metadata.dbo.[HFn_GetScrambledString](msp_id)
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
      ,row_exp_date
      ,row_exp_xpln
      ,row_exp_user_id
FROM [SPR_STG].[dbo].[spr_md_ref_audt]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_md_ref_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_md_ref_audt_CH] off
 
drop table [SPR_STG].[dbo].[spr_md_ref_audt]
exec sp_rename 'spr_md_ref_audt_CH', 'spr_md_ref_audt'
 
 /************************************************  
 
     10) Scrambling [SPR_STG].[dbo].[spr_pat]....
 
 ***************************************************/
print '10: Scrambling [SPR_STG].[dbo].[spr_pat]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_pat_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_pat_CH]
 
select * into [SPR_STG].[dbo].[spr_pat_CH] from [SPR_STG].[dbo].[spr_pat] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_CH] on
 
insert into [SPR_STG].[dbo].[spr_pat_CH]
        (spr_pat_id
        ,rha_id
        ,alt_pat_id_type
        ,alt_pat_id
        ,name_last
        ,name_given_1
        ,name_preferred
        ,name_given_2
        ,name_given_3
        ,sex
        ,born_date
        ,addr_line_1
        ,addr_line_2
        ,addr_line_3
        ,city
        ,prov_code
        ,post_code
        ,tel_no_home_area
        ,tel_no_home
        ,tel_no_work_area
        ,tel_no_work
        ,tel_no_work_ext
        ,tel_no_cell_area
        ,tel_no_cell
        ,ctac_name
        ,ctac_addr_line_1
        ,ctac_addr_line_2
        ,ctac_addr_line_3
        ,ctac_city
        ,ctac_prov_code
        ,ctac_post_code
        ,ctac_tel_no_area
        ,ctac_tel_no
        ,ctac_tel_no_ext
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        )
SELECT Metadata.dbo.[HFn_GetScrambledString](spr_pat_id)
      ,rha_id
      ,alt_pat_id_type
      ,Metadata.dbo.[HFn_GetScrambledString](alt_pat_id)
      ,Metadata.dbo.[HFn_GetScrambledString](name_last)
      ,Metadata.dbo.[HFn_GetScrambledString](name_given_1)
      ,Metadata.dbo.[HFn_GetScrambledString](name_preferred)
      ,Metadata.dbo.[HFn_GetScrambledString](name_given_2)
      ,Metadata.dbo.[HFn_GetScrambledString](name_given_3)
      ,sex
      ,Metadata.dbo.[HFn_GetScrambledDate](born_date)
      ,Metadata.dbo.[HFn_GetScrambledString](addr_line_1)
      ,Metadata.dbo.[HFn_GetScrambledString](addr_line_2)
      ,Metadata.dbo.[HFn_GetScrambledString](addr_line_3)
      ,Metadata.dbo.[HFn_GetScrambledString](city)
      ,prov_code
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,tel_no_home_area
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no_home)
      ,tel_no_work_area
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no_work)
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no_work_ext)
      ,tel_no_cell_area
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no_cell)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_name)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_addr_line_1)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_addr_line_2)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_addr_line_3)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_city)
      ,ctac_prov_code
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_post_code)
      ,ctac_tel_no_area
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_tel_no)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_tel_no_ext)
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
FROM [SPR_STG].[dbo].[spr_pat]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_CH]
ADD CONSTRAINT PK_spr_pat_CH
PRIMARY KEY CLUSTERED 
(
spr_pat_id ASC, rha_id ASC
)
 
 
Create NONCLUSTERED INDEX idx_pat_last_name_CH
ON [SPR_STG].[dbo].[spr_pat_CH]
(
name_last ASC, rha_id ASC
)
 
drop table [SPR_STG].[dbo].[spr_pat]
exec sp_rename 'spr_pat_CH', 'spr_pat'
 
 /************************************************  
 
     11) Scrambling [SPR_STG].[dbo].[spr_pat_audt]....
 
 ***************************************************/
print '11: Scrambling [SPR_STG].[dbo].[spr_pat_audt]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_pat_audt_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_pat_audt_CH]
 
select * into [SPR_STG].[dbo].[spr_pat_audt_CH] from [SPR_STG].[dbo].[spr_pat_audt] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_audt_CH] on
 
insert into [SPR_STG].[dbo].[spr_pat_audt_CH]
        (spr_pat_id
        ,rha_id
        ,alt_pat_id_type
        ,alt_pat_id
        ,name_last
        ,name_given_1
        ,name_preferred
        ,name_given_2
        ,name_given_3
        ,sex
        ,born_date
        ,addr_line_1
        ,addr_line_2
        ,addr_line_3
        ,city
        ,prov_code
        ,post_code
        ,tel_no_home_area
        ,tel_no_home
        ,tel_no_work_area
        ,tel_no_work
        ,tel_no_work_ext
        ,tel_no_cell_area
        ,tel_no_cell
        ,ctac_name
        ,ctac_addr_line_1
        ,ctac_addr_line_2
        ,ctac_addr_line_3
        ,ctac_city
        ,ctac_prov_code
        ,ctac_post_code
        ,ctac_tel_no_area
        ,ctac_tel_no
        ,ctac_tel_no_ext
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        ,row_exp_date
        ,row_exp_xpln
        ,row_exp_user_id
        )
SELECT Metadata.dbo.[HFn_GetScrambledString](spr_pat_id)
      ,rha_id
      ,alt_pat_id_type
      ,Metadata.dbo.[HFn_GetScrambledString](alt_pat_id)
      ,Metadata.dbo.[HFn_GetScrambledString](name_last)
      ,Metadata.dbo.[HFn_GetScrambledString](name_given_1)
      ,Metadata.dbo.[HFn_GetScrambledString](name_preferred)
      ,Metadata.dbo.[HFn_GetScrambledString](name_given_2)
      ,Metadata.dbo.[HFn_GetScrambledString](name_given_3)
      ,sex
      ,Metadata.dbo.[HFn_GetScrambledDate](born_date)
      ,Metadata.dbo.[HFn_GetScrambledString](addr_line_1)
      ,Metadata.dbo.[HFn_GetScrambledString](addr_line_2)
      ,Metadata.dbo.[HFn_GetScrambledString](addr_line_3)
      ,Metadata.dbo.[HFn_GetScrambledString](city)
      ,prov_code
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,tel_no_home_area
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no_home)
      ,tel_no_work_area
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no_work)
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no_work_ext)
      ,tel_no_cell_area
      ,Metadata.dbo.[HFn_GetScrambledString](tel_no_cell)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_name)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_addr_line_1)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_addr_line_2)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_addr_line_3)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_city)
      ,ctac_prov_code
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_post_code)
      ,ctac_tel_no_area
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_tel_no)
      ,Metadata.dbo.[HFn_GetScrambledString](ctac_tel_no_ext)
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
      ,row_exp_date
      ,row_exp_xpln
      ,row_exp_user_id
FROM [SPR_STG].[dbo].[spr_pat_audt]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_audt_CH] off
 
Create NONCLUSTERED INDEX IX_SPR_PAT_AUDT_PATID_RHAID_CH
ON [SPR_STG].[dbo].[spr_pat_audt_CH]
(
spr_pat_id ASC, rha_id ASC
)
 
drop table [SPR_STG].[dbo].[spr_pat_audt]
exec sp_rename 'spr_pat_audt_CH', 'spr_pat_audt'
 
 /************************************************  
 
     12) Scrambling [SPR_STG].[dbo].[spr_pat_err]....
 
 ***************************************************/
print '12: Scrambling [SPR_STG].[dbo].[spr_pat_err]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_pat_err_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_pat_err_CH]
 
select * into [SPR_STG].[dbo].[spr_pat_err_CH] from [SPR_STG].[dbo].[spr_pat_err] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_err]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_err_CH] on
 
insert into [SPR_STG].[dbo].[spr_pat_err_CH]
        (err_id
        ,err_fld_name
        ,spr_pat_id
        ,rha_id
        ,name_last
        ,name_given_1
        ,sex
        ,born_date
        ,post_code
        ,err_sevr_id
        ,err_ovrd_flag
        ,err_desc
        ,err_detl
        ,err_prev_valu
        ,row_eff_user_id
        ,row_eff_date
        )
SELECT err_id
      ,err_fld_name
      ,Metadata.dbo.[HFn_GetScrambledString](spr_pat_id)
      ,rha_id
      ,Metadata.dbo.[HFn_GetScrambledString](name_last)
      ,Metadata.dbo.[HFn_GetScrambledString](name_given_1)
      ,sex
      ,Metadata.dbo.[HFn_GetScrambledDate](born_date)
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,err_sevr_id
      ,err_ovrd_flag
      ,err_desc
      ,Metadata.dbo.[HFn_GetScrambledString](err_detl)
      ,Metadata.dbo.[HFn_GetScrambledString](err_prev_valu)
      ,row_eff_user_id
      ,row_eff_date
FROM [SPR_STG].[dbo].[spr_pat_err]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_err]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_err_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_err_CH]
ADD CONSTRAINT PK_spr_pat_err_CH
PRIMARY KEY CLUSTERED 
(
err_id ASC, err_fld_name ASC, spr_pat_id ASC, rha_id ASC
)
 
 
drop table [SPR_STG].[dbo].[spr_pat_err]
exec sp_rename 'spr_pat_err_CH', 'spr_pat_err'
 
 /************************************************  
 
     13) Scrambling [SPR_STG].[dbo].[spr_pat_err_audt]....
 
 ***************************************************/
print '13: Scrambling [SPR_STG].[dbo].[spr_pat_err_audt]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_pat_err_audt_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_pat_err_audt_CH]
 
select * into [SPR_STG].[dbo].[spr_pat_err_audt_CH] from [SPR_STG].[dbo].[spr_pat_err_audt] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_err_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_err_audt_CH] on
 
insert into [SPR_STG].[dbo].[spr_pat_err_audt_CH]
        (err_id
        ,err_fld_name
        ,spr_pat_id
        ,rha_id
        ,name_last
        ,name_given_1
        ,sex
        ,born_date
        ,post_code
        ,err_sevr_id
        ,err_ovrd_flag
        ,err_desc
        ,err_detl
        ,err_prev_valu
        ,row_eff_user_id
        ,row_eff_date
        ,row_exp_date
        ,row_exp_xpln
        ,row_exp_user_id
        )
SELECT err_id
      ,err_fld_name
      ,Metadata.dbo.[HFn_GetScrambledString](spr_pat_id)
      ,rha_id
      ,Metadata.dbo.[HFn_GetScrambledString](name_last)
      ,Metadata.dbo.[HFn_GetScrambledString](name_given_1)
      ,sex
      ,Metadata.dbo.[HFn_GetScrambledDate](born_date)
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,err_sevr_id
      ,err_ovrd_flag
      ,err_desc
      ,Metadata.dbo.[HFn_GetScrambledString](err_detl)
      ,Metadata.dbo.[HFn_GetScrambledString](err_prev_valu)
      ,row_eff_user_id
      ,row_eff_date
      ,row_exp_date
      ,row_exp_xpln
      ,row_exp_user_id
FROM [SPR_STG].[dbo].[spr_pat_err_audt]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_err_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_err_audt_CH] off
 
drop table [SPR_STG].[dbo].[spr_pat_err_audt]
exec sp_rename 'spr_pat_err_audt_CH', 'spr_pat_err_audt'
 
 /************************************************  
 
     14) Scrambling [SPR_STG].[dbo].[spr_pat_eval]....
 
 ***************************************************/
print '14: Scrambling [SPR_STG].[dbo].[spr_pat_eval]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_pat_eval_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_pat_eval_CH]
 
select * into [SPR_STG].[dbo].[spr_pat_eval_CH] from [SPR_STG].[dbo].[spr_pat_eval] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_eval]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_eval_CH] on
 
insert into [SPR_STG].[dbo].[spr_pat_eval_CH]
        (pat_eval_id
        ,rha_id
        ,spr_pat_id
        ,pat_birth_date
        ,decision_date
        ,cncr
        ,spr_srgn_id
        ,spr_eval_id
        ,eval_scor
        ,wait_list_cat_id
        ,assm_stat_id
        ,assm_inac_xpln_id
        ,assm_inac_date
        ,row_create_date
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        )
SELECT pat_eval_id
      ,rha_id
      ,Metadata.dbo.[HFn_GetScrambledString](spr_pat_id)
      ,Metadata.dbo.[HFn_GetScrambledString](pat_birth_date)
      ,Metadata.dbo.[HFn_GetScrambledDate](decision_date)
      ,cncr
      ,Metadata.dbo.[HFn_GetScrambledString](spr_srgn_id)
      ,spr_eval_id
      ,eval_scor
      ,wait_list_cat_id
      ,assm_stat_id
      ,assm_inac_xpln_id
      ,assm_inac_date
      ,row_create_date
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
FROM [SPR_STG].[dbo].[spr_pat_eval]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_eval]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_eval_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval_CH]
ADD CONSTRAINT PK_spr_pat_eval_CH
PRIMARY KEY CLUSTERED 
(
pat_eval_id ASC
)
 
 
drop table [SPR_STG].[dbo].[spr_pat_eval]
exec sp_rename 'spr_pat_eval_CH', 'spr_pat_eval'
 
 /************************************************  
 
     15) Scrambling [SPR_STG].[dbo].[spr_pat_eval_audt]....
 
 ***************************************************/
print '15: Scrambling [SPR_STG].[dbo].[spr_pat_eval_audt]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_pat_eval_audt_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_pat_eval_audt_CH]
 
select * into [SPR_STG].[dbo].[spr_pat_eval_audt_CH] from [SPR_STG].[dbo].[spr_pat_eval_audt] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_eval_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_eval_audt_CH] on
 
insert into [SPR_STG].[dbo].[spr_pat_eval_audt_CH]
        (pat_eval_id
        ,rha_id
        ,spr_pat_id
        ,pat_birth_date
        ,decision_date
        ,cncr
        ,spr_srgn_id
        ,spr_eval_id
        ,eval_scor
        ,wait_list_cat_id
        ,assm_stat_id
        ,assm_inac_xpln_id
        ,assm_inac_date
        ,row_create_date
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        ,row_exp_date
        ,row_exp_xpln
        ,row_exp_user_id
        )
SELECT pat_eval_id
      ,rha_id
      ,Metadata.dbo.[HFn_GetScrambledString](spr_pat_id)
      ,Metadata.dbo.[HFn_GetScrambledString](pat_birth_date)
      ,Metadata.dbo.[HFn_GetScrambledDate](decision_date)
      ,cncr
      ,Metadata.dbo.[HFn_GetScrambledString](spr_srgn_id)
      ,spr_eval_id
      ,eval_scor
      ,wait_list_cat_id
      ,assm_stat_id
      ,assm_inac_xpln_id
      ,assm_inac_date
      ,row_create_date
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
      ,row_exp_date
      ,row_exp_xpln
      ,row_exp_user_id
FROM [SPR_STG].[dbo].[spr_pat_eval_audt]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_eval_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_eval_audt_CH] off
 
Create NONCLUSTERED INDEX IX_SPR_PAT_EVAL_AUDT_ID_CH
ON [SPR_STG].[dbo].[spr_pat_eval_audt_CH]
(
pat_eval_id ASC
)
 
drop table [SPR_STG].[dbo].[spr_pat_eval_audt]
exec sp_rename 'spr_pat_eval_audt_CH', 'spr_pat_eval_audt'
 
 /************************************************  
 
     16) Scrambling [SPR_STG].[dbo].[spr_pat_eval_err]....
 
 ***************************************************/
print '16: Scrambling [SPR_STG].[dbo].[spr_pat_eval_err]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_pat_eval_err_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_pat_eval_err_CH]
 
select * into [SPR_STG].[dbo].[spr_pat_eval_err_CH] from [SPR_STG].[dbo].[spr_pat_eval_err] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_eval_err]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_eval_err_CH] on
 
insert into [SPR_STG].[dbo].[spr_pat_eval_err_CH]
        (pat_eval_id
        ,err_id
        ,err_fld_name
        ,err_sevr_id
        ,err_ovrd_flag
        ,err_desc
        ,err_detl
        ,err_prev_valu
        ,row_eff_user_id
        ,row_eff_date
        )
SELECT pat_eval_id
      ,err_id
      ,err_fld_name
      ,err_sevr_id
      ,err_ovrd_flag
      ,err_desc
      ,Metadata.dbo.[HFn_GetScrambledString](err_detl)
      ,Metadata.dbo.[HFn_GetScrambledString](err_prev_valu)
      ,row_eff_user_id
      ,row_eff_date
FROM [SPR_STG].[dbo].[spr_pat_eval_err]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_eval_err]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_eval_err_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval_err_CH]
ADD CONSTRAINT PK_spr_pat_eval_err_CH
PRIMARY KEY CLUSTERED 
(
pat_eval_id ASC, err_id ASC, err_fld_name ASC
)
 
 
drop table [SPR_STG].[dbo].[spr_pat_eval_err]
exec sp_rename 'spr_pat_eval_err_CH', 'spr_pat_eval_err'
 
 /************************************************  
 
     17) Scrambling [SPR_STG].[dbo].[spr_pat_eval_err_audt]....
 
 ***************************************************/
print '17: Scrambling [SPR_STG].[dbo].[spr_pat_eval_err_audt]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_pat_eval_err_audt_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_pat_eval_err_audt_CH]
 
select * into [SPR_STG].[dbo].[spr_pat_eval_err_audt_CH] from [SPR_STG].[dbo].[spr_pat_eval_err_audt] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_eval_err_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_eval_err_audt_CH] on
 
insert into [SPR_STG].[dbo].[spr_pat_eval_err_audt_CH]
        (pat_eval_id
        ,err_id
        ,err_fld_name
        ,err_sevr_id
        ,err_ovrd_flag
        ,err_desc
        ,err_detl
        ,err_prev_valu
        ,row_eff_user_id
        ,row_eff_date
        ,row_exp_date
        ,row_exp_xpln
        ,row_exp_user_id
        )
SELECT pat_eval_id
      ,err_id
      ,err_fld_name
      ,err_sevr_id
      ,err_ovrd_flag
      ,err_desc
      ,Metadata.dbo.[HFn_GetScrambledString](err_detl)
      ,Metadata.dbo.[HFn_GetScrambledString](err_prev_valu)
      ,row_eff_user_id
      ,row_eff_date
      ,row_exp_date
      ,row_exp_xpln
      ,row_exp_user_id
FROM [SPR_STG].[dbo].[spr_pat_eval_err_audt]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_pat_eval_err_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_pat_eval_err_audt_CH] off
 
drop table [SPR_STG].[dbo].[spr_pat_eval_err_audt]
exec sp_rename 'spr_pat_eval_err_audt_CH', 'spr_pat_eval_err_audt'
 
 /************************************************  
 
     18) Scrambling [SPR_STG].[dbo].[spr_surg_case]....
 
 ***************************************************/
print '18: Scrambling [SPR_STG].[dbo].[spr_surg_case]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_surg_case_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_surg_case_CH]
 
select * into [SPR_STG].[dbo].[spr_surg_case_CH] from [SPR_STG].[dbo].[spr_surg_case] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_case]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_case_CH] on
 
insert into [SPR_STG].[dbo].[spr_surg_case_CH]
        (surg_case_id
        ,spr_pat_id
        ,rha_id
        ,pat_eval_id
        ,pat_unvl_strt_perd_1
        ,pat_unvl_end_perd_1
        ,pat_unvl_xpln_id_perd_1
        ,pat_unvl_strt_perd_2
        ,pat_unvl_end_perd_2
        ,pat_unvl_xpln_id_perd_2
        ,pat_unvl_strt_perd_3
        ,pat_unvl_end_perd_3
        ,pat_unvl_xpln_id_perd_3
        ,orbs_book_id
        ,rha_case_no
        ,rqst_date
        ,refr_date
        ,spr_refr_md_id
        ,spr_srgn_id
        ,rha_srgn_alt_id
        ,init_srgn_vsit_date
        ,prim_proc_code
        ,scnd_proc_code_1
        ,scnd_proc_code_2
        ,scnd_proc_code_3
        ,free_text_desc
        ,free_text_desc_1
        ,free_text_desc_2
        ,free_text_desc_3
        ,side
        ,side_1
        ,side_2
        ,side_3
        ,fac_id
        ,proc_list_id
        ,enct_type_list_id
        ,enct_type_code
        ,surg_schd_date
        ,surg_defr_date
        ,postpone_list_id
        ,postpone_reason_code
        ,cancel_list_id
        ,cancel_reason_code
        ,surg_iatv_date
        ,spr_surg_iatv_xpln_id
        ,spr_surg_stat_id
        ,surg_case_xpln
        ,diagnosis
        ,city
        ,post_code
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        )
SELECT surg_case_id
      ,Metadata.dbo.[HFn_GetScrambledString](spr_pat_id)
      ,rha_id
      ,pat_eval_id
      ,pat_unvl_strt_perd_1
      ,pat_unvl_end_perd_1
      ,pat_unvl_xpln_id_perd_1
      ,pat_unvl_strt_perd_2
      ,pat_unvl_end_perd_2
      ,pat_unvl_xpln_id_perd_2
      ,pat_unvl_strt_perd_3
      ,pat_unvl_end_perd_3
      ,pat_unvl_xpln_id_perd_3
      ,orbs_book_id
      ,rha_case_no
      ,Metadata.dbo.[HFn_GetScrambledDate](rqst_date)
      ,Metadata.dbo.[HFn_GetScrambledDate](refr_date)
      ,Metadata.dbo.[HFn_GetScrambledString](spr_refr_md_id)
      ,Metadata.dbo.[HFn_GetScrambledString](spr_srgn_id)
      ,Metadata.dbo.[HFn_GetScrambledString](rha_srgn_alt_id)
      ,Metadata.dbo.[HFn_GetScrambledDate](init_srgn_vsit_date)
      ,prim_proc_code
      ,scnd_proc_code_1
      ,scnd_proc_code_2
      ,scnd_proc_code_3
      ,free_text_desc
      ,free_text_desc_1
      ,free_text_desc_2
      ,free_text_desc_3
      ,side
      ,side_1
      ,side_2
      ,side_3
      ,fac_id
      ,proc_list_id
      ,enct_type_list_id
      ,enct_type_code
      ,Metadata.dbo.[HFn_GetScrambledDate](surg_schd_date)
      ,Metadata.dbo.[HFn_GetScrambledDate](surg_defr_date)
      ,postpone_list_id
      ,postpone_reason_code
      ,cancel_list_id
      ,cancel_reason_code
      ,Metadata.dbo.[HFn_GetScrambledDate](surg_iatv_date)
      ,spr_surg_iatv_xpln_id
      ,spr_surg_stat_id
      ,surg_case_xpln
      ,diagnosis
      ,Metadata.dbo.[HFn_GetScrambledString](city)
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
FROM [SPR_STG].[dbo].[spr_surg_case]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_case]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_case_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case_CH]
ADD CONSTRAINT PK_spr_surg_case_CH
PRIMARY KEY CLUSTERED 
(
surg_case_id ASC
)
 
 
Create NONCLUSTERED INDEX idx_booking_date_CH
ON [SPR_STG].[dbo].[spr_surg_case_CH]
(
rqst_date ASC, rha_id ASC
)
 
Create NONCLUSTERED INDEX idx_booking_eval_id_CH
ON [SPR_STG].[dbo].[spr_surg_case_CH]
(
pat_eval_id ASC
)
 
Create NONCLUSTERED INDEX IX_spr_surg_case_hsn_CH
ON [SPR_STG].[dbo].[spr_surg_case_CH]
(
spr_pat_id ASC, rha_id ASC, surg_case_id ASC
)
 
Create NONCLUSTERED INDEX idx_booking_orbs_id_CH
ON [SPR_STG].[dbo].[spr_surg_case_CH]
(
orbs_book_id ASC, rha_id ASC, fac_id ASC
)
 
drop table [SPR_STG].[dbo].[spr_surg_case]
exec sp_rename 'spr_surg_case_CH', 'spr_surg_case'
 
 /************************************************  
 
     19) Scrambling [SPR_STG].[dbo].[spr_surg_case_audt]....
 
 ***************************************************/
print '19: Scrambling [SPR_STG].[dbo].[spr_surg_case_audt]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_surg_case_audt_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_surg_case_audt_CH]
 
select * into [SPR_STG].[dbo].[spr_surg_case_audt_CH] from [SPR_STG].[dbo].[spr_surg_case_audt] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_case_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_case_audt_CH] on
 
insert into [SPR_STG].[dbo].[spr_surg_case_audt_CH]
        (surg_case_id
        ,spr_pat_id
        ,rha_id
        ,pat_eval_id
        ,pat_unvl_strt_perd_1
        ,pat_unvl_end_perd_1
        ,pat_unvl_xpln_id_perd_1
        ,pat_unvl_strt_perd_2
        ,pat_unvl_end_perd_2
        ,pat_unvl_xpln_id_perd_2
        ,pat_unvl_strt_perd_3
        ,pat_unvl_end_perd_3
        ,pat_unvl_xpln_id_perd_3
        ,orbs_book_id
        ,rha_case_no
        ,rqst_date
        ,refr_date
        ,spr_refr_md_id
        ,spr_srgn_id
        ,rha_srgn_alt_id
        ,init_srgn_vsit_date
        ,prim_proc_code
        ,scnd_proc_code_1
        ,scnd_proc_code_2
        ,scnd_proc_code_3
        ,free_text_desc
        ,free_text_desc_1
        ,free_text_desc_2
        ,free_text_desc_3
        ,side
        ,side_1
        ,side_2
        ,side_3
        ,fac_id
        ,proc_list_id
        ,enct_type_list_id
        ,enct_type_code
        ,surg_schd_date
        ,surg_defr_date
        ,postpone_list_id
        ,postpone_reason_code
        ,cancel_list_id
        ,cancel_reason_code
        ,surg_iatv_date
        ,spr_surg_iatv_xpln_id
        ,spr_surg_stat_id
        ,surg_case_xpln
        ,diagnosis
        ,city
        ,post_code
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        ,row_exp_date
        ,row_exp_xpln
        ,row_exp_user_id
        )
SELECT surg_case_id
      ,Metadata.dbo.[HFn_GetScrambledString](spr_pat_id)
      ,rha_id
      ,pat_eval_id
      ,pat_unvl_strt_perd_1
      ,pat_unvl_end_perd_1
      ,pat_unvl_xpln_id_perd_1
      ,pat_unvl_strt_perd_2
      ,pat_unvl_end_perd_2
      ,pat_unvl_xpln_id_perd_2
      ,pat_unvl_strt_perd_3
      ,pat_unvl_end_perd_3
      ,pat_unvl_xpln_id_perd_3
      ,orbs_book_id
      ,rha_case_no
      ,Metadata.dbo.[HFn_GetScrambledDate](rqst_date)
      ,Metadata.dbo.[HFn_GetScrambledDate](refr_date)
      ,Metadata.dbo.[HFn_GetScrambledString](spr_refr_md_id)
      ,Metadata.dbo.[HFn_GetScrambledString](spr_srgn_id)
      ,Metadata.dbo.[HFn_GetScrambledString](rha_srgn_alt_id)
      ,Metadata.dbo.[HFn_GetScrambledDate](init_srgn_vsit_date)
      ,prim_proc_code
      ,scnd_proc_code_1
      ,scnd_proc_code_2
      ,scnd_proc_code_3
      ,free_text_desc
      ,free_text_desc_1
      ,free_text_desc_2
      ,free_text_desc_3
      ,side
      ,side_1
      ,side_2
      ,side_3
      ,fac_id
      ,proc_list_id
      ,enct_type_list_id
      ,enct_type_code
      ,Metadata.dbo.[HFn_GetScrambledDate](surg_schd_date)
      ,Metadata.dbo.[HFn_GetScrambledDate](surg_defr_date)
      ,postpone_list_id
      ,postpone_reason_code
      ,cancel_list_id
      ,cancel_reason_code
      ,Metadata.dbo.[HFn_GetScrambledDate](surg_iatv_date)
      ,spr_surg_iatv_xpln_id
      ,spr_surg_stat_id
      ,surg_case_xpln
      ,diagnosis
      ,Metadata.dbo.[HFn_GetScrambledString](city)
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
      ,row_exp_date
      ,row_exp_xpln
      ,row_exp_user_id
FROM [SPR_STG].[dbo].[spr_surg_case_audt]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_case_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_case_audt_CH] off
 
Create NONCLUSTERED INDEX IX_SPR_SURG_CASE_AUDT_D_CH
ON [SPR_STG].[dbo].[spr_surg_case_audt_CH]
(
surg_case_id ASC
)
 
drop table [SPR_STG].[dbo].[spr_surg_case_audt]
exec sp_rename 'spr_surg_case_audt_CH', 'spr_surg_case_audt'
 
 /************************************************  
 
     20) Scrambling [SPR_STG].[dbo].[spr_surg_case_err]....
 
 ***************************************************/
print '20: Scrambling [SPR_STG].[dbo].[spr_surg_case_err]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_surg_case_err_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_surg_case_err_CH]
 
select * into [SPR_STG].[dbo].[spr_surg_case_err_CH] from [SPR_STG].[dbo].[spr_surg_case_err] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_case_err]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_case_err_CH] on
 
insert into [SPR_STG].[dbo].[spr_surg_case_err_CH]
        (surg_case_id
        ,err_id
        ,err_fld_name
        ,err_sevr_id
        ,err_ovrd_flag
        ,err_desc
        ,err_detl
        ,err_prev_valu
        ,row_eff_user_id
        ,row_eff_date
        )
SELECT surg_case_id
      ,err_id
      ,err_fld_name
      ,err_sevr_id
      ,err_ovrd_flag
      ,err_desc
      ,Metadata.dbo.[HFn_GetScrambledString](err_detl)
      ,Metadata.dbo.[HFn_GetScrambledString](err_prev_valu)
      ,row_eff_user_id
      ,row_eff_date
FROM [SPR_STG].[dbo].[spr_surg_case_err]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_case_err]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_case_err_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case_err_CH]
ADD CONSTRAINT PK_spr_surg_case_err_CH
PRIMARY KEY CLUSTERED 
(
surg_case_id ASC, err_id ASC, err_fld_name ASC
)
 
 
drop table [SPR_STG].[dbo].[spr_surg_case_err]
exec sp_rename 'spr_surg_case_err_CH', 'spr_surg_case_err'
 
 /************************************************  
 
     21) Scrambling [SPR_STG].[dbo].[spr_surg_case_err_audt]....
 
 ***************************************************/
print '21: Scrambling [SPR_STG].[dbo].[spr_surg_case_err_audt]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_surg_case_err_audt_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_surg_case_err_audt_CH]
 
select * into [SPR_STG].[dbo].[spr_surg_case_err_audt_CH] from [SPR_STG].[dbo].[spr_surg_case_err_audt] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_case_err_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_case_err_audt_CH] on
 
insert into [SPR_STG].[dbo].[spr_surg_case_err_audt_CH]
        (surg_case_id
        ,err_id
        ,err_fld_name
        ,err_sevr_id
        ,err_ovrd_flag
        ,err_desc
        ,err_detl
        ,err_prev_valu
        ,row_eff_user_id
        ,row_eff_date
        ,row_exp_date
        ,row_exp_xpln
        ,row_exp_user_id
        )
SELECT surg_case_id
      ,err_id
      ,err_fld_name
      ,err_sevr_id
      ,err_ovrd_flag
      ,err_desc
      ,Metadata.dbo.[HFn_GetScrambledString](err_detl)
      ,Metadata.dbo.[HFn_GetScrambledString](err_prev_valu)
      ,row_eff_user_id
      ,row_eff_date
      ,row_exp_date
      ,row_exp_xpln
      ,row_exp_user_id
FROM [SPR_STG].[dbo].[spr_surg_case_err_audt]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_case_err_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_case_err_audt_CH] off
 
drop table [SPR_STG].[dbo].[spr_surg_case_err_audt]
exec sp_rename 'spr_surg_case_err_audt_CH', 'spr_surg_case_err_audt'
 
 /************************************************  
 
     22) Scrambling [SPR_STG].[dbo].[spr_surg_post_op]....
 
 ***************************************************/
print '22: Scrambling [SPR_STG].[dbo].[spr_surg_post_op]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_surg_post_op_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_surg_post_op_CH]
 
select * into [SPR_STG].[dbo].[spr_surg_post_op_CH] from [SPR_STG].[dbo].[spr_surg_post_op] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_post_op]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_post_op_CH] on
 
insert into [SPR_STG].[dbo].[spr_surg_post_op_CH]
        (surg_post_op_id
        ,surg_case_id
        ,spr_pat_id
        ,rha_id
        ,orbs_book_id
        ,rha_case_no
        ,fac_id
        ,proc_list_id
        ,spr_srgn_id
        ,surg_cmpl_date
        ,prim_proc_code
        ,scnd_proc_code_1
        ,scnd_proc_code_2
        ,scnd_proc_code_3
        ,free_text_desc
        ,free_text_desc_1
        ,free_text_desc_2
        ,free_text_desc_3
        ,side
        ,side_1
        ,side_2
        ,side_3
        ,emrg_surg
        ,city
        ,post_code
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        )
SELECT surg_post_op_id
      ,surg_case_id
      ,Metadata.dbo.[HFn_GetScrambledString](spr_pat_id)
      ,rha_id
      ,orbs_book_id
      ,rha_case_no
      ,fac_id
      ,proc_list_id
      ,Metadata.dbo.[HFn_GetScrambledString](spr_srgn_id)
      ,Metadata.dbo.[HFn_GetScrambledDate](surg_cmpl_date)
      ,prim_proc_code
      ,scnd_proc_code_1
      ,scnd_proc_code_2
      ,scnd_proc_code_3
      ,free_text_desc
      ,free_text_desc_1
      ,free_text_desc_2
      ,free_text_desc_3
      ,side
      ,side_1
      ,side_2
      ,side_3
      ,emrg_surg
      ,Metadata.dbo.[HFn_GetScrambledString](city)
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
FROM [SPR_STG].[dbo].[spr_surg_post_op]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_post_op]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_post_op_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op_CH]
ADD CONSTRAINT PK_spr_surg_post_op_CH
PRIMARY KEY CLUSTERED 
(
surg_post_op_id ASC
)
 
 
Create NONCLUSTERED INDEX idx_fac_case_number_CH
ON [SPR_STG].[dbo].[spr_surg_post_op_CH]
(
fac_id ASC, rha_case_no ASC
)
 
Create NONCLUSTERED INDEX idx_post_booking_id_CH
ON [SPR_STG].[dbo].[spr_surg_post_op_CH]
(
surg_case_id ASC
)
 
Create NONCLUSTERED INDEX idx_post_cmpl_date_CH
ON [SPR_STG].[dbo].[spr_surg_post_op_CH]
(
surg_cmpl_date ASC, rha_id ASC
)
 
Create UNIQUE NONCLUSTERED INDEX IX_spr_surg_post_op_case_no_CH
ON [SPR_STG].[dbo].[spr_surg_post_op_CH]
(
fac_id ASC, rha_case_no ASC
)
 
Create NONCLUSTERED INDEX IX_spr_surg_post_op_hsn_CH
ON [SPR_STG].[dbo].[spr_surg_post_op_CH]
(
spr_pat_id ASC
)
 
drop table [SPR_STG].[dbo].[spr_surg_post_op]
exec sp_rename 'spr_surg_post_op_CH', 'spr_surg_post_op'
 
 /************************************************  
 
     23) Scrambling [SPR_STG].[dbo].[spr_surg_post_op_audt]....
 
 ***************************************************/
print '23: Scrambling [SPR_STG].[dbo].[spr_surg_post_op_audt]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_surg_post_op_audt_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_surg_post_op_audt_CH]
 
select * into [SPR_STG].[dbo].[spr_surg_post_op_audt_CH] from [SPR_STG].[dbo].[spr_surg_post_op_audt] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_post_op_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_post_op_audt_CH] on
 
insert into [SPR_STG].[dbo].[spr_surg_post_op_audt_CH]
        (surg_post_op_id
        ,surg_case_id
        ,spr_pat_id
        ,rha_id
        ,orbs_book_id
        ,rha_case_no
        ,fac_id
        ,proc_list_id
        ,spr_srgn_id
        ,surg_cmpl_date
        ,prim_proc_code
        ,scnd_proc_code_1
        ,scnd_proc_code_2
        ,scnd_proc_code_3
        ,free_text_desc
        ,free_text_desc_1
        ,free_text_desc_2
        ,free_text_desc_3
        ,side
        ,side_1
        ,side_2
        ,side_3
        ,emrg_surg
        ,city
        ,post_code
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        ,row_exp_date
        ,row_exp_xpln
        ,row_exp_user_id
        )
SELECT surg_post_op_id
      ,surg_case_id
      ,Metadata.dbo.[HFn_GetScrambledString](spr_pat_id)
      ,rha_id
      ,orbs_book_id
      ,rha_case_no
      ,fac_id
      ,proc_list_id
      ,Metadata.dbo.[HFn_GetScrambledString](spr_srgn_id)
      ,Metadata.dbo.[HFn_GetScrambledDate](surg_cmpl_date)
      ,prim_proc_code
      ,scnd_proc_code_1
      ,scnd_proc_code_2
      ,scnd_proc_code_3
      ,free_text_desc
      ,free_text_desc_1
      ,free_text_desc_2
      ,free_text_desc_3
      ,side
      ,side_1
      ,side_2
      ,side_3
      ,emrg_surg
      ,Metadata.dbo.[HFn_GetScrambledString](city)
      ,Metadata.dbo.[HFn_GetScrambledString](post_code)
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
      ,row_exp_date
      ,row_exp_xpln
      ,row_exp_user_id
FROM [SPR_STG].[dbo].[spr_surg_post_op_audt]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_post_op_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_post_op_audt_CH] off
 
Create NONCLUSTERED INDEX IX_SPR_SURG_POST_OP_AUDT_ID_CH
ON [SPR_STG].[dbo].[spr_surg_post_op_audt_CH]
(
surg_post_op_id ASC
)
 
drop table [SPR_STG].[dbo].[spr_surg_post_op_audt]
exec sp_rename 'spr_surg_post_op_audt_CH', 'spr_surg_post_op_audt'
 
 /************************************************  
 
     24) Scrambling [SPR_STG].[dbo].[spr_surg_post_op_err]....
 
 ***************************************************/
print '24: Scrambling [SPR_STG].[dbo].[spr_surg_post_op_err]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_surg_post_op_err_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_surg_post_op_err_CH]
 
select * into [SPR_STG].[dbo].[spr_surg_post_op_err_CH] from [SPR_STG].[dbo].[spr_surg_post_op_err] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_post_op_err]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_post_op_err_CH] on
 
insert into [SPR_STG].[dbo].[spr_surg_post_op_err_CH]
        (surg_post_op_id
        ,err_id
        ,err_fld_name
        ,surg_cmpl_date
        ,fac_id
        ,spr_pat_id
        ,spr_pat_id_type
        ,err_sevr_id
        ,err_ovrd_flag
        ,err_desc
        ,err_detl
        ,err_prev_valu
        ,row_eff_user_id
        ,row_eff_date
        )
SELECT surg_post_op_id
      ,err_id
      ,err_fld_name
      ,Metadata.dbo.[HFn_GetScrambledDate](surg_cmpl_date)
      ,fac_id
      ,Metadata.dbo.[HFn_GetScrambledString](spr_pat_id)
      ,spr_pat_id_type
      ,err_sevr_id
      ,err_ovrd_flag
      ,err_desc
      ,Metadata.dbo.[HFn_GetScrambledString](err_detl)
      ,Metadata.dbo.[HFn_GetScrambledString](err_prev_valu)
      ,row_eff_user_id
      ,row_eff_date
FROM [SPR_STG].[dbo].[spr_surg_post_op_err]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_post_op_err]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_post_op_err_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op_err_CH]
ADD CONSTRAINT PK_spr_surg_post_op_err_CH
PRIMARY KEY CLUSTERED 
(
surg_post_op_id ASC, err_id ASC, err_fld_name ASC
)
 
 
drop table [SPR_STG].[dbo].[spr_surg_post_op_err]
exec sp_rename 'spr_surg_post_op_err_CH', 'spr_surg_post_op_err'
 
 /************************************************  
 
     25) Scrambling [SPR_STG].[dbo].[spr_surg_post_op_err_audt]....
 
 ***************************************************/
print '25: Scrambling [SPR_STG].[dbo].[spr_surg_post_op_err_audt]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_surg_post_op_err_audt_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_surg_post_op_err_audt_CH]
 
select * into [SPR_STG].[dbo].[spr_surg_post_op_err_audt_CH] from [SPR_STG].[dbo].[spr_surg_post_op_err_audt] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_post_op_err_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_post_op_err_audt_CH] on
 
insert into [SPR_STG].[dbo].[spr_surg_post_op_err_audt_CH]
        (surg_post_op_id
        ,err_id
        ,err_fld_name
        ,surg_cmpl_date
        ,fac_id
        ,spr_pat_id
        ,spr_pat_id_type
        ,err_sevr_id
        ,err_ovrd_flag
        ,err_desc
        ,err_detl
        ,err_prev_valu
        ,row_eff_user_id
        ,row_eff_date
        ,row_exp_date
        ,row_exp_xpln
        ,row_exp_user_id
        )
SELECT surg_post_op_id
      ,err_id
      ,err_fld_name
      ,Metadata.dbo.[HFn_GetScrambledDate](surg_cmpl_date)
      ,fac_id
      ,Metadata.dbo.[HFn_GetScrambledString](spr_pat_id)
      ,spr_pat_id_type
      ,err_sevr_id
      ,err_ovrd_flag
      ,err_desc
      ,Metadata.dbo.[HFn_GetScrambledString](err_detl)
      ,Metadata.dbo.[HFn_GetScrambledString](err_prev_valu)
      ,row_eff_user_id
      ,row_eff_date
      ,row_exp_date
      ,row_exp_xpln
      ,row_exp_user_id
FROM [SPR_STG].[dbo].[spr_surg_post_op_err_audt]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_surg_post_op_err_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_surg_post_op_err_audt_CH] off
 
drop table [SPR_STG].[dbo].[spr_surg_post_op_err_audt]
exec sp_rename 'spr_surg_post_op_err_audt_CH', 'spr_surg_post_op_err_audt'
 
 /************************************************  
 
     26) Scrambling [SPR_STG].[dbo].[spr_xsys_access_log]....
 
 ***************************************************/
print '26: Scrambling [SPR_STG].[dbo].[spr_xsys_access_log]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_xsys_access_log_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_xsys_access_log_CH]
 
select * into [SPR_STG].[dbo].[spr_xsys_access_log_CH] from [SPR_STG].[dbo].[spr_xsys_access_log] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_xsys_access_log]'))
    set identity_insert [SPR_STG].[dbo].[spr_xsys_access_log_CH] on
 
insert into [SPR_STG].[dbo].[spr_xsys_access_log_CH]
        (log_date_time
        ,user_id
        ,rha_id
        ,fac_id
        ,patient_phn
        ,patient_rha
        ,patient_fac_id
        ,action
        ,action_location
        ,action_parameters
        )
SELECT log_date_time
      ,user_id
      ,rha_id
      ,fac_id
      ,Metadata.dbo.[HFn_GetScrambledString](patient_phn)
      ,patient_rha
      ,patient_fac_id
      ,action
      ,action_location
      ,Metadata.dbo.[HFn_GetScrambledString](action_parameters)
FROM [SPR_STG].[dbo].[spr_xsys_access_log]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_xsys_access_log]'))
    set identity_insert [SPR_STG].[dbo].[spr_xsys_access_log_CH] off
 
Create CLUSTERED INDEX idx_spr_xsys_access_log_CH
ON [SPR_STG].[dbo].[spr_xsys_access_log_CH]
(
log_date_time ASC, user_id ASC
)
 
drop table [SPR_STG].[dbo].[spr_xsys_access_log]
exec sp_rename 'spr_xsys_access_log_CH', 'spr_xsys_access_log'
 
 /************************************************  
 
     27) Scrambling [SPR_STG].[dbo].[spr_xsys_user_srgn_xref]....
 
 ***************************************************/
print '27: Scrambling [SPR_STG].[dbo].[spr_xsys_user_srgn_xref]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_xsys_user_srgn_xref_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_CH]
 
select * into [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_CH] from [SPR_STG].[dbo].[spr_xsys_user_srgn_xref] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_xsys_user_srgn_xref]'))
    set identity_insert [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_CH] on
 
insert into [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_CH]
        (user_id
        ,spr_md_id
        ,rha_id
        ,provider_id
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        )
SELECT user_id
      ,Metadata.dbo.[HFn_GetScrambledString](spr_md_id)
      ,rha_id
      ,provider_id
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
FROM [SPR_STG].[dbo].[spr_xsys_user_srgn_xref]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_xsys_user_srgn_xref]'))
    set identity_insert [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_CH] off
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_CH]
ADD CONSTRAINT PK_spr_xsys_user_srgn_xref_CH
PRIMARY KEY CLUSTERED 
(
user_id ASC, spr_md_id ASC, rha_id ASC, provider_id ASC
)
 
 
drop table [SPR_STG].[dbo].[spr_xsys_user_srgn_xref]
exec sp_rename 'spr_xsys_user_srgn_xref_CH', 'spr_xsys_user_srgn_xref'
 
 /************************************************  
 
     28) Scrambling [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt]....
 
 ***************************************************/
print '28: Scrambling [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt]....'
IF OBJECT_ID ( '[SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt_CH]' ) IS NOT NULL
    drop table [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt_CH]
 
select * into [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt_CH] from [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt] where 1=2 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt_CH] on
 
insert into [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt_CH]
        (user_id
        ,spr_md_id
        ,rha_id
        ,provider_id
        ,row_eff_user_id
        ,row_eff_date
        ,row_id
        ,row_exp_date
        ,row_exp_xpln
        ,row_exp_user_id
        )
SELECT user_id
      ,Metadata.dbo.[HFn_GetScrambledString](spr_md_id)
      ,rha_id
      ,provider_id
      ,row_eff_user_id
      ,row_eff_date
      ,row_id
      ,row_exp_date
      ,row_exp_xpln
      ,row_exp_user_id
FROM [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt]
 
 
IF exists (select * from SPR_STG.sys.identity_columns where object_id = object_id('[SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt]'))
    set identity_insert [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt_CH] off
 
drop table [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt]
exec sp_rename 'spr_xsys_user_srgn_xref_audt_CH', 'spr_xsys_user_srgn_xref_audt'
 
/******************************************************************************
 
            Re-create all the foreign keys  
 
*******************************************************************************/
ALTER TABLE [SPR_STG].[dbo].[spr_assm_stat_defn_audt]
ADD  CONSTRAINT FK_spr_assm_stat_defn_audt_spr_assm_stat_defn_CH
FOREIGN KEY(assm_stat_id)
REFERENCES [SPR_STG].[dbo].[spr_assm_stat_defn] 
    (assm_stat_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_bp_feedback_detail]
ADD  CONSTRAINT FK_spr_bp_feedback_detail_spr_bp_feedback_head_CH
FOREIGN KEY(feedback_head_id)
REFERENCES [SPR_STG].[dbo].[spr_bp_feedback_head] 
    (feedback_head_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_bp_feedback_head]
ADD  CONSTRAINT FK_spr_bp_feedback_head_spr_bp_rha_file_process_log_CH
FOREIGN KEY(file_id)
REFERENCES [SPR_STG].[dbo].[spr_bp_rha_file_process_log] 
    (file_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in]
ADD  CONSTRAINT FK_spr_bp_rha_booking_rec_in_spr_bp_rha_file_process_log_CH
FOREIGN KEY(file_id)
REFERENCES [SPR_STG].[dbo].[spr_bp_rha_file_process_log] 
    (file_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in]
ADD  CONSTRAINT FK_spr_bp_rha_pat_rec_in_spr_bp_rha_file_process_log_CH
FOREIGN KEY(file_id)
REFERENCES [SPR_STG].[dbo].[spr_bp_rha_file_process_log] 
    (file_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_bp_rha_postsurg_rec_in]
ADD  CONSTRAINT FK_spr_bp_rha_postsurg_rec_in_spr_bp_rha_file_process_log_CH
FOREIGN KEY(file_id)
REFERENCES [SPR_STG].[dbo].[spr_bp_rha_file_process_log] 
    (file_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_cancel_reason_defn_audt]
ADD  CONSTRAINT FK_spr_cancel_reason_defn_audt_spr_cancel_reason_defn_CH
FOREIGN KEY(spr_cancel_code)
REFERENCES [SPR_STG].[dbo].[spr_cancel_reason_defn] 
    (spr_cancel_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_cancel_reason_list]
ADD  CONSTRAINT FK_spr_cancel_reason_list_spr_rha_defn_CH
FOREIGN KEY(rha_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_defn] 
    (rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_cancel_reason_list_audt]
ADD  CONSTRAINT FK_spr_cancel_reason_list_audt_spr_cancel_reason_list_CH
FOREIGN KEY(cancel_reason_list_id)
REFERENCES [SPR_STG].[dbo].[spr_cancel_reason_list] 
    (cancel_reason_list_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_enct_type_defn_audt]
ADD  CONSTRAINT FK_spr_enct_type_defn_audt_spr_enct_type_defn_CH
FOREIGN KEY(spr_enct_type_code)
REFERENCES [SPR_STG].[dbo].[spr_enct_type_defn] 
    (spr_enct_type_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_enct_type_list]
ADD  CONSTRAINT FK_spr_enct_type_list_spr_rha_defn_CH
FOREIGN KEY(rha_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_defn] 
    (rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_enct_type_list_audt]
ADD  CONSTRAINT FK_spr_enct_type_list_audt_spr_enct_type_list_CH
FOREIGN KEY(enct_type_list_id)
REFERENCES [SPR_STG].[dbo].[spr_enct_type_list] 
    (enct_type_list_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_eval_defn]
ADD  CONSTRAINT FK_spr_eval_defn_spr_surg_serv_defn_CH
FOREIGN KEY(spr_surg_serv_id)
REFERENCES [SPR_STG].[dbo].[spr_surg_serv_defn] 
    (spr_surg_serv_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_eval_defn_audt]
ADD  CONSTRAINT FK_spr_eval_defn_audt_spr_eval_defn_CH
FOREIGN KEY(spr_eval_id)
REFERENCES [SPR_STG].[dbo].[spr_eval_defn] 
    (spr_eval_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_eval_qstn]
ADD  CONSTRAINT FK_spr_eval_qstn_spr_eval_defn_CH
FOREIGN KEY(spr_eval_id)
REFERENCES [SPR_STG].[dbo].[spr_eval_defn] 
    (spr_eval_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_eval_qstn_audt]
ADD  CONSTRAINT FK_spr_eval_qstn_audt_spr_eval_qstn_CH
FOREIGN KEY(spr_eval_id,qstn_id)
REFERENCES [SPR_STG].[dbo].[spr_eval_qstn] 
    (spr_eval_id,qstn_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_eval_qstn_choi]
ADD  CONSTRAINT FK_spr_eval_qstn_choi_spr_eval_qstn_part_CH
FOREIGN KEY(spr_eval_id,qstn_id,qstn_part)
REFERENCES [SPR_STG].[dbo].[spr_eval_qstn_part] 
    (spr_eval_id,qstn_id,qstn_part)
 
ALTER TABLE [SPR_STG].[dbo].[spr_eval_qstn_choi_audt]
ADD  CONSTRAINT FK_spr_eval_qstn_choi_audt_spr_eval_qstn_choi_CH
FOREIGN KEY(spr_eval_id,qstn_id,qstn_part,choi_no)
REFERENCES [SPR_STG].[dbo].[spr_eval_qstn_choi] 
    (spr_eval_id,qstn_id,qstn_part,choi_no)
 
ALTER TABLE [SPR_STG].[dbo].[spr_eval_qstn_part]
ADD  CONSTRAINT FK_spr_eval_qstn_part_spr_eval_qstn_CH
FOREIGN KEY(spr_eval_id,qstn_id)
REFERENCES [SPR_STG].[dbo].[spr_eval_qstn] 
    (spr_eval_id,qstn_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_eval_qstn_part_audt]
ADD  CONSTRAINT FK_spr_eval_qstn_part_audt_spr_eval_qstn_part_CH
FOREIGN KEY(spr_eval_id,qstn_id,qstn_part)
REFERENCES [SPR_STG].[dbo].[spr_eval_qstn_part] 
    (spr_eval_id,qstn_id,qstn_part)
 
ALTER TABLE [SPR_STG].[dbo].[spr_fac_defn]
ADD  CONSTRAINT FK_spr_fac_defn_spr_hsda_defn_CH
FOREIGN KEY(hsda_id)
REFERENCES [SPR_STG].[dbo].[spr_hsda_defn] 
    (hsda_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_fac_defn]
ADD  CONSTRAINT FK_spr_fac_defn_spr_postpone_reason_list_CH
FOREIGN KEY(postpone_list_id)
REFERENCES [SPR_STG].[dbo].[spr_postpone_reason_list] 
    (postpone_reason_list_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_fac_defn]
ADD  CONSTRAINT FK_spr_fac_defn_spr_proc_list_CH
FOREIGN KEY(proc_list_id)
REFERENCES [SPR_STG].[dbo].[spr_proc_list] 
    (proc_list_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_fac_defn]
ADD  CONSTRAINT FK_spr_fac_defn_spr_rha_defn_CH
FOREIGN KEY(rha_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_defn] 
    (rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_fac_defn]
ADD  CONSTRAINT FK_spr_fac_defn_spr_cancel_reason_list_CH
FOREIGN KEY(cancel_list_id)
REFERENCES [SPR_STG].[dbo].[spr_cancel_reason_list] 
    (cancel_reason_list_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_fac_defn]
ADD  CONSTRAINT FK_spr_fac_defn_spr_enct_type_list_CH
FOREIGN KEY(enct_type_list_id)
REFERENCES [SPR_STG].[dbo].[spr_enct_type_list] 
    (enct_type_list_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_fac_defn_audt]
ADD  CONSTRAINT FK_spr_fac_defn_audt_spr_fac_defn_CH
FOREIGN KEY(fac_id)
REFERENCES [SPR_STG].[dbo].[spr_fac_defn] 
    (fac_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_iact_defn_audt]
ADD  CONSTRAINT FK_spr_iact_defn_audt_spr_iact_defn_CH
FOREIGN KEY(sscn_iact_type_id)
REFERENCES [SPR_STG].[dbo].[spr_iact_defn] 
    (spr_iact_type_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_inac_assm_xpln_defn_audt]
ADD  CONSTRAINT FK_spr_inac_assm_xpln_defn_audt_spr_inac_assm_xpln_defn_CH
FOREIGN KEY(spr_defr_xpln_id)
REFERENCES [SPR_STG].[dbo].[spr_inac_assm_xpln_defn] 
    (spr_defr_xpln_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_md]
ADD  CONSTRAINT FK_spr_md_spr_providers_CH
FOREIGN KEY(provider_id)
REFERENCES [SPR_STG].[dbo].[spr_providers] 
    (provider_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_md]
ADD  CONSTRAINT FK_spr_md_spr_rha_defn_CH
FOREIGN KEY(rha_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_defn] 
    (rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_md]
ADD  CONSTRAINT FK_spr_md_spr_spec_defn_CH
FOREIGN KEY(md_spec_id)
REFERENCES [SPR_STG].[dbo].[spr_spec_defn] 
    (md_spec_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_md_audt]
ADD  CONSTRAINT FK_spr_md_audt_spr_md_CH
FOREIGN KEY(spr_md_id,rha_id)
REFERENCES [SPR_STG].[dbo].[spr_md] 
    (spr_md_id,rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_md_ref]
ADD  CONSTRAINT FK_spr_md_ref_spr_rha_defn_CH
FOREIGN KEY(rha_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_defn] 
    (rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat]
ADD  CONSTRAINT FK_spr_pat_spr_pat_alt_id_type_CH
FOREIGN KEY(alt_pat_id_type)
REFERENCES [SPR_STG].[dbo].[spr_pat_alt_id_type] 
    (alt_pat_id_type)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat]
ADD  CONSTRAINT FK_spr_pat_spr_rha_defn_CH
FOREIGN KEY(rha_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_defn] 
    (rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat]
ADD  CONSTRAINT FK_spr_pat_spr_sex_CH
FOREIGN KEY(sex)
REFERENCES [SPR_STG].[dbo].[spr_sex] 
    (sex_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat]
ADD  CONSTRAINT FK_spr_pat_spr_spec_postal_code_CH
FOREIGN KEY(post_code)
REFERENCES [SPR_STG].[dbo].[spr_spec_postal_code] 
    (postal_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat]
ADD  CONSTRAINT FK_spr_pat_spr_spec_postal_code1_CH
FOREIGN KEY(ctac_post_code)
REFERENCES [SPR_STG].[dbo].[spr_spec_postal_code] 
    (postal_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat]
ADD  CONSTRAINT FK_spr_pat_spr_province_CH
FOREIGN KEY(prov_code)
REFERENCES [SPR_STG].[dbo].[spr_province] 
    (province_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat]
ADD  CONSTRAINT FK_spr_pat_spr_province1_CH
FOREIGN KEY(ctac_prov_code)
REFERENCES [SPR_STG].[dbo].[spr_province] 
    (province_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_alt_id_type_audt]
ADD  CONSTRAINT FK_spr_pat_id_type_audt_spr_pat_id_type_CH
FOREIGN KEY(alt_pat_id_type)
REFERENCES [SPR_STG].[dbo].[spr_pat_alt_id_type] 
    (alt_pat_id_type)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_audt]
ADD  CONSTRAINT FK_spr_pat_audt_spr_pat_CH
FOREIGN KEY(spr_pat_id,rha_id)
REFERENCES [SPR_STG].[dbo].[spr_pat] 
    (spr_pat_id,rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_err]
ADD  CONSTRAINT FK_spr_pat_err_spr_pat_CH
FOREIGN KEY(spr_pat_id,rha_id)
REFERENCES [SPR_STG].[dbo].[spr_pat] 
    (spr_pat_id,rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_err_audt]
ADD  CONSTRAINT FK_spr_pat_err_audt_spr_pat_err_CH
FOREIGN KEY(err_id,err_fld_name,spr_pat_id,rha_id)
REFERENCES [SPR_STG].[dbo].[spr_pat_err] 
    (err_id,err_fld_name,spr_pat_id,rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval]
ADD  CONSTRAINT FK_spr_pat_eval_spr_rha_defn_CH
FOREIGN KEY(rha_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_defn] 
    (rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval]
ADD  CONSTRAINT FK_spr_pat_eval_spr_assm_stat_defn_CH
FOREIGN KEY(assm_stat_id)
REFERENCES [SPR_STG].[dbo].[spr_assm_stat_defn] 
    (assm_stat_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval]
ADD  CONSTRAINT FK_spr_pat_eval_spr_eval_defn_CH
FOREIGN KEY(spr_eval_id)
REFERENCES [SPR_STG].[dbo].[spr_eval_defn] 
    (spr_eval_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval]
ADD  CONSTRAINT FK_spr_pat_eval_spr_inac_assm_xpln_defn_CH
FOREIGN KEY(assm_inac_xpln_id)
REFERENCES [SPR_STG].[dbo].[spr_inac_assm_xpln_defn] 
    (spr_defr_xpln_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval]
ADD  CONSTRAINT FK_spr_pat_eval_spr_pat_CH
FOREIGN KEY(spr_pat_id,rha_id)
REFERENCES [SPR_STG].[dbo].[spr_pat] 
    (spr_pat_id,rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval]
ADD  CONSTRAINT FK_spr_pat_eval_spr_wait_list_cat_defn_CH
FOREIGN KEY(wait_list_cat_id)
REFERENCES [SPR_STG].[dbo].[spr_wait_list_cat_defn] 
    (spr_wait_list_cat_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval_answ]
ADD  CONSTRAINT FK_spr_pat_eval_answ_spr_pat_eval_CH
FOREIGN KEY(pat_eval_id)
REFERENCES [SPR_STG].[dbo].[spr_pat_eval] 
    (pat_eval_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval_answ_audt]
ADD  CONSTRAINT FK_spr_pat_eval_answ_audt_spr_pat_eval_answ_CH
FOREIGN KEY(pat_eval_id,qstn_id,qstn_part)
REFERENCES [SPR_STG].[dbo].[spr_pat_eval_answ] 
    (pat_eval_id,qstn_id,qstn_part)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval_answ_err]
ADD  CONSTRAINT FK_spr_pat_eval_answ_err_spr_pat_eval_CH
FOREIGN KEY(pat_eval_id)
REFERENCES [SPR_STG].[dbo].[spr_pat_eval] 
    (pat_eval_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval_answ_err_audt]
ADD  CONSTRAINT FK_spr_pat_eval_answ_err_audt_spr_pat_eval_answ_err_CH
FOREIGN KEY(pat_eval_id,qstn_id,qstn_part,err_id,err_fld_name)
REFERENCES [SPR_STG].[dbo].[spr_pat_eval_answ_err] 
    (pat_eval_id,qstn_id,qstn_part,err_id,err_fld_name)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval_audt]
ADD  CONSTRAINT FK_spr_pat_eval_audt_spr_pat_eval_CH
FOREIGN KEY(pat_eval_id)
REFERENCES [SPR_STG].[dbo].[spr_pat_eval] 
    (pat_eval_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval_err]
ADD  CONSTRAINT FK_spr_pat_eval_err_spr_pat_eval_CH
FOREIGN KEY(pat_eval_id)
REFERENCES [SPR_STG].[dbo].[spr_pat_eval] 
    (pat_eval_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_eval_err_audt]
ADD  CONSTRAINT FK_spr_pat_eval_err_audt_spr_pat_eval_err_CH
FOREIGN KEY(pat_eval_id,err_id,err_fld_name)
REFERENCES [SPR_STG].[dbo].[spr_pat_eval_err] 
    (pat_eval_id,err_id,err_fld_name)
 
ALTER TABLE [SPR_STG].[dbo].[spr_pat_unvl_defn_audt]
ADD  CONSTRAINT FK_spr_pat_unvl_defn_audt_spr_pat_unvl_defn_CH
FOREIGN KEY(spr_pat_unvl_id)
REFERENCES [SPR_STG].[dbo].[spr_pat_unvl_defn] 
    (spr_pat_unvl_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_post_code_rha_xref]
ADD  CONSTRAINT FK_spr_post_code_rha_xref_spr_rha_defn_CH
FOREIGN KEY(rha_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_defn] 
    (rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_post_code_rha_xref_audt]
ADD  CONSTRAINT FK_spr_post_code_rha_xref_audt_spr_post_code_rha_xref_CH
FOREIGN KEY(post_code,rha_id)
REFERENCES [SPR_STG].[dbo].[spr_post_code_rha_xref] 
    (post_code,rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_postpone_reason_defn_audt]
ADD  CONSTRAINT FK_spr_defr_xpln_defn_audt_spr_defr_xpln_defn_CH
FOREIGN KEY(spr_postpone_code)
REFERENCES [SPR_STG].[dbo].[spr_postpone_reason_defn] 
    (spr_postpone_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_postpone_reason_list]
ADD  CONSTRAINT FK_spr_postpone_reason_list_spr_rha_defn_CH
FOREIGN KEY(rha_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_defn] 
    (rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_postpone_reason_list_audt]
ADD  CONSTRAINT FK_spr_postpone_reason_list_audt_spr_postpone_reason_list_CH
FOREIGN KEY(postpone_reason_list_id)
REFERENCES [SPR_STG].[dbo].[spr_postpone_reason_list] 
    (postpone_reason_list_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_proc_defn]
ADD  CONSTRAINT FK_spr_proc_defn_spr_surg_serv_defn_CH
FOREIGN KEY(spr_surg_serv_id)
REFERENCES [SPR_STG].[dbo].[spr_surg_serv_defn] 
    (spr_surg_serv_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_proc_defn_audt]
ADD  CONSTRAINT FK_spr_proc_defn_audt_spr_proc_defn_CH
FOREIGN KEY(spr_proc_id)
REFERENCES [SPR_STG].[dbo].[spr_proc_defn] 
    (spr_proc_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_proc_list]
ADD  CONSTRAINT FK_spr_proc_list_spr_rha_defn_CH
FOREIGN KEY(rha_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_defn] 
    (rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_proc_list_audt]
ADD  CONSTRAINT FK_spr_proc_list_audt_spr_proc_list_CH
FOREIGN KEY(proc_list_id)
REFERENCES [SPR_STG].[dbo].[spr_proc_list] 
    (proc_list_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_providers_audt]
ADD  CONSTRAINT FK_spr_providers_audt_spr_providers_CH
FOREIGN KEY(provider_id)
REFERENCES [SPR_STG].[dbo].[spr_providers] 
    (provider_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_province_audt]
ADD  CONSTRAINT FK_spr_province_audt_spr_province_CH
FOREIGN KEY(province_code)
REFERENCES [SPR_STG].[dbo].[spr_province] 
    (province_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_rha_cancel_reason_defn]
ADD  CONSTRAINT FK_spr_rha_cancel_reason_defn_spr_cancel_reason_defn_CH
FOREIGN KEY(spr_cancel_code)
REFERENCES [SPR_STG].[dbo].[spr_cancel_reason_defn] 
    (spr_cancel_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_rha_cancel_reason_defn]
ADD  CONSTRAINT FK_spr_rha_cancel_reason_defn_spr_cancel_reason_list1_CH
FOREIGN KEY(cancel_list_id)
REFERENCES [SPR_STG].[dbo].[spr_cancel_reason_list] 
    (cancel_reason_list_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_rha_cancel_reason_defn_audt]
ADD  CONSTRAINT FK_spr_rha_cancel_reason_defn_audt_spr_rha_cancel_reason_defn_CH
FOREIGN KEY(cancel_list_id,rha_cancel_code)
REFERENCES [SPR_STG].[dbo].[spr_rha_cancel_reason_defn] 
    (cancel_list_id,rha_cancel_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_rha_defn_audt]
ADD  CONSTRAINT FK_spr_rha_defn_audt_spr_rha_defn_CH
FOREIGN KEY(rha_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_defn] 
    (rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_rha_enct_type_defn]
ADD  CONSTRAINT FK_spr_rha_enct_type_defn_spr_enct_type_defn_CH
FOREIGN KEY(spr_enct_type_code)
REFERENCES [SPR_STG].[dbo].[spr_enct_type_defn] 
    (spr_enct_type_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_rha_enct_type_defn]
ADD  CONSTRAINT FK_spr_rha_enct_type_defn_spr_enct_type_list_CH
FOREIGN KEY(enct_type_list_id)
REFERENCES [SPR_STG].[dbo].[spr_enct_type_list] 
    (enct_type_list_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_rha_enct_type_defn_audt]
ADD  CONSTRAINT FK_spr_rha_enct_type_defn_audt_spr_rha_enct_type_defn_CH
FOREIGN KEY(enct_type_list_id,rha_enct_type_code)
REFERENCES [SPR_STG].[dbo].[spr_rha_enct_type_defn] 
    (enct_type_list_id,rha_enct_type_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_rha_postpone_reason_defn]
ADD  CONSTRAINT FK_spr_rha_postpone_reason_defn_spr_postpone_reason_defn_CH
FOREIGN KEY(spr_postpone_code)
REFERENCES [SPR_STG].[dbo].[spr_postpone_reason_defn] 
    (spr_postpone_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_rha_postpone_reason_defn]
ADD  CONSTRAINT FK_spr_rha_postpone_reason_defn_spr_postpone_reason_list_CH
FOREIGN KEY(postpone_list_id)
REFERENCES [SPR_STG].[dbo].[spr_postpone_reason_list] 
    (postpone_reason_list_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_rha_postpone_reason_defn_audt]
ADD  CONSTRAINT FK_spr_rha_postpone_reason_defn_audt_spr_rha_postpone_reason_defn_CH
FOREIGN KEY(postpone_list_id,rha_postpone_code)
REFERENCES [SPR_STG].[dbo].[spr_rha_postpone_reason_defn] 
    (postpone_list_id,rha_postpone_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_rha_proc]
ADD  CONSTRAINT FK_spr_rha_proc_spr_proc_defn_CH
FOREIGN KEY(spr_proc_id)
REFERENCES [SPR_STG].[dbo].[spr_proc_defn] 
    (spr_proc_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_rha_proc]
ADD  CONSTRAINT FK_spr_rha_proc_spr_proc_list_CH
FOREIGN KEY(proc_list_id)
REFERENCES [SPR_STG].[dbo].[spr_proc_list] 
    (proc_list_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_rha_proc_audt]
ADD  CONSTRAINT FK_spr_rha_proc_audt_spr_rha_proc_CH
FOREIGN KEY(proc_xref_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_proc] 
    (proc_xref_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_sex_audt]
ADD  CONSTRAINT FK_spr_sex_audt_spr_sex_CH
FOREIGN KEY(sex_id)
REFERENCES [SPR_STG].[dbo].[spr_sex] 
    (sex_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_side_audt]
ADD  CONSTRAINT FK_spr_side_audt_spr_side_CH
FOREIGN KEY(side_id)
REFERENCES [SPR_STG].[dbo].[spr_side] 
    (side_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_spec_defn_audt]
ADD  CONSTRAINT FK_spr_spec_defn_audt_spr_spec_defn_CH
FOREIGN KEY(md_spec_id)
REFERENCES [SPR_STG].[dbo].[spr_spec_defn] 
    (md_spec_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_spec_postal_code_audt]
ADD  CONSTRAINT FK_spr_spec_postal_code_audt_spr_spec_postal_code_CH
FOREIGN KEY(postal_code)
REFERENCES [SPR_STG].[dbo].[spr_spec_postal_code] 
    (postal_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_iact_defn_CH
FOREIGN KEY(spr_surg_iatv_xpln_id)
REFERENCES [SPR_STG].[dbo].[spr_iact_defn] 
    (spr_iact_type_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_pat_unvl_defn_CH
FOREIGN KEY(pat_unvl_xpln_id_perd_1)
REFERENCES [SPR_STG].[dbo].[spr_pat_unvl_defn] 
    (spr_pat_unvl_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_pat_unvl_defn1_CH
FOREIGN KEY(pat_unvl_xpln_id_perd_2)
REFERENCES [SPR_STG].[dbo].[spr_pat_unvl_defn] 
    (spr_pat_unvl_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_pat_unvl_defn2_CH
FOREIGN KEY(pat_unvl_xpln_id_perd_3)
REFERENCES [SPR_STG].[dbo].[spr_pat_unvl_defn] 
    (spr_pat_unvl_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_rha_cancel_reason_defn_CH
FOREIGN KEY(cancel_list_id,cancel_reason_code)
REFERENCES [SPR_STG].[dbo].[spr_rha_cancel_reason_defn] 
    (cancel_list_id,rha_cancel_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_pat_eval_CH
FOREIGN KEY(pat_eval_id)
REFERENCES [SPR_STG].[dbo].[spr_pat_eval] 
    (pat_eval_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_rha_enct_type_defn_CH
FOREIGN KEY(enct_type_list_id,enct_type_code)
REFERENCES [SPR_STG].[dbo].[spr_rha_enct_type_defn] 
    (enct_type_list_id,rha_enct_type_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_rha_postpone_reason_defn_CH
FOREIGN KEY(postpone_list_id,postpone_reason_code)
REFERENCES [SPR_STG].[dbo].[spr_rha_postpone_reason_defn] 
    (postpone_list_id,rha_postpone_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_rha_proc_CH
FOREIGN KEY(proc_list_id,prim_proc_code)
REFERENCES [SPR_STG].[dbo].[spr_rha_proc] 
    (proc_list_id,rha_proc_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_rha_proc1_CH
FOREIGN KEY(proc_list_id,scnd_proc_code_1)
REFERENCES [SPR_STG].[dbo].[spr_rha_proc] 
    (proc_list_id,rha_proc_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_rha_proc2_CH
FOREIGN KEY(proc_list_id,scnd_proc_code_2)
REFERENCES [SPR_STG].[dbo].[spr_rha_proc] 
    (proc_list_id,rha_proc_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_rha_proc3_CH
FOREIGN KEY(proc_list_id,scnd_proc_code_3)
REFERENCES [SPR_STG].[dbo].[spr_rha_proc] 
    (proc_list_id,rha_proc_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_side_CH
FOREIGN KEY(side)
REFERENCES [SPR_STG].[dbo].[spr_side] 
    (side_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_fac_defn_CH
FOREIGN KEY(fac_id,rha_id)
REFERENCES [SPR_STG].[dbo].[spr_fac_defn] 
    (fac_id,rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_side1_CH
FOREIGN KEY(side_1)
REFERENCES [SPR_STG].[dbo].[spr_side] 
    (side_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_side2_CH
FOREIGN KEY(side_2)
REFERENCES [SPR_STG].[dbo].[spr_side] 
    (side_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_pat_rha_CH
FOREIGN KEY(spr_pat_id,rha_id)
REFERENCES [SPR_STG].[dbo].[spr_pat] 
    (spr_pat_id,rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_side3_CH
FOREIGN KEY(side_3)
REFERENCES [SPR_STG].[dbo].[spr_side] 
    (side_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case]
ADD  CONSTRAINT FK_spr_surg_case_spr_surg_stat_defn_CH
FOREIGN KEY(spr_surg_stat_id)
REFERENCES [SPR_STG].[dbo].[spr_surg_stat_defn] 
    (spr_surg_stat_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case_audt]
ADD  CONSTRAINT FK_spr_surg_case_audt_spr_surg_case_CH
FOREIGN KEY(surg_case_id)
REFERENCES [SPR_STG].[dbo].[spr_surg_case] 
    (surg_case_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case_err]
ADD  CONSTRAINT FK_spr_surg_case_err_spr_surg_case_CH
FOREIGN KEY(surg_case_id)
REFERENCES [SPR_STG].[dbo].[spr_surg_case] 
    (surg_case_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_case_err_audt]
ADD  CONSTRAINT FK_spr_surg_case_err_audt_spr_surg_case_err_CH
FOREIGN KEY(surg_case_id,err_id,err_fld_name)
REFERENCES [SPR_STG].[dbo].[spr_surg_case_err] 
    (surg_case_id,err_id,err_fld_name)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op]
ADD  CONSTRAINT FK_spr_surg_post_op_spr_rha_proc_CH
FOREIGN KEY(proc_list_id,prim_proc_code)
REFERENCES [SPR_STG].[dbo].[spr_rha_proc] 
    (proc_list_id,rha_proc_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op]
ADD  CONSTRAINT FK_spr_surg_post_op_spr_rha_proc1_CH
FOREIGN KEY(proc_list_id,scnd_proc_code_1)
REFERENCES [SPR_STG].[dbo].[spr_rha_proc] 
    (proc_list_id,rha_proc_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op]
ADD  CONSTRAINT FK_spr_surg_post_op_spr_rha_proc2_CH
FOREIGN KEY(proc_list_id,scnd_proc_code_2)
REFERENCES [SPR_STG].[dbo].[spr_rha_proc] 
    (proc_list_id,rha_proc_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op]
ADD  CONSTRAINT FK_spr_surg_post_op_spr_rha_proc3_CH
FOREIGN KEY(proc_list_id,scnd_proc_code_3)
REFERENCES [SPR_STG].[dbo].[spr_rha_proc] 
    (proc_list_id,rha_proc_code)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op]
ADD  CONSTRAINT FK_spr_surg_post_op_spr_side_CH
FOREIGN KEY(side)
REFERENCES [SPR_STG].[dbo].[spr_side] 
    (side_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op]
ADD  CONSTRAINT FK_spr_surg_post_op_spr_side1_CH
FOREIGN KEY(side_1)
REFERENCES [SPR_STG].[dbo].[spr_side] 
    (side_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op]
ADD  CONSTRAINT FK_spr_surg_post_op_spr_side2_CH
FOREIGN KEY(side_2)
REFERENCES [SPR_STG].[dbo].[spr_side] 
    (side_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op]
ADD  CONSTRAINT FK_spr_surg_post_op_spr_side3_CH
FOREIGN KEY(side_3)
REFERENCES [SPR_STG].[dbo].[spr_side] 
    (side_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op]
ADD  CONSTRAINT FK_spr_surg_post_op_spr_surg_case_CH
FOREIGN KEY(surg_case_id)
REFERENCES [SPR_STG].[dbo].[spr_surg_case] 
    (surg_case_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op]
ADD  CONSTRAINT FK_spr_surg_post_op_spr_fac_defn_CH
FOREIGN KEY(fac_id,rha_id)
REFERENCES [SPR_STG].[dbo].[spr_fac_defn] 
    (fac_id,rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op]
ADD  CONSTRAINT FK_spr_surg_post_op_spr_pat_rha_CH
FOREIGN KEY(spr_pat_id,rha_id)
REFERENCES [SPR_STG].[dbo].[spr_pat] 
    (spr_pat_id,rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op_audt]
ADD  CONSTRAINT FK_spr_surg_post_op_audt_spr_surg_post_op_CH
FOREIGN KEY(surg_post_op_id)
REFERENCES [SPR_STG].[dbo].[spr_surg_post_op] 
    (surg_post_op_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op_err]
ADD  CONSTRAINT FK_spr_surg_post_op_err_spr_surg_post_op_CH
FOREIGN KEY(surg_post_op_id)
REFERENCES [SPR_STG].[dbo].[spr_surg_post_op] 
    (surg_post_op_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_post_op_err_audt]
ADD  CONSTRAINT FK_spr_surg_post_op_err_audt_spr_surg_post_op_err_CH
FOREIGN KEY(surg_post_op_id,err_id,err_fld_name)
REFERENCES [SPR_STG].[dbo].[spr_surg_post_op_err] 
    (surg_post_op_id,err_id,err_fld_name)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_serv_defn_audt]
ADD  CONSTRAINT FK_spr_surg_serv_defn_audt_spr_surg_serv_defn_CH
FOREIGN KEY(spr_surg_serv_id)
REFERENCES [SPR_STG].[dbo].[spr_surg_serv_defn] 
    (spr_surg_serv_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_surg_stat_defn_audt]
ADD  CONSTRAINT FK_spr_surg_stat_defn_audt_spr_surg_stat_defn_CH
FOREIGN KEY(spr_surg_stat_id)
REFERENCES [SPR_STG].[dbo].[spr_surg_stat_defn] 
    (spr_surg_stat_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_wait_list_cat_defn_audt]
ADD  CONSTRAINT FK_spr_wait_list_cat_defn_audt_spr_wait_list_cat_defn_CH
FOREIGN KEY(spr_wait_list_cat_id)
REFERENCES [SPR_STG].[dbo].[spr_wait_list_cat_defn] 
    (spr_wait_list_cat_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_data_dict_audt]
ADD  CONSTRAINT FK_spr_xsys_data_dict_audt_spr_xsys_data_dict_CH
FOREIGN KEY(tble_name,col_name)
REFERENCES [SPR_STG].[dbo].[spr_xsys_data_dict] 
    (tble_name,col_name)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_err_defn_audt]
ADD  CONSTRAINT FK_spr_xsys_err_defn_audt_spr_xsys_err_defn_CH
FOREIGN KEY(err_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_err_defn] 
    (err_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_err_grp_xref]
ADD  CONSTRAINT FK_spr_xsys_err_grp_xref_spr_xsys_err_defn_CH
FOREIGN KEY(err_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_err_defn] 
    (err_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_err_grp_xref]
ADD  CONSTRAINT FK_spr_xsys_err_grp_xref_spr_xsys_grp_defn_CH
FOREIGN KEY(grp_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_grp_defn] 
    (grp_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_err_grp_xref_audt]
ADD  CONSTRAINT FK_spr_xsys_err_grp_xref_audt_spr_xsys_err_grp_xref_CH
FOREIGN KEY(err_id,grp_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_err_grp_xref] 
    (err_id,grp_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_grp_defn_audt]
ADD  CONSTRAINT FK_spr_xsys_grp_defn_audt_spr_xsys_grp_defn_CH
FOREIGN KEY(grp_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_grp_defn] 
    (grp_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_rpt_cat_defn_audt]
ADD  CONSTRAINT FK_spr_xsys_rpt_cat_defn_audt_spr_xsys_rpt_cat_defn_CH
FOREIGN KEY(rpt_cat_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_rpt_cat_defn] 
    (rpt_cat_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_rpt_defn]
ADD  CONSTRAINT FK_spr_xsys_rpt_defn_spr_xsys_rpt_cat_defn_CH
FOREIGN KEY(rpt_cat_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_rpt_cat_defn] 
    (rpt_cat_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_rpt_defn_audt]
ADD  CONSTRAINT FK_spr_xsys_rpt_defn_audt_spr_xsys_rpt_defn_CH
FOREIGN KEY(rpt_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_rpt_defn] 
    (rpt_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_rpt_grp_xref]
ADD  CONSTRAINT FK_spr_xsys_rpt_grp_xref_spr_xsys_grp_defn_CH
FOREIGN KEY(grp_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_grp_defn] 
    (grp_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_rpt_grp_xref]
ADD  CONSTRAINT FK_spr_xsys_rpt_grp_xref_spr_xsys_rpt_defn_CH
FOREIGN KEY(rpt_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_rpt_defn] 
    (rpt_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_rpt_grp_xref_audt]
ADD  CONSTRAINT FK_spr_xsys_rpt_grp_xref_audt_spr_xsys_rpt_grp_xref_CH
FOREIGN KEY(grp_id,rpt_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_rpt_grp_xref] 
    (grp_id,rpt_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_user_audt]
ADD  CONSTRAINT FK_spr_xsys_user_audt_spr_xsys_user_CH
FOREIGN KEY(user_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_user] 
    (user_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_user_grp_xref]
ADD  CONSTRAINT FK_spr_xsys_user_grp_xref_spr_xsys_grp_defn_CH
FOREIGN KEY(grp_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_grp_defn] 
    (grp_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_user_grp_xref]
ADD  CONSTRAINT FK_spr_xsys_user_grp_xref_spr_xsys_user_CH
FOREIGN KEY(user_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_user] 
    (user_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_user_grp_xref_audt]
ADD  CONSTRAINT FK_spr_xsys_user_grp_xref_audt_spr_xsys_user_grp_xref_CH
FOREIGN KEY(grp_id,user_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_user_grp_xref] 
    (grp_id,user_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_user_rha_xref]
ADD  CONSTRAINT FK_spr_xsys_user_rha_xref_spr_rha_defn_CH
FOREIGN KEY(rha_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_defn] 
    (rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_user_rha_xref]
ADD  CONSTRAINT FK_spr_xsys_user_rha_xref_spr_xsys_user_CH
FOREIGN KEY(user_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_user] 
    (user_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_user_rha_xref_audt]
ADD  CONSTRAINT FK_spr_xsys_user_rha_xref_audt_spr_xsys_user_rha_xref_CH
FOREIGN KEY(user_id,rha_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_user_rha_xref] 
    (user_id,rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_user_srgn_xref]
ADD  CONSTRAINT FK_spr_xsys_user_srgn_xref_spr_rha_defn_CH
FOREIGN KEY(rha_id)
REFERENCES [SPR_STG].[dbo].[spr_rha_defn] 
    (rha_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_user_srgn_xref]
ADD  CONSTRAINT FK_spr_xsys_user_srgn_xref_spr_xsys_user_CH
FOREIGN KEY(user_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_user] 
    (user_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_user_srgn_xref_audt]
ADD  CONSTRAINT FK_spr_xsys_user_srgn_xref_audt_spr_xsys_user_srgn_xref_CH
FOREIGN KEY(user_id,spr_md_id,rha_id,provider_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_user_srgn_xref] 
    (user_id,spr_md_id,rha_id,provider_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_web_page_grp_xref]
ADD  CONSTRAINT FK_spr_xsys_web_page_grp_xref_spr_xsys_grp_defn_CH
FOREIGN KEY(grp_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_grp_defn] 
    (grp_id)
 
ALTER TABLE [SPR_STG].[dbo].[spr_xsys_web_page_grp_xref_audt]
ADD  CONSTRAINT FK_spr_xsys_web_page_grp_xref_audt_spr_xsys_web_page_grp_xref_CH
FOREIGN KEY(page_url,grp_id)
REFERENCES [SPR_STG].[dbo].[spr_xsys_web_page_grp_xref] 
    (page_url,grp_id)
 
/***********************************************************************************
 
          Creating all the triggers which are on the scrambled tables
 
************************************************************************************/
/*******************************************************  
  
                  Trigger: spr_md_access_log_insert
  
*******************************************************/
-- =============================================
-- Author:		Simon Cheng
-- Create date: Apr 4, 2006
-- Description:	Insert access log
-- =============================================
CREATE TRIGGER [dbo].[spr_md_access_log_insert]
   ON  [dbo].[spr_md]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[action]
			   ,[action_location]
				, action_parameters )
	SELECT	dbo.GetUserHAID(),
			'Create',
			'Surgeon Table',
			'HA = ' + b.rha_desc + ', ' +
			'College Id = ' + CAST( spr_md_id AS VARCHAR(15) )
	FROM	inserted		a
	JOIN	spr_rha_defn	b	ON a.rha_id = b.rha_id
	
END
go
   
/*******************************************************  
  
                  Trigger: spr_md_audt_delete
  
*******************************************************/
CREATE TRIGGER [dbo].[spr_md_audt_delete] 
	ON [dbo].[spr_md]
	FOR DELETE 
AS 
BEGIN
	SET NOCOUNT ON;

	INSERT INTO spr_md_audt
	SELECT *, getDate(), 2, SYSTEM_USER 
	FROM deleted

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[action]
			   ,[action_location]
				, action_parameters )
	SELECT	dbo.GetUserHAID(),
			'Delete',
			'Surgeon Table',
			'HA = ' + b.rha_desc + ', ' +
			'College Id = ' + CAST( spr_md_id AS VARCHAR(15) )
	FROM	deleted		a
	JOIN	spr_rha_defn	b	ON a.rha_id = b.rha_id
	
END
go
   
/*******************************************************  
  
                  Trigger: spr_md_audt_update
  
*******************************************************/
CREATE TRIGGER [dbo].[spr_md_audt_update] 
	ON [dbo].[spr_md]
	FOR UPDATE 
AS 
BEGIN
	SET NOCOUNT ON;

	UPDATE spr_md
	SET row_eff_date = getDate(), 
		row_eff_user_id = SYSTEM_USER 
	FROM spr_md, deleted 
	WHERE spr_md.IDENTITYCOL = deleted.IDENTITYCOL 

	INSERT INTO spr_md_audt
	SELECT *, getDate(), 1, SYSTEM_USER 
	FROM deleted 

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[action]
			   ,[action_location]
				, action_parameters )
	SELECT	dbo.GetUserHAID(),
			'Update',
			'Surgeon Table',
			'HA = ' + b.rha_desc + ', ' +
			'College Id = ' + CAST( spr_md_id AS VARCHAR(15) )
	FROM	inserted		a
	JOIN	spr_rha_defn	b	ON a.rha_id = b.rha_id
	
END
go
   
/*******************************************************  
  
                  Trigger: spr_md_ref_audt_update
  
*******************************************************/

CREATE TRIGGER [dbo].[spr_md_ref_audt_update] 
	ON [dbo].[spr_md_ref]
	FOR UPDATE 
AS 
BEGIN
	SET NOCOUNT ON;

	UPDATE spr_md_ref
	SET row_eff_date = getDate(), 
		row_eff_user_id = SYSTEM_USER 
	FROM spr_md_ref, deleted 
	WHERE spr_md_ref.IDENTITYCOL = deleted.IDENTITYCOL 

	INSERT INTO spr_md_ref_audt
	SELECT *, getDate(), 1, SYSTEM_USER 
	FROM deleted 

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[action]
			   ,[action_location]
				, action_parameters )
	SELECT	dbo.GetUserHAID(),
			'Update',
			'Referring Physician Table',
			'HA = ' + b.rha_desc + ', ' +
			'College Id = ' + CAST( ref_md_id AS VARCHAR(15) )
	FROM	inserted		a
	JOIN	spr_rha_defn	b	ON a.rha_id = b.rha_id
	
END

go
   
/*******************************************************  
  
                  Trigger: spr_md_ref_access_log_insert
  
*******************************************************/
-- =============================================
-- Author:		Simon Cheng
-- Create date: Apr 4, 2006
-- Description:	Insert access log
-- =============================================
CREATE TRIGGER [dbo].[spr_md_ref_access_log_insert]
   ON  [dbo].[spr_md_ref]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[action]
			   ,[action_location]
				, action_parameters )
	SELECT	dbo.GetUserHAID(),
			'Create',
			'Referring Physician Table',
			'HA = ' + b.rha_desc + ', ' +
			'College Id = ' + CAST( ref_md_id AS VARCHAR(15) )
	FROM	inserted		a
	JOIN	spr_rha_defn	b	ON a.rha_id = b.rha_id
	
END


go
   
/*******************************************************  
  
                  Trigger: spr_md_ref_audt_delete
  
*******************************************************/

CREATE TRIGGER [dbo].[spr_md_ref_audt_delete] 
	ON [dbo].[spr_md_ref]
	FOR DELETE 
AS 
BEGIN
	SET NOCOUNT ON;

	INSERT INTO spr_md_ref_audt
	SELECT *, getDate(), 2, SYSTEM_USER 
	FROM deleted

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[action]
			   ,[action_location]
				, action_parameters )
	SELECT	dbo.GetUserHAID(),
			'Delete',
			'Referring Physician Table',
			'HA = ' + b.rha_desc + ', ' +
			'College Id = ' + CAST( ref_md_id AS VARCHAR(15) )
	FROM	deleted		a
	JOIN	spr_rha_defn	b	ON a.rha_id = b.rha_id
	
END
go
   
/*******************************************************  
  
                  Trigger: spr_pat_access_log_insert
  
*******************************************************/
-- =============================================
-- Author:		Simon Cheng
-- Create date: Apr 4, 2006
-- Description:	Insert access log
-- =============================================
CREATE TRIGGER [dbo].[spr_pat_access_log_insert]
   ON  [dbo].[spr_pat] 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[patient_phn]
			   ,[patient_rha]
			   ,[action]
			   ,[action_location] )
	SELECT	dbo.GetUserHAID(),
			spr_pat_id,
			rha_id,
			'Create',
			'Patient Registration Form'
	FROM	inserted
	
END
go
   
/*******************************************************  
  
                  Trigger: spr_pat_audt_delete
  
*******************************************************/
CREATE TRIGGER [dbo].[spr_pat_audt_delete] 
	ON [dbo].[spr_pat]
	FOR DELETE 
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO spr_pat_audt
	SELECT *, getDate(), 2, SYSTEM_USER 
	FROM deleted

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[patient_phn]
			   ,[patient_rha]
			   ,[action]
			   ,[action_location] )
	SELECT	dbo.GetUserHAID(),
			spr_pat_id,
			rha_id,
			'Delete',
			'Patient Registration Form'
	FROM	deleted
END
go
   
/*******************************************************  
  
                  Trigger: spr_pat_audt_update
  
*******************************************************/
CREATE TRIGGER [dbo].[spr_pat_audt_update] 
	ON [dbo].[spr_pat]
	FOR UPDATE 
AS 
BEGIN
	SET NOCOUNT ON;

	UPDATE spr_pat
	SET	row_eff_date = getDate(), 
		row_eff_user_id = SYSTEM_USER 
	FROM spr_pat, deleted 
	WHERE spr_pat.IDENTITYCOL = deleted.IDENTITYCOL 

	INSERT INTO spr_pat_audt
	SELECT *, getDate(), 1, SYSTEM_USER 
	FROM deleted

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[patient_phn]
			   ,[patient_rha]
			   ,[action]
			   ,[action_location] )
	SELECT	dbo.GetUserHAID(),
			spr_pat_id,
			rha_id,
			'Update',
			'Patient Registration Form'
	FROM	inserted

END
go
   
/*******************************************************  
  
                  Trigger: spr_pat_err_audt_delete
  
*******************************************************/
CREATE TRIGGER [dbo].[spr_pat_err_audt_delete] 
	ON [dbo].[spr_pat_err]
	FOR DELETE 
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO spr_pat_err_audt
	SELECT *, getDate(), 2, SYSTEM_USER 
	FROM deleted

END
go
   
/*******************************************************  
  
                  Trigger: spr_pat_eval_access_log_insert
  
*******************************************************/
-- =============================================
-- Author:		Simon Cheng
-- Create date: Apr 4, 2006
-- Description:	Insert access log
-- =============================================
CREATE TRIGGER [dbo].[spr_pat_eval_access_log_insert]
   ON  dbo.spr_pat_eval
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[spr_xsys_access_log]
			   ([rha_id]
			   ,[patient_phn]
			   ,[action]
			   ,[action_location]
				, action_parameters )
	SELECT	rha_id,
			spr_pat_id,
			'Create',
			'Assessment Tool Form',
			'Assessment Id = ' + CAST( pat_eval_id AS VARCHAR(15) )
	FROM	inserted
	
END
go
   
/*******************************************************  
  
                  Trigger: spr_pat_eval_audt_delete
  
*******************************************************/
CREATE TRIGGER [dbo].[spr_pat_eval_audt_delete] 
	ON [dbo].[spr_pat_eval]
	FOR DELETE 
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO spr_pat_eval_audt
	SELECT *, getDate(), 2, SYSTEM_USER 
	FROM deleted

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[patient_phn]
			   ,[action]
			   ,[action_location]
				, action_parameters )
	SELECT	rha_id,
			spr_pat_id,
			'Delete',
			'Assessment Tool Form',
			'Assessment Id = ' + CAST( pat_eval_id AS VARCHAR(15) )
	FROM	deleted

END

go
   
/*******************************************************  
  
                  Trigger: spr_pat_eval_audt_update
  
*******************************************************/
CREATE TRIGGER [dbo].[spr_pat_eval_audt_update] 
	ON [dbo].[spr_pat_eval]
	FOR UPDATE 
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE spr_pat_eval
	SET	row_eff_date = getDate(), 
		row_eff_user_id = SYSTEM_USER 
	FROM spr_pat_eval, deleted 
	WHERE spr_pat_eval.IDENTITYCOL = deleted.IDENTITYCOL 

	INSERT INTO spr_pat_eval_audt
	SELECT *, getDate(), 1, SYSTEM_USER 
	FROM deleted 

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[patient_phn]
			   ,[action]
			   ,[action_location]
				, action_parameters )
	SELECT	rha_id,
			spr_pat_id,
			'Update',
			'Assessment Tool Form',
			'Assessment Id = ' + CAST( pat_eval_id AS VARCHAR(15) )
	FROM	inserted

END

go
   
/*******************************************************  
  
                  Trigger: spr_pat_eval_err_audt_delete
  
*******************************************************/
CREATE TRIGGER [dbo].[spr_pat_eval_err_audt_delete] 
	ON [dbo].[spr_pat_eval_err]
	FOR DELETE 
AS 
BEGIN
	SET NOCOUNT ON;

	INSERT INTO spr_pat_eval_err_audt
	SELECT *, getDate(), 2, SYSTEM_USER 
	FROM deleted

END
go
   
/*******************************************************  
  
                  Trigger: spr_surg_case_access_log_insert
  
*******************************************************/
-- =============================================
-- Author:		Simon Cheng
-- Create date: Apr 4, 2006
-- Description:	Insert access log
-- =============================================
CREATE TRIGGER [dbo].[spr_surg_case_access_log_insert]
   ON  [dbo].[spr_surg_case]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO spr_xsys_access_log
           ([rha_id]
           ,[fac_id]
           ,[patient_phn]
           ,[patient_rha]
           ,[patient_fac_id]
           ,[action]
           ,[action_location]
           ,[action_parameters])
    SELECT
           dbo.GetUserHAID()
           ,fac_id
           ,spr_pat_id
           ,rha_id
           ,fac_id
           ,'Create'
           ,'Booking Record'
           ,'Booking Id = ' + CAST(surg_case_id as varchar(15) )
	FROM	inserted
END
go
   
/*******************************************************  
  
                  Trigger: spr_surg_case_audt_update
  
*******************************************************/
CREATE TRIGGER [dbo].[spr_surg_case_audt_update] 
	ON [dbo].[spr_surg_case]
	FOR UPDATE 
AS 
BEGIN
	SET NOCOUNT ON;

	UPDATE spr_surg_case
	SET	row_eff_date = getDate(), 
		row_eff_user_id = SYSTEM_USER 
	FROM spr_surg_case, deleted 
	WHERE spr_surg_case.IDENTITYCOL = deleted.IDENTITYCOL 

	INSERT INTO spr_surg_case_audt
	SELECT *, getDate(), 1, SYSTEM_USER 
	FROM deleted 

	INSERT INTO spr_xsys_access_log
           ([rha_id]
           ,[fac_id]
           ,[patient_phn]
           ,[patient_rha]
           ,[patient_fac_id]
           ,[action]
           ,[action_location]
           ,[action_parameters])
    SELECT
           dbo.GetUserHAID()
           ,fac_id
           ,spr_pat_id
           ,rha_id
           ,fac_id
           ,'Update'
           ,'Booking Record'
           ,'Booking Id = ' + CAST(surg_case_id as varchar(15) )
	FROM	inserted

END
go
   
/*******************************************************  
  
                  Trigger: spr_surg_case_audt_delete
  
*******************************************************/
CREATE TRIGGER [dbo].[spr_surg_case_audt_delete] 
	ON [dbo].[spr_surg_case]
	FOR DELETE 
AS 
BEGIN
	SET NOCOUNT ON;

	INSERT INTO spr_surg_case_audt
	SELECT *, getDate(), 2, SYSTEM_USER 
	FROM deleted

	INSERT INTO spr_xsys_access_log
           ([rha_id]
           ,[fac_id]
           ,[patient_phn]
           ,[patient_rha]
           ,[patient_fac_id]
           ,[action]
           ,[action_location]
           ,[action_parameters])
    SELECT
           dbo.GetUserHAID()
           ,fac_id
           ,spr_pat_id
           ,rha_id
           ,fac_id
           ,'Delete'
           ,'Booking Record'
           ,'Booking Id = ' + CAST(surg_case_id as varchar(15) )
	FROM	deleted

	UPDATE	spr_pat_eval
	SET		assm_stat_id = 3
           ,[assm_inac_xpln_id] = NULL
           ,[assm_inac_date] = NULL
	FROM	spr_pat_eval,
			deleted
	WHERE	spr_pat_eval.pat_eval_id = deleted.pat_eval_id

END
go
   
/*******************************************************  
  
                  Trigger: spr_surg_case_err_audt_delete
  
*******************************************************/

CREATE TRIGGER [dbo].[spr_surg_case_err_audt_delete] 
	ON [dbo].[spr_surg_case_err]
	FOR DELETE 
AS 
BEGIN
	SET NOCOUNT ON;

	 INSERT INTO spr_surg_case_err_audt
	 SELECT *, getDate(), 2, SYSTEM_USER 
	 FROM deleted
END
go
   
/*******************************************************  
  
                  Trigger: spr_surg_post_op_audt_update
  
*******************************************************/
CREATE TRIGGER [dbo].[spr_surg_post_op_audt_update] 
	ON [dbo].[spr_surg_post_op]
	FOR UPDATE 
AS 
BEGIN
	SET NOCOUNT ON;

	UPDATE spr_surg_post_op
	SET	row_eff_date = getDate(), 
		row_eff_user_id = SYSTEM_USER 
	FROM spr_surg_post_op, deleted 
	WHERE spr_surg_post_op.IDENTITYCOL = deleted.IDENTITYCOL 

	INSERT INTO spr_surg_post_op_audt
	SELECT *, getDate(), 1, SYSTEM_USER 
	FROM deleted 

	INSERT INTO spr_xsys_access_log
           ([rha_id]
           ,[fac_id]
           ,[patient_phn]
           ,[patient_rha]
           ,[patient_fac_id]
           ,[action]
           ,[action_location]
           ,[action_parameters])
    SELECT
           dbo.GetUserHAID()
           ,fac_id
           ,spr_pat_id
           ,rha_id
           ,fac_id
           ,'Update'
           ,'Post Surgery Form'
           ,'Surgery Id = ' + CAST(surg_post_op_id as varchar(15) )
	FROM	inserted
END
go
   
/*******************************************************  
  
                  Trigger: spr_surg_post_op_audt_delete
  
*******************************************************/
CREATE TRIGGER [dbo].[spr_surg_post_op_audt_delete] 
	ON [dbo].[spr_surg_post_op]
	FOR DELETE 
AS 
BEGIN
	SET NOCOUNT ON;

	INSERT INTO spr_surg_post_op_audt
	SELECT *, getDate(), 2, SYSTEM_USER 
	FROM deleted

	INSERT INTO spr_xsys_access_log
           ([rha_id]
           ,[fac_id]
           ,[patient_phn]
           ,[patient_rha]
           ,[patient_fac_id]
           ,[action]
           ,[action_location]
           ,[action_parameters])
    SELECT
           dbo.GetUserHAID()
           ,fac_id
           ,spr_pat_id
           ,rha_id
           ,fac_id
           ,'Delete'
           ,'Post Surgery Form'
           ,'Surgery Id = ' + CAST(surg_post_op_id as varchar(15) )
	FROM	deleted
END
go
   
/*******************************************************  
  
                  Trigger: spr_surg_post_op_access_log_insert
  
*******************************************************/
-- =============================================
-- Author:		Simon Cheng
-- Create date: Apr 4, 2006
-- Description:	Insert access log
-- =============================================
CREATE TRIGGER [dbo].[spr_surg_post_op_access_log_insert]
   ON  [dbo].[spr_surg_post_op]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO spr_xsys_access_log
           ([rha_id]
           ,[fac_id]
           ,[patient_phn]
           ,[patient_rha]
           ,[patient_fac_id]
           ,[action]
           ,[action_location]
           ,[action_parameters])
    SELECT
           dbo.GetUserHAID()
           ,fac_id
           ,spr_pat_id
           ,rha_id
           ,fac_id
           ,'Create'
           ,'Post Surgery Form'
           ,'Surgery Id = ' + CAST(surg_post_op_id as varchar(15) )
	FROM	inserted
END
go
   
/*******************************************************  
  
                  Trigger: spr_surg_post_op_err_audt_delete
  
*******************************************************/

CREATE TRIGGER [dbo].[spr_surg_post_op_err_audt_delete] 
	ON [dbo].[spr_surg_post_op_err]
	FOR DELETE 
AS 
BEGIN
	SET NOCOUNT ON;

	INSERT INTO spr_surg_post_op_err_audt
	SELECT *, getDate(), 2, SYSTEM_USER 
	FROM deleted

END
go
   
/*******************************************************  
  
                  Trigger: spr_xsys_user_srgn_xref_audt_update
  
*******************************************************/

CREATE TRIGGER [dbo].[spr_xsys_user_srgn_xref_audt_update] 
	ON [dbo].[spr_xsys_user_srgn_xref]
	FOR UPDATE 
AS 
BEGIN 
	SET NOCOUNT ON;

	UPDATE spr_xsys_user_srgn_xref
	SET	row_eff_date = getDate(), 
 		row_eff_user_id = SYSTEM_USER 
	FROM spr_xsys_user_srgn_xref, deleted 
	WHERE spr_xsys_user_srgn_xref.IDENTITYCOL = deleted.IDENTITYCOL 

	INSERT INTO spr_xsys_user_srgn_xref_audt
	SELECT *, getDate(), 1, SYSTEM_USER 
	FROM deleted

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[action]
			   ,[action_location]
				, action_parameters )
	SELECT	dbo.GetUserHAID(),
			'Update',
			'Surgeon Access Table',
			'Surgeon''s College Id = ' + CAST( spr_md_id AS VARCHAR(15) ) + ', ' +
			'User Id = ' + [user_id]
	FROM	inserted
	
END

go
   
/*******************************************************  
  
                  Trigger: spr_xsys_user_srgn_xref_audt_delete
  
*******************************************************/

CREATE TRIGGER [dbo].[spr_xsys_user_srgn_xref_audt_delete] 
	ON [dbo].[spr_xsys_user_srgn_xref]
	FOR DELETE 
AS 
BEGIN
	SET NOCOUNT ON;

	INSERT INTO spr_xsys_user_srgn_xref_audt
	SELECT *, getDate(), 2, SYSTEM_USER 
	FROM deleted

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[action]
			   ,[action_location]
				, action_parameters )
	SELECT	dbo.GetUserHAID(),
			'Delete',
			'Surgeon Access Table',
			'Surgeon''s College Id = ' + CAST( spr_md_id AS VARCHAR(15) ) + ', ' +
			'User Id = ' + [user_id]
	FROM	deleted
	
END
go
   
/*******************************************************  
  
                  Trigger: spr_xsys_user_srgn_xref_access_log_insert
  
*******************************************************/
-- =============================================
-- Author:		Simon Cheng
-- Create date: Apr 4, 2006
-- Description:	Insert access log
-- =============================================
CREATE TRIGGER [dbo].[spr_xsys_user_srgn_xref_access_log_insert]
   ON  [dbo].[spr_xsys_user_srgn_xref]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO spr_xsys_access_log
			   ([rha_id]
			   ,[action]
			   ,[action_location]
				, action_parameters )
	SELECT	dbo.GetUserHAID(),
			'Create',
			'Surgeon Access Table',
			'Surgeon''s College Id = ' + CAST( spr_md_id AS VARCHAR(15) ) + ', ' +
			'User Id = ' + [user_id]
	FROM	inserted
	
END


go
   
