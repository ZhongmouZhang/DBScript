  --Create V2 table if not exist
if NOT exists (select 1 from master.dbo.sysobjects where id = object_id(N'master.[dbo].[TBL_ConnectTracker]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
	CREATE TABLE [dbo].[TBL_ConnectTracker] (
		[hostname] [varchar] (25)  
		,[loginame] [varchar] (25)  
		,[dbid] [int] NULL 
		,[Firstlogin] [datetime] NULL 
		,[Lastlogin] [datetime] NULL 
		,[Program_Name] [varchar](255)) 

-- Insert any newly found connections [THIS FAILS with # columns supplied not matched up]
Insert into master.dbo.TBL_ConnectTracker
   select sp1.hostname, sp1.loginame, sp1.dbid , max(login_time) as 'FirstLogin', null as 'LastLogin' , null as 'Program_Name'
   from  master.dbo.sysprocesses sp1
where sp1.hostname <> '' and sp1.spid <> @@SPID
   and RTRIM(sp1.hostname) + ':' + RTRIM(sp1.Loginame) + '-' + convert(varchar,sp1.dbid) not in
      (Select RTRIM(hostname) + ':' + RTRIM(Loginame) + '-' + convert(varchar,dbid) from master.dbo.TBL_ConnectTracker)
group by sp1.hostname, sp1.loginame, sp1.dbid

--Update stats on any existing connections that are found
Update master.dbo.TBL_ConnectTracker
	Set LastLogin = sp.login_time, Program_Name = sp.Program_name
	FROM master.dbo.sysprocesses sp  JOIN master.dbo.TBL_ConnectTracker at on at.hostname = sp.hostname and at.loginame = sp.loginame and sp.dbid = at.dbid
	where sp.hostname <> ''

/***********

select hostname, loginame, db_name(dbid) database_name, firstlogin, lastlogin, program_name 
from master.dbo.TBL_connectTracker
where not loginame in ('PHSABC\x-james')
order by database_name, lastlogin desc


**************/