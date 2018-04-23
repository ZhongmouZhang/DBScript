use [master]
go

/*********************************************************************

	the main stored procedure to call all the maintenace stored procedure
	based on the configuratin table.
	
**********************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'hsp_maint_control') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_maint_control
GO

-- hsp_TestCreateSubfolder '\\srvnetapp03\SQL_Back$\ZVMSQ2K801\', 'master'

CREATE         proc hsp_maint_control
as
declare @currenttime datetime
set @currenttime = getdate()

-- Is it the time for full backup
if exists 
	(select * from master.dbo.tbl_maint_setting
			where  parameter_name= '#full_backup_time' 
				and @currenttime between convert (datetime, CONVERT(varchar(30), @currenttime, 102) + ' ' + parameter_value + ':00')
							 and dateadd(minute, 10, convert (datetime, CONVERT(varchar(30), @currenttime, 102) + ' ' + parameter_value + ':00'))
	)
begin 
	exec dbo.hsp_full_backup_database 2,''  -- doing the backup based on the settting table
end

-- whether it needs a full backup for mirroring databases
exec hsp_mirror_db_failover_fullbackup


--