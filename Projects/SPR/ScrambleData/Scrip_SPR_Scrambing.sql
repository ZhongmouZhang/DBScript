 /********************************************************

	Scramble table md_quik_info

**********************************************************/
USE SPR_STG
go

print 'Scrmbling SPR_STG.dbo.md_quik_info_CH...'
print ''

IF OBJECT_ID ('SPR_STG.dbo.md_quik_info_CH') IS NOT NULL
  DROP table SPR_STG.dbo.md_quik_info_CH
GO

CREATE TABLE SPR_STG.[dbo].[md_quik_info_CH](
	[md_id] [int] NOT NULL,
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
) 

insert into SPR_STG.dbo.md_quik_info_CH
SELECT [md_id]) md_id
      ,Metadata.[dbo].[HFn_GetScrambledString]([md_no]) md_no
      ,Metadata.[dbo].[HFn_GetScrambledString]([clnc_no]) clnc_no
      ,Metadata.[dbo].[HFn_GetScrambledString]([md_lastname]) md_lastname
      ,Metadata.[dbo].[HFn_GetScrambledString]([md_given_name]) md_given_name
      ,Metadata.[dbo].[HFn_GetScrambledString]([addr_line_1]) addr_line_1
      ,Metadata.[dbo].[HFn_GetScrambledString]([addr_line_2]) addr_line_2
      ,Metadata.[dbo].[HFn_GetScrambledString]([cmty_desc])
      ,Metadata.[dbo].[HFn_GetScrambledString]([post_code])
      ,[prov]
      ,Metadata.[dbo].[HFn_GetScrambledString]([tel_no])
      ,Metadata.[dbo].[HFn_GetScrambledDate]([born_date])
      ,[sex]
      ,[spcl_desc]
      ,Metadata.[dbo].[HFn_GetScrambledString]([clnc_name])
      ,Metadata.[dbo].[HFn_GetScrambledString]([clnc_addr_line_1])
      ,Metadata.[dbo].[HFn_GetScrambledString]([clnc_addr_line_2])
		
      ,Metadata.[dbo].[HFn_GetScrambledString]([clnc_cmty_desc])
      ,[clnc_prov]
      ,Metadata.[dbo].[HFn_GetScrambledString]([clnc_post_code])
      ,Metadata.[dbo].[HFn_GetScrambledString]([clnc_tel_no])
      ,[run_date]
      ,[serv_prov_src]
      ,Metadata.[dbo].[HFn_GetScrambledString]([msp_id])
  FROM [SPR_STG].[dbo].[md_quik_info]

ALTER TABLE SPR_STG.[dbo].[md_quik_info_CH]
ADD  CONSTRAINT [PK_md_quik_info_CH] 
PRIMARY KEY CLUSTERED 
(
	[md_no] ASC
)

--select top 200 * from dbo.md_quik_info_CH

 /********************************************************

	Scramble table spr_bp_feedback_head, it will take 35 minutes

**********************************************************/
print 'Scrmbling spr_bp_feedback_head_CH...'
print ''



IF OBJECT_ID ('SPR_STG.dbo.spr_bp_feedback_head_CH') IS NOT NULL
  DROP table SPR_STG.dbo.spr_bp_feedback_head_CH
GO

CREATE TABLE SPR_STG.[dbo].[spr_bp_feedback_head_CH](
	[feedback_head_id] [bigint] NOT NULL,
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
) 

insert into [SPR_STG].[dbo].spr_bp_feedback_head_CH
SELECT [feedback_head_id]
      ,[feedback_record_type]
      ,[rha_id]
      ,[fac_id]
      ,Metadata.[dbo].[HFn_GetScrambledString]([pat_id])
      ,[orb_booking_no]
      ,[orb_case_no]
      ,[create_date]
      ,[pat_eval_id]
      ,[surg_case_id]
      ,[surg_post_op_id]
      ,[result_code]
      ,[result_msg]
      ,[orb_interface_data]
      ,[unused1]
      ,[unused2]
      ,[unused3]
      ,[unused4]
      ,[file_id]
      ,[row_id]
      ,[action_code]
      ,[fixed_date]
FROM [SPR_STG].[dbo].[spr_bp_feedback_head]

ALTER TABLE [dbo].[spr_bp_feedback_head_CH] 
ADD  CONSTRAINT [PK_spr_bp_feedback_head_CH] PRIMARY KEY CLUSTERED 
(
	[feedback_head_id] ASC
)

