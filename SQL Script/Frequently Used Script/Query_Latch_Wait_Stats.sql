
/******
 Three types of Latches: 1. I/O: PAGEIOLATCH
						 2. Buffer: PGAELATCH
						 3. non-buffer: LATCH

***********/

select * from sys.dm_os_wait_stats where wait_type like '%latch%' order by wait_type

select * from sys.dm_os_latch_stats;