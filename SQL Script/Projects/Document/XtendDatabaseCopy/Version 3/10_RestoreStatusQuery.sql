-- can only run on ZVMSQ2005\Meta instance

select  '79404cw' server_name, max(restore_date) latest_restore_date from [79404cw].msdb.dbo.restorehistory
union 
select  '79405cw' server_name, max(restore_date) latest_restore_date from [79405cw].msdb.dbo.restorehistory
union 
select  '79268cw' server_name, max(restore_date) latest_restore_date from [79268cw].msdb.dbo.restorehistory
union 
select  '79415cw' server_name, max(restore_date) latest_restore_date from [79415cw].msdb.dbo.restorehistory
union 
select  '79416cw' server_name, max(restore_date) latest_restore_date from [79416cw].msdb.dbo.restorehistory
union 
select  '79417cw' server_name, max(restore_date) latest_restore_date from [79417cw].msdb.dbo.restorehistory
union 
select  '79516phsait' server_name, max(restore_date) latest_restore_date from [79516phsait].msdb.dbo.restorehistory

