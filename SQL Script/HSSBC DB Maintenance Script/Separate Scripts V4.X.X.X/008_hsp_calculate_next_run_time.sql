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


SET DATEFIRST 1

while exists (select * from dbo.tbl_maint_action 
				where ( next_start_date_time is null 
						or last_start_date_time >= next_start_date_time -- job got run successfully
						)
					and freq_type in ('daily','weekly','monthly_day','monthly_week_day')
			 )
begin
	select @id = min(id) 
	from dbo.tbl_maint_action 
	where ( next_start_date_time is null 
			or last_start_date_time >= next_start_date_time -- job got run successfully
			)
		and freq_type in ('daily','weekly','monthly_day','monthly_week_day')
	
	select	@freq_type= freq_type
			, @freq_interval = freq_interval
			, @freq_week_interval = freq_week_interval
			, @start_time = start_time
	from tbl_maint_action
	where id = @id

	-- set next start date time as today
	set @next_start_date_time = substring (convert (varchar (20), getdate(), 120), 1, 10) + ' ' + @start_time

	-- if the @start_time format is not correct, set the time to the midnight by default
	if @@ERROR != 0
	set @next_start_date_time = substring (convert (varchar (20), getdate(), 120), 1, 10) + ' 23:59:00'

	if (@freq_type = 'daily')
	begin
		if GETDATE() > @next_start_date_time
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)
	end
	else if @freq_type = 'weekly'
	begin
		if DATEPART(DW,@next_start_date_time)=@freq_interval
		begin
			if GETDATE() > @next_start_date_time
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end
		
		while  DATEPART(DW,@next_start_date_time)!=@freq_interval
			set @next_start_date_time = dateadd (day,1,@next_start_date_time)
	end
	else if @freq_type = 'monthly_day'
	begin
		if DATEPART(Day,@next_start_date_time)=@freq_interval
		begin
			if GETDATE() > @next_start_date_time
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end

		if @freq_interval=31   -- last day of month
		begin
			select @next_start_date_time = dbo.hfn_last_day_of_month(@next_start_date_time)
			set @next_start_date_time = substring (convert (varchar (20), @next_start_date_time, 120), 1, 10) + ' ' + @start_time
		end
		else
		begin
			while  DATEPART(Day,@next_start_date_time)!=@freq_interval
				set @next_start_date_time = dateadd (day,1,@next_start_date_time)
		end 
	end	
	else if @freq_type = 'monthly_week_day'
	begin
		-- set first day of next month
		set @next_start_date_time = DATEADD(dd,-(DAY(DATEADD(mm,1,@next_start_date_time))-1),DATEADD(mm,1,@next_start_date_time))

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


go
