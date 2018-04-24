select servername, count(*)
from currentDb
--where servername not like 'z%'
group by servername
with rollup
order by count(*)
desc

select * from currentdb order by convert(decimal(10,3),db_size) desc

select servername, sum(convert(decimal(10,3),db_size)) 
from currentdb
--where servername not like 'z%'
group by servername
with rollup
order by sum(convert(decimal(10,3),db_size)) 
desc


select * from currentdb where dbname like 'sh%'