ALTER TABLE [dbo].[spr_bp_feedback_head_CH]  
ADD  CONSTRAINT [FK_spr_bp_feedback_head_CH_spr_bp_rha_file_process_log] FOREIGN KEY([file_id])
REFERENCES [dbo].[spr_bp_rha_file_process_log] ([file_id])
ON DELETE CASCADE



 /********************************************************

	Scramble table dbo.spr_bp_rha_booking_rec_in, it will take 1:47:05

**********************************************************/
print 'Scrmbling spr_bp_rha_booking_rec_in...'
print ''

IF OBJECT_ID ('spr_bp_rha_booking_rec_in_CH') IS NOT NULL
  DROP table SPR_STG.dbo.spr_bp_feedback_head_CH

CREATE TABLE SPR_STG.[dbo].[spr_bp_rha_booking_rec_in_CH](
	[row_id] [bigint] NOT NULL,
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
 CONSTRAINT [PK_spr_bp_HA_Book_Rec_In_CH] PRIMARY KEY CLUSTERED 
(
	[row_id] ASC
)
) ON [PRIMARY]


declare @rowid bigint, @max_rowid bigint

select @rowid=1, @max_rowid = max(row_id) from dbo.spr_bp_rha_booking_rec_in

while @rowid <= @max_rowid
begin 
	insert into SPR_STG.[dbo].[spr_bp_rha_booking_rec_in_CH]
	SELECT [row_id]
      ,[file_id]
      ,[ins_date]
      ,[processed_status]
      ,[processed_date]
      ,[src_create_date]
      ,[rec_type]
      ,[action_code]
      ,[surg_case_id]
      ,[orbs_book_id]
      ,Metadata.[dbo].[HFn_GetScrambledDate]([rqst_date])
      ,[rha_case_no]
      ,[rha_id]
      ,[fac_id]
      ,[pat_eval_id]
      ,Metadata.[dbo].[HFn_GetScrambledString]([pat_id])
      ,Metadata.[dbo].[HFn_GetScrambledString]([post_code])
      ,Metadata.[dbo].[HFn_GetScrambledString]([city])
      ,Metadata.[dbo].[HFn_GetScrambledDate]([decision_date])
      ,[is_cancer_related]
      ,[pat_unvl_start_perd_1]
      ,[pat_unvl_end_perd_1]
      ,[pat_unvl_xpln_id_perd_1]
      ,[pat_unvl_start_perd_2]
      ,[pat_unvl_end_perd_2]
      ,[pat_unvl_xpln_id_perd_2]
      ,[pat_unvl_start_perd_3]
      ,[pat_unvl_end_perd_3]
      ,[pat_unvl_xpln_id_perd_3]
      ,Metadata.[dbo].[HFn_GetScrambledDate]([refr_date])
      ,Metadata.[dbo].[HFn_GetScrambledDate]([init_srgn_visit_date])
      ,Metadata.[dbo].[HFn_GetScrambledString]([rha_srgn_alt_id])
      ,Metadata.[dbo].[HFn_GetScrambledString]([sscn_srgn_id])
      ,[prim_proc_code]
      ,[side]
      ,[free_text_desc]
      ,[scnd_proc_code_1]
      ,[side_1]
      ,[free_text_desc_1]
      ,[scnd_proc_code_2]
      ,[side_2]
      ,[free_text_desc_2]
      ,[scnd_proc_code_3]
      ,[side_3]
      ,[free_text_desc_3]
      ,[enct_type_code]
      ,Metadata.[dbo].[HFn_GetScrambledDate]([surg_schd_date])
      ,[surg_stat_id]
      ,Metadata.[dbo].[HFn_GetScrambledDate]([surg_defr_date])
      ,[cancel_reason_code]
      ,[postpone_reason_code]
      ,[surg_iatv_date]
      ,[surg_iatv_xpln_id]
      ,Metadata.[dbo].[HFn_GetScrambledString]([general_comments])
      ,[pre_operative_diagnosis]
      ,[unused1]
      ,[unused2]
      ,[unused3]
      ,[unused4]
      ,[orb_interface_data]
	FROM [SPR_STG].[dbo].[spr_bp_rha_booking_rec_in]	
	where row_id >=@rowid and row_id < @rowid + 1000

	print 'Row ID:' + convert(varchar, @rowid)
	set @rowid = @rowid + 1000
end

ALTER TABLE [dbo].[spr_bp_rha_booking_rec_in_CH]  
ADD  CONSTRAINT [FK_spr_bp_rha_booking_rec_in_CH_spr_bp_rha_file_process_log] FOREIGN KEY([file_id])
REFERENCES [dbo].[spr_bp_rha_file_process_log] ([file_id])
ON DELETE CASCADE




 /********************************************************

	Scramble table dbo.spr_bp_rha_pat_rec_in, it will take 35 minutes

**********************************************************/
print 'Scrmbling dbo.spr_bp_rha_pat_rec_in...'
print ''

