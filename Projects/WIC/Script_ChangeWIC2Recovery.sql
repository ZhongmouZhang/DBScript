 restore database WICMaster
with recovery

use WICMaster
go

exec sp_changedbowner 'phsabc\wicadmin'

EXEC sp_change_users_login 'Update_One', 'wicapplication', 'wicapplication'
EXEC sp_change_users_login 'Update_One', 'wicauth', 'wicauth'

