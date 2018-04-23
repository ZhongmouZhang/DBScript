if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].hsp_Job_CreateIndexUpdateAColumn') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].hsp_Job_CreateIndexUpdateAColumn

go


CREATE         proc dbo.hsp_Job_CreateIndexUpdateAColumn 
as

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_md_quik_info]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  md_quik_info add CONSTRAINT [PK_md_quik_info] PRIMARY KEY CLUSTERED 
(
	[md_no] ASC
) 
END




---------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_bp_ha_file_process_log]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_bp_rha_file_process_log] add CONSTRAINT [PK_spr_bp_ha_file_process_log] PRIMARY KEY CLUSTERED 
(
	[file_id] ASC
)
END




---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_xsys_info]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_xsys_info] add  CONSTRAINT [PK_spr_xsys_info] PRIMARY KEY CLUSTERED 
(
	[fld_name] ASC
)
END



---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_cancel_reason_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_cancel_reason_defn] add  CONSTRAINT [PK_spr_cancel_reason_defn] PRIMARY KEY CLUSTERED 
(
	[spr_cancel_code] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_xsys_user_srgn_xref]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_xsys_user_srgn_xref] add   CONSTRAINT [PK_spr_xsys_user_srgn_xref] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[spr_md_id] ASC,
	[rha_id] ASC,
	[provider_id] ASC
)
END





---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_xsys_user_rha_xref]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_xsys_user_rha_xref] add   CONSTRAINT [PK_spr_xsys_user_rha_xref] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[rha_id] ASC
)
END



---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_bp_feedback_head]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_bp_feedback_head] add CONSTRAINT [PK_spr_bp_feedback_head] PRIMARY KEY CLUSTERED 
(
	[feedback_head_id] ASC
)
END



---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_bp_rha_postsurg_rec_in]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_bp_rha_postsurg_rec_in] add  CONSTRAINT [PK_spr_bp_rha_postsurg_rec_in] PRIMARY KEY CLUSTERED 
(
	[row_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_bp_HA_Book_Rec_In]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_bp_rha_booking_rec_in] add   CONSTRAINT [PK_spr_bp_HA_Book_Rec_In] PRIMARY KEY CLUSTERED 
(
	[row_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_bp_HA_Pat_Rec_In]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_bp_rha_pat_rec_in] add  CONSTRAINT [PK_spr_bp_HA_Pat_Rec_In] PRIMARY KEY CLUSTERED 
(
	[row_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_bp_feedback_detail]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_bp_feedback_detail] add  CONSTRAINT [PK_spr_bp_feedback_detail] PRIMARY KEY CLUSTERED 
(
	[feedback_detail_id] ASC
) 
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_md_1]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_md] add  CONSTRAINT [PK_spr_md_1] PRIMARY KEY CLUSTERED 
(
	[spr_md_id] ASC,
	[rha_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_pat_eval_qstn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_eval_qstn_part] add  CONSTRAINT [PK_spr_pat_eval_qstn] PRIMARY KEY CLUSTERED 
(
	[spr_eval_id] ASC,
	[qstn_id] ASC,
	[qstn_part] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_fac_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_fac_defn] add  CONSTRAINT [PK_spr_fac_defn] PRIMARY KEY CLUSTERED 
(
	[fac_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_pat]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_pat] add  CONSTRAINT [PK_spr_pat] PRIMARY KEY CLUSTERED 
(
	[spr_pat_id] ASC,
	[rha_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_surg_post_op]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_surg_post_op] add  CONSTRAINT [PK_spr_surg_post_op] PRIMARY KEY CLUSTERED 
(
	[surg_post_op_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_enct_type_list]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_enct_type_list] add  CONSTRAINT [PK_spr_enct_type_list] PRIMARY KEY CLUSTERED 
(
	[enct_type_list_id] ASC
) 
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_cancel_reason_list]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_cancel_reason_list] add CONSTRAINT [PK_spr_cancel_reason_list] PRIMARY KEY CLUSTERED 
(
	[cancel_reason_list_id] ASC
) 
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_rha_proc_list_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_proc_list] add CONSTRAINT [PK_spr_rha_proc_list_defn] PRIMARY KEY CLUSTERED 
(
	[proc_list_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_pat_eval]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_pat_eval] add  CONSTRAINT [PK_spr_pat_eval] PRIMARY KEY CLUSTERED 
(
	[pat_eval_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_surg_case]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_surg_case] add  CONSTRAINT [PK_spr_surg_case] PRIMARY KEY CLUSTERED 
