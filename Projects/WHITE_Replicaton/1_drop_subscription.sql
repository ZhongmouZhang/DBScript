
------------------------------------------------------
-- Drop Subscription.sql
--    This script has to run on "Publisher" Server
------------------------------------------------------

declare @publication_name varchar(256)
------------------------------------------------------
--    Insert in following line appropriate publication name
------------------------------------------------------
/*************************************
set @publication_name = 'publication_white_FHA'

use White3P_TEST -- VCHSQLDBP02
set @publication_name = 'publication_white_PHC_UAT'

use White3V_TEST -- VCHSQLDBP02
set @publication_name = 'publication_white_VCH_UAT'

use White3V -- VCHSQLDBP02
set @publication_name = 'publication_white_VCH'


use white3  -- VMT012SQL2K5
set @publication_name = 'publication_white_FHA_UAT'

use white3  -- ATHENA\INST4
set @publication_name = 'publication_white_FHA'

use white3  -- ZVMSQ2K8R2
set @publication_name = 'publication_white_PHSA_UAT'


use VCH_White3; -- SDDBSWHT003
set @publication_name = 'publication_white_VCH_UAT'


use PHSA_White3; -- SDDBSWHT003
set @publication_name = 'publication_white_PHSA_UAT'


use PHC_White3; -- SDDBSWHT003
set @publication_name = 'publication_white_PHC_UAT'


use BCEHS_White3; -- SDDBSWHT003
set @publication_name = 'publication_white_BCEHS_UAT'



************************************/


use BCEHS_White3; -- SDDBSWHT003
set @publication_name = 'publication_white_BCEHS_UAT'


EXEC sp_dropsubscription 
  @publication = @publication_name,
  @article = N'all',
  @subscriber = N'all';