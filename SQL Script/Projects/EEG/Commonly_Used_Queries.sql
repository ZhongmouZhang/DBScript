
-- ignore the first two minutes and the continuous monitor is more than five minutes
select * from [dbo].[vw_stamp_gap_with_second] m
where scan_datetime_end > (select dateadd ( second, 120, min(scan_datetime_begin)) from [vw_stamp_gap_with_second] where file_name = m.file_name)
	and seconds > 300


-- check the frame/second
select file_name, scan_datetime, count(*)
from [dbo].[tbl_scan_data]
group by file_name, scan_datetime
order by file_name, scan_datetime

-- check the channel range

SELECT [file_name] , count(*) [count] 
      ,convert(decimal (15,2), min([C3_N])) [C3_N_min], convert(decimal (15,2),max([C3_N])) [C3_N_max]
        ,convert(decimal (15,2), stdev([C3_N])) [C3_N_stdev]
        ,convert(decimal (15,2), avg([C3_N])) [C3_N_avg]

      ,convert(decimal (15,2), min([C4_N])) [C4_N_min], convert(decimal (15,2),max([C4_N])) [C4_N_max]
        ,convert(decimal (15,2), stdev([C4_N])) [C4_N_stdev]
        ,convert(decimal (15,2), avg([C4_N])) [C4_N_avg]

      ,convert(decimal (15,2), min([CZ_N])) [CZ_N_min], convert(decimal (15,2),max([CZ_N])) [CZ_N_max]
        ,convert(decimal (15,2), stdev([CZ_N])) [CZ_N_stdev]
        ,convert(decimal (15,2), avg([CZ_N])) [CZ_N_avg]

      ,convert(decimal (15,2), min([F3_N])) [F3_N_min], convert(decimal (15,2),max([F3_N])) [F3_N_max]
        ,convert(decimal (15,2), stdev([F3_N])) [F3_N_stdev]
        ,convert(decimal (15,2), avg([F3_N])) [F3_N_avg]

      ,convert(decimal (15,2), min([F4_N])) [F4_N_min], convert(decimal (15,2),max([F4_N])) [F4_N_max]
        ,convert(decimal (15,2), stdev([F4_N])) [F4_N_stdev]
        ,convert(decimal (15,2), avg([F4_N])) [F4_N_avg]

      ,convert(decimal (15,2), min([F7_N])) [F7_N_min], convert(decimal (15,2),max([F7_N])) [F7_N_max]
        ,convert(decimal (15,2), stdev([F7_N])) [F7_N_stdev]
        ,convert(decimal (15,2), avg([F7_N])) [F7_N_avg]

      ,convert(decimal (15,2), min([F8_N])) [F8_N_min], convert(decimal (15,2),max([F8_N])) [F8_N_max]
        ,convert(decimal (15,2), stdev([F8_N])) [F8_N_stdev]
        ,convert(decimal (15,2), avg([F8_N])) [F8_N_avg]

      ,convert(decimal (15,2), min([FZ_N])) [FZ_N_min], convert(decimal (15,2),max([FZ_N])) [FZ_N_max]
        ,convert(decimal (15,2), stdev([FZ_N])) [FZ_N_stdev]
        ,convert(decimal (15,2), avg([FZ_N])) [FZ_N_avg]

      ,convert(decimal (15,2), min([FP1_N])) [FP1_N_min], convert(decimal (15,2),max([FP1_N])) [FP1_N_max]
        ,convert(decimal (15,2), stdev([FP1_N])) [FP1_N_stdev]
        ,convert(decimal (15,2), avg([FP1_N])) [FP1_N_avg]

      ,convert(decimal (15,2), min([FP2_N])) [FP2_N_min], convert(decimal (15,2),max([FP2_N])) [FP2_N_max]
        ,convert(decimal (15,2), stdev([FP2_N])) [FP2_N_stdev]
        ,convert(decimal (15,2), avg([FP2_N])) [FP2_N_avg]

      ,convert(decimal (15,2), min([O1_N])) [O1_N_min], convert(decimal (15,2),max([O1_N])) [O1_N_max]
        ,convert(decimal (15,2), stdev([O1_N])) [O1_N_stdev]
        ,convert(decimal (15,2), avg([O1_N])) [O1_N_avg]

      ,convert(decimal (15,2), min([O2_N])) [O2_N_min], convert(decimal (15,2),max([O2_N])) [O2_N_max]
        ,convert(decimal (15,2), stdev([O2_N])) [O2_N_stdev]
        ,convert(decimal (15,2), avg([O2_N])) [O2_N_avg]

      ,convert(decimal (15,2), min([P3_N])) [P3_N_min], convert(decimal (15,2),max([P3_N])) [P3_N_max]
        ,convert(decimal (15,2), stdev([P3_N])) [P3_N_stdev]
        ,convert(decimal (15,2), avg([P3_N])) [P3_N_avg]

      ,convert(decimal (15,2), min([P4_N])) [P4_N_min], convert(decimal (15,2),max([P4_N])) [P4_N_max]
        ,convert(decimal (15,2), stdev([P4_N])) [P4_N_stdev]
        ,convert(decimal (15,2), avg([P4_N])) [P4_N_avg]

      ,convert(decimal (15,2), min([PZ_N])) [PZ_N_min], convert(decimal (15,2),max([PZ_N])) [PZ_N_max]
        ,convert(decimal (15,2), stdev([PZ_N])) [PZ_N_stdev]
        ,convert(decimal (15,2), avg([PZ_N])) [PZ_N_avg]

      ,convert(decimal (15,2), min([T3_N])) [T3_N_min], convert(decimal (15,2),max([T3_N])) [T3_N_max]
        ,convert(decimal (15,2), stdev([T3_N])) [T3_N_stdev]
        ,convert(decimal (15,2), avg([T3_N])) [T3_N_avg]

      ,convert(decimal (15,2), min([T4_N])) [T4_N_min], convert(decimal (15,2),max([T4_N])) [T4_N_max]
        ,convert(decimal (15,2), stdev([T4_N])) [T4_N_stdev]
        ,convert(decimal (15,2), avg([T4_N])) [T4_N_avg]

      ,convert(decimal (15,2), min([T5_N])) [T5_N_min], convert(decimal (15,2),max([T5_N])) [T5_N_max]
        ,convert(decimal (15,2), stdev([T5_N])) [T5_N_stdev]
        ,convert(decimal (15,2), avg([T5_N])) [T5_N_avg]

      ,convert(decimal (15,2), min([T6_N])) [T6_N_min], convert(decimal (15,2),max([T6_N])) [T6_N_max]
        ,convert(decimal (15,2), stdev([T6_N])) [T6_N_stdev]
        ,convert(decimal (15,2), avg([T6_N])) [T6_N_avg]

  FROM [EEG_Data].[dbo].[vw_processed_eeg_scan]
  group by file_name
  order by file_name