IF OBJECT_ID ('SPR_STG.dbo.spr_bp_rha_pat_rec_in_CH') IS NOT NULL
  DROP table SPR_STG.dbo.spr_bp_rha_pat_rec_in_CH

CREATE TABLE [dbo].[spr_bp_rha_pat_rec_in_CH](
	[row_id] [bigint] NOT NULL,
	[file_id] [int] NOT NULL,
	[ins_date] [datetime] NOT NULL DEFAULT (getdate()),
	[processed_status] [smallint] NOT NULL DEFAULT ((0)),
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
 CONSTRAINT [PK_spr_bp_HA_Pat_Rec_In_CH] PRIMARY KEY CLUSTERED 
(
	[row_id] ASC
)
)


declare @rowid bigint, @max_rowid bigint

select @rowid=1, @max_rowid = max(row_id) from dbo.[spr_bp_rha_pat_rec_in]

while @rowid <= @max_rowid
begin 
	insert into [spr_bp_rha_pat_rec_in_CH]
	SELECT [row_id]
      ,[file_id]
      ,[ins_date]
      ,[processed_status]
      ,[processed_date]
      ,[src_create_date]
      ,[rec_type]
      ,[action_code]
      ,[rha_id]
      ,[fac_id]
      ,Metadata.[dbo].[HFn_GetScrambledString]([pat_id])
      ,[alt_pat_id_type]
      ,Metadata.[dbo].[HFn_GetScrambledString]([alt_pat_id])
      ,Metadata.[dbo].[HFn_GetScrambledString]([name_last])
      ,Metadata.[dbo].[HFn_GetScrambledString]([name_given_1])
      ,Metadata.[dbo].[HFn_GetScrambledString]([name_preferred])
      ,Metadata.[dbo].[HFn_GetScrambledString]([name_given_2])
      ,Metadata.[dbo].[HFn_GetScrambledString]([name_given_3])
      ,Metadata.[dbo].[HFn_GetScrambledDate]([born_date])
      ,[sex]
      ,Metadata.[dbo].[HFn_GetScrambledString]([addr_line_1])
      ,Metadata.[dbo].[HFn_GetScrambledString]([addr_line_2])
      ,Metadata.[dbo].[HFn_GetScrambledString]([addr_line_3])
      ,Metadata.[dbo].[HFn_GetScrambledString]([city])
      ,[prov_code]
      ,Metadata.[dbo].[HFn_GetScrambledString]([post_code])
      ,[tel_no_home_area]
      ,Metadata.[dbo].[HFn_GetScrambledString]([tel_no_home])
      ,[tel_no_work_area]
      ,Metadata.[dbo].[HFn_GetScrambledString]([tel_no_work])
      ,[tel_no_cell_area]
      ,Metadata.[dbo].[HFn_GetScrambledString]([tel_no_cell])
      ,Metadata.[dbo].[HFn_GetScrambledString]([ctac_name])
      ,Metadata.[dbo].[HFn_GetScrambledString]([ctac_addr_line_1])
      ,Metadata.[dbo].[HFn_GetScrambledString]([ctac_addr_line_2])
      ,Metadata.[dbo].[HFn_GetScrambledString]([ctac_addr_line_3])
      ,Metadata.[dbo].[HFn_GetScrambledString]([ctac_city])
      ,[ctac_prov_code]
      ,Metadata.[dbo].[HFn_GetScrambledString]([ctac_post_code])
      ,[ctac_tel_no_area]
      ,Metadata.[dbo].[HFn_GetScrambledString]([ctac_tel_no])
      ,[unused1]
      ,[unused2]
      ,[unused3]
      ,[unused4]
      ,[orb_interface_data]
  FROM [SPR_STG].[dbo].[spr_bp_rha_pat_rec_in]
	where row_id >=@rowid and row_id < @rowid + 1000

	print 'Row ID:' + convert(varchar, @rowid)
	set @rowid = @rowid + 1000
end


ALTER TABLE [dbo].[spr_bp_rha_pat_rec_in_CH]  
ADD  CONSTRAINT [FK_spr_bp_rha_pat_rec_in_CH_spr_bp_rha_file_process_log] 
FOREIGN KEY([file_id])
REFERENCES [dbo].[spr_bp_rha_file_process_log] ([file_id])
ON DELETE CASCADE
GO
