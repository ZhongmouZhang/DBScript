1. Full backup SPR database

2. Copy the two database files onto Backup Drive and delete the db files on data drive

3. Copy back the db files to data drive

4. enlarge the size to 35GB

5. disable the backup job and set the recovery model to simple

6. Rebuild the database:

6.1 rebuild all the indexes on the tables

		alter index all on spr_bp_feedback_head                  -- big table
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_eval_qstn
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_eval_qstn_part
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_fac_defn
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_md
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_pat
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_pat_err
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_pat_eval
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_post_code_rha_xref
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_rha_cancel_reason_defn
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_rha_postpone_reason_defn
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_rha_proc
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_surg_case
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_surg_case_err
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_surg_post_op_err
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_xsys_err_defn
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_xsys_err_grp_xref
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_xsys_rpt_defn
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_xsys_rpt_grp_xref
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_xsys_user
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_xsys_user_grp_xref
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_xsys_user_rha_xref
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)

		alter index all on spr_xsys_web_page_grp_xref
		rebuild with (SORT_IN_TEMPDB=on, ONLINE=ON)



6.2 rebuild non-clustered indexes on the tables


6.3 add indexes on some of the tables

create  index IX_SPR_PAT_AUDT_PATID_RHAID on spr_pat_audt(spr_pat_id, rha_id)

create  index IX_SPR_PAT_EVAL_AUDT_ID on spr_pat_eval_audt (pat_eval_id)

create  index IX_SPR_SURG_CASE_AUDT_D on spr_surg_case_audt(surg_case_id)

create  index IX_SPR_SURG_POST_OP_AUDT_ID on spr_surg_post_op_audt (surg_post_op_id)


7. do another backup and set recovery model to full