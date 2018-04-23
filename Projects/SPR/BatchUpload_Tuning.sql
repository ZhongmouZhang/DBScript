 CREATE NONCLUSTERED INDEX [NDX_spr_bp_feedback_head_pat_id] ON [dbo].[spr_bp_feedback_head] 
(
	pat_id
)
INCLUDE ( [fac_id]) 
GO