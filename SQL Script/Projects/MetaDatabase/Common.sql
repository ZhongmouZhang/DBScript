 select * from metadata.dbo.helpdb
where eventdate = (select max(eventdate) from metadata.dbo.helpdb)


delete from metadata.dbo.helpdb
where eventdate < (select max(eventdate) from metadata.dbo.helpdb)


select * from metadata.dbo.helpdb m 
where eventdate = 
 (select max(eventdate) from metadata.dbo.helpdb s where m.servername=s.serverna
 me and m.dbname=s.dbname)
 
 
 
 select name from master.sys.servers s
where not exists (select * from serverlist where rtrim(s.name)=rtrim(serverlist.servername))

 select * from helpdb a join serverlist b on a.servername=b.servername
where groupname = 'PeopleSoft'
order by a.servername
