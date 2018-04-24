
select * from msdb.dbo.[sysjobsteps] where database_name like 'w%'


select name, isntname is_windows_account
from sys.sysusers where issqlrole=0 and hasdbaccess=1 and name <> 'dbo'

exec sp_helpdb


select name from master.[dbo].[sysdatabases] where name not in ('master', 'msdb', 'model','tempdb') order by name;


-- valid for SQL 2000
select name from master.[dbo].[sysxlogins] where name is not null order by name


select name from master.[sys].[syslogins] order by name