(
	[surg_case_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_post_code_rha_xref]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_post_code_rha_xref] add CONSTRAINT [PK_spr_post_code_rha_xref] PRIMARY KEY CLUSTERED 
(
	[post_code] ASC,
	[rha_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_postpone_reason_list]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_postpone_reason_list] add  CONSTRAINT [PK_spr_postpone_reason_list] PRIMARY KEY CLUSTERED 
(
	[postpone_reason_list_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_md_ref]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_md_ref] add CONSTRAINT [PK_spr_md_ref] PRIMARY KEY CLUSTERED 
(
	[rha_id] ASC,
	[ref_md_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_rha_enct_type_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_rha_enct_type_defn] add  CONSTRAINT [PK_spr_rha_enct_type_defn] PRIMARY KEY CLUSTERED 
(
	[enct_type_list_id] ASC,
	[rha_enct_type_code] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_rha_cancel_reason_defn_1]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_rha_cancel_reason_defn] add CONSTRAINT [PK_spr_rha_cancel_reason_defn_1] PRIMARY KEY CLUSTERED 
(
	[cancel_list_id] ASC,
	[rha_cancel_code] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_eval_qstn_choi]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_eval_qstn_choi] add  CONSTRAINT [PK_spr_eval_qstn_choi] PRIMARY KEY CLUSTERED 
(
	[spr_eval_id] ASC,
	[qstn_id] ASC,
	[qstn_part] ASC,
	[choi_no] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_xsys_rpt_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_xsys_rpt_defn] add  CONSTRAINT [PK_spr_xsys_rpt_defn] PRIMARY KEY CLUSTERED 
(
	[rpt_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_rha_proc_1]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_rha_proc] add  CONSTRAINT [PK_spr_rha_proc_1] PRIMARY KEY CLUSTERED 
(
	[proc_list_id] ASC,
	[rha_proc_code] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_eval_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_eval_defn] add  CONSTRAINT [PK_spr_eval_defn] PRIMARY KEY CLUSTERED 
(
	[spr_eval_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_proc]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_proc_defn] add CONSTRAINT [PK_spr_proc] PRIMARY KEY CLUSTERED 
(
	[spr_proc_id] ASC
)
END



---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_xsys_user_grp_xref]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_xsys_user_grp_xref] add  CONSTRAINT [PK_spr_xsys_user_grp_xref] PRIMARY KEY CLUSTERED 
(
	[grp_id] ASC,
	[user_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_eval_qstn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_eval_qstn] add CONSTRAINT [PK_spr_eval_qstn] PRIMARY KEY CLUSTERED 
(
	[spr_eval_id] ASC,
	[qstn_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_rha_postpone_reason_defn_1]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_rha_postpone_reason_defn] add  CONSTRAINT [PK_spr_rha_postpone_reason_defn_1] PRIMARY KEY CLUSTERED 
(
	[postpone_list_id] ASC,
	[rha_postpone_code] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_xsys_err_grp_xref]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_xsys_err_grp_xref] add CONSTRAINT [PK_spr_xsys_err_grp_xref] PRIMARY KEY CLUSTERED 
(
	[err_id] ASC,
	[grp_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_pat_err]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_pat_err] add  CONSTRAINT [PK_spr_pat_err] PRIMARY KEY CLUSTERED 
(
	[err_id] ASC,
	[err_fld_name] ASC,
	[spr_pat_id] ASC,
	[rha_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_xsys_rpt_grp_xref]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_xsys_rpt_grp_xref] add CONSTRAINT [PK_spr_xsys_rpt_grp_xref] PRIMARY KEY CLUSTERED 
(
	[grp_id] ASC,
	[rpt_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_surg_post_op_err]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_surg_post_op_err] add CONSTRAINT [PK_spr_surg_post_op_err] PRIMARY KEY CLUSTERED 
(
	[surg_post_op_id] ASC,
	[err_id] ASC,
	[err_fld_name] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_surg_case_err]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_surg_case_err] add  CONSTRAINT [PK_spr_surg_case_err] PRIMARY KEY CLUSTERED 
(
	[surg_case_id] ASC,
	[err_id] ASC,
	[err_fld_name] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_province]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_province] add  CONSTRAINT [PK_spr_province] PRIMARY KEY CLUSTERED 
(
	[province_code] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_xsys_data_dict]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_xsys_data_dict] add  CONSTRAINT [PK_spr_xsys_data_dict] PRIMARY KEY CLUSTERED 
