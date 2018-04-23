CREATE LOGIN [sfhr\lliou_sa] FROM WINDOWS; 
CREATE LOGIN [sfhr\jwei_sa] FROM WINDOWS;  
go

EXEC sp_addsrvrolemember 'sfhr\lliou_sa', 'sysadmin';  
EXEC sp_addsrvrolemember 'sfhr\jwei_sa', 'sysadmin';  

GO 

select @@SERVERNAME
exec sp_helpsrvrolemember