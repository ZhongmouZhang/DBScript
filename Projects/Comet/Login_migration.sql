 -- Login: ping_user
CREATE LOGIN [ping_user] WITH PASSWORD=0x0100725C0A66778EE776B28EE043DBD2B923CF871BBC2F441FBEFFEC23FD96D75030951677B0C7ABC15D16B79974 HASHED, CHECK_POLICY=OFF, SID=0x99DF3128B50A5D498B546FFB20A68D03
 
-- Login: ping_user_admin
CREATE LOGIN [ping_user_admin] WITH PASSWORD=0x0100EA471112009C978D45F816CB9963B0CC53321CBD966B7BB71DDCDE019ABA3A2C57535AC436BE4A917E311ABE HASHED, CHECK_POLICY=OFF, SID=0xAB560D105975F64FA3BD4FE1AB76DDEB


-- Login: PHSABC\WG_VIP_db_Admin
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE [name] = 'PHSABC\WG_VIP_db_Admin')
	CREATE LOGIN [PHSABC\WG_VIP_db_Admin] FROM WINDOWS
 
-- Login: PHSABC\WG_VIP_db_Edit
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE [name] = 'PHSABC\WG_VIP_db_Edit')
	CREATE LOGIN [PHSABC\WG_VIP_db_Edit] FROM WINDOWS
 
-- Login: PHSABC\WG_VIP_db_Read
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE [name] = 'PHSABC\WG_VIP_db_Read')
	CREATE LOGIN [PHSABC\WG_VIP_db_Read] FROM WINDOWS


-- Login: PHSABC\WG_SEDATION
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE [name] = 'PHSABC\WG_SEDATION')
	CREATE LOGIN [PHSABC\WG_SEDATION] FROM WINDOWS
 
-- Login: PHSABC\WG_SEDATION_ADMIN
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE [name] = 'PHSABC\WG_SEDATION_ADMIN')
	CREATE LOGIN [PHSABC\WG_SEDATION_ADMIN] FROM WINDOWS

-- Login: CWMH_ReadOnly
CREATE LOGIN [CWMH_ReadOnly] WITH PASSWORD=0x01004D16812B4A7F7BFA76C6A3C2F7CF904C3290EE38F3588ECF8C4731245988908E5BFCACED18A79F70FCD583F5 HASHED, CHECK_POLICY=OFF, SID=0xB90F2AFFF70B2A449B6CBC8316BB5052

-- Login: shh_user
CREATE LOGIN [shh_user] WITH PASSWORD=0x0100A64B0003B660063E043D8289AFF122374B3EF18C748D8F53F01F1710D70B2471484264908219531B8B7D85B3 HASHED, CHECK_POLICY=OFF, SID=0xB6053E9BFE01EE48B5D78AF3572FF371
 
/***********************************************************
	the following two accounts are from SQL 7 to SQL 2000, then SQL 2005
***************************************************************/

-- Login: neo_user
CREATE LOGIN [neo_user] WITH PASSWORD=0x2131232D2632583F35543E583047392C HASHED, CHECK_POLICY=OFF, SID=0x370028E739CED511AFD200104BCEF6C0

-- Login: scn_user
CREATE LOGIN [scn_user] WITH PASSWORD=0x213122213D4C4A362250354034602729 HASHED, CHECK_POLICY=OFF, SID=0xFFB3AECD4FE3D411AFCA00104BCEF6C0
 


use bcchau
EXEC sp_change_users_login 'Update_One', 'ping_user', 'ping_user'
go

use bcchautrn
EXEC sp_change_users_login 'Update_One', 'ping_user', 'ping_user'
go

use bcchbd
EXEC sp_change_users_login 'Update_One', 'ping_user', 'ping_user'
go

use bcchbdtrn
EXEC sp_change_users_login 'Update_One', 'ping_user', 'ping_user'
go

use bcched
EXEC sp_change_users_login 'Update_One', 'ping_user', 'ping_user'
EXEC sp_change_users_login 'Update_One', 'ping_user_admin', 'ping_user_admin'
go

use bcchedtrn
EXEC sp_change_users_login 'Update_One', 'ping_user', 'ping_user'
EXEC sp_change_users_login 'Update_One', 'ping_user_admin', 'ping_user_admin'
go

use bcchmh_CWAP15
EXEC sp_change_users_login 'Update_One', 'ping_user', 'ping_user'
go

use bcchmh_CWAP19
EXEC sp_change_users_login 'Update_One', 'ping_user', 'ping_user'
EXEC sp_change_users_login 'Update_One', 'ping_user_admin', 'ping_user_admin'
go


use bcchmhtrn
EXEC sp_change_users_login 'Update_One', 'ping_user', 'ping_user'
EXEC sp_change_users_login 'Update_One', 'ping_user_admin', 'ping_user_admin'
go


use CWMH
EXEC sp_change_users_login 'Update_One', 'ping_user', 'ping_user'
EXEC sp_change_users_login 'Update_One', 'CWMH_ReadOnly', 'CWMH_ReadOnly'
go


use comet1
EXEC sp_change_users_login 'Update_One', 'ping_user', 'ping_user'
go

use comet
EXEC sp_change_users_login 'Update_One', 'neo_user', 'neo_user'
EXEC sp_change_users_login 'Update_One', 'scn_user', 'scn_user'
go

-------------------  Migrate from CWAP12
-- Login: Intranet
CREATE LOGIN [Intranet] WITH PASSWORD=0x0100BA4B4028280363727BCF50C2AF8DA813D5B32658C2E954044AF46288208556EF15A266B8FF03CD8C4DD2A057 HASHED, CHECK_POLICY=OFF, SID=0xC9D56578E3EE8946807DE0C8DE7A0BC4


-- Login: cdr
CREATE LOGIN [cdr] WITH PASSWORD=0x01005820480E3EC71B58F122136BC0FF37AFA813C404233CDF5FC88EF90BD632181A44183351E3DCDDAC76FA2FA3 HASHED, CHECK_POLICY=OFF, SID=0x52B8A8F9EE954C43B53F3F6E2560E76F


-- Login: PHSABC\dmetzger
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE [name] = 'PHSABC\dmetzger')
	CREATE LOGIN [PHSABC\dmetzger] FROM WINDOWS