(
	[tble_name] ASC,
	[col_name] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_pat_id_type]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_pat_alt_id_type] add CONSTRAINT [PK_spr_pat_id_type] PRIMARY KEY CLUSTERED 
(
	[alt_pat_id_type] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_defr_xpln_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_postpone_reason_defn] add CONSTRAINT [PK_spr_defr_xpln_defn] PRIMARY KEY CLUSTERED 
(
	[spr_postpone_code] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_xsys_err_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_xsys_err_defn] add CONSTRAINT [PK_spr_xsys_err_defn] PRIMARY KEY CLUSTERED 
(
	[err_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_pat_eval_err]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_pat_eval_err] add  CONSTRAINT [PK_spr_pat_eval_err] PRIMARY KEY CLUSTERED 
(
	[pat_eval_id] ASC,
	[err_id] ASC,
	[err_fld_name] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_surg_serv_code]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_surg_serv_defn] add CONSTRAINT [PK_spr_surg_serv_code] PRIMARY KEY CLUSTERED 
(
	[spr_surg_serv_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_providers]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_providers] add CONSTRAINT [PK_spr_providers] PRIMARY KEY CLUSTERED 
(
	[provider_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_xsys_user]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_xsys_user] add  CONSTRAINT [PK_spr_xsys_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_surg_stat_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_surg_stat_defn] add CONSTRAINT [PK_spr_surg_stat_defn] PRIMARY KEY CLUSTERED 
(
	[spr_surg_stat_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_iact_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_iact_defn] add CONSTRAINT [PK_spr_iact_defn] PRIMARY KEY CLUSTERED 
(
	[spr_iact_type_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_inac_assm_xpln_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_inac_assm_xpln_defn] add CONSTRAINT [PK_spr_inac_assm_xpln_defn] PRIMARY KEY CLUSTERED 
(
	[spr_defr_xpln_id] ASC
) 
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_pat_eval_answ]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_pat_eval_answ] add CONSTRAINT [PK_spr_pat_eval_answ] PRIMARY KEY CLUSTERED 
(
	[pat_eval_id] ASC,
	[qstn_id] ASC,
	[qstn_part] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_pat_eval_answ_err]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_pat_eval_answ_err] add  CONSTRAINT [PK_spr_pat_eval_answ_err] PRIMARY KEY CLUSTERED 
(
	[pat_eval_id] ASC,
	[qstn_id] ASC,
	[qstn_part] ASC,
	[err_id] ASC,
	[err_fld_name] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_xsys_web_page_grp_xref]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_xsys_web_page_grp_xref] add CONSTRAINT [PK_spr_xsys_web_page_grp_xref] PRIMARY KEY CLUSTERED 
(
	[page_url] ASC,
	[grp_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_sex]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_sex] add CONSTRAINT [PK_spr_sex] PRIMARY KEY CLUSTERED 
