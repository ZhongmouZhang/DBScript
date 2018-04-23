SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[md_quik_info]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [md_quik_info](
	[md_id] [int] IDENTITY(1,1) NOT NULL,
	[md_no] [int] NOT NULL,
	[clnc_no] [int] NULL,
	[md_lastname] [varchar](50) NULL,
	[md_given_name] [varchar](50) NULL,
	[addr_line_1] [varchar](50) NULL,
	[addr_line_2] [varchar](70) NULL,
	[cmty_desc] [varchar](50) NULL,
	[post_code] [varchar](10) NULL,
	[prov] [varchar](50) NULL,
	[tel_no] [varchar](50) NULL,
	[born_date] [datetime] NULL,
	[sex] [char](1) NULL,
	[spcl_desc] [varchar](152) NULL,
	[clnc_name] [varchar](70) NULL,
	[clnc_addr_line_1] [varchar](70) NULL,
	[clnc_addr_line_2] [varchar](50) NULL,
	[clnc_cmty_desc] [varchar](50) NULL,
	[clnc_prov] [varchar](50) NULL,
	[clnc_post_code] [varchar](10) NULL,
	[clnc_tel_no] [varchar](50) NULL,
	[run_date] [datetime] NULL,
	[serv_prov_src] [char](4) NULL,
	[msp_id] [int] NULL,
 CONSTRAINT [PK_md_quik_info] PRIMARY KEY CLUSTERED 
(
	[md_no] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_bp_rha_file_process_log]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_bp_rha_file_process_log](
	[file_id] [int] IDENTITY(1,1) NOT NULL,
	[file_location] [varchar](255) NOT NULL,
	[file_name] [varchar](50) NOT NULL,
	[file_type] [char](1) NULL,
	[rha_id] [varchar](10) NULL,
	[fac_id] [int] NULL,
	[rec_type] [smallint] NULL,
	[file_date] [datetime] NULL,
	[file_seq] [char](10) NULL,
	[processing_file_location] [varchar](255) NULL,
	[creation_date] [datetime] NULL,
	[import_date] [datetime] NULL,
	[processed_status] [smallint] NULL,
	[processed_date] [datetime] NULL,
	[total_imported_rec] [int] NULL,
	[total_processed_rec] [int] NULL,
	[rec_ok] [int] NULL,
	[rec_error] [int] NULL,
	[rec_warning] [int] NULL,
	[export_date] [datetime] NULL,
 CONSTRAINT [PK_spr_bp_ha_file_process_log] PRIMARY KEY CLUSTERED 
(
	[file_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_md_ref_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_md_ref_audt](
	[rha_id] [smallint] NOT NULL,
	[ref_md_id] [int] NOT NULL,
	[md_name] [varchar](50) NOT NULL,
	[msp_id] [int] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_info]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_info](
	[fld_name] [varchar](50) NOT NULL,
	[fld_valu_text] [varchar](50) NULL,
	[fld_valu_numb] [bigint] NULL,
 CONSTRAINT [PK_spr_xsys_info] PRIMARY KEY CLUSTERED 
(
	[fld_name] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_cancel_reason_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_cancel_reason_defn](
	[spr_cancel_code] [char](10) NOT NULL,
	[spr_cancel_reason] [varchar](50) NULL,
	[eff_date] [smalldatetime] NULL,
	[exp_date] [smalldatetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
 CONSTRAINT [PK_spr_cancel_reason_defn] PRIMARY KEY CLUSTERED 
(
	[spr_cancel_code] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_spec_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_spec_defn_audt](
	[md_spec_id] [int] NOT NULL,
	[md_spec_desc] [varchar](100) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_eval_qstn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_eval_qstn_audt](
	[spr_eval_id] [int] NOT NULL,
	[qstn_id] [int] NOT NULL,
	[qstn_labl] [varchar](512) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_user_srgn_xref]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_user_srgn_xref](
	[user_id] [varchar](25) NOT NULL,
	[spr_md_id] [int] NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[provider_id] [int] NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_xsys_user_srgn_xref] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[spr_md_id] ASC,
	[rha_id] ASC,
	[provider_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_user_rha_xref]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_user_rha_xref](
	[user_id] [varchar](25) NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_xsys_user_rha_xref] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[rha_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_rha_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_rha_defn_audt](
	[rha_id] [smallint] NOT NULL,
	[rha_desc] [varchar](255) NOT NULL,
	[eff_date] [datetime] NULL,
	[exp_date] [datetime] NULL,
	[ou_desc] [varchar](20) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_bp_feedback_head]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_bp_feedback_head](
	[feedback_head_id] [bigint] IDENTITY(1,1) NOT NULL,
	[feedback_record_type] [char](1) NOT NULL,
	[rha_id] [smallint] NULL,
	[fac_id] [int] NULL,
	[pat_id] [char](10) NULL,
	[orb_booking_no] [int] NULL,
	[orb_case_no] [char](10) NULL,
	[create_date] [datetime] NULL,
	[pat_eval_id] [int] NULL,
	[surg_case_id] [int] NULL,
	[surg_post_op_id] [int] NULL,
	[result_code] [int] NOT NULL,
	[result_msg] [varchar](255) NULL,
	[orb_interface_data] [varchar](1500) NULL,
	[unused1] [varchar](20) NULL,
	[unused2] [varchar](20) NULL,
	[unused3] [varchar](20) NULL,
	[unused4] [varchar](20) NULL,
	[file_id] [int] NOT NULL,
	[row_id] [bigint] NULL,
	[action_code] [char](1) NULL,
	[fixed_date] [datetime] NULL,
 CONSTRAINT [PK_spr_bp_feedback_head] PRIMARY KEY CLUSTERED 
(
	[feedback_head_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

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
GO

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
GO

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
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_bp_feedback_head]') AND name = N'idx_bp_feedback_head_rec_file_id')
CREATE NONCLUSTERED INDEX [idx_bp_feedback_head_rec_file_id] ON [spr_bp_feedback_head] 
(
	[file_id] ASC
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_bp_rha_postsurg_rec_in]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_bp_rha_postsurg_rec_in](
	[row_id] [bigint] IDENTITY(1,1) NOT NULL,
	[file_id] [int] NOT NULL,
	[ins_date] [datetime] NOT NULL,
	[processed_status] [smallint] NOT NULL,
	[processed_date] [datetime] NULL,
	[src_create_date] [datetime] NULL,
	[rec_type] [char](1) NULL,
	[action_code] [char](1) NULL,
	[surg_cmpl_date] [datetime] NULL,
	[surg_post_op_id] [int] NULL,
	[surg_case_id] [int] NULL,
	[orbs_book_id] [int] NULL,
	[rha_case_no] [char](10) NULL,
	[rha_id] [smallint] NULL,
	[fac_id] [int] NULL,
	[pat_id] [char](10) NULL,
	[city] [varchar](30) NULL,
	[post_code] [char](6) NULL,
	[rha_srgn_alt_id] [int] NULL,
	[sscn_srgn_id] [int] NULL,
	[prim_proc_code] [varchar](15) NULL,
	[side] [char](1) NULL,
	[scnd_proc_code_1] [varchar](15) NULL,
	[side_1] [char](1) NULL,
	[scnd_proc_code_2] [varchar](15) NULL,
	[side_2] [char](1) NULL,
	[scnd_proc_code_3] [varchar](15) NULL,
	[side_3] [char](1) NULL,
	[emrg_surg] [char](1) NULL,
	[unused1] [varchar](20) NULL,
	[unused2] [varchar](20) NULL,
	[unused3] [varchar](20) NULL,
	[unused4] [varchar](20) NULL,
	[orb_interface_data] [varchar](max) NULL,
 CONSTRAINT [PK_spr_bp_rha_postsurg_rec_in] PRIMARY KEY CLUSTERED 
(
	[row_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_bp_rha_postsurg_rec_in]') AND name = N'idx_bp_postsurg_rec_file_id')
CREATE NONCLUSTERED INDEX [idx_bp_postsurg_rec_file_id] ON [spr_bp_rha_postsurg_rec_in] 
(
	[file_id] ASC
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_bp_rha_booking_rec_in]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_bp_rha_booking_rec_in](
	[row_id] [bigint] IDENTITY(1,1) NOT NULL,
	[file_id] [int] NOT NULL,
	[ins_date] [datetime] NOT NULL,
	[processed_status] [smallint] NOT NULL,
	[processed_date] [datetime] NULL,
	[src_create_date] [datetime] NULL,
	[rec_type] [char](1) NULL,
	[action_code] [char](1) NULL,
	[surg_case_id] [int] NULL,
	[orbs_book_id] [int] NULL,
	[rqst_date] [datetime] NULL,
	[rha_case_no] [char](10) NULL,
	[rha_id] [smallint] NULL,
	[fac_id] [int] NULL,
	[pat_eval_id] [int] NULL,
	[pat_id] [char](10) NULL,
	[post_code] [char](6) NULL,
	[city] [varchar](30) NULL,
	[decision_date] [datetime] NULL,
	[is_cancer_related] [char](1) NULL,
	[pat_unvl_start_perd_1] [datetime] NULL,
	[pat_unvl_end_perd_1] [datetime] NULL,
	[pat_unvl_xpln_id_perd_1] [int] NULL,
	[pat_unvl_start_perd_2] [datetime] NULL,
	[pat_unvl_end_perd_2] [datetime] NULL,
	[pat_unvl_xpln_id_perd_2] [int] NULL,
	[pat_unvl_start_perd_3] [datetime] NULL,
	[pat_unvl_end_perd_3] [datetime] NULL,
	[pat_unvl_xpln_id_perd_3] [int] NULL,
	[refr_date] [datetime] NULL,
	[init_srgn_visit_date] [datetime] NULL,
	[rha_srgn_alt_id] [int] NULL,
	[sscn_srgn_id] [int] NULL,
	[prim_proc_code] [varchar](15) NULL,
	[side] [char](1) NULL,
	[free_text_desc] [varchar](255) NULL,
	[scnd_proc_code_1] [varchar](15) NULL,
	[side_1] [char](1) NULL,
	[free_text_desc_1] [varchar](255) NULL,
	[scnd_proc_code_2] [varchar](15) NULL,
	[side_2] [char](1) NULL,
	[free_text_desc_2] [varchar](255) NULL,
	[scnd_proc_code_3] [varchar](15) NULL,
	[side_3] [char](1) NULL,
	[free_text_desc_3] [varchar](255) NULL,
	[enct_type_code] [varchar](10) NULL,
	[surg_schd_date] [datetime] NULL,
	[surg_stat_id] [char](1) NULL,
	[surg_defr_date] [datetime] NULL,
	[cancel_reason_code] [varchar](10) NULL,
	[postpone_reason_code] [varchar](10) NULL,
	[surg_iatv_date] [datetime] NULL,
	[surg_iatv_xpln_id] [char](1) NULL,
	[general_comments] [varchar](100) NULL,
	[pre_operative_diagnosis] [varchar](500) NULL,
	[unused1] [varchar](20) NULL,
	[unused2] [varchar](20) NULL,
	[unused3] [varchar](20) NULL,
	[unused4] [varchar](20) NULL,
	[orb_interface_data] [varchar](max) NULL,
 CONSTRAINT [PK_spr_bp_HA_Book_Rec_In] PRIMARY KEY CLUSTERED 
(
	[row_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_bp_rha_booking_rec_in]') AND name = N'idx_bp_booking_rec_file_id')
CREATE NONCLUSTERED INDEX [idx_bp_booking_rec_file_id] ON [spr_bp_rha_booking_rec_in] 
(
	[file_id] ASC
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_bp_rha_pat_rec_in]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_bp_rha_pat_rec_in](
	[row_id] [bigint] IDENTITY(1,1) NOT NULL,
	[file_id] [int] NOT NULL,
	[ins_date] [datetime] NOT NULL,
	[processed_status] [smallint] NOT NULL,
	[processed_date] [datetime] NULL,
	[src_create_date] [datetime] NULL,
	[rec_type] [char](1) NULL,
	[action_code] [char](1) NULL,
	[rha_id] [smallint] NULL,
	[fac_id] [int] NULL,
	[pat_id] [char](10) NULL,
	[alt_pat_id_type] [char](10) NULL,
	[alt_pat_id] [char](12) NULL,
	[name_last] [varchar](75) NULL,
	[name_given_1] [varchar](30) NULL,
	[name_preferred] [varchar](30) NULL,
	[name_given_2] [varchar](30) NULL,
	[name_given_3] [varchar](30) NULL,
	[born_date] [datetime] NULL,
	[sex] [smallint] NULL,
	[addr_line_1] [varchar](75) NULL,
	[addr_line_2] [varchar](75) NULL,
	[addr_line_3] [varchar](75) NULL,
	[city] [varchar](30) NULL,
	[prov_code] [char](3) NULL,
	[post_code] [char](10) NULL,
	[tel_no_home_area] [char](3) NULL,
	[tel_no_home] [char](10) NULL,
	[tel_no_work_area] [char](3) NULL,
	[tel_no_work] [char](10) NULL,
	[tel_no_cell_area] [char](3) NULL,
	[tel_no_cell] [char](10) NULL,
	[ctac_name] [varchar](50) NULL,
	[ctac_addr_line_1] [varchar](75) NULL,
	[ctac_addr_line_2] [varchar](75) NULL,
	[ctac_addr_line_3] [varchar](75) NULL,
	[ctac_city] [varchar](30) NULL,
	[ctac_prov_code] [char](3) NULL,
	[ctac_post_code] [char](6) NULL,
	[ctac_tel_no_area] [char](7) NULL,
	[ctac_tel_no] [char](20) NULL,
	[unused1] [varchar](20) NULL,
	[unused2] [varchar](20) NULL,
	[unused3] [varchar](20) NULL,
	[unused4] [varchar](20) NULL,
	[orb_interface_data] [varchar](max) NULL,
 CONSTRAINT [PK_spr_bp_HA_Pat_Rec_In] PRIMARY KEY CLUSTERED 
(
	[row_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_bp_rha_pat_rec_in]') AND name = N'idx_bp_pat_rec_file_id')
CREATE NONCLUSTERED INDEX [idx_bp_pat_rec_file_id] ON [spr_bp_rha_pat_rec_in] 
(
	[file_id] ASC
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_unvl_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_unvl_defn_audt](
	[spr_pat_unvl_id] [smallint] NULL,
	[spr_pat_unvl_desc] [varchar](100) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_surg_post_op_err_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_surg_post_op_err_audt](
	[surg_post_op_id] [bigint] NOT NULL,
	[err_id] [smallint] NOT NULL,
	[err_fld_name] [varchar](30) NOT NULL,
	[surg_cmpl_date] [datetime] NULL,
	[fac_id] [int] NULL,
	[spr_pat_id] [char](12) NULL,
	[spr_pat_id_type] [smallint] NULL,
	[err_sevr_id] [int] NOT NULL,
	[err_ovrd_flag] [char](1) NULL,
	[err_desc] [varchar](255) NULL,
	[err_detl] [varchar](2000) NULL,
	[err_prev_valu] [varchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_sex_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_sex_audt](
	[sex_id] [tinyint] NOT NULL,
	[sex_desc] [varchar](10) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_user_id] [varchar](100) NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_date] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_err_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_err_audt](
	[err_id] [smallint] NOT NULL,
	[err_fld_name] [varchar](30) NOT NULL,
	[spr_pat_id] [char](10) NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[name_last] [varchar](50) NULL,
	[name_given_1] [varchar](50) NULL,
	[sex] [tinyint] NULL,
	[born_date] [datetime] NULL,
	[post_code] [char](7) NULL,
	[err_sevr_id] [int] NULL,
	[err_ovrd_flag] [char](1) NULL,
	[err_desc] [varchar](255) NULL,
	[err_detl] [varchar](2000) NULL,
	[err_prev_valu] [varchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_rha_enct_type_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_rha_enct_type_defn_audt](
	[enct_type_list_id] [int] NOT NULL,
	[rha_enct_type_code] [varchar](10) NOT NULL,
	[rha_enct_type_desc] [varchar](100) NOT NULL,
	[spr_enct_type_code] [char](10) NOT NULL,
	[eff_date] [smalldatetime] NULL,
	[exp_date] [smalldatetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_enct_type_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_enct_type_defn_audt](
	[spr_enct_type_code] [char](10) NOT NULL,
	[spr_enct_type_desc] [varchar](50) NOT NULL,
	[eff_date] [smalldatetime] NULL,
	[exp_date] [smalldatetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_md_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_md_audt](
	[spr_md_id] [int] NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[provider_id] [int] NULL,
	[college_id] [int] NULL,
	[msp_id] [int] NULL,
	[md_spec_id] [int] NOT NULL,
	[name_last] [varchar](50) NULL,
	[name_1st] [varchar](50) NULL,
	[addr_str] [varchar](100) NULL,
	[cmty_desc] [varchar](50) NULL,
	[prov_code] [char](3) NULL,
	[post_code] [char](7) NULL,
	[ctry] [varchar](50) NULL,
	[tel_no_area] [char](3) NULL,
	[tel_no] [varchar](50) NULL,
	[tel_no_ext] [char](5) NULL,
	[eff_date] [datetime] NULL,
	[exp_date] [datetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_cancel_reason_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_cancel_reason_defn_audt](
	[spr_cancel_code] [char](10) NOT NULL,
	[spr_cancel_reason] [varchar](50) NULL,
	[eff_date] [smalldatetime] NULL,
	[exp_date] [smalldatetime] NULL,
	[row_id] [int] NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_side_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_side_audt](
	[side_id] [tinyint] NOT NULL,
	[side_desc] [varchar](10) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_user_id] [varchar](100) NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_date] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_eval_qstn_part_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_eval_qstn_part_audt](
	[spr_eval_id] [int] NOT NULL,
	[qstn_id] [int] NOT NULL,
	[qstn_part] [char](2) NOT NULL,
	[qstn_part_labl] [varchar](255) NULL,
	[qstn_part_text_answ_rqir] [char](1) NULL,
	[qstn_part_text_answ_labl] [varchar](50) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_rpt_cat_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_rpt_cat_defn_audt](
	[rpt_cat_id] [int] NOT NULL,
	[rpt_cat_desc] [varchar](50) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_eval_qstn_choi_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_eval_qstn_choi_audt](
	[spr_eval_id] [int] NULL,
	[qstn_id] [int] NOT NULL,
	[qstn_part] [char](2) NOT NULL,
	[choi_no] [smallint] NOT NULL,
	[choi_labl] [varchar](255) NULL,
	[choi_valu] [smallint] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_iact_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_iact_defn_audt](
	[sscn_iact_type_id] [smallint] NOT NULL,
	[sscn_iact_type_desc] [varchar](50) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_fac_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_fac_defn_audt](
	[fac_id] [int] NOT NULL,
	[fac_desc] [varchar](60) NULL,
	[rha_id] [smallint] NULL,
	[email] [varchar](100) NULL,
	[proc_list_id] [int] NULL,
	[enct_type_list_id] [int] NULL,
	[cancel_list_id] [int] NULL,
	[postpone_list_id] [int] NULL,
	[eff_date] [datetime] NULL,
	[exp_date] [datetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_proc_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_proc_defn_audt](
	[spr_proc_id] [char](15) NOT NULL,
	[spr_surg_serv_id] [smallint] NULL,
	[spr_proc_desc] [varchar](255) NOT NULL,
	[proc_rang_lo] [int] NULL,
	[proc_rang_hi] [int] NULL,
	[side_rqrd] [char](1) NULL,
	[eff_date] [datetime] NOT NULL,
	[exp_date] [datetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_bp_feedback_detail]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_bp_feedback_detail](
	[feedback_detail_id] [bigint] IDENTITY(1,1) NOT NULL,
	[feedback_head_id] [bigint] NOT NULL,
	[error_type] [char](1) NOT NULL,
	[field_name] [varchar](100) NULL,
	[error_id] [int] NULL,
	[error_msg] [varchar](255) NULL,
	[unused1] [varchar](20) NULL,
	[unused2] [varchar](20) NULL,
 CONSTRAINT [PK_spr_bp_feedback_detail] PRIMARY KEY CLUSTERED 
(
	[feedback_detail_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_rha_postpone_reason_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_rha_postpone_reason_defn_audt](
	[postpone_list_id] [int] NOT NULL,
	[rha_postpone_code] [varchar](10) NOT NULL,
	[rha_postpone_reason] [varchar](100) NULL,
	[spr_postpone_code] [char](10) NOT NULL,
	[eff_date] [smalldatetime] NULL,
	[exp_date] [smalldatetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_web_page_grp_xref_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_web_page_grp_xref_audt](
	[page_url] [varchar](255) NOT NULL,
	[grp_id] [varchar](25) NOT NULL,
	[add_flag] [char](1) NOT NULL,
	[chng_flag] [char](1) NOT NULL,
	[del_flag] [char](1) NOT NULL,
	[qry_flag] [char](1) NOT NULL,
	[x_qry_flag] [char](1) NOT NULL,
	[upld_flag] [char](1) NOT NULL,
	[fld_acss] [varchar](255) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_eval_answ_err_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_eval_answ_err_audt](
	[pat_eval_id] [bigint] NOT NULL,
	[qstn_id] [int] NOT NULL,
	[qstn_part] [char](2) NOT NULL,
	[err_id] [smallint] NOT NULL,
	[err_fld_name] [varchar](20) NOT NULL,
	[err_sevr_id] [int] NULL,
	[err_ovrd_flag] [char](1) NULL,
	[err_desc] [varchar](255) NULL,
	[err_detl] [varchar](2000) NULL,
	[err_prev_valu] [varchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_inac_assm_xpln_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_inac_assm_xpln_defn_audt](
	[spr_defr_xpln_id] [smallint] NOT NULL,
	[spr_defr_xpln_desc] [varchar](50) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_eval_answ_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_eval_answ_audt](
	[pat_eval_id] [bigint] NOT NULL,
	[qstn_id] [int] NOT NULL,
	[qstn_part] [char](2) NOT NULL,
	[choi_no] [smallint] NULL,
	[text_answ_valu] [varchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [bigint] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_eval_err_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_eval_err_audt](
	[pat_eval_id] [bigint] NOT NULL,
	[err_id] [smallint] NOT NULL,
	[err_fld_name] [varchar](30) NOT NULL,
	[err_sevr_id] [int] NULL,
	[err_ovrd_flag] [char](1) NULL,
	[err_desc] [varchar](255) NULL,
	[err_detl] [varchar](2000) NULL,
	[err_prev_valu] [varchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_surg_serv_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_surg_serv_defn_audt](
	[spr_surg_serv_id] [smallint] NOT NULL,
	[spr_surg_serv_desc] [varchar](100) NOT NULL,
	[eff_date] [datetime] NOT NULL,
	[exp_date] [datetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_rha_proc_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_rha_proc_audt](
	[proc_xref_id] [int] NOT NULL,
	[proc_list_id] [int] NOT NULL,
	[rha_proc_code] [char](15) NOT NULL,
	[rha_proc_desc] [varchar](255) NOT NULL,
	[spr_proc_id] [char](15) NOT NULL,
	[eff_date] [smalldatetime] NOT NULL,
	[exp_date] [smalldatetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_user_id] [varchar](100) NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_date] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_user_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_user_audt](
	[user_id] [varchar](25) NOT NULL,
	[user_name] [varchar](60) NOT NULL,
	[user_first_name] [varchar](30) NULL,
	[user_last_name] [varchar](30) NULL,
	[user_pwd] [varchar](25) NOT NULL,
	[user_fac_id] [int] NULL,
	[rha_id] [smallint] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_rha_cancel_reason_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_rha_cancel_reason_defn_audt](
	[cancel_list_id] [int] NOT NULL,
	[rha_cancel_code] [varchar](10) NOT NULL,
	[rha_cancel_reason] [varchar](100) NULL,
	[spr_cancel_code] [char](10) NOT NULL,
	[eff_date] [smalldatetime] NULL,
	[exp_date] [smalldatetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_surg_stat_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_surg_stat_defn_audt](
	[spr_surg_stat_id] [smallint] NOT NULL,
	[spr_surg_stat_desc] [varchar](50) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_eval_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_eval_defn_audt](
	[spr_eval_id] [int] NOT NULL,
	[spr_surg_serv_id] [smallint] NULL,
	[spr_eval_titl] [varchar](100) NULL,
	[eff_date] [datetime] NULL,
	[exp_date] [datetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_user_srgn_xref_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_user_srgn_xref_audt](
	[user_id] [varchar](25) NOT NULL,
	[spr_md_id] [int] NOT NULL,
	[rha_id] [smallint] NULL,
	[provider_id] [int] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_providers_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_providers_audt](
	[provider_id] [int] NOT NULL,
	[provider] [nvarchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_surg_case_err_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_surg_case_err_audt](
	[surg_case_id] [bigint] NOT NULL,
	[err_id] [smallint] NOT NULL,
	[err_fld_name] [varchar](30) NOT NULL,
	[err_sevr_id] [int] NULL,
	[err_ovrd_flag] [char](1) NULL,
	[err_desc] [varchar](255) NULL,
	[err_detl] [varchar](2000) NULL,
	[err_prev_valu] [varchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_alt_id_type_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_alt_id_type_audt](
	[alt_pat_id_type] [char](10) NOT NULL,
	[alt_pat_id_type_desc] [varchar](100) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_user_rha_xref_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_user_rha_xref_audt](
	[user_id] [varchar](25) NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_user_grp_xref_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_user_grp_xref_audt](
	[grp_id] [varchar](25) NOT NULL,
	[user_id] [varchar](25) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_postpone_reason_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_postpone_reason_defn_audt](
	[spr_postpone_code] [char](10) NOT NULL,
	[spr_postpone_reason] [varchar](50) NULL,
	[eff_date] [smalldatetime] NULL,
	[exp_date] [smalldatetime] NULL,
	[row_id] [int] NOT NULL,
	[row_eff_user_id] [varchar](100) NOT NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_err_grp_xref_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_err_grp_xref_audt](
	[err_id] [smallint] NOT NULL,
	[grp_id] [varchar](25) NOT NULL,
	[err_ovrd_allw] [char](1) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_err_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_err_defn_audt](
	[err_id] [smallint] NOT NULL,
	[err_desc] [varchar](255) NULL,
	[err_sevr_id] [int] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_enct_type_list_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_enct_type_list_audt](
	[enct_type_list_id] [int] NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[enct_type_list_desc] [varchar](100) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_province_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_province_audt](
	[province_code] [char](3) NULL,
	[province] [varchar](50) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_audt](
	[spr_pat_id] [char](10) NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[alt_pat_id_type] [char](10) NULL,
	[alt_pat_id] [char](12) NULL,
	[name_last] [varchar](75) NOT NULL,
	[name_given_1] [varchar](30) NOT NULL,
	[name_preferred] [varchar](30) NULL,
	[name_given_2] [varchar](30) NULL,
	[name_given_3] [varchar](30) NULL,
	[sex] [tinyint] NOT NULL,
	[born_date] [datetime] NOT NULL,
	[addr_line_1] [varchar](75) NULL,
	[addr_line_2] [varchar](75) NULL,
	[addr_line_3] [varchar](75) NULL,
	[city] [varchar](30) NULL,
	[prov_code] [char](3) NULL,
	[post_code] [char](6) NULL,
	[tel_no_home_area] [char](3) NULL,
	[tel_no_home] [char](17) NULL,
	[tel_no_work_area] [char](3) NULL,
	[tel_no_work] [char](17) NULL,
	[tel_no_work_ext] [char](5) NULL,
	[tel_no_cell_area] [char](3) NULL,
	[tel_no_cell] [char](17) NULL,
	[ctac_name] [varchar](50) NULL,
	[ctac_addr_line_1] [varchar](75) NULL,
	[ctac_addr_line_2] [varchar](75) NULL,
	[ctac_addr_line_3] [varchar](75) NULL,
	[ctac_city] [varchar](30) NULL,
	[ctac_prov_code] [char](3) NULL,
	[ctac_post_code] [char](6) NULL,
	[ctac_tel_no_area] [char](3) NULL,
	[ctac_tel_no] [char](17) NULL,
	[ctac_tel_no_ext] [char](5) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_rpt_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_rpt_defn_audt](
	[rpt_id] [int] NOT NULL,
	[titl] [varchar](100) NOT NULL,
	[rpt_desc] [varchar](512) NULL,
	[rpt_cat_id] [int] NULL,
	[sql] [varchar](4000) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_data_dict_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_data_dict_audt](
	[tble_name] [varchar](50) NOT NULL,
	[col_name] [varchar](50) NOT NULL,
	[xpln] [varchar](2000) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_post_code_rha_xref_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_post_code_rha_xref_audt](
	[post_code] [char](7) NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_surg_post_op_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_surg_post_op_audt](
	[surg_post_op_id] [bigint] NOT NULL,
	[surg_case_id] [bigint] NULL,
	[spr_pat_id] [char](10) NULL,
	[rha_id] [smallint] NULL,
	[orbs_book_id] [int] NULL,
	[rha_case_no] [char](15) NULL,
	[fac_id] [int] NULL,
	[proc_list_id] [int] NULL,
	[spr_srgn_id] [int] NULL,
	[surg_cmpl_date] [datetime] NULL,
	[prim_proc_code] [char](15) NULL,
	[scnd_proc_code_1] [char](15) NULL,
	[scnd_proc_code_2] [char](15) NULL,
	[scnd_proc_code_3] [char](15) NULL,
	[free_text_desc] [varchar](255) NULL,
	[free_text_desc_1] [varchar](255) NULL,
	[free_text_desc_2] [varchar](255) NULL,
	[free_text_desc_3] [varchar](255) NULL,
	[side] [tinyint] NULL,
	[side_1] [tinyint] NULL,
	[side_2] [tinyint] NULL,
	[side_3] [tinyint] NULL,
	[emrg_surg] [char](1) NULL,
	[city] [varchar](30) NULL,
	[post_code] [char](6) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [bigint] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_postpone_reason_list_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_postpone_reason_list_audt](
	[postpone_reason_list_id] [int] NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[postpone_reason_list_desc] [varchar](100) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_wait_list_cat_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_wait_list_cat_defn_audt](
	[spr_wait_list_cat_id] [smallint] NOT NULL,
	[spr_wait_list_cat_desc] [varchar](50) NULL,
	[min_perc] [float] NULL,
	[cncr] [char](1) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[max_days] [int] NULL,
	[trgt_perc] [int] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_surg_case_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_surg_case_audt](
	[surg_case_id] [bigint] NOT NULL,
	[spr_pat_id] [char](10) NULL,
	[rha_id] [smallint] NULL,
	[pat_eval_id] [bigint] NULL,
	[pat_unvl_strt_perd_1] [datetime] NULL,
	[pat_unvl_end_perd_1] [datetime] NULL,
	[pat_unvl_xpln_id_perd_1] [smallint] NULL,
	[pat_unvl_strt_perd_2] [datetime] NULL,
	[pat_unvl_end_perd_2] [datetime] NULL,
	[pat_unvl_xpln_id_perd_2] [smallint] NULL,
	[pat_unvl_strt_perd_3] [datetime] NULL,
	[pat_unvl_end_perd_3] [datetime] NULL,
	[pat_unvl_xpln_id_perd_3] [smallint] NULL,
	[orbs_book_id] [int] NULL,
	[rha_case_no] [char](15) NULL,
	[rqst_date] [datetime] NULL,
	[refr_date] [datetime] NULL,
	[spr_refr_md_id] [int] NULL,
	[spr_srgn_id] [int] NULL,
	[rha_srgn_alt_id] [char](10) NULL,
	[init_srgn_vsit_date] [datetime] NULL,
	[prim_proc_code] [char](15) NULL,
	[scnd_proc_code_1] [char](15) NULL,
	[scnd_proc_code_2] [char](15) NULL,
	[scnd_proc_code_3] [char](15) NULL,
	[free_text_desc] [varchar](255) NULL,
	[free_text_desc_1] [varchar](255) NULL,
	[free_text_desc_2] [varchar](255) NULL,
	[free_text_desc_3] [varchar](255) NULL,
	[side] [tinyint] NULL,
	[side_1] [tinyint] NULL,
	[side_2] [tinyint] NULL,
	[side_3] [tinyint] NULL,
	[fac_id] [int] NULL,
	[proc_list_id] [int] NULL,
	[enct_type_list_id] [int] NULL,
	[enct_type_code] [varchar](10) NULL,
	[surg_schd_date] [datetime] NULL,
	[surg_defr_date] [datetime] NULL,
	[postpone_list_id] [int] NULL,
	[postpone_reason_code] [varchar](10) NULL,
	[cancel_list_id] [int] NULL,
	[cancel_reason_code] [varchar](10) NULL,
	[surg_iatv_date] [datetime] NULL,
	[spr_surg_iatv_xpln_id] [smallint] NULL,
	[spr_surg_stat_id] [smallint] NULL,
	[surg_case_xpln] [varchar](255) NULL,
	[diagnosis] [varchar](500) NULL,
	[city] [varchar](30) NULL,
	[post_code] [char](6) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [bigint] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_assm_stat_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_assm_stat_defn_audt](
	[assm_stat_id] [smallint] NOT NULL,
	[assm_stat_desc] [varchar](50) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_rpt_grp_xref_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_rpt_grp_xref_audt](
	[grp_id] [varchar](25) NOT NULL,
	[rpt_id] [int] NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_cancel_reason_list_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_cancel_reason_list_audt](
	[cancel_reason_list_id] [int] NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[cancel_reason_list_desc] [varchar](100) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_spec_postal_code_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_spec_postal_code_audt](
	[postal_code] [char](6) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_eval_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_eval_audt](
	[pat_eval_id] [bigint] NOT NULL,
	[rha_id] [smallint] NULL,
	[spr_pat_id] [char](10) NOT NULL,
	[pat_birth_date] [char](8) NULL,
	[decision_date] [datetime] NULL,
	[cncr] [char](1) NULL,
	[spr_eval_id] [int] NULL,
	[eval_scor] [int] NULL,
	[wait_list_cat_id] [smallint] NULL,
	[assm_stat_id] [smallint] NULL,
	[assm_inac_xpln_id] [smallint] NULL,
	[assm_inac_date] [smalldatetime] NULL,
	[row_create_date] [datetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [bigint] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_proc_list_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_proc_list_audt](
	[proc_list_id] [int] NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[proc_list_desc] [varchar](100) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_exp_user_id] [varchar](100) NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_date] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_grp_defn_audt]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_grp_defn_audt](
	[grp_id] [varchar](25) NOT NULL,
	[grp_desc] [varchar](50) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] NOT NULL,
	[row_exp_date] [datetime] NULL,
	[row_exp_xpln] [tinyint] NULL,
	[row_exp_user_id] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_md]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_md](
	[spr_md_id] [int] NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[provider_id] [int] NOT NULL,
	[college_id] [int] NULL,
	[msp_id] [int] NULL,
	[md_spec_id] [int] NOT NULL,
	[name_last] [varchar](50) NULL,
	[name_1st] [varchar](50) NULL,
	[addr_str] [varchar](100) NULL,
	[cmty_desc] [varchar](50) NULL,
	[prov_code] [char](3) NULL,
	[post_code] [char](7) NULL,
	[ctry] [varchar](50) NULL,
	[tel_no_area] [char](3) NULL,
	[tel_no] [varchar](50) NULL,
	[tel_no_ext] [char](5) NULL,
	[eff_date] [datetime] NULL,
	[exp_date] [datetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_md_1] PRIMARY KEY CLUSTERED 
(
	[spr_md_id] ASC,
	[rha_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_md].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_eval_qstn_part]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_eval_qstn_part](
	[spr_eval_id] [int] NOT NULL,
	[qstn_id] [int] NOT NULL,
	[qstn_part] [char](2) NOT NULL,
	[qstn_part_labl] [varchar](255) NULL,
	[qstn_part_text_answ_rqir] [char](1) NULL,
	[qstn_part_text_answ_labl] [varchar](50) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_pat_eval_qstn] PRIMARY KEY CLUSTERED 
(
	[spr_eval_id] ASC,
	[qstn_id] ASC,
	[qstn_part] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_eval_qstn_part].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_fac_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_fac_defn](
	[fac_id] [int] NOT NULL,
	[fac_desc] [varchar](60) NOT NULL,
	[rha_id] [smallint] NULL,
	[email] [varchar](100) NULL,
	[proc_list_id] [int] NULL,
	[enct_type_list_id] [int] NULL,
	[cancel_list_id] [int] NULL,
	[postpone_list_id] [int] NULL,
	[eff_date] [datetime] NULL,
	[exp_date] [datetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_fac_defn] PRIMARY KEY CLUSTERED 
(
	[fac_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_fac_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat](
	[spr_pat_id] [char](10) NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[alt_pat_id_type] [char](10) NULL,
	[alt_pat_id] [char](12) NULL,
	[name_last] [varchar](75) NOT NULL,
	[name_given_1] [varchar](30) NOT NULL,
	[name_preferred] [varchar](30) NULL,
	[name_given_2] [varchar](30) NULL,
	[name_given_3] [varchar](30) NULL,
	[sex] [tinyint] NOT NULL,
	[born_date] [datetime] NOT NULL,
	[addr_line_1] [varchar](75) NULL,
	[addr_line_2] [varchar](75) NULL,
	[addr_line_3] [varchar](75) NULL,
	[city] [varchar](30) NULL,
	[prov_code] [char](3) NULL,
	[post_code] [char](6) NULL,
	[tel_no_home_area] [char](3) NULL,
	[tel_no_home] [char](17) NULL,
	[tel_no_work_area] [char](3) NULL,
	[tel_no_work] [char](17) NULL,
	[tel_no_work_ext] [char](5) NULL,
	[tel_no_cell_area] [char](3) NULL,
	[tel_no_cell] [char](17) NULL,
	[ctac_name] [varchar](50) NULL,
	[ctac_addr_line_1] [varchar](75) NULL,
	[ctac_addr_line_2] [varchar](75) NULL,
	[ctac_addr_line_3] [varchar](75) NULL,
	[ctac_city] [varchar](30) NULL,
	[ctac_prov_code] [char](3) NULL,
	[ctac_post_code] [char](6) NULL,
	[ctac_tel_no_area] [char](3) NULL,
	[ctac_tel_no] [char](17) NULL,
	[ctac_tel_no_ext] [char](5) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_pat] PRIMARY KEY CLUSTERED 
(
	[spr_pat_id] ASC,
	[rha_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_pat].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_surg_post_op]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_surg_post_op](
	[surg_post_op_id] [bigint] NOT NULL,
	[surg_case_id] [bigint] NULL,
	[spr_pat_id] [char](10) NULL,
	[rha_id] [smallint] NULL,
	[orbs_book_id] [int] NULL,
	[rha_case_no] [char](15) NULL,
	[fac_id] [int] NULL,
	[proc_list_id] [int] NULL,
	[spr_srgn_id] [int] NULL,
	[surg_cmpl_date] [datetime] NULL,
	[prim_proc_code] [char](15) NULL,
	[scnd_proc_code_1] [char](15) NULL,
	[scnd_proc_code_2] [char](15) NULL,
	[scnd_proc_code_3] [char](15) NULL,
	[free_text_desc] [varchar](255) NULL,
	[free_text_desc_1] [varchar](255) NULL,
	[free_text_desc_2] [varchar](255) NULL,
	[free_text_desc_3] [varchar](255) NULL,
	[side] [tinyint] NULL,
	[side_1] [tinyint] NULL,
	[side_2] [tinyint] NULL,
	[side_3] [tinyint] NULL,
	[emrg_surg] [char](1) NULL,
	[city] [varchar](30) NULL,
	[post_code] [char](6) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_surg_post_op] PRIMARY KEY CLUSTERED 
(
	[surg_post_op_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_post_op]') AND name = N'idx_fac_case_number')
CREATE NONCLUSTERED INDEX [idx_fac_case_number] ON [spr_surg_post_op] 
(
	[fac_id] ASC,
	[rha_case_no] ASC
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_post_op]') AND name = N'idx_post_booking_id')
CREATE NONCLUSTERED INDEX [idx_post_booking_id] ON [spr_surg_post_op] 
(
	[surg_case_id] ASC
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_post_op]') AND name = N'idx_post_cmpl_date')
CREATE NONCLUSTERED INDEX [idx_post_cmpl_date] ON [spr_surg_post_op] 
(
	[surg_cmpl_date] ASC,
	[rha_id] ASC
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_post_op]') AND name = N'IX_spr_surg_post_op_case_no')
CREATE UNIQUE NONCLUSTERED INDEX [IX_spr_surg_post_op_case_no] ON [spr_surg_post_op] 
(
	[fac_id] ASC,
	[rha_case_no] ASC
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_post_op]') AND name = N'IX_spr_surg_post_op_hsn')
CREATE NONCLUSTERED INDEX [IX_spr_surg_post_op_hsn] ON [spr_surg_post_op] 
(
	[spr_pat_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_surg_post_op].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_enct_type_list]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_enct_type_list](
	[enct_type_list_id] [int] IDENTITY(1,1) NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[enct_type_list_desc] [varchar](100) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
 CONSTRAINT [PK_spr_enct_type_list] PRIMARY KEY CLUSTERED 
(
	[enct_type_list_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_enct_type_list].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_cancel_reason_list]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_cancel_reason_list](
	[cancel_reason_list_id] [int] IDENTITY(1,1) NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[cancel_reason_list_desc] [varchar](100) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
 CONSTRAINT [PK_spr_cancel_reason_list] PRIMARY KEY CLUSTERED 
(
	[cancel_reason_list_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_cancel_reason_list].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_proc_list]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_proc_list](
	[proc_list_id] [int] IDENTITY(1,1) NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[proc_list_desc] [varchar](100) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
 CONSTRAINT [PK_spr_rha_proc_list_defn] PRIMARY KEY CLUSTERED 
(
	[proc_list_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_proc_list]') AND name = N'spr_rha_proc_list_defn_idx')
CREATE NONCLUSTERED INDEX [spr_rha_proc_list_defn_idx] ON [spr_proc_list] 
(
	[rha_id] ASC,
	[proc_list_desc] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_proc_list].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_eval]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_eval](
	[pat_eval_id] [bigint] NOT NULL,
	[rha_id] [smallint] NULL,
	[spr_pat_id] [char](10) NOT NULL,
	[pat_birth_date] [char](8) NOT NULL,
	[decision_date] [datetime] NULL,
	[cncr] [char](1) NULL,
	[spr_eval_id] [int] NULL,
	[eval_scor] [int] NULL,
	[wait_list_cat_id] [smallint] NULL,
	[assm_stat_id] [smallint] NULL,
	[assm_inac_xpln_id] [smallint] NULL,
	[assm_inac_date] [smalldatetime] NULL,
	[row_create_date] [datetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_pat_eval] PRIMARY KEY CLUSTERED 
(
	[pat_eval_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_pat_eval].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_surg_case]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_surg_case](
	[surg_case_id] [bigint] NOT NULL,
	[spr_pat_id] [char](10) NULL,
	[rha_id] [smallint] NULL,
	[pat_eval_id] [bigint] NULL,
	[pat_unvl_strt_perd_1] [datetime] NULL,
	[pat_unvl_end_perd_1] [datetime] NULL,
	[pat_unvl_xpln_id_perd_1] [smallint] NULL,
	[pat_unvl_strt_perd_2] [datetime] NULL,
	[pat_unvl_end_perd_2] [datetime] NULL,
	[pat_unvl_xpln_id_perd_2] [smallint] NULL,
	[pat_unvl_strt_perd_3] [datetime] NULL,
	[pat_unvl_end_perd_3] [datetime] NULL,
	[pat_unvl_xpln_id_perd_3] [smallint] NULL,
	[orbs_book_id] [int] NULL,
	[rha_case_no] [char](15) NULL,
	[rqst_date] [datetime] NULL,
	[refr_date] [datetime] NULL,
	[spr_refr_md_id] [int] NULL,
	[spr_srgn_id] [int] NULL,
	[rha_srgn_alt_id] [char](10) NULL,
	[init_srgn_vsit_date] [datetime] NULL,
	[prim_proc_code] [char](15) NULL,
	[scnd_proc_code_1] [char](15) NULL,
	[scnd_proc_code_2] [char](15) NULL,
	[scnd_proc_code_3] [char](15) NULL,
	[free_text_desc] [varchar](255) NULL,
	[free_text_desc_1] [varchar](255) NULL,
	[free_text_desc_2] [varchar](255) NULL,
	[free_text_desc_3] [varchar](255) NULL,
	[side] [tinyint] NULL,
	[side_1] [tinyint] NULL,
	[side_2] [tinyint] NULL,
	[side_3] [tinyint] NULL,
	[fac_id] [int] NULL,
	[proc_list_id] [int] NULL,
	[enct_type_list_id] [int] NULL,
	[enct_type_code] [varchar](10) NULL,
	[surg_schd_date] [datetime] NULL,
	[surg_defr_date] [datetime] NULL,
	[postpone_list_id] [int] NULL,
	[postpone_reason_code] [varchar](10) NULL,
	[cancel_list_id] [int] NULL,
	[cancel_reason_code] [varchar](10) NULL,
	[surg_iatv_date] [datetime] NULL,
	[spr_surg_iatv_xpln_id] [smallint] NULL,
	[spr_surg_stat_id] [smallint] NULL,
	[surg_case_xpln] [varchar](255) NULL,
	[diagnosis] [varchar](500) NULL,
	[city] [varchar](30) NULL,
	[post_code] [char](6) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_surg_case] PRIMARY KEY CLUSTERED 
(
	[surg_case_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_case]') AND name = N'idx_booking_date')
CREATE NONCLUSTERED INDEX [idx_booking_date] ON [spr_surg_case] 
(
	[rqst_date] ASC,
	[rha_id] ASC
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_case]') AND name = N'idx_booking_eval_id')
CREATE NONCLUSTERED INDEX [idx_booking_eval_id] ON [spr_surg_case] 
(
	[pat_eval_id] ASC
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_case]') AND name = N'idx_fac_or_booking_id')
CREATE UNIQUE NONCLUSTERED INDEX [idx_fac_or_booking_id] ON [spr_surg_case] 
(
	[fac_id] ASC,
	[orbs_book_id] ASC
) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_surg_case]') AND name = N'IX_spr_surg_case_hsn')
CREATE NONCLUSTERED INDEX [IX_spr_surg_case_hsn] ON [spr_surg_case] 
(
	[spr_pat_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_surg_case].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_post_code_rha_xref]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_post_code_rha_xref](
	[post_code] [char](7) NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_post_code_rha_xref] PRIMARY KEY CLUSTERED 
(
	[post_code] ASC,
	[rha_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_post_code_rha_xref].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_postpone_reason_list]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_postpone_reason_list](
	[postpone_reason_list_id] [int] IDENTITY(1,1) NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[postpone_reason_list_desc] [varchar](100) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
 CONSTRAINT [PK_spr_postpone_reason_list] PRIMARY KEY CLUSTERED 
(
	[postpone_reason_list_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_postpone_reason_list].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_md_ref]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_md_ref](
	[rha_id] [smallint] NOT NULL,
	[ref_md_id] [int] NOT NULL,
	[md_name] [varchar](50) NOT NULL,
	[msp_id] [int] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_md_ref] PRIMARY KEY CLUSTERED 
(
	[rha_id] ASC,
	[ref_md_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_md_ref].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_rha_enct_type_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_rha_enct_type_defn](
	[enct_type_list_id] [int] NOT NULL,
	[rha_enct_type_code] [varchar](10) NOT NULL,
	[rha_enct_type_desc] [varchar](100) NOT NULL,
	[spr_enct_type_code] [char](10) NOT NULL,
	[eff_date] [smalldatetime] NULL,
	[exp_date] [smalldatetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_rha_enct_type_defn] PRIMARY KEY CLUSTERED 
(
	[enct_type_list_id] ASC,
	[rha_enct_type_code] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_rha_enct_type_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_rha_cancel_reason_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_rha_cancel_reason_defn](
	[cancel_list_id] [int] NOT NULL,
	[rha_cancel_code] [varchar](10) NOT NULL,
	[rha_cancel_reason] [varchar](100) NOT NULL,
	[spr_cancel_code] [char](10) NOT NULL,
	[eff_date] [smalldatetime] NULL,
	[exp_date] [smalldatetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_rha_cancel_reason_defn_1] PRIMARY KEY CLUSTERED 
(
	[cancel_list_id] ASC,
	[rha_cancel_code] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_rha_cancel_reason_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_eval_qstn_choi]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_eval_qstn_choi](
	[spr_eval_id] [int] NOT NULL,
	[qstn_id] [int] NOT NULL,
	[qstn_part] [char](2) NOT NULL,
	[choi_no] [smallint] NOT NULL,
	[choi_labl] [varchar](255) NULL,
	[choi_valu] [smallint] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_eval_qstn_choi] PRIMARY KEY CLUSTERED 
(
	[spr_eval_id] ASC,
	[qstn_id] ASC,
	[qstn_part] ASC,
	[choi_no] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_eval_qstn_choi].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_rpt_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_rpt_defn](
	[rpt_id] [int] NOT NULL,
	[titl] [varchar](100) NOT NULL,
	[rpt_desc] [varchar](512) NULL,
	[rpt_cat_id] [int] NULL,
	[sql] [varchar](4000) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_xsys_rpt_defn] PRIMARY KEY CLUSTERED 
(
	[rpt_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_xsys_rpt_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_rha_proc]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_rha_proc](
	[proc_xref_id] [int] IDENTITY(1,1) NOT NULL,
	[proc_list_id] [int] NOT NULL,
	[rha_proc_code] [char](15) NOT NULL,
	[rha_proc_desc] [varchar](255) NOT NULL,
	[spr_proc_id] [char](15) NOT NULL,
	[eff_date] [smalldatetime] NOT NULL,
	[exp_date] [smalldatetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
 CONSTRAINT [PK_spr_rha_proc_1] PRIMARY KEY CLUSTERED 
(
	[proc_list_id] ASC,
	[rha_proc_code] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_rha_proc]') AND name = N'idx_proc_xref_id')
CREATE UNIQUE NONCLUSTERED INDEX [idx_proc_xref_id] ON [spr_rha_proc] 
(
	[proc_xref_id] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_rha_proc].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_eval_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_eval_defn](
	[spr_eval_id] [int] NOT NULL,
	[spr_surg_serv_id] [smallint] NULL,
	[spr_eval_titl] [varchar](255) NOT NULL,
	[eff_date] [datetime] NOT NULL,
	[exp_date] [datetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_eval_defn] PRIMARY KEY CLUSTERED 
(
	[spr_eval_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_eval_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_proc_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_proc_defn](
	[spr_proc_id] [char](15) NOT NULL,
	[spr_surg_serv_id] [smallint] NULL,
	[spr_proc_desc] [varchar](255) NOT NULL,
	[proc_rang_lo] [int] NULL,
	[proc_rang_hi] [int] NULL,
	[side_rqrd] [char](1) NULL,
	[eff_date] [datetime] NOT NULL,
	[exp_date] [datetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_proc] PRIMARY KEY CLUSTERED 
(
	[spr_proc_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_proc_defn]') AND name = N'idx_proc_eff_date')
CREATE NONCLUSTERED INDEX [idx_proc_eff_date] ON [spr_proc_defn] 
(
	[eff_date] ASC,
	[exp_date] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_proc_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_user_grp_xref]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_user_grp_xref](
	[grp_id] [varchar](25) NOT NULL,
	[user_id] [varchar](25) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_xsys_user_grp_xref] PRIMARY KEY CLUSTERED 
(
	[grp_id] ASC,
	[user_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_xsys_user_grp_xref].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_eval_qstn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_eval_qstn](
	[spr_eval_id] [int] NOT NULL,
	[qstn_id] [int] NOT NULL,
	[qstn_labl] [varchar](512) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_eval_qstn] PRIMARY KEY CLUSTERED 
(
	[spr_eval_id] ASC,
	[qstn_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_eval_qstn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_rha_postpone_reason_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_rha_postpone_reason_defn](
	[postpone_list_id] [int] NOT NULL,
	[rha_postpone_code] [varchar](10) NOT NULL,
	[rha_postpone_reason] [varchar](100) NOT NULL,
	[spr_postpone_code] [char](10) NOT NULL,
	[eff_date] [smalldatetime] NULL,
	[exp_date] [smalldatetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_rha_postpone_reason_defn_1] PRIMARY KEY CLUSTERED 
(
	[postpone_list_id] ASC,
	[rha_postpone_code] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_rha_postpone_reason_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_err_grp_xref]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_err_grp_xref](
	[err_id] [smallint] NOT NULL,
	[grp_id] [varchar](25) NOT NULL,
	[err_ovrd_allw] [char](1) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_xsys_err_grp_xref] PRIMARY KEY CLUSTERED 
(
	[err_id] ASC,
	[grp_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_xsys_err_grp_xref].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_err]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_err](
	[err_id] [smallint] NOT NULL,
	[err_fld_name] [varchar](30) NOT NULL,
	[spr_pat_id] [char](10) NOT NULL,
	[rha_id] [smallint] NOT NULL,
	[name_last] [varchar](50) NULL,
	[name_given_1] [varchar](50) NULL,
	[sex] [tinyint] NULL,
	[born_date] [datetime] NULL,
	[post_code] [char](7) NULL,
	[err_sevr_id] [int] NULL,
	[err_ovrd_flag] [char](1) NULL,
	[err_desc] [varchar](255) NULL,
	[err_detl] [varchar](2000) NULL,
	[err_prev_valu] [varchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
 CONSTRAINT [PK_spr_pat_err] PRIMARY KEY CLUSTERED 
(
	[err_id] ASC,
	[err_fld_name] ASC,
	[spr_pat_id] ASC,
	[rha_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_pat_err].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_rpt_grp_xref]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_rpt_grp_xref](
	[grp_id] [varchar](25) NOT NULL,
	[rpt_id] [int] NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_xsys_rpt_grp_xref] PRIMARY KEY CLUSTERED 
(
	[grp_id] ASC,
	[rpt_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_xsys_rpt_grp_xref].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_surg_post_op_err]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_surg_post_op_err](
	[surg_post_op_id] [bigint] NOT NULL,
	[err_id] [smallint] NOT NULL,
	[err_fld_name] [varchar](30) NOT NULL,
	[surg_cmpl_date] [datetime] NULL,
	[fac_id] [int] NULL,
	[spr_pat_id] [char](12) NULL,
	[spr_pat_id_type] [smallint] NULL,
	[err_sevr_id] [int] NOT NULL,
	[err_ovrd_flag] [char](1) NULL,
	[err_desc] [varchar](255) NULL,
	[err_detl] [varchar](2000) NULL,
	[err_prev_valu] [varchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
 CONSTRAINT [PK_spr_surg_post_op_err] PRIMARY KEY CLUSTERED 
(
	[surg_post_op_id] ASC,
	[err_id] ASC,
	[err_fld_name] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_surg_post_op_err].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_surg_case_err]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_surg_case_err](
	[surg_case_id] [bigint] NOT NULL,
	[err_id] [smallint] NOT NULL,
	[err_fld_name] [varchar](30) NOT NULL,
	[err_sevr_id] [int] NULL,
	[err_ovrd_flag] [char](1) NULL,
	[err_desc] [varchar](255) NULL,
	[err_detl] [varchar](2000) NULL,
	[err_prev_valu] [varchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
 CONSTRAINT [PK_spr_surg_case_err] PRIMARY KEY CLUSTERED 
(
	[surg_case_id] ASC,
	[err_id] ASC,
	[err_fld_name] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_surg_case_err].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_province]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_province](
	[province_code] [char](3) NOT NULL,
	[province] [varchar](50) NOT NULL,
	[row_eff_user_id] [varchar](100) NOT NULL,
	[row_eff_date] [datetime] NOT NULL,
 CONSTRAINT [PK_spr_province] PRIMARY KEY CLUSTERED 
(
	[province_code] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_province].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_access_log]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_access_log](
	[log_date_time] [datetime] NOT NULL,
	[user_id] [varchar](100) NOT NULL,
	[rha_id] [smallint] NULL,
	[fac_id] [int] NULL,
	[patient_phn] [char](10) NULL,
	[patient_rha] [smallint] NULL,
	[patient_fac_id] [int] NULL,
	[action] [varchar](20) NULL,
	[action_location] [varchar](255) NULL,
	[action_parameters] [varchar](1000) NULL
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[spr_xsys_access_log]') AND name = N'idx_spr_xsys_access_log')
CREATE CLUSTERED INDEX [idx_spr_xsys_access_log] ON [spr_xsys_access_log] 
(
	[log_date_time] ASC,
	[user_id] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_xsys_access_log].[user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_data_dict]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_data_dict](
	[tble_name] [varchar](50) NOT NULL,
	[col_name] [varchar](50) NOT NULL,
	[xpln] [varchar](2000) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_xsys_data_dict] PRIMARY KEY CLUSTERED 
(
	[tble_name] ASC,
	[col_name] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_xsys_data_dict].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_alt_id_type]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_alt_id_type](
	[alt_pat_id_type] [char](10) NOT NULL,
	[alt_pat_id_type_desc] [varchar](100) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_pat_id_type] PRIMARY KEY CLUSTERED 
(
	[alt_pat_id_type] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_pat_alt_id_type].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_postpone_reason_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_postpone_reason_defn](
	[spr_postpone_code] [char](10) NOT NULL,
	[spr_postpone_reason] [varchar](50) NULL,
	[eff_date] [smalldatetime] NULL,
	[exp_date] [smalldatetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
 CONSTRAINT [PK_spr_defr_xpln_defn] PRIMARY KEY CLUSTERED 
(
	[spr_postpone_code] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_postpone_reason_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_err_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_err_defn](
	[err_id] [smallint] NOT NULL,
	[err_desc] [varchar](255) NULL,
	[err_sevr_id] [int] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_xsys_err_defn] PRIMARY KEY CLUSTERED 
(
	[err_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_xsys_err_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_eval_err]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_eval_err](
	[pat_eval_id] [bigint] NOT NULL,
	[err_id] [smallint] NOT NULL,
	[err_fld_name] [varchar](30) NOT NULL,
	[err_sevr_id] [int] NULL,
	[err_ovrd_flag] [char](1) NULL,
	[err_desc] [varchar](255) NULL,
	[err_detl] [varchar](2000) NULL,
	[err_prev_valu] [varchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
 CONSTRAINT [PK_spr_pat_eval_err] PRIMARY KEY CLUSTERED 
(
	[pat_eval_id] ASC,
	[err_id] ASC,
	[err_fld_name] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_pat_eval_err].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_surg_serv_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_surg_serv_defn](
	[spr_surg_serv_id] [smallint] NOT NULL,
	[spr_surg_serv_desc] [varchar](100) NOT NULL,
	[eff_date] [datetime] NOT NULL,
	[exp_date] [datetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_surg_serv_code] PRIMARY KEY CLUSTERED 
(
	[spr_surg_serv_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_surg_serv_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_providers]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_providers](
	[provider_id] [int] NOT NULL,
	[provider] [nvarchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_providers] PRIMARY KEY CLUSTERED 
(
	[provider_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_providers].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_user]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_user](
	[user_id] [varchar](25) NOT NULL,
	[user_name]  AS (([user_first_name]+' ')+[user_last_name]),
	[user_first_name] [varchar](30) NULL,
	[user_last_name] [varchar](30) NULL,
	[user_pwd] [varchar](25) NOT NULL,
	[user_fac_id] [int] NULL,
	[rha_id] [smallint] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_xsys_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_xsys_user].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_surg_stat_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_surg_stat_defn](
	[spr_surg_stat_id] [smallint] NOT NULL,
	[spr_surg_stat_desc] [varchar](100) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_surg_stat_defn] PRIMARY KEY CLUSTERED 
(
	[spr_surg_stat_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_surg_stat_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_iact_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_iact_defn](
	[spr_iact_type_id] [smallint] NOT NULL,
	[spr_iact_type_desc] [varchar](50) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_iact_defn] PRIMARY KEY CLUSTERED 
(
	[spr_iact_type_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_iact_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_inac_assm_xpln_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_inac_assm_xpln_defn](
	[spr_defr_xpln_id] [smallint] NOT NULL,
	[spr_defr_xpln_desc] [varchar](50) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_inac_assm_xpln_defn] PRIMARY KEY CLUSTERED 
(
	[spr_defr_xpln_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_inac_assm_xpln_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_eval_answ]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_eval_answ](
	[pat_eval_id] [bigint] NOT NULL,
	[qstn_id] [int] NOT NULL,
	[qstn_part] [char](2) NOT NULL,
	[choi_no] [smallint] NULL,
	[text_answ_valu] [varchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_pat_eval_answ] PRIMARY KEY CLUSTERED 
(
	[pat_eval_id] ASC,
	[qstn_id] ASC,
	[qstn_part] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_pat_eval_answ].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_eval_answ_err]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_eval_answ_err](
	[pat_eval_id] [bigint] NOT NULL,
	[qstn_id] [int] NOT NULL,
	[qstn_part] [char](2) NOT NULL,
	[err_id] [smallint] NOT NULL,
	[err_fld_name] [varchar](20) NOT NULL,
	[err_sevr_id] [int] NULL,
	[err_ovrd_flag] [char](1) NULL,
	[err_desc] [varchar](255) NULL,
	[err_detl] [varchar](2000) NULL,
	[err_prev_valu] [varchar](255) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
 CONSTRAINT [PK_spr_pat_eval_answ_err] PRIMARY KEY CLUSTERED 
(
	[pat_eval_id] ASC,
	[qstn_id] ASC,
	[qstn_part] ASC,
	[err_id] ASC,
	[err_fld_name] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_pat_eval_answ_err].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_web_page_grp_xref]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_web_page_grp_xref](
	[page_url] [varchar](255) NOT NULL,
	[grp_id] [varchar](25) NOT NULL,
	[add_flag] [char](1) NOT NULL,
	[chng_flag] [char](1) NOT NULL,
	[del_flag] [char](1) NOT NULL,
	[qry_flag] [char](1) NOT NULL,
	[x_qry_flag] [char](1) NOT NULL,
	[upld_flag] [char](1) NOT NULL,
	[fld_acss] [varchar](255) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_xsys_web_page_grp_xref] PRIMARY KEY CLUSTERED 
(
	[page_url] ASC,
	[grp_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_xsys_web_page_grp_xref].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_sex]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_sex](
	[sex_id] [tinyint] NOT NULL,
	[sex_desc] [varchar](10) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_sex] PRIMARY KEY CLUSTERED 
(
	[sex_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_sex].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_pat_unvl_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_pat_unvl_defn](
	[spr_pat_unvl_id] [smallint] NOT NULL,
	[spr_pat_unvl_desc] [varchar](100) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_pat_unvl_defn] PRIMARY KEY CLUSTERED 
(
	[spr_pat_unvl_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_pat_unvl_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_rha_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_rha_defn](
	[rha_id] [smallint] NOT NULL,
	[rha_desc] [varchar](255) NOT NULL,
	[eff_date] [datetime] NOT NULL,
	[exp_date] [datetime] NULL,
	[ou_desc] [varchar](20) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_rha_defn] PRIMARY KEY CLUSTERED 
(
	[rha_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_rha_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_enct_type_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_enct_type_defn](
	[spr_enct_type_code] [char](10) NOT NULL,
	[spr_enct_type_desc] [varchar](50) NOT NULL,
	[eff_date] [smalldatetime] NOT NULL,
	[exp_date] [smalldatetime] NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_enct_type_defn] PRIMARY KEY CLUSTERED 
(
	[spr_enct_type_code] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_enct_type_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_side]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_side](
	[side_id] [tinyint] NOT NULL,
	[side_desc] [varchar](10) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_side] PRIMARY KEY CLUSTERED 
(
	[side_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_side].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_spec_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_spec_defn](
	[md_spec_id] [int] NOT NULL,
	[md_spec_desc] [varchar](100) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_spec_defn] PRIMARY KEY CLUSTERED 
(
	[md_spec_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_spec_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_rpt_cat_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_rpt_cat_defn](
	[rpt_cat_id] [int] NOT NULL,
	[rpt_cat_desc] [varchar](50) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_xsys_rpt_cat_defn] PRIMARY KEY CLUSTERED 
(
	[rpt_cat_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_xsys_rpt_cat_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_xsys_grp_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_xsys_grp_defn](
	[grp_id] [varchar](25) NOT NULL,
	[grp_desc] [varchar](50) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_xsys_grp_defn] PRIMARY KEY CLUSTERED 
(
	[grp_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_xsys_grp_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_spec_postal_code]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_spec_postal_code](
	[postal_code] [char](6) NOT NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_spr_spec_postal_code] PRIMARY KEY CLUSTERED 
(
	[postal_code] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_spec_postal_code].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_assm_stat_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_assm_stat_defn](
	[assm_stat_id] [smallint] IDENTITY(1,1) NOT NULL,
	[assm_stat_desc] [varchar](100) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
 CONSTRAINT [PK_assm_stat_defn] PRIMARY KEY CLUSTERED 
(
	[assm_stat_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_assm_stat_defn].[row_eff_user_id]' , @futureonly='futureonly'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[spr_wait_list_cat_defn]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [spr_wait_list_cat_defn](
	[spr_wait_list_cat_id] [smallint] NOT NULL,
	[spr_wait_list_cat_desc] [varchar](50) NULL,
	[min_perc] [float] NULL,
	[cncr] [char](1) NULL,
	[row_eff_user_id] [varchar](100) NULL,
	[row_eff_date] [datetime] NULL,
	[row_id] [int] IDENTITY(1,1) NOT NULL,
	[max_days] [int] NULL,
	[trgt_perc] [int] NULL,
 CONSTRAINT [PK_spr_wait_list_cat_defn] PRIMARY KEY CLUSTERED 
(
	[spr_wait_list_cat_id] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC dbo.sp_bindefault @defname=N'[user_id_dflt]', @objname=N'[spr_wait_list_cat_defn].[row_eff_user_id]' , @futureonly='futureonly'
