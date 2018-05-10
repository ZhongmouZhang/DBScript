


exec hsp_restore_latest_universal_backup @source_dbname='FHA_CABSTRACT',
	 @dest_dbname = 'FHA_CABSTRACT', 
	 @path = '\\SPDBSEDW002\SQL_Backup\FHA_CABSTRACT\', 
	 @with_clause = 'with replace, stats'
go


exec hsp_restore_latest_universal_backup @source_dbname='FHA_CPA',
	 @dest_dbname = 'FHA_CPA', 
	 @path = '\\SPDBSEDW002\SQL_Backup\FHA_CPA\', 
	 @with_clause = 'with replace, stats'
go



exec hsp_restore_latest_universal_backup @source_dbname='FHA_HBA',
	 @dest_dbname = 'FHA_HBA', 
	 @path = '\\SPDBSEDW002\SQL_Backup\FHA_HBA\', 
	 @with_clause = 'with replace, stats'
go


exec hsp_restore_latest_universal_backup @source_dbname='FHA_ICare',
	 @dest_dbname = 'FHA_ICare', 
	 @path = '\\SPDBSEDW002\SQL_Backup\FHA_CPA\', 
	 @with_clause = 'with replace, stats'
go


exec hsp_restore_latest_universal_backup @source_dbname='FHA_INTAKE',
	 @dest_dbname = 'FHA_INTAKE', 
	 @path = '\\SPDBSEDW002\SQL_Backup\FHA_INTAKE\', 
	 @with_clause = 'with replace, stats'
go

exec hsp_restore_latest_universal_backup @source_dbname='FHA_CPA',
	 @dest_dbname = 'FHA_CPA', 
	 @path = '\\SPDBSEDW002\SQL_Backup\FHA_CPA\', 
	 @with_clause = 'with replace, stats'
go

exec hsp_restore_latest_universal_backup @source_dbname='FHA_LOG',
	 @dest_dbname = 'FHA_LOG', 
	 @path = '\\SPDBSEDW002\SQL_Backup\FHA_LOG\', 
	 @with_clause = 'with replace, stats'
go

exec hsp_restore_latest_universal_backup @source_dbname='FHA_METRICS',
	 @dest_dbname = 'FHA_METRICS', 
	 @path = '\\SPDBSEDW002\SQL_Backup\FHA_METRICS\', 
	 @with_clause = 'with replace, stats'
go

exec hsp_restore_latest_universal_backup @source_dbname='FHA_OPR',
	 @dest_dbname = 'FHA_OPR', 
	 @path = '\\SPDBSEDW002\SQL_Backup\FHA_OPR\', 
	 @with_clause = 'with replace, stats'
go

exec hsp_restore_latest_universal_backup @source_dbname='FHA_PARISFIN',
	 @dest_dbname = 'FHA_PARISFIN', 
	 @path = '\\SPDBSEDW002\SQL_Backup\FHA_PARISFIN\', 
	 @with_clause = 'with replace, stats'
go

exec hsp_restore_latest_universal_backup @source_dbname='FHA_PARISFP',
	 @dest_dbname = 'FHA_PARISFP', 
	 @path = '\\SPDBSEDW002\SQL_Backup\FHA_PARISFP\', 
	 @with_clause = 'with replace, stats'
go

/**********
exec hsp_restore_latest_universal_backup @source_dbname='FHA_SAPI',
	 @dest_dbname = 'FHA_SAPI', 
	 @path = '\\SPDBSEDW002\SQL_Backup\FHA_SAPI\', 
	 @with_clause = 'with replace, stats'
go
***************/

exec hsp_restore_latest_universal_backup @source_dbname='IPeople_Dr',
	 @dest_dbname = 'IPeople_Dr', 
	 @path = '\\SPDBSEDW002\SQL_Backup\IPeople_Dr\', 
	 @with_clause = 'with replace, stats'
go

exec hsp_restore_latest_universal_backup @source_dbname='IPeople_Echo',
	 @dest_dbname = 'IPeople_Echo', 
	 @path = '\\SPDBSEDW002\SQL_Backup\IPeople_Echo\', 
	 @with_clause = 'with replace, stats'
go

exec hsp_restore_latest_universal_backup @source_dbname='IPeople_System',
	 @dest_dbname = 'IPeople_System', 
	 @path = '\\SPDBSEDW002\SQL_Backup\IPeople_System\', 
	 @with_clause = 'with replace, stats'
go


ALTER DATABASE FHA_CABSTRACT  
SET RECOVERY FULL
go

ALTER DATABASE IPeople_Echo  
SET RECOVERY FULL
go

ALTER DATABASE IPeople_System  
SET RECOVERY FULL
go


