


-- get database size from v$datafile:

select round((sum(bytes)/1048576/1024),2) from v$datafile;

-- get Oracle database size from dba_data_files:
select
"Reserved_Space(MB)", "Reserved_Space(MB)" - "Free_Space(MB)" "Used_Space(MB)","Free_Space(MB)"
from(
select 
(select sum(bytes/(1014*1024)) from dba_data_files) "Reserved_Space(MB)",
(select sum(bytes/(1024*1024)) from dba_free_space) "Free_Space(MB)"
from dual
);

2 - The size of the sum of table extents

select 
   segment_name table_name, 
   sum(bytes)/(1024*1024) table_size_meg 
from 
   user_extents 
where 
   segment_type='TABLE' 
and 
   segment_name = 'MYTAB' 
group 