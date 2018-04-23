


/*********************************************************************

	Switch the output file name 
	
**********************************************************************/

USE [master]
GO
IF OBJECTPROPERTY ( object_id('hsp_switch_job_output_file'),'IsProcedure') = 1
	DROP PROC hsp_switch_job_output_file
GO

CREATE PROC hsp_switch_job_output_file 
AS
declare @stt nvarchar(3000)
declare @path varchar(3000)
declare @file_name varchar(3000)

select @path = parameter_value 
from [master].[dbo].[tbl_maint_parameter] 
where parameter_name = '#job_output_folder'

set @stt = 'IF NOT EXIST "' + @path + '" md "' + @path + '"'
--print @stt
EXEC xp_cmdshell @stt

select @file_name = @path + 'output_log_' + convert(varchar,getdate(),112)+'_' 
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)
		+'.txt'
		
--print @file_name

EXEC msdb.dbo.sp_update_jobstep
    @job_name = N'DBA -- Databases Maintenance',
    @step_id=1, 
    @output_file_name = @file_name,
    @flags = 2

go
 