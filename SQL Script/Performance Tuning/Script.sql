/**********************************************************
Every record from this DMV represents one page that you are currently storing in the buffer pool, 
so please be aware of this, when you are querying this DMV on machines with a larger amount of RAM. 

***********************************************************************************


SELECT
   DB_NAME(database_id), 
   SUM(free_space_in_bytes) / 1024 AS 'Free_KB'
FROM sys.dm_os_buffer_descriptors
WHERE database_id <> 32767
GROUP BY database_id
ORDER BY SUM(free_space_in_bytes) DESC
GO



/*******************
    Buffer size
****************************/

select COUNT(*)* 8/1024
from sys.dm_os_buffer_descriptors