 create user Gcservapp for LOGIN [Gcservapp]
create user Gcservint for Login Gcservint

exec sp_addrolemember 'db_datareader','Gcservapp'
exec sp_addrolemember 'db_datawriter','Gcservapp'

exec sp_addrolemember 'db_datareader','Gcservint'
exec sp_addrolemember 'db_datawriter','Gcservint'

exec sp_addrolemember 'db_owner','PHSABC\alin'
exec sp_addrolemember 'db_owner','PHSABC\mping'
exec sp_addrolemember 'db_owner','PHSABC\PHSA_GetCheckedBC'
exec sp_addrolemember 'db_owner','PHSABC\svc_GCspFarm'
exec sp_addrolemember 'db_owner','PHSABC\v-spotsolutions'