----------------------------------------------------------------------------------------------------------
-- filter: skip the first two minutes. the data must be in the range of records being monitored more than 5 minutes continually

IF OBJECT_ID('tbl_stat_skip_first_120_sconds','U') is not null
	DROP table tbl_stat_skip_first_120_sconds
GO

SELECT m.[file_name] , count(*) [count] 
      ,convert(decimal (15,2), min([C3_N])) [C3_N_min], convert(decimal (15,2),max([C3_N])) [C3_N_max]
        ,convert(decimal (15,2), stdev([C3_N])) [C3_N_stdev]
        ,convert(decimal (15,2), avg([C3_N])) [C3_N_avg]

      ,convert(decimal (15,2), min([C4_N])) [C4_N_min], convert(decimal (15,2),max([C4_N])) [C4_N_max]
        ,convert(decimal (15,2), stdev([C4_N])) [C4_N_stdev]
        ,convert(decimal (15,2), avg([C4_N])) [C4_N_avg]

      ,convert(decimal (15,2), min([CZ_N])) [CZ_N_min], convert(decimal (15,2),max([CZ_N])) [CZ_N_max]
        ,convert(decimal (15,2), stdev([CZ_N])) [CZ_N_stdev]
        ,convert(decimal (15,2), avg([CZ_N])) [CZ_N_avg]

      ,convert(decimal (15,2), min([F3_N])) [F3_N_min], convert(decimal (15,2),max([F3_N])) [F3_N_max]
        ,convert(decimal (15,2), stdev([F3_N])) [F3_N_stdev]
        ,convert(decimal (15,2), avg([F3_N])) [F3_N_avg]

      ,convert(decimal (15,2), min([F4_N])) [F4_N_min], convert(decimal (15,2),max([F4_N])) [F4_N_max]
        ,convert(decimal (15,2), stdev([F4_N])) [F4_N_stdev]
        ,convert(decimal (15,2), avg([F4_N])) [F4_N_avg]

      ,convert(decimal (15,2), min([F7_N])) [F7_N_min], convert(decimal (15,2),max([F7_N])) [F7_N_max]
        ,convert(decimal (15,2), stdev([F7_N])) [F7_N_stdev]
        ,convert(decimal (15,2), avg([F7_N])) [F7_N_avg]

      ,convert(decimal (15,2), min([F8_N])) [F8_N_min], convert(decimal (15,2),max([F8_N])) [F8_N_max]
        ,convert(decimal (15,2), stdev([F8_N])) [F8_N_stdev]
        ,convert(decimal (15,2), avg([F8_N])) [F8_N_avg]

      ,convert(decimal (15,2), min([FZ_N])) [FZ_N_min], convert(decimal (15,2),max([FZ_N])) [FZ_N_max]
        ,convert(decimal (15,2), stdev([FZ_N])) [FZ_N_stdev]
        ,convert(decimal (15,2), avg([FZ_N])) [FZ_N_avg]

      ,convert(decimal (15,2), min([FP1_N])) [FP1_N_min], convert(decimal (15,2),max([FP1_N])) [FP1_N_max]
        ,convert(decimal (15,2), stdev([FP1_N])) [FP1_N_stdev]
        ,convert(decimal (15,2), avg([FP1_N])) [FP1_N_avg]

      ,convert(decimal (15,2), min([FP2_N])) [FP2_N_min], convert(decimal (15,2),max([FP2_N])) [FP2_N_max]
        ,convert(decimal (15,2), stdev([FP2_N])) [FP2_N_stdev]
        ,convert(decimal (15,2), avg([FP2_N])) [FP2_N_avg]

      ,convert(decimal (15,2), min([O1_N])) [O1_N_min], convert(decimal (15,2),max([O1_N])) [O1_N_max]
        ,convert(decimal (15,2), stdev([O1_N])) [O1_N_stdev]
        ,convert(decimal (15,2), avg([O1_N])) [O1_N_avg]

      ,convert(decimal (15,2), min([O2_N])) [O2_N_min], convert(decimal (15,2),max([O2_N])) [O2_N_max]
        ,convert(decimal (15,2), stdev([O2_N])) [O2_N_stdev]
        ,convert(decimal (15,2), avg([O2_N])) [O2_N_avg]

      ,convert(decimal (15,2), min([P3_N])) [P3_N_min], convert(decimal (15,2),max([P3_N])) [P3_N_max]
        ,convert(decimal (15,2), stdev([P3_N])) [P3_N_stdev]
        ,convert(decimal (15,2), avg([P3_N])) [P3_N_avg]

      ,convert(decimal (15,2), min([P4_N])) [P4_N_min], convert(decimal (15,2),max([P4_N])) [P4_N_max]
        ,convert(decimal (15,2), stdev([P4_N])) [P4_N_stdev]
        ,convert(decimal (15,2), avg([P4_N])) [P4_N_avg]

      ,convert(decimal (15,2), min([PZ_N])) [PZ_N_min], convert(decimal (15,2),max([PZ_N])) [PZ_N_max]
        ,convert(decimal (15,2), stdev([PZ_N])) [PZ_N_stdev]
        ,convert(decimal (15,2), avg([PZ_N])) [PZ_N_avg]

      ,convert(decimal (15,2), min([T3_N])) [T3_N_min], convert(decimal (15,2),max([T3_N])) [T3_N_max]
        ,convert(decimal (15,2), stdev([T3_N])) [T3_N_stdev]
        ,convert(decimal (15,2), avg([T3_N])) [T3_N_avg]

      ,convert(decimal (15,2), min([T4_N])) [T4_N_min], convert(decimal (15,2),max([T4_N])) [T4_N_max]
        ,convert(decimal (15,2), stdev([T4_N])) [T4_N_stdev]
        ,convert(decimal (15,2), avg([T4_N])) [T4_N_avg]

      ,convert(decimal (15,2), min([T5_N])) [T5_N_min], convert(decimal (15,2),max([T5_N])) [T5_N_max]
        ,convert(decimal (15,2), stdev([T5_N])) [T5_N_stdev]
        ,convert(decimal (15,2), avg([T5_N])) [T5_N_avg]

      ,convert(decimal (15,2), min([T6_N])) [T6_N_min], convert(decimal (15,2),max([T6_N])) [T6_N_max]
        ,convert(decimal (15,2), stdev([T6_N])) [T6_N_stdev]
        ,convert(decimal (15,2), avg([T6_N])) [T6_N_avg]
  into tbl_stat_skip_first_120_sconds
  FROM [EEG_Data].[dbo].[vw_processed_eeg_scan] m
	join ( select file_name, stamp_begin, stamp_end
			from [dbo].[vw_stamp_gap_with_second]
			where seconds > 300
		) r on m.file_name=r.file_name
	join vw_file_name_time_range v on v.file_name=m.file_name
  where m.stamp between r.stamp_begin and r.stamp_end 
	and m.scan_datetime between DATEADD(second, 120, v.datetime_begin) and v.datetime_end
  group by m.file_name
  order by m.file_name


-- check the count of positive data and negetive data in a selected training set
-- and it can be sampled by mod 2, 4 , or even 8
select count(*) positive, 5120/4-count(*) negetive
from ( select top 5120 * from [dbo].[vw_processed_eeg_scan] where file_name = 'B2' and stamp >= 719509 order by file_name, stamp) v
where C3_N >0 
	and stamp % 4 = 0


