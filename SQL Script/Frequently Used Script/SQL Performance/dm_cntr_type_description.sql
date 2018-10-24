create function fn_cntr_type_description (@cntr_type bigint)
returns varchar(256)
as 
begin
	return (
		case @cntr_type 
			when 65792 then 'Absolute Meaning' 
			when 65536 then 'Absolute Meaning' 
			when 272696576 then 'Per Second counter and is Cumulative in Nature'
			when 1073874176 then 'Bulk Counter. To get correct value, this value needs to be divided by Base Counter value'
			when 537003264 then 'Bulk Counter. To get correct value, this value needs to be divided by Base Counter value' 
			when 1073939712 then 'PERF_LARGE_RAW_BASE, Base counter value' 
			else 'unknown'
		end
		)
end

go