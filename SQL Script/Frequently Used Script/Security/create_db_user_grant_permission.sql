use CDR;
IF NOT EXISTS (SELECT name 
                FROM [sys].[database_principals]
                WHERE name = N'PHSABC\kmao')
Begin
    CREATE USER [PHSABC\kmao] 
    FOR LOGIN [PHSABC\kmao] WITH DEFAULT_SCHEMA=[dbo];
end
ALTER ROLE [db_datareader] ADD MEMBER [PHSABC\kmao];
grant view definition to [PHSABC\kmao] ;


use CWMH;
IF NOT EXISTS (SELECT name 
                FROM [sys].[database_principals]
                WHERE name = N'PHSABC\kmao')
Begin
    CREATE USER [PHSABC\kmao] 
    FOR LOGIN [PHSABC\kmao] WITH DEFAULT_SCHEMA=[dbo];
end
ALTER ROLE [db_datareader] ADD MEMBER [PHSABC\kmao];
grant view definition to [PHSABC\kmao] ;

use COMET;
IF NOT EXISTS (SELECT name 
                FROM [sys].[database_principals]
                WHERE name = N'PHSABC\kmao')
Begin
    CREATE USER [PHSABC\kmao] 
    FOR LOGIN [PHSABC\kmao] WITH DEFAULT_SCHEMA=[dbo];
end
ALTER ROLE [db_datareader] ADD MEMBER [PHSABC\kmao];
grant view definition to [PHSABC\kmao] ;

use COMET1;
IF NOT EXISTS (SELECT name 
                FROM [sys].[database_principals]
                WHERE name = N'PHSABC\kmao')
Begin
    CREATE USER [PHSABC\kmao] 
    FOR LOGIN [PHSABC\kmao] WITH DEFAULT_SCHEMA=[dbo];
end
ALTER ROLE [db_datareader] ADD MEMBER [PHSABC\kmao];
grant view definition to [PHSABC\kmao] ;