(
	[sex_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_pat_unvl_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_pat_unvl_defn] add  CONSTRAINT [PK_spr_pat_unvl_defn] PRIMARY KEY CLUSTERED 
(
	[spr_pat_unvl_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_rha_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_rha_defn] add CONSTRAINT [PK_spr_rha_defn] PRIMARY KEY CLUSTERED 
(
	[rha_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_enct_type_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_enct_type_defn] add CONSTRAINT [PK_spr_enct_type_defn] PRIMARY KEY CLUSTERED 
(
	[spr_enct_type_code] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_side]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_side] add CONSTRAINT [PK_spr_side] PRIMARY KEY CLUSTERED 
(
	[side_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_spec_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_spec_defn] add  CONSTRAINT [PK_spr_spec_defn] PRIMARY KEY CLUSTERED 
(
	[md_spec_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_xsys_rpt_cat_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_xsys_rpt_cat_defn] add CONSTRAINT [PK_spr_xsys_rpt_cat_defn] PRIMARY KEY CLUSTERED 
(
	[rpt_cat_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_xsys_grp_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_xsys_grp_defn] add CONSTRAINT [PK_spr_xsys_grp_defn] PRIMARY KEY CLUSTERED 
(
	[grp_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_spec_postal_code]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_spec_postal_code] add CONSTRAINT [PK_spr_spec_postal_code] PRIMARY KEY CLUSTERED 
(
	[postal_code] ASC
) 
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_assm_stat_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_assm_stat_defn] add  CONSTRAINT [PK_assm_stat_defn] PRIMARY KEY CLUSTERED 
(
	[assm_stat_id] ASC
)
END


---------------------------------------------------------
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PK_spr_wait_list_cat_defn]') AND OBJECTPROPERTY(id, N'IsPrimaryKey') = 1)
BEGIN
alter table  [spr_wait_list_cat_defn] add CONSTRAINT [PK_spr_wait_list_cat_defn] PRIMARY KEY CLUSTERED 
(
	[spr_wait_list_cat_id] ASC
)
END


/*******************************************************************************

	adding non clustered index
	
*******************************************************************************/

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_bp_feedback_head]') AND name = N'_dta_index_spr_bp_feedback_head_K12_K3_K22_K2_K4_K7_K8_21')
CREATE NONCLUSTERED INDEX [_dta_index_spr_bp_feedback_head_K12_K3_K22_K2_K4_K7_K8_21] ON [spr_bp_feedback_head] 
(
	[result_code] ASC,
	[rha_id] ASC,
	[fixed_date] ASC,
	[feedback_record_type] ASC,
	[fac_id] ASC,
	[orb_case_no] ASC,
	[create_date] ASC
) ON [PRIMARY]




IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_bp_feedback_head]') AND name = N'_dta_index_spr_bp_feedback_head_K4_K5_K21_K8_K2_K3_K12_K22')
CREATE NONCLUSTERED INDEX [_dta_index_spr_bp_feedback_head_K4_K5_K21_K8_K2_K3_K12_K22] ON [spr_bp_feedback_head] 
(
	[fac_id] ASC,
	[pat_id] ASC,
	[action_code] ASC,
	[create_date] ASC,
	[feedback_record_type] ASC,
	[rha_id] ASC,
	[result_code] ASC,
	[fixed_date] ASC
) ON [PRIMARY]


IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_bp_feedback_head]') AND name = N'_dta_index_spr_bp_feedback_head_K4_K6_K8_K2_K3_K12_K22_21')
CREATE NONCLUSTERED INDEX [_dta_index_spr_bp_feedback_head_K4_K6_K8_K2_K3_K12_K22_21] ON [spr_bp_feedback_head] 
(
	[action_code] ASC,
	[orb_booking_no] ASC,
	[create_date] ASC,
	[feedback_record_type] ASC,
	[rha_id] ASC,
	[result_code] ASC,
	[fixed_date] ASC
) ON [PRIMARY]


IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_bp_feedback_head]') AND name = N'idx_bp_feedback_head_rec_file_id')
CREATE NONCLUSTERED INDEX [idx_bp_feedback_head_rec_file_id] ON [spr_bp_feedback_head] 
(
	[file_id] ASC
) ON [PRIMARY]



IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_bp_rha_postsurg_rec_in]') AND name = N'idx_bp_postsurg_rec_file_id')
CREATE NONCLUSTERED INDEX [idx_bp_postsurg_rec_file_id] ON [spr_bp_rha_postsurg_rec_in] 
(
	[file_id] ASC
) ON [PRIMARY]



IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_bp_rha_booking_rec_in]') AND name = N'idx_bp_booking_rec_file_id')
CREATE NONCLUSTERED INDEX [idx_bp_booking_rec_file_id] ON [spr_bp_rha_booking_rec_in] 
(
	[file_id] ASC
) ON [PRIMARY]



IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_bp_rha_pat_rec_in]') AND name = N'idx_bp_pat_rec_file_id')
CREATE NONCLUSTERED INDEX [idx_bp_pat_rec_file_id] ON [spr_bp_rha_pat_rec_in] 
(
	[file_id] ASC
) ON [PRIMARY]



IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_post_op]') AND name = N'idx_fac_case_number')
CREATE NONCLUSTERED INDEX [idx_fac_case_number] ON [spr_surg_post_op] 
(
	[fac_id] ASC,
	[rha_case_no] ASC
) ON [PRIMARY]


IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_post_op]') AND name = N'idx_post_booking_id')
CREATE NONCLUSTERED INDEX [idx_post_booking_id] ON [spr_surg_post_op] 
(
	[surg_case_id] ASC
) ON [PRIMARY]


IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_post_op]') AND name = N'idx_post_cmpl_date')
CREATE NONCLUSTERED INDEX [idx_post_cmpl_date] ON [spr_surg_post_op] 
(
	[surg_cmpl_date] ASC,
	[rha_id] ASC
) ON [PRIMARY]


IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_post_op]') AND name = N'IX_spr_surg_post_op_case_no')
CREATE UNIQUE NONCLUSTERED INDEX [IX_spr_surg_post_op_case_no] ON [spr_surg_post_op] 
(
	[fac_id] ASC,
	[rha_case_no] ASC
) ON [PRIMARY]


IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_post_op]') AND name = N'IX_spr_surg_post_op_hsn')
CREATE NONCLUSTERED INDEX [IX_spr_surg_post_op_hsn] ON [spr_surg_post_op] 
(
	[spr_pat_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]



IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_proc_list]') AND name = N'spr_rha_proc_list_defn_idx')
CREATE NONCLUSTERED INDEX [spr_rha_proc_list_defn_idx] ON [spr_proc_list] 
(
	[rha_id] ASC,
	[proc_list_desc] ASC
) ON [PRIMARY]



IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_case]') AND name = N'idx_booking_date')
CREATE NONCLUSTERED INDEX [idx_booking_date] ON [spr_surg_case] 
(
	[rqst_date] ASC,
	[rha_id] ASC
) ON [PRIMARY]


IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_case]') AND name = N'idx_booking_eval_id')
CREATE NONCLUSTERED INDEX [idx_booking_eval_id] ON [spr_surg_case] 
(
	[pat_eval_id] ASC
) ON [PRIMARY]


IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_case]') AND name = N'idx_fac_or_booking_id')
CREATE UNIQUE NONCLUSTERED INDEX [idx_fac_or_booking_id] ON [spr_surg_case] 
(
	[fac_id] ASC,
	[orbs_book_id] ASC
) ON [PRIMARY]


IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_case]') AND name = N'IX_spr_surg_case_hsn')
CREATE NONCLUSTERED INDEX [IX_spr_surg_case_hsn] ON [spr_surg_case] 
(
	[spr_pat_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]



IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_rha_proc]') AND name = N'idx_proc_xref_id')
CREATE UNIQUE NONCLUSTERED INDEX [idx_proc_xref_id] ON [spr_rha_proc] 
(
	[proc_xref_id] ASC
) ON [PRIMARY]



IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_proc_defn]') AND name = N'idx_proc_eff_date')
CREATE NONCLUSTERED INDEX [idx_proc_eff_date] ON [spr_proc_defn] 
(
	[eff_date] ASC,
	[exp_date] ASC
) ON [PRIMARY]



/****************************************************************************************
	
		apply script to add and update spr_pat_eval_answ table
		
******************************************************************************************/


SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON


--	add spr_eval_id column to answer and audit tables
IF NOT EXISTS (
	SELECT	b.[name]
	FROM	sysobjects a
	JOIN	syscolumns b on a.id = b.id
	WHERE	a.[name] = 'spr_pat_eval_answ'
	AND	b.[name] = 'spr_eval_id' )
BEGIN
	ALTER TABLE spr_pat_eval_answ
	ADD spr_eval_id INT 

	ALTER TABLE spr_pat_eval_answ_audt
	ADD spr_eval_id INT 
END

--	drop answer update trigger if exists
IF EXISTS (
	SELECT	[name]
	FROM	sysobjects
	WHERE	[name] = 'spr_pat_eval_answ_audt_update')
BEGIN
	DROP TRIGGER spr_pat_eval_answ_audt_update
END

SET XACT_ABORT ON

BEGIN TRANSACTION

--	update spr_eval_id on answer table

UPDATE	spr_pat_eval_answ
SET	spr_eval_id = a.spr_eval_id
FROM	spr_pat_eval		a
JOIN	spr_pat_eval_answ	b
ON	a.pat_eval_id = b.pat_eval_id

COMMIT TRANSACTION
BEGIN TRANSACTION

--	update spr_eval_id on answer audit table

UPDATE	spr_pat_eval_answ_audt
SET	spr_eval_id = a.spr_eval_id
FROM	spr_pat_eval_audt	a
JOIN	spr_pat_eval_answ_audt	b
ON	a.pat_eval_id = b.pat_eval_id
AND	b.row_exp_date BETWEEN a.row_eff_date AND a.row_exp_date 

COMMIT TRANSACTION
BEGIN TRANSACTION

UPDATE	spr_pat_eval_answ_audt
SET	spr_eval_id = a.spr_eval_id
FROM	spr_pat_eval		a
JOIN	spr_pat_eval_answ_audt	b
ON	a.pat_eval_id = b.pat_eval_id
AND	b.row_exp_date > a.row_eff_date

COMMIT TRANSACTION
