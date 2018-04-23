

DECLARE @pwd sysname
 
 -- Login: neo_user
SET @pwd = CONVERT (varbinary(256), 0x2131232D2632583F35543E583047392C)
if not exists (select name from master.dbo.sysxlogins where name='neo_user')
EXEC master..sp_addlogin 'neo_user', @pwd, @sid = 0x370028E739CED511AFD200104BCEF6C0, @encryptopt = 'skip_encryption'



-- Login: scn_user
SET @pwd = CONVERT (varbinary(256), 0x213122213D4C4A362250354034602729)
if not exists (select name from master.dbo.sysxlogins where name='scn_user')
EXEC master..sp_addlogin 'scn_user', @pwd, @sid = 0xFFB3AECD4FE3D411AFCA00104BCEF6C0, @encryptopt = 'skip_encryption'
