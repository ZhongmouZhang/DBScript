use master
go


-- exec master.dbo.sp_performance_trace_sq2k_general 'D:\Performance_Trace\', 100, 20
-- SELECT * FROM :: fn_trace_getinfo(default)   -- check the trace jobs


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].sp_performance_trace_sq2k5_DuratinAndDB') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_performance_trace_sq2k5_DuratinAndDB
GO

CREATE         proc dbo.sp_performance_trace_sq2k5_DuratinAndDB

@path nvarchar(80),
@maxfilesize bigint,     -- MB
@monitor_duration int     -- minutes
as


-- Create a Queue
declare @rc int
declare @TraceID int

/********************************************************************

	Customize the following three parameters 

*********************************************************************/
--declare @maxfilesize bigint
--set @maxfilesize = 100   -- MB

declare @stop_time datetime
select @stop_time = dateadd(minute,@monitor_duration, getdate())

declare @filename nvarchar(128)
select @filename = @path
		+ @@servername + '_'
		+ convert(varchar,getdate(),112) + '_'
		+ RIGHT('00' + convert(varchar,datepart(hour,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(minute,getdate())), 2)
		+ RIGHT('00' + convert(varchar,datepart(second,getdate())), 2)

exec @rc = sp_trace_create @TraceID output, 0, @filename, @maxfilesize, @stop_time 
if (@rc != 0) goto error

-- Client side File and Table cannot be scripted

-- Set the events
declare @on bit
set @on = 1
exec sp_trace_setevent @TraceID, 10, 15, @on
exec sp_trace_setevent @TraceID, 10, 16, @on
exec sp_trace_setevent @TraceID, 10, 9, @on
exec sp_trace_setevent @TraceID, 10, 17, @on
exec sp_trace_setevent @TraceID, 10, 2, @on
exec sp_trace_setevent @TraceID, 10, 10, @on
exec sp_trace_setevent @TraceID, 10, 18, @on
exec sp_trace_setevent @TraceID, 10, 11, @on
exec sp_trace_setevent @TraceID, 10, 35, @on
exec sp_trace_setevent @TraceID, 10, 12, @on
exec sp_trace_setevent @TraceID, 10, 13, @on
exec sp_trace_setevent @TraceID, 10, 6, @on
exec sp_trace_setevent @TraceID, 10, 14, @on
exec sp_trace_setevent @TraceID, 12, 15, @on
exec sp_trace_setevent @TraceID, 12, 16, @on
exec sp_trace_setevent @TraceID, 12, 1, @on
exec sp_trace_setevent @TraceID, 12, 9, @on
exec sp_trace_setevent @TraceID, 12, 17, @on
exec sp_trace_setevent @TraceID, 12, 6, @on
exec sp_trace_setevent @TraceID, 12, 10, @on
exec sp_trace_setevent @TraceID, 12, 14, @on
exec sp_trace_setevent @TraceID, 12, 18, @on
exec sp_trace_setevent @TraceID, 12, 11, @on
exec sp_trace_setevent @TraceID, 12, 35, @on
exec sp_trace_setevent @TraceID, 12, 12, @on
exec sp_trace_setevent @TraceID, 12, 13, @on
exec sp_trace_setevent @TraceID, 13, 12, @on
exec sp_trace_setevent @TraceID, 13, 1, @on
exec sp_trace_setevent @TraceID, 13, 9, @on
exec sp_trace_setevent @TraceID, 13, 6, @on
exec sp_trace_setevent @TraceID, 13, 10, @on
exec sp_trace_setevent @TraceID, 13, 14, @on
exec sp_trace_setevent @TraceID, 13, 11, @on
exec sp_trace_setevent @TraceID, 13, 35, @on


-- Set the Filters
declare @intfilter int
declare @bigintfilter bigint

exec sp_trace_setfilter @TraceID, 10, 0, 7, N'SQL Server Profiler - ea01e8d0-8cec-49ee-9fb8-9eb83c82642a'
exec sp_trace_setfilter @TraceID, 10, 0, 1, N''
set @bigintfilter = 1000000
exec sp_trace_setfilter @TraceID, 13, 0, 4, @bigintfilter

exec sp_trace_setfilter @TraceID, 35, 1, 6, N'XtendConsole'
exec sp_trace_setfilter @TraceID, 35, 0, 1, N''
-- Set the trace status to start
exec sp_trace_setstatus @TraceID, 1

-- display trace id for future references
select TraceID=@TraceID
goto finish

error: 
select ErrorCode=@rc

finish: 
go
