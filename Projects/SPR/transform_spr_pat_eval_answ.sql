SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
GO
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
