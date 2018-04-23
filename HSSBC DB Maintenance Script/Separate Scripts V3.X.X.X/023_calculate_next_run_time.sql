use [master]
go


if exists (select * from dbo.sysobjects where id = object_id(N'hsp_calculate_next_run_time') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure hsp_calculate_next_run_time
GO

CREATE         proc hsp_calculate_next_run_time

as
declare @id int
declare @freq_type varchar(32), @freq_interval int, @freq_week_interval int, @start_time varchar(8)
declare @next_start_date_time datetime
declare @week_in_month int

while exists (select * from dbo.tbl_maint_action 
				where next_start_date_time is null 
					or [status]='running'   -- job failed so the status did not get updated
					or last_start_date_time >= next_start_date_time -- job got run successfully
			 )
begin
	select @id = MIN(id) 
	from dbo.tbl_maint_action 
	where next_start_date_time is null 
		or [status]='running'
		or last_start_date_time >= next_start_date_time
	
	select	@freq_type= freq_type
			, @freq_interval = freq_interval
			, @freq_week_interval = freq_week_interval
			, @start_time = start_time
	from tbl_maint_action
	where ID = @id

	-- set next start date time as today
	set @next_start_date_time = substring (convert (varchar (20), getdate(), 120), 1, 10) + ' ' + @start_time

	if (@freq_type = 'Daily')
	begin
		if GETDATE() > @next_start_date_time
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)
	end
	else if @freq_type = 'Weekly'
	begin
		if DATEPART(DW,@next_start_date_time)=@freq_interval
		begin
			if GETDATE() > @next_start_date_time
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end
		
		while  DATEPART(DW,@next_start_date_time)!=@freq_interval
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)
	end
	else if @freq_type = 'Monthly_Day'
	begin
		if DATEPART(Day,@next_start_date_time)=@freq_interval
		begin
			if GETDATE() > @next_start_date_time
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end
		
		while  DATEPART(Day,@next_start_date_time)!=@freq_interval
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)
	end	
	else if @freq_type = 'Monthly_Week_Day'
	begin
		if dbo.hfn_week_number_in_month(@next_start_date_time) = @freq_week_interval
			 and DATEPART(DW,@next_start_date_time)=@freq_interval
		begin
			if GETDATE() > @next_start_date_time
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end
		
		while  dbo.hfn_week_number_in_month(@next_start_date_time) != @freq_week_interval
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)

		while  DATEPART(DW,@next_start_date_time)!=@freq_interval
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)
	end		
	
	update dbo.tbl_maint_action
	set next_start_date_time = @next_start_date_time
	where [id]=@id
end
