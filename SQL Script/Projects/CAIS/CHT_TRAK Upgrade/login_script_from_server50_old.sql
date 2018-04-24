 /* sp_help_revlogin script 
** Generated Jun 10 2008  1:23PM on ZVMSQLUPGRADE */
 
DECLARE @pwd sysname
 
-- Login: BROWNC
SET @pwd = CONVERT (varchar(256), 0x21312144332843513B2530555F423E4B)
if not exists (select name from master.dbo.sysxlogins where name='BROWNC')
EXEC master..sp_addlogin 'BROWNC', @pwd, @sid = 0x1067FC09FD5E0C4092197DF438744CA3, @encryptopt = 'skip_encryption_old'
 
-- Login: BUILTIN\Administrators
if not exists (select name from master.dbo.sysxlogins where name='BUILTIN\Administrators')
EXEC master..sp_grantlogin 'BUILTIN\Administrators'
 
-- Login: CMOFFATT
SET @pwd = CONVERT (varchar(256), 0x2131214A212D485943443F5B22304A4A)
if not exists (select name from master.dbo.sysxlogins where name='CMOFFATT')
EXEC master..sp_addlogin 'CMOFFATT', @pwd, @sid = 0xECDC459B6F6B8A4BB2E829DAB5CE3E77, @encryptopt = 'skip_encryption_old'
 
-- Login: CPasutti
SET @pwd = CONVERT (varchar(256), 0x213123373D465942463E59284B585248)
if not exists (select name from master.dbo.sysxlogins where name='CPasutti')
EXEC master..sp_addlogin 'CPasutti', @pwd, @sid = 0x4643A0D29D68A84EA98AF9E0BF62A277, @encryptopt = 'skip_encryption_old'
 
-- Login: LabTest
SET @pwd = CONVERT (varchar(256), 0x2131225738415F52232B2C383B3C602A)
if not exists (select name from master.dbo.sysxlogins where name='LabTest')
EXEC master..sp_addlogin 'LabTest', @pwd, @sid = 0x1D6C2C4D2027A54B86EB6EF9EACA8745, @encryptopt = 'skip_encryption_old'
 
-- Login: MWierzejski
SET @pwd = CONVERT (varchar(256), 0x2131214A2126242752542A2D5C30404E)
if not exists (select name from master.dbo.sysxlogins where name='MWierzejski')
EXEC master..sp_addlogin 'MWierzejski', @pwd, @sid = 0xD8148A2B362E9E4883635EAB10EFA76D, @encryptopt = 'skip_encryption_old'
 
-- Login: Margaret
SET @pwd = CONVERT (varchar(256), 0x2131214A21285C23552D33425548543E)
if not exists (select name from master.dbo.sysxlogins where name='Margaret')
EXEC master..sp_addlogin 'Margaret', @pwd, @sid = 0x8371E42FA05BB241A280BAAEAFEF3DD3, @encryptopt = 'skip_encryption_old'
 
-- Login: PHSABC\Alpha
if not exists (select name from master.dbo.sysxlogins where name='PHSABC\Alpha')
EXEC master..sp_grantlogin 'PHSABC\Alpha'
 
-- Login: WDennis
SET @pwd = CONVERT (varchar(256), 0x2131214A2129513F4159422A592A5C40)
if not exists (select name from master.dbo.sysxlogins where name='WDennis')
EXEC master..sp_addlogin 'WDennis', @pwd, @sid = 0x20BC3B6E21D2A84EB8E57CA54D0B1930, @encryptopt = 'skip_encryption_old'
 
-- Login: WRosart
SET @pwd = CONVERT (varchar(256), 0x2131214A212322515E605E542F44253E)
if not exists (select name from master.dbo.sysxlogins where name='WRosart')
EXEC master..sp_addlogin 'WRosart', @pwd, @sid = 0xCA2A6D4B1261A142867F3BF9DAC977F0, @encryptopt = 'skip_encryption_old'
 
-- Login: aabanilla
SET @pwd = CONVERT (varchar(256), 0x2131214A212C23505133605138574028)
if not exists (select name from master.dbo.sysxlogins where name='aabanilla')
EXEC master..sp_addlogin 'aabanilla', @pwd, @sid = 0x9788A266F0CFC040965F6E95F0E208C9, @encryptopt = 'skip_encryption_old'
 
-- Login: aagranovic
SET @pwd = CONVERT (varchar(256), 0x21312227382538243A5C403658602139)
if not exists (select name from master.dbo.sysxlogins where name='aagranovic')
EXEC master..sp_addlogin 'aagranovic', @pwd, @sid = 0x5F4A579144743B469CE0DBBC0B719E09, @encryptopt = 'skip_encryption_old'
 
-- Login: aaltoura
SET @pwd = CONVERT (varchar(256), 0x2131214A212D26474E55484342584931)
if not exists (select name from master.dbo.sysxlogins where name='aaltoura')
EXEC master..sp_addlogin 'aaltoura', @pwd, @sid = 0x00B15F6F1C35144FA907DCA1784A89B6, @encryptopt = 'skip_encryption_old'
 
-- Login: aarnold
SET @pwd = CONVERT (varchar(256), 0x2131235F2721363729394F5D4E2C472D)
if not exists (select name from master.dbo.sysxlogins where name='aarnold')
EXEC master..sp_addlogin 'aarnold', @pwd, @sid = 0xF0D61204FD81794686B5DD20FE749091, @encryptopt = 'skip_encryption_old'
 
-- Login: abarry
SET @pwd = CONVERT (varchar(256), 0x2131214A21263C4F472F365155325859)
if not exists (select name from master.dbo.sysxlogins where name='abarry')
EXEC master..sp_addlogin 'abarry', @pwd, @sid = 0xF10A4AA1A816C5428FE32EBD72CD1180, @encryptopt = 'skip_encryption_old'
 
-- Login: ablack2
SET @pwd = CONVERT (varchar(256), 0x2131235F272C49343C305E443D442821)
if not exists (select name from master.dbo.sysxlogins where name='ablack2')
EXEC master..sp_addlogin 'ablack2', @pwd, @sid = 0x985CAEA938975E4595F702070CA82617, @encryptopt = 'skip_encryption_old'
 
-- Login: aborisoff
SET @pwd = CONVERT (varchar(256), 0x21312144332C41264D5B435D32532829)
if not exists (select name from master.dbo.sysxlogins where name='aborisoff')
EXEC master..sp_addlogin 'aborisoff', @pwd, @sid = 0x9D7AF80E5DB4454C80ED403D48C46C4B, @encryptopt = 'skip_encryption_old'
 
-- Login: abriede
SET @pwd = CONVERT (varchar(256), 0x2131214A212C5B30312C553B273C4E47)
if not exists (select name from master.dbo.sysxlogins where name='abriede')
EXEC master..sp_addlogin 'abriede', @pwd, @sid = 0x27809015DE13AD4FAD5EAB7E2FE6CC20, @encryptopt = 'skip_encryption_old'
 
-- Login: achan
SET @pwd = CONVERT (varchar(256), 0x213124432B252144403053603B584733)
if not exists (select name from master.dbo.sysxlogins where name='achan')
EXEC master..sp_addlogin 'achan', @pwd, @sid = 0x523C418CB151D846B3B2AAFCC29E6361, @encryptopt = 'skip_encryption_old'
 
-- Login: achand
SET @pwd = CONVERT (varchar(256), 0x213123493851215A514E4629575A4323)
if not exists (select name from master.dbo.sysxlogins where name='achand')
EXEC master..sp_addlogin 'achand', @pwd, @sid = 0x7DB685CC48C92640832DF6FF68878DBF, @encryptopt = 'skip_encryption_old'
 
-- Login: acolburn
SET @pwd = CONVERT (varchar(256), 0x213121542B24213B362E35302F3E4A54)
if not exists (select name from master.dbo.sysxlogins where name='acolburn')
EXEC master..sp_addlogin 'acolburn', @pwd, @sid = 0x1C10450D6C54F84F9141EA3319B975B5, @encryptopt = 'skip_encryption_old'
 
-- Login: acollier
SET @pwd = CONVERT (varchar(256), 0x2131235F405E244D5C2D4D2B58382A55)
if not exists (select name from master.dbo.sysxlogins where name='acollier')
EXEC master..sp_addlogin 'acollier', @pwd, @sid = 0xA942AA90499B4C45B48432DEFA302712, @encryptopt = 'skip_encryption_old'
 
-- Login: addisonv
SET @pwd = CONVERT (varchar(256), 0x213124232549412D4F4334545C265121)
if not exists (select name from master.dbo.sysxlogins where name='addisonv')
EXEC master..sp_addlogin 'addisonv', @pwd, @sid = 0x31D0105B58A36D48BFC540C5EC463078, @encryptopt = 'skip_encryption_old'
 
-- Login: adeslaur
SET @pwd = CONVERT (varchar(256), 0x213123233D454641585F2C3D5230442D)
if not exists (select name from master.dbo.sysxlogins where name='adeslaur')
EXEC master..sp_addlogin 'adeslaur', @pwd, @sid = 0xD4E58398DC8DE1488A1210020A7537BD, @encryptopt = 'skip_encryption_old'
 
-- Login: adodds
SET @pwd = CONVERT (varchar(256), 0x213123243F33333F21422F2A3F37543F)
if not exists (select name from master.dbo.sysxlogins where name='adodds')
EXEC master..sp_addlogin 'adodds', @pwd, @sid = 0xA0E1FA39CEE5224D92CA31FD60A1A1ED, @encryptopt = 'skip_encryption_old'
 
-- Login: aedwards
SET @pwd = CONVERT (varchar(256), 0x2131212D2C57584A46564C3E445E285B)
if not exists (select name from master.dbo.sysxlogins where name='aedwards')
EXEC master..sp_addlogin 'aedwards', @pwd, @sid = 0xC9EE7FAED8504545B42CC9797146D47F, @encryptopt = 'skip_encryption_old'
 
-- Login: afilewic
SET @pwd = CONVERT (varchar(256), 0x213121443324583429335B26282C2924)
if not exists (select name from master.dbo.sysxlogins where name='afilewic')
EXEC master..sp_addlogin 'afilewic', @pwd, @sid = 0x458C9C370F01FF44B01B233BCCBE25F1, @encryptopt = 'skip_encryption_old'
 
-- Login: afilipic
SET @pwd = CONVERT (varchar(256), 0x2131214A212B49463622562C31253C39)
if not exists (select name from master.dbo.sysxlogins where name='afilipic')
EXEC master..sp_addlogin 'afilipic', @pwd, @sid = 0x8619E58A9C180247B8714E02325C6DD5, @encryptopt = 'skip_encryption_old'
 
-- Login: afisic
SET @pwd = CONVERT (varchar(256), 0x2131214A21304D5F4C274146352C5E38)
if not exists (select name from master.dbo.sysxlogins where name='afisic')
EXEC master..sp_addlogin 'afisic', @pwd, @sid = 0x0248EDFAB1CE2749AFBC285B14467946, @encryptopt = 'skip_encryption_old'
 
-- Login: aford
SET @pwd = CONVERT (varchar(256), 0x213121402A38252D4E4E5C552924584E)
if not exists (select name from master.dbo.sysxlogins where name='aford')
EXEC master..sp_addlogin 'aford', @pwd, @sid = 0x111F4C625F2BB34AAAC418D88DAAAB6D, @encryptopt = 'skip_encryption_old'
 
-- Login: agaebel
SET @pwd = CONVERT (varchar(256), 0x2131214433283C39424A424E594B5D41)
if not exists (select name from master.dbo.sysxlogins where name='agaebel')
EXEC master..sp_addlogin 'agaebel', @pwd, @sid = 0x3F5B1AB526052040B8C59C2D32A95C23, @encryptopt = 'skip_encryption_old'
 
-- Login: agunnell
SET @pwd = CONVERT (varchar(256), 0x2131244A2A424A4A4533304B243C283F)
if not exists (select name from master.dbo.sysxlogins where name='agunnell')
EXEC master..sp_addlogin 'agunnell', @pwd, @sid = 0x88AE885E232B2642B229670B7E444F9A, @encryptopt = 'skip_encryption_old'
 
-- Login: agustavs
SET @pwd = CONVERT (varchar(256), 0x213121462F5A453A542F216039233E42)
if not exists (select name from master.dbo.sysxlogins where name='agustavs')
EXEC master..sp_addlogin 'agustavs', @pwd, @sid = 0xD40EEC3A3C6A854F8F3AD520C0D2991D, @encryptopt = 'skip_encryption_old'
 
-- Login: ahasting
if not exists (select name from master.dbo.sysxlogins where name='ahasting')
EXEC master..sp_addlogin 'ahasting', NULL, @sid = 0xCC8CE6F6A8D977418B9F3DCF0E14FEAB, @encryptopt = 'skip_encryption_old'
 
-- Login: ahogan
SET @pwd = CONVERT (varchar(256), 0x213124503E3A2C3C453A4F585050365F)
if not exists (select name from master.dbo.sysxlogins where name='ahogan')
EXEC master..sp_addlogin 'ahogan', @pwd, @sid = 0x49E050397D697B4CA4FD7B9D129FFBC6, @encryptopt = 'skip_encryption_old'
 
-- Login: aholder
SET @pwd = CONVERT (varchar(256), 0x2131232A3C4153392C2B4A56254F3948)
if not exists (select name from master.dbo.sysxlogins where name='aholder')
EXEC master..sp_addlogin 'aholder', @pwd, @sid = 0xD15CCD3D4190ED4B95D6F1D593436330, @encryptopt = 'skip_encryption_old'
 
-- Login: ahui
SET @pwd = CONVERT (varchar(256), 0x2131214A212E394523363C53455B2A25)
if not exists (select name from master.dbo.sysxlogins where name='ahui')
EXEC master..sp_addlogin 'ahui', @pwd, @sid = 0xFC3AFB4F37F1174F971B46C31E90323A, @encryptopt = 'skip_encryption_old'
 
-- Login: ajohnson
SET @pwd = CONVERT (varchar(256), 0x2131214A21253A5E54513C464B565927)
if not exists (select name from master.dbo.sysxlogins where name='ajohnson')
EXEC master..sp_addlogin 'ajohnson', @pwd, @sid = 0xD210E1579575E84A9879C07EB8303255, @encryptopt = 'skip_encryption_old'
 
-- Login: akaeserf
SET @pwd = CONVERT (varchar(256), 0x2131214A21244D50385F455A2C223A5F)
if not exists (select name from master.dbo.sysxlogins where name='akaeserf')
EXEC master..sp_addlogin 'akaeserf', @pwd, @sid = 0x599520A4DA054E43BAD750DBC2A3A045, @encryptopt = 'skip_encryption_old'
 
-- Login: akang3
SET @pwd = CONVERT (varchar(256), 0x2131214A212E5641292C3C3C3E215159)
if not exists (select name from master.dbo.sysxlogins where name='akang3')
EXEC master..sp_addlogin 'akang3', @pwd, @sid = 0xDDE27DC541C0CF4CAD7BC48FA2AA85E7, @encryptopt = 'skip_encryption_old'
 
-- Login: akartsonas
SET @pwd = CONVERT (varchar(256), 0x2131214A212B2C2A355445243C30274A)
if not exists (select name from master.dbo.sysxlogins where name='akartsonas')
EXEC master..sp_addlogin 'akartsonas', @pwd, @sid = 0x59C01B33CCDBEC4F9FBABF1684B998F4, @encryptopt = 'skip_encryption_old'
 
-- Login: akbailey
SET @pwd = CONVERT (varchar(256), 0x21312321312C212F2B2A2F593E5A283E)
if not exists (select name from master.dbo.sysxlogins where name='akbailey')
EXEC master..sp_addlogin 'akbailey', @pwd, @sid = 0x52363F421C19284CB9E2F448AD56EE31, @encryptopt = 'skip_encryption_old'
 
-- Login: akbasloo
SET @pwd = CONVERT (varchar(256), 0x213124423342502C35545752445C3653)
if not exists (select name from master.dbo.sysxlogins where name='akbasloo')
EXEC master..sp_addlogin 'akbasloo', @pwd, @sid = 0xBD50F3EFAA7BED4C8F056452D56A14F7, @encryptopt = 'skip_encryption_old'
 
-- Login: akennedy
SET @pwd = CONVERT (varchar(256), 0x2131214A212C23272B273F272C404722)
if not exists (select name from master.dbo.sysxlogins where name='akennedy')
EXEC master..sp_addlogin 'akennedy', @pwd, @sid = 0x667A2C9BFBE5F34BA119308E9D9BF318, @encryptopt = 'skip_encryption_old'
 
-- Login: alakhani
SET @pwd = CONVERT (varchar(256), 0x2131214A2123463A3C57333D4D542A56)
if not exists (select name from master.dbo.sysxlogins where name='alakhani')
EXEC master..sp_addlogin 'alakhani', @pwd, @sid = 0xDBBC83E5D696914E9F7729385B37AF14, @encryptopt = 'skip_encryption_old'
 
-- Login: alalani2
SET @pwd = CONVERT (varchar(256), 0x2131214A21252C5F4C345C595D314831)
if not exists (select name from master.dbo.sysxlogins where name='alalani2')
EXEC master..sp_addlogin 'alalani2', @pwd, @sid = 0xAC5E3C6A03C80A45B6001A31BEB0A332, @encryptopt = 'skip_encryption_old'
 
-- Login: alcooper
SET @pwd = CONVERT (varchar(256), 0x2131214D3B37464F58405F5454553F2B)
if not exists (select name from master.dbo.sysxlogins where name='alcooper')
EXEC master..sp_addlogin 'alcooper', @pwd, @sid = 0xD628EB6093A874498897E79100326009, @encryptopt = 'skip_encryption_old'
 
-- Login: alhagglu
SET @pwd = CONVERT (varchar(256), 0x2131243B3D5A3A4B2F3A4A2953493C4D)
if not exists (select name from master.dbo.sysxlogins where name='alhagglu')
EXEC master..sp_addlogin 'alhagglu', @pwd, @sid = 0x21184C6FD877C34BA0036F557141AEFE, @encryptopt = 'skip_encryption_old'
 
-- Login: amcafree
SET @pwd = CONVERT (varchar(256), 0x213121462A593F402E51284E3A44222F)
if not exists (select name from master.dbo.sysxlogins where name='amcafree')
EXEC master..sp_addlogin 'amcafree', @pwd, @sid = 0xC05C3BDCCBC9494F95F46F50342EA16C, @encryptopt = 'skip_encryption_old'
 
-- Login: amcfarla
SET @pwd = CONVERT (varchar(256), 0x213123282D254E423F4D4E5F532C5029)
if not exists (select name from master.dbo.sysxlogins where name='amcfarla')
EXEC master..sp_addlogin 'amcfarla', @pwd, @sid = 0xF28633E37CDB3B48900123CF4529E058, @encryptopt = 'skip_encryption_old'
 
-- Login: amcintos
SET @pwd = CONVERT (varchar(256), 0x2131214A212C49215339302A4D33402A)
if not exists (select name from master.dbo.sysxlogins where name='amcintos')
EXEC master..sp_addlogin 'amcintos', @pwd, @sid = 0xEF39AF9319105A49ACB5B23866A7402A, @encryptopt = 'skip_encryption_old'
 
-- Login: amclaren
SET @pwd = CONVERT (varchar(256), 0x2131215C2B3F272B2F21244C56525229)
if not exists (select name from master.dbo.sysxlogins where name='amclaren')
EXEC master..sp_addlogin 'amclaren', @pwd, @sid = 0x977A1355409834428E469AC3C20C3070, @encryptopt = 'skip_encryption_old'
 
-- Login: amcnichol
SET @pwd = CONVERT (varchar(256), 0x2131214A212D4D28283345404B5D425F)
if not exists (select name from master.dbo.sysxlogins where name='amcnichol')
EXEC master..sp_addlogin 'amcnichol', @pwd, @sid = 0x42C2E1D6D012B2438959BF87D901C3A1, @encryptopt = 'skip_encryption_old'
 
-- Login: amoir
SET @pwd = CONVERT (varchar(256), 0x2131214A21274E3728334B4E2335314D)
if not exists (select name from master.dbo.sysxlogins where name='amoir')
EXEC master..sp_addlogin 'amoir', @pwd, @sid = 0x3FAC9BE197A2A24094DF045F9C661DB0, @encryptopt = 'skip_encryption_old'
 
-- Login: amok
SET @pwd = CONVERT (varchar(256), 0x2131223832482B4F5A562D5C515A344B)
if not exists (select name from master.dbo.sysxlogins where name='amok')
EXEC master..sp_addlogin 'amok', @pwd, @sid = 0x267BA4844611EE40BC3A0C98C1712FDA, @encryptopt = 'skip_encryption_old'
 
-- Login: ang3
SET @pwd = CONVERT (varchar(256), 0x2131214A21252F5D4F4C334558392751)
if not exists (select name from master.dbo.sysxlogins where name='ang3')
EXEC master..sp_addlogin 'ang3', @pwd, @sid = 0x152DB8E007959F46AF2018B002BC17B0, @encryptopt = 'skip_encryption_old'
 
-- Login: aoverend
SET @pwd = CONVERT (varchar(256), 0x2131214A212926373032243B4D2E255A)
if not exists (select name from master.dbo.sysxlogins where name='aoverend')
EXEC master..sp_addlogin 'aoverend', @pwd, @sid = 0x25230318B8522F449781B7FF8CDCD278, @encryptopt = 'skip_encryption_old'
 
-- Login: apicton
SET @pwd = CONVERT (varchar(256), 0x213121443322245046264E3B4A4E3B29)
if not exists (select name from master.dbo.sysxlogins where name='apicton')
EXEC master..sp_addlogin 'apicton', @pwd, @sid = 0xC4CB2FF074843E40B6A1AD204E05A11D, @encryptopt = 'skip_encryption_old'
 
-- Login: aprasad2
SET @pwd = CONVERT (varchar(256), 0x213121443322285530524B214A54404C)
if not exists (select name from master.dbo.sysxlogins where name='aprasad2')
EXEC master..sp_addlogin 'aprasad2', @pwd, @sid = 0x6FBC6B41A4E4D240A5EB20B26DE93F8E, @encryptopt = 'skip_encryption_old'
 
-- Login: apye
SET @pwd = CONVERT (varchar(256), 0x2131214A21222639605A564033485E45)
if not exists (select name from master.dbo.sysxlogins where name='apye')
EXEC master..sp_addlogin 'apye', @pwd, @sid = 0xF4D7F096486EEA47ADEC08E320967D01, @encryptopt = 'skip_encryption_old'
 
-- Login: aramen
SET @pwd = CONVERT (varchar(256), 0x2131225A363652235C4D4722325E2745)
if not exists (select name from master.dbo.sysxlogins where name='aramen')
EXEC master..sp_addlogin 'aramen', @pwd, @sid = 0x77BCF689D50A02409F0015D9AF17E7D1, @encryptopt = 'skip_encryption_old'
 
-- Login: arenning
SET @pwd = CONVERT (varchar(256), 0x2131214433235C48242733274A232237)
if not exists (select name from master.dbo.sysxlogins where name='arenning')
EXEC master..sp_addlogin 'arenning', @pwd, @sid = 0xC603659C3FFD734880BC41A09E9DA9D7, @encryptopt = 'skip_encryption_old'
 
-- Login: arice
SET @pwd = CONVERT (varchar(256), 0x2131214A212A53396058294D3E404D5F)
if not exists (select name from master.dbo.sysxlogins where name='arice')
EXEC master..sp_addlogin 'arice', @pwd, @sid = 0x233CF426BBE91D4596B35C24893FF2B9, @encryptopt = 'skip_encryption_old'
 
-- Login: arobinson
SET @pwd = CONVERT (varchar(256), 0x2131212F373F39423A274E264C4A3555)
if not exists (select name from master.dbo.sysxlogins where name='arobinson')
EXEC master..sp_addlogin 'arobinson', @pwd, @sid = 0x2BEA83E7FDEEE24BB831177A1EB155CB, @encryptopt = 'skip_encryption_old'
 
-- Login: ascarfo
SET @pwd = CONVERT (varchar(256), 0x2131214A212C45243A5B37543A555E5A)
if not exists (select name from master.dbo.sysxlogins where name='ascarfo')
EXEC master..sp_addlogin 'ascarfo', @pwd, @sid = 0xF684B9A1932ACB40B635EF1C33032AC0, @encryptopt = 'skip_encryption_old'
 
-- Login: aschmidt
SET @pwd = CONVERT (varchar(256), 0x2131214A2123482A513A453D213D4542)
if not exists (select name from master.dbo.sysxlogins where name='aschmidt')
EXEC master..sp_addlogin 'aschmidt', @pwd, @sid = 0x938CF849D6783142AF8637BC054FBB9A, @encryptopt = 'skip_encryption_old'
 
-- Login: asmeltze
SET @pwd = CONVERT (varchar(256), 0x2131214A21272D232F4E2F30502E265A)
if not exists (select name from master.dbo.sysxlogins where name='asmeltze')
EXEC master..sp_addlogin 'asmeltze', @pwd, @sid = 0xB4C4BCF59D36C14F967DFC200BBE3DE0, @encryptopt = 'skip_encryption_old'
 
-- Login: astronac
SET @pwd = CONVERT (varchar(256), 0x213122333B36472C3C3E5B3556302943)
if not exists (select name from master.dbo.sysxlogins where name='astronac')
EXEC master..sp_addlogin 'astronac', @pwd, @sid = 0x37BCA5E0C48F7A489CB526F9ECB6AFFF, @encryptopt = 'skip_encryption_old'
 
-- Login: athandi
SET @pwd = CONVERT (varchar(256), 0x213124373629404C2F402C3D583F2634)
if not exists (select name from master.dbo.sysxlogins where name='athandi')
EXEC master..sp_addlogin 'athandi', @pwd, @sid = 0xEACB14B9B7D8F34791966BAFC5470486, @encryptopt = 'skip_encryption_old'
 
-- Login: athomas
SET @pwd = CONVERT (varchar(256), 0x2131222A2C30323C354E483024323430)
if not exists (select name from master.dbo.sysxlogins where name='athomas')
EXEC master..sp_addlogin 'athomas', @pwd, @sid = 0xACD296E53617C34684009410D7E4007C, @encryptopt = 'skip_encryption_old'
 
-- Login: athomson
SET @pwd = CONVERT (varchar(256), 0x213121592B414B2E51263A3B5B403C5A)
if not exists (select name from master.dbo.sysxlogins where name='athomson')
EXEC master..sp_addlogin 'athomson', @pwd, @sid = 0x43D96829218EDC459B30C210E892163C, @encryptopt = 'skip_encryption_old'
 
-- Login: atomash
SET @pwd = CONVERT (varchar(256), 0x2131214A212A4521513239295752354A)
if not exists (select name from master.dbo.sysxlogins where name='atomash')
EXEC master..sp_addlogin 'atomash', @pwd, @sid = 0xB5D5EA784391DB468D0D2FB9CE18FF26, @encryptopt = 'skip_encryption_old'
 
-- Login: avenne
SET @pwd = CONVERT (varchar(256), 0x21312144332C255D28303A402C2F283A)
if not exists (select name from master.dbo.sysxlogins where name='avenne')
EXEC master..sp_addlogin 'avenne', @pwd, @sid = 0x458086A22FEF98458E834B5470D9C612, @encryptopt = 'skip_encryption_old'
 
-- Login: avillarino
SET @pwd = CONVERT (varchar(256), 0x2131214A212C4C21475F5C30485B442E)
if not exists (select name from master.dbo.sysxlogins where name='avillarino')
EXEC master..sp_addlogin 'avillarino', @pwd, @sid = 0x4B2ADDC433B6994CA8C449923A9930AD, @encryptopt = 'skip_encryption_old'
 
-- Login: avoice
SET @pwd = CONVERT (varchar(256), 0x21312242303054243360595D3E25342B)
if not exists (select name from master.dbo.sysxlogins where name='avoice')
EXEC master..sp_addlogin 'avoice', @pwd, @sid = 0x9D26D30ADF506D4BB9DE01889F169048, @encryptopt = 'skip_encryption_old'
 
-- Login: avroom
SET @pwd = CONVERT (varchar(256), 0x213124372C2A3A385931472948224625)
if not exists (select name from master.dbo.sysxlogins where name='avroom')
EXEC master..sp_addlogin 'avroom', @pwd, @sid = 0x3C66F59975540F41B7445CAA27D3D1E6, @encryptopt = 'skip_encryption_old'
 
-- Login: awardowi
SET @pwd = CONVERT (varchar(256), 0x2131214A21212C482336373F2D465C41)
if not exists (select name from master.dbo.sysxlogins where name='awardowi')
EXEC master..sp_addlogin 'awardowi', @pwd, @sid = 0x678AB8AF7CD6CD47A8B7DF522DDA4E7A, @encryptopt = 'skip_encryption_old'
 
-- Login: awells
SET @pwd = CONVERT (varchar(256), 0x213124553C2855513357604B3E5B424B)
if not exists (select name from master.dbo.sysxlogins where name='awells')
EXEC master..sp_addlogin 'awells', @pwd, @sid = 0xFDCD8E6C2C531440ABA9E452F05D05B5, @encryptopt = 'skip_encryption_old'
 
-- Login: awilson
SET @pwd = CONVERT (varchar(256), 0x2131214A21264B485B523F3621553241)
if not exists (select name from master.dbo.sysxlogins where name='awilson')
EXEC master..sp_addlogin 'awilson', @pwd, @sid = 0xFEECFC74843AD944A553AFFA1A352808, @encryptopt = 'skip_encryption_old'
 
-- Login: awilson4
SET @pwd = CONVERT (varchar(256), 0x2131214A212F2B415F413A3D3B524434)
if not exists (select name from master.dbo.sysxlogins where name='awilson4')
EXEC master..sp_addlogin 'awilson4', @pwd, @sid = 0x8330EEC7A05D3B4689008274CCA81792, @encryptopt = 'skip_encryption_old'
 
-- Login: awright
SET @pwd = CONVERT (varchar(256), 0x21312139283A432340465C2858504340)
if not exists (select name from master.dbo.sysxlogins where name='awright')
EXEC master..sp_addlogin 'awright', @pwd, @sid = 0x10ACFB86F93AA941B18693D5B3D424DD, @encryptopt = 'skip_encryption_old'
 
-- Login: babitan
SET @pwd = CONVERT (varchar(256), 0x2131214A212A273F53565E2727384140)
if not exists (select name from master.dbo.sysxlogins where name='babitan')
EXEC master..sp_addlogin 'babitan', @pwd, @sid = 0x7B4F920EF2E6C34CAFBA6999FE9F2267, @encryptopt = 'skip_encryption_old'
 
-- Login: bbaerg
SET @pwd = CONVERT (varchar(256), 0x2131214A212B322B3448563430213F4B)
if not exists (select name from master.dbo.sysxlogins where name='bbaerg')
EXEC master..sp_addlogin 'bbaerg', @pwd, @sid = 0xED7025F2BE2A834ABD95AC92AE6F70AE, @encryptopt = 'skip_encryption_old'
 
-- Login: bbcantel
SET @pwd = CONVERT (varchar(256), 0x2131214A21262C4235433B5D33474939)
if not exists (select name from master.dbo.sysxlogins where name='bbcantel')
EXEC master..sp_addlogin 'bbcantel', @pwd, @sid = 0x25CFDD150C95094EAF6AD55D47160EE8, @encryptopt = 'skip_encryption_old'
 
-- Login: bbojsa
SET @pwd = CONVERT (varchar(256), 0x21312147324C5D2F365854263B22534B)
if not exists (select name from master.dbo.sysxlogins where name='bbojsa')
EXEC master..sp_addlogin 'bbojsa', @pwd, @sid = 0x6C65D54E3D5C9148AEBC9A884BC35D14, @encryptopt = 'skip_encryption_old'
 
-- Login: bcarrol
SET @pwd = CONVERT (varchar(256), 0x2131215F253851453F54235939312A3E)
if not exists (select name from master.dbo.sysxlogins where name='bcarrol')
EXEC master..sp_addlogin 'bcarrol', @pwd, @sid = 0xCD0010FD5B42664EB3EB431C39519AFB, @encryptopt = 'skip_encryption_old'
 
-- Login: bclarke3
SET @pwd = CONVERT (varchar(256), 0x2131214A21223D43414F5E4F4D522526)
if not exists (select name from master.dbo.sysxlogins where name='bclarke3')
EXEC master..sp_addlogin 'bclarke3', @pwd, @sid = 0xCCD6D07BB9318A48A11A667339BE3C4E, @encryptopt = 'skip_encryption_old'
 
-- Login: bcrone
SET @pwd = CONVERT (varchar(256), 0x2131214A212B40492646312B4F26315A)
if not exists (select name from master.dbo.sysxlogins where name='bcrone')
EXEC master..sp_addlogin 'bcrone', @pwd, @sid = 0x4D008F05480305499BCD27BFE40DA62F, @encryptopt = 'skip_encryption_old'
 
-- Login: bcrowder
SET @pwd = CONVERT (varchar(256), 0x2131214A21223E4F403B574722275F58)
if not exists (select name from master.dbo.sysxlogins where name='bcrowder')
EXEC master..sp_addlogin 'bcrowder', @pwd, @sid = 0xCFCD800012090C448F1D28F245EAE3D3, @encryptopt = 'skip_encryption_old'
 
-- Login: bdarosa
SET @pwd = CONVERT (varchar(256), 0x2131214A212A3E2C38383B45455B2346)
if not exists (select name from master.dbo.sysxlogins where name='bdarosa')
EXEC master..sp_addlogin 'bdarosa', @pwd, @sid = 0x961734A905B3EC4988AF2CDBF12C5D15, @encryptopt = 'skip_encryption_old'
 
-- Login: bdevryer
SET @pwd = CONVERT (varchar(256), 0x2131214433243D594921424E5634215E)
if not exists (select name from master.dbo.sysxlogins where name='bdevryer')
EXEC master..sp_addlogin 'bdevryer', @pwd, @sid = 0xC3DA68A917FDD7489D8E8E3BD6641F92, @encryptopt = 'skip_encryption_old'
 
-- Login: bdriesch
SET @pwd = CONVERT (varchar(256), 0x2131214A212523474E53503C47333527)
if not exists (select name from master.dbo.sysxlogins where name='bdriesch')
EXEC master..sp_addlogin 'bdriesch', @pwd, @sid = 0x93547F60AB4C2D4F91F698B6341C7D34, @encryptopt = 'skip_encryption_old'
 
-- Login: belliott
SET @pwd = CONVERT (varchar(256), 0x2131212734323E2B2D223B502E27415B)
if not exists (select name from master.dbo.sysxlogins where name='belliott')
EXEC master..sp_addlogin 'belliott', @pwd, @sid = 0x9D38BAE5A565FC4CA41017AC88664013, @encryptopt = 'skip_encryption_old'
 
-- Login: bestabro
if not exists (select name from master.dbo.sysxlogins where name='bestabro')
EXEC master..sp_addlogin 'bestabro', NULL, @sid = 0x258A374F2B90854CAE652B641CBAED83, @encryptopt = 'skip_encryption_old'
 
-- Login: beyford
SET @pwd = CONVERT (varchar(256), 0x2131225A3A24583B5E314B2C45302E4E)
if not exists (select name from master.dbo.sysxlogins where name='beyford')
EXEC master..sp_addlogin 'beyford', @pwd, @sid = 0xAB3CD529B1C86D499B766831B2C488C8, @encryptopt = 'skip_encryption_old'
 
-- Login: bfiddler
SET @pwd = CONVERT (varchar(256), 0x213124312824604235322C4C35325C2C)
if not exists (select name from master.dbo.sysxlogins where name='bfiddler')
EXEC master..sp_addlogin 'bfiddler', @pwd, @sid = 0x64BC6E154573844AA413025ED311E71E, @encryptopt = 'skip_encryption_old'
 
-- Login: bfong
SET @pwd = CONVERT (varchar(256), 0x213124602C54274F253B233554424240)
if not exists (select name from master.dbo.sysxlogins where name='bfong')
EXEC master..sp_addlogin 'bfong', @pwd, @sid = 0x643F656DF00CF949BBC08A81ECFD1BC9, @encryptopt = 'skip_encryption_old'
 
-- Login: bfulton
SET @pwd = CONVERT (varchar(256), 0x2131224D303A50393E3234423D374160)
if not exists (select name from master.dbo.sysxlogins where name='bfulton')
EXEC master..sp_addlogin 'bfulton', @pwd, @sid = 0x9D77AC2630C11F4487A8BBE5FB66D050, @encryptopt = 'skip_encryption_old'
 
-- Login: bglaum
SET @pwd = CONVERT (varchar(256), 0x2131214A21235D59584960594321513C)
if not exists (select name from master.dbo.sysxlogins where name='bglaum')
EXEC master..sp_addlogin 'bglaum', @pwd, @sid = 0x4C756B60443EC14ABFFBDD76901DBC20, @encryptopt = 'skip_encryption_old'
 
-- Login: bgurakowsk
SET @pwd = CONVERT (varchar(256), 0x213121443326554C215F294B23445442)
if not exists (select name from master.dbo.sysxlogins where name='bgurakowsk')
EXEC master..sp_addlogin 'bgurakowsk', @pwd, @sid = 0xA8CCE854E0825B44B5D1B90456B10983, @encryptopt = 'skip_encryption_old'
 
-- Login: bhanes
SET @pwd = CONVERT (varchar(256), 0x2131214A212A374D252F232D23233245)
if not exists (select name from master.dbo.sysxlogins where name='bhanes')
EXEC master..sp_addlogin 'bhanes', @pwd, @sid = 0x0E786C6DBB234144A8D7F719811D8E1D, @encryptopt = 'skip_encryption_old'
 
-- Login: bhansen
SET @pwd = CONVERT (varchar(256), 0x2131214A212148534D5757534D433C44)
if not exists (select name from master.dbo.sysxlogins where name='bhansen')
EXEC master..sp_addlogin 'bhansen', @pwd, @sid = 0xAC810DDE8AECAB42B8E3F3A02BCFBE3C, @encryptopt = 'skip_encryption_old'
 
-- Login: bhou
SET @pwd = CONVERT (varchar(256), 0x213122423F4B3B5B2E3D322557515D5C)
if not exists (select name from master.dbo.sysxlogins where name='bhou')
EXEC master..sp_addlogin 'bhou', @pwd, @sid = 0xC262A5C4C95AEC4BB0042F1C1C30036A, @encryptopt = 'skip_encryption_old'
 
-- Login: bittah
SET @pwd = CONVERT (varchar(256), 0x2131214A212721272A3D382A31592E5C)
if not exists (select name from master.dbo.sysxlogins where name='bittah')
EXEC master..sp_addlogin 'bittah', @pwd, @sid = 0x90B5C234DA204C4582F5951D6482198F, @encryptopt = 'skip_encryption_old'
 
-- Login: bkandola
SET @pwd = CONVERT (varchar(256), 0x2131214A21243C2D29563238264C5A3A)
if not exists (select name from master.dbo.sysxlogins where name='bkandola')
EXEC master..sp_addlogin 'bkandola', @pwd, @sid = 0x2267BFA9D7FA9145A7CAC152933B2B6C, @encryptopt = 'skip_encryption_old'
 
-- Login: bklimek
SET @pwd = CONVERT (varchar(256), 0x2131214A21292E5A3A395F5052506026)
if not exists (select name from master.dbo.sysxlogins where name='bklimek')
EXEC master..sp_addlogin 'bklimek', @pwd, @sid = 0x13E02B6990E57C428D2B9F5BF7BDDAAC, @encryptopt = 'skip_encryption_old'
 
-- Login: bkloosterm
SET @pwd = CONVERT (varchar(256), 0x2131214A21282B253A3E292B544D522F)
if not exists (select name from master.dbo.sysxlogins where name='bkloosterm')
EXEC master..sp_addlogin 'bkloosterm', @pwd, @sid = 0x71FBA9CF7DEC3D42A493FDB5C480D397, @encryptopt = 'skip_encryption_old'
 
-- Login: blandry
SET @pwd = CONVERT (varchar(256), 0x2131214A21232C2132302256433B2B37)
if not exists (select name from master.dbo.sysxlogins where name='blandry')
EXEC master..sp_addlogin 'blandry', @pwd, @sid = 0x8EA8EE4D7CDF39439AF298ACAD1F5A52, @encryptopt = 'skip_encryption_old'
 
-- Login: blaprair
SET @pwd = CONVERT (varchar(256), 0x2131224D303A23524A573938452A2B5C)
if not exists (select name from master.dbo.sysxlogins where name='blaprair')
EXEC master..sp_addlogin 'blaprair', @pwd, @sid = 0xF9C5CFFF2509B74F9B0782CD717BA940, @encryptopt = 'skip_encryption_old'
 
-- Login: bluke
SET @pwd = CONVERT (varchar(256), 0x2131214A213027355938363634592E5C)
if not exists (select name from master.dbo.sysxlogins where name='bluke')
EXEC master..sp_addlogin 'bluke', @pwd, @sid = 0xCE158D6D6D6FFC4DAC6E80DFE273ED9E, @encryptopt = 'skip_encryption_old'
 
-- Login: bma
SET @pwd = CONVERT (varchar(256), 0x2131215D3C573C2B442D375223384453)
if not exists (select name from master.dbo.sysxlogins where name='bma')
EXEC master..sp_addlogin 'bma', @pwd, @sid = 0xA59E62C88A809B4B95D1FA6428CDCA7B, @encryptopt = 'skip_encryption_old'
 
-- Login: bmcneil
SET @pwd = CONVERT (varchar(256), 0x2131214A21295139322A25455B355842)
if not exists (select name from master.dbo.sysxlogins where name='bmcneil')
EXEC master..sp_addlogin 'bmcneil', @pwd, @sid = 0x8A199344DA7BA34C8E1D17B5A40C85FD, @encryptopt = 'skip_encryption_old'
 
-- Login: bnelmes
SET @pwd = CONVERT (varchar(256), 0x2131243A252D593B53515A3243336035)
if not exists (select name from master.dbo.sysxlogins where name='bnelmes')
EXEC master..sp_addlogin 'bnelmes', @pwd, @sid = 0xDB56A8EEAD56F347BD91EE979A545C44, @encryptopt = 'skip_encryption_old'
 
-- Login: bnorris
SET @pwd = CONVERT (varchar(256), 0x2131235F272725333F4151325B4E5643)
if not exists (select name from master.dbo.sysxlogins where name='bnorris')
EXEC master..sp_addlogin 'bnorris', @pwd, @sid = 0x8BE74E2A3448C846A3F220DD406FC745, @encryptopt = 'skip_encryption_old'
 
-- Login: brharrott
SET @pwd = CONVERT (varchar(256), 0x2131214A212458525F5A3B395B493922)
if not exists (select name from master.dbo.sysxlogins where name='brharrott')
EXEC master..sp_addlogin 'brharrott', @pwd, @sid = 0xBB7E2633EB60B04DB464CDDC58DD5134, @encryptopt = 'skip_encryption_old'
 
-- Login: broberts
SET @pwd = CONVERT (varchar(256), 0x213122333B3428343031214D512C4E31)
if not exists (select name from master.dbo.sysxlogins where name='broberts')
EXEC master..sp_addlogin 'broberts', @pwd, @sid = 0xBE6D54C9048C544193C7E254D96182F5, @encryptopt = 'skip_encryption_old'
 
-- Login: brobinso
SET @pwd = CONVERT (varchar(256), 0x2131214A21232C2C27235F4B5F3D4229)
if not exists (select name from master.dbo.sysxlogins where name='brobinso')
EXEC master..sp_addlogin 'brobinso', @pwd, @sid = 0x38F424FD3A4797428F7A4A5E4BBB7E94, @encryptopt = 'skip_encryption_old'
 
-- Login: brybar
SET @pwd = CONVERT (varchar(256), 0x2131214A212B4D485E52274F484E4850)
if not exists (select name from master.dbo.sysxlogins where name='brybar')
EXEC master..sp_addlogin 'brybar', @pwd, @sid = 0xA24C0D016A861843901B46912CD08CB5, @encryptopt = 'skip_encryption_old'
 
-- Login: bschell
SET @pwd = CONVERT (varchar(256), 0x2131214A2129382B49415A32584B3B2E)
if not exists (select name from master.dbo.sysxlogins where name='bschell')
EXEC master..sp_addlogin 'bschell', @pwd, @sid = 0x3BFF44B10454774EA98068B649650F1B, @encryptopt = 'skip_encryption_old'
 
-- Login: bseguna
SET @pwd = CONVERT (varchar(256), 0x2131235F2726382559235B22344D312D)
if not exists (select name from master.dbo.sysxlogins where name='bseguna')
EXEC master..sp_addlogin 'bseguna', @pwd, @sid = 0x002E6D397929474EAE5FF35EB15B3D7E, @encryptopt = 'skip_encryption_old'
 
-- Login: bsidhu
SET @pwd = CONVERT (varchar(256), 0x2131214A212638325D315C316058545A)
if not exists (select name from master.dbo.sysxlogins where name='bsidhu')
EXEC master..sp_addlogin 'bsidhu', @pwd, @sid = 0x4F6DE4FB67569B4E8F00713BD509D42E, @encryptopt = 'skip_encryption_old'
 
-- Login: bstreet
SET @pwd = CONVERT (varchar(256), 0x2131212F404E36282F29565122383C39)
if not exists (select name from master.dbo.sysxlogins where name='bstreet')
EXEC master..sp_addlogin 'bstreet', @pwd, @sid = 0x5C107185E4A7EE49A7DFC7CF94A4D2BE, @encryptopt = 'skip_encryption_old'
 
-- Login: bszeto
SET @pwd = CONVERT (varchar(256), 0x2131214A2122573A475A375B24453E2F)
if not exists (select name from master.dbo.sysxlogins where name='bszeto')
EXEC master..sp_addlogin 'bszeto', @pwd, @sid = 0x529120C26A7F1C458A4A8905401BED7A, @encryptopt = 'skip_encryption_old'
 
-- Login: btetlock
SET @pwd = CONVERT (varchar(256), 0x2131214A21274836223551423F21434E)
if not exists (select name from master.dbo.sysxlogins where name='btetlock')
EXEC master..sp_addlogin 'btetlock', @pwd, @sid = 0x757BC13BF6876B4D8D0FE7936855C505, @encryptopt = 'skip_encryption_old'
 
-- Login: btompkin
SET @pwd = CONVERT (varchar(256), 0x21312140284F2E53336048474147544F)
if not exists (select name from master.dbo.sysxlogins where name='btompkin')
EXEC master..sp_addlogin 'btompkin', @pwd, @sid = 0x5FF604A375711E40B39BE8B4F8D5506D, @encryptopt = 'skip_encryption_old'
 
-- Login: bvanmane
SET @pwd = CONVERT (varchar(256), 0x2131214A212534563B483D33605C3536)
if not exists (select name from master.dbo.sysxlogins where name='bvanmane')
EXEC master..sp_addlogin 'bvanmane', @pwd, @sid = 0x6D60385A8424EB46823ED859857FFD67, @encryptopt = 'skip_encryption_old'
 
-- Login: bvanmanen
SET @pwd = CONVERT (varchar(256), 0x2131214A212C303327295A5B5D33454A)
if not exists (select name from master.dbo.sysxlogins where name='bvanmanen')
EXEC master..sp_addlogin 'bvanmanen', @pwd, @sid = 0x4A3A70677838B046835B535D98B318A4, @encryptopt = 'skip_encryption_old'
 
-- Login: bvindusk
SET @pwd = CONVERT (varchar(256), 0x2131214A212958322C3A4A5741363434)
if not exists (select name from master.dbo.sysxlogins where name='bvindusk')
EXEC master..sp_addlogin 'bvindusk', @pwd, @sid = 0x6F8BBCF60CCDC046B8ECEF74DB32B6CD, @encryptopt = 'skip_encryption_old'
 
-- Login: bweinerm
SET @pwd = CONVERT (varchar(256), 0x2131214A212540303E2B2247583E4837)
if not exists (select name from master.dbo.sysxlogins where name='bweinerm')
EXEC master..sp_addlogin 'bweinerm', @pwd, @sid = 0x3DE19C4B64C1EA41ABE9CF4A745CF48F, @encryptopt = 'skip_encryption_old'
 
-- Login: bwilliam
SET @pwd = CONVERT (varchar(256), 0x213121532255235236273B3D32382745)
if not exists (select name from master.dbo.sysxlogins where name='bwilliam')
EXEC master..sp_addlogin 'bwilliam', @pwd, @sid = 0x5CB936D78B9AB1438948D18DF951C673, @encryptopt = 'skip_encryption_old'
 
-- Login: cagrant
SET @pwd = CONVERT (varchar(256), 0x2131223436593B5A3B2A2F2C4E294657)
if not exists (select name from master.dbo.sysxlogins where name='cagrant')
EXEC master..sp_addlogin 'cagrant', @pwd, @sid = 0x53BC1D228F9E304F99BD0DA2D619A0FC, @encryptopt = 'skip_encryption_old'
 
-- Login: calexand
SET @pwd = CONVERT (varchar(256), 0x2131214A212C27473F5D5937314A4A2E)
if not exists (select name from master.dbo.sysxlogins where name='calexand')
EXEC master..sp_addlogin 'calexand', @pwd, @sid = 0xC626968E8497A045BECD87569E824AB8, @encryptopt = 'skip_encryption_old'
 
-- Login: callen
SET @pwd = CONVERT (varchar(256), 0x2131214A212D60224C4F3E264D5C4726)
if not exists (select name from master.dbo.sysxlogins where name='callen')
EXEC master..sp_addlogin 'callen', @pwd, @sid = 0x83891C33FC838947884128B20402F158, @encryptopt = 'skip_encryption_old'
 
-- Login: carmstro
SET @pwd = CONVERT (varchar(256), 0x2131214A21245E3A2C28604C29443B60)
if not exists (select name from master.dbo.sysxlogins where name='carmstro')
EXEC master..sp_addlogin 'carmstro', @pwd, @sid = 0xE6B610257362424FA95C10B6AF2E12C7, @encryptopt = 'skip_encryption_old'
 
-- Login: carodger
SET @pwd = CONVERT (varchar(256), 0x2131214A21275A5A3151244135573F34)
if not exists (select name from master.dbo.sysxlogins where name='carodger')
EXEC master..sp_addlogin 'carodger', @pwd, @sid = 0xD1AC2CED16A21D4CA72B243809F870A2, @encryptopt = 'skip_encryption_old'
 
-- Login: cawong
SET @pwd = CONVERT (varchar(256), 0x2131242E29483F50552F343B2F44442B)
if not exists (select name from master.dbo.sysxlogins where name='cawong')
EXEC master..sp_addlogin 'cawong', @pwd, @sid = 0x65B7D09EF8144348BD4869ABE95912FC, @encryptopt = 'skip_encryption_old'
 
-- Login: cblaquiere
SET @pwd = CONVERT (varchar(256), 0x2131214A212444432C2B563B4E413934)
if not exists (select name from master.dbo.sysxlogins where name='cblaquiere')
EXEC master..sp_addlogin 'cblaquiere', @pwd, @sid = 0x827A9BDF0F708C4C895A38B534E14A32, @encryptopt = 'skip_encryption_old'
 
-- Login: cblyth
SET @pwd = CONVERT (varchar(256), 0x2131214A2126443B3D5760365C422B30)
if not exists (select name from master.dbo.sysxlogins where name='cblyth')
EXEC master..sp_addlogin 'cblyth', @pwd, @sid = 0x3F8CF2646BAAA1419FF1918ABC06FE49, @encryptopt = 'skip_encryption_old'
 
-- Login: cboss
SET @pwd = CONVERT (varchar(256), 0x2131214A21214036223950342E4A5E2D)
if not exists (select name from master.dbo.sysxlogins where name='cboss')
EXEC master..sp_addlogin 'cboss', @pwd, @sid = 0x55A47A099593D145B34DB6CBAE4D588C, @encryptopt = 'skip_encryption_old'
 
-- Login: cboyd
SET @pwd = CONVERT (varchar(256), 0x2131222B305E2960393439425D494633)
if not exists (select name from master.dbo.sysxlogins where name='cboyd')
EXEC master..sp_addlogin 'cboyd', @pwd, @sid = 0x90BFA78E6008DE42865770C73195CF7C, @encryptopt = 'skip_encryption_old'
 
-- Login: cboyden
SET @pwd = CONVERT (varchar(256), 0x213121443321285C3B435A3828532B50)
if not exists (select name from master.dbo.sysxlogins where name='cboyden')
EXEC master..sp_addlogin 'cboyden', @pwd, @sid = 0xEE787262D1372846911A2B21D83E9D42, @encryptopt = 'skip_encryption_old'
 
-- Login: cbroughton
SET @pwd = CONVERT (varchar(256), 0x2131235F272A4E3451554B4960573121)
if not exists (select name from master.dbo.sysxlogins where name='cbroughton')
EXEC master..sp_addlogin 'cbroughton', @pwd, @sid = 0xC17B131064D443449E92F109EEDB0070, @encryptopt = 'skip_encryption_old'
 
-- Login: cbrownle
SET @pwd = CONVERT (varchar(256), 0x21312124384026373450462C45293F21)
if not exists (select name from master.dbo.sysxlogins where name='cbrownle')
EXEC master..sp_addlogin 'cbrownle', @pwd, @sid = 0x8D79BC6540ED8D47AE1514E868F3B7E4, @encryptopt = 'skip_encryption_old'
 
-- Login: cburns
SET @pwd = CONVERT (varchar(256), 0x213121363B505B294D3F394860285743)
if not exists (select name from master.dbo.sysxlogins where name='cburns')
EXEC master..sp_addlogin 'cburns', @pwd, @sid = 0x379BC419E970AE468ABA785D7ACA91D6, @encryptopt = 'skip_encryption_old'
 
-- Login: ccampbell
SET @pwd = CONVERT (varchar(256), 0x213123372651552C2343552C5C57455D)
if not exists (select name from master.dbo.sysxlogins where name='ccampbell')
EXEC master..sp_addlogin 'ccampbell', @pwd, @sid = 0x28B1401CE2CEBD4797A1A729BE24E197, @encryptopt = 'skip_encryption_old'
 
-- Login: ccecchi
SET @pwd = CONVERT (varchar(256), 0x2131214A212A272A4F4F4D5533334D52)
if not exists (select name from master.dbo.sysxlogins where name='ccecchi')
EXEC master..sp_addlogin 'ccecchi', @pwd, @sid = 0x5733A1E45B1FB34FA464D1E7D599DAB7, @encryptopt = 'skip_encryption_old'
 
-- Login: cchandra
SET @pwd = CONVERT (varchar(256), 0x2131214A2125474E585A36212B563D37)
if not exists (select name from master.dbo.sysxlogins where name='cchandra')
EXEC master..sp_addlogin 'cchandra', @pwd, @sid = 0x0230BC5D70BCA94489A52E590C2D4812, @encryptopt = 'skip_encryption_old'
 
-- Login: ccondie
SET @pwd = CONVERT (varchar(256), 0x2131214A2125222C212E342D3C57573F)
if not exists (select name from master.dbo.sysxlogins where name='ccondie')
EXEC master..sp_addlogin 'ccondie', @pwd, @sid = 0x70052C4F94CC1F49B2065FBFCFB7C04B, @encryptopt = 'skip_encryption_old'
 
-- Login: ccoppin
SET @pwd = CONVERT (varchar(256), 0x2131243D243F35295935502457484730)
if not exists (select name from master.dbo.sysxlogins where name='ccoppin')
EXEC master..sp_addlogin 'ccoppin', @pwd, @sid = 0x56E29F7D9A59E643BE0348C9A989396E, @encryptopt = 'skip_encryption_old'
 
-- Login: ccrumback
SET @pwd = CONVERT (varchar(256), 0x213123253A5F235946443144584F384D)
if not exists (select name from master.dbo.sysxlogins where name='ccrumback')
EXEC master..sp_addlogin 'ccrumback', @pwd, @sid = 0x2FF5C3EAE20C644D9B300823B54538E2, @encryptopt = 'skip_encryption_old'
 
-- Login: cdangelo
SET @pwd = CONVERT (varchar(256), 0x2131222A385F463E5E544D3039255E2B)
if not exists (select name from master.dbo.sysxlogins where name='cdangelo')
EXEC master..sp_addlogin 'cdangelo', @pwd, @sid = 0x11403C8E3313F642AA7C0E27374C5D87, @encryptopt = 'skip_encryption_old'
 
-- Login: cdavis
SET @pwd = CONVERT (varchar(256), 0x2131235F27232C3E533140313D323A52)
if not exists (select name from master.dbo.sysxlogins where name='cdavis')
EXEC master..sp_addlogin 'cdavis', @pwd, @sid = 0x3365B399A7F5D04E8595849110684DD9, @encryptopt = 'skip_encryption_old'
 
-- Login: cdelmaire
SET @pwd = CONVERT (varchar(256), 0x2131214A212C4D2A2B2151253E5F4146)
if not exists (select name from master.dbo.sysxlogins where name='cdelmaire')
EXEC master..sp_addlogin 'cdelmaire', @pwd, @sid = 0x9F80D669AC48A840AE3926BDBB61AF87, @encryptopt = 'skip_encryption_old'
 
-- Login: cfellows
SET @pwd = CONVERT (varchar(256), 0x213121412138325A2E41553E42434A3E)
if not exists (select name from master.dbo.sysxlogins where name='cfellows')
EXEC master..sp_addlogin 'cfellows', @pwd, @sid = 0xAEAAE3975C6CD54691B8A917406E4221, @encryptopt = 'skip_encryption_old'
 
-- Login: cfietz
SET @pwd = CONVERT (varchar(256), 0x2131214A212F323A4426302C435A4D26)
if not exists (select name from master.dbo.sysxlogins where name='cfietz')
EXEC master..sp_addlogin 'cfietz', @pwd, @sid = 0x0255AFEC60447340872E5B591CC3792A, @encryptopt = 'skip_encryption_old'
 
-- Login: cfitzger
SET @pwd = CONVERT (varchar(256), 0x2131214A21243D264A26584E255B284D)
if not exists (select name from master.dbo.sysxlogins where name='cfitzger')
EXEC master..sp_addlogin 'cfitzger', @pwd, @sid = 0xF1D80EEE5C797D4F8C5BF5CDD63B3EC5, @encryptopt = 'skip_encryption_old'
 
-- Login: cforsyth
SET @pwd = CONVERT (varchar(256), 0x2131214A2130492A264241274F263041)
if not exists (select name from master.dbo.sysxlogins where name='cforsyth')
EXEC master..sp_addlogin 'cforsyth', @pwd, @sid = 0xFBE399CD0E436543920EBC1B5A40E568, @encryptopt = 'skip_encryption_old'
 
-- Login: cgamble
SET @pwd = CONVERT (varchar(256), 0x2131214A24463E5B32565F5E22365255)
if not exists (select name from master.dbo.sysxlogins where name='cgamble')
EXEC master..sp_addlogin 'cgamble', @pwd, @sid = 0x1EDAE676BA743A45835BE9C9E0B6B2AF, @encryptopt = 'skip_encryption_old'
 
-- Login: cgauthie
SET @pwd = CONVERT (varchar(256), 0x2131214A212137432433485922563A26)
if not exists (select name from master.dbo.sysxlogins where name='cgauthie')
EXEC master..sp_addlogin 'cgauthie', @pwd, @sid = 0xD19D577E6D41B8489ABA617D0DC62746, @encryptopt = 'skip_encryption_old'
 
-- Login: cgiles
SET @pwd = CONVERT (varchar(256), 0x2131234F3D47232F265F51214E4F2B32)
if not exists (select name from master.dbo.sysxlogins where name='cgiles')
EXEC master..sp_addlogin 'cgiles', @pwd, @sid = 0x5AAD661D201B7B4FA6D03DAA4C9D16A6, @encryptopt = 'skip_encryption_old'
 
-- Login: cgordon
SET @pwd = CONVERT (varchar(256), 0x2131214A2129545E2F4F425E2A4E5C37)
if not exists (select name from master.dbo.sysxlogins where name='cgordon')
EXEC master..sp_addlogin 'cgordon', @pwd, @sid = 0x983DEFC539874D4FB576412BFBECB26A, @encryptopt = 'skip_encryption_old'
 
-- Login: chackman
SET @pwd = CONVERT (varchar(256), 0x2131214A212A22372D285147423A5952)
if not exists (select name from master.dbo.sysxlogins where name='chackman')
EXEC master..sp_addlogin 'chackman', @pwd, @sid = 0x6FD86FF1B1FE6A479A33CBB5EE90BF36, @encryptopt = 'skip_encryption_old'
 
-- Login: chaight
SET @pwd = CONVERT (varchar(256), 0x21312442334B39422D3A305D4328274B)
if not exists (select name from master.dbo.sysxlogins where name='chaight')
EXEC master..sp_addlogin 'chaight', @pwd, @sid = 0x755BAA30F1AFE6459291B40664C28A93, @encryptopt = 'skip_encryption_old'
 
-- Login: charder
SET @pwd = CONVERT (varchar(256), 0x213121443329552D4342565D3D4E3E30)
if not exists (select name from master.dbo.sysxlogins where name='charder')
EXEC master..sp_addlogin 'charder', @pwd, @sid = 0x4569F71F2605544F9024D9CB4D9E49FB, @encryptopt = 'skip_encryption_old'
 
-- Login: charris
SET @pwd = CONVERT (varchar(256), 0x2131214A212F262457535F4F40585F43)
if not exists (select name from master.dbo.sysxlogins where name='charris')
EXEC master..sp_addlogin 'charris', @pwd, @sid = 0x4A54DED118060C488DF3A07C9E75D35C, @encryptopt = 'skip_encryption_old'
 
-- Login: chartloc
if not exists (select name from master.dbo.sysxlogins where name='chartloc')
EXEC master..sp_addlogin 'chartloc', NULL, @sid = 0x9615F5AA0F502447A53406E8040FF5D9, @encryptopt = 'skip_encryption_old'
 
-- Login: chay
SET @pwd = CONVERT (varchar(256), 0x2131214A2126454B34302C3345535152)
if not exists (select name from master.dbo.sysxlogins where name='chay')
EXEC master..sp_addlogin 'chay', @pwd, @sid = 0x678C993339C6844090EB456B93224489, @encryptopt = 'skip_encryption_old'
 
-- Login: chenders
SET @pwd = CONVERT (varchar(256), 0x2131224C2E4D442D4B4952452447252D)
if not exists (select name from master.dbo.sysxlogins where name='chenders')
EXEC master..sp_addlogin 'chenders', @pwd, @sid = 0xE996095C32275C4F976B3184B7BB0B3C, @encryptopt = 'skip_encryption_old'
 
-- Login: chiggins
SET @pwd = CONVERT (varchar(256), 0x2131214A2124282933552648602F2344)
if not exists (select name from master.dbo.sysxlogins where name='chiggins')
EXEC master..sp_addlogin 'chiggins', @pwd, @sid = 0x7FCB0372F8BE2D44AFF3D850BDE8A381, @encryptopt = 'skip_encryption_old'
 
-- Login: chlindbe
SET @pwd = CONVERT (varchar(256), 0x2131214A212D31553E5F52384B3D393C)
if not exists (select name from master.dbo.sysxlogins where name='chlindbe')
EXEC master..sp_addlogin 'chlindbe', @pwd, @sid = 0x602C702AE6E1FC489DB6BBDCC9FA537B, @encryptopt = 'skip_encryption_old'
 
-- Login: chogaboam
SET @pwd = CONVERT (varchar(256), 0x2131214A2128592F54303A3922214252)
if not exists (select name from master.dbo.sysxlogins where name='chogaboam')
EXEC master..sp_addlogin 'chogaboam', @pwd, @sid = 0xC71E299A12DEC0499E8DDCF6281B52F1, @encryptopt = 'skip_encryption_old'
 
-- Login: chsmith
SET @pwd = CONVERT (varchar(256), 0x2131214A21223F314F5D41534035352F)
if not exists (select name from master.dbo.sysxlogins where name='chsmith')
EXEC master..sp_addlogin 'chsmith', @pwd, @sid = 0x0A5A49F7349BB44E99E402A66AE77D9A, @encryptopt = 'skip_encryption_old'
 
-- Login: chubacca
SET @pwd = CONVERT (varchar(256), 0x2131214A21235B3F5E5F3F334852484F)
if not exists (select name from master.dbo.sysxlogins where name='chubacca')
EXEC master..sp_addlogin 'chubacca', @pwd, @sid = 0x4BA301C0EABFF5458CD92C69B5584281, @encryptopt = 'skip_encryption_old'
 
-- Login: cireland
SET @pwd = CONVERT (varchar(256), 0x2131224A3C2C302C2A4B344B3C2E5049)
if not exists (select name from master.dbo.sysxlogins where name='cireland')
EXEC master..sp_addlogin 'cireland', @pwd, @sid = 0x2B97C5A9FAB09A4E83753F6C0A6B4C4C, @encryptopt = 'skip_encryption_old'
 
-- Login: cjackson
SET @pwd = CONVERT (varchar(256), 0x2131214A21255A30445C5E45455C5D54)
if not exists (select name from master.dbo.sysxlogins where name='cjackson')
EXEC master..sp_addlogin 'cjackson', @pwd, @sid = 0x7B128527476D274BB42F78AC93159B41, @encryptopt = 'skip_encryption_old'
 
-- Login: cjacob
SET @pwd = CONVERT (varchar(256), 0x2131214129394C2B30435B3F604A5356)
if not exists (select name from master.dbo.sysxlogins where name='cjacob')
EXEC master..sp_addlogin 'cjacob', @pwd, @sid = 0x5F2876E18E8FA54CAA3E8421D408CCE2, @encryptopt = 'skip_encryption_old'
 
-- Login: cjarvis
SET @pwd = CONVERT (varchar(256), 0x2131235C313B305F5D53414B2C285A2F)
if not exists (select name from master.dbo.sysxlogins where name='cjarvis')
EXEC master..sp_addlogin 'cjarvis', @pwd, @sid = 0xFDF25AD839AE5D4C82C9749FE9465126, @encryptopt = 'skip_encryption_old'
 
-- Login: cjeffs
SET @pwd = CONVERT (varchar(256), 0x2131214A21233A5323324D234D5E234C)
if not exists (select name from master.dbo.sysxlogins where name='cjeffs')
EXEC master..sp_addlogin 'cjeffs', @pwd, @sid = 0x633CF35505A7344B8874DE918C29197E, @encryptopt = 'skip_encryption_old'
 
-- Login: cjenkins
SET @pwd = CONVERT (varchar(256), 0x2131214A2121435D582D32544D2F2A2E)
if not exists (select name from master.dbo.sysxlogins where name='cjenkins')
EXEC master..sp_addlogin 'cjenkins', @pwd, @sid = 0xE1FAF9009372A74D94ADE77171FB31E9, @encryptopt = 'skip_encryption_old'
 
-- Login: cjimenez
SET @pwd = CONVERT (varchar(256), 0x2131214A2122533D39383952262B2C22)
if not exists (select name from master.dbo.sysxlogins where name='cjimenez')
EXEC master..sp_addlogin 'cjimenez', @pwd, @sid = 0x22CA18B8D7C06A40B67707B295E2F013, @encryptopt = 'skip_encryption_old'
 
-- Login: ckiel
SET @pwd = CONVERT (varchar(256), 0x2131215F245B2E3D365D424628473032)
if not exists (select name from master.dbo.sysxlogins where name='ckiel')
EXEC master..sp_addlogin 'ckiel', @pwd, @sid = 0xF5985E4BE72FEE4986AD6468384A7760, @encryptopt = 'skip_encryption_old'
 
-- Login: ckonefal
SET @pwd = CONVERT (varchar(256), 0x213124413A29475141483951535C3237)
if not exists (select name from master.dbo.sysxlogins where name='ckonefal')
EXEC master..sp_addlogin 'ckonefal', @pwd, @sid = 0xD4DE271A5E2F6D4AA58380D5F19A4A95, @encryptopt = 'skip_encryption_old'
 
-- Login: clachari
SET @pwd = CONVERT (varchar(256), 0x2131223F2D264F2546333D55403A2E2F)
if not exists (select name from master.dbo.sysxlogins where name='clachari')
EXEC master..sp_addlogin 'clachari', @pwd, @sid = 0x4307947A0D31B642BA7A8FF6D98F9BAB, @encryptopt = 'skip_encryption_old'
 
-- Login: clafonta
SET @pwd = CONVERT (varchar(256), 0x2131214A21282A2647305831454F5B25)
if not exists (select name from master.dbo.sysxlogins where name='clafonta')
EXEC master..sp_addlogin 'clafonta', @pwd, @sid = 0x6BFB10518FD10A42BDE436CB380C788E, @encryptopt = 'skip_encryption_old'
 
-- Login: cleckei
if not exists (select name from master.dbo.sysxlogins where name='cleckei')
EXEC master..sp_addlogin 'cleckei', NULL, @sid = 0x45FBCCA8592C88439A526A3C1906AC53, @encryptopt = 'skip_encryption_old'
 
-- Login: cleckie
SET @pwd = CONVERT (varchar(256), 0x2131235F272954373C275F3855463F2A)
if not exists (select name from master.dbo.sysxlogins where name='cleckie')
EXEC master..sp_addlogin 'cleckie', @pwd, @sid = 0xD407741B32C85C408580602E8D97ADCE, @encryptopt = 'skip_encryption_old'
 
-- Login: clee
SET @pwd = CONVERT (varchar(256), 0x2131214A21304B3E30546050335B2C43)
if not exists (select name from master.dbo.sysxlogins where name='clee')
EXEC master..sp_addlogin 'clee', @pwd, @sid = 0xF2B17EF301CDA74CAD9EA57605E0BE77, @encryptopt = 'skip_encryption_old'
 
-- Login: cleong
SET @pwd = CONVERT (varchar(256), 0x213122543848375A252B45444A323B2D)
if not exists (select name from master.dbo.sysxlogins where name='cleong')
EXEC master..sp_addlogin 'cleong', @pwd, @sid = 0xDC5BF0DEA70B7346B92F2001B2419EE7, @encryptopt = 'skip_encryption_old'
 
-- Login: clepore
SET @pwd = CONVERT (varchar(256), 0x2131214A21223A553F3050303D2E5826)
if not exists (select name from master.dbo.sysxlogins where name='clepore')
EXEC master..sp_addlogin 'clepore', @pwd, @sid = 0xCB8C6FECAC771C4DBF7B2BE0CBA720BE, @encryptopt = 'skip_encryption_old'
 
-- Login: climpright
SET @pwd = CONVERT (varchar(256), 0x2131214A2123454E2C412F4C2B553238)
if not exists (select name from master.dbo.sysxlogins where name='climpright')
EXEC master..sp_addlogin 'climpright', @pwd, @sid = 0x8314EA5ECFB27A4DA29E83819E99C891, @encryptopt = 'skip_encryption_old'
 
-- Login: clivesay
SET @pwd = CONVERT (varchar(256), 0x21312421283C3E5C40533B284F592D24)
if not exists (select name from master.dbo.sysxlogins where name='clivesay')
EXEC master..sp_addlogin 'clivesay', @pwd, @sid = 0x6E53D969684DF6488578C2C6FE3ED04B, @encryptopt = 'skip_encryption_old'
 
-- Login: clivesey
SET @pwd = CONVERT (varchar(256), 0x2131242F233E5953403B562F4B2D5935)
if not exists (select name from master.dbo.sysxlogins where name='clivesey')
EXEC master..sp_addlogin 'clivesey', @pwd, @sid = 0x2511E09CF42ECB4BB43F44E777A2125C, @encryptopt = 'skip_encryption_old'
 
-- Login: clloyd
SET @pwd = CONVERT (varchar(256), 0x2131214A212C212D3231274B244F5747)
if not exists (select name from master.dbo.sysxlogins where name='clloyd')
EXEC master..sp_addlogin 'clloyd', @pwd, @sid = 0x1B8D32AE79BA9241813F8CD83F265B52, @encryptopt = 'skip_encryption_old'
 
-- Login: clockhar
SET @pwd = CONVERT (varchar(256), 0x2131214631575A52315442325E243B5B)
if not exists (select name from master.dbo.sysxlogins where name='clockhar')
EXEC master..sp_addlogin 'clockhar', @pwd, @sid = 0xABE5D2E4E2878B4FAF09CE29C3216670, @encryptopt = 'skip_encryption_old'
 
-- Login: cludgate
SET @pwd = CONVERT (varchar(256), 0x213124523C352934543A425D3D594C5C)
if not exists (select name from master.dbo.sysxlogins where name='cludgate')
EXEC master..sp_addlogin 'cludgate', @pwd, @sid = 0x5CEF167BB6CC3B4989B5B4C0F5D45F31, @encryptopt = 'skip_encryption_old'
 
-- Login: cmah
SET @pwd = CONVERT (varchar(256), 0x2131214A212A305841425F5C492B345F)
if not exists (select name from master.dbo.sysxlogins where name='cmah')
EXEC master..sp_addlogin 'cmah', @pwd, @sid = 0xC0012B800A0BC546B370EB0502519980, @encryptopt = 'skip_encryption_old'
 
-- Login: cmann
SET @pwd = CONVERT (varchar(256), 0x2131214A2123232A4C3D5E5156383D57)
if not exists (select name from master.dbo.sysxlogins where name='cmann')
EXEC master..sp_addlogin 'cmann', @pwd, @sid = 0xADEEFBBDDF8CBC45838EE84F40C195CB, @encryptopt = 'skip_encryption_old'
 
-- Login: cmanzard
SET @pwd = CONVERT (varchar(256), 0x2131214A2122292A46375138433A2D55)
if not exists (select name from master.dbo.sysxlogins where name='cmanzard')
EXEC master..sp_addlogin 'cmanzard', @pwd, @sid = 0x995859F65F40604CB9E2C9E258636DE4, @encryptopt = 'skip_encryption_old'
 
-- Login: cmarchal
SET @pwd = CONVERT (varchar(256), 0x2131213624275D4C5C272E2B5B51502A)
if not exists (select name from master.dbo.sysxlogins where name='cmarchal')
EXEC master..sp_addlogin 'cmarchal', @pwd, @sid = 0x7F774D42B2CC394F8C66A27A3219AB62, @encryptopt = 'skip_encryption_old'
 
-- Login: cmarshal
SET @pwd = CONVERT (varchar(256), 0x2131225C24243530305B41304242262E)
if not exists (select name from master.dbo.sysxlogins where name='cmarshal')
EXEC master..sp_addlogin 'cmarshal', @pwd, @sid = 0xD6A9DBA9177C6547BF2B03DAC3E9F621, @encryptopt = 'skip_encryption_old'
 
-- Login: cmassy
SET @pwd = CONVERT (varchar(256), 0x2131214A21253644454F5A4D523A2E23)
if not exists (select name from master.dbo.sysxlogins where name='cmassy')
EXEC master..sp_addlogin 'cmassy', @pwd, @sid = 0x4FFDB2119BDA0345B23941D45E9902A7, @encryptopt = 'skip_encryption_old'
 
-- Login: cmcgilli
SET @pwd = CONVERT (varchar(256), 0x2131214A212723224A3B245C554B3556)
if not exists (select name from master.dbo.sysxlogins where name='cmcgilli')
EXEC master..sp_addlogin 'cmcgilli', @pwd, @sid = 0x5A4E12E17EEC0D4EB3EE61BD0AEF8CCF, @encryptopt = 'skip_encryption_old'
 
-- Login: cmcguire
SET @pwd = CONVERT (varchar(256), 0x21312155385D4A3C325C2C442F48372F)
if not exists (select name from master.dbo.sysxlogins where name='cmcguire')
EXEC master..sp_addlogin 'cmcguire', @pwd, @sid = 0x5D945BA224DE5A4E8F0F757EDB3AAAC4, @encryptopt = 'skip_encryption_old'
 
-- Login: cmclean
SET @pwd = CONVERT (varchar(256), 0x2131214A2130512450355C503755575B)
if not exists (select name from master.dbo.sysxlogins where name='cmclean')
EXEC master..sp_addlogin 'cmclean', @pwd, @sid = 0xDA5052CB9D573E409114820E3C0532B5, @encryptopt = 'skip_encryption_old'
 
-- Login: cmclerie
SET @pwd = CONVERT (varchar(256), 0x21312249345758592D5B4837492D3857)
if not exists (select name from master.dbo.sysxlogins where name='cmclerie')
EXEC master..sp_addlogin 'cmclerie', @pwd, @sid = 0x388497EDEF963C4F928800C3B9BCD882, @encryptopt = 'skip_encryption_old'
 
-- Login: cmeilleu
SET @pwd = CONVERT (varchar(256), 0x2131214A2125522721274E4A5F234E37)
if not exists (select name from master.dbo.sysxlogins where name='cmeilleu')
EXEC master..sp_addlogin 'cmeilleu', @pwd, @sid = 0xD11B5F00EB2C3143A7DD6EBC9F93CAC5, @encryptopt = 'skip_encryption_old'
 
-- Login: cmills
SET @pwd = CONVERT (varchar(256), 0x213123302B2C45353A4259232A453160)
if not exists (select name from master.dbo.sysxlogins where name='cmills')
EXEC master..sp_addlogin 'cmills', @pwd, @sid = 0xCDE9D73D4D1E9444ACBCA99C5FE5BE66, @encryptopt = 'skip_encryption_old'
 
-- Login: cmorton
SET @pwd = CONVERT (varchar(256), 0x2131214A212E5E305E58313D2A454E31)
if not exists (select name from master.dbo.sysxlogins where name='cmorton')
EXEC master..sp_addlogin 'cmorton', @pwd, @sid = 0xBB7807415F897D4E92DEF5539E29303D, @encryptopt = 'skip_encryption_old'
 
-- Login: cmsdev
SET @pwd = CONVERT (varchar(256), 0x2131214A212B56585F57515054222E2F)
if not exists (select name from master.dbo.sysxlogins where name='cmsdev')
EXEC master..sp_addlogin 'cmsdev', @pwd, @sid = 0x4D3B5B319501F3468046C79DA72CD403, @encryptopt = 'skip_encryption_old'
 
-- Login: cmsdload
SET @pwd = CONVERT (varchar(256), 0x2131242D33255730463D51523B3F5F21)
if not exists (select name from master.dbo.sysxlogins where name='cmsdload')
EXEC master..sp_addlogin 'cmsdload', @pwd, @sid = 0xB2A967F89E1170469B16D548E00B12BF, @encryptopt = 'skip_encryption_old'
 
-- Login: cmusacch
SET @pwd = CONVERT (varchar(256), 0x213124223E385C5B412525563627303B)
if not exists (select name from master.dbo.sysxlogins where name='cmusacch')
EXEC master..sp_addlogin 'cmusacch', @pwd, @sid = 0x6054D99F1CE1BF47B6C1BC8D7CC8FDB3, @encryptopt = 'skip_encryption_old'
 
-- Login: cnault
SET @pwd = CONVERT (varchar(256), 0x21312443345D2830482B30604B282924)
if not exists (select name from master.dbo.sysxlogins where name='cnault')
EXEC master..sp_addlogin 'cnault', @pwd, @sid = 0x0CC2B9ED63B2E4478CF4B681EA8AA1A9, @encryptopt = 'skip_encryption_old'
 
-- Login: cng
SET @pwd = CONVERT (varchar(256), 0x21312342263D5C444C2E2747215A5142)
if not exists (select name from master.dbo.sysxlogins where name='cng')
EXEC master..sp_addlogin 'cng', @pwd, @sid = 0x1245FDB076FBD14AB5679FC88D2ED51F, @encryptopt = 'skip_encryption_old'
 
-- Login: cnielsen
SET @pwd = CONVERT (varchar(256), 0x2131214A212B233A475450503223575A)
if not exists (select name from master.dbo.sysxlogins where name='cnielsen')
EXEC master..sp_addlogin 'cnielsen', @pwd, @sid = 0xCCE8D7180A247B4A98311C6E27E831B9, @encryptopt = 'skip_encryption_old'
 
-- Login: cnielson
SET @pwd = CONVERT (varchar(256), 0x2131214A212C30532422305648502D47)
if not exists (select name from master.dbo.sysxlogins where name='cnielson')
EXEC master..sp_addlogin 'cnielson', @pwd, @sid = 0x24C94590A5DD4045BE4E42CDFB8DE10C, @encryptopt = 'skip_encryption_old'
 
-- Login: cnoll
SET @pwd = CONVERT (varchar(256), 0x2131214A213037343A215E573D592824)
if not exists (select name from master.dbo.sysxlogins where name='cnoll')
EXEC master..sp_addlogin 'cnoll', @pwd, @sid = 0xFE97A3869833BF42B97A45B68900A109, @encryptopt = 'skip_encryption_old'
 
-- Login: cobrien
SET @pwd = CONVERT (varchar(256), 0x2131214A21273427404B3E3C3821222E)
if not exists (select name from master.dbo.sysxlogins where name='cobrien')
EXEC master..sp_addlogin 'cobrien', @pwd, @sid = 0x7E3DC69FF900234990C4D624C5DF1A18, @encryptopt = 'skip_encryption_old'
 
-- Login: cokelly
SET @pwd = CONVERT (varchar(256), 0x21312144332A23593A54584253395554)
if not exists (select name from master.dbo.sysxlogins where name='cokelly')
EXEC master..sp_addlogin 'cokelly', @pwd, @sid = 0x22DB0B2BAF5B7A4AB29FC92B47096BEE, @encryptopt = 'skip_encryption_old'
 
-- Login: cope
SET @pwd = CONVERT (varchar(256), 0x2131244A304323544031484B4F394E49)
if not exists (select name from master.dbo.sysxlogins where name='cope')
EXEC master..sp_addlogin 'cope', @pwd, @sid = 0x3C4A009E00ADF44C8CD47FDF61A55774, @encryptopt = 'skip_encryption_old'
 
-- Login: corobins
SET @pwd = CONVERT (varchar(256), 0x2131214A2122383A312D545C57424C3C)
if not exists (select name from master.dbo.sysxlogins where name='corobins')
EXEC master..sp_addlogin 'corobins', @pwd, @sid = 0x9A8EC4D0684EB944A129DB31112FC3E0, @encryptopt = 'skip_encryption_old'
 
-- Login: corphani
SET @pwd = CONVERT (varchar(256), 0x2131214A21214E4623453A5654555854)
if not exists (select name from master.dbo.sysxlogins where name='corphani')
EXEC master..sp_addlogin 'corphani', @pwd, @sid = 0x1A6C53B384A9BF42B1D9A41BCC33340B, @encryptopt = 'skip_encryption_old'
 
-- Login: cpaltiel
SET @pwd = CONVERT (varchar(256), 0x2131214A2121393D5A53562F3346532C)
if not exists (select name from master.dbo.sysxlogins where name='cpaltiel')
EXEC master..sp_addlogin 'cpaltiel', @pwd, @sid = 0x3A2E1DB9255B64408AE2B812E9A8162D, @encryptopt = 'skip_encryption_old'
 
-- Login: cpark
if not exists (select name from master.dbo.sysxlogins where name='cpark')
EXEC master..sp_addlogin 'cpark', NULL, @sid = 0x648C0B46B3B6384499C63809E7071CFB, @encryptopt = 'skip_encryption_old'
 
-- Login: cpartrid
SET @pwd = CONVERT (varchar(256), 0x2131214A212E4B224B432B5C4F5B492F)
if not exists (select name from master.dbo.sysxlogins where name='cpartrid')
EXEC master..sp_addlogin 'cpartrid', @pwd, @sid = 0xAE41AA592A817C4DA79927E6931070EF, @encryptopt = 'skip_encryption_old'
 
-- Login: cpasutti
SET @pwd = CONVERT (varchar(256), 0x2131214A21223046255E235B3833594B)
if not exists (select name from master.dbo.sysxlogins where name='cpasutti')
EXEC master..sp_addlogin 'cpasutti', @pwd, @sid = 0x2D65AF9AFD06F44A8C317D66E51DD989, @encryptopt = 'skip_encryption_old'
 
-- Login: cpaul
SET @pwd = CONVERT (varchar(256), 0x2131235F272D365D60525D4560422A2E)
if not exists (select name from master.dbo.sysxlogins where name='cpaul')
EXEC master..sp_addlogin 'cpaul', @pwd, @sid = 0xD7294E9FA52AB941A241FC29966C6B1A, @encryptopt = 'skip_encryption_old'
 
-- Login: cpelleti
SET @pwd = CONVERT (varchar(256), 0x2131214A21285B553F514350405B3560)
if not exists (select name from master.dbo.sysxlogins where name='cpelleti')
EXEC master..sp_addlogin 'cpelleti', @pwd, @sid = 0x3A2681C51E1FCE479207E40C1DCEE9AB, @encryptopt = 'skip_encryption_old'
 
-- Login: cpeluso
SET @pwd = CONVERT (varchar(256), 0x2131224B243B60594E484B593F5A5E3F)
if not exists (select name from master.dbo.sysxlogins where name='cpeluso')
EXEC master..sp_addlogin 'cpeluso', @pwd, @sid = 0x952C33268289654EB3EE5DE55E62C281, @encryptopt = 'skip_encryption_old'
 
-- Login: cperret
SET @pwd = CONVERT (varchar(256), 0x213122422F415C3F4F4642595F525F31)
if not exists (select name from master.dbo.sysxlogins where name='cperret')
EXEC master..sp_addlogin 'cperret', @pwd, @sid = 0x0C7C968DAA28D643BCD8CA16EDFFBBC9, @encryptopt = 'skip_encryption_old'
 
-- Login: cperrich
SET @pwd = CONVERT (varchar(256), 0x21312442242B4C2F4029335B43503F28)
if not exists (select name from master.dbo.sysxlogins where name='cperrich')
EXEC master..sp_addlogin 'cperrich', @pwd, @sid = 0x1E51532D351B3140BDBF2101987727BB, @encryptopt = 'skip_encryption_old'
 
-- Login: cpickeri
SET @pwd = CONVERT (varchar(256), 0x213123253A5447363B2F292B39402A44)
if not exists (select name from master.dbo.sysxlogins where name='cpickeri')
EXEC master..sp_addlogin 'cpickeri', @pwd, @sid = 0x73BFF2FF8621584AA959CD1EB652118C, @encryptopt = 'skip_encryption_old'
 
-- Login: cpietras
SET @pwd = CONVERT (varchar(256), 0x213123473C333A3C4521333F525B5258)
if not exists (select name from master.dbo.sysxlogins where name='cpietras')
EXEC master..sp_addlogin 'cpietras', @pwd, @sid = 0xE053FA731CB4354483770BA0B6008142, @encryptopt = 'skip_encryption_old'
 
-- Login: craeside
SET @pwd = CONVERT (varchar(256), 0x2131214A212836335958324957485926)
if not exists (select name from master.dbo.sysxlogins where name='craeside')
EXEC master..sp_addlogin 'craeside', @pwd, @sid = 0xCFD7BC4A85CE5F458FB9B9DC270C282B, @encryptopt = 'skip_encryption_old'
 
-- Login: cransom
SET @pwd = CONVERT (varchar(256), 0x2131235F27224A21542D425642273123)
if not exists (select name from master.dbo.sysxlogins where name='cransom')
EXEC master..sp_addlogin 'cransom', @pwd, @sid = 0xC63909325D08CF45A637C22072DF5D5A, @encryptopt = 'skip_encryption_old'
 
-- Login: creutlin
SET @pwd = CONVERT (varchar(256), 0x2131214A212739433A3F4E513D433E59)
if not exists (select name from master.dbo.sysxlogins where name='creutlin')
EXEC master..sp_addlogin 'creutlin', @pwd, @sid = 0x42E1EA60DEE77E4B8D12839493EC61AC, @encryptopt = 'skip_encryption_old'
 
-- Login: crimbey
SET @pwd = CONVERT (varchar(256), 0x2131214A212526283646415B453B5E52)
if not exists (select name from master.dbo.sysxlogins where name='crimbey')
EXEC master..sp_addlogin 'crimbey', @pwd, @sid = 0xA44579B8B5007D449B4897A0DFAF60F3, @encryptopt = 'skip_encryption_old'
 
-- Login: crobinso
SET @pwd = CONVERT (varchar(256), 0x2131214A21295E3B552F474B342D5460)
if not exists (select name from master.dbo.sysxlogins where name='crobinso')
EXEC master..sp_addlogin 'crobinso', @pwd, @sid = 0xCC6EC8C3FCA00244BD025035723E213F, @encryptopt = 'skip_encryption_old'
 
-- Login: crother
SET @pwd = CONVERT (varchar(256), 0x2131214A21223E4C5B2A2B322741212F)
if not exists (select name from master.dbo.sysxlogins where name='crother')
EXEC master..sp_addlogin 'crother', @pwd, @sid = 0x57460B91C0045248AF6BF124BD31DD71, @encryptopt = 'skip_encryption_old'
 
-- Login: cschwind
SET @pwd = CONVERT (varchar(256), 0x21312435264321393642553F4042212B)
if not exists (select name from master.dbo.sysxlogins where name='cschwind')
EXEC master..sp_addlogin 'cschwind', @pwd, @sid = 0xBB6BBC6B2C12B142AA2B5A118FCD83B1, @encryptopt = 'skip_encryption_old'
 
-- Login: cscott
SET @pwd = CONVERT (varchar(256), 0x2131214A21263026464D3C314224585A)
if not exists (select name from master.dbo.sysxlogins where name='cscott')
EXEC master..sp_addlogin 'cscott', @pwd, @sid = 0xE1FE6C10B1C28E4BADF74F28243A8C04, @encryptopt = 'skip_encryption_old'
 
-- Login: cseselja
SET @pwd = CONVERT (varchar(256), 0x213122573C3254275A555E552533295B)
if not exists (select name from master.dbo.sysxlogins where name='cseselja')
EXEC master..sp_addlogin 'cseselja', @pwd, @sid = 0x04FC6CA43B80A94AA2BFF839CB33B4AE, @encryptopt = 'skip_encryption_old'
 
-- Login: csherrif
SET @pwd = CONVERT (varchar(256), 0x2131233138575532372D5D2C3A30545C)
if not exists (select name from master.dbo.sysxlogins where name='csherrif')
EXEC master..sp_addlogin 'csherrif', @pwd, @sid = 0xECAA4FA49509E4458994D66B698279B4, @encryptopt = 'skip_encryption_old'
 
-- Login: cskinner
SET @pwd = CONVERT (varchar(256), 0x2131215C2C2E2D242734415F3D484A22)
if not exists (select name from master.dbo.sysxlogins where name='cskinner')
EXEC master..sp_addlogin 'cskinner', @pwd, @sid = 0xE1A06F5B43649845B499E9563B8A88F7, @encryptopt = 'skip_encryption_old'
 
-- Login: cslewis
SET @pwd = CONVERT (varchar(256), 0x2131243A275A225F5F4440232638324B)
if not exists (select name from master.dbo.sysxlogins where name='cslewis')
EXEC master..sp_addlogin 'cslewis', @pwd, @sid = 0x50365CDBE03768468893B314B0423279, @encryptopt = 'skip_encryption_old'
 
-- Login: csloat
SET @pwd = CONVERT (varchar(256), 0x21312144332729592129455123574C26)
if not exists (select name from master.dbo.sysxlogins where name='csloat')
EXEC master..sp_addlogin 'csloat', @pwd, @sid = 0xBC8755877A1615408BC4F44493FF408A, @encryptopt = 'skip_encryption_old'
 
-- Login: cstanchfie
SET @pwd = CONVERT (varchar(256), 0x21312257372F3A3F5B2F5E5D484A5D35)
if not exists (select name from master.dbo.sysxlogins where name='cstanchfie')
EXEC master..sp_addlogin 'cstanchfie', @pwd, @sid = 0x1C0E4E36BA332E4CB1D0B931F9113627, @encryptopt = 'skip_encryption_old'
 
-- Login: cstertz
SET @pwd = CONVERT (varchar(256), 0x2131214A212E4321533A232744462A29)
if not exists (select name from master.dbo.sysxlogins where name='cstertz')
EXEC master..sp_addlogin 'cstertz', @pwd, @sid = 0x076B2650746B4B409AADD4F8933F85B2, @encryptopt = 'skip_encryption_old'
 
-- Login: csturdy
SET @pwd = CONVERT (varchar(256), 0x2131233138543830425A5A5A35513E57)
if not exists (select name from master.dbo.sysxlogins where name='csturdy')
EXEC master..sp_addlogin 'csturdy', @pwd, @sid = 0x838AB0325A9FEB43AD13FDFD2CC4F2F8, @encryptopt = 'skip_encryption_old'
 
-- Login: ctabata
SET @pwd = CONVERT (varchar(256), 0x2131214A21262D44315B315B53434233)
if not exists (select name from master.dbo.sysxlogins where name='ctabata')
EXEC master..sp_addlogin 'ctabata', @pwd, @sid = 0x8E4EE5C60D8F0C408E0A963CDFFD18A9, @encryptopt = 'skip_encryption_old'
 
-- Login: ctam
SET @pwd = CONVERT (varchar(256), 0x2131223E3C4F4927343E5F514B312F3B)
if not exists (select name from master.dbo.sysxlogins where name='ctam')
EXEC master..sp_addlogin 'ctam', @pwd, @sid = 0x7AC925BDF4076C43A69AA75B7BE8D251, @encryptopt = 'skip_encryption_old'
 
-- Login: ctaylor
SET @pwd = CONVERT (varchar(256), 0x2131214A21303A3D5F57235432543B54)
if not exists (select name from master.dbo.sysxlogins where name='ctaylor')
EXEC master..sp_addlogin 'ctaylor', @pwd, @sid = 0x9DE9F84EFFA5B349BCD955F501A4EE29, @encryptopt = 'skip_encryption_old'
 
-- Login: ctraer
SET @pwd = CONVERT (varchar(256), 0x2131214A212C3D5D5E5E262D38482E3D)
if not exists (select name from master.dbo.sysxlogins where name='ctraer')
EXEC master..sp_addlogin 'ctraer', @pwd, @sid = 0x7C0964064A814740AF5DE5DFF48645A7, @encryptopt = 'skip_encryption_old'
 
-- Login: ctrevisa
SET @pwd = CONVERT (varchar(256), 0x2131215A352437602A3E2E3760465140)
if not exists (select name from master.dbo.sysxlogins where name='ctrevisa')
EXEC master..sp_addlogin 'ctrevisa', @pwd, @sid = 0x2ACBE519B006A54084C63143C1713062, @encryptopt = 'skip_encryption_old'
 
-- Login: ctrudell
SET @pwd = CONVERT (varchar(256), 0x2131223F283B2F384244313539325E56)
if not exists (select name from master.dbo.sysxlogins where name='ctrudell')
EXEC master..sp_addlogin 'ctrudell', @pwd, @sid = 0xAD21E8810DEA8C4CB2FEEA6D0FF634C6, @encryptopt = 'skip_encryption_old'
 
-- Login: cturner
SET @pwd = CONVERT (varchar(256), 0x2131214A2125383B53285D4D44494025)
if not exists (select name from master.dbo.sysxlogins where name='cturner')
EXEC master..sp_addlogin 'cturner', @pwd, @sid = 0x7C3449DB25AEBF4DA6CB88E7CA8C96B2, @encryptopt = 'skip_encryption_old'
 
-- Login: cupright
SET @pwd = CONVERT (varchar(256), 0x213124482C5241573530605C2554492D)
if not exists (select name from master.dbo.sysxlogins where name='cupright')
EXEC master..sp_addlogin 'cupright', @pwd, @sid = 0xD6A66A7B8A771344B85634FB4667A0E3, @encryptopt = 'skip_encryption_old'
 
-- Login: cvandeve
SET @pwd = CONVERT (varchar(256), 0x213124523C3C3B5927503D6042454C25)
if not exists (select name from master.dbo.sysxlogins where name='cvandeve')
EXEC master..sp_addlogin 'cvandeve', @pwd, @sid = 0x141C93AE559F9D4494A384359E216E05, @encryptopt = 'skip_encryption_old'
 
-- Login: cvantong
SET @pwd = CONVERT (varchar(256), 0x2131235F272B405A565A3857363D2F4B)
if not exists (select name from master.dbo.sysxlogins where name='cvantong')
EXEC master..sp_addlogin 'cvantong', @pwd, @sid = 0xAE19109C604C15499B3CC08663CC775C, @encryptopt = 'skip_encryption_old'
 
-- Login: cward
SET @pwd = CONVERT (varchar(256), 0x2131214A21264B3E513344344F3D5534)
if not exists (select name from master.dbo.sysxlogins where name='cward')
EXEC master..sp_addlogin 'cward', @pwd, @sid = 0xC009F22535A1544E94FFD0815F8C20FE, @encryptopt = 'skip_encryption_old'
 
-- Login: cwhewell
SET @pwd = CONVERT (varchar(256), 0x2131214A212B493D214B233649493153)
if not exists (select name from master.dbo.sysxlogins where name='cwhewell')
EXEC master..sp_addlogin 'cwhewell', @pwd, @sid = 0xBCE2679304EB6C43AFC86D412226F3C7, @encryptopt = 'skip_encryption_old'
 
-- Login: cwilliam
SET @pwd = CONVERT (varchar(256), 0x2131214A2121384344393A4B342E364F)
if not exists (select name from master.dbo.sysxlogins where name='cwilliam')
EXEC master..sp_addlogin 'cwilliam', @pwd, @sid = 0x2F5B8175D9C6FE4785C5CE27EB719B03, @encryptopt = 'skip_encryption_old'
 
-- Login: cwinn
SET @pwd = CONVERT (varchar(256), 0x2131214A212F5151474137532E363259)
if not exists (select name from master.dbo.sysxlogins where name='cwinn')
EXEC master..sp_addlogin 'cwinn', @pwd, @sid = 0x6451DADCD13D44489E2E295E3F965222, @encryptopt = 'skip_encryption_old'
 
-- Login: cwong
SET @pwd = CONVERT (varchar(256), 0x21312358404D2E43535D554B48273B4F)
if not exists (select name from master.dbo.sysxlogins where name='cwong')
EXEC master..sp_addlogin 'cwong', @pwd, @sid = 0xE29CBC63E67B65429F833A09253CC1A5, @encryptopt = 'skip_encryption_old'
 
-- Login: cyu
SET @pwd = CONVERT (varchar(256), 0x21312144385434553258552B5E2E375D)
if not exists (select name from master.dbo.sysxlogins where name='cyu')
EXEC master..sp_addlogin 'cyu', @pwd, @sid = 0xC87079A10C9D3641B7FF9EAFE9A45AB1, @encryptopt = 'skip_encryption_old'
 
-- Login: dames
SET @pwd = CONVERT (varchar(256), 0x2131214A21263C383C4329406056513D)
if not exists (select name from master.dbo.sysxlogins where name='dames')
EXEC master..sp_addlogin 'dames', @pwd, @sid = 0x7291604D2DCC03428E0D166D75B7A53B, @encryptopt = 'skip_encryption_old'
 
-- Login: dareimer
SET @pwd = CONVERT (varchar(256), 0x2131214A2127376060482132303E5E4C)
if not exists (select name from master.dbo.sysxlogins where name='dareimer')
EXEC master..sp_addlogin 'dareimer', @pwd, @sid = 0xBE06ADBA8EBCBB4ABA54E4F058F4C9A4, @encryptopt = 'skip_encryption_old'
 
-- Login: dataylor
SET @pwd = CONVERT (varchar(256), 0x2131214A21274844425E2922432F2D60)
if not exists (select name from master.dbo.sysxlogins where name='dataylor')
EXEC master..sp_addlogin 'dataylor', @pwd, @sid = 0xA2FF033EAAD19D45848DCB60769A2EF3, @encryptopt = 'skip_encryption_old'
 
-- Login: dayers
SET @pwd = CONVERT (varchar(256), 0x21312453343B27363122572853462A30)
if not exists (select name from master.dbo.sysxlogins where name='dayers')
EXEC master..sp_addlogin 'dayers', @pwd, @sid = 0x5E563DD5D3062C4281363F128F40AF30, @encryptopt = 'skip_encryption_old'
 
-- Login: dayres
SET @pwd = CONVERT (varchar(256), 0x213124582C2D4B5B522A5D466055514B)
if not exists (select name from master.dbo.sysxlogins where name='dayres')
EXEC master..sp_addlogin 'dayres', @pwd, @sid = 0xACCDD22DAB37AF48801472E6A52D92CA, @encryptopt = 'skip_encryption_old'
 
-- Login: dbatch
SET @pwd = CONVERT (varchar(256), 0x2131214A212E2F5D4D514D3850383453)
if not exists (select name from master.dbo.sysxlogins where name='dbatch')
EXEC master..sp_addlogin 'dbatch', @pwd, @sid = 0x498D191A4EDEFD4DACD4BDCAA25C47D5, @encryptopt = 'skip_encryption_old'
 
-- Login: dbrockingt
SET @pwd = CONVERT (varchar(256), 0x2131214A2128535853413E3E40343547)
if not exists (select name from master.dbo.sysxlogins where name='dbrockingt')
EXEC master..sp_addlogin 'dbrockingt', @pwd, @sid = 0xAAF3BE91F3E9A441B2265660E5ED68F8, @encryptopt = 'skip_encryption_old'
 
-- Login: ddaniel
SET @pwd = CONVERT (varchar(256), 0x2131214A212A30215A3436335C5B2234)
if not exists (select name from master.dbo.sysxlogins where name='ddaniel')
EXEC master..sp_addlogin 'ddaniel', @pwd, @sid = 0xDA022918F560A9458719B2D658D74EC3, @encryptopt = 'skip_encryption_old'
 
-- Login: ddenney
SET @pwd = CONVERT (varchar(256), 0x2131214433252A3D425027434F405847)
if not exists (select name from master.dbo.sysxlogins where name='ddenney')
EXEC master..sp_addlogin 'ddenney', @pwd, @sid = 0xF3CE0C40783B3B4D971F46E83CEFA411, @encryptopt = 'skip_encryption_old'
 
-- Login: ddupuis
SET @pwd = CONVERT (varchar(256), 0x2131214433264F26544A2E253F42574D)
if not exists (select name from master.dbo.sysxlogins where name='ddupuis')
EXEC master..sp_addlogin 'ddupuis', @pwd, @sid = 0xBFA9CAFEABC934479DB0ABB1E8EF6321, @encryptopt = 'skip_encryption_old'
 
-- Login: demartin
SET @pwd = CONVERT (varchar(256), 0x2131214A2123334746393639252F5E5E)
if not exists (select name from master.dbo.sysxlogins where name='demartin')
EXEC master..sp_addlogin 'demartin', @pwd, @sid = 0x5EE6C5CA32BBC44EBDF196F6C46328A5, @encryptopt = 'skip_encryption_old'
 
-- Login: dewart
SET @pwd = CONVERT (varchar(256), 0x2131214A2129595A4E5058563D514744)
if not exists (select name from master.dbo.sysxlogins where name='dewart')
EXEC master..sp_addlogin 'dewart', @pwd, @sid = 0xCBAB9C4614F24D4FAAB00E3667593D6B, @encryptopt = 'skip_encryption_old'
 
-- Login: dfarrell
SET @pwd = CONVERT (varchar(256), 0x2131214A21213D373B4E5B215B425A41)
if not exists (select name from master.dbo.sysxlogins where name='dfarrell')
EXEC master..sp_addlogin 'dfarrell', @pwd, @sid = 0x48A50040429A18448251F6F9E1375D3E, @encryptopt = 'skip_encryption_old'
 
-- Login: dferster
SET @pwd = CONVERT (varchar(256), 0x2131232634222A4D562D4153293C3E36)
if not exists (select name from master.dbo.sysxlogins where name='dferster')
EXEC master..sp_addlogin 'dferster', @pwd, @sid = 0xB6F8001DEB52144F970556F1AC5A157B, @encryptopt = 'skip_encryption_old'
 
-- Login: dford
SET @pwd = CONVERT (varchar(256), 0x21312328404254595B5A302C55244533)
if not exists (select name from master.dbo.sysxlogins where name='dford')
EXEC master..sp_addlogin 'dford', @pwd, @sid = 0x81E0D15F0186E04F9FD97EB3EB6FABE7, @encryptopt = 'skip_encryption_old'
 
-- Login: dgibbins
SET @pwd = CONVERT (varchar(256), 0x2131214A2127474E533C4D533F5A2657)
if not exists (select name from master.dbo.sysxlogins where name='dgibbins')
EXEC master..sp_addlogin 'dgibbins', @pwd, @sid = 0x9D7055D033B8ED44BE438C2540AD9B9F, @encryptopt = 'skip_encryption_old'
 
-- Login: dgibeaul
SET @pwd = CONVERT (varchar(256), 0x21312144332D3F363444384056482460)
if not exists (select name from master.dbo.sysxlogins where name='dgibeaul')
EXEC master..sp_addlogin 'dgibeaul', @pwd, @sid = 0xF2F765DC595F334B911DA9B9A245A976, @encryptopt = 'skip_encryption_old'
 
-- Login: dgilfill
SET @pwd = CONVERT (varchar(256), 0x21312360245749343D3250412724393D)
if not exists (select name from master.dbo.sysxlogins where name='dgilfill')
EXEC master..sp_addlogin 'dgilfill', @pwd, @sid = 0xEABE596B9E1766478FCCBCB0D5FA7221, @encryptopt = 'skip_encryption_old'
 
-- Login: dgillis
SET @pwd = CONVERT (varchar(256), 0x2131214A212B4A2C473330473F3F4D44)
if not exists (select name from master.dbo.sysxlogins where name='dgillis')
EXEC master..sp_addlogin 'dgillis', @pwd, @sid = 0xBC31B33E45DB8F4D93BE673176629A93, @encryptopt = 'skip_encryption_old'
 
-- Login: dhayles
SET @pwd = CONVERT (varchar(256), 0x21312229392145545A35535D3A2C5927)
if not exists (select name from master.dbo.sysxlogins where name='dhayles')
EXEC master..sp_addlogin 'dhayles', @pwd, @sid = 0x4E436CE6369C0942A5F147FB481C8EC5, @encryptopt = 'skip_encryption_old'
 
-- Login: dhings
SET @pwd = CONVERT (varchar(256), 0x2131214A212255534B2352474E363224)
if not exists (select name from master.dbo.sysxlogins where name='dhings')
EXEC master..sp_addlogin 'dhings', @pwd, @sid = 0xA297DA4C4A6E8742AAC35D69EDDDE063, @encryptopt = 'skip_encryption_old'
 
-- Login: dhintz
SET @pwd = CONVERT (varchar(256), 0x2131214A21243A5D39593335365D3042)
if not exists (select name from master.dbo.sysxlogins where name='dhintz')
EXEC master..sp_addlogin 'dhintz', @pwd, @sid = 0xA9E189860458CB4398B545E6BE0D5346, @encryptopt = 'skip_encryption_old'
 
-- Login: dhliva
SET @pwd = CONVERT (varchar(256), 0x2131214A212D5B565A555626215D552E)
if not exists (select name from master.dbo.sysxlogins where name='dhliva')
EXEC master..sp_addlogin 'dhliva', @pwd, @sid = 0x88609988B209AE40AE9EDB9729E57A49, @encryptopt = 'skip_encryption_old'
 
-- Login: djepson
SET @pwd = CONVERT (varchar(256), 0x21312144332A333431435C3A4C4E5D3C)
if not exists (select name from master.dbo.sysxlogins where name='djepson')
EXEC master..sp_addlogin 'djepson', @pwd, @sid = 0xCB837E19721FCE438047A02D262CA0C3, @encryptopt = 'skip_encryption_old'
 
-- Login: djmooney
SET @pwd = CONVERT (varchar(256), 0x2131214A2124242E2B574B404F2C2B40)
if not exists (select name from master.dbo.sysxlogins where name='djmooney')
EXEC master..sp_addlogin 'djmooney', @pwd, @sid = 0x973D335B9B40414DA60D5314177910CA, @encryptopt = 'skip_encryption_old'
 
-- Login: djolda
SET @pwd = CONVERT (varchar(256), 0x21312432403A3A36442E224A3D4C242A)
if not exists (select name from master.dbo.sysxlogins where name='djolda')
EXEC master..sp_addlogin 'djolda', @pwd, @sid = 0xC0D434CBC31FA34F951098D9CF1DACD6, @encryptopt = 'skip_encryption_old'
 
-- Login: dkapty
SET @pwd = CONVERT (varchar(256), 0x2131214A212A2354295E2224342B573B)
if not exists (select name from master.dbo.sysxlogins where name='dkapty')
EXEC master..sp_addlogin 'dkapty', @pwd, @sid = 0x066F8ABD79211047BD7254ED5EBC2709, @encryptopt = 'skip_encryption_old'
 
-- Login: dkitazak
SET @pwd = CONVERT (varchar(256), 0x2131215339275E29572440295A3E5654)
if not exists (select name from master.dbo.sysxlogins where name='dkitazak')
EXEC master..sp_addlogin 'dkitazak', @pwd, @sid = 0x124C2422869CAE47B542AB95715F12A4, @encryptopt = 'skip_encryption_old'
 
-- Login: dlangfor
SET @pwd = CONVERT (varchar(256), 0x2131212C30522D2F3B463458415A5D5E)
if not exists (select name from master.dbo.sysxlogins where name='dlangfor')
EXEC master..sp_addlogin 'dlangfor', @pwd, @sid = 0x37B2AECD9918D94CBAE16DB3DA251CF0, @encryptopt = 'skip_encryption_old'
 
-- Login: dlaplaca
SET @pwd = CONVERT (varchar(256), 0x2131214A2128294541306023332A3230)
if not exists (select name from master.dbo.sysxlogins where name='dlaplaca')
EXEC master..sp_addlogin 'dlaplaca', @pwd, @sid = 0x9BF496584A3403478E711C2D5512273F, @encryptopt = 'skip_encryption_old'
 
-- Login: dmacdon
SET @pwd = CONVERT (varchar(256), 0x2131214A212B213523363545604B2E3E)
if not exists (select name from master.dbo.sysxlogins where name='dmacdon')
EXEC master..sp_addlogin 'dmacdon', @pwd, @sid = 0x5C1A4B014499B94D903E97BB8419EE72, @encryptopt = 'skip_encryption_old'
 
-- Login: dmates
SET @pwd = CONVERT (varchar(256), 0x2131223A2E22533C2F4F535B235E2739)
if not exists (select name from master.dbo.sysxlogins where name='dmates')
EXEC master..sp_addlogin 'dmates', @pwd, @sid = 0x44EF70579754DA4D9A5B1BF78B468F00, @encryptopt = 'skip_encryption_old'
 
-- Login: dmclean2
SET @pwd = CONVERT (varchar(256), 0x2131214A21255724394D503A35314F2D)
if not exists (select name from master.dbo.sysxlogins where name='dmclean2')
EXEC master..sp_addlogin 'dmclean2', @pwd, @sid = 0x61BB4278C658E749A8E6106B17121511, @encryptopt = 'skip_encryption_old'
 
-- Login: dmezzaro
SET @pwd = CONVERT (varchar(256), 0x213124233241242C2D2D2F28442D3F43)
if not exists (select name from master.dbo.sysxlogins where name='dmezzaro')
EXEC master..sp_addlogin 'dmezzaro', @pwd, @sid = 0xAF6016FF3EF02B4294A760072EC3FDD6, @encryptopt = 'skip_encryption_old'
 
-- Login: dmichl
SET @pwd = CONVERT (varchar(256), 0x2131214A213039602F494C4634262433)
if not exists (select name from master.dbo.sysxlogins where name='dmichl')
EXEC master..sp_addlogin 'dmichl', @pwd, @sid = 0x2F6A747A23389640B9DE2C3CA4606B40, @encryptopt = 'skip_encryption_old'
 
-- Login: dmitchell3
SET @pwd = CONVERT (varchar(256), 0x213123253A5F3F41423435413A345043)
if not exists (select name from master.dbo.sysxlogins where name='dmitchell3')
EXEC master..sp_addlogin 'dmitchell3', @pwd, @sid = 0x23AAB36424C90B44A915B09E6B884A57, @encryptopt = 'skip_encryption_old'
 
-- Login: dmorgan
SET @pwd = CONVERT (varchar(256), 0x2131214A212A345B47564E4F314B2340)
if not exists (select name from master.dbo.sysxlogins where name='dmorgan')
EXEC master..sp_addlogin 'dmorgan', @pwd, @sid = 0xF92CECC297A9C644B82BCBFDCAE6E5EF, @encryptopt = 'skip_encryption_old'
 
-- Login: dmurray
if not exists (select name from master.dbo.sysxlogins where name='dmurray')
EXEC master..sp_addlogin 'dmurray', NULL, @sid = 0x536AC370C309DA42A9D868F37A1CD19B, @encryptopt = 'skip_encryption_old'
 
-- Login: dnewton
SET @pwd = CONVERT (varchar(256), 0x2131213F2A4A363537265A214D372229)
if not exists (select name from master.dbo.sysxlogins where name='dnewton')
EXEC master..sp_addlogin 'dnewton', @pwd, @sid = 0xC1E1604635CC07489A73A93796EDF0A3, @encryptopt = 'skip_encryption_old'
 
-- Login: doctors
SET @pwd = CONVERT (varchar(256), 0x2131235C333A5B4026454C4151503958)
if not exists (select name from master.dbo.sysxlogins where name='doctors')
EXEC master..sp_addlogin 'doctors', @pwd, @sid = 0x738E56E0C1FDA3439EF484EDCFD64532, @encryptopt = 'skip_encryption_old'
 
-- Login: dopitz
SET @pwd = CONVERT (varchar(256), 0x2131214A212C414343382D51294C4B36)
if not exists (select name from master.dbo.sysxlogins where name='dopitz')
EXEC master..sp_addlogin 'dopitz', @pwd, @sid = 0xB1DB52F8FCCACC41A068E62BE78765D5, @encryptopt = 'skip_encryption_old'
 
-- Login: doreimer
SET @pwd = CONVERT (varchar(256), 0x2131214A21224124405A242B23573358)
if not exists (select name from master.dbo.sysxlogins where name='doreimer')
EXEC master..sp_addlogin 'doreimer', @pwd, @sid = 0x61AA3CCC7499A8438FB6841CEC65168D, @encryptopt = 'skip_encryption_old'
 
-- Login: dowilson
SET @pwd = CONVERT (varchar(256), 0x2131214A212F24433F434F5E30273757)
if not exists (select name from master.dbo.sysxlogins where name='dowilson')
EXEC master..sp_addlogin 'dowilson', @pwd, @sid = 0x7DBA25793AD6624AB795E1D4DE5983EF, @encryptopt = 'skip_encryption_old'
 
-- Login: dparker
SET @pwd = CONVERT (varchar(256), 0x2131214A212E232C392F282B5226273B)
if not exists (select name from master.dbo.sysxlogins where name='dparker')
EXEC master..sp_addlogin 'dparker', @pwd, @sid = 0x68324B5C468BC540AA98882C94E56329, @encryptopt = 'skip_encryption_old'
 
-- Login: dpauker
SET @pwd = CONVERT (varchar(256), 0x213124232E413D4B4641605945224B57)
if not exists (select name from master.dbo.sysxlogins where name='dpauker')
EXEC master..sp_addlogin 'dpauker', @pwd, @sid = 0x07F071A377F1164F9104478ABB2534F4, @encryptopt = 'skip_encryption_old'
 
-- Login: dpenney
SET @pwd = CONVERT (varchar(256), 0x2131214A21255E372A29513B2460305E)
if not exists (select name from master.dbo.sysxlogins where name='dpenney')
EXEC master..sp_addlogin 'dpenney', @pwd, @sid = 0x68DAE0318297B347A198AF72514CD983, @encryptopt = 'skip_encryption_old'
 
-- Login: dpidcock
SET @pwd = CONVERT (varchar(256), 0x2131214A212E3A2A33543E4A54314F36)
if not exists (select name from master.dbo.sysxlogins where name='dpidcock')
EXEC master..sp_addlogin 'dpidcock', @pwd, @sid = 0x4BDE33CA0847124BB9E03AEB070F313F, @encryptopt = 'skip_encryption_old'
 
-- Login: dprus
SET @pwd = CONVERT (varchar(256), 0x2131233D374728262A5F295440245522)
if not exists (select name from master.dbo.sysxlogins where name='dprus')
EXEC master..sp_addlogin 'dprus', @pwd, @sid = 0x9807537204B64644AA29FC035594B6FD, @encryptopt = 'skip_encryption_old'
 
-- Login: drawson
SET @pwd = CONVERT (varchar(256), 0x2131214A2127332C50262E2B5358535C)
if not exists (select name from master.dbo.sysxlogins where name='drawson')
EXEC master..sp_addlogin 'drawson', @pwd, @sid = 0xCDA949A8644C6949AA79E267289FDF43, @encryptopt = 'skip_encryption_old'
 
-- Login: dreed
SET @pwd = CONVERT (varchar(256), 0x2131214433215E5B5D592E3F503B343D)
if not exists (select name from master.dbo.sysxlogins where name='dreed')
EXEC master..sp_addlogin 'dreed', @pwd, @sid = 0x8C700279371D06419DB94625390F5DA2, @encryptopt = 'skip_encryption_old'
 
-- Login: drickson
SET @pwd = CONVERT (varchar(256), 0x2131243C254D2F3E3B5D2F59333B5E43)
if not exists (select name from master.dbo.sysxlogins where name='drickson')
EXEC master..sp_addlogin 'drickson', @pwd, @sid = 0xB6FD561A32ABF14FAE0ABDD6B0E31FB4, @encryptopt = 'skip_encryption_old'
 
-- Login: drosher
SET @pwd = CONVERT (varchar(256), 0x2131214A21263D2E352C45545938214B)
if not exists (select name from master.dbo.sysxlogins where name='drosher')
EXEC master..sp_addlogin 'drosher', @pwd, @sid = 0x8C403CB31465D24E9A20F7D9BA020C99, @encryptopt = 'skip_encryption_old'
 
-- Login: dsaltman
SET @pwd = CONVERT (varchar(256), 0x2131214A212127392B5E4848245D285F)
if not exists (select name from master.dbo.sysxlogins where name='dsaltman')
EXEC master..sp_addlogin 'dsaltman', @pwd, @sid = 0xFD4C0E8A0DB9994E9194FDC2045B1B09, @encryptopt = 'skip_encryption_old'
 
-- Login: dschache
SET @pwd = CONVERT (varchar(256), 0x2131214A212242593153382D282D4456)
if not exists (select name from master.dbo.sysxlogins where name='dschache')
EXEC master..sp_addlogin 'dschache', @pwd, @sid = 0xC07BF7FDDDD6BC48A9C89CC6692B2020, @encryptopt = 'skip_encryption_old'
 
-- Login: dserle
SET @pwd = CONVERT (varchar(256), 0x2131214A2129494D2D483124283E2734)
if not exists (select name from master.dbo.sysxlogins where name='dserle')
EXEC master..sp_addlogin 'dserle', @pwd, @sid = 0x57262E62F5D7E14B8C657052A02ED3E5, @encryptopt = 'skip_encryption_old'
 
-- Login: dskippen
SET @pwd = CONVERT (varchar(256), 0x2131214A21302A2C3F545733252C3151)
if not exists (select name from master.dbo.sysxlogins where name='dskippen')
EXEC master..sp_addlogin 'dskippen', @pwd, @sid = 0x5BA6FDBBFBCF1745AD7B14D33134BFEA, @encryptopt = 'skip_encryption_old'
 
-- Login: dstuder
SET @pwd = CONVERT (varchar(256), 0x213124423343442E394A5F4F5449483C)
if not exists (select name from master.dbo.sysxlogins where name='dstuder')
EXEC master..sp_addlogin 'dstuder', @pwd, @sid = 0x7CEEC03982F62E43A60A4BB5A420FD2E, @encryptopt = 'skip_encryption_old'
 
-- Login: dthompson
if not exists (select name from master.dbo.sysxlogins where name='dthompson')
EXEC master..sp_addlogin 'dthompson', NULL, @sid = 0x53C914F1653AD4428F24F906EAD87917, @encryptopt = 'skip_encryption_old'
 
-- Login: dthomson
SET @pwd = CONVERT (varchar(256), 0x2131233E3844563E432E563A585E6060)
if not exists (select name from master.dbo.sysxlogins where name='dthomson')
EXEC master..sp_addlogin 'dthomson', @pwd, @sid = 0x92DA5046EE2E7C40BF343EAC8B2AF3D9, @encryptopt = 'skip_encryption_old'
 
-- Login: dventon
SET @pwd = CONVERT (varchar(256), 0x2131214A2125572E263C294151415B27)
if not exists (select name from master.dbo.sysxlogins where name='dventon')
EXEC master..sp_addlogin 'dventon', @pwd, @sid = 0x7FC55AEC1E4F684493C039126DCAFEA8, @encryptopt = 'skip_encryption_old'
 
-- Login: dvoduc
SET @pwd = CONVERT (varchar(256), 0x2131214A21242C3C3C5550223D34264E)
if not exists (select name from master.dbo.sysxlogins where name='dvoduc')
EXEC master..sp_addlogin 'dvoduc', @pwd, @sid = 0x3EF1CD8D4DA3E6479C03AE4DD6F00110, @encryptopt = 'skip_encryption_old'
 
-- Login: dvogt
SET @pwd = CONVERT (varchar(256), 0x2131222A2646585323533B5943262D5C)
if not exists (select name from master.dbo.sysxlogins where name='dvogt')
EXEC master..sp_addlogin 'dvogt', @pwd, @sid = 0x6C99D0FB7C2E7D4BA858D153FD282930, @encryptopt = 'skip_encryption_old'
 
-- Login: dvsmith
SET @pwd = CONVERT (varchar(256), 0x21312143362E5045563B3E3746234F24)
if not exists (select name from master.dbo.sysxlogins where name='dvsmith')
EXEC master..sp_addlogin 'dvsmith', @pwd, @sid = 0xFC72478D8B737F4F986B912DB461ECAA, @encryptopt = 'skip_encryption_old'
 
-- Login: dweller
SET @pwd = CONVERT (varchar(256), 0x2131235C31375027423D402D47555E57)
if not exists (select name from master.dbo.sysxlogins where name='dweller')
EXEC master..sp_addlogin 'dweller', @pwd, @sid = 0x2D78459FD1E81E49B5D838DD7879A7A4, @encryptopt = 'skip_encryption_old'
 
-- Login: dwilson
SET @pwd = CONVERT (varchar(256), 0x2131214A212A5F4E6044325036473730)
if not exists (select name from master.dbo.sysxlogins where name='dwilson')
EXEC master..sp_addlogin 'dwilson', @pwd, @sid = 0xFDDD4CEA0AB04344A649CDF1D2BD3D2B, @encryptopt = 'skip_encryption_old'
 
-- Login: dyeoman
SET @pwd = CONVERT (varchar(256), 0x2131214A212236524454235B2E44393A)
if not exists (select name from master.dbo.sysxlogins where name='dyeoman')
EXEC master..sp_addlogin 'dyeoman', @pwd, @sid = 0x85E10A8AFC3D7046B5F9C901489F63AA, @encryptopt = 'skip_encryption_old'
 
-- Login: dzunker
SET @pwd = CONVERT (varchar(256), 0x213122243A2F4D255E4160295B5F5953)
if not exists (select name from master.dbo.sysxlogins where name='dzunker')
EXEC master..sp_addlogin 'dzunker', @pwd, @sid = 0x1B3AFE82791462449E4950E5D6FFB39A, @encryptopt = 'skip_encryption_old'
 
-- Login: eberthel
SET @pwd = CONVERT (varchar(256), 0x2131214433294B2722403623524D2325)
if not exists (select name from master.dbo.sysxlogins where name='eberthel')
EXEC master..sp_addlogin 'eberthel', @pwd, @sid = 0xE79AD9A4BAFBD4448D8984BDF65FA718, @encryptopt = 'skip_encryption_old'
 
-- Login: eblake
SET @pwd = CONVERT (varchar(256), 0x2131233D332A5527603A55465D473E47)
if not exists (select name from master.dbo.sysxlogins where name='eblake')
EXEC master..sp_addlogin 'eblake', @pwd, @sid = 0x243260AEE146EB448FEBF138F922A9FF, @encryptopt = 'skip_encryption_old'
 
-- Login: ebovard
SET @pwd = CONVERT (varchar(256), 0x2131214A212857343D312445362B4B44)
if not exists (select name from master.dbo.sysxlogins where name='ebovard')
EXEC master..sp_addlogin 'ebovard', @pwd, @sid = 0xC65C5ECF4ED31D4CB44725C6C92C0ACF, @encryptopt = 'skip_encryption_old'
 
-- Login: eburns
SET @pwd = CONVERT (varchar(256), 0x2131214433265C282C272A60294C3C56)
if not exists (select name from master.dbo.sysxlogins where name='eburns')
EXEC master..sp_addlogin 'eburns', @pwd, @sid = 0xFE741D6A80CC6B4C9A38EFE5A90293D0, @encryptopt = 'skip_encryption_old'
 
-- Login: echown
SET @pwd = CONVERT (varchar(256), 0x2131214A21224B233B212722382F2436)
if not exists (select name from master.dbo.sysxlogins where name='echown')
EXEC master..sp_addlogin 'echown', @pwd, @sid = 0xA3EB8C35D552C746BF4047F671F579AA, @encryptopt = 'skip_encryption_old'
 
-- Login: edavies
SET @pwd = CONVERT (varchar(256), 0x2131214A212D273F49553A2647585F39)
if not exists (select name from master.dbo.sysxlogins where name='edavies')
EXEC master..sp_addlogin 'edavies', @pwd, @sid = 0xDD8DE241E28E6045946CFF81C417F1AA, @encryptopt = 'skip_encryption_old'
 
-- Login: eeriksson
SET @pwd = CONVERT (varchar(256), 0x2131214433224647233C51475823262D)
if not exists (select name from master.dbo.sysxlogins where name='eeriksson')
EXEC master..sp_addlogin 'eeriksson', @pwd, @sid = 0x32DBB9B18F920B4D9ECAC7AE60E22863, @encryptopt = 'skip_encryption_old'
 
-- Login: egillespie
SET @pwd = CONVERT (varchar(256), 0x2131214A2122225A5C5C3E402950343D)
if not exists (select name from master.dbo.sysxlogins where name='egillespie')
EXEC master..sp_addlogin 'egillespie', @pwd, @sid = 0x6B09E5F5A56C8B40B4CA7C0B92E7847B, @encryptopt = 'skip_encryption_old'
 
-- Login: ejamieson
SET @pwd = CONVERT (varchar(256), 0x2131214A212D22543C23603430293633)
if not exists (select name from master.dbo.sysxlogins where name='ejamieson')
EXEC master..sp_addlogin 'ejamieson', @pwd, @sid = 0xD930207F5793C34EA0F028B3A2FF9847, @encryptopt = 'skip_encryption_old'
 
-- Login: ekostashuk
SET @pwd = CONVERT (varchar(256), 0x2131212F325C585B22352E592A373A50)
if not exists (select name from master.dbo.sysxlogins where name='ekostashuk')
EXEC master..sp_addlogin 'ekostashuk', @pwd, @sid = 0xD221B5297EF41C438CF249395D984121, @encryptopt = 'skip_encryption_old'
 
-- Login: eleonardo
SET @pwd = CONVERT (varchar(256), 0x2131214A212D3C48432D4D393544574F)
if not exists (select name from master.dbo.sysxlogins where name='eleonardo')
EXEC master..sp_addlogin 'eleonardo', @pwd, @sid = 0x74FDA6850E57E446A60A4E90CAD21E91, @encryptopt = 'skip_encryption_old'
 
-- Login: elok
SET @pwd = CONVERT (varchar(256), 0x213124342551572B2A564A2E48363A32)
if not exists (select name from master.dbo.sysxlogins where name='elok')
EXEC master..sp_addlogin 'elok', @pwd, @sid = 0x954FB2409313C948A24BB8E39AB457EB, @encryptopt = 'skip_encryption_old'
 
-- Login: elowe
SET @pwd = CONVERT (varchar(256), 0x2131214A212353445F302B4125243B27)
if not exists (select name from master.dbo.sysxlogins where name='elowe')
EXEC master..sp_addlogin 'elowe', @pwd, @sid = 0x3DBEA79F35103445B20AEE24B292213F, @encryptopt = 'skip_encryption_old'
 
-- Login: emccarre
SET @pwd = CONVERT (varchar(256), 0x2131214A21244358603B2E30522C353F)
if not exists (select name from master.dbo.sysxlogins where name='emccarre')
EXEC master..sp_addlogin 'emccarre', @pwd, @sid = 0x73CCC8EADD75BF41984C02F0A728FDA7, @encryptopt = 'skip_encryption_old'
 
-- Login: emege
SET @pwd = CONVERT (varchar(256), 0x2131214A212E5F262D32374D2944595F)
if not exists (select name from master.dbo.sysxlogins where name='emege')
EXEC master..sp_addlogin 'emege', @pwd, @sid = 0x29CF3AE92850884C8B26C4C5E113B853, @encryptopt = 'skip_encryption_old'
 
-- Login: emsimpson
SET @pwd = CONVERT (varchar(256), 0x2131214A21223B4F5559593E40483634)
if not exists (select name from master.dbo.sysxlogins where name='emsimpson')
EXEC master..sp_addlogin 'emsimpson', @pwd, @sid = 0x42CF84C508731442A0D4B4298A13544E, @encryptopt = 'skip_encryption_old'
 
-- Login: emyhre
SET @pwd = CONVERT (varchar(256), 0x2131225A292126405F4B3E322B505C5D)
if not exists (select name from master.dbo.sysxlogins where name='emyhre')
EXEC master..sp_addlogin 'emyhre', @pwd, @sid = 0x05B7C805BAC4B84E90DA948D21AC14B3, @encryptopt = 'skip_encryption_old'
 
-- Login: eobrien
SET @pwd = CONVERT (varchar(256), 0x2131214A21275A2127524B27563B4B21)
if not exists (select name from master.dbo.sysxlogins where name='eobrien')
EXEC master..sp_addlogin 'eobrien', @pwd, @sid = 0x864E9BCCC4C2694EB79517B1A484727A, @encryptopt = 'skip_encryption_old'
 
-- Login: eosborne
SET @pwd = CONVERT (varchar(256), 0x213123362D453C39464B523B5D4B585A)
if not exists (select name from master.dbo.sysxlogins where name='eosborne')
EXEC master..sp_addlogin 'eosborne', @pwd, @sid = 0xC4BD33AACBE5E248AD53DE239068EC58, @encryptopt = 'skip_encryption_old'
 
-- Login: eoxley
SET @pwd = CONVERT (varchar(256), 0x2131214A21242B472C24464E25293D47)
if not exists (select name from master.dbo.sysxlogins where name='eoxley')
EXEC master..sp_addlogin 'eoxley', @pwd, @sid = 0x20E5203109B2544DB74CEC20D1641DAA, @encryptopt = 'skip_encryption_old'
 
-- Login: epalma
SET @pwd = CONVERT (varchar(256), 0x2131235F272C375D2A3427333F2A555B)
if not exists (select name from master.dbo.sysxlogins where name='epalma')
EXEC master..sp_addlogin 'epalma', @pwd, @sid = 0xF3CBE91982C77648927C931A7D5F185C, @encryptopt = 'skip_encryption_old'
 
-- Login: epederse
SET @pwd = CONVERT (varchar(256), 0x2131224D3039432929235C524E335245)
if not exists (select name from master.dbo.sysxlogins where name='epederse')
EXEC master..sp_addlogin 'epederse', @pwd, @sid = 0x7DB16EE569C90B4C936C9AB66A975C50, @encryptopt = 'skip_encryption_old'
 
-- Login: eplett
SET @pwd = CONVERT (varchar(256), 0x2131214A212B5E5E3B5D595B41353C55)
if not exists (select name from master.dbo.sysxlogins where name='eplett')
EXEC master..sp_addlogin 'eplett', @pwd, @sid = 0x11C1066F03CFBF4793CF60F7537511EA, @encryptopt = 'skip_encryption_old'
 
-- Login: essential
SET @pwd = CONVERT (varchar(256), 0x2131214A2125593A583A5E595F5D5926)
if not exists (select name from master.dbo.sysxlogins where name='essential')
EXEC master..sp_addlogin 'essential', @pwd, @sid = 0xBD386D72AF75594FAEDE92E5D88A8334, @encryptopt = 'skip_encryption_old'
 
-- Login: esylvest
SET @pwd = CONVERT (varchar(256), 0x213123283123393B563F2D5D5D235A25)
if not exists (select name from master.dbo.sysxlogins where name='esylvest')
EXEC master..sp_addlogin 'esylvest', @pwd, @sid = 0xB19908B1FF2C6E458B25E2FB26361E7E, @encryptopt = 'skip_encryption_old'
 
-- Login: etanner
SET @pwd = CONVERT (varchar(256), 0x2131214433274E3A42215238492C343D)
if not exists (select name from master.dbo.sysxlogins where name='etanner')
EXEC master..sp_addlogin 'etanner', @pwd, @sid = 0x777B1E3D6FB97C4FA27F7AA390E34FEE, @encryptopt = 'skip_encryption_old'
 
-- Login: etrudeau
SET @pwd = CONVERT (varchar(256), 0x2131214A21242A573E2E33453F5D4124)
if not exists (select name from master.dbo.sysxlogins where name='etrudeau')
EXEC master..sp_addlogin 'etrudeau', @pwd, @sid = 0xD8BF6EB958ABA1448553C8953E44FE51, @encryptopt = 'skip_encryption_old'
 
-- Login: ewalton
if not exists (select name from master.dbo.sysxlogins where name='ewalton')
EXEC master..sp_addlogin 'ewalton', NULL, @sid = 0x78BE9BF40056854E95B691E7D11DFA2D, @encryptopt = 'skip_encryption_old'
 
-- Login: ewiley
SET @pwd = CONVERT (varchar(256), 0x2131214A21214954265F405434606051)
if not exists (select name from master.dbo.sysxlogins where name='ewiley')
EXEC master..sp_addlogin 'ewiley', @pwd, @sid = 0xF42565CB30053041BD4D350A2C580794, @encryptopt = 'skip_encryption_old'
 
-- Login: fandango
SET @pwd = CONVERT (varchar(256), 0x2131214A21264A415E2B365F21303621)
if not exists (select name from master.dbo.sysxlogins where name='fandango')
EXEC master..sp_addlogin 'fandango', @pwd, @sid = 0xFB7D84EDC6436D41A266162E83C8EBF7, @encryptopt = 'skip_encryption_old'
 
-- Login: fbaker
SET @pwd = CONVERT (varchar(256), 0x213121443322512F33383D2E385C2B55)
if not exists (select name from master.dbo.sysxlogins where name='fbaker')
EXEC master..sp_addlogin 'fbaker', @pwd, @sid = 0x71CD310008FEF04A808C70BA1E733D6C, @encryptopt = 'skip_encryption_old'
 
-- Login: fbeairst
SET @pwd = CONVERT (varchar(256), 0x21312159344C3A585551294342245F31)
if not exists (select name from master.dbo.sysxlogins where name='fbeairst')
EXEC master..sp_addlogin 'fbeairst', @pwd, @sid = 0x6B71BFC483E04440A09707453A194D56, @encryptopt = 'skip_encryption_old'
 
-- Login: fcannan
SET @pwd = CONVERT (varchar(256), 0x2131214A2125274D2C3D3C43532F4445)
if not exists (select name from master.dbo.sysxlogins where name='fcannan')
EXEC master..sp_addlogin 'fcannan', @pwd, @sid = 0x3A602248D0A8A2438951B4BDA84FFF84, @encryptopt = 'skip_encryption_old'
 
-- Login: fclyde
SET @pwd = CONVERT (varchar(256), 0x2131214A2121333D405B3D4E4B3E592E)
if not exists (select name from master.dbo.sysxlogins where name='fclyde')
EXEC master..sp_addlogin 'fclyde', @pwd, @sid = 0xAC5C212A22FBA645A84A46C67B84791E, @encryptopt = 'skip_encryption_old'
 
-- Login: fcollins
SET @pwd = CONVERT (varchar(256), 0x21312144332C3D4D4F5C5B33532F2127)
if not exists (select name from master.dbo.sysxlogins where name='fcollins')
EXEC master..sp_addlogin 'fcollins', @pwd, @sid = 0xB7AF642F2D566B4F83CD0FC2F994B25D, @encryptopt = 'skip_encryption_old'
 
-- Login: fdewolff
SET @pwd = CONVERT (varchar(256), 0x2131214A212A51253C4E3A2D27464C50)
if not exists (select name from master.dbo.sysxlogins where name='fdewolff')
EXEC master..sp_addlogin 'fdewolff', @pwd, @sid = 0x06F784E804AB204F9B5AF4C5560CEC6A, @encryptopt = 'skip_encryption_old'
 
-- Login: fhiggins
SET @pwd = CONVERT (varchar(256), 0x2131213D2D2A57574D4048593E503147)
if not exists (select name from master.dbo.sysxlogins where name='fhiggins')
EXEC master..sp_addlogin 'fhiggins', @pwd, @sid = 0x2081228959067A46A7EDEDF858B15AFF, @encryptopt = 'skip_encryption_old'
 
-- Login: fkronsta
SET @pwd = CONVERT (varchar(256), 0x2131235F272A5B585E323D26324C5030)
if not exists (select name from master.dbo.sysxlogins where name='fkronsta')
EXEC master..sp_addlogin 'fkronsta', @pwd, @sid = 0x4BDD40BDDCDE764F9757DCF58A65B198, @encryptopt = 'skip_encryption_old'
 
-- Login: flum
SET @pwd = CONVERT (varchar(256), 0x2131214A21265C4E5E34603141244749)
if not exists (select name from master.dbo.sysxlogins where name='flum')
EXEC master..sp_addlogin 'flum', @pwd, @sid = 0xAE0B489F7E9CFE4E83CBF7A2E71B0ABE, @encryptopt = 'skip_encryption_old'
 
-- Login: flyons
SET @pwd = CONVERT (varchar(256), 0x2131215C3E5257295C32393B3A4C2F4B)
if not exists (select name from master.dbo.sysxlogins where name='flyons')
EXEC master..sp_addlogin 'flyons', @pwd, @sid = 0xAB071C5837D9F540A2FA9D2C64F3AD92, @encryptopt = 'skip_encryption_old'
 
-- Login: foreilly
SET @pwd = CONVERT (varchar(256), 0x21312245352A405D322D3C463C595A41)
if not exists (select name from master.dbo.sysxlogins where name='foreilly')
EXEC master..sp_addlogin 'foreilly', @pwd, @sid = 0x98959B4328BBFC41A927C7C071F4E5FC, @encryptopt = 'skip_encryption_old'
 
-- Login: fpawsey
SET @pwd = CONVERT (varchar(256), 0x21312253393D445155213D53572A5329)
if not exists (select name from master.dbo.sysxlogins where name='fpawsey')
EXEC master..sp_addlogin 'fpawsey', @pwd, @sid = 0xB328FBE1840E364D89905D6480A3BCC6, @encryptopt = 'skip_encryption_old'
 
-- Login: fpopatia
SET @pwd = CONVERT (varchar(256), 0x2131214A2121375A4653304852503553)
if not exists (select name from master.dbo.sysxlogins where name='fpopatia')
EXEC master..sp_addlogin 'fpopatia', @pwd, @sid = 0xEDA0E629B44C3A43B295C535075923DF, @encryptopt = 'skip_encryption_old'
 
-- Login: francish
if not exists (select name from master.dbo.sysxlogins where name='francish')
EXEC master..sp_addlogin 'francish', NULL, @sid = 0xC9BF67EF8EC3BA48AF620CEA3AF5850D, @encryptopt = 'skip_encryption_old'
 
-- Login: fshafique
SET @pwd = CONVERT (varchar(256), 0x2131214A21274527325742435C5A2E60)
if not exists (select name from master.dbo.sysxlogins where name='fshafique')
EXEC master..sp_addlogin 'fshafique', @pwd, @sid = 0x81BCB9393DA9B34E950899F2FBBC14DB, @encryptopt = 'skip_encryption_old'
 
-- Login: fvclerk3
SET @pwd = CONVERT (varchar(256), 0x21312446243C2F5F462E504C55223358)
if not exists (select name from master.dbo.sysxlogins where name='fvclerk3')
EXEC master..sp_addlogin 'fvclerk3', @pwd, @sid = 0x77A5943EEF7C394EAB562106F337B253, @encryptopt = 'skip_encryption_old'
 
-- Login: fvhiscrk
SET @pwd = CONVERT (varchar(256), 0x21312224264F423E5E5334272E332522)
if not exists (select name from master.dbo.sysxlogins where name='fvhiscrk')
EXEC master..sp_addlogin 'fvhiscrk', @pwd, @sid = 0x3A1BBFD448FA1243BE77062959FADEEB, @encryptopt = 'skip_encryption_old'
 
-- Login: fvhrclk
SET @pwd = CONVERT (varchar(256), 0x2131223A2B375D52255D593829565239)
if not exists (select name from master.dbo.sysxlogins where name='fvhrclk')
EXEC master..sp_addlogin 'fvhrclk', @pwd, @sid = 0x3A1C7D992C0AEC49AA1CD75E53A1812F, @encryptopt = 'skip_encryption_old'
 
-- Login: fvslrev2
SET @pwd = CONVERT (varchar(256), 0x213121293449415E5D352B5D232E2E56)
if not exists (select name from master.dbo.sysxlogins where name='fvslrev2')
EXEC master..sp_addlogin 'fvslrev2', @pwd, @sid = 0x806BC8B02343A84AB72B9C86E80D6BA8, @encryptopt = 'skip_encryption_old'
 
-- Login: fwong
SET @pwd = CONVERT (varchar(256), 0x2131214A212B543C383D5C3937395A59)
if not exists (select name from master.dbo.sysxlogins where name='fwong')
EXEC master..sp_addlogin 'fwong', @pwd, @sid = 0xF5792D7539570E488ADBDD556AC5F70F, @encryptopt = 'skip_encryption_old'
 
-- Login: fxmckaye
SET @pwd = CONVERT (varchar(256), 0x21312332373741375D3E5D35324F2944)
if not exists (select name from master.dbo.sysxlogins where name='fxmckaye')
EXEC master..sp_addlogin 'fxmckaye', @pwd, @sid = 0x78CA00710CA591499BBE6E6752E90480, @encryptopt = 'skip_encryption_old'
 
-- Login: gathwal
SET @pwd = CONVERT (varchar(256), 0x2131214A212D46464D2F5C4F4139585E)
if not exists (select name from master.dbo.sysxlogins where name='gathwal')
EXEC master..sp_addlogin 'gathwal', @pwd, @sid = 0x391DDFBCAC63984CBCDB78AD8D6DDDD0, @encryptopt = 'skip_encryption_old'
 
-- Login: gbashi
SET @pwd = CONVERT (varchar(256), 0x21312144332447374F6029505B2B2C2F)
if not exists (select name from master.dbo.sysxlogins where name='gbashi')
EXEC master..sp_addlogin 'gbashi', @pwd, @sid = 0x23B5EA101873D94DACC8EABC8A2E048B, @encryptopt = 'skip_encryption_old'
 
-- Login: gchan
SET @pwd = CONVERT (varchar(256), 0x213122533B5A3E332C542B5E4D335729)
if not exists (select name from master.dbo.sysxlogins where name='gchan')
EXEC master..sp_addlogin 'gchan', @pwd, @sid = 0x6712AA67BA378A43837D6A7F298D4B07, @encryptopt = 'skip_encryption_old'
 
-- Login: gchristie
SET @pwd = CONVERT (varchar(256), 0x2131214A21234D4A4C5E234B313D455C)
if not exists (select name from master.dbo.sysxlogins where name='gchristie')
EXEC master..sp_addlogin 'gchristie', @pwd, @sid = 0x9E261C65986CD5499911AFC6321057D6, @encryptopt = 'skip_encryption_old'
 
-- Login: gcolling
SET @pwd = CONVERT (varchar(256), 0x2131214A2124533329552F2842502C43)
if not exists (select name from master.dbo.sysxlogins where name='gcolling')
EXEC master..sp_addlogin 'gcolling', @pwd, @sid = 0xBEEE2CF12A6D35409E3EACFE26113C74, @encryptopt = 'skip_encryption_old'
 
-- Login: gconnors
SET @pwd = CONVERT (varchar(256), 0x2131214A212C5231475E2F485725375C)
if not exists (select name from master.dbo.sysxlogins where name='gconnors')
EXEC master..sp_addlogin 'gconnors', @pwd, @sid = 0x7C42C0FF9F4CBD418AE79922B2D0B5BF, @encryptopt = 'skip_encryption_old'
 
-- Login: gdhillon
SET @pwd = CONVERT (varchar(256), 0x2131224D3C2E355059224B2B503C3946)
if not exists (select name from master.dbo.sysxlogins where name='gdhillon')
EXEC master..sp_addlogin 'gdhillon', @pwd, @sid = 0x3C36750F7FB123449EA84E822A526093, @encryptopt = 'skip_encryption_old'
 
-- Login: geburns
SET @pwd = CONVERT (varchar(256), 0x2131244B2D535D5549422F5B3E34233D)
if not exists (select name from master.dbo.sysxlogins where name='geburns')
EXEC master..sp_addlogin 'geburns', @pwd, @sid = 0x72945941B452F54BB7D33584679B0C9F, @encryptopt = 'skip_encryption_old'
 
-- Login: ggarrioc
SET @pwd = CONVERT (varchar(256), 0x2131214A21235D47594C224A4C39263B)
if not exists (select name from master.dbo.sysxlogins where name='ggarrioc')
EXEC master..sp_addlogin 'ggarrioc', @pwd, @sid = 0x3093D06C1B17C846899A31CA4747B0C8, @encryptopt = 'skip_encryption_old'
 
-- Login: ghall
SET @pwd = CONVERT (varchar(256), 0x2131214A213044213831412353574123)
if not exists (select name from master.dbo.sysxlogins where name='ghall')
EXEC master..sp_addlogin 'ghall', @pwd, @sid = 0xC7A8BB5BF3A57448860C6EBAE2701EA0, @encryptopt = 'skip_encryption_old'
 
-- Login: ghamilton
SET @pwd = CONVERT (varchar(256), 0x2131214A2122533D4E24284249272240)
if not exists (select name from master.dbo.sysxlogins where name='ghamilton')
EXEC master..sp_addlogin 'ghamilton', @pwd, @sid = 0x5C15B3F47E882B4B80AE7FE313A88914, @encryptopt = 'skip_encryption_old'
 
-- Login: gke
SET @pwd = CONVERT (varchar(256), 0x21312259352B5C525A545F434C313753)
if not exists (select name from master.dbo.sysxlogins where name='gke')
EXEC master..sp_addlogin 'gke', @pwd, @sid = 0xF0E8CAB6C581534380C78A47BB1DF461, @encryptopt = 'skip_encryption_old'
 
-- Login: gmartins
SET @pwd = CONVERT (varchar(256), 0x2131234F36452F33263D2E2447574A41)
if not exists (select name from master.dbo.sysxlogins where name='gmartins')
EXEC master..sp_addlogin 'gmartins', @pwd, @sid = 0x1970C95EF230DB41A70FFE0DB5E145BF, @encryptopt = 'skip_encryption_old'
 
-- Login: gmehrega
SET @pwd = CONVERT (varchar(256), 0x2131214A212A5E4D602230534A24604A)
if not exists (select name from master.dbo.sysxlogins where name='gmehrega')
EXEC master..sp_addlogin 'gmehrega', @pwd, @sid = 0x8105FDA852453542B53BF35341FB93A6, @encryptopt = 'skip_encryption_old'
 
-- Login: gnelson2
SET @pwd = CONVERT (varchar(256), 0x2131214A212A5D57432D215F3060535C)
if not exists (select name from master.dbo.sysxlogins where name='gnelson2')
EXEC master..sp_addlogin 'gnelson2', @pwd, @sid = 0x7411A3E78874174DA5C596F515B550F8, @encryptopt = 'skip_encryption_old'
 
-- Login: gnoren
SET @pwd = CONVERT (varchar(256), 0x2131214A2126555E4F36422D23484B3A)
if not exists (select name from master.dbo.sysxlogins where name='gnoren')
EXEC master..sp_addlogin 'gnoren', @pwd, @sid = 0xC8D7931D2BFE4B4086E2D515A5D0D507, @encryptopt = 'skip_encryption_old'
 
-- Login: gpansegr
SET @pwd = CONVERT (varchar(256), 0x2131214A212E2551495B344A272F2B3D)
if not exists (select name from master.dbo.sysxlogins where name='gpansegr')
EXEC master..sp_addlogin 'gpansegr', @pwd, @sid = 0x9C80B60BCCF37A4E8D2EC5543A266F90, @encryptopt = 'skip_encryption_old'
 
-- Login: gpansegrau
SET @pwd = CONVERT (varchar(256), 0x2131214A2125465A4A505652484D475F)
if not exists (select name from master.dbo.sysxlogins where name='gpansegrau')
EXEC master..sp_addlogin 'gpansegrau', @pwd, @sid = 0x53E4D4E575DCFF459EA6B45BE9175F57, @encryptopt = 'skip_encryption_old'
 
-- Login: gsorensen
if not exists (select name from master.dbo.sysxlogins where name='gsorensen')
EXEC master..sp_addlogin 'gsorensen', NULL, @sid = 0xCCE412D1DCEB824E8CD7C8D9B3D3EB06, @encryptopt = 'skip_encryption_old'
 
-- Login: gtoupin
SET @pwd = CONVERT (varchar(256), 0x21312144332D3B35413F284D4E293A60)
if not exists (select name from master.dbo.sysxlogins where name='gtoupin')
EXEC master..sp_addlogin 'gtoupin', @pwd, @sid = 0x80F675461B4722499DAA1AD9FEF1FD10, @encryptopt = 'skip_encryption_old'
 
-- Login: guest
if not exists (select name from master.dbo.sysxlogins where name='guest')
EXEC master..sp_addlogin 'guest', NULL, @sid = 0x75B5DF9819B4E54280EE7A85B9C34749, @encryptopt = 'skip_encryption_old'
 
-- Login: gwestgat
SET @pwd = CONVERT (varchar(256), 0x21312144332133522341423C41454648)
if not exists (select name from master.dbo.sysxlogins where name='gwestgat')
EXEC master..sp_addlogin 'gwestgat', @pwd, @sid = 0xAB52F0B8EBBA894EB27EFAA255C2428C, @encryptopt = 'skip_encryption_old'
 
-- Login: gwou
SET @pwd = CONVERT (varchar(256), 0x2131235F2730333F284F5B245A27402E)
if not exists (select name from master.dbo.sysxlogins where name='gwou')
EXEC master..sp_addlogin 'gwou', @pwd, @sid = 0xF7382378D70A2E43A4E4459FF237C6E9, @encryptopt = 'skip_encryption_old'
 
-- Login: gxu
SET @pwd = CONVERT (varchar(256), 0x2131214A21212A2B224634594C233E2D)
if not exists (select name from master.dbo.sysxlogins where name='gxu')
EXEC master..sp_addlogin 'gxu', @pwd, @sid = 0x76BF79CA2C5FC647B6D10148A6BB658F, @encryptopt = 'skip_encryption_old'
 
-- Login: hbeskau
SET @pwd = CONVERT (varchar(256), 0x2131214A212C434E5332293154313F2B)
if not exists (select name from master.dbo.sysxlogins where name='hbeskau')
EXEC master..sp_addlogin 'hbeskau', @pwd, @sid = 0x869AAFF5EDCF474A88B1534D9FB232E7, @encryptopt = 'skip_encryption_old'
 
-- Login: hbradley
SET @pwd = CONVERT (varchar(256), 0x2131214A21293853353B21595B30274A)
if not exists (select name from master.dbo.sysxlogins where name='hbradley')
EXEC master..sp_addlogin 'hbradley', @pwd, @sid = 0x9FD16994150869498AFB9D98EB800CE9, @encryptopt = 'skip_encryption_old'
 
-- Login: hchamber
SET @pwd = CONVERT (varchar(256), 0x2131245237504B47225A33313A433E45)
if not exists (select name from master.dbo.sysxlogins where name='hchamber')
EXEC master..sp_addlogin 'hchamber', @pwd, @sid = 0x93F6821CBD888E4B9586A16C14268157, @encryptopt = 'skip_encryption_old'
 
-- Login: hcoleman
SET @pwd = CONVERT (varchar(256), 0x2131215031375E272836396032475154)
if not exists (select name from master.dbo.sysxlogins where name='hcoleman')
EXEC master..sp_addlogin 'hcoleman', @pwd, @sid = 0xC38D604D78B3B24C98FC562CFD13AA23, @encryptopt = 'skip_encryption_old'
 
-- Login: hcross
SET @pwd = CONVERT (varchar(256), 0x2131214A212A543B24374821592B2551)
if not exists (select name from master.dbo.sysxlogins where name='hcross')
EXEC master..sp_addlogin 'hcross', @pwd, @sid = 0xE03140CDA9AD2C4DB8D75C79D156CE26, @encryptopt = 'skip_encryption_old'
 
-- Login: hcunning
SET @pwd = CONVERT (varchar(256), 0x2131214A212D4032532F575A48315E51)
if not exists (select name from master.dbo.sysxlogins where name='hcunning')
EXEC master..sp_addlogin 'hcunning', @pwd, @sid = 0xF7C9E1E0C71B3D408E04E62D90B78D08, @encryptopt = 'skip_encryption_old'
 
-- Login: hcunningham
SET @pwd = CONVERT (varchar(256), 0x2131214A212922393C242E2D2723284D)
if not exists (select name from master.dbo.sysxlogins where name='hcunningham')
EXEC master..sp_addlogin 'hcunningham', @pwd, @sid = 0x685F4F86A4DFAB4EB63B7CBFDE202E2D, @encryptopt = 'skip_encryption_old'
 
-- Login: hdennis
SET @pwd = CONVERT (varchar(256), 0x2131214A212D5A4B5C385D495D444E5A)
if not exists (select name from master.dbo.sysxlogins where name='hdennis')
EXEC master..sp_addlogin 'hdennis', @pwd, @sid = 0x8007C06A185C004282F58D81D0F1014F, @encryptopt = 'skip_encryption_old'
 
-- Login: hdrapal
SET @pwd = CONVERT (varchar(256), 0x21312442334A4C4C40283D2360424B21)
if not exists (select name from master.dbo.sysxlogins where name='hdrapal')
EXEC master..sp_addlogin 'hdrapal', @pwd, @sid = 0xA97C02639DE6CD4F806190C08DB5F2FA, @encryptopt = 'skip_encryption_old'
 
-- Login: helpdesk
SET @pwd = CONVERT (varchar(256), 0x2131214A21252228395144525136234D)
if not exists (select name from master.dbo.sysxlogins where name='helpdesk')
EXEC master..sp_addlogin 'helpdesk', @pwd, @sid = 0xD30377C10B30DA45B376A4865EEE76F7, @encryptopt = 'skip_encryption_old'
 
-- Login: hfashanu
SET @pwd = CONVERT (varchar(256), 0x213123253A5D3D212643382642284C24)
if not exists (select name from master.dbo.sysxlogins where name='hfashanu')
EXEC master..sp_addlogin 'hfashanu', @pwd, @sid = 0x18549A89430CAE498BB2591CC7942FC9, @encryptopt = 'skip_encryption_old'
 
-- Login: hgarden
if not exists (select name from master.dbo.sysxlogins where name='hgarden')
EXEC master..sp_addlogin 'hgarden', NULL, @sid = 0x8045EEE07117D4409FC44C1D107DD3A6, @encryptopt = 'skip_encryption_old'
 
-- Login: hgillies
SET @pwd = CONVERT (varchar(256), 0x2131214A21215537412E2E4A225A5043)
if not exists (select name from master.dbo.sysxlogins where name='hgillies')
EXEC master..sp_addlogin 'hgillies', @pwd, @sid = 0x42DB98EDB428EA46A589731BF14E7802, @encryptopt = 'skip_encryption_old'
 
-- Login: hgillies2
SET @pwd = CONVERT (varchar(256), 0x2131214A21303B54562F452826325155)
if not exists (select name from master.dbo.sysxlogins where name='hgillies2')
EXEC master..sp_addlogin 'hgillies2', @pwd, @sid = 0xBD6B32E18157E04FA67BC3B1784CC879, @encryptopt = 'skip_encryption_old'
 
-- Login: hhsunyan
SET @pwd = CONVERT (varchar(256), 0x213122332B2D352459294E5B2D5F495B)
if not exists (select name from master.dbo.sysxlogins where name='hhsunyan')
EXEC master..sp_addlogin 'hhsunyan', @pwd, @sid = 0x9CCB7A614AD8C04C8ACEB4CE63425E1A, @encryptopt = 'skip_encryption_old'
 
-- Login: hirving
SET @pwd = CONVERT (varchar(256), 0x2131214A21222F4B5A4936462E3F3C2B)
if not exists (select name from master.dbo.sysxlogins where name='hirving')
EXEC master..sp_addlogin 'hirving', @pwd, @sid = 0x5A0FA187C0E522489844A39935824BD4, @encryptopt = 'skip_encryption_old'
 
-- Login: hishnik
SET @pwd = CONVERT (varchar(256), 0x2131214A212B3846302646353A325423)
if not exists (select name from master.dbo.sysxlogins where name='hishnik')
EXEC master..sp_addlogin 'hishnik', @pwd, @sid = 0xB9F86D8748904E4E9A68F4B65B091B5C, @encryptopt = 'skip_encryption_old'
 
-- Login: hjohal
SET @pwd = CONVERT (varchar(256), 0x2131214A212B50223238253340312245)
if not exists (select name from master.dbo.sysxlogins where name='hjohal')
EXEC master..sp_addlogin 'hjohal', @pwd, @sid = 0x3BC6379D824BCF40984B0E6589854CF7, @encryptopt = 'skip_encryption_old'
 
-- Login: hkader
SET @pwd = CONVERT (varchar(256), 0x213122333B33443A362C3E604B2B2528)
if not exists (select name from master.dbo.sysxlogins where name='hkader')
EXEC master..sp_addlogin 'hkader', @pwd, @sid = 0xFAF88393DEC9514FACA34F2DB435E57A, @encryptopt = 'skip_encryption_old'
 
-- Login: hlau
SET @pwd = CONVERT (varchar(256), 0x2131214A2123404D2433602C4540435C)
if not exists (select name from master.dbo.sysxlogins where name='hlau')
EXEC master..sp_addlogin 'hlau', @pwd, @sid = 0x071967A1D9B0CE408950D394A4C508F3, @encryptopt = 'skip_encryption_old'
 
-- Login: hleung
SET @pwd = CONVERT (varchar(256), 0x2131214A212D42503A415A444F4A3727)
if not exists (select name from master.dbo.sysxlogins where name='hleung')
EXEC master..sp_addlogin 'hleung', @pwd, @sid = 0x9E320CA3E63A0D4DA0DD2A9657D54B74, @encryptopt = 'skip_encryption_old'
 
-- Login: hlfellow
SET @pwd = CONVERT (varchar(256), 0x2131245F402F214739273D2353573441)
if not exists (select name from master.dbo.sysxlogins where name='hlfellow')
EXEC master..sp_addlogin 'hlfellow', @pwd, @sid = 0x6AA2744357CC98408D694C979703CFE0, @encryptopt = 'skip_encryption_old'
 
-- Login: hmartins
SET @pwd = CONVERT (varchar(256), 0x2131224D303A434C375C373A3B274246)
if not exists (select name from master.dbo.sysxlogins where name='hmartins')
EXEC master..sp_addlogin 'hmartins', @pwd, @sid = 0xD6D5EBA548DC0B48A4D8649DA7C57FDF, @encryptopt = 'skip_encryption_old'
 
-- Login: hnanji
SET @pwd = CONVERT (varchar(256), 0x2131214B2A394C55252D515E44422C40)
if not exists (select name from master.dbo.sysxlogins where name='hnanji')
EXEC master..sp_addlogin 'hnanji', @pwd, @sid = 0x3642DC626D278743B5BB31202D186200, @encryptopt = 'skip_encryption_old'
 
-- Login: hpanneko
SET @pwd = CONVERT (varchar(256), 0x2131214A21224B6030212B312E3F3336)
if not exists (select name from master.dbo.sysxlogins where name='hpanneko')
EXEC master..sp_addlogin 'hpanneko', @pwd, @sid = 0xC726AC428CB1714EB797BA725F7B2DD6, @encryptopt = 'skip_encryption_old'
 
-- Login: hparmar
SET @pwd = CONVERT (varchar(256), 0x2131214A2125602F2154583826503730)
if not exists (select name from master.dbo.sysxlogins where name='hparmar')
EXEC master..sp_addlogin 'hparmar', @pwd, @sid = 0x45A217F3393F0D4081A345EEE6995F63, @encryptopt = 'skip_encryption_old'
 
-- Login: hradolla
SET @pwd = CONVERT (varchar(256), 0x213122363441255B2A38482642572923)
if not exists (select name from master.dbo.sysxlogins where name='hradolla')
EXEC master..sp_addlogin 'hradolla', @pwd, @sid = 0x41280313DFDB834FAB4045765FD1BFA3, @encryptopt = 'skip_encryption_old'
 
-- Login: hrate
SET @pwd = CONVERT (varchar(256), 0x2131214A21294E383B5A4A3E4A602F2E)
if not exists (select name from master.dbo.sysxlogins where name='hrate')
EXEC master..sp_addlogin 'hrate', @pwd, @sid = 0x4EEE5E3B6E65BA4282941C48436AE9B8, @encryptopt = 'skip_encryption_old'
 
-- Login: hrayner
SET @pwd = CONVERT (varchar(256), 0x213121443330514C503649245A544128)
if not exists (select name from master.dbo.sysxlogins where name='hrayner')
EXEC master..sp_addlogin 'hrayner', @pwd, @sid = 0x137B1EAB79F04F4DBAE9C61130EBA97C, @encryptopt = 'skip_encryption_old'
 
-- Login: hsadick
SET @pwd = CONVERT (varchar(256), 0x2131214A2121432E316059355E562D37)
if not exists (select name from master.dbo.sysxlogins where name='hsadick')
EXEC master..sp_addlogin 'hsadick', @pwd, @sid = 0x99C48D0571CE2E449BA5136CCA472E3B, @encryptopt = 'skip_encryption_old'
 
-- Login: hsargins
SET @pwd = CONVERT (varchar(256), 0x213122212C4127304051233F37253548)
if not exists (select name from master.dbo.sysxlogins where name='hsargins')
EXEC master..sp_addlogin 'hsargins', @pwd, @sid = 0x229DF624ADA984459914E71FA32B865D, @encryptopt = 'skip_encryption_old'
 
-- Login: hscarlet
SET @pwd = CONVERT (varchar(256), 0x2131214A21234D4C2E442B5934505026)
if not exists (select name from master.dbo.sysxlogins where name='hscarlet')
EXEC master..sp_addlogin 'hscarlet', @pwd, @sid = 0x78E26D7303251843806CD7256D175975, @encryptopt = 'skip_encryption_old'
 
-- Login: hwatson
SET @pwd = CONVERT (varchar(256), 0x2131233138593027435C4153574E2F4B)
if not exists (select name from master.dbo.sysxlogins where name='hwatson')
EXEC master..sp_addlogin 'hwatson', @pwd, @sid = 0x9F8EFD5B5D796F4B8CF1FA8A9186EBE5, @encryptopt = 'skip_encryption_old'
 
-- Login: hwilliam
SET @pwd = CONVERT (varchar(256), 0x2131214A212A532B3821433C47234241)
if not exists (select name from master.dbo.sysxlogins where name='hwilliam')
EXEC master..sp_addlogin 'hwilliam', @pwd, @sid = 0x470866E814D0B04DB409C08684819004, @encryptopt = 'skip_encryption_old'
 
-- Login: hwilson
SET @pwd = CONVERT (varchar(256), 0x2131214433233B2E3D2F503F5D485D3F)
if not exists (select name from master.dbo.sysxlogins where name='hwilson')
EXEC master..sp_addlogin 'hwilson', @pwd, @sid = 0xF5DECC576B7B6C4195884DC18402D2CC, @encryptopt = 'skip_encryption_old'
 
-- Login: hwong
SET @pwd = CONVERT (varchar(256), 0x213123253A553229522B4C4B3A293C3F)
if not exists (select name from master.dbo.sysxlogins where name='hwong')
EXEC master..sp_addlogin 'hwong', @pwd, @sid = 0xCBE2AC01D429FE4DB8938CD950498165, @encryptopt = 'skip_encryption_old'
 
-- Login: idesousa
SET @pwd = CONVERT (varchar(256), 0x21312144332A4B535445286037353150)
if not exists (select name from master.dbo.sysxlogins where name='idesousa')
EXEC master..sp_addlogin 'idesousa', @pwd, @sid = 0x7E41673488C435409A05E63725B03902, @encryptopt = 'skip_encryption_old'
 
-- Login: ihume
SET @pwd = CONVERT (varchar(256), 0x2131214A212E3E2D453840304553554A)
if not exists (select name from master.dbo.sysxlogins where name='ihume')
EXEC master..sp_addlogin 'ihume', @pwd, @sid = 0x9DEEDCF977BBCD44835001ECBB5737CC, @encryptopt = 'skip_encryption_old'
 
-- Login: ikeil
SET @pwd = CONVERT (varchar(256), 0x2131214A212F405E3B494F2B34545E25)
if not exists (select name from master.dbo.sysxlogins where name='ikeil')
EXEC master..sp_addlogin 'ikeil', @pwd, @sid = 0x409D9AE13CD78047BBAB7D273E184983, @encryptopt = 'skip_encryption_old'
 
-- Login: ikiel
SET @pwd = CONVERT (varchar(256), 0x213122383450563E5922415B2936322C)
if not exists (select name from master.dbo.sysxlogins where name='ikiel')
EXEC master..sp_addlogin 'ikiel', @pwd, @sid = 0xB3F25713CABE104593C2804C2FB0C340, @encryptopt = 'skip_encryption_old'
 
-- Login: imaging
if not exists (select name from master.dbo.sysxlogins where name='imaging')
EXEC master..sp_addlogin 'imaging', NULL, @sid = 0x3871F8F22FE78C45BE4D7A81CC8EB4F1, @encryptopt = 'skip_encryption_old'
 
-- Login: irazimoz
SET @pwd = CONVERT (varchar(256), 0x21312144332B374B28505C4D5C57214B)
if not exists (select name from master.dbo.sysxlogins where name='irazimoz')
EXEC master..sp_addlogin 'irazimoz', @pwd, @sid = 0x90D1DF99B6566F43A7CB47E3BAF84A9E, @encryptopt = 'skip_encryption_old'
 
-- Login: isadowsk
SET @pwd = CONVERT (varchar(256), 0x213124462E573C405224582E37475245)
if not exists (select name from master.dbo.sysxlogins where name='isadowsk')
EXEC master..sp_addlogin 'isadowsk', @pwd, @sid = 0xE08ABEF89598EF418BD074FD738FCBC0, @encryptopt = 'skip_encryption_old'
 
-- Login: iyong
SET @pwd = CONVERT (varchar(256), 0x2131235C3A4E21214C592D4A32394F5D)
if not exists (select name from master.dbo.sysxlogins where name='iyong')
EXEC master..sp_addlogin 'iyong', @pwd, @sid = 0xD658827FA5E2A042B8EC68C573530838, @encryptopt = 'skip_encryption_old'
 
-- Login: izielins
SET @pwd = CONVERT (varchar(256), 0x2131214A21284E4248545228374B483A)
if not exists (select name from master.dbo.sysxlogins where name='izielins')
EXEC master..sp_addlogin 'izielins', @pwd, @sid = 0x5F72F98FABEB7145969A5689187C5402, @encryptopt = 'skip_encryption_old'
 
-- Login: jabbot
SET @pwd = CONVERT (varchar(256), 0x2131244028215A534026395F282D3F37)
if not exists (select name from master.dbo.sysxlogins where name='jabbot')
EXEC master..sp_addlogin 'jabbot', @pwd, @sid = 0xA6A7390182978F4882AC8CB7714DC569, @encryptopt = 'skip_encryption_old'
 
-- Login: jadams
SET @pwd = CONVERT (varchar(256), 0x2131214A212D3038574442262D3E2839)
if not exists (select name from master.dbo.sysxlogins where name='jadams')
EXEC master..sp_addlogin 'jadams', @pwd, @sid = 0xD5DD2F8CE6F6C14BB39D84B1B9FFE3B1, @encryptopt = 'skip_encryption_old'
 
-- Login: jajanzen
SET @pwd = CONVERT (varchar(256), 0x2131224E3A57582C56532D5A4C4D2549)
if not exists (select name from master.dbo.sysxlogins where name='jajanzen')
EXEC master..sp_addlogin 'jajanzen', @pwd, @sid = 0xBDC0717ED56F9942A0D81C8EE80DFECE, @encryptopt = 'skip_encryption_old'
 
-- Login: jaleksic
SET @pwd = CONVERT (varchar(256), 0x2131214A212A2F274C3F2D4228273743)
if not exists (select name from master.dbo.sysxlogins where name='jaleksic')
EXEC master..sp_addlogin 'jaleksic', @pwd, @sid = 0xDB9EB35963DEAA42B31841AA4F06857B, @encryptopt = 'skip_encryption_old'
 
-- Login: jalpini
SET @pwd = CONVERT (varchar(256), 0x2131214A21214A255D555D54534A414D)
if not exists (select name from master.dbo.sysxlogins where name='jalpini')
EXEC master..sp_addlogin 'jalpini', @pwd, @sid = 0x04B3E06A7D02C14796861688C03B18F5, @encryptopt = 'skip_encryption_old'
 
-- Login: janelp
SET @pwd = CONVERT (varchar(256), 0x2131214A2122412825555951572B5F3D)
if not exists (select name from master.dbo.sysxlogins where name='janelp')
EXEC master..sp_addlogin 'janelp', @pwd, @sid = 0xA3873770394FA641981DA4E420DC4F3C, @encryptopt = 'skip_encryption_old'
 
-- Login: jarcher
SET @pwd = CONVERT (varchar(256), 0x2131213728523D40345F592425423C36)
if not exists (select name from master.dbo.sysxlogins where name='jarcher')
EXEC master..sp_addlogin 'jarcher', @pwd, @sid = 0xFA695C3EDF158B4C871C6BDB029138EB, @encryptopt = 'skip_encryption_old'
 
-- Login: jarthurs
SET @pwd = CONVERT (varchar(256), 0x2131214A2122363B395022604E605F43)
if not exists (select name from master.dbo.sysxlogins where name='jarthurs')
EXEC master..sp_addlogin 'jarthurs', @pwd, @sid = 0x82A6A5B6833D5A49A2CB0B9A8EA88534, @encryptopt = 'skip_encryption_old'
 
-- Login: jaspey
SET @pwd = CONVERT (varchar(256), 0x2131224631562E5F522C473A38402428)
if not exists (select name from master.dbo.sysxlogins where name='jaspey')
EXEC master..sp_addlogin 'jaspey', @pwd, @sid = 0x39CDC34D0213484899C58E8440E944EE, @encryptopt = 'skip_encryption_old'
 
-- Login: jballou
if not exists (select name from master.dbo.sysxlogins where name='jballou')
EXEC master..sp_addlogin 'jballou', NULL, @sid = 0x5B7B28396713414EA6478509947D4787, @encryptopt = 'skip_encryption_old'
 
-- Login: jbanford
SET @pwd = CONVERT (varchar(256), 0x2131224D303F304D58392945492B3A3D)
if not exists (select name from master.dbo.sysxlogins where name='jbanford')
EXEC master..sp_addlogin 'jbanford', @pwd, @sid = 0x235775FD311C7444A5A708218020B558, @encryptopt = 'skip_encryption_old'
 
-- Login: jbayliss
SET @pwd = CONVERT (varchar(256), 0x2131214A2127573F4A2F4C3659324C41)
if not exists (select name from master.dbo.sysxlogins where name='jbayliss')
EXEC master..sp_addlogin 'jbayliss', @pwd, @sid = 0x1A18D72AF8608B4BB176BDAE162FB83E, @encryptopt = 'skip_encryption_old'
 
-- Login: jbeckley
SET @pwd = CONVERT (varchar(256), 0x2131214A212D3D3E5746595949574B25)
if not exists (select name from master.dbo.sysxlogins where name='jbeckley')
EXEC master..sp_addlogin 'jbeckley', @pwd, @sid = 0x1914184CCB56004B93950D653035E96B, @encryptopt = 'skip_encryption_old'
 
-- Login: jberube
SET @pwd = CONVERT (varchar(256), 0x21312144332422335834554523502B5F)
if not exists (select name from master.dbo.sysxlogins where name='jberube')
EXEC master..sp_addlogin 'jberube', @pwd, @sid = 0x72ED18E89EC9A64AB50056EAF2631A36, @encryptopt = 'skip_encryption_old'
 
-- Login: jbianchi
SET @pwd = CONVERT (varchar(256), 0x2131224D30323C532C3C5834472D3456)
if not exists (select name from master.dbo.sysxlogins where name='jbianchi')
EXEC master..sp_addlogin 'jbianchi', @pwd, @sid = 0x2A284F7D0F031141B928B2472D7F7555, @encryptopt = 'skip_encryption_old'
 
-- Login: jbishop
SET @pwd = CONVERT (varchar(256), 0x2131213E3D423639373A323629445249)
if not exists (select name from master.dbo.sysxlogins where name='jbishop')
EXEC master..sp_addlogin 'jbishop', @pwd, @sid = 0x95873F16D9EAD54688DBAC586E5CD063, @encryptopt = 'skip_encryption_old'
 
-- Login: jbrar
SET @pwd = CONVERT (varchar(256), 0x213121443321564236305C5F602B4447)
if not exists (select name from master.dbo.sysxlogins where name='jbrar')
EXEC master..sp_addlogin 'jbrar', @pwd, @sid = 0x5FC7351359B10847B4D505C905B80B8E, @encryptopt = 'skip_encryption_old'
 
-- Login: jbristei
SET @pwd = CONVERT (varchar(256), 0x2131223127294A302230333042593945)
if not exists (select name from master.dbo.sysxlogins where name='jbristei')
EXEC master..sp_addlogin 'jbristei', @pwd, @sid = 0x716B6BCF3CA0ED4B9A6BDA20B6452334, @encryptopt = 'skip_encryption_old'
 
-- Login: jbruhn
SET @pwd = CONVERT (varchar(256), 0x2131214A21244356242F5D552C355C35)
if not exists (select name from master.dbo.sysxlogins where name='jbruhn')
EXEC master..sp_addlogin 'jbruhn', @pwd, @sid = 0x96E061E80F89AD49A9A0464FE507BD42, @encryptopt = 'skip_encryption_old'
 
-- Login: jbryce
SET @pwd = CONVERT (varchar(256), 0x2131214A21264C5F4D4A41525658434B)
if not exists (select name from master.dbo.sysxlogins where name='jbryce')
EXEC master..sp_addlogin 'jbryce', @pwd, @sid = 0x3071E06550404F489470F51BF6A913AE, @encryptopt = 'skip_encryption_old'
 
-- Login: jbrykov
SET @pwd = CONVERT (varchar(256), 0x2131214A2121564B253A285439335B60)
if not exists (select name from master.dbo.sysxlogins where name='jbrykov')
EXEC master..sp_addlogin 'jbrykov', @pwd, @sid = 0x561F074904EE1646814BA2B0BEBED9E2, @encryptopt = 'skip_encryption_old'
 
-- Login: jbuston
SET @pwd = CONVERT (varchar(256), 0x2131214A2129314A23595B525A494E4D)
if not exists (select name from master.dbo.sysxlogins where name='jbuston')
EXEC master..sp_addlogin 'jbuston', @pwd, @sid = 0x4B00D1C083CD3641B1F68E51D4CA0028, @encryptopt = 'skip_encryption_old'
 
-- Login: jcanavan
SET @pwd = CONVERT (varchar(256), 0x2131214A21242232293E2B232B3E464F)
if not exists (select name from master.dbo.sysxlogins where name='jcanavan')
EXEC master..sp_addlogin 'jcanavan', @pwd, @sid = 0xAB90F4E88FF59344969D99E609A7F9BE, @encryptopt = 'skip_encryption_old'
 
-- Login: jchalker
SET @pwd = CONVERT (varchar(256), 0x2131243C33234F53325A2A5C5A412F50)
if not exists (select name from master.dbo.sysxlogins where name='jchalker')
EXEC master..sp_addlogin 'jchalker', @pwd, @sid = 0xDC2DC658F294D94A99EA1190FBC5FE9F, @encryptopt = 'skip_encryption_old'
 
-- Login: jchartier
SET @pwd = CONVERT (varchar(256), 0x2131214A212840462645243D3A4E5542)
if not exists (select name from master.dbo.sysxlogins where name='jchartier')
EXEC master..sp_addlogin 'jchartier', @pwd, @sid = 0x0A17F16BBD5CBA469808365C5B97BFC5, @encryptopt = 'skip_encryption_old'
 
-- Login: jchong
SET @pwd = CONVERT (varchar(256), 0x2131214A21272851395D333542385853)
if not exists (select name from master.dbo.sysxlogins where name='jchong')
EXEC master..sp_addlogin 'jchong', @pwd, @sid = 0x8F160A11B784CF41BD10423634BD78FE, @encryptopt = 'skip_encryption_old'
 
-- Login: jchristink
SET @pwd = CONVERT (varchar(256), 0x2131214A2130393B4F413646523C5048)
if not exists (select name from master.dbo.sysxlogins where name='jchristink')
EXEC master..sp_addlogin 'jchristink', @pwd, @sid = 0x4D68894C49047544B53033B28C78BBE6, @encryptopt = 'skip_encryption_old'
 
-- Login: jciancone
SET @pwd = CONVERT (varchar(256), 0x2131214A2130313D4021222E583B294D)
if not exists (select name from master.dbo.sysxlogins where name='jciancone')
EXEC master..sp_addlogin 'jciancone', @pwd, @sid = 0xD1EA3861FBF95842BE0BFFE5D1C58170, @encryptopt = 'skip_encryption_old'
 
-- Login: jcornels
SET @pwd = CONVERT (varchar(256), 0x2131214A21272D533D313E4A5E47213A)
if not exists (select name from master.dbo.sysxlogins where name='jcornels')
EXEC master..sp_addlogin 'jcornels', @pwd, @sid = 0x0BC238CD1E2B014C8EAB4C154EC884AF, @encryptopt = 'skip_encryption_old'
 
-- Login: jcote
SET @pwd = CONVERT (varchar(256), 0x213123253A5939552A2B495D2B4D5731)
if not exists (select name from master.dbo.sysxlogins where name='jcote')
EXEC master..sp_addlogin 'jcote', @pwd, @sid = 0x50FC7C6FCC6D554EB1AD67B9AD5124A3, @encryptopt = 'skip_encryption_old'
 
-- Login: jcrancone
SET @pwd = CONVERT (varchar(256), 0x2131214433273825213953443E48263D)
if not exists (select name from master.dbo.sysxlogins where name='jcrancone')
EXEC master..sp_addlogin 'jcrancone', @pwd, @sid = 0xCC2CE364B3EEBD498618D7B0808380C7, @encryptopt = 'skip_encryption_old'
 
-- Login: jcutler
SET @pwd = CONVERT (varchar(256), 0x2131214A2127352A394C26302F295D3D)
if not exists (select name from master.dbo.sysxlogins where name='jcutler')
EXEC master..sp_addlogin 'jcutler', @pwd, @sid = 0x0C7FC8AD08AF0A4B8E9A50C2991BB2CE, @encryptopt = 'skip_encryption_old'
 
-- Login: jdailly
if not exists (select name from master.dbo.sysxlogins where name='jdailly')
EXEC master..sp_addlogin 'jdailly', NULL, @sid = 0xDB627A18EEE70C4DA49CD5CC4CC4360D, @encryptopt = 'skip_encryption_old'
 
-- Login: jdantoni
SET @pwd = CONVERT (varchar(256), 0x213124472D49532D3D4F424F5F4B2B40)
if not exists (select name from master.dbo.sysxlogins where name='jdantoni')
EXEC master..sp_addlogin 'jdantoni', @pwd, @sid = 0xD04D575F425656429D329F00058392A8, @encryptopt = 'skip_encryption_old'
 
-- Login: jdesilva
SET @pwd = CONVERT (varchar(256), 0x213121323C602142252256573B4D4255)
if not exists (select name from master.dbo.sysxlogins where name='jdesilva')
EXEC master..sp_addlogin 'jdesilva', @pwd, @sid = 0x843060499E58D741B01CF33862B09908, @encryptopt = 'skip_encryption_old'
 
-- Login: jdobson
SET @pwd = CONVERT (varchar(256), 0x2131214A212A3C2D4D21385D5A453945)
if not exists (select name from master.dbo.sysxlogins where name='jdobson')
EXEC master..sp_addlogin 'jdobson', @pwd, @sid = 0x6C1E9CFCF0437C4493787C4A1C055D88, @encryptopt = 'skip_encryption_old'
 
-- Login: jdodsworth
SET @pwd = CONVERT (varchar(256), 0x213123253A5D453F536042222C312739)
if not exists (select name from master.dbo.sysxlogins where name='jdodsworth')
EXEC master..sp_addlogin 'jdodsworth', @pwd, @sid = 0xA7B4307005616C47B056431302438D2C, @encryptopt = 'skip_encryption_old'
 
-- Login: jdolson
SET @pwd = CONVERT (varchar(256), 0x2131214A21274343545E602C2A2A3A30)
if not exists (select name from master.dbo.sysxlogins where name='jdolson')
EXEC master..sp_addlogin 'jdolson', @pwd, @sid = 0x41A28D02C814434D9BA400474E2AD6A3, @encryptopt = 'skip_encryption_old'
 
-- Login: jdonalds
SET @pwd = CONVERT (varchar(256), 0x2131214A212B5E30492741403A572850)
if not exists (select name from master.dbo.sysxlogins where name='jdonalds')
EXEC master..sp_addlogin 'jdonalds', @pwd, @sid = 0x7CC3F0E194359F44B408403A70BB88F6, @encryptopt = 'skip_encryption_old'
 
-- Login: jdrexel
SET @pwd = CONVERT (varchar(256), 0x2131214A21255A2D29582F5C45365537)
if not exists (select name from master.dbo.sysxlogins where name='jdrexel')
EXEC master..sp_addlogin 'jdrexel', @pwd, @sid = 0x349A0EFFAA4F244EAA5187B7B60CF7DC, @encryptopt = 'skip_encryption_old'
 
-- Login: jdutt
SET @pwd = CONVERT (varchar(256), 0x2131214A21255630252F5F443E353D52)
if not exists (select name from master.dbo.sysxlogins where name='jdutt')
EXEC master..sp_addlogin 'jdutt', @pwd, @sid = 0x44082EC3AF431243822EDAE6AA36A2A1, @encryptopt = 'skip_encryption_old'
 
-- Login: jdzelali
SET @pwd = CONVERT (varchar(256), 0x2131215E2A4739474E53352E2938512F)
if not exists (select name from master.dbo.sysxlogins where name='jdzelali')
EXEC master..sp_addlogin 'jdzelali', @pwd, @sid = 0xC44098F3F06E434FB05805D076F5D122, @encryptopt = 'skip_encryption_old'
 
-- Login: jentwist
SET @pwd = CONVERT (varchar(256), 0x2131212D2F362F2A5A5D283250543151)
if not exists (select name from master.dbo.sysxlogins where name='jentwist')
EXEC master..sp_addlogin 'jentwist', @pwd, @sid = 0x16D87CEB96A5144BA13BB200EB0DD531, @encryptopt = 'skip_encryption_old'
 
-- Login: jestrada
SET @pwd = CONVERT (varchar(256), 0x2131214A21235B422C353D2B2F432727)
if not exists (select name from master.dbo.sysxlogins where name='jestrada')
EXEC master..sp_addlogin 'jestrada', @pwd, @sid = 0xF61CC110A2AFEC4CBDED4FBFAA6D13C3, @encryptopt = 'skip_encryption_old'
 
-- Login: jeveleigh
SET @pwd = CONVERT (varchar(256), 0x2131214A212235584A304E2837235051)
if not exists (select name from master.dbo.sysxlogins where name='jeveleigh')
EXEC master..sp_addlogin 'jeveleigh', @pwd, @sid = 0x7E404F6599525343B49660F9E9DF4E38, @encryptopt = 'skip_encryption_old'
 
-- Login: jferguson
SET @pwd = CONVERT (varchar(256), 0x2131214A212425235E235E2454255445)
if not exists (select name from master.dbo.sysxlogins where name='jferguson')
EXEC master..sp_addlogin 'jferguson', @pwd, @sid = 0xD2BC9827C2765147916DBC40AE3AB06D, @encryptopt = 'skip_encryption_old'
 
-- Login: jfinck
SET @pwd = CONVERT (varchar(256), 0x2131235C31335E3D4144225856354242)
if not exists (select name from master.dbo.sysxlogins where name='jfinck')
EXEC master..sp_addlogin 'jfinck', @pwd, @sid = 0xD44753CEB2AD384EB0B388346FF86F09, @encryptopt = 'skip_encryption_old'
 
-- Login: jfong
SET @pwd = CONVERT (varchar(256), 0x2131214A2124604A462C3B4A5B442B56)
if not exists (select name from master.dbo.sysxlogins where name='jfong')
EXEC master..sp_addlogin 'jfong', @pwd, @sid = 0x0A0E5E2CB22F164BAF615A283B7C7175, @encryptopt = 'skip_encryption_old'
 
-- Login: jforrest
SET @pwd = CONVERT (varchar(256), 0x2131236039242E295D23405F4C532530)
if not exists (select name from master.dbo.sysxlogins where name='jforrest')
EXEC master..sp_addlogin 'jforrest', @pwd, @sid = 0x82FFD623043C7C43BAC9FB063DD494D9, @encryptopt = 'skip_encryption_old'
 
-- Login: jfound
SET @pwd = CONVERT (varchar(256), 0x2131214A2124442B5E3B3455245C4332)
if not exists (select name from master.dbo.sysxlogins where name='jfound')
EXEC master..sp_addlogin 'jfound', @pwd, @sid = 0x334CF94B1B3B844D9C31B7211EF3A8DF, @encryptopt = 'skip_encryption_old'
 
-- Login: jfowler
SET @pwd = CONVERT (varchar(256), 0x213123472A46452259494232335E265E)
if not exists (select name from master.dbo.sysxlogins where name='jfowler')
EXEC master..sp_addlogin 'jfowler', @pwd, @sid = 0xC745EA595D1D2A478140147E151E0131, @encryptopt = 'skip_encryption_old'
 
-- Login: jfox
SET @pwd = CONVERT (varchar(256), 0x213123553A46482F3F3824365D5A2428)
if not exists (select name from master.dbo.sysxlogins where name='jfox')
EXEC master..sp_addlogin 'jfox', @pwd, @sid = 0xD485D2A7A3948F449D9731B8690E377C, @encryptopt = 'skip_encryption_old'
 
-- Login: jgledsto
SET @pwd = CONVERT (varchar(256), 0x2131224E323A5C3B4C2D3934252A2839)
if not exists (select name from master.dbo.sysxlogins where name='jgledsto')
EXEC master..sp_addlogin 'jgledsto', @pwd, @sid = 0x8813C36484EDCC4DB1C14E073E270C5E, @encryptopt = 'skip_encryption_old'
 
-- Login: jgraham
SET @pwd = CONVERT (varchar(256), 0x2131214A21274724414C5C3E2355535E)
if not exists (select name from master.dbo.sysxlogins where name='jgraham')
EXEC master..sp_addlogin 'jgraham', @pwd, @sid = 0x383069D853F79B428E7F42E8C0747B4E, @encryptopt = 'skip_encryption_old'
 
-- Login: jgray
SET @pwd = CONVERT (varchar(256), 0x2131214A21274F525F453056525C5B4E)
if not exists (select name from master.dbo.sysxlogins where name='jgray')
EXEC master..sp_addlogin 'jgray', @pwd, @sid = 0x1574D818613822419B5E730A97F0AA2F, @encryptopt = 'skip_encryption_old'
 
-- Login: jharvey
SET @pwd = CONVERT (varchar(256), 0x2131214A212B56585F57515054222E2F)
if not exists (select name from master.dbo.sysxlogins where name='jharvey')
EXEC master..sp_addlogin 'jharvey', @pwd, @sid = 0x84681DCCE4CAE345AFDEC6B26724C657, @encryptopt = 'skip_encryption_old'
 
-- Login: jhayes
SET @pwd = CONVERT (varchar(256), 0x2131235F272C2A2642265D254255214A)
if not exists (select name from master.dbo.sysxlogins where name='jhayes')
EXEC master..sp_addlogin 'jhayes', @pwd, @sid = 0x192F0B8B6FCEE14F8A8447939BAFE06C, @encryptopt = 'skip_encryption_old'
 
-- Login: jhenstri
SET @pwd = CONVERT (varchar(256), 0x213124392B38383D3435352B4C3D3D53)
if not exists (select name from master.dbo.sysxlogins where name='jhenstri')
EXEC master..sp_addlogin 'jhenstri', @pwd, @sid = 0x19154948929A6647B6626A1A060715BF, @encryptopt = 'skip_encryption_old'
 
-- Login: jhiebert
SET @pwd = CONVERT (varchar(256), 0x2131235F272337314A46383D38294441)
if not exists (select name from master.dbo.sysxlogins where name='jhiebert')
EXEC master..sp_addlogin 'jhiebert', @pwd, @sid = 0xAEE08D971FC7584EA41EB2B2E7284571, @encryptopt = 'skip_encryption_old'
 
-- Login: jhill
SET @pwd = CONVERT (varchar(256), 0x2131214A2127292C523457324D254B54)
if not exists (select name from master.dbo.sysxlogins where name='jhill')
EXEC master..sp_addlogin 'jhill', @pwd, @sid = 0x851372CF6C7B124D984DDDD0F4AD2238, @encryptopt = 'skip_encryption_old'
 
-- Login: jhocking
SET @pwd = CONVERT (varchar(256), 0x21312144332B5A394C26324D4357224E)
if not exists (select name from master.dbo.sysxlogins where name='jhocking')
EXEC master..sp_addlogin 'jhocking', @pwd, @sid = 0xA6004B8016DE9C438D3B8DFCA1863F96, @encryptopt = 'skip_encryption_old'
 
-- Login: jhutchin
SET @pwd = CONVERT (varchar(256), 0x21312126352E3242213D3E4049535B28)
if not exists (select name from master.dbo.sysxlogins where name='jhutchin')
EXEC master..sp_addlogin 'jhutchin', @pwd, @sid = 0xE4F9861A80639F46A4C1605E8DB73ABC, @encryptopt = 'skip_encryption_old'
 
-- Login: jjackson
SET @pwd = CONVERT (varchar(256), 0x2131214A21224E4C494E304C233D3853)
if not exists (select name from master.dbo.sysxlogins where name='jjackson')
EXEC master..sp_addlogin 'jjackson', @pwd, @sid = 0x87333A949B228440B3CB2B9BD7A9305F, @encryptopt = 'skip_encryption_old'
 
-- Login: jjensen
SET @pwd = CONVERT (varchar(256), 0x21312442334B275332514C503B3B464E)
if not exists (select name from master.dbo.sysxlogins where name='jjensen')
EXEC master..sp_addlogin 'jjensen', @pwd, @sid = 0x26EC9B5C877E674BA61D1883756FE21B, @encryptopt = 'skip_encryption_old'
 
-- Login: jjung
SET @pwd = CONVERT (varchar(256), 0x213124372C304B585C55524E29583E2D)
if not exists (select name from master.dbo.sysxlogins where name='jjung')
EXEC master..sp_addlogin 'jjung', @pwd, @sid = 0x1D97E7970FA5364B81781D5D7DD93D0E, @encryptopt = 'skip_encryption_old'
 
-- Login: jjuzkiw
SET @pwd = CONVERT (varchar(256), 0x2131214A2127545C543748244C284C4F)
if not exists (select name from master.dbo.sysxlogins where name='jjuzkiw')
EXEC master..sp_addlogin 'jjuzkiw', @pwd, @sid = 0x3A73B6F1FF8442489B34351BBC1DED11, @encryptopt = 'skip_encryption_old'
 
-- Login: jkadola
SET @pwd = CONVERT (varchar(256), 0x2131214A212D2E43244F5D352D562A3A)
if not exists (select name from master.dbo.sysxlogins where name='jkadola')
EXEC master..sp_addlogin 'jkadola', @pwd, @sid = 0x893F1C25EB489949A81DA6F8902131BF, @encryptopt = 'skip_encryption_old'
 
-- Login: jkarola
SET @pwd = CONVERT (varchar(256), 0x2131214A21303E60485A4D212B40442D)
if not exists (select name from master.dbo.sysxlogins where name='jkarola')
EXEC master..sp_addlogin 'jkarola', @pwd, @sid = 0x5B125BB2778BAB439050887A6D3EC3F7, @encryptopt = 'skip_encryption_old'
 
-- Login: jkehl
SET @pwd = CONVERT (varchar(256), 0x2131214A21244329312E392A34262D50)
if not exists (select name from master.dbo.sysxlogins where name='jkehl')
EXEC master..sp_addlogin 'jkehl', @pwd, @sid = 0xA6E6E82BA61F5548AEA673C8598E29D4, @encryptopt = 'skip_encryption_old'
 
-- Login: jkelly
SET @pwd = CONVERT (varchar(256), 0x2131214A212B56585F57515054222E2F)
if not exists (select name from master.dbo.sysxlogins where name='jkelly')
EXEC master..sp_addlogin 'jkelly', @pwd, @sid = 0x84A8BB770E6031449144FB83C425D4EE, @encryptopt = 'skip_encryption_old'
 
-- Login: jkippen
SET @pwd = CONVERT (varchar(256), 0x2131214A212B56585F57515054222E2F)
if not exists (select name from master.dbo.sysxlogins where name='jkippen')
EXEC master..sp_addlogin 'jkippen', @pwd, @sid = 0x9DB4E92E22C71C44ADB23A7DE19E2B75, @encryptopt = 'skip_encryption_old'
 
-- Login: jkizer
SET @pwd = CONVERT (varchar(256), 0x2131213E312A604F304D505742395147)
if not exists (select name from master.dbo.sysxlogins where name='jkizer')
EXEC master..sp_addlogin 'jkizer', @pwd, @sid = 0x648062C748B37243996DA50EEBD9046E, @encryptopt = 'skip_encryption_old'
 
-- Login: jkkeller
SET @pwd = CONVERT (varchar(256), 0x2131214A21213D285C3D452723433F4D)
if not exists (select name from master.dbo.sysxlogins where name='jkkeller')
EXEC master..sp_addlogin 'jkkeller', @pwd, @sid = 0x57C06766914044488E9CFFFEBA2F2463, @encryptopt = 'skip_encryption_old'
 
-- Login: jkoppers
SET @pwd = CONVERT (varchar(256), 0x2131213228405846392C4533523B435C)
if not exists (select name from master.dbo.sysxlogins where name='jkoppers')
EXEC master..sp_addlogin 'jkoppers', @pwd, @sid = 0xB2BB545BF4C39C499FEB2B341D5DD145, @encryptopt = 'skip_encryption_old'
 
-- Login: jkoscak
SET @pwd = CONVERT (varchar(256), 0x21312136372621565D4A343544562142)
if not exists (select name from master.dbo.sysxlogins where name='jkoscak')
EXEC master..sp_addlogin 'jkoscak', @pwd, @sid = 0x0766B8F156585948A6FF01AEB888348B, @encryptopt = 'skip_encryption_old'
 
-- Login: jkouwenb
SET @pwd = CONVERT (varchar(256), 0x2131235F272F372E452C5C53603F2151)
if not exists (select name from master.dbo.sysxlogins where name='jkouwenb')
EXEC master..sp_addlogin 'jkouwenb', @pwd, @sid = 0x9B6FF4705061FF4BA04E2AF52589EC7A, @encryptopt = 'skip_encryption_old'
 
-- Login: jkula
SET @pwd = CONVERT (varchar(256), 0x213124513D3E4D2B51352B225E59423B)
if not exists (select name from master.dbo.sysxlogins where name='jkula')
EXEC master..sp_addlogin 'jkula', @pwd, @sid = 0x79C20FBE7914864D8E75E43A36CBEA7C, @encryptopt = 'skip_encryption_old'
 
-- Login: jleary
SET @pwd = CONVERT (varchar(256), 0x2131214A212C232952565B5B513A524E)
if not exists (select name from master.dbo.sysxlogins where name='jleary')
EXEC master..sp_addlogin 'jleary', @pwd, @sid = 0x2A298AEA3E63CE47B94E3C310E049637, @encryptopt = 'skip_encryption_old'
 
-- Login: jleblanc
SET @pwd = CONVERT (varchar(256), 0x2131214A2128554F575D27225746252A)
if not exists (select name from master.dbo.sysxlogins where name='jleblanc')
EXEC master..sp_addlogin 'jleblanc', @pwd, @sid = 0x6E34584464E5FC428FAFD8DA61A053EE, @encryptopt = 'skip_encryption_old'
 
-- Login: jli
SET @pwd = CONVERT (varchar(256), 0x2131222A252D213345344B533D212142)
if not exists (select name from master.dbo.sysxlogins where name='jli')
EXEC master..sp_addlogin 'jli', @pwd, @sid = 0xB754A55E85483E45BFB564350F3CA1BE, @encryptopt = 'skip_encryption_old'
 
-- Login: jlim
SET @pwd = CONVERT (varchar(256), 0x2131222A264639494433575A4A333233)
if not exists (select name from master.dbo.sysxlogins where name='jlim')
EXEC master..sp_addlogin 'jlim', @pwd, @sid = 0xA37EEAE00DCE4A4997807DE5EC1C2E22, @encryptopt = 'skip_encryption_old'
 
-- Login: jlin
SET @pwd = CONVERT (varchar(256), 0x2131235F272B582433585D342D583C4A)
if not exists (select name from master.dbo.sysxlogins where name='jlin')
EXEC master..sp_addlogin 'jlin', @pwd, @sid = 0xEB13EFB9242F4D4C8B37C9095F8FBC59, @encryptopt = 'skip_encryption_old'
 
-- Login: jlowe
SET @pwd = CONVERT (varchar(256), 0x2131214A212D30432E472E522C503859)
if not exists (select name from master.dbo.sysxlogins where name='jlowe')
EXEC master..sp_addlogin 'jlowe', @pwd, @sid = 0xAEF264871FAE854DAC5DC35CB64EA38E, @encryptopt = 'skip_encryption_old'
 
-- Login: jmacdonald
SET @pwd = CONVERT (varchar(256), 0x2131224D303B5E25422F532D33364946)
if not exists (select name from master.dbo.sysxlogins where name='jmacdonald')
EXEC master..sp_addlogin 'jmacdonald', @pwd, @sid = 0x6E1C2E0505C8DC4D80721F3E085F2493, @encryptopt = 'skip_encryption_old'
 
-- Login: jmackey
SET @pwd = CONVERT (varchar(256), 0x2131214A2127352A4521223D503E454E)
if not exists (select name from master.dbo.sysxlogins where name='jmackey')
EXEC master..sp_addlogin 'jmackey', @pwd, @sid = 0x822BAF3F6EA01D4AA0C693602A3300EC, @encryptopt = 'skip_encryption_old'
 
-- Login: jmarioni
SET @pwd = CONVERT (varchar(256), 0x2131214A2122413D444A5924573B5638)
if not exists (select name from master.dbo.sysxlogins where name='jmarioni')
EXEC master..sp_addlogin 'jmarioni', @pwd, @sid = 0x3F02EEA542ED1042BAB8DE0F0D2F5E31, @encryptopt = 'skip_encryption_old'
 
-- Login: jmarshal
SET @pwd = CONVERT (varchar(256), 0x2131214A2128412C345F24562A3B2244)
if not exists (select name from master.dbo.sysxlogins where name='jmarshal')
EXEC master..sp_addlogin 'jmarshal', @pwd, @sid = 0x2599C042899C0846A523384B40704118, @encryptopt = 'skip_encryption_old'
 
-- Login: jmbrown
SET @pwd = CONVERT (varchar(256), 0x2131214323275A5F4F23265E4E39362F)
if not exists (select name from master.dbo.sysxlogins where name='jmbrown')
EXEC master..sp_addlogin 'jmbrown', @pwd, @sid = 0xAF1AA4910998674BBBCFC74A64C3A6F9, @encryptopt = 'skip_encryption_old'
 
-- Login: jmclean
SET @pwd = CONVERT (varchar(256), 0x2131214A212F22552B4D2E5B2E5E4625)
if not exists (select name from master.dbo.sysxlogins where name='jmclean')
EXEC master..sp_addlogin 'jmclean', @pwd, @sid = 0x9C3E74C9B804F94C8384619A93DA0D83, @encryptopt = 'skip_encryption_old'
 
-- Login: jmclerie
SET @pwd = CONVERT (varchar(256), 0x2131214A21294D605A57434E213D2B4A)
if not exists (select name from master.dbo.sysxlogins where name='jmclerie')
EXEC master..sp_addlogin 'jmclerie', @pwd, @sid = 0xBEF373671190F54CAE4A8DFB45541BE0, @encryptopt = 'skip_encryption_old'
 
-- Login: jmcrobbie
SET @pwd = CONVERT (varchar(256), 0x2131235F27283E235E343F5A4654302F)
if not exists (select name from master.dbo.sysxlogins where name='jmcrobbie')
EXEC master..sp_addlogin 'jmcrobbie', @pwd, @sid = 0xC34AB3AE9D03A4488CA0E6BDA3AF1BB8, @encryptopt = 'skip_encryption_old'
 
-- Login: jmelody
SET @pwd = CONVERT (varchar(256), 0x2131214A213040543056582644463A38)
if not exists (select name from master.dbo.sysxlogins where name='jmelody')
EXEC master..sp_addlogin 'jmelody', @pwd, @sid = 0xE6F79526A84F1B44B9696AC66F5F6480, @encryptopt = 'skip_encryption_old'
 
-- Login: jmills
SET @pwd = CONVERT (varchar(256), 0x2131214A212422355F483F435454573E)
if not exists (select name from master.dbo.sysxlogins where name='jmills')
EXEC master..sp_addlogin 'jmills', @pwd, @sid = 0x39CE8B3E443C3A4A96A5B99DF6076C8B, @encryptopt = 'skip_encryption_old'
 
-- Login: jmirakeat
SET @pwd = CONVERT (varchar(256), 0x2131214A212256252B504D5F46254A49)
if not exists (select name from master.dbo.sysxlogins where name='jmirakeat')
EXEC master..sp_addlogin 'jmirakeat', @pwd, @sid = 0xB993FE0CEB38654182C8BC0050D500A0, @encryptopt = 'skip_encryption_old'
 
-- Login: jmiralop
SET @pwd = CONVERT (varchar(256), 0x2131214A212448423F55243E5D2A2651)
if not exists (select name from master.dbo.sysxlogins where name='jmiralop')
EXEC master..sp_addlogin 'jmiralop', @pwd, @sid = 0x165E07FF6A4DD74F88AC4B00F59C657C, @encryptopt = 'skip_encryption_old'
 
-- Login: jmoody
SET @pwd = CONVERT (varchar(256), 0x213123522F603546502E44273A563959)
if not exists (select name from master.dbo.sysxlogins where name='jmoody')
EXEC master..sp_addlogin 'jmoody', @pwd, @sid = 0x16F2FD3A1E254442B0F1E1E71A9EF4A5, @encryptopt = 'skip_encryption_old'
 
-- Login: jmtchow
SET @pwd = CONVERT (varchar(256), 0x21312144332356282E3A353D29443B4C)
if not exists (select name from master.dbo.sysxlogins where name='jmtchow')
EXEC master..sp_addlogin 'jmtchow', @pwd, @sid = 0x0855E64EF61BF6419B0075CFFF564552, @encryptopt = 'skip_encryption_old'
 
-- Login: jneu
SET @pwd = CONVERT (varchar(256), 0x2131214A21252734243C60455031244E)
if not exists (select name from master.dbo.sysxlogins where name='jneu')
EXEC master..sp_addlogin 'jneu', @pwd, @sid = 0x48511F1A4BA6504B9438F3525146E065, @encryptopt = 'skip_encryption_old'
 
-- Login: jnorlin
SET @pwd = CONVERT (varchar(256), 0x2131223040595F56533651354E482352)
if not exists (select name from master.dbo.sysxlogins where name='jnorlin')
EXEC master..sp_addlogin 'jnorlin', @pwd, @sid = 0x19CBF0515CC5CB41834DCD76A149130E, @encryptopt = 'skip_encryption_old'
 
-- Login: jnorthup
SET @pwd = CONVERT (varchar(256), 0x2131214A21282F5D565F49413727443D)
if not exists (select name from master.dbo.sysxlogins where name='jnorthup')
EXEC master..sp_addlogin 'jnorthup', @pwd, @sid = 0x3281279250C80C4E828F4A6CB4DF62E8, @encryptopt = 'skip_encryption_old'
 
-- Login: jnyrose
SET @pwd = CONVERT (varchar(256), 0x2131214A2121415A3C423A3C2F462939)
if not exists (select name from master.dbo.sysxlogins where name='jnyrose')
EXEC master..sp_addlogin 'jnyrose', @pwd, @sid = 0x046043A598299246B41347D4A9989DED, @encryptopt = 'skip_encryption_old'
 
-- Login: joball
SET @pwd = CONVERT (varchar(256), 0x2131214A212F2E2D2B333F5E3E4B4453)
if not exists (select name from master.dbo.sysxlogins where name='joball')
EXEC master..sp_addlogin 'joball', @pwd, @sid = 0x5BA4D7BDEC62FA49AAD15EAE6060B996, @encryptopt = 'skip_encryption_old'
 
-- Login: jolehrer
SET @pwd = CONVERT (varchar(256), 0x2131244C213C3B595B4C48552652314E)
if not exists (select name from master.dbo.sysxlogins where name='jolehrer')
EXEC master..sp_addlogin 'jolehrer', @pwd, @sid = 0xBD975FB635B7474B8D3225EC1C729303, @encryptopt = 'skip_encryption_old'
 
-- Login: jozirney
SET @pwd = CONVERT (varchar(256), 0x2131214A21215F2D4F52444C3D434023)
if not exists (select name from master.dbo.sysxlogins where name='jozirney')
EXEC master..sp_addlogin 'jozirney', @pwd, @sid = 0x2686BA85B06D3C46BA3EE267CA644A56, @encryptopt = 'skip_encryption_old'
 
-- Login: jpaquette
SET @pwd = CONVERT (varchar(256), 0x213123253A523F222428504A254A2442)
if not exists (select name from master.dbo.sysxlogins where name='jpaquette')
EXEC master..sp_addlogin 'jpaquette', @pwd, @sid = 0xA37E262A4D638946A5700ECCBDB7B5A5, @encryptopt = 'skip_encryption_old'
 
-- Login: jpelc
SET @pwd = CONVERT (varchar(256), 0x2131214A2129275B474F24222F25503B)
if not exists (select name from master.dbo.sysxlogins where name='jpelc')
EXEC master..sp_addlogin 'jpelc', @pwd, @sid = 0xA48DAEDBF5B65F44B628C3C879A9ECD9, @encryptopt = 'skip_encryption_old'
 
-- Login: jpenas
SET @pwd = CONVERT (varchar(256), 0x213124372C2D284D5433582B48262D42)
if not exists (select name from master.dbo.sysxlogins where name='jpenas')
EXEC master..sp_addlogin 'jpenas', @pwd, @sid = 0x7C170EC636BDEE4BBFEBB15859146B64, @encryptopt = 'skip_encryption_old'
 
-- Login: jpenas2
SET @pwd = CONVERT (varchar(256), 0x2131224D303A27295A252F443758533B)
if not exists (select name from master.dbo.sysxlogins where name='jpenas2')
EXEC master..sp_addlogin 'jpenas2', @pwd, @sid = 0x62355068C9A48D40A51031AE1644AB6B, @encryptopt = 'skip_encryption_old'
 
-- Login: jpenner
SET @pwd = CONVERT (varchar(256), 0x213121353D292A4E3E293C573228363E)
if not exists (select name from master.dbo.sysxlogins where name='jpenner')
EXEC master..sp_addlogin 'jpenner', @pwd, @sid = 0x4135615BBC71BB4A9E735F37070E3BCF, @encryptopt = 'skip_encryption_old'
 
-- Login: jpenny
SET @pwd = CONVERT (varchar(256), 0x2131214A21222D4A215D534C5A5C502D)
if not exists (select name from master.dbo.sysxlogins where name='jpenny')
EXEC master..sp_addlogin 'jpenny', @pwd, @sid = 0xDF6A6D2A0434ED408FF160A41FCBF5EB, @encryptopt = 'skip_encryption_old'
 
-- Login: jperry
SET @pwd = CONVERT (varchar(256), 0x2131222B333B3C5D2C2949344A4E4B4B)
if not exists (select name from master.dbo.sysxlogins where name='jperry')
EXEC master..sp_addlogin 'jperry', @pwd, @sid = 0x4E69FCDC745FD3468C3C94526679A91D, @encryptopt = 'skip_encryption_old'
 
-- Login: jpitts
SET @pwd = CONVERT (varchar(256), 0x21312434365E455B5A5C533B5A565E25)
if not exists (select name from master.dbo.sysxlogins where name='jpitts')
EXEC master..sp_addlogin 'jpitts', @pwd, @sid = 0xF6A25A5F7C1E2E40A59CDB416AE8F82C, @encryptopt = 'skip_encryption_old'
 
-- Login: jpope
SET @pwd = CONVERT (varchar(256), 0x2131214A212C244E5A41473859583322)
if not exists (select name from master.dbo.sysxlogins where name='jpope')
EXEC master..sp_addlogin 'jpope', @pwd, @sid = 0x796AE734EFC74F4AB22A1B486079508D, @encryptopt = 'skip_encryption_old'
 
-- Login: jpowell
SET @pwd = CONVERT (varchar(256), 0x2131214E2F41305E3735603E36355123)
if not exists (select name from master.dbo.sysxlogins where name='jpowell')
EXEC master..sp_addlogin 'jpowell', @pwd, @sid = 0xA026480B1443224FAAA3C2984D1DAAC4, @encryptopt = 'skip_encryption_old'
 
-- Login: jrandall
SET @pwd = CONVERT (varchar(256), 0x2131232A25462A5248424B4B60355C5A)
if not exists (select name from master.dbo.sysxlogins where name='jrandall')
EXEC master..sp_addlogin 'jrandall', @pwd, @sid = 0x2A857C34D260FC4AB54EB918C7624AD2, @encryptopt = 'skip_encryption_old'
 
-- Login: jroberts
SET @pwd = CONVERT (varchar(256), 0x213121492260495F22604D214C34224C)
if not exists (select name from master.dbo.sysxlogins where name='jroberts')
EXEC master..sp_addlogin 'jroberts', @pwd, @sid = 0x925BE9ABDEA690499B3DB231D8CEE438, @encryptopt = 'skip_encryption_old'
 
-- Login: jroderick
SET @pwd = CONVERT (varchar(256), 0x2131214A212525602736303F5F292439)
if not exists (select name from master.dbo.sysxlogins where name='jroderick')
EXEC master..sp_addlogin 'jroderick', @pwd, @sid = 0xE638EB3F8FE1DA49B84E100D9A99FCF1, @encryptopt = 'skip_encryption_old'
 
-- Login: jrudolph
SET @pwd = CONVERT (varchar(256), 0x2131235F272F335D5F583538405A2258)
if not exists (select name from master.dbo.sysxlogins where name='jrudolph')
EXEC master..sp_addlogin 'jrudolph', @pwd, @sid = 0x0CC004E2FC08554E877D70A12B3C9C3F, @encryptopt = 'skip_encryption_old'
 
-- Login: jsahota
SET @pwd = CONVERT (varchar(256), 0x2131214A212447343156364656365C5F)
if not exists (select name from master.dbo.sysxlogins where name='jsahota')
EXEC master..sp_addlogin 'jsahota', @pwd, @sid = 0x58B969BA42353349962C9DA6718866D3, @encryptopt = 'skip_encryption_old'
 
-- Login: jsanghera
SET @pwd = CONVERT (varchar(256), 0x2131214A212A22542E534C4C5F2E264F)
if not exists (select name from master.dbo.sysxlogins where name='jsanghera')
EXEC master..sp_addlogin 'jsanghera', @pwd, @sid = 0x3D0023487AB9C0419B1D1582E2F64442, @encryptopt = 'skip_encryption_old'
 
-- Login: jsantos
SET @pwd = CONVERT (varchar(256), 0x2131214A213040443928322A233C2C5D)
if not exists (select name from master.dbo.sysxlogins where name='jsantos')
EXEC master..sp_addlogin 'jsantos', @pwd, @sid = 0xB053109E95386B4481AD828B28AE5FE9, @encryptopt = 'skip_encryption_old'
 
-- Login: jsharp
SET @pwd = CONVERT (varchar(256), 0x2131214433252D60504C2F24235A412F)
if not exists (select name from master.dbo.sysxlogins where name='jsharp')
EXEC master..sp_addlogin 'jsharp', @pwd, @sid = 0x251D31DE052CDC45AA19E6B333E689BB, @encryptopt = 'skip_encryption_old'
 
-- Login: jshin
SET @pwd = CONVERT (varchar(256), 0x213124353F28604E5B5E4246423B5333)
if not exists (select name from master.dbo.sysxlogins where name='jshin')
EXEC master..sp_addlogin 'jshin', @pwd, @sid = 0x07767B38A863AF499530588317F58052, @encryptopt = 'skip_encryption_old'
 
-- Login: jsimpson
SET @pwd = CONVERT (varchar(256), 0x2131214A2127372248542331515D2457)
if not exists (select name from master.dbo.sysxlogins where name='jsimpson')
EXEC master..sp_addlogin 'jsimpson', @pwd, @sid = 0xF290D4EE21C61A4185AFF7FCE3604FFD, @encryptopt = 'skip_encryption_old'
 
-- Login: jsissons
SET @pwd = CONVERT (varchar(256), 0x2131214A212A393B413E3C4C4D4C3144)
if not exists (select name from master.dbo.sysxlogins where name='jsissons')
EXEC master..sp_addlogin 'jsissons', @pwd, @sid = 0x96B5151D6D11CB4CAF5ABA6B051A1E2A, @encryptopt = 'skip_encryption_old'
 
-- Login: jsoltys
SET @pwd = CONVERT (varchar(256), 0x2131214A21285B37292C374451376035)
if not exists (select name from master.dbo.sysxlogins where name='jsoltys')
EXEC master..sp_addlogin 'jsoltys', @pwd, @sid = 0xB3B945BD4717A74D8EF61C3AA3FD249B, @encryptopt = 'skip_encryption_old'
 
-- Login: jstaplet
SET @pwd = CONVERT (varchar(256), 0x2131214A21304C2E2650303929513439)
if not exists (select name from master.dbo.sysxlogins where name='jstaplet')
EXEC master..sp_addlogin 'jstaplet', @pwd, @sid = 0x210F9E491FC23D4284494DB2CDD011E4, @encryptopt = 'skip_encryption_old'
 
-- Login: jstevens
SET @pwd = CONVERT (varchar(256), 0x2131234F3D4D384B3A2C295E5F31245B)
if not exists (select name from master.dbo.sysxlogins where name='jstevens')
EXEC master..sp_addlogin 'jstevens', @pwd, @sid = 0xD33A7A4A9B86214DB3AFA34ADDF12818, @encryptopt = 'skip_encryption_old'
 
-- Login: jstolk
SET @pwd = CONVERT (varchar(256), 0x2131214A212F5D50605123224A555240)
if not exists (select name from master.dbo.sysxlogins where name='jstolk')
EXEC master..sp_addlogin 'jstolk', @pwd, @sid = 0xA6D2C691F741DE4E8CF4EB4E457CC400, @encryptopt = 'skip_encryption_old'
 
-- Login: jsurline
SET @pwd = CONVERT (varchar(256), 0x2131214A212C395550315553385F4F60)
if not exists (select name from master.dbo.sysxlogins where name='jsurline')
EXEC master..sp_addlogin 'jsurline', @pwd, @sid = 0xA4E850B93754BF41A3F0C77D16888328, @encryptopt = 'skip_encryption_old'
 
-- Login: jszabo
SET @pwd = CONVERT (varchar(256), 0x2131233B264C374E473235264830414A)
if not exists (select name from master.dbo.sysxlogins where name='jszabo')
EXEC master..sp_addlogin 'jszabo', @pwd, @sid = 0x986F718ED46DBB4B9A6C84D63F44C9BF, @encryptopt = 'skip_encryption_old'
 
-- Login: jtonn
SET @pwd = CONVERT (varchar(256), 0x21312259232D605A4E475C434423373C)
if not exists (select name from master.dbo.sysxlogins where name='jtonn')
EXEC master..sp_addlogin 'jtonn', @pwd, @sid = 0x416F6CF7BEFD2E47A994087FE5FF851C, @encryptopt = 'skip_encryption_old'
 
-- Login: jtyler
SET @pwd = CONVERT (varchar(256), 0x2131214A21294E2C2D5D4D22275E4C46)
if not exists (select name from master.dbo.sysxlogins where name='jtyler')
EXEC master..sp_addlogin 'jtyler', @pwd, @sid = 0x9D8771B49C97794399EFF877F0704859, @encryptopt = 'skip_encryption_old'
 
-- Login: jvanegmo
SET @pwd = CONVERT (varchar(256), 0x2131214A212B3E443D242241445A383C)
if not exists (select name from master.dbo.sysxlogins where name='jvanegmo')
EXEC master..sp_addlogin 'jvanegmo', @pwd, @sid = 0xFC85DB4901AC5940BDD351AEBBDB24FE, @encryptopt = 'skip_encryption_old'
 
-- Login: jvardy
if not exists (select name from master.dbo.sysxlogins where name='jvardy')
EXEC master..sp_addlogin 'jvardy', NULL, @sid = 0x9C20F0C333D41E45B854BEB0A85039E1, @encryptopt = 'skip_encryption_old'
 
-- Login: jwilson2
SET @pwd = CONVERT (varchar(256), 0x2131214A212B25454D3F414E52344621)
if not exists (select name from master.dbo.sysxlogins where name='jwilson2')
EXEC master..sp_addlogin 'jwilson2', @pwd, @sid = 0x74A02E9B3B342B4DBADF5533B966E4AA, @encryptopt = 'skip_encryption_old'
 
-- Login: kamason
SET @pwd = CONVERT (varchar(256), 0x213123253A562B4A593A5432453A2255)
if not exists (select name from master.dbo.sysxlogins where name='kamason')
EXEC master..sp_addlogin 'kamason', @pwd, @sid = 0x4920C3B28BD89F45B8D4C768585DAC1F, @encryptopt = 'skip_encryption_old'
 
-- Login: karkell
SET @pwd = CONVERT (varchar(256), 0x2131214A21222443264545575D53494B)
if not exists (select name from master.dbo.sysxlogins where name='karkell')
EXEC master..sp_addlogin 'karkell', @pwd, @sid = 0x4A7C44A22132C84AA1E444A3CF969607, @encryptopt = 'skip_encryption_old'
 
-- Login: kaugusto
SET @pwd = CONVERT (varchar(256), 0x2131214A212D4722534D373F34543A4B)
if not exists (select name from master.dbo.sysxlogins where name='kaugusto')
EXEC master..sp_addlogin 'kaugusto', @pwd, @sid = 0xDDA316E0B55B254080EF224DE17747DC, @encryptopt = 'skip_encryption_old'
 
-- Login: kaustin
SET @pwd = CONVERT (varchar(256), 0x2131214A21305E274C482D2E415E4524)
if not exists (select name from master.dbo.sysxlogins where name='kaustin')
EXEC master..sp_addlogin 'kaustin', @pwd, @sid = 0xE6CCAFEF3B02C2479C29CE5D12A160A9, @encryptopt = 'skip_encryption_old'
 
-- Login: kbagri
SET @pwd = CONVERT (varchar(256), 0x2131214A212F582F3C583D46525A3250)
if not exists (select name from master.dbo.sysxlogins where name='kbagri')
EXEC master..sp_addlogin 'kbagri', @pwd, @sid = 0x0DABB2D503F6564794588A2EE2055399, @encryptopt = 'skip_encryption_old'
 
-- Login: kbedia2
SET @pwd = CONVERT (varchar(256), 0x21312144332A53585A455F49275D3C2E)
if not exists (select name from master.dbo.sysxlogins where name='kbedia2')
EXEC master..sp_addlogin 'kbedia2', @pwd, @sid = 0x4F6E8E8F7A8F84479B9D9856FC633D54, @encryptopt = 'skip_encryption_old'
 
-- Login: kbond
SET @pwd = CONVERT (varchar(256), 0x2131214A213055512C5A3B21383E3731)
if not exists (select name from master.dbo.sysxlogins where name='kbond')
EXEC master..sp_addlogin 'kbond', @pwd, @sid = 0x715A860FFD107540A1B4EF7EEF15B928, @encryptopt = 'skip_encryption_old'
 
-- Login: kboos
SET @pwd = CONVERT (varchar(256), 0x2131214A212B34402D28585230435E29)
if not exists (select name from master.dbo.sysxlogins where name='kboos')
EXEC master..sp_addlogin 'kboos', @pwd, @sid = 0x8C424816DEFA0043BA394882DFC367F8, @encryptopt = 'skip_encryption_old'
 
-- Login: kbreckon
SET @pwd = CONVERT (varchar(256), 0x2131214A212A2428362C492528562534)
if not exists (select name from master.dbo.sysxlogins where name='kbreckon')
EXEC master..sp_addlogin 'kbreckon', @pwd, @sid = 0x573B6F78EE10ED46B96A6C8877E455AC, @encryptopt = 'skip_encryption_old'
 
-- Login: kbrown
SET @pwd = CONVERT (varchar(256), 0x21312144332960355C2D374B42596059)
if not exists (select name from master.dbo.sysxlogins where name='kbrown')
EXEC master..sp_addlogin 'kbrown', @pwd, @sid = 0x71DDE73960256F49B41B012751EED20B, @encryptopt = 'skip_encryption_old'
 
-- Login: kburley
SET @pwd = CONVERT (varchar(256), 0x2131214A212B29564E31363E585F3224)
if not exists (select name from master.dbo.sysxlogins where name='kburley')
EXEC master..sp_addlogin 'kburley', @pwd, @sid = 0x55EB625249E3874E90A7B830B2BB4A15, @encryptopt = 'skip_encryption_old'
 
-- Login: kcapier
SET @pwd = CONVERT (varchar(256), 0x2131214A21244228384446483E3F3E3B)
if not exists (select name from master.dbo.sysxlogins where name='kcapier')
EXEC master..sp_addlogin 'kcapier', @pwd, @sid = 0x299F6DCD40912A4290E7B5A4743DE824, @encryptopt = 'skip_encryption_old'
 
-- Login: kcheah
SET @pwd = CONVERT (varchar(256), 0x21312144332C3C575C22543644482629)
if not exists (select name from master.dbo.sysxlogins where name='kcheah')
EXEC master..sp_addlogin 'kcheah', @pwd, @sid = 0xDE3D47701E8F364BAFA0C4FCFA5FF778, @encryptopt = 'skip_encryption_old'
 
-- Login: kchristi
SET @pwd = CONVERT (varchar(256), 0x2131214A212C412E3941386056512F50)
if not exists (select name from master.dbo.sysxlogins where name='kchristi')
EXEC master..sp_addlogin 'kchristi', @pwd, @sid = 0x1F406691091615458DC829CCD797BF03, @encryptopt = 'skip_encryption_old'
 
-- Login: kdaniels
SET @pwd = CONVERT (varchar(256), 0x213124372C30585C2B312D36403A5C5A)
if not exists (select name from master.dbo.sysxlogins where name='kdaniels')
EXEC master..sp_addlogin 'kdaniels', @pwd, @sid = 0x30F1FEDA0AA21D45AA7FF7207570E5B0, @encryptopt = 'skip_encryption_old'
 
-- Login: kdelavau
SET @pwd = CONVERT (varchar(256), 0x2131214C3224574C57273750603B474B)
if not exists (select name from master.dbo.sysxlogins where name='kdelavau')
EXEC master..sp_addlogin 'kdelavau', @pwd, @sid = 0xAD266B48D90A4D49B33092E4FF1D7B9D, @encryptopt = 'skip_encryption_old'
 
-- Login: kdesmet
SET @pwd = CONVERT (varchar(256), 0x213121443325522931252236212E4C27)
if not exists (select name from master.dbo.sysxlogins where name='kdesmet')
EXEC master..sp_addlogin 'kdesmet', @pwd, @sid = 0x6CEAAEBF0118FA478F8B155FE86991E6, @encryptopt = 'skip_encryption_old'
 
-- Login: kdosanjh
SET @pwd = CONVERT (varchar(256), 0x2131214A21274F582A283D255E454D3F)
if not exists (select name from master.dbo.sysxlogins where name='kdosanjh')
EXEC master..sp_addlogin 'kdosanjh', @pwd, @sid = 0x6920218457CF754BA668FBFE93468AA5, @encryptopt = 'skip_encryption_old'
 
-- Login: kduncan
SET @pwd = CONVERT (varchar(256), 0x213124373023552B3B4630582F3B2C5A)
if not exists (select name from master.dbo.sysxlogins where name='kduncan')
EXEC master..sp_addlogin 'kduncan', @pwd, @sid = 0xB0510159233D074FA8E021DE8B94EB81, @encryptopt = 'skip_encryption_old'
 
-- Login: kearnsha
SET @pwd = CONVERT (varchar(256), 0x2131214A212525282F485B60463C3135)
if not exists (select name from master.dbo.sysxlogins where name='kearnsha')
EXEC master..sp_addlogin 'kearnsha', @pwd, @sid = 0x14821D452ABFD448B7E49A0614F63B49, @encryptopt = 'skip_encryption_old'
 
-- Login: keyres
if not exists (select name from master.dbo.sysxlogins where name='keyres')
EXEC master..sp_addlogin 'keyres', NULL, @sid = 0x1DC9F9762F986242A0B2624A4A09CB9D, @encryptopt = 'skip_encryption_old'
 
-- Login: kfischer
SET @pwd = CONVERT (varchar(256), 0x2131222B23415354213B555D3C482F38)
if not exists (select name from master.dbo.sysxlogins where name='kfischer')
EXEC master..sp_addlogin 'kfischer', @pwd, @sid = 0x744499E6843A4847A8C114D65D24E107, @encryptopt = 'skip_encryption_old'
 
-- Login: kfletche
SET @pwd = CONVERT (varchar(256), 0x2131214A212A5C382F514B542A304A52)
if not exists (select name from master.dbo.sysxlogins where name='kfletche')
EXEC master..sp_addlogin 'kfletche', @pwd, @sid = 0x568289755521694693C658BAB293F60E, @encryptopt = 'skip_encryption_old'
 
-- Login: kfpollitt
if not exists (select name from master.dbo.sysxlogins where name='kfpollitt')
EXEC master..sp_addlogin 'kfpollitt', NULL, @sid = 0x413C9E68E1087143A5DA3A78412FBAA6, @encryptopt = 'skip_encryption_old'
 
-- Login: kgrenier
SET @pwd = CONVERT (varchar(256), 0x21312442334D3D3C5C565F4D25483D38)
if not exists (select name from master.dbo.sysxlogins where name='kgrenier')
EXEC master..sp_addlogin 'kgrenier', @pwd, @sid = 0xFC5AFCDD7B7B1A4A84ED2C49D48F3A16, @encryptopt = 'skip_encryption_old'
 
-- Login: khaskins
SET @pwd = CONVERT (varchar(256), 0x2131214A212E4D2224572E5629225E4D)
if not exists (select name from master.dbo.sysxlogins where name='khaskins')
EXEC master..sp_addlogin 'khaskins', @pwd, @sid = 0xEC806B81158EDF46807BFEA5C5DB3074, @encryptopt = 'skip_encryption_old'
 
-- Login: khayre
SET @pwd = CONVERT (varchar(256), 0x2131242221245937605C583B42565933)
if not exists (select name from master.dbo.sysxlogins where name='khayre')
EXEC master..sp_addlogin 'khayre', @pwd, @sid = 0xFA5D2D2E784E4A4087CDBDF778572D80, @encryptopt = 'skip_encryption_old'
 
-- Login: khilder
SET @pwd = CONVERT (varchar(256), 0x2131214A212554362141443F27304B25)
if not exists (select name from master.dbo.sysxlogins where name='khilder')
EXEC master..sp_addlogin 'khilder', @pwd, @sid = 0x9A1E28B875BB384AB412F54628403EBD, @encryptopt = 'skip_encryption_old'
 
-- Login: kholt
SET @pwd = CONVERT (varchar(256), 0x2131214A212B4B264560594D303C5534)
if not exists (select name from master.dbo.sysxlogins where name='kholt')
EXEC master..sp_addlogin 'kholt', @pwd, @sid = 0x9A0200746DA15642BAE6C63C1E707E7A, @encryptopt = 'skip_encryption_old'
 
-- Login: khrgovic
SET @pwd = CONVERT (varchar(256), 0x2131215125302943424946352628343A)
if not exists (select name from master.dbo.sysxlogins where name='khrgovic')
EXEC master..sp_addlogin 'khrgovic', @pwd, @sid = 0xBD440D682E42BD4FA6887A3A458025E7, @encryptopt = 'skip_encryption_old'
 
-- Login: kinnes
SET @pwd = CONVERT (varchar(256), 0x2131224D303A2F2F5A4129472E5D3D42)
if not exists (select name from master.dbo.sysxlogins where name='kinnes')
EXEC master..sp_addlogin 'kinnes', @pwd, @sid = 0x890CCBE6D9DA034A9F2262049495A50E, @encryptopt = 'skip_encryption_old'
 
-- Login: kishmail
SET @pwd = CONVERT (varchar(256), 0x213123472C464022254D233857222743)
if not exists (select name from master.dbo.sysxlogins where name='kishmail')
EXEC master..sp_addlogin 'kishmail', @pwd, @sid = 0x2AB4E49BD8994F4AA6637185A66D634E, @encryptopt = 'skip_encryption_old'
 
-- Login: kjagodic
SET @pwd = CONVERT (varchar(256), 0x2131222634474E4526533A375D3D322A)
if not exists (select name from master.dbo.sysxlogins where name='kjagodic')
EXEC master..sp_addlogin 'kjagodic', @pwd, @sid = 0x2524B813514D574F9C58FCEBE3372C3C, @encryptopt = 'skip_encryption_old'
 
-- Login: kjanosi
SET @pwd = CONVERT (varchar(256), 0x2131214A212D3D4E40292D5531363255)
if not exists (select name from master.dbo.sysxlogins where name='kjanosi')
EXEC master..sp_addlogin 'kjanosi', @pwd, @sid = 0x1374999028B6FD4A932E40C71F241AEA, @encryptopt = 'skip_encryption_old'
 
-- Login: kjung
SET @pwd = CONVERT (varchar(256), 0x21312258224235582B382D4058542B4E)
if not exists (select name from master.dbo.sysxlogins where name='kjung')
EXEC master..sp_addlogin 'kjung', @pwd, @sid = 0x2DB9A6FC86FEDD418590645B61FBBEFD, @encryptopt = 'skip_encryption_old'
 
-- Login: kkuik
SET @pwd = CONVERT (varchar(256), 0x21312144332A42245D2D232360474D39)
if not exists (select name from master.dbo.sysxlogins where name='kkuik')
EXEC master..sp_addlogin 'kkuik', @pwd, @sid = 0x3E77AE1202FAF6458C920290192D2ABF, @encryptopt = 'skip_encryption_old'
 
-- Login: klevy
SET @pwd = CONVERT (varchar(256), 0x2131214A212F36472E2624344A445D21)
if not exists (select name from master.dbo.sysxlogins where name='klevy')
EXEC master..sp_addlogin 'klevy', @pwd, @sid = 0x6854EF53F729884C9E9A37AE59874315, @encryptopt = 'skip_encryption_old'
 
-- Login: kllewell
SET @pwd = CONVERT (varchar(256), 0x2131214A21225B425E3D5D342648513A)
if not exists (select name from master.dbo.sysxlogins where name='kllewell')
EXEC master..sp_addlogin 'kllewell', @pwd, @sid = 0xB3F951F24C402941AC07B9DAA816BB62, @encryptopt = 'skip_encryption_old'
 
-- Login: kllewlly
SET @pwd = CONVERT (varchar(256), 0x2131214A2123264B55305D35234D4048)
if not exists (select name from master.dbo.sysxlogins where name='kllewlly')
EXEC master..sp_addlogin 'kllewlly', @pwd, @sid = 0x25AC59D8A924E74987119704A851BA65, @encryptopt = 'skip_encryption_old'
 
-- Login: kmacphee
SET @pwd = CONVERT (varchar(256), 0x2131212332305D584F4633432E3A4134)
if not exists (select name from master.dbo.sysxlogins where name='kmacphee')
EXEC master..sp_addlogin 'kmacphee', @pwd, @sid = 0xF9C28B4172A742409A9F1611FCB8F185, @encryptopt = 'skip_encryption_old'
 
-- Login: kmartin
SET @pwd = CONVERT (varchar(256), 0x213123253A55424E5360524836362943)
if not exists (select name from master.dbo.sysxlogins where name='kmartin')
EXEC master..sp_addlogin 'kmartin', @pwd, @sid = 0x3B35C3F85AC427459ECB4DE24CBBCA47, @encryptopt = 'skip_encryption_old'
 
-- Login: kmatisic
SET @pwd = CONVERT (varchar(256), 0x213122253F52533934374E2F5D483736)
if not exists (select name from master.dbo.sysxlogins where name='kmatisic')
EXEC master..sp_addlogin 'kmatisic', @pwd, @sid = 0x8BDA5A6BD0DE6246A1BBF48999BC780E, @encryptopt = 'skip_encryption_old'
 
-- Login: kmayo
SET @pwd = CONVERT (varchar(256), 0x2131233B343E3934385B233658232A47)
if not exists (select name from master.dbo.sysxlogins where name='kmayo')
EXEC master..sp_addlogin 'kmayo', @pwd, @sid = 0xC885B36AE050B54CBAD91601EAA93C4B, @encryptopt = 'skip_encryption_old'
 
-- Login: kmcdiarm
SET @pwd = CONVERT (varchar(256), 0x2131214A212E435C22236043292F2329)
if not exists (select name from master.dbo.sysxlogins where name='kmcdiarm')
EXEC master..sp_addlogin 'kmcdiarm', @pwd, @sid = 0x06BDA3D1F5389A47A26F0B84BFA99D08, @encryptopt = 'skip_encryption_old'
 
-- Login: kmckay
SET @pwd = CONVERT (varchar(256), 0x2131233C362D31354B52312E3E543E51)
if not exists (select name from master.dbo.sysxlogins where name='kmckay')
EXEC master..sp_addlogin 'kmckay', @pwd, @sid = 0xF7EC63EFDF89394AA6A302003622317C, @encryptopt = 'skip_encryption_old'
 
-- Login: kmcnabb
SET @pwd = CONVERT (varchar(256), 0x2131214A2122414729524241422B2A3E)
if not exists (select name from master.dbo.sysxlogins where name='kmcnabb')
EXEC master..sp_addlogin 'kmcnabb', @pwd, @sid = 0xF3E4906A9486F544BE7D1F83B6F2256C, @encryptopt = 'skip_encryption_old'
 
-- Login: kmitchell
SET @pwd = CONVERT (varchar(256), 0x2131214A212D37264C27282259274D43)
if not exists (select name from master.dbo.sysxlogins where name='kmitchell')
EXEC master..sp_addlogin 'kmitchell', @pwd, @sid = 0xF173AD4D9D17EA43BF947C87E86E5BAB, @encryptopt = 'skip_encryption_old'
 
-- Login: kmorgan
SET @pwd = CONVERT (varchar(256), 0x2131214A212E322349454C5A29442159)
if not exists (select name from master.dbo.sysxlogins where name='kmorgan')
EXEC master..sp_addlogin 'kmorgan', @pwd, @sid = 0x4BEB4A4727162448876F79A3FBF9C39F, @encryptopt = 'skip_encryption_old'
 
-- Login: kmurphy
SET @pwd = CONVERT (varchar(256), 0x2131224B332B4B515444362F3D215727)
if not exists (select name from master.dbo.sysxlogins where name='kmurphy')
EXEC master..sp_addlogin 'kmurphy', @pwd, @sid = 0x489668FF0D5B3447886E2DCBDDEBE83B, @encryptopt = 'skip_encryption_old'
 
-- Login: kng
SET @pwd = CONVERT (varchar(256), 0x21312438272125453346502F524C4228)
if not exists (select name from master.dbo.sysxlogins where name='kng')
EXEC master..sp_addlogin 'kng', @pwd, @sid = 0xF70A3FFD64847846B5E53182BB923C3E, @encryptopt = 'skip_encryption_old'
 
-- Login: knott
SET @pwd = CONVERT (varchar(256), 0x2131214A212B56585F57515054222E2F)
if not exists (select name from master.dbo.sysxlogins where name='knott')
EXEC master..sp_addlogin 'knott', @pwd, @sid = 0xF7727D0845D5C242A6D8A224458B83A5, @encryptopt = 'skip_encryption_old'
 
-- Login: kohagan
SET @pwd = CONVERT (varchar(256), 0x2131235F272B215B2E4255573E383546)
if not exists (select name from master.dbo.sysxlogins where name='kohagan')
EXEC master..sp_addlogin 'kohagan', @pwd, @sid = 0x04078D5AB835054581737631ABE2C571, @encryptopt = 'skip_encryption_old'
 
-- Login: kolkiewicz
SET @pwd = CONVERT (varchar(256), 0x2131214A212C5F2242484E333F3D5C28)
if not exists (select name from master.dbo.sysxlogins where name='kolkiewicz')
EXEC master..sp_addlogin 'kolkiewicz', @pwd, @sid = 0xBC19B6693202694F8697C4AF893495ED, @encryptopt = 'skip_encryption_old'
 
-- Login: kpatters
SET @pwd = CONVERT (varchar(256), 0x213123422E443E2B4A233E4132363B32)
if not exists (select name from master.dbo.sysxlogins where name='kpatters')
EXEC master..sp_addlogin 'kpatters', @pwd, @sid = 0xA561FA5BD5EEF44299D5D74F9EFFE869, @encryptopt = 'skip_encryption_old'
 
-- Login: kperdriel
SET @pwd = CONVERT (varchar(256), 0x2131214A212F253F422D45282241482F)
if not exists (select name from master.dbo.sysxlogins where name='kperdriel')
EXEC master..sp_addlogin 'kperdriel', @pwd, @sid = 0x654BD5C846671A49ABB452F60D53CDFF, @encryptopt = 'skip_encryption_old'
 
-- Login: kramadan
SET @pwd = CONVERT (varchar(256), 0x2131214A2124293528244634592A5C58)
if not exists (select name from master.dbo.sysxlogins where name='kramadan')
EXEC master..sp_addlogin 'kramadan', @pwd, @sid = 0xA5825137C8266A499C7F65265065BF56, @encryptopt = 'skip_encryption_old'
 
-- Login: kreed
SET @pwd = CONVERT (varchar(256), 0x2131214A2128232A575649254C38265C)
if not exists (select name from master.dbo.sysxlogins where name='kreed')
EXEC master..sp_addlogin 'kreed', @pwd, @sid = 0x323B672358C3584B84620334E06B6991, @encryptopt = 'skip_encryption_old'
 
-- Login: kreierson
SET @pwd = CONVERT (varchar(256), 0x2131214A212B474A28433C523B3A2630)
if not exists (select name from master.dbo.sysxlogins where name='kreierson')
EXEC master..sp_addlogin 'kreierson', @pwd, @sid = 0x62A147AA1ACA6344B0B526B993DC2E28, @encryptopt = 'skip_encryption_old'
 
-- Login: krolfe
SET @pwd = CONVERT (varchar(256), 0x213123253A6024424C293148552C4048)
if not exists (select name from master.dbo.sysxlogins where name='krolfe')
EXEC master..sp_addlogin 'krolfe', @pwd, @sid = 0xA8D3ECD4CC61E64DB680B42BF33BCAC6, @encryptopt = 'skip_encryption_old'
 
-- Login: krwallis
SET @pwd = CONVERT (varchar(256), 0x2131233A3B2B322A4345593A533B4C3E)
if not exists (select name from master.dbo.sysxlogins where name='krwallis')
EXEC master..sp_addlogin 'krwallis', @pwd, @sid = 0x97256BE97527A1489BB19A9787981FFC, @encryptopt = 'skip_encryption_old'
 
-- Login: kschaff
SET @pwd = CONVERT (varchar(256), 0x2131244233462123505D485E3D254C56)
if not exists (select name from master.dbo.sysxlogins where name='kschaff')
EXEC master..sp_addlogin 'kschaff', @pwd, @sid = 0xC19E5ADDC36B4248943FC9952BD574A3, @encryptopt = 'skip_encryption_old'
 
-- Login: ksedore
SET @pwd = CONVERT (varchar(256), 0x2131214A212254524C52492750583E2B)
if not exists (select name from master.dbo.sysxlogins where name='ksedore')
EXEC master..sp_addlogin 'ksedore', @pwd, @sid = 0xA36FA823728B734289A1DD2B861A55D4, @encryptopt = 'skip_encryption_old'
 
-- Login: ksharma
SET @pwd = CONVERT (varchar(256), 0x2131214A21302D512236603C2A402F57)
if not exists (select name from master.dbo.sysxlogins where name='ksharma')
EXEC master..sp_addlogin 'ksharma', @pwd, @sid = 0xB193E6A31AF8874297CCF8FDF47AB3FE, @encryptopt = 'skip_encryption_old'
 
-- Login: kshubrook
SET @pwd = CONVERT (varchar(256), 0x2131214A2124385522274F4755384530)
if not exists (select name from master.dbo.sysxlogins where name='kshubrook')
EXEC master..sp_addlogin 'kshubrook', @pwd, @sid = 0xD797ACA976019B42AEC2D5D6062BDF1E, @encryptopt = 'skip_encryption_old'
 
-- Login: ksidhu
SET @pwd = CONVERT (varchar(256), 0x2131214A21245D2D38305C5B4025563C)
if not exists (select name from master.dbo.sysxlogins where name='ksidhu')
EXEC master..sp_addlogin 'ksidhu', @pwd, @sid = 0x52CFAEA406A3CA49A6C1BB3086485056, @encryptopt = 'skip_encryption_old'
 
-- Login: ksill
SET @pwd = CONVERT (varchar(256), 0x2131214A212525213053285A24465742)
if not exists (select name from master.dbo.sysxlogins where name='ksill')
EXEC master..sp_addlogin 'ksill', @pwd, @sid = 0x2599D4FD4FF5154D822B2441AEC3125E, @encryptopt = 'skip_encryption_old'
 
-- Login: kslaney
SET @pwd = CONVERT (varchar(256), 0x2131213E373C34556041402360283F47)
if not exists (select name from master.dbo.sysxlogins where name='kslaney')
EXEC master..sp_addlogin 'kslaney', @pwd, @sid = 0x12AA0674A733C9419FE179A7411E8E79, @encryptopt = 'skip_encryption_old'
 
-- Login: kstearma
SET @pwd = CONVERT (varchar(256), 0x2131214433215D574F45495B2A3C475D)
if not exists (select name from master.dbo.sysxlogins where name='kstearma')
EXEC master..sp_addlogin 'kstearma', @pwd, @sid = 0xF842EBBB941FE2489339E61F29820173, @encryptopt = 'skip_encryption_old'
 
-- Login: ksumay
SET @pwd = CONVERT (varchar(256), 0x2131214A212E235F22445E5E30473151)
if not exists (select name from master.dbo.sysxlogins where name='ksumay')
EXEC master..sp_addlogin 'ksumay', @pwd, @sid = 0x447DA97B2327704988B93BDA89F6F1F9, @encryptopt = 'skip_encryption_old'
 
-- Login: ktropeau
SET @pwd = CONVERT (varchar(256), 0x2131214A2122552D5A472C51433B4C31)
if not exists (select name from master.dbo.sysxlogins where name='ktropeau')
EXEC master..sp_addlogin 'ktropeau', @pwd, @sid = 0x257359496EE05E41B8597DA371424524, @encryptopt = 'skip_encryption_old'
 
-- Login: ktuckwoo
SET @pwd = CONVERT (varchar(256), 0x21312160283E253048494C3624463E5F)
if not exists (select name from master.dbo.sysxlogins where name='ktuckwoo')
EXEC master..sp_addlogin 'ktuckwoo', @pwd, @sid = 0x3EC271B666080A4FB5D058FCCCF69AC3, @encryptopt = 'skip_encryption_old'
 
-- Login: kwatanabe
SET @pwd = CONVERT (varchar(256), 0x2131214A212C4E5449273C515957594B)
if not exists (select name from master.dbo.sysxlogins where name='kwatanabe')
EXEC master..sp_addlogin 'kwatanabe', @pwd, @sid = 0x39C61AE63859A54D94398964151620D3, @encryptopt = 'skip_encryption_old'
 
-- Login: kwboyd
SET @pwd = CONVERT (varchar(256), 0x2131214A213033525830453E57312E60)
if not exists (select name from master.dbo.sysxlogins where name='kwboyd')
EXEC master..sp_addlogin 'kwboyd', @pwd, @sid = 0x2CBDF519872B5E4F892DB3890CA92DBB, @encryptopt = 'skip_encryption_old'
 
-- Login: kweckess
SET @pwd = CONVERT (varchar(256), 0x213124373B492C28583D3A5240253A41)
if not exists (select name from master.dbo.sysxlogins where name='kweckess')
EXEC master..sp_addlogin 'kweckess', @pwd, @sid = 0xA8F5CB31A72122499721596D5E134B57, @encryptopt = 'skip_encryption_old'
 
-- Login: kwhitake
SET @pwd = CONVERT (varchar(256), 0x2131214A212A543C575B524638372143)
if not exists (select name from master.dbo.sysxlogins where name='kwhitake')
EXEC master..sp_addlogin 'kwhitake', @pwd, @sid = 0xD4B0C32D10F9A4479C463D796D9C746D, @encryptopt = 'skip_encryption_old'
 
-- Login: kwildy
SET @pwd = CONVERT (varchar(256), 0x2131214A21262830504B4F56423F5138)
if not exists (select name from master.dbo.sysxlogins where name='kwildy')
EXEC master..sp_addlogin 'kwildy', @pwd, @sid = 0x2AF61C541F8F274AB7EC8B43B7EC0507, @encryptopt = 'skip_encryption_old'
 
-- Login: kwilliam
if not exists (select name from master.dbo.sysxlogins where name='kwilliam')
EXEC master..sp_addlogin 'kwilliam', NULL, @sid = 0x3C85E0E1E938E341B35DCE5DF319AADE, @encryptopt = 'skip_encryption_old'
 
-- Login: kwilson
SET @pwd = CONVERT (varchar(256), 0x213124372C2C5F30594A5056265C463B)
if not exists (select name from master.dbo.sysxlogins where name='kwilson')
EXEC master..sp_addlogin 'kwilson', @pwd, @sid = 0x9CC89037DF1F2748BEA2C0B50DF70ECF, @encryptopt = 'skip_encryption_old'
 
-- Login: kwishart
SET @pwd = CONVERT (varchar(256), 0x2131214A212B533954522A4C3F5E5B31)
if not exists (select name from master.dbo.sysxlogins where name='kwishart')
EXEC master..sp_addlogin 'kwishart', @pwd, @sid = 0xCA59298EC8CE814B8620956C9A258A02, @encryptopt = 'skip_encryption_old'
 
-- Login: kwoodman
SET @pwd = CONVERT (varchar(256), 0x2131214433273D5C572F413E42594552)
if not exists (select name from master.dbo.sysxlogins where name='kwoodman')
EXEC master..sp_addlogin 'kwoodman', @pwd, @sid = 0xB532294DE6A55C4F96E43FD675A4D00A, @encryptopt = 'skip_encryption_old'
 
-- Login: kyoo
SET @pwd = CONVERT (varchar(256), 0x2131245237452134502B36382A283A5B)
if not exists (select name from master.dbo.sysxlogins where name='kyoo')
EXEC master..sp_addlogin 'kyoo', @pwd, @sid = 0x815EB1D33FB2F84F8B05D9B9744304C1, @encryptopt = 'skip_encryption_old'
 
-- Login: labay
SET @pwd = CONVERT (varchar(256), 0x2131214A212555564945553D4F4D4B24)
if not exists (select name from master.dbo.sysxlogins where name='labay')
EXEC master..sp_addlogin 'labay', @pwd, @sid = 0x058A95D5360BD64D9FB4C4DEFF062A9B, @encryptopt = 'skip_encryption_old'
 
-- Login: laking
SET @pwd = CONVERT (varchar(256), 0x213121282244412C314B483E5D465558)
if not exists (select name from master.dbo.sysxlogins where name='laking')
EXEC master..sp_addlogin 'laking', @pwd, @sid = 0x0ACD374205B23B4ABE974EA36D19240D, @encryptopt = 'skip_encryption_old'
 
-- Login: lanichol
SET @pwd = CONVERT (varchar(256), 0x21312442334F3348322A374B4A533D3C)
if not exists (select name from master.dbo.sysxlogins where name='lanichol')
EXEC master..sp_addlogin 'lanichol', @pwd, @sid = 0x38BB3E1CF4CDEB459A46A2DFA80DDB05, @encryptopt = 'skip_encryption_old'
 
-- Login: latwal
SET @pwd = CONVERT (varchar(256), 0x2131236035273152432643405D562823)
if not exists (select name from master.dbo.sysxlogins where name='latwal')
EXEC master..sp_addlogin 'latwal', @pwd, @sid = 0x7B82872568F18C469453101ECB5B4525, @encryptopt = 'skip_encryption_old'
 
-- Login: lbannister
SET @pwd = CONVERT (varchar(256), 0x2131214A21293C3D262C455526344048)
if not exists (select name from master.dbo.sysxlogins where name='lbannister')
EXEC master..sp_addlogin 'lbannister', @pwd, @sid = 0x86A99D7C2B6CDF479318AF42500BDB49, @encryptopt = 'skip_encryption_old'
 
-- Login: lbishop
SET @pwd = CONVERT (varchar(256), 0x2131214A212F4659292A2531583F2F37)
if not exists (select name from master.dbo.sysxlogins where name='lbishop')
EXEC master..sp_addlogin 'lbishop', @pwd, @sid = 0x030D41C4677DA645B2C513BC1D95EEEB, @encryptopt = 'skip_encryption_old'
 
-- Login: lboreen
SET @pwd = CONVERT (varchar(256), 0x2131214A212C504A2655444E4E424F5C)
if not exists (select name from master.dbo.sysxlogins where name='lboreen')
EXEC master..sp_addlogin 'lboreen', @pwd, @sid = 0xDF5A9A6E27B456479BDABDD25E61E1BC, @encryptopt = 'skip_encryption_old'
 
-- Login: lbremner
SET @pwd = CONVERT (varchar(256), 0x2131213F24254C2D592D5B2938492825)
if not exists (select name from master.dbo.sysxlogins where name='lbremner')
EXEC master..sp_addlogin 'lbremner', @pwd, @sid = 0x7C3A21DAFC458C468F01DD6D3FE537A7, @encryptopt = 'skip_encryption_old'
 
-- Login: lbundun
SET @pwd = CONVERT (varchar(256), 0x213123462B6024374254252357245C2A)
if not exists (select name from master.dbo.sysxlogins where name='lbundun')
EXEC master..sp_addlogin 'lbundun', @pwd, @sid = 0x5CAAA50F72AF9B499AC2C7734874C71A, @encryptopt = 'skip_encryption_old'
 
-- Login: lbutler
SET @pwd = CONVERT (varchar(256), 0x21312337405B47255F5956513642263E)
if not exists (select name from master.dbo.sysxlogins where name='lbutler')
EXEC master..sp_addlogin 'lbutler', @pwd, @sid = 0x56ED77BFB34A3D4F8C94708BF3E2C5F0, @encryptopt = 'skip_encryption_old'
 
-- Login: lcarefoo
SET @pwd = CONVERT (varchar(256), 0x21312144332D263D2F48485E58336037)
if not exists (select name from master.dbo.sysxlogins where name='lcarefoo')
EXEC master..sp_addlogin 'lcarefoo', @pwd, @sid = 0x42D1C33EAB4DBE489288E414F65871EE, @encryptopt = 'skip_encryption_old'
 
-- Login: lcarusa
SET @pwd = CONVERT (varchar(256), 0x2131214A212D57595550312139533156)
if not exists (select name from master.dbo.sysxlogins where name='lcarusa')
EXEC master..sp_addlogin 'lcarusa', @pwd, @sid = 0xDDBFB9DF14FEE146BA4B475E16E494FD, @encryptopt = 'skip_encryption_old'
 
-- Login: lcaruso
SET @pwd = CONVERT (varchar(256), 0x2131214A212F235E2B29524048434C2C)
if not exists (select name from master.dbo.sysxlogins where name='lcaruso')
EXEC master..sp_addlogin 'lcaruso', @pwd, @sid = 0xFF99400EB58C3A4CA0E63DC03F6FCB56, @encryptopt = 'skip_encryption_old'
 
-- Login: lcaruso2
SET @pwd = CONVERT (varchar(256), 0x2131214A212A3F5721443B5622414F4C)
if not exists (select name from master.dbo.sysxlogins where name='lcaruso2')
EXEC master..sp_addlogin 'lcaruso2', @pwd, @sid = 0xE1930705AD844A4391112796B8F9648A, @encryptopt = 'skip_encryption_old'
 
-- Login: lcarviel
SET @pwd = CONVERT (varchar(256), 0x2131243A2732343E555B304F3739325C)
if not exists (select name from master.dbo.sysxlogins where name='lcarviel')
EXEC master..sp_addlogin 'lcarviel', @pwd, @sid = 0xDEEA763C8F319247876369D7BF8EF638, @encryptopt = 'skip_encryption_old'
 
-- Login: lchan
SET @pwd = CONVERT (varchar(256), 0x2131234631255F57234A415A60505523)
if not exists (select name from master.dbo.sysxlogins where name='lchan')
EXEC master..sp_addlogin 'lchan', @pwd, @sid = 0xABA6DB2BB2882C41908F9022415E33D2, @encryptopt = 'skip_encryption_old'
 
-- Login: lcharles
SET @pwd = CONVERT (varchar(256), 0x2131214A2125464C4E312854443B3033)
if not exists (select name from master.dbo.sysxlogins where name='lcharles')
EXEC master..sp_addlogin 'lcharles', @pwd, @sid = 0x82A38C8BFE6B36468E9B08251CF763B8, @encryptopt = 'skip_encryption_old'
 
-- Login: lchiu
SET @pwd = CONVERT (varchar(256), 0x2131214A21216051562E4B5B2539413F)
if not exists (select name from master.dbo.sysxlogins where name='lchiu')
EXEC master..sp_addlogin 'lchiu', @pwd, @sid = 0xED7ACB04C405EF40A31962ACA10B0B6C, @encryptopt = 'skip_encryption_old'
 
-- Login: lchoy
SET @pwd = CONVERT (varchar(256), 0x2131214A212B314A5629324648592940)
if not exists (select name from master.dbo.sysxlogins where name='lchoy')
EXEC master..sp_addlogin 'lchoy', @pwd, @sid = 0xABEAA0B5D040A149A2BC8FBA1D2AD9F4, @encryptopt = 'skip_encryption_old'
 
-- Login: lchristi
SET @pwd = CONVERT (varchar(256), 0x2131225F22303F26282D573156274941)
if not exists (select name from master.dbo.sysxlogins where name='lchristi')
EXEC master..sp_addlogin 'lchristi', @pwd, @sid = 0xF4A7CEA702D4194D97E44198ED40B367, @encryptopt = 'skip_encryption_old'
 
-- Login: lcollins
SET @pwd = CONVERT (varchar(256), 0x21312144332C21263B3D5A353D283756)
if not exists (select name from master.dbo.sysxlogins where name='lcollins')
EXEC master..sp_addlogin 'lcollins', @pwd, @sid = 0xF11A92557B967D48833DE5A5EFCD56C4, @encryptopt = 'skip_encryption_old'
 
-- Login: lcorbeil
SET @pwd = CONVERT (varchar(256), 0x2131214A2125352C3A42474343533A5E)
if not exists (select name from master.dbo.sysxlogins where name='lcorbeil')
EXEC master..sp_addlogin 'lcorbeil', @pwd, @sid = 0x2AFFD4D3191F8C4A9EBE93EBA7739BBF, @encryptopt = 'skip_encryption_old'
 
-- Login: lcousine
SET @pwd = CONVERT (varchar(256), 0x2131235F27223C243E414C47252F4355)
if not exists (select name from master.dbo.sysxlogins where name='lcousine')
EXEC master..sp_addlogin 'lcousine', @pwd, @sid = 0x19DC6DBA913AB24EAB9611EDFC04D1B7, @encryptopt = 'skip_encryption_old'
 
-- Login: lcressey
SET @pwd = CONVERT (varchar(256), 0x2131214A212A3A5C3C2E51592A3C583E)
if not exists (select name from master.dbo.sysxlogins where name='lcressey')
EXEC master..sp_addlogin 'lcressey', @pwd, @sid = 0xAFFDA72BCE9E654995124543E6F575E8, @encryptopt = 'skip_encryption_old'
 
-- Login: ldang
SET @pwd = CONVERT (varchar(256), 0x21312135384535465D2329545C2C6042)
if not exists (select name from master.dbo.sysxlogins where name='ldang')
EXEC master..sp_addlogin 'ldang', @pwd, @sid = 0x4A76D30E7F3BF54B8B95DF13CF927616, @encryptopt = 'skip_encryption_old'
 
-- Login: ldaniels
SET @pwd = CONVERT (varchar(256), 0x2131214D362E49594D51264A52503C55)
if not exists (select name from master.dbo.sysxlogins where name='ldaniels')
EXEC master..sp_addlogin 'ldaniels', @pwd, @sid = 0x82F11BF655620D4890B7D54E1720B334, @encryptopt = 'skip_encryption_old'
 
-- Login: ldantas
SET @pwd = CONVERT (varchar(256), 0x2131214A212521272551544C56595755)
if not exists (select name from master.dbo.sysxlogins where name='ldantas')
EXEC master..sp_addlogin 'ldantas', @pwd, @sid = 0xCA81A00A61C61A4FA6046C0B24E77817, @encryptopt = 'skip_encryption_old'
 
-- Login: lderose
SET @pwd = CONVERT (varchar(256), 0x2131214A21262F28472C403C38534C22)
if not exists (select name from master.dbo.sysxlogins where name='lderose')
EXEC master..sp_addlogin 'lderose', @pwd, @sid = 0x6A14B9231653734586AA9FB5F4FE7EA4, @encryptopt = 'skip_encryption_old'
 
-- Login: ldichociel
SET @pwd = CONVERT (varchar(256), 0x2131235F2727353F5555443B5E275F21)
if not exists (select name from master.dbo.sysxlogins where name='ldichociel')
EXEC master..sp_addlogin 'ldichociel', @pwd, @sid = 0xAF7A2C059870574387B2E68E68C338B5, @encryptopt = 'skip_encryption_old'
 
-- Login: ldichociello
SET @pwd = CONVERT (varchar(256), 0x2131214A21304E3A2D6033312D372B45)
if not exists (select name from master.dbo.sysxlogins where name='ldichociello')
EXEC master..sp_addlogin 'ldichociello', @pwd, @sid = 0x4BBB4CC9386AE947B50C60F07DBB355A, @encryptopt = 'skip_encryption_old'
 
-- Login: ldouglas
SET @pwd = CONVERT (varchar(256), 0x2131214A21233D40602326245A252148)
if not exists (select name from master.dbo.sysxlogins where name='ldouglas')
EXEC master..sp_addlogin 'ldouglas', @pwd, @sid = 0x793FB765F3633E468D81D93A19EC73AC, @encryptopt = 'skip_encryption_old'
 
-- Login: ldoyle
SET @pwd = CONVERT (varchar(256), 0x2131214A2126274B4135383E56522157)
if not exists (select name from master.dbo.sysxlogins where name='ldoyle')
EXEC master..sp_addlogin 'ldoyle', @pwd, @sid = 0x1A6E5E460D209041B159C87D32F3B182, @encryptopt = 'skip_encryption_old'
 
-- Login: lduck
SET @pwd = CONVERT (varchar(256), 0x2131214A21292F23564D4C222249294D)
if not exists (select name from master.dbo.sysxlogins where name='lduck')
EXEC master..sp_addlogin 'lduck', @pwd, @sid = 0xD1F733E9200AC4479B8A90C1A3EDD5D8, @encryptopt = 'skip_encryption_old'
 
-- Login: ldykma
SET @pwd = CONVERT (varchar(256), 0x2131214A212B56585F57515054222E2F)
if not exists (select name from master.dbo.sysxlogins where name='ldykma')
EXEC master..sp_addlogin 'ldykma', @pwd, @sid = 0x92F898F612B973488D3B4E78DAF2142F, @encryptopt = 'skip_encryption_old'
 
-- Login: ldykman
SET @pwd = CONVERT (varchar(256), 0x2131214433294B2722403623524D2325)
if not exists (select name from master.dbo.sysxlogins where name='ldykman')
EXEC master..sp_addlogin 'ldykman', @pwd, @sid = 0xFBBF85E18FC70841A3745BE78391B019, @encryptopt = 'skip_encryption_old'
 
-- Login: lewisv
SET @pwd = CONVERT (varchar(256), 0x2131214A21272154584E454749232D3A)
if not exists (select name from master.dbo.sysxlogins where name='lewisv')
EXEC master..sp_addlogin 'lewisv', @pwd, @sid = 0x20A5E8FA6E513F4083682C986D02D861, @encryptopt = 'skip_encryption_old'
 
-- Login: lfanshaw
SET @pwd = CONVERT (varchar(256), 0x21312234273C60492C4F3F2151432A3B)
if not exists (select name from master.dbo.sysxlogins where name='lfanshaw')
EXEC master..sp_addlogin 'lfanshaw', @pwd, @sid = 0x6B1066A00C929948ADC300867D3FD9B8, @encryptopt = 'skip_encryption_old'
 
-- Login: lfaris
SET @pwd = CONVERT (varchar(256), 0x2131214A212D2A2F40483F53322E4543)
if not exists (select name from master.dbo.sysxlogins where name='lfaris')
EXEC master..sp_addlogin 'lfaris', @pwd, @sid = 0xD7C5F126B5EF104AA9EBABA2CBF7A30B, @encryptopt = 'skip_encryption_old'
 
-- Login: lfarnell
SET @pwd = CONVERT (varchar(256), 0x213123522A41293E595C23414A2A5340)
if not exists (select name from master.dbo.sysxlogins where name='lfarnell')
EXEC master..sp_addlogin 'lfarnell', @pwd, @sid = 0x7B874EBF36445E48A83B248D0DB8FC73, @encryptopt = 'skip_encryption_old'
 
-- Login: lfaure
SET @pwd = CONVERT (varchar(256), 0x2131214A212C244131404B3B494B4C53)
if not exists (select name from master.dbo.sysxlogins where name='lfaure')
EXEC master..sp_addlogin 'lfaure', @pwd, @sid = 0x67807229B720B24CB567EB7EEE0326E1, @encryptopt = 'skip_encryption_old'
 
-- Login: lferrier
SET @pwd = CONVERT (varchar(256), 0x213123253A51394836263C42243E5B35)
if not exists (select name from master.dbo.sysxlogins where name='lferrier')
EXEC master..sp_addlogin 'lferrier', @pwd, @sid = 0xE8F004E68223B64389A02877D6C147FA, @encryptopt = 'skip_encryption_old'
 
-- Login: lficociell
SET @pwd = CONVERT (varchar(256), 0x2131214A212C544332405E5C245E434D)
if not exists (select name from master.dbo.sysxlogins where name='lficociell')
EXEC master..sp_addlogin 'lficociell', @pwd, @sid = 0x6B5D560339A93147A7D894C2F4CA5779, @encryptopt = 'skip_encryption_old'
 
-- Login: lficociello
SET @pwd = CONVERT (varchar(256), 0x2131214A21275D575A3E243E605D435D)
if not exists (select name from master.dbo.sysxlogins where name='lficociello')
EXEC master..sp_addlogin 'lficociello', @pwd, @sid = 0x5C9EED7453811544AB90A2F0BA55AB39, @encryptopt = 'skip_encryption_old'
 
-- Login: lfilomar
SET @pwd = CONVERT (varchar(256), 0x2131232C314945255D524132533E5655)
if not exists (select name from master.dbo.sysxlogins where name='lfilomar')
EXEC master..sp_addlogin 'lfilomar', @pwd, @sid = 0xEAB5964B9CDFF448965FD36621A13C28, @encryptopt = 'skip_encryption_old'
 
-- Login: lgage
SET @pwd = CONVERT (varchar(256), 0x2131214A2124574E21383B30345C4141)
if not exists (select name from master.dbo.sysxlogins where name='lgage')
EXEC master..sp_addlogin 'lgage', @pwd, @sid = 0x4695237F2FE44F4BB7051D850655D2FB, @encryptopt = 'skip_encryption_old'
 
-- Login: lgartner
SET @pwd = CONVERT (varchar(256), 0x2131242C3B532A542E3A592B4C314542)
if not exists (select name from master.dbo.sysxlogins where name='lgartner')
EXEC master..sp_addlogin 'lgartner', @pwd, @sid = 0x85F3CF238E52A640B56AD5207216B342, @encryptopt = 'skip_encryption_old'
 
-- Login: lgill
SET @pwd = CONVERT (varchar(256), 0x2131245B3A442435404A243341562E37)
if not exists (select name from master.dbo.sysxlogins where name='lgill')
EXEC master..sp_addlogin 'lgill', @pwd, @sid = 0xD30DA9D5A5B988469DD8AFCAA43E1576, @encryptopt = 'skip_encryption_old'
 
-- Login: lharding
SET @pwd = CONVERT (varchar(256), 0x2131214A2126592F2B4A2A4B4D393E33)
if not exists (select name from master.dbo.sysxlogins where name='lharding')
EXEC master..sp_addlogin 'lharding', @pwd, @sid = 0xA29E45C96D342D438F0C9DBCEDA8D9D1, @encryptopt = 'skip_encryption_old'
 
-- Login: lhatt
SET @pwd = CONVERT (varchar(256), 0x213124523C3D3D33563853542F293D2A)
if not exists (select name from master.dbo.sysxlogins where name='lhatt')
EXEC master..sp_addlogin 'lhatt', @pwd, @sid = 0x184A6286E34D234EAB6A74B0EF0C1C7A, @encryptopt = 'skip_encryption_old'
 
-- Login: lholland
SET @pwd = CONVERT (varchar(256), 0x2131214A21234C4E575E38334E4C4721)
if not exists (select name from master.dbo.sysxlogins where name='lholland')
EXEC master..sp_addlogin 'lholland', @pwd, @sid = 0x778788A9FD99B645A696CD08A78DB175, @encryptopt = 'skip_encryption_old'
 
-- Login: lhook
SET @pwd = CONVERT (varchar(256), 0x213121282F234C544E2A323C34433D27)
if not exists (select name from master.dbo.sysxlogins where name='lhook')
EXEC master..sp_addlogin 'lhook', @pwd, @sid = 0x41A19BD6FAE24B439E72F86B4026DAB0, @encryptopt = 'skip_encryption_old'
 
-- Login: lhookham
SET @pwd = CONVERT (varchar(256), 0x2131242A24553549544F4F3F54334B30)
if not exists (select name from master.dbo.sysxlogins where name='lhookham')
EXEC master..sp_addlogin 'lhookham', @pwd, @sid = 0xC9BCD214C43BBB4296DB54506E727E63, @encryptopt = 'skip_encryption_old'
 
-- Login: lhume
SET @pwd = CONVERT (varchar(256), 0x2131214A21252A55602C3C444F372327)
if not exists (select name from master.dbo.sysxlogins where name='lhume')
EXEC master..sp_addlogin 'lhume', @pwd, @sid = 0x94E23E402050D74893A9BCA4B3C054B8, @encryptopt = 'skip_encryption_old'
 
-- Login: libailli
SET @pwd = CONVERT (varchar(256), 0x21312144332E512323335B275622212A)
if not exists (select name from master.dbo.sysxlogins where name='libailli')
EXEC master..sp_addlogin 'libailli', @pwd, @sid = 0xA21DB55BD6C380498950CE6EF7264504, @encryptopt = 'skip_encryption_old'
 
-- Login: lidouglas
SET @pwd = CONVERT (varchar(256), 0x2131214433232D23544D2E515D4C4924)
if not exists (select name from master.dbo.sysxlogins where name='lidouglas')
EXEC master..sp_addlogin 'lidouglas', @pwd, @sid = 0x68A67B6D28D38343A417559804A2A73E, @encryptopt = 'skip_encryption_old'
 
-- Login: lisaacso
SET @pwd = CONVERT (varchar(256), 0x2131232E2F4F2B3C48334F22393E593D)
if not exists (select name from master.dbo.sysxlogins where name='lisaacso')
EXEC master..sp_addlogin 'lisaacso', @pwd, @sid = 0xC36EF17B1006984FAEB3D16F5887F355, @encryptopt = 'skip_encryption_old'
 
-- Login: lismith
SET @pwd = CONVERT (varchar(256), 0x2131214A21262D5B5A5C24412D413E23)
if not exists (select name from master.dbo.sysxlogins where name='lismith')
EXEC master..sp_addlogin 'lismith', @pwd, @sid = 0xACA4CF238E0B3E4DA6C79E2007C31E45, @encryptopt = 'skip_encryption_old'
 
-- Login: lkane
if not exists (select name from master.dbo.sysxlogins where name='lkane')
EXEC master..sp_addlogin 'lkane', NULL, @sid = 0x735ABABB845984459811C1387EC6972D, @encryptopt = 'skip_encryption_old'
 
-- Login: lkanews
SET @pwd = CONVERT (varchar(256), 0x2131235F272A5F4251412448394D3B38)
if not exists (select name from master.dbo.sysxlogins where name='lkanews')
EXEC master..sp_addlogin 'lkanews', @pwd, @sid = 0x001EFE129C0DAE49B51702CD91D332CE, @encryptopt = 'skip_encryption_old'
 
-- Login: lkelly
SET @pwd = CONVERT (varchar(256), 0x21312145213543343E40223A30404835)
if not exists (select name from master.dbo.sysxlogins where name='lkelly')
EXEC master..sp_addlogin 'lkelly', @pwd, @sid = 0xA3CFA5B89B4930459342F935164B3176, @encryptopt = 'skip_encryption_old'
 
-- Login: lkent
SET @pwd = CONVERT (varchar(256), 0x2131214433275445503C4E533B2E2D5D)
if not exists (select name from master.dbo.sysxlogins where name='lkent')
EXEC master..sp_addlogin 'lkent', @pwd, @sid = 0x49FAA6C7EED8AD40A51A331073C337C9, @encryptopt = 'skip_encryption_old'
 
-- Login: lkondo
SET @pwd = CONVERT (varchar(256), 0x2131214A212B2D264138514F5A444D30)
if not exists (select name from master.dbo.sysxlogins where name='lkondo')
EXEC master..sp_addlogin 'lkondo', @pwd, @sid = 0x5DAFE222081D7C42866C8D6DBAED5AD3, @encryptopt = 'skip_encryption_old'
 
-- Login: lleckie
SET @pwd = CONVERT (varchar(256), 0x21312144332156565859515B57305543)
if not exists (select name from master.dbo.sysxlogins where name='lleckie')
EXEC master..sp_addlogin 'lleckie', @pwd, @sid = 0x7D271CF344AE174EB2E6CA199694DF6D, @encryptopt = 'skip_encryption_old'
 
-- Login: llee
SET @pwd = CONVERT (varchar(256), 0x2131214A21222A323C4B3039214C4024)
if not exists (select name from master.dbo.sysxlogins where name='llee')
EXEC master..sp_addlogin 'llee', @pwd, @sid = 0x2803BFC53FDB234FA766F2F844F636DD, @encryptopt = 'skip_encryption_old'
 
-- Login: llee2
SET @pwd = CONVERT (varchar(256), 0x2131214A2127603A41512E4B23245658)
if not exists (select name from master.dbo.sysxlogins where name='llee2')
EXEC master..sp_addlogin 'llee2', @pwd, @sid = 0x2281623433601649AE9B7430B729B23F, @encryptopt = 'skip_encryption_old'
 
-- Login: llorenze
SET @pwd = CONVERT (varchar(256), 0x2131214A2121283F4E5A5027603F3249)
if not exists (select name from master.dbo.sysxlogins where name='llorenze')
EXEC master..sp_addlogin 'llorenze', @pwd, @sid = 0x964A1ED24A607D418DF71F3D42CAC7DC, @encryptopt = 'skip_encryption_old'
 
-- Login: lmachan
SET @pwd = CONVERT (varchar(256), 0x2131222F3C315036243F36342E3E374D)
if not exists (select name from master.dbo.sysxlogins where name='lmachan')
EXEC master..sp_addlogin 'lmachan', @pwd, @sid = 0xC130E672F6714B49B4254DF02213032B, @encryptopt = 'skip_encryption_old'
 
-- Login: lmackinn
SET @pwd = CONVERT (varchar(256), 0x2131214A212836375E35515B24244A32)
if not exists (select name from master.dbo.sysxlogins where name='lmackinn')
EXEC master..sp_addlogin 'lmackinn', @pwd, @sid = 0x1835E39613A80840BAED7738174816A1, @encryptopt = 'skip_encryption_old'
 
-- Login: lmacpher
SET @pwd = CONVERT (varchar(256), 0x2131214A21285B3F3C375A22455E3542)
if not exists (select name from master.dbo.sysxlogins where name='lmacpher')
EXEC master..sp_addlogin 'lmacpher', @pwd, @sid = 0x6CBE6C5533AC6647B2157857862A3B24, @encryptopt = 'skip_encryption_old'
 
-- Login: lmamoser
SET @pwd = CONVERT (varchar(256), 0x21312144332252473C4E44315F35434E)
if not exists (select name from master.dbo.sysxlogins where name='lmamoser')
EXEC master..sp_addlogin 'lmamoser', @pwd, @sid = 0x55CB6DC28267C340952CB6378A7B12CB, @encryptopt = 'skip_encryption_old'
 
-- Login: lmarkin
SET @pwd = CONVERT (varchar(256), 0x2131214A2124432D52345C4238513A32)
if not exists (select name from master.dbo.sysxlogins where name='lmarkin')
EXEC master..sp_addlogin 'lmarkin', @pwd, @sid = 0xEA7613A042D6E449BE224FF1F82353A6, @encryptopt = 'skip_encryption_old'
 
-- Login: lmartin
SET @pwd = CONVERT (varchar(256), 0x213123232D563934502F49334E354251)
if not exists (select name from master.dbo.sysxlogins where name='lmartin')
EXEC master..sp_addlogin 'lmartin', @pwd, @sid = 0x142118351409DD498421370354E1EAD9, @encryptopt = 'skip_encryption_old'
 
-- Login: lmasi
SET @pwd = CONVERT (varchar(256), 0x21312145383543343E40223A30404835)
if not exists (select name from master.dbo.sysxlogins where name='lmasi')
EXEC master..sp_addlogin 'lmasi', @pwd, @sid = 0xABA349C1A103E84A8623CAB290171929, @encryptopt = 'skip_encryption_old'
 
-- Login: lmaxwell
SET @pwd = CONVERT (varchar(256), 0x2131214A212D4F584234372122485F4F)
if not exists (select name from master.dbo.sysxlogins where name='lmaxwell')
EXEC master..sp_addlogin 'lmaxwell', @pwd, @sid = 0x3FEAE8FDD8168649BB77BCDD9A948969, @encryptopt = 'skip_encryption_old'
 
-- Login: lmercer2
SET @pwd = CONVERT (varchar(256), 0x21312144332225415A5340423D544C5D)
if not exists (select name from master.dbo.sysxlogins where name='lmercer2')
EXEC master..sp_addlogin 'lmercer2', @pwd, @sid = 0x4A6D54482646D445984DEA9D9765B2CD, @encryptopt = 'skip_encryption_old'
 
-- Login: lmyers
SET @pwd = CONVERT (varchar(256), 0x2131214A21215E343B3F3D4C51455346)
if not exists (select name from master.dbo.sysxlogins where name='lmyers')
EXEC master..sp_addlogin 'lmyers', @pwd, @sid = 0xDD7EEED2D550F143ABE60505FF59CD4F, @encryptopt = 'skip_encryption_old'
 
-- Login: loconnor
SET @pwd = CONVERT (varchar(256), 0x2131213F3854295D51515A245E2D2D3D)
if not exists (select name from master.dbo.sysxlogins where name='loconnor')
EXEC master..sp_addlogin 'loconnor', @pwd, @sid = 0xF5F3663250B5CB44BD49076E5C1759F3, @encryptopt = 'skip_encryption_old'
 
-- Login: lodougla
SET @pwd = CONVERT (varchar(256), 0x2131235F27235F5E5C41324E4C455E50)
if not exists (select name from master.dbo.sysxlogins where name='lodougla')
EXEC master..sp_addlogin 'lodougla', @pwd, @sid = 0x7CB075EB17D5614EA9A13E7B0C855499, @encryptopt = 'skip_encryption_old'
 
-- Login: lolindsay
SET @pwd = CONVERT (varchar(256), 0x2131214A2128582B423A60292D2B542F)
if not exists (select name from master.dbo.sysxlogins where name='lolindsay')
EXEC master..sp_addlogin 'lolindsay', @pwd, @sid = 0x6A46D12CA868F9449FECDDAA58EA601C, @encryptopt = 'skip_encryption_old'
 
-- Login: lpantale
SET @pwd = CONVERT (varchar(256), 0x2131214A212B3A535D2B2D4E263D5051)
if not exists (select name from master.dbo.sysxlogins where name='lpantale')
EXEC master..sp_addlogin 'lpantale', @pwd, @sid = 0xFB4CF000EB5B4543B804A7792925F7F7, @encryptopt = 'skip_encryption_old'
 
-- Login: lpelley
SET @pwd = CONVERT (varchar(256), 0x2131243B2A5224592E435D5352532245)
if not exists (select name from master.dbo.sysxlogins where name='lpelley')
EXEC master..sp_addlogin 'lpelley', @pwd, @sid = 0x6E503C462BA63C4F88CB4F492AAC7C6B, @encryptopt = 'skip_encryption_old'
 
-- Login: lphillips2
SET @pwd = CONVERT (varchar(256), 0x2131214A212F44472D5C58275A55404B)
if not exists (select name from master.dbo.sysxlogins where name='lphillips2')
EXEC master..sp_addlogin 'lphillips2', @pwd, @sid = 0x8EDBF41A2CEBAC4B83CE8C3DDD8C2BD0, @encryptopt = 'skip_encryption_old'
 
-- Login: lporter
SET @pwd = CONVERT (varchar(256), 0x2131214A212A3234352B442534233525)
if not exists (select name from master.dbo.sysxlogins where name='lporter')
EXEC master..sp_addlogin 'lporter', @pwd, @sid = 0x39CD53EC7C966C439E7E2E9CD468AE43, @encryptopt = 'skip_encryption_old'
 
-- Login: lreardon
SET @pwd = CONVERT (varchar(256), 0x2131214A2123473A5C436048302C312E)
if not exists (select name from master.dbo.sysxlogins where name='lreardon')
EXEC master..sp_addlogin 'lreardon', @pwd, @sid = 0xD3EBBC086595444EA38C020D0F0630B5, @encryptopt = 'skip_encryption_old'
 
-- Login: lreynolds
SET @pwd = CONVERT (varchar(256), 0x21312144332723504B403948593F3124)
if not exists (select name from master.dbo.sysxlogins where name='lreynolds')
EXEC master..sp_addlogin 'lreynolds', @pwd, @sid = 0x4BCD22657E54B14197A054F08955DDB2, @encryptopt = 'skip_encryption_old'
 
-- Login: lross2
SET @pwd = CONVERT (varchar(256), 0x2131214A21303838284B414D284A232B)
if not exists (select name from master.dbo.sysxlogins where name='lross2')
EXEC master..sp_addlogin 'lross2', @pwd, @sid = 0x052E26EEA92FC14F9483676CA2763B06, @encryptopt = 'skip_encryption_old'
 
-- Login: lrother
SET @pwd = CONVERT (varchar(256), 0x2131214A212B462B2E4A344050493123)
if not exists (select name from master.dbo.sysxlogins where name='lrother')
EXEC master..sp_addlogin 'lrother', @pwd, @sid = 0x52CDA3E66A452F46AEA45EE2F6DDBC91, @encryptopt = 'skip_encryption_old'
 
-- Login: lsawkins
SET @pwd = CONVERT (varchar(256), 0x2131232D324F5B21433D513430415C4C)
if not exists (select name from master.dbo.sysxlogins where name='lsawkins')
EXEC master..sp_addlogin 'lsawkins', @pwd, @sid = 0xF8907539D81AD5429F4771A82F9D413F, @encryptopt = 'skip_encryption_old'
 
-- Login: lschneid
SET @pwd = CONVERT (varchar(256), 0x2131214A21232C4A245E4C5E4E415030)
if not exists (select name from master.dbo.sysxlogins where name='lschneid')
EXEC master..sp_addlogin 'lschneid', @pwd, @sid = 0x041A20A98A5F0B4A92A716AF3554233A, @encryptopt = 'skip_encryption_old'
 
-- Login: lschwarz
SET @pwd = CONVERT (varchar(256), 0x21312247342B2921332A222C2D3D5354)
if not exists (select name from master.dbo.sysxlogins where name='lschwarz')
EXEC master..sp_addlogin 'lschwarz', @pwd, @sid = 0xE2B0EE401A851149A9971BDEE8079108, @encryptopt = 'skip_encryption_old'
 
-- Login: lsegato
SET @pwd = CONVERT (varchar(256), 0x2131214A21245F453E4C5C3941592535)
if not exists (select name from master.dbo.sysxlogins where name='lsegato')
EXEC master..sp_addlogin 'lsegato', @pwd, @sid = 0xB996FBDC7601294CA44EF4BAB6267C0A, @encryptopt = 'skip_encryption_old'
 
-- Login: lsimard
SET @pwd = CONVERT (varchar(256), 0x2131214A212D59285F58362F5C21332C)
if not exists (select name from master.dbo.sysxlogins where name='lsimard')
EXEC master..sp_addlogin 'lsimard', @pwd, @sid = 0xE0BDA3EF667E83489BE73DFAA9CD7D28, @encryptopt = 'skip_encryption_old'
 
-- Login: lsirois
SET @pwd = CONVERT (varchar(256), 0x21312144332941225E3E292D5A4E5858)
if not exists (select name from master.dbo.sysxlogins where name='lsirois')
EXEC master..sp_addlogin 'lsirois', @pwd, @sid = 0xEEE7BD23B201FB4A9D60871AC8C0F99A, @encryptopt = 'skip_encryption_old'
 
-- Login: lsteward
SET @pwd = CONVERT (varchar(256), 0x21312434213E3B45484A5D5C21264137)
if not exists (select name from master.dbo.sysxlogins where name='lsteward')
EXEC master..sp_addlogin 'lsteward', @pwd, @sid = 0xF1C57FA0DE3CA04D8121F430EF81B418, @encryptopt = 'skip_encryption_old'
 
-- Login: lstewart
SET @pwd = CONVERT (varchar(256), 0x213122553F21363F433352452A42275C)
if not exists (select name from master.dbo.sysxlogins where name='lstewart')
EXEC master..sp_addlogin 'lstewart', @pwd, @sid = 0xDCDA2CA835902046A1C8364A8827A02F, @encryptopt = 'skip_encryption_old'
 
-- Login: ltodd
SET @pwd = CONVERT (varchar(256), 0x213122273D582B3A5A2A5A2940494554)
if not exists (select name from master.dbo.sysxlogins where name='ltodd')
EXEC master..sp_addlogin 'ltodd', @pwd, @sid = 0xB711E4640347754AAC68393BA151155D, @encryptopt = 'skip_encryption_old'
 
-- Login: ltopf
SET @pwd = CONVERT (varchar(256), 0x21312144332A2E424829233259454F44)
if not exists (select name from master.dbo.sysxlogins where name='ltopf')
EXEC master..sp_addlogin 'ltopf', @pwd, @sid = 0x045F49A49C9C5446AE436140225FFC5E, @encryptopt = 'skip_encryption_old'
 
-- Login: ltowers
SET @pwd = CONVERT (varchar(256), 0x2131212D2B51233A453329284F2F2A27)
if not exists (select name from master.dbo.sysxlogins where name='ltowers')
EXEC master..sp_addlogin 'ltowers', @pwd, @sid = 0x98B2DC89CF342C45A26F7A3F5917D6DE, @encryptopt = 'skip_encryption_old'
 
-- Login: ltrembla
SET @pwd = CONVERT (varchar(256), 0x2131222A2649372E38523D26563D3629)
if not exists (select name from master.dbo.sysxlogins where name='ltrembla')
EXEC master..sp_addlogin 'ltrembla', @pwd, @sid = 0xF951D1FB7BA63742AEFB94A7580A2AE6, @encryptopt = 'skip_encryption_old'
 
-- Login: ltse
SET @pwd = CONVERT (varchar(256), 0x2131243C235D484C40224827364B5D3A)
if not exists (select name from master.dbo.sysxlogins where name='ltse')
EXEC master..sp_addlogin 'ltse', @pwd, @sid = 0x572655F676EE824AA7017D80EBC13BB1, @encryptopt = 'skip_encryption_old'
 
-- Login: lunger
SET @pwd = CONVERT (varchar(256), 0x2131232B25533C5A28533C3059563D42)
if not exists (select name from master.dbo.sysxlogins where name='lunger')
EXEC master..sp_addlogin 'lunger', @pwd, @sid = 0xCDEBBF176F05604C89C0F63FC57DE85D, @encryptopt = 'skip_encryption_old'
 
-- Login: lvanden
SET @pwd = CONVERT (varchar(256), 0x2131214A2129553C56534B584D383B2A)
if not exists (select name from master.dbo.sysxlogins where name='lvanden')
EXEC master..sp_addlogin 'lvanden', @pwd, @sid = 0x6148E25B2B086B47A2FAAE8EBC18796C, @encryptopt = 'skip_encryption_old'
 
-- Login: lveenema
SET @pwd = CONVERT (varchar(256), 0x2131223F382B5925482A56215D424E54)
if not exists (select name from master.dbo.sysxlogins where name='lveenema')
EXEC master..sp_addlogin 'lveenema', @pwd, @sid = 0xF58D8FCC8A23BF44B82F70624637C74E, @encryptopt = 'skip_encryption_old'
 
-- Login: lwanbon
SET @pwd = CONVERT (varchar(256), 0x2131214A212E2B53482A312121556024)
if not exists (select name from master.dbo.sysxlogins where name='lwanbon')
EXEC master..sp_addlogin 'lwanbon', @pwd, @sid = 0x0BC841AEB196D14ABE426F5D5511FFBD, @encryptopt = 'skip_encryption_old'
 
-- Login: lwegner
SET @pwd = CONVERT (varchar(256), 0x2131214A212D2D235121354D3C47582C)
if not exists (select name from master.dbo.sysxlogins where name='lwegner')
EXEC master..sp_addlogin 'lwegner', @pwd, @sid = 0x2150081ADB965849A6A9472FEBCFD051, @encryptopt = 'skip_encryption_old'
 
-- Login: lwhite
SET @pwd = CONVERT (varchar(256), 0x2131233A21243A2E383F455432305055)
if not exists (select name from master.dbo.sysxlogins where name='lwhite')
EXEC master..sp_addlogin 'lwhite', @pwd, @sid = 0xBF931D107381F542AB46EC34E1221073, @encryptopt = 'skip_encryption_old'
 
-- Login: lwong
SET @pwd = CONVERT (varchar(256), 0x21312455253A385D5A312E552A493F3C)
if not exists (select name from master.dbo.sysxlogins where name='lwong')
EXEC master..sp_addlogin 'lwong', @pwd, @sid = 0xF007738E9586AD42B2EE430A410A6126, @encryptopt = 'skip_encryption_old'
 
-- Login: lwoyches
SET @pwd = CONVERT (varchar(256), 0x2131214A213029503D5D58324B262550)
if not exists (select name from master.dbo.sysxlogins where name='lwoyches')
EXEC master..sp_addlogin 'lwoyches', @pwd, @sid = 0x3C9E5D835FC0E740B8B06D6C7F7F9FC0, @encryptopt = 'skip_encryption_old'
 
-- Login: lwunderl
SET @pwd = CONVERT (varchar(256), 0x2131224D303628455A3B384242583854)
if not exists (select name from master.dbo.sysxlogins where name='lwunderl')
EXEC master..sp_addlogin 'lwunderl', @pwd, @sid = 0xC0C5DAD5B1B8AF4DB9C3CDED7B71D7E5, @encryptopt = 'skip_encryption_old'
 
-- Login: lyoung
SET @pwd = CONVERT (varchar(256), 0x2131214831302D235E3556455A3E3E5E)
if not exists (select name from master.dbo.sysxlogins where name='lyoung')
EXEC master..sp_addlogin 'lyoung', @pwd, @sid = 0xFDDC72AA6F6BE448AEE3F39D2B52993F, @encryptopt = 'skip_encryption_old'
 
-- Login: lzacharu
SET @pwd = CONVERT (varchar(256), 0x2131233B3E3D225035492D5928344E49)
if not exists (select name from master.dbo.sysxlogins where name='lzacharu')
EXEC master..sp_addlogin 'lzacharu', @pwd, @sid = 0x6E97B616549D5048A2490BC150FDEA0A, @encryptopt = 'skip_encryption_old'
 
-- Login: lzeller
SET @pwd = CONVERT (varchar(256), 0x213123253A544756554F503839462A4F)
if not exists (select name from master.dbo.sysxlogins where name='lzeller')
EXEC master..sp_addlogin 'lzeller', @pwd, @sid = 0xE68E5B77270BFE41BB29252625CFDF88, @encryptopt = 'skip_encryption_old'
 
-- Login: mabincy
SET @pwd = CONVERT (varchar(256), 0x2131214A212C5A5A592C323D2B442455)
if not exists (select name from master.dbo.sysxlogins where name='mabincy')
EXEC master..sp_addlogin 'mabincy', @pwd, @sid = 0x668DD02EEFEC9A43BAD374BD6740E5A4, @encryptopt = 'skip_encryption_old'
 
-- Login: maetchart
SET @pwd = CONVERT (varchar(256), 0x213123253A544E4C444030484D27362C)
if not exists (select name from master.dbo.sysxlogins where name='maetchart')
EXEC master..sp_addlogin 'maetchart', @pwd, @sid = 0x49C622373AEB394A9D945BC7492F56C3, @encryptopt = 'skip_encryption_old'
 
-- Login: malee
SET @pwd = CONVERT (varchar(256), 0x2131235F27305E2C4656532528472A60)
if not exists (select name from master.dbo.sysxlogins where name='malee')
EXEC master..sp_addlogin 'malee', @pwd, @sid = 0x77DD0C41386AC14ABEAE870E02E48408, @encryptopt = 'skip_encryption_old'
 
-- Login: mardyche
SET @pwd = CONVERT (varchar(256), 0x2131214A21274A4D322E5E2259334F41)
if not exists (select name from master.dbo.sysxlogins where name='mardyche')
EXEC master..sp_addlogin 'mardyche', @pwd, @sid = 0xF3CA901D58183B4A944C3E2DE3C4DEC8, @encryptopt = 'skip_encryption_old'
 
-- Login: matchiso
SET @pwd = CONVERT (varchar(256), 0x2131214A2129273A5E60472E46565A3F)
if not exists (select name from master.dbo.sysxlogins where name='matchiso')
EXEC master..sp_addlogin 'matchiso', @pwd, @sid = 0x30CA15B89C18BF4C8259F85369359193, @encryptopt = 'skip_encryption_old'
 
-- Login: mbanbait
SET @pwd = CONVERT (varchar(256), 0x213124363833282B35383D58502F2D33)
if not exists (select name from master.dbo.sysxlogins where name='mbanbait')
EXEC master..sp_addlogin 'mbanbait', @pwd, @sid = 0x1359576A2E2FDA43A1A0F312992E639A, @encryptopt = 'skip_encryption_old'
 
-- Login: mbanting
SET @pwd = CONVERT (varchar(256), 0x2131214A212F5F4B392D5B2B304C485A)
if not exists (select name from master.dbo.sysxlogins where name='mbanting')
EXEC master..sp_addlogin 'mbanting', @pwd, @sid = 0xC2F8643625A41A4FB60AD337BA863B30, @encryptopt = 'skip_encryption_old'
 
-- Login: mbauer
SET @pwd = CONVERT (varchar(256), 0x213124353B4D3B5D2F4D405631323A2C)
if not exists (select name from master.dbo.sysxlogins where name='mbauer')
EXEC master..sp_addlogin 'mbauer', @pwd, @sid = 0x08829A003B9AAE48BD4E4D397D73A66C, @encryptopt = 'skip_encryption_old'
 
-- Login: mbevis
SET @pwd = CONVERT (varchar(256), 0x2131214A2124433957603B4E4D544C34)
if not exists (select name from master.dbo.sysxlogins where name='mbevis')
EXEC master..sp_addlogin 'mbevis', @pwd, @sid = 0x42A22845915A034080A24729A0EA7931, @encryptopt = 'skip_encryption_old'
 
-- Login: mbirk
SET @pwd = CONVERT (varchar(256), 0x2131214A2130492F53473F2E38353655)
if not exists (select name from master.dbo.sysxlogins where name='mbirk')
EXEC master..sp_addlogin 'mbirk', @pwd, @sid = 0x13FD5ED69BD3CE429FF9A3E4575425F7, @encryptopt = 'skip_encryption_old'
 
-- Login: mboone
SET @pwd = CONVERT (varchar(256), 0x2131214A212E3F2534462F5C41262A50)
if not exists (select name from master.dbo.sysxlogins where name='mboone')
EXEC master..sp_addlogin 'mboone', @pwd, @sid = 0xEACDEE69D49B2445B1721C4E603096BF, @encryptopt = 'skip_encryption_old'
 
-- Login: mboyle
SET @pwd = CONVERT (varchar(256), 0x2131235F272B4C4E4F2228364234483C)
if not exists (select name from master.dbo.sysxlogins where name='mboyle')
EXEC master..sp_addlogin 'mboyle', @pwd, @sid = 0xC36C92F159E7914EB19FFDADC4473792, @encryptopt = 'skip_encryption_old'
 
-- Login: mbuchwit
SET @pwd = CONVERT (varchar(256), 0x2131225E3F332F5E243F4652314D3F23)
if not exists (select name from master.dbo.sysxlogins where name='mbuchwit')
EXEC master..sp_addlogin 'mbuchwit', @pwd, @sid = 0xD5C8AE29B5B29749B2CE4515376D536A, @encryptopt = 'skip_encryption_old'
 
-- Login: mbuenav
SET @pwd = CONVERT (varchar(256), 0x2131214A212639583E503E5F2E394C4C)
if not exists (select name from master.dbo.sysxlogins where name='mbuenav')
EXEC master..sp_addlogin 'mbuenav', @pwd, @sid = 0x6E2989D5323A8D4A83647A31B5321E7A, @encryptopt = 'skip_encryption_old'
 
-- Login: mchiang
SET @pwd = CONVERT (varchar(256), 0x2131222638552B3A2E47543B52584C58)
if not exists (select name from master.dbo.sysxlogins where name='mchiang')
EXEC master..sp_addlogin 'mchiang', @pwd, @sid = 0x775D15E52CE21141930349B3EBB5D32E, @encryptopt = 'skip_encryption_old'
 
-- Login: mcrane
SET @pwd = CONVERT (varchar(256), 0x21312149315B442C214C60522E37283D)
if not exists (select name from master.dbo.sysxlogins where name='mcrane')
EXEC master..sp_addlogin 'mcrane', @pwd, @sid = 0x1CA4550DAFE0FC4BB0DFD64B1A51EF21, @encryptopt = 'skip_encryption_old'
 
-- Login: mcrichton
SET @pwd = CONVERT (varchar(256), 0x2131214A21212945355B403B53335859)
if not exists (select name from master.dbo.sysxlogins where name='mcrichton')
EXEC master..sp_addlogin 'mcrichton', @pwd, @sid = 0xE0FE0808FCD13A43963092413250E31A, @encryptopt = 'skip_encryption_old'
 
-- Login: mcrossma
SET @pwd = CONVERT (varchar(256), 0x21312144332F2C465734544E5E4D5852)
if not exists (select name from master.dbo.sysxlogins where name='mcrossma')
EXEC master..sp_addlogin 'mcrossma', @pwd, @sid = 0x87CE7D639485584B9544BF41D356FC33, @encryptopt = 'skip_encryption_old'
 
-- Login: mdavis
SET @pwd = CONVERT (varchar(256), 0x2131214A2126574834365360504C4F42)
if not exists (select name from master.dbo.sysxlogins where name='mdavis')
EXEC master..sp_addlogin 'mdavis', @pwd, @sid = 0xCDE645AB25F63543A619243FA1115574, @encryptopt = 'skip_encryption_old'
 
-- Login: mday
SET @pwd = CONVERT (varchar(256), 0x21312144332E43485B522223304F4F5A)
if not exists (select name from master.dbo.sysxlogins where name='mday')
EXEC master..sp_addlogin 'mday', @pwd, @sid = 0xB02A917243E440488CC631CE1DF919F1, @encryptopt = 'skip_encryption_old'
 
-- Login: mdcruz
SET @pwd = CONVERT (varchar(256), 0x2131233032315E2D305055483E31472D)
if not exists (select name from master.dbo.sysxlogins where name='mdcruz')
EXEC master..sp_addlogin 'mdcruz', @pwd, @sid = 0x5E63A1E49DD0064796C34AF6B8E2A971, @encryptopt = 'skip_encryption_old'
 
-- Login: mdouglas
SET @pwd = CONVERT (varchar(256), 0x2131214A212A52432737273F3345454A)
if not exists (select name from master.dbo.sysxlogins where name='mdouglas')
EXEC master..sp_addlogin 'mdouglas', @pwd, @sid = 0x1DDD578FAFD07A44957F6F87ED6D4156, @encryptopt = 'skip_encryption_old'
 
-- Login: mdowell
SET @pwd = CONVERT (varchar(256), 0x2131235F2725552349575A365D5C493D)
if not exists (select name from master.dbo.sysxlogins where name='mdowell')
EXEC master..sp_addlogin 'mdowell', @pwd, @sid = 0xB4F5A5E2B34D4E468E1D410B5A17F21E, @encryptopt = 'skip_encryption_old'
 
-- Login: mdoyle
SET @pwd = CONVERT (varchar(256), 0x2131235F272539485C5A575022334E3F)
if not exists (select name from master.dbo.sysxlogins where name='mdoyle')
EXEC master..sp_addlogin 'mdoyle', @pwd, @sid = 0x8F4F925B6C28944E8F489D2192B50D76, @encryptopt = 'skip_encryption_old'
 
-- Login: mdoyle2
SET @pwd = CONVERT (varchar(256), 0x2131214A21285A334D31334A442A2A5F)
if not exists (select name from master.dbo.sysxlogins where name='mdoyle2')
EXEC master..sp_addlogin 'mdoyle2', @pwd, @sid = 0x272C3784FDAE1F469AA90B9036F37C2C, @encryptopt = 'skip_encryption_old'
 
-- Login: mdyson
SET @pwd = CONVERT (varchar(256), 0x2131214A212C2450565F4954595E2726)
if not exists (select name from master.dbo.sysxlogins where name='mdyson')
EXEC master..sp_addlogin 'mdyson', @pwd, @sid = 0xBB1BFB967AE435498BF283D01A94E0E9, @encryptopt = 'skip_encryption_old'
 
-- Login: meaton
SET @pwd = CONVERT (varchar(256), 0x213124593455304F442A365A2A2B2245)
if not exists (select name from master.dbo.sysxlogins where name='meaton')
EXEC master..sp_addlogin 'meaton', @pwd, @sid = 0x29FB6E987983FC4AA2A8390C6995035C, @encryptopt = 'skip_encryption_old'
 
-- Login: mekoch
SET @pwd = CONVERT (varchar(256), 0x2131233E255360373826603A37493B57)
if not exists (select name from master.dbo.sysxlogins where name='mekoch')
EXEC master..sp_addlogin 'mekoch', @pwd, @sid = 0x4AE3E8F011DED34F89BCAB6DD65D26A9, @encryptopt = 'skip_encryption_old'
 
-- Login: metminan
SET @pwd = CONVERT (varchar(256), 0x2131214A21253E4C472D2C3D392D2548)
if not exists (select name from master.dbo.sysxlogins where name='metminan')
EXEC master..sp_addlogin 'metminan', @pwd, @sid = 0x19FF2C9D1007EF468ECFC0283F7CDA1E, @encryptopt = 'skip_encryption_old'
 
-- Login: mfedoruk
if not exists (select name from master.dbo.sysxlogins where name='mfedoruk')
EXEC master..sp_addlogin 'mfedoruk', NULL, @sid = 0x8D3633B119BC2A459E2B33BA7C79C798, @encryptopt = 'skip_encryption_old'
 
-- Login: mflaherty2
SET @pwd = CONVERT (varchar(256), 0x213124372C2152434853325E3C2D2940)
if not exists (select name from master.dbo.sysxlogins where name='mflaherty2')
EXEC master..sp_addlogin 'mflaherty2', @pwd, @sid = 0xBB326FE3079F3C4BA1B58473774D8C90, @encryptopt = 'skip_encryption_old'
 
-- Login: mforster
SET @pwd = CONVERT (varchar(256), 0x2131214A21252F5E395A372C55335324)
if not exists (select name from master.dbo.sysxlogins where name='mforster')
EXEC master..sp_addlogin 'mforster', @pwd, @sid = 0x950AEE1A3D3F7E4A8D7C98F71EDE978E, @encryptopt = 'skip_encryption_old'
 
-- Login: mfourt
SET @pwd = CONVERT (varchar(256), 0x213122302D3256285542302251423839)
if not exists (select name from master.dbo.sysxlogins where name='mfourt')
EXEC master..sp_addlogin 'mfourt', @pwd, @sid = 0xA0FEAEACB9289445A460213B5F49B78B, @encryptopt = 'skip_encryption_old'
 
-- Login: mfraser
SET @pwd = CONVERT (varchar(256), 0x213123542F3C322C3743534436243733)
if not exists (select name from master.dbo.sysxlogins where name='mfraser')
EXEC master..sp_addlogin 'mfraser', @pwd, @sid = 0x70263FBD5DF3A4478C705F685DB79566, @encryptopt = 'skip_encryption_old'
 
-- Login: mfung
if not exists (select name from master.dbo.sysxlogins where name='mfung')
EXEC master..sp_addlogin 'mfung', NULL, @sid = 0x4FC62496696CD24BB9E63F150352A4E5, @encryptopt = 'skip_encryption_old'
 
-- Login: mgaucher
SET @pwd = CONVERT (varchar(256), 0x2131213E323050494C51335A5D214C39)
if not exists (select name from master.dbo.sysxlogins where name='mgaucher')
EXEC master..sp_addlogin 'mgaucher', @pwd, @sid = 0x12616A15B956BE4DBED50E374173535A, @encryptopt = 'skip_encryption_old'
 
-- Login: mgomez
SET @pwd = CONVERT (varchar(256), 0x2131214A21244B39285A444A57414142)
if not exists (select name from master.dbo.sysxlogins where name='mgomez')
EXEC master..sp_addlogin 'mgomez', @pwd, @sid = 0xA739D1AC930A0547A194B22E78665D1C, @encryptopt = 'skip_encryption_old'
 
-- Login: mgoodric
SET @pwd = CONVERT (varchar(256), 0x2131214A212638455034593E345C2F31)
if not exists (select name from master.dbo.sysxlogins where name='mgoodric')
EXEC master..sp_addlogin 'mgoodric', @pwd, @sid = 0xB2129028A9358A479F8E14C71924851C, @encryptopt = 'skip_encryption_old'
 
-- Login: mgordon2
SET @pwd = CONVERT (varchar(256), 0x2131214A212721505C264C574A444B32)
if not exists (select name from master.dbo.sysxlogins where name='mgordon2')
EXEC master..sp_addlogin 'mgordon2', @pwd, @sid = 0x327412CB98A0F14E942E6E16DEB73F72, @encryptopt = 'skip_encryption_old'
 
-- Login: mhalsey
SET @pwd = CONVERT (varchar(256), 0x2131215C2D4C5D4C3426384B3A43334D)
if not exists (select name from master.dbo.sysxlogins where name='mhalsey')
EXEC master..sp_addlogin 'mhalsey', @pwd, @sid = 0x19280C628670BB459BD8F4EFE032A931, @encryptopt = 'skip_encryption_old'
 
-- Login: mhayre
SET @pwd = CONVERT (varchar(256), 0x213123403745323C553E54232E465E39)
if not exists (select name from master.dbo.sysxlogins where name='mhayre')
EXEC master..sp_addlogin 'mhayre', @pwd, @sid = 0x36721E79BC002646BE6C9690E8A84D8B, @encryptopt = 'skip_encryption_old'
 
-- Login: mhenders
SET @pwd = CONVERT (varchar(256), 0x2131214A21243622592C573D383D413F)
if not exists (select name from master.dbo.sysxlogins where name='mhenders')
EXEC master..sp_addlogin 'mhenders', @pwd, @sid = 0xC6C5F48C67890E4097ACF532CDB415B6, @encryptopt = 'skip_encryption_old'
 
-- Login: mhenter
SET @pwd = CONVERT (varchar(256), 0x2131214A212A52472F3F385D27344337)
if not exists (select name from master.dbo.sysxlogins where name='mhenter')
EXEC master..sp_addlogin 'mhenter', @pwd, @sid = 0xFBEBCB6C935A234D928229BCF47F3878, @encryptopt = 'skip_encryption_old'
 
-- Login: mhiatt
SET @pwd = CONVERT (varchar(256), 0x2131233F2F4A5F4060305F465A5E272F)
if not exists (select name from master.dbo.sysxlogins where name='mhiatt')
EXEC master..sp_addlogin 'mhiatt', @pwd, @sid = 0xA4EAB2640E403A438735BE93CDDD95A8, @encryptopt = 'skip_encryption_old'
 
-- Login: mhorgan
SET @pwd = CONVERT (varchar(256), 0x21312144332639333A36573A363E2A33)
if not exists (select name from master.dbo.sysxlogins where name='mhorgan')
EXEC master..sp_addlogin 'mhorgan', @pwd, @sid = 0xED651AB09E91B8489F8E1376D1EABC02, @encryptopt = 'skip_encryption_old'
 
-- Login: mjones
SET @pwd = CONVERT (varchar(256), 0x2131214A212E45244E46525E57234D3F)
if not exists (select name from master.dbo.sysxlogins where name='mjones')
EXEC master..sp_addlogin 'mjones', @pwd, @sid = 0x011A453F63792E46BE1B3F8F6678FA80, @encryptopt = 'skip_encryption_old'
 
-- Login: mkambo
SET @pwd = CONVERT (varchar(256), 0x2131214A212F46535F28253B5B583029)
if not exists (select name from master.dbo.sysxlogins where name='mkambo')
EXEC master..sp_addlogin 'mkambo', @pwd, @sid = 0xD6265B8366553A48BEC772A7226DA0BC, @encryptopt = 'skip_encryption_old'
 
-- Login: mkeepence
SET @pwd = CONVERT (varchar(256), 0x2131244A2A47435D533F5A5D5D305C30)
if not exists (select name from master.dbo.sysxlogins where name='mkeepence')
EXEC master..sp_addlogin 'mkeepence', @pwd, @sid = 0xF592BEC47941784E8F45605BB1A87464, @encryptopt = 'skip_encryption_old'
 
-- Login: mkeyes
SET @pwd = CONVERT (varchar(256), 0x2131234A352B4A262E362256302F5345)
if not exists (select name from master.dbo.sysxlogins where name='mkeyes')
EXEC master..sp_addlogin 'mkeyes', @pwd, @sid = 0x45D4CB85A44D054A8FBE2CE7BF38C4A6, @encryptopt = 'skip_encryption_old'
 
-- Login: mkmurphy
SET @pwd = CONVERT (varchar(256), 0x2131214A21305D57482223385C50262E)
if not exists (select name from master.dbo.sysxlogins where name='mkmurphy')
EXEC master..sp_addlogin 'mkmurphy', @pwd, @sid = 0xEF7980AB128CB54D8B1851BA74EB5652, @encryptopt = 'skip_encryption_old'
 
-- Login: mlapthor
SET @pwd = CONVERT (varchar(256), 0x2131234E3E254633253F38273B23395C)
if not exists (select name from master.dbo.sysxlogins where name='mlapthor')
EXEC master..sp_addlogin 'mlapthor', @pwd, @sid = 0x56835CF0FC519040A2744A6553CF4B58, @encryptopt = 'skip_encryption_old'
 
-- Login: mlaw2
SET @pwd = CONVERT (varchar(256), 0x2131214A21215B5D5B55232125383455)
if not exists (select name from master.dbo.sysxlogins where name='mlaw2')
EXEC master..sp_addlogin 'mlaw2', @pwd, @sid = 0xE186E57834941443990AF94052DAA1AA, @encryptopt = 'skip_encryption_old'
 
-- Login: mleckie
SET @pwd = CONVERT (varchar(256), 0x2131234E342C5045423C3D4A5A2E4D4D)
if not exists (select name from master.dbo.sysxlogins where name='mleckie')
EXEC master..sp_addlogin 'mleckie', @pwd, @sid = 0xB37AB1C67AC1DD4AA15EE1772ABECF7C, @encryptopt = 'skip_encryption_old'
 
-- Login: mlibbrec
SET @pwd = CONVERT (varchar(256), 0x2131214A21293B4E5C574B3351383D55)
if not exists (select name from master.dbo.sysxlogins where name='mlibbrec')
EXEC master..sp_addlogin 'mlibbrec', @pwd, @sid = 0x1135D80764CDD24BBF6518604CADF460, @encryptopt = 'skip_encryption_old'
 
-- Login: mlinegar
SET @pwd = CONVERT (varchar(256), 0x2131214A212E33493C54505D243A3447)
if not exists (select name from master.dbo.sysxlogins where name='mlinegar')
EXEC master..sp_addlogin 'mlinegar', @pwd, @sid = 0xA597FD7707BED44599351C2FED81FF94, @encryptopt = 'skip_encryption_old'
 
-- Login: mliu
SET @pwd = CONVERT (varchar(256), 0x2131214A212342605745432E31432521)
if not exists (select name from master.dbo.sysxlogins where name='mliu')
EXEC master..sp_addlogin 'mliu', @pwd, @sid = 0xF58B4A8086CECF4E903753E6C41548F4, @encryptopt = 'skip_encryption_old'
 
-- Login: mlogie
SET @pwd = CONVERT (varchar(256), 0x2131242934322B215F4D3146502D3F5D)
if not exists (select name from master.dbo.sysxlogins where name='mlogie')
EXEC master..sp_addlogin 'mlogie', @pwd, @sid = 0x90F8FE8CC493B6418785390EFD05D0B1, @encryptopt = 'skip_encryption_old'
 
-- Login: mmacneil
SET @pwd = CONVERT (varchar(256), 0x2131214A21235C3C4A3E453C304A4C2B)
if not exists (select name from master.dbo.sysxlogins where name='mmacneil')
EXEC master..sp_addlogin 'mmacneil', @pwd, @sid = 0x157C6DEDD7840E4C8B7AB6149AB713C8, @encryptopt = 'skip_encryption_old'
 
-- Login: mmaher
SET @pwd = CONVERT (varchar(256), 0x2131214A2122293B262560352E395754)
if not exists (select name from master.dbo.sysxlogins where name='mmaher')
EXEC master..sp_addlogin 'mmaher', @pwd, @sid = 0x841FAF5E78E2894D8686D46DBA019B5E, @encryptopt = 'skip_encryption_old'
 
-- Login: mmanji
SET @pwd = CONVERT (varchar(256), 0x2131214A213035213C2B60245E2E343B)
if not exists (select name from master.dbo.sysxlogins where name='mmanji')
EXEC master..sp_addlogin 'mmanji', @pwd, @sid = 0xF82C33DEFBD6EB409C4A4ABA499DDDB0, @encryptopt = 'skip_encryption_old'
 
-- Login: mmcbride
if not exists (select name from master.dbo.sysxlogins where name='mmcbride')
EXEC master..sp_addlogin 'mmcbride', NULL, @sid = 0xF28DC0593CB02A4688B41C30B8B5443D, @encryptopt = 'skip_encryption_old'
 
-- Login: mmckay
SET @pwd = CONVERT (varchar(256), 0x213124472E595E585E33324343273252)
if not exists (select name from master.dbo.sysxlogins where name='mmckay')
EXEC master..sp_addlogin 'mmckay', @pwd, @sid = 0x4A44D4FFA8912E4A962F7E4D7E844BE5, @encryptopt = 'skip_encryption_old'
 
-- Login: mmclella
SET @pwd = CONVERT (varchar(256), 0x2131214E3146394C4E3C41283F602552)
if not exists (select name from master.dbo.sysxlogins where name='mmclella')
EXEC master..sp_addlogin 'mmclella', @pwd, @sid = 0x5063AFBD9E9ED749B0219DAE7139B91A, @encryptopt = 'skip_encryption_old'
 
-- Login: mmcvittie
SET @pwd = CONVERT (varchar(256), 0x2131214A212B4B4734345251363B3242)
if not exists (select name from master.dbo.sysxlogins where name='mmcvittie')
EXEC master..sp_addlogin 'mmcvittie', @pwd, @sid = 0x6745C1B00FF25141AAF2CA3E6CB73C3B, @encryptopt = 'skip_encryption_old'
 
-- Login: mmildenber
SET @pwd = CONVERT (varchar(256), 0x2131243A3D5D322A55434C5558484D51)
if not exists (select name from master.dbo.sysxlogins where name='mmildenber')
EXEC master..sp_addlogin 'mmildenber', @pwd, @sid = 0x50D09D0F0D09644889B3B6BB470BFD92, @encryptopt = 'skip_encryption_old'
 
-- Login: mmillette2
SET @pwd = CONVERT (varchar(256), 0x2131214A212F27403E2F234F4F5B5354)
if not exists (select name from master.dbo.sysxlogins where name='mmillette2')
EXEC master..sp_addlogin 'mmillette2', @pwd, @sid = 0xF84610DAE05D9D4DB39E7B60E84208DC, @encryptopt = 'skip_encryption_old'
 
-- Login: mmisaghi
SET @pwd = CONVERT (varchar(256), 0x2131214A21293822362A225040305E50)
if not exists (select name from master.dbo.sysxlogins where name='mmisaghi')
EXEC master..sp_addlogin 'mmisaghi', @pwd, @sid = 0x23E8BF3C7764704CBE43D2921F8365AA, @encryptopt = 'skip_encryption_old'
 
-- Login: mmisera
SET @pwd = CONVERT (varchar(256), 0x21312144332B4F2651232F573D253D2F)
if not exists (select name from master.dbo.sysxlogins where name='mmisera')
EXEC master..sp_addlogin 'mmisera', @pwd, @sid = 0x55392473B7412F40B0664920AE3A0732, @encryptopt = 'skip_encryption_old'
 
-- Login: mmurphy
SET @pwd = CONVERT (varchar(256), 0x213121542245604B5E5E504540415D46)
if not exists (select name from master.dbo.sysxlogins where name='mmurphy')
EXEC master..sp_addlogin 'mmurphy', @pwd, @sid = 0x51FDE1550EEB394290549E4140FC8C39, @encryptopt = 'skip_encryption_old'
 
-- Login: mnaidu
if not exists (select name from master.dbo.sysxlogins where name='mnaidu')
EXEC master..sp_addlogin 'mnaidu', NULL, @sid = 0xCDB52D28A7F6E3478A2FD63201D81690, @encryptopt = 'skip_encryption_old'
 
-- Login: mneudorf
SET @pwd = CONVERT (varchar(256), 0x2131214A212229595E5D2E3421273F43)
if not exists (select name from master.dbo.sysxlogins where name='mneudorf')
EXEC master..sp_addlogin 'mneudorf', @pwd, @sid = 0x7B7175FB1A8368409849441BD20A70A9, @encryptopt = 'skip_encryption_old'
 
-- Login: mneufeld
SET @pwd = CONVERT (varchar(256), 0x213124583333462F3C2E505F4B35473E)
if not exists (select name from master.dbo.sysxlogins where name='mneufeld')
EXEC master..sp_addlogin 'mneufeld', @pwd, @sid = 0x8FDACD30EF1C0C4988C68D9CEDA1D5D7, @encryptopt = 'skip_encryption_old'
 
-- Login: mnimeck
SET @pwd = CONVERT (varchar(256), 0x2131244221334846285D2C574E3A3A4F)
if not exists (select name from master.dbo.sysxlogins where name='mnimeck')
EXEC master..sp_addlogin 'mnimeck', @pwd, @sid = 0xC89EB1EDFE74FF4B829B99C5A59D6DED, @encryptopt = 'skip_encryption_old'
 
-- Login: mobrien
SET @pwd = CONVERT (varchar(256), 0x2131214A2129274E4622482536333A3D)
if not exists (select name from master.dbo.sysxlogins where name='mobrien')
EXEC master..sp_addlogin 'mobrien', @pwd, @sid = 0xDB7E094A6F5B1C40B7BF070F9D9E2AF8, @encryptopt = 'skip_encryption_old'
 
-- Login: mortensm
SET @pwd = CONVERT (varchar(256), 0x21312124252731233F3F554134555F22)
if not exists (select name from master.dbo.sysxlogins where name='mortensm')
EXEC master..sp_addlogin 'mortensm', @pwd, @sid = 0xFAB0DBC83A7A4545B4B007A8E0A8F84B, @encryptopt = 'skip_encryption_old'
 
-- Login: mosherh
SET @pwd = CONVERT (varchar(256), 0x2131214A21214C3642395A4E565A2D5C)
if not exists (select name from master.dbo.sysxlogins where name='mosherh')
EXEC master..sp_addlogin 'mosherh', @pwd, @sid = 0x7D1D58AA12A47848B43A630F37DE126C, @encryptopt = 'skip_encryption_old'
 
-- Login: mparadis
SET @pwd = CONVERT (varchar(256), 0x213121403D233922313E29312E4D5937)
if not exists (select name from master.dbo.sysxlogins where name='mparadis')
EXEC master..sp_addlogin 'mparadis', @pwd, @sid = 0x8711B5B036935545B20581A1F772114B, @encryptopt = 'skip_encryption_old'
 
-- Login: mparker
SET @pwd = CONVERT (varchar(256), 0x2131225E3E4E354D56472D412A503D22)
if not exists (select name from master.dbo.sysxlogins where name='mparker')
EXEC master..sp_addlogin 'mparker', @pwd, @sid = 0x1025C0F9C5C8104CBED8D1C23E9C17D8, @encryptopt = 'skip_encryption_old'
 
-- Login: mpeppers
SET @pwd = CONVERT (varchar(256), 0x2131214A213044312A344548373F5559)
if not exists (select name from master.dbo.sysxlogins where name='mpeppers')
EXEC master..sp_addlogin 'mpeppers', @pwd, @sid = 0x04DB3F712653D646A0E49C61B0548827, @encryptopt = 'skip_encryption_old'
 
-- Login: mprice
SET @pwd = CONVERT (varchar(256), 0x2131214A212B315936222A463F482C54)
if not exists (select name from master.dbo.sysxlogins where name='mprice')
EXEC master..sp_addlogin 'mprice', @pwd, @sid = 0x955D10DA3B5701448E68340390F9908E, @encryptopt = 'skip_encryption_old'
 
-- Login: mreader
SET @pwd = CONVERT (varchar(256), 0x21312435342F27392E33312321224857)
if not exists (select name from master.dbo.sysxlogins where name='mreader')
EXEC master..sp_addlogin 'mreader', @pwd, @sid = 0x6BC50315CC8D32498B4CEE299D44DAA0, @encryptopt = 'skip_encryption_old'
 
-- Login: mroome
SET @pwd = CONVERT (varchar(256), 0x2131214A212A3759595F5B22482D384C)
if not exists (select name from master.dbo.sysxlogins where name='mroome')
EXEC master..sp_addlogin 'mroome', @pwd, @sid = 0x04E3A4F03DFE8B48BC156DDC0F764A2A, @encryptopt = 'skip_encryption_old'
 
-- Login: mryan
SET @pwd = CONVERT (varchar(256), 0x2131214A212A5753484D55213F513F2C)
if not exists (select name from master.dbo.sysxlogins where name='mryan')
EXEC master..sp_addlogin 'mryan', @pwd, @sid = 0xA4DC6BE998F2C44994FEE95DAF4ADA6C, @encryptopt = 'skip_encryption_old'
 
-- Login: msanantoni
SET @pwd = CONVERT (varchar(256), 0x2131214A21283F4A47565855235F605A)
if not exists (select name from master.dbo.sysxlogins where name='msanantoni')
EXEC master..sp_addlogin 'msanantoni', @pwd, @sid = 0x5F53E0B36A0D944A8C5EDD64D30A2C66, @encryptopt = 'skip_encryption_old'
 
-- Login: msouthas
SET @pwd = CONVERT (varchar(256), 0x21312345385C5941214C54462E293B4C)
if not exists (select name from master.dbo.sysxlogins where name='msouthas')
EXEC master..sp_addlogin 'msouthas', @pwd, @sid = 0x98C6D0E0E2316041A3E4860B134EF0E5, @encryptopt = 'skip_encryption_old'
 
-- Login: mstaryk
SET @pwd = CONVERT (varchar(256), 0x21312144332C36522950554128295B4B)
if not exists (select name from master.dbo.sysxlogins where name='mstaryk')
EXEC master..sp_addlogin 'mstaryk', @pwd, @sid = 0x45635E3A542E2A45965B174D2F298719, @encryptopt = 'skip_encryption_old'
 
-- Login: mstevens
SET @pwd = CONVERT (varchar(256), 0x2131214A21213F2F29553E24355F3630)
if not exists (select name from master.dbo.sysxlogins where name='mstevens')
EXEC master..sp_addlogin 'mstevens', @pwd, @sid = 0x912D7E28C878A84E9D119BBA3DFA06E5, @encryptopt = 'skip_encryption_old'
 
-- Login: mstewart
SET @pwd = CONVERT (varchar(256), 0x2131214A212E2E4E255F3423512B3C2F)
if not exists (select name from master.dbo.sysxlogins where name='mstewart')
EXEC master..sp_addlogin 'mstewart', @pwd, @sid = 0xBF8849468D43A84681E13FF667987E1B, @encryptopt = 'skip_encryption_old'
 
-- Login: msteyer
SET @pwd = CONVERT (varchar(256), 0x2131214A212C2530225545224D41333A)
if not exists (select name from master.dbo.sysxlogins where name='msteyer')
EXEC master..sp_addlogin 'msteyer', @pwd, @sid = 0x6431C512495B2A4A89712238D62386B6, @encryptopt = 'skip_encryption_old'
 
-- Login: mthompso
SET @pwd = CONVERT (varchar(256), 0x2131222A264F57365744592C514A3257)
if not exists (select name from master.dbo.sysxlogins where name='mthompso')
EXEC master..sp_addlogin 'mthompso', @pwd, @sid = 0x82C2B9BC5D33EF4EA8A33170E76BC219, @encryptopt = 'skip_encryption_old'
 
-- Login: mtracy
SET @pwd = CONVERT (varchar(256), 0x2131214A21223F34485E41283A586035)
if not exists (select name from master.dbo.sysxlogins where name='mtracy')
EXEC master..sp_addlogin 'mtracy', @pwd, @sid = 0x83C8972160F19046AB53EFB1E58A2982, @encryptopt = 'skip_encryption_old'
 
-- Login: mvirk
SET @pwd = CONVERT (varchar(256), 0x2131214A21302B2A4B443C5B59535828)
if not exists (select name from master.dbo.sysxlogins where name='mvirk')
EXEC master..sp_addlogin 'mvirk', @pwd, @sid = 0x590A1BC69EFE394D9FAB5490A52A5599, @encryptopt = 'skip_encryption_old'
 
-- Login: mwalczak
SET @pwd = CONVERT (varchar(256), 0x2131233124482F594E24422E3941404C)
if not exists (select name from master.dbo.sysxlogins where name='mwalczak')
EXEC master..sp_addlogin 'mwalczak', @pwd, @sid = 0x20C47FFEFB44544189BED50B4FD3CEFC, @encryptopt = 'skip_encryption_old'
 
-- Login: mwehinge
SET @pwd = CONVERT (varchar(256), 0x2131235F272B504B3E2F2E2635503E28)
if not exists (select name from master.dbo.sysxlogins where name='mwehinge')
EXEC master..sp_addlogin 'mwehinge', @pwd, @sid = 0x503B4E11CB83344CB9C201D32833EF99, @encryptopt = 'skip_encryption_old'
 
-- Login: mwierzej
SET @pwd = CONVERT (varchar(256), 0x2131214A212534212C4E3C2356492B54)
if not exists (select name from master.dbo.sysxlogins where name='mwierzej')
EXEC master..sp_addlogin 'mwierzej', @pwd, @sid = 0xCCEE654C1A8FA745AB6028BEC82F4B9C, @encryptopt = 'skip_encryption_old'
 
-- Login: mwoods
SET @pwd = CONVERT (varchar(256), 0x2131243F36303547502C213937454854)
if not exists (select name from master.dbo.sysxlogins where name='mwoods')
EXEC master..sp_addlogin 'mwoods', @pwd, @sid = 0x9DB4F2AE5250F74EBE190BC196003A69, @encryptopt = 'skip_encryption_old'
 
-- Login: mymoore
SET @pwd = CONVERT (varchar(256), 0x2131214A21294A373F4E45235F253036)
if not exists (select name from master.dbo.sysxlogins where name='mymoore')
EXEC master..sp_addlogin 'mymoore', @pwd, @sid = 0x5ED5BADC3F9F2B4DA9D96AA54DA1C384, @encryptopt = 'skip_encryption_old'
 
-- Login: mzentner
SET @pwd = CONVERT (varchar(256), 0x2131214A2128234345362F26485D4F2C)
if not exists (select name from master.dbo.sysxlogins where name='mzentner')
EXEC master..sp_addlogin 'mzentner', @pwd, @sid = 0xA454ABAFA469BE4D9E2F31E74048B4A2, @encryptopt = 'skip_encryption_old'
 
-- Login: mzimmerm
SET @pwd = CONVERT (varchar(256), 0x213121443321432F3244335A46355350)
if not exists (select name from master.dbo.sysxlogins where name='mzimmerm')
EXEC master..sp_addlogin 'mzimmerm', @pwd, @sid = 0x7BB309A3E464C54AA1935E9E20DF2224, @encryptopt = 'skip_encryption_old'
 
-- Login: nbadry
SET @pwd = CONVERT (varchar(256), 0x2131214A212E2F4F56592E272E5B2A43)
if not exists (select name from master.dbo.sysxlogins where name='nbadry')
EXEC master..sp_addlogin 'nbadry', @pwd, @sid = 0x9610E8C3DEC6774680AFBD795AA2382C, @encryptopt = 'skip_encryption_old'
 
-- Login: ncoady
SET @pwd = CONVERT (varchar(256), 0x2131214433222C284524452D5122542F)
if not exists (select name from master.dbo.sysxlogins where name='ncoady')
EXEC master..sp_addlogin 'ncoady', @pwd, @sid = 0xFE4FBD50F3DF1F4EB4882940344F776E, @encryptopt = 'skip_encryption_old'
 
-- Login: ndieno
SET @pwd = CONVERT (varchar(256), 0x2131214A212954555454504950353F23)
if not exists (select name from master.dbo.sysxlogins where name='ndieno')
EXEC master..sp_addlogin 'ndieno', @pwd, @sid = 0x3C462F74C1949E47B8961E4CADD6E7F2, @encryptopt = 'skip_encryption_old'
 
-- Login: ndorion
SET @pwd = CONVERT (varchar(256), 0x21312442334557235C433E4953552840)
if not exists (select name from master.dbo.sysxlogins where name='ndorion')
EXEC master..sp_addlogin 'ndorion', @pwd, @sid = 0x68697DE0D5CD2E4C92DE2B72113847B2, @encryptopt = 'skip_encryption_old'
 
-- Login: nebaird
SET @pwd = CONVERT (varchar(256), 0x2131214A21304E3951223649544A6051)
if not exists (select name from master.dbo.sysxlogins where name='nebaird')
EXEC master..sp_addlogin 'nebaird', @pwd, @sid = 0xE7EEAB5EA9A8A04E974ADA5EB4728746, @encryptopt = 'skip_encryption_old'
 
-- Login: nesgaards
SET @pwd = CONVERT (varchar(256), 0x2131214A21245E5E4147374D3B2A2550)
if not exists (select name from master.dbo.sysxlogins where name='nesgaards')
EXEC master..sp_addlogin 'nesgaards', @pwd, @sid = 0xC0DFED8B6D528940B53A3EAC8106FF80, @encryptopt = 'skip_encryption_old'
 
-- Login: ngeorge
SET @pwd = CONVERT (varchar(256), 0x2131214A212F60332E4A40472445575B)
if not exists (select name from master.dbo.sysxlogins where name='ngeorge')
EXEC master..sp_addlogin 'ngeorge', @pwd, @sid = 0x7E20F31C168315498DA5DD453BC72B3B, @encryptopt = 'skip_encryption_old'
 
-- Login: ngill
SET @pwd = CONVERT (varchar(256), 0x2131214A212B253E435C34535551354E)
if not exists (select name from master.dbo.sysxlogins where name='ngill')
EXEC master..sp_addlogin 'ngill', @pwd, @sid = 0x02B0C2372FEDB340B72A5C52B26C0B74, @encryptopt = 'skip_encryption_old'
 
-- Login: nguineva
SET @pwd = CONVERT (varchar(256), 0x2131214A212A31513D2A404A405E2241)
if not exists (select name from master.dbo.sysxlogins where name='nguineva')
EXEC master..sp_addlogin 'nguineva', @pwd, @sid = 0x7078EFBE1F03274583520E2F2210CC66, @encryptopt = 'skip_encryption_old'
 
-- Login: nhartt
SET @pwd = CONVERT (varchar(256), 0x2131214A21255235374F334C2A414455)
if not exists (select name from master.dbo.sysxlogins where name='nhartt')
EXEC master..sp_addlogin 'nhartt', @pwd, @sid = 0x7B66C00522E31A4BB7FFDA91EA8857AC, @encryptopt = 'skip_encryption_old'
 
-- Login: nhowarth
SET @pwd = CONVERT (varchar(256), 0x21312144332F5921394C56553A264736)
if not exists (select name from master.dbo.sysxlogins where name='nhowarth')
EXEC master..sp_addlogin 'nhowarth', @pwd, @sid = 0x228A012677DBA643819D61555B1D2500, @encryptopt = 'skip_encryption_old'
 
-- Login: nhussein
SET @pwd = CONVERT (varchar(256), 0x2131214A212D4C2A3157294644522D33)
if not exists (select name from master.dbo.sysxlogins where name='nhussein')
EXEC master..sp_addlogin 'nhussein', @pwd, @sid = 0xBC094B7CEEF6994F81EB7FD49B3F0294, @encryptopt = 'skip_encryption_old'
 
-- Login: njodoin
if not exists (select name from master.dbo.sysxlogins where name='njodoin')
EXEC master..sp_addlogin 'njodoin', NULL, @sid = 0x6C611F4C26C53C4680DF3D70C56AE0DC, @encryptopt = 'skip_encryption_old'
 
-- Login: nkapos
SET @pwd = CONVERT (varchar(256), 0x213123292235514741252E282D2B2646)
if not exists (select name from master.dbo.sysxlogins where name='nkapos')
EXEC master..sp_addlogin 'nkapos', @pwd, @sid = 0x9E745A717818DF47B7C6FAA8873D4C66, @encryptopt = 'skip_encryption_old'
 
-- Login: nkimmel
SET @pwd = CONVERT (varchar(256), 0x2131244C21383A3555302336483B6045)
if not exists (select name from master.dbo.sysxlogins where name='nkimmel')
EXEC master..sp_addlogin 'nkimmel', @pwd, @sid = 0xF984EB3F3823474882DB236327A0AB5F, @encryptopt = 'skip_encryption_old'
 
-- Login: nmurota
SET @pwd = CONVERT (varchar(256), 0x21312221233F3C523841235D41305A31)
if not exists (select name from master.dbo.sysxlogins where name='nmurota')
EXEC master..sp_addlogin 'nmurota', @pwd, @sid = 0xAEAAC6771986124C8EC28C4234522972, @encryptopt = 'skip_encryption_old'
 
-- Login: nmurphy
SET @pwd = CONVERT (varchar(256), 0x2131235F272225234D26264C293F4257)
if not exists (select name from master.dbo.sysxlogins where name='nmurphy')
EXEC master..sp_addlogin 'nmurphy', @pwd, @sid = 0xC5CFA95C7F586E4D9C70462C6A0FE30F, @encryptopt = 'skip_encryption_old'
 
-- Login: npaxton
SET @pwd = CONVERT (varchar(256), 0x2131214A212C555C452B355852373727)
if not exists (select name from master.dbo.sysxlogins where name='npaxton')
EXEC master..sp_addlogin 'npaxton', @pwd, @sid = 0x1038C03F2C146D40BF6D2C726167A85C, @encryptopt = 'skip_encryption_old'
 
-- Login: npeterso
SET @pwd = CONVERT (varchar(256), 0x2131223A29295B4E3F4D463859254356)
if not exists (select name from master.dbo.sysxlogins where name='npeterso')
EXEC master..sp_addlogin 'npeterso', @pwd, @sid = 0x160B39D0C3E1C047AB3ADFB07AFC3691, @encryptopt = 'skip_encryption_old'
 
-- Login: nphillips
if not exists (select name from master.dbo.sysxlogins where name='nphillips')
EXEC master..sp_addlogin 'nphillips', NULL, @sid = 0x2E30336C5D95A947A0FA7FE6F77D52A3, @encryptopt = 'skip_encryption_old'
 
-- Login: nrichard
SET @pwd = CONVERT (varchar(256), 0x2131214A21282A2A2F2A375F2F3F3544)
if not exists (select name from master.dbo.sysxlogins where name='nrichard')
EXEC master..sp_addlogin 'nrichard', @pwd, @sid = 0xE022E81BD75655428B5FB9857D9CFCD2, @encryptopt = 'skip_encryption_old'
 
-- Login: nsaunder
SET @pwd = CONVERT (varchar(256), 0x2131242C283E4A3F2E495C5A322F4957)
if not exists (select name from master.dbo.sysxlogins where name='nsaunder')
EXEC master..sp_addlogin 'nsaunder', @pwd, @sid = 0x8ABFEB7A1C3389428BD299CB086209FD, @encryptopt = 'skip_encryption_old'
 
-- Login: nscott
SET @pwd = CONVERT (varchar(256), 0x2131214A21222129455A3254324E3D2E)
if not exists (select name from master.dbo.sysxlogins where name='nscott')
EXEC master..sp_addlogin 'nscott', @pwd, @sid = 0x3F97B4C08EFD5044B05911869D7C92A0, @encryptopt = 'skip_encryption_old'
 
-- Login: nsimmons
SET @pwd = CONVERT (varchar(256), 0x2131235A3F5C4E2C384F25373D4D2A2E)
if not exists (select name from master.dbo.sysxlogins where name='nsimmons')
EXEC master..sp_addlogin 'nsimmons', @pwd, @sid = 0x3560B391653D034CAB347E578D9D1E5F, @encryptopt = 'skip_encryption_old'
 
-- Login: nsomani
SET @pwd = CONVERT (varchar(256), 0x2131234F3D45342D3D31524D455C475B)
if not exists (select name from master.dbo.sysxlogins where name='nsomani')
EXEC master..sp_addlogin 'nsomani', @pwd, @sid = 0x10ADB538429D19498ED9DD6383B210BE, @encryptopt = 'skip_encryption_old'
 
-- Login: nvongxay
SET @pwd = CONVERT (varchar(256), 0x2131214A212C3A372C2A305F4B49355D)
if not exists (select name from master.dbo.sysxlogins where name='nvongxay')
EXEC master..sp_addlogin 'nvongxay', @pwd, @sid = 0xE0DC2CE5A9B9A74694A6A85653B63E77, @encryptopt = 'skip_encryption_old'
 
-- Login: nwesley
SET @pwd = CONVERT (varchar(256), 0x2131233121535B48424B522A395F6045)
if not exists (select name from master.dbo.sysxlogins where name='nwesley')
EXEC master..sp_addlogin 'nwesley', @pwd, @sid = 0x86E71EE4DD1C0A48907DE114F4AB4A22, @encryptopt = 'skip_encryption_old'
 
-- Login: obarnett
SET @pwd = CONVERT (varchar(256), 0x2131214A21262C2C55442E2E343C3D5A)
if not exists (select name from master.dbo.sysxlogins where name='obarnett')
EXEC master..sp_addlogin 'obarnett', @pwd, @sid = 0xD908D7838F48104AA60FC559A7A167AF, @encryptopt = 'skip_encryption_old'
 
-- Login: operator
SET @pwd = CONVERT (varchar(256), 0x21312134294D2A29555C295B4D293D53)
if not exists (select name from master.dbo.sysxlogins where name='operator')
EXEC master..sp_addlogin 'operator', @pwd, @sid = 0x3A15C0AACCFCE247A2B604D8A1E85B01, @encryptopt = 'skip_encryption_old'
 
-- Login: paraujo
SET @pwd = CONVERT (varchar(256), 0x2131214A212334594345472E352D3827)
if not exists (select name from master.dbo.sysxlogins where name='paraujo')
EXEC master..sp_addlogin 'paraujo', @pwd, @sid = 0x875B21F37D8DE147AD2FFE9CF79FD75D, @encryptopt = 'skip_encryption_old'
 
-- Login: pbarnett
SET @pwd = CONVERT (varchar(256), 0x21312251394B5D4B4E5B2D4F51333F30)
if not exists (select name from master.dbo.sysxlogins where name='pbarnett')
EXEC master..sp_addlogin 'pbarnett', @pwd, @sid = 0x777E658EEE7EF742AD9E5CFFDC16CDE7, @encryptopt = 'skip_encryption_old'
 
-- Login: pbatters
SET @pwd = CONVERT (varchar(256), 0x2131214A212E4754335D4E4B4F543648)
if not exists (select name from master.dbo.sysxlogins where name='pbatters')
EXEC master..sp_addlogin 'pbatters', @pwd, @sid = 0x4A539776DA2DEA43810CEE00708739CE, @encryptopt = 'skip_encryption_old'
 
-- Login: pbenjami
SET @pwd = CONVERT (varchar(256), 0x2131214A212A4D5023522F424E3F2F42)
if not exists (select name from master.dbo.sysxlogins where name='pbenjami')
EXEC master..sp_addlogin 'pbenjami', @pwd, @sid = 0x3B806CCEEB7F6F4A8E6C182BA238FE41, @encryptopt = 'skip_encryption_old'
 
-- Login: pbevan
SET @pwd = CONVERT (varchar(256), 0x21312144332726472C5B2A2223533B5F)
if not exists (select name from master.dbo.sysxlogins where name='pbevan')
EXEC master..sp_addlogin 'pbevan', @pwd, @sid = 0x12E6A52F5FFE364DACB628BA2F3ECC9B, @encryptopt = 'skip_encryption_old'
 
-- Login: pblood
SET @pwd = CONVERT (varchar(256), 0x2131214433284B4E582D2E4B485C4B33)
if not exists (select name from master.dbo.sysxlogins where name='pblood')
EXEC master..sp_addlogin 'pblood', @pwd, @sid = 0x0BA27276650E2648946CE2B964B8DABA, @encryptopt = 'skip_encryption_old'
 
-- Login: pcavanau
SET @pwd = CONVERT (varchar(256), 0x2131214A2130213647315D2736393926)
if not exists (select name from master.dbo.sysxlogins where name='pcavanau')
EXEC master..sp_addlogin 'pcavanau', @pwd, @sid = 0xEA6E2FB39CF8FD46A18037742EFB6BC3, @encryptopt = 'skip_encryption_old'
 
-- Login: pczaykow
SET @pwd = CONVERT (varchar(256), 0x2131214A212B56585F57515054222E2F)
if not exists (select name from master.dbo.sysxlogins where name='pczaykow')
EXEC master..sp_addlogin 'pczaykow', @pwd, @sid = 0x59AEABA563B50A48BF631F03921F4854, @encryptopt = 'skip_encryption_old'
 
-- Login: pdhaliwal2
SET @pwd = CONVERT (varchar(256), 0x2131214A212D2156525D314356535421)
if not exists (select name from master.dbo.sysxlogins where name='pdhaliwal2')
EXEC master..sp_addlogin 'pdhaliwal2', @pwd, @sid = 0x15ECE7619AE621419DBAC93BF3576691, @encryptopt = 'skip_encryption_old'
 
-- Login: pdjames
if not exists (select name from master.dbo.sysxlogins where name='pdjames')
EXEC master..sp_addlogin 'pdjames', NULL, @sid = 0x2B9157A79C3F854BB21DA5689040A970, @encryptopt = 'skip_encryption_old'
 
-- Login: pdong
SET @pwd = CONVERT (varchar(256), 0x2131214A2124405831293D474A245A60)
if not exists (select name from master.dbo.sysxlogins where name='pdong')
EXEC master..sp_addlogin 'pdong', @pwd, @sid = 0x1002B22261F4A545AD58EA2D87107298, @encryptopt = 'skip_encryption_old'
 
-- Login: pdyck
SET @pwd = CONVERT (varchar(256), 0x2131214A212126334128362B27553937)
if not exists (select name from master.dbo.sysxlogins where name='pdyck')
EXEC master..sp_addlogin 'pdyck', @pwd, @sid = 0xC27734D42A764343A6EDB55A3216ADB9, @encryptopt = 'skip_encryption_old'
 
-- Login: pfellman
SET @pwd = CONVERT (varchar(256), 0x2131214A2121344A355E5F46323B5827)
if not exists (select name from master.dbo.sysxlogins where name='pfellman')
EXEC master..sp_addlogin 'pfellman', @pwd, @sid = 0xEAA7785E5732694E80B2D8AEB49A4BF0, @encryptopt = 'skip_encryption_old'
 
-- Login: pfroud
SET @pwd = CONVERT (varchar(256), 0x213124523743503C5C57504B3A2D5933)
if not exists (select name from master.dbo.sysxlogins where name='pfroud')
EXEC master..sp_addlogin 'pfroud', @pwd, @sid = 0xEED9E78FFBA28E46A888C7A261FB72D4, @encryptopt = 'skip_encryption_old'
 
-- Login: pgoeres
SET @pwd = CONVERT (varchar(256), 0x2131222A26475335443642543E273C23)
if not exists (select name from master.dbo.sysxlogins where name='pgoeres')
EXEC master..sp_addlogin 'pgoeres', @pwd, @sid = 0xD7917E33F207274F90A9018A8E9C4B2A, @encryptopt = 'skip_encryption_old'
 
-- Login: pgrewal
if not exists (select name from master.dbo.sysxlogins where name='pgrewal')
EXEC master..sp_addlogin 'pgrewal', NULL, @sid = 0x7751B4A65E6DFB439E9E583CA66BDCC9, @encryptopt = 'skip_encryption_old'
 
-- Login: phamilto
SET @pwd = CONVERT (varchar(256), 0x2131214A212F4C30214257534C24535F)
if not exists (select name from master.dbo.sysxlogins where name='phamilto')
EXEC master..sp_addlogin 'phamilto', @pwd, @sid = 0xCD6752383F871B45B1ACDE1744DF5485, @encryptopt = 'skip_encryption_old'
 
-- Login: phulland
SET @pwd = CONVERT (varchar(256), 0x2131214A21306054462E2534394F295E)
if not exists (select name from master.dbo.sysxlogins where name='phulland')
EXEC master..sp_addlogin 'phulland', @pwd, @sid = 0x6CFCF1722C9A02438B16C9AE5575F390, @encryptopt = 'skip_encryption_old'
 
-- Login: pishkani
SET @pwd = CONVERT (varchar(256), 0x21312256233D29214F5C575023435737)
if not exists (select name from master.dbo.sysxlogins where name='pishkani')
EXEC master..sp_addlogin 'pishkani', @pwd, @sid = 0xDC565B663277A442BE770D2229BA63BB, @encryptopt = 'skip_encryption_old'
 
-- Login: pjfrost
SET @pwd = CONVERT (varchar(256), 0x213122533653484630295C3B2450542B)
if not exists (select name from master.dbo.sysxlogins where name='pjfrost')
EXEC master..sp_addlogin 'pjfrost', @pwd, @sid = 0x7E75E00F7210A2418C5E41D02589DEAF, @encryptopt = 'skip_encryption_old'
 
-- Login: pjones
SET @pwd = CONVERT (varchar(256), 0x2131214A21305654533E57605A39414E)
if not exists (select name from master.dbo.sysxlogins where name='pjones')
EXEC master..sp_addlogin 'pjones', @pwd, @sid = 0xB2E00573BDE8A646922DE4C2B297106E, @encryptopt = 'skip_encryption_old'
 
-- Login: pkoke
SET @pwd = CONVERT (varchar(256), 0x2131234F3D4E215B3434574651255449)
if not exists (select name from master.dbo.sysxlogins where name='pkoke')
EXEC master..sp_addlogin 'pkoke', @pwd, @sid = 0xEE0FE7A069EDCA4BA0725B4C7F584A17, @encryptopt = 'skip_encryption_old'
 
-- Login: plewis
SET @pwd = CONVERT (varchar(256), 0x2131214A212E3E4D2A4D303E3F5E5E45)
if not exists (select name from master.dbo.sysxlogins where name='plewis')
EXEC master..sp_addlogin 'plewis', @pwd, @sid = 0xF5C164107A1A214DBE67A78A573C8E5F, @encryptopt = 'skip_encryption_old'
 
-- Login: pmarkwick
SET @pwd = CONVERT (varchar(256), 0x2131214A212E384D48363E3A28443C5A)
if not exists (select name from master.dbo.sysxlogins where name='pmarkwick')
EXEC master..sp_addlogin 'pmarkwick', @pwd, @sid = 0x24152E7CAF0EE647A83C29D9D388F1E1, @encryptopt = 'skip_encryption_old'
 
-- Login: pobrien
SET @pwd = CONVERT (varchar(256), 0x2131232226295830473E25282D465B2B)
if not exists (select name from master.dbo.sysxlogins where name='pobrien')
EXEC master..sp_addlogin 'pobrien', @pwd, @sid = 0x1B594615B1D48C419891069D2818DD1A, @encryptopt = 'skip_encryption_old'
 
-- Login: ppanek
SET @pwd = CONVERT (varchar(256), 0x2131214A21292334474D5E2F563B2A57)
if not exists (select name from master.dbo.sysxlogins where name='ppanek')
EXEC master..sp_addlogin 'ppanek', @pwd, @sid = 0x9EA12D4BA3DCC2449AA6CFFD0F7A692B, @encryptopt = 'skip_encryption_old'
 
-- Login: ppatters
SET @pwd = CONVERT (varchar(256), 0x2131214A212B5F2C34605F5F3F433936)
if not exists (select name from master.dbo.sysxlogins where name='ppatters')
EXEC master..sp_addlogin 'ppatters', @pwd, @sid = 0x314A830747E7284AB7FA6375772A91DE, @encryptopt = 'skip_encryption_old'
 
-- Login: ppham
SET @pwd = CONVERT (varchar(256), 0x2131214A21234E2C495225573D34354C)
if not exists (select name from master.dbo.sysxlogins where name='ppham')
EXEC master..sp_addlogin 'ppham', @pwd, @sid = 0x497834EE416E6E42AC6E4089D7F03F27, @encryptopt = 'skip_encryption_old'
 
-- Login: pruttan
SET @pwd = CONVERT (varchar(256), 0x2131214A21222F293B5257235D244324)
if not exists (select name from master.dbo.sysxlogins where name='pruttan')
EXEC master..sp_addlogin 'pruttan', @pwd, @sid = 0xE2318ACBEAF15D4AA701EE62CECCF1C5, @encryptopt = 'skip_encryption_old'
 
-- Login: pspencer
SET @pwd = CONVERT (varchar(256), 0x2131244233484F31553653522523464C)
if not exists (select name from master.dbo.sysxlogins where name='pspencer')
EXEC master..sp_addlogin 'pspencer', @pwd, @sid = 0x4CE74FACBA787348B20B23E62CE5A737, @encryptopt = 'skip_encryption_old'
 
-- Login: pstewart
SET @pwd = CONVERT (varchar(256), 0x2131243527484729405A4B455A533A39)
if not exists (select name from master.dbo.sysxlogins where name='pstewart')
EXEC master..sp_addlogin 'pstewart', @pwd, @sid = 0x62C30902B595C44DA0DE51EE3CFE5404, @encryptopt = 'skip_encryption_old'
 
-- Login: ptaheem
SET @pwd = CONVERT (varchar(256), 0x2131214A212C2A5C3230565A2B36412C)
if not exists (select name from master.dbo.sysxlogins where name='ptaheem')
EXEC master..sp_addlogin 'ptaheem', @pwd, @sid = 0x6A37714697889F4C829F4702E0F88063, @encryptopt = 'skip_encryption_old'
 
-- Login: pthomas
SET @pwd = CONVERT (varchar(256), 0x2131245640564E464438303651574052)
if not exists (select name from master.dbo.sysxlogins where name='pthomas')
EXEC master..sp_addlogin 'pthomas', @pwd, @sid = 0x368300DDCBA8DE4DA620649A06EDF79F, @encryptopt = 'skip_encryption_old'
 
-- Login: ptruong
SET @pwd = CONVERT (varchar(256), 0x2131214A212A4E294749292D3A324253)
if not exists (select name from master.dbo.sysxlogins where name='ptruong')
EXEC master..sp_addlogin 'ptruong', @pwd, @sid = 0x9B2DCA8187D5844E836D444FF7855AD0, @encryptopt = 'skip_encryption_old'
 
-- Login: punger
SET @pwd = CONVERT (varchar(256), 0x2131225F254B5B4B3B444B5541443460)
if not exists (select name from master.dbo.sysxlogins where name='punger')
EXEC master..sp_addlogin 'punger', @pwd, @sid = 0x02E32BDC31E0104583F706D02137A9F6, @encryptopt = 'skip_encryption_old'
 
-- Login: pviosky
SET @pwd = CONVERT (varchar(256), 0x2131235F27263528235D4C5854215A2B)
if not exists (select name from master.dbo.sysxlogins where name='pviosky')
EXEC master..sp_addlogin 'pviosky', @pwd, @sid = 0x0BAEA924CB9C9346B23D56A451EFB986, @encryptopt = 'skip_encryption_old'
 
-- Login: pvisosky
SET @pwd = CONVERT (varchar(256), 0x2131214A2126323E5041504432245453)
if not exists (select name from master.dbo.sysxlogins where name='pvisosky')
EXEC master..sp_addlogin 'pvisosky', @pwd, @sid = 0x9C8CAA48FCFA9B4DADB7D2FA9F0DC692, @encryptopt = 'skip_encryption_old'
 
-- Login: pwegener
SET @pwd = CONVERT (varchar(256), 0x2131214A212746484627582926455F21)
if not exists (select name from master.dbo.sysxlogins where name='pwegener')
EXEC master..sp_addlogin 'pwegener', @pwd, @sid = 0x6106ED20925B9E47B2F9C63B78C221ED, @encryptopt = 'skip_encryption_old'
 
-- Login: pwhitema
SET @pwd = CONVERT (varchar(256), 0x21312235343F52372240256054303E2C)
if not exists (select name from master.dbo.sysxlogins where name='pwhitema')
EXEC master..sp_addlogin 'pwhitema', @pwd, @sid = 0x6700C3011E294D479D1757B17A4294D7, @encryptopt = 'skip_encryption_old'
 
-- Login: pwhiteman
SET @pwd = CONVERT (varchar(256), 0x2131215F35315421284D3D303E212636)
if not exists (select name from master.dbo.sysxlogins where name='pwhiteman')
EXEC master..sp_addlogin 'pwhiteman', @pwd, @sid = 0xD754E434B1404D45AB2178EEC38E70DE, @encryptopt = 'skip_encryption_old'
 
-- Login: pwtest
if not exists (select name from master.dbo.sysxlogins where name='pwtest')
EXEC master..sp_addlogin 'pwtest', NULL, @sid = 0x5CD1B4C44ECA2D4B85F052382934FED9, @encryptopt = 'skip_encryption_old'
 
-- Login: ramcavoy
SET @pwd = CONVERT (varchar(256), 0x2131245F344432594B4123586044355F)
if not exists (select name from master.dbo.sysxlogins where name='ramcavoy')
EXEC master..sp_addlogin 'ramcavoy', @pwd, @sid = 0x2031AAD672737A41886639F7C078C283, @encryptopt = 'skip_encryption_old'
 
-- Login: rbhondi
SET @pwd = CONVERT (varchar(256), 0x2131214A2129573447332D3F53514D2A)
if not exists (select name from master.dbo.sysxlogins where name='rbhondi')
EXEC master..sp_addlogin 'rbhondi', @pwd, @sid = 0x102887E8E34A6A47A5209C4CDB82E160, @encryptopt = 'skip_encryption_old'
 
-- Login: rbianco
SET @pwd = CONVERT (varchar(256), 0x2131245E382E2536285657303B2A3438)
if not exists (select name from master.dbo.sysxlogins where name='rbianco')
EXEC master..sp_addlogin 'rbianco', @pwd, @sid = 0xCE16DF8C19AE5642A5047D5733BBF9D8, @encryptopt = 'skip_encryption_old'
 
-- Login: rbingham
SET @pwd = CONVERT (varchar(256), 0x2131214A21215E2C4D422453593A3828)
if not exists (select name from master.dbo.sysxlogins where name='rbingham')
EXEC master..sp_addlogin 'rbingham', @pwd, @sid = 0xEE021F7511BA2648B3781E5406CE5C71, @encryptopt = 'skip_encryption_old'
 
-- Login: rbissoon
SET @pwd = CONVERT (varchar(256), 0x213121443327463432544F2E47373759)
if not exists (select name from master.dbo.sysxlogins where name='rbissoon')
EXEC master..sp_addlogin 'rbissoon', @pwd, @sid = 0x0C84B9C94E3B124987F5B556B7A8F803, @encryptopt = 'skip_encryption_old'
 
-- Login: rbundala
SET @pwd = CONVERT (varchar(256), 0x2131242F2F3E4E5C3241265D445A5B60)
if not exists (select name from master.dbo.sysxlogins where name='rbundala')
EXEC master..sp_addlogin 'rbundala', @pwd, @sid = 0x911DF81E70E62F4F87DD51FB82149323, @encryptopt = 'skip_encryption_old'
 
-- Login: rcadayma
SET @pwd = CONVERT (varchar(256), 0x2131214433235F25372225362742334C)
if not exists (select name from master.dbo.sysxlogins where name='rcadayma')
EXEC master..sp_addlogin 'rcadayma', @pwd, @sid = 0x54628F424594354F9A9C3569EC1CBAA2, @encryptopt = 'skip_encryption_old'
 
-- Login: rcain
SET @pwd = CONVERT (varchar(256), 0x2131214A2127293D402C2C31413A413A)
if not exists (select name from master.dbo.sysxlogins where name='rcain')
EXEC master..sp_addlogin 'rcain', @pwd, @sid = 0xC22B38422080E64BBEBA6489D5E0FE0A, @encryptopt = 'skip_encryption_old'
 
-- Login: rcalderon
SET @pwd = CONVERT (varchar(256), 0x2131214A21264A282B4C2D4949592234)
if not exists (select name from master.dbo.sysxlogins where name='rcalderon')
EXEC master..sp_addlogin 'rcalderon', @pwd, @sid = 0x4F72568E1F817A45A205653C2E0FD81C, @encryptopt = 'skip_encryption_old'
 
-- Login: rchang
SET @pwd = CONVERT (varchar(256), 0x2131214A2130293E365931444A454641)
if not exists (select name from master.dbo.sysxlogins where name='rchang')
EXEC master..sp_addlogin 'rchang', @pwd, @sid = 0x0ACF8C248C55BF4BA76D9A8E498B294B, @encryptopt = 'skip_encryption_old'
 
-- Login: rconnery
SET @pwd = CONVERT (varchar(256), 0x2131214433233F475444392C544B2F5E)
if not exists (select name from master.dbo.sysxlogins where name='rconnery')
EXEC master..sp_addlogin 'rconnery', @pwd, @sid = 0xB0121DC61903CF42BFFB72EEFD5EF759, @encryptopt = 'skip_encryption_old'
 
-- Login: rcristobal
SET @pwd = CONVERT (varchar(256), 0x2131214A21284C5A39233D282F313C57)
if not exists (select name from master.dbo.sysxlogins where name='rcristobal')
EXEC master..sp_addlogin 'rcristobal', @pwd, @sid = 0xE62F57CE36F3AA4F95BDD17C43D87A6B, @encryptopt = 'skip_encryption_old'
 
-- Login: rcrouch
SET @pwd = CONVERT (varchar(256), 0x2131214A2127314943374756413B5A5A)
if not exists (select name from master.dbo.sysxlogins where name='rcrouch')
EXEC master..sp_addlogin 'rcrouch', @pwd, @sid = 0xF4B2FC698EDAD944994DA2AE4BA8A57C, @encryptopt = 'skip_encryption_old'
 
-- Login: rdcruz
SET @pwd = CONVERT (varchar(256), 0x213123562C3F2E51582D45442D2D5755)
if not exists (select name from master.dbo.sysxlogins where name='rdcruz')
EXEC master..sp_addlogin 'rdcruz', @pwd, @sid = 0x366239C86BFD624DA3FDF8DA16627B35, @encryptopt = 'skip_encryption_old'
 
-- Login: rdeleon
SET @pwd = CONVERT (varchar(256), 0x2131214A21285643343245385C454B23)
if not exists (select name from master.dbo.sysxlogins where name='rdeleon')
EXEC master..sp_addlogin 'rdeleon', @pwd, @sid = 0x0AABCD711BC82F419976C9542D60C761, @encryptopt = 'skip_encryption_old'
 
-- Login: reliuk
SET @pwd = CONVERT (varchar(256), 0x2131214A212D29294F40262E362B3A5D)
if not exists (select name from master.dbo.sysxlogins where name='reliuk')
EXEC master..sp_addlogin 'reliuk', @pwd, @sid = 0x761A6E94FBB4B346B16AC953F0D0E3DC, @encryptopt = 'skip_encryption_old'
 
-- Login: relliott
SET @pwd = CONVERT (varchar(256), 0x213121492A3C222E3538346021333439)
if not exists (select name from master.dbo.sysxlogins where name='relliott')
EXEC master..sp_addlogin 'relliott', @pwd, @sid = 0x0964ED533D298E45B0E4771E3134013E, @encryptopt = 'skip_encryption_old'
 
-- Login: rellis
SET @pwd = CONVERT (varchar(256), 0x2131214A212B32435E533F5D2F362D22)
if not exists (select name from master.dbo.sysxlogins where name='rellis')
EXEC master..sp_addlogin 'rellis', @pwd, @sid = 0xA8D9493ECDD0E648B503B2CA6BEDE2FB, @encryptopt = 'skip_encryption_old'
 
-- Login: repl_publisher
SET @pwd = CONVERT (varchar(256), 0x21312144332A5C51365C373D3F595627)
if not exists (select name from master.dbo.sysxlogins where name='repl_publisher')
EXEC master..sp_addlogin 'repl_publisher', @pwd, @sid = 0x6FC62AA95C726345BC4C825190A1853E, @encryptopt = 'skip_encryption_old'
 
-- Login: repl_subscriber
SET @pwd = CONVERT (varchar(256), 0x2131214A21252F492A463E51542C3757)
if not exists (select name from master.dbo.sysxlogins where name='repl_subscriber')
EXEC master..sp_addlogin 'repl_subscriber', @pwd, @sid = 0xB8215DD1DB718848B415E425D57893E4, @encryptopt = 'skip_encryption_old'
 
-- Login: rgill7
SET @pwd = CONVERT (varchar(256), 0x2131233138533C4C4A4331444D492F21)
if not exists (select name from master.dbo.sysxlogins where name='rgill7')
EXEC master..sp_addlogin 'rgill7', @pwd, @sid = 0xE7A32989DB83E34C90F9AF129F3CDCBB, @encryptopt = 'skip_encryption_old'
 
-- Login: rgrantham
if not exists (select name from master.dbo.sysxlogins where name='rgrantham')
EXEC master..sp_addlogin 'rgrantham', NULL, @sid = 0xE5213A55927E60488CB5532515A4C8F5, @encryptopt = 'skip_encryption_old'
 
-- Login: rgreen
SET @pwd = CONVERT (varchar(256), 0x2131214A21235D2B353E51343E3E363C)
if not exists (select name from master.dbo.sysxlogins where name='rgreen')
EXEC master..sp_addlogin 'rgreen', @pwd, @sid = 0xCD50CEA8FC120E429AA785F498E56AB8, @encryptopt = 'skip_encryption_old'
 
-- Login: rheiland
SET @pwd = CONVERT (varchar(256), 0x2131214A212C53224B2E59414C494F35)
if not exists (select name from master.dbo.sysxlogins where name='rheiland')
EXEC master..sp_addlogin 'rheiland', @pwd, @sid = 0xDBF585A61B621D4E8820D3B77E4EFE60, @encryptopt = 'skip_encryption_old'
 
-- Login: rhernand
SET @pwd = CONVERT (varchar(256), 0x21312360344E5D503D532D4D4458503A)
if not exists (select name from master.dbo.sysxlogins where name='rhernand')
EXEC master..sp_addlogin 'rhernand', @pwd, @sid = 0x2E276D7A39A6DD48860096C798FF7D06, @encryptopt = 'skip_encryption_old'
 
-- Login: rhooker
SET @pwd = CONVERT (varchar(256), 0x2131214A212455474D4A4F3F574D284D)
if not exists (select name from master.dbo.sysxlogins where name='rhooker')
EXEC master..sp_addlogin 'rhooker', @pwd, @sid = 0xD0D129F8FC04A04289977E956B28104E, @encryptopt = 'skip_encryption_old'
 
-- Login: rkalyn
SET @pwd = CONVERT (varchar(256), 0x2131235F2721394F544A552C37333653)
if not exists (select name from master.dbo.sysxlogins where name='rkalyn')
EXEC master..sp_addlogin 'rkalyn', @pwd, @sid = 0xE5BC54503D36904587E2379028058629, @encryptopt = 'skip_encryption_old'
 
-- Login: rkirby
SET @pwd = CONVERT (varchar(256), 0x2131214A212339575D5628534F55583F)
if not exists (select name from master.dbo.sysxlogins where name='rkirby')
EXEC master..sp_addlogin 'rkirby', @pwd, @sid = 0x702C71F023AB954D80B466A22FED9642, @encryptopt = 'skip_encryption_old'
 
-- Login: rlaface
SET @pwd = CONVERT (varchar(256), 0x2131214A21233A5F51253F285358465F)
if not exists (select name from master.dbo.sysxlogins where name='rlaface')
EXEC master..sp_addlogin 'rlaface', @pwd, @sid = 0xA6DC760253FBC641B72031FD23CEA65D, @encryptopt = 'skip_encryption_old'
 
-- Login: rmalong
SET @pwd = CONVERT (varchar(256), 0x2131214A21225F3646505D23602C4853)
if not exists (select name from master.dbo.sysxlogins where name='rmalong')
EXEC master..sp_addlogin 'rmalong', @pwd, @sid = 0x7F89F0525F3CE4439F32A8EA2C0E18B6, @encryptopt = 'skip_encryption_old'
 
-- Login: rmartinez
SET @pwd = CONVERT (varchar(256), 0x2131214A212940573E3E3E3C303E603B)
if not exists (select name from master.dbo.sysxlogins where name='rmartinez')
EXEC master..sp_addlogin 'rmartinez', @pwd, @sid = 0x1BE676397ECFA342B867EBD24C6EAF35, @encryptopt = 'skip_encryption_old'
 
-- Login: rmasih
SET @pwd = CONVERT (varchar(256), 0x2131214A2126213E4943514457445030)
if not exists (select name from master.dbo.sysxlogins where name='rmasih')
EXEC master..sp_addlogin 'rmasih', @pwd, @sid = 0x03A2F68810E2CC4EBFFB00222192E3DC, @encryptopt = 'skip_encryption_old'
 
-- Login: rmckillica
SET @pwd = CONVERT (varchar(256), 0x21312435334F344546262D58532D4244)
if not exists (select name from master.dbo.sysxlogins where name='rmckillica')
EXEC master..sp_addlogin 'rmckillica', @pwd, @sid = 0xEE8717716879E74883992E6BE9EBDCD8, @encryptopt = 'skip_encryption_old'
 
-- Login: rmclean
SET @pwd = CONVERT (varchar(256), 0x2131214A212D25564D2145584E3E3548)
if not exists (select name from master.dbo.sysxlogins where name='rmclean')
EXEC master..sp_addlogin 'rmclean', @pwd, @sid = 0x45ED4592BD9BD94497C4AF9358DDA55F, @encryptopt = 'skip_encryption_old'
 
-- Login: rmoniz
if not exists (select name from master.dbo.sysxlogins where name='rmoniz')
EXEC master..sp_addlogin 'rmoniz', NULL, @sid = 0xB1FAFEFF7FCDEC48B1723326EEE95BA3, @encryptopt = 'skip_encryption_old'
 
-- Login: rmoser
SET @pwd = CONVERT (varchar(256), 0x21312144332B345E5A3E4226533E2441)
if not exists (select name from master.dbo.sysxlogins where name='rmoser')
EXEC master..sp_addlogin 'rmoser', @pwd, @sid = 0xF85236B76FA8514F819DF137827E7B43, @encryptopt = 'skip_encryption_old'
 
-- Login: rneudorf
SET @pwd = CONVERT (varchar(256), 0x2131214A21215840235C39243C2F3D4A)
if not exists (select name from master.dbo.sysxlogins where name='rneudorf')
EXEC master..sp_addlogin 'rneudorf', @pwd, @sid = 0xFD27B1C0A0AE024DBF4B12D06A348908, @encryptopt = 'skip_encryption_old'
 
-- Login: romacdon
SET @pwd = CONVERT (varchar(256), 0x21312144332D46434D473A223652284B)
if not exists (select name from master.dbo.sysxlogins where name='romacdon')
EXEC master..sp_addlogin 'romacdon', @pwd, @sid = 0xD00F496A202DAC4EA0088F16FA1D1AB6, @encryptopt = 'skip_encryption_old'
 
-- Login: rpage
SET @pwd = CONVERT (varchar(256), 0x213123382F5D594756555D23375C223E)
if not exists (select name from master.dbo.sysxlogins where name='rpage')
EXEC master..sp_addlogin 'rpage', @pwd, @sid = 0x653BD8A57DFA4042B1CEF9C3C5312207, @encryptopt = 'skip_encryption_old'
 
-- Login: rparhar
SET @pwd = CONVERT (varchar(256), 0x2131214A21215A5F3D4B2B5F2D2A2341)
if not exists (select name from master.dbo.sysxlogins where name='rparhar')
EXEC master..sp_addlogin 'rparhar', @pwd, @sid = 0xAEECE2788067DC418DA8BADD37DCE0D6, @encryptopt = 'skip_encryption_old'
 
-- Login: rparmar
SET @pwd = CONVERT (varchar(256), 0x2131214A2122564B34475B363E482540)
if not exists (select name from master.dbo.sysxlogins where name='rparmar')
EXEC master..sp_addlogin 'rparmar', @pwd, @sid = 0x184098D7EE83D74991118E46272EDF48, @encryptopt = 'skip_encryption_old'
 
-- Login: rpaterson
SET @pwd = CONVERT (varchar(256), 0x2131214A21222852372F353B4E2E4D2D)
if not exists (select name from master.dbo.sysxlogins where name='rpaterson')
EXEC master..sp_addlogin 'rpaterson', @pwd, @sid = 0x880E91E618F3EC4B8660301BAFDF3B1B, @encryptopt = 'skip_encryption_old'
 
-- Login: rraju
SET @pwd = CONVERT (varchar(256), 0x2131214A212B4D2A2D5223285B544F40)
if not exists (select name from master.dbo.sysxlogins where name='rraju')
EXEC master..sp_addlogin 'rraju', @pwd, @sid = 0x6280D6E5C8F15C46A6A044131AD9C782, @encryptopt = 'skip_encryption_old'
 
-- Login: rrensen
SET @pwd = CONVERT (varchar(256), 0x213122432A2C4C475E373759352C3C26)
if not exists (select name from master.dbo.sysxlogins where name='rrensen')
EXEC master..sp_addlogin 'rrensen', @pwd, @sid = 0xFCBA89D0872D874795D589847E6C66B1, @encryptopt = 'skip_encryption_old'
 
-- Login: rrogers
SET @pwd = CONVERT (varchar(256), 0x2131234A244D4F4F59254234482A4356)
if not exists (select name from master.dbo.sysxlogins where name='rrogers')
EXEC master..sp_addlogin 'rrogers', @pwd, @sid = 0x58CC166468CC2D4F852BEEAB53B2234B, @encryptopt = 'skip_encryption_old'
 
-- Login: rsamant
SET @pwd = CONVERT (varchar(256), 0x2131214A212B56585F57515054222E2F)
if not exists (select name from master.dbo.sysxlogins where name='rsamant')
EXEC master..sp_addlogin 'rsamant', @pwd, @sid = 0x46BB1C6AF57C6F49828B4883440DB6DE, @encryptopt = 'skip_encryption_old'
 
-- Login: rsawhney
SET @pwd = CONVERT (varchar(256), 0x21312144332959535C58342A36554821)
if not exists (select name from master.dbo.sysxlogins where name='rsawhney')
EXEC master..sp_addlogin 'rsawhney', @pwd, @sid = 0xD95F3D87BC1E6A41BD15A373DC504340, @encryptopt = 'skip_encryption_old'
 
-- Login: rscott
SET @pwd = CONVERT (varchar(256), 0x2131224834382953344D344A2821515D)
if not exists (select name from master.dbo.sysxlogins where name='rscott')
EXEC master..sp_addlogin 'rscott', @pwd, @sid = 0x7AC7ABE2231FA94E877F23421D025667, @encryptopt = 'skip_encryption_old'
 
-- Login: rstogneff
SET @pwd = CONVERT (varchar(256), 0x2131214A21294B5F47282D532E402534)
if not exists (select name from master.dbo.sysxlogins where name='rstogneff')
EXEC master..sp_addlogin 'rstogneff', @pwd, @sid = 0xE5DE7BE1C44AEB4B88215E53F3F46E38, @encryptopt = 'skip_encryption_old'
 
-- Login: rstuj
SET @pwd = CONVERT (varchar(256), 0x21312156212D3553325F2746434A464E)
if not exists (select name from master.dbo.sysxlogins where name='rstuj')
EXEC master..sp_addlogin 'rstuj', @pwd, @sid = 0x2B9EDA65B809C640BE09E8C67483A110, @encryptopt = 'skip_encryption_old'
 
-- Login: rtaylor
SET @pwd = CONVERT (varchar(256), 0x213121332C3A23235F21524533262936)
if not exists (select name from master.dbo.sysxlogins where name='rtaylor')
EXEC master..sp_addlogin 'rtaylor', @pwd, @sid = 0x34832B87B6812D4C8F886142B81E8D65, @encryptopt = 'skip_encryption_old'
 
-- Login: rtorres
SET @pwd = CONVERT (varchar(256), 0x213124522857355B4E4339422D572E4B)
if not exists (select name from master.dbo.sysxlogins where name='rtorres')
EXEC master..sp_addlogin 'rtorres', @pwd, @sid = 0x51B795599FB77447BCBD1660B45070EA, @encryptopt = 'skip_encryption_old'
 
-- Login: rwildy
SET @pwd = CONVERT (varchar(256), 0x2131215D2633585C4C602D225C3E4040)
if not exists (select name from master.dbo.sysxlogins where name='rwildy')
EXEC master..sp_addlogin 'rwildy', @pwd, @sid = 0xA67E1F335578654695FBBFF8B40C1FA0, @encryptopt = 'skip_encryption_old'
 
-- Login: rwilliam
SET @pwd = CONVERT (varchar(256), 0x21312352355A4D31413935425524515F)
if not exists (select name from master.dbo.sysxlogins where name='rwilliam')
EXEC master..sp_addlogin 'rwilliam', @pwd, @sid = 0xAB5B79EF2AA0B344B1C5CE51944FDCA4, @encryptopt = 'skip_encryption_old'
 
-- Login: saddison
SET @pwd = CONVERT (varchar(256), 0x2131214A212D3C3F465C3D493D333E26)
if not exists (select name from master.dbo.sysxlogins where name='saddison')
EXEC master..sp_addlogin 'saddison', @pwd, @sid = 0xFBAFA2E89EDD7B4BBA2E5EE4C52CE5BF, @encryptopt = 'skip_encryption_old'
 
-- Login: sadeol
SET @pwd = CONVERT (varchar(256), 0x21312442334349353355313136214133)
if not exists (select name from master.dbo.sysxlogins where name='sadeol')
EXEC master..sp_addlogin 'sadeol', @pwd, @sid = 0xB9991BE1F116BF4B936CE614C844BE50, @encryptopt = 'skip_encryption_old'
 
-- Login: salexand
SET @pwd = CONVERT (varchar(256), 0x2131234F3D4A592E52315E552A2D3E31)
if not exists (select name from master.dbo.sysxlogins where name='salexand')
EXEC master..sp_addlogin 'salexand', @pwd, @sid = 0x2A149E68D5CF6849831E00BBFE265401, @encryptopt = 'skip_encryption_old'
 
-- Login: sali
SET @pwd = CONVERT (varchar(256), 0x2131233F2A282737545E4A2730374B5D)
if not exists (select name from master.dbo.sysxlogins where name='sali')
EXEC master..sp_addlogin 'sali', @pwd, @sid = 0x8B33A84C5063394EBEEB219D1A74BCC8, @encryptopt = 'skip_encryption_old'
 
-- Login: sallan
SET @pwd = CONVERT (varchar(256), 0x213123253A563D432946394934312246)
if not exists (select name from master.dbo.sysxlogins where name='sallan')
EXEC master..sp_addlogin 'sallan', @pwd, @sid = 0xEA15E7F4729A71459F51B0452F8E5639, @encryptopt = 'skip_encryption_old'
 
-- Login: sangrove
SET @pwd = CONVERT (varchar(256), 0x2131214A2127475026285A5A363E2F29)
if not exists (select name from master.dbo.sysxlogins where name='sangrove')
EXEC master..sp_addlogin 'sangrove', @pwd, @sid = 0x7072CADED8270543A50DEC8E59752A15, @encryptopt = 'skip_encryption_old'
 
-- Login: sappenhe
SET @pwd = CONVERT (varchar(256), 0x2131214A21293C44372D413750565B25)
if not exists (select name from master.dbo.sysxlogins where name='sappenhe')
EXEC master..sp_addlogin 'sappenhe', @pwd, @sid = 0xE4152CFBA0A4C444AC94390CB63A4C55, @encryptopt = 'skip_encryption_old'
 
-- Login: sawebb
SET @pwd = CONVERT (varchar(256), 0x2131214A212D5330413034225722375C)
if not exists (select name from master.dbo.sysxlogins where name='sawebb')
EXEC master..sp_addlogin 'sawebb', @pwd, @sid = 0xCE1D0F08A191E74EA91535B350197069, @encryptopt = 'skip_encryption_old'
 
-- Login: sbaillie
SET @pwd = CONVERT (varchar(256), 0x2131214A21263A3A273E553032442E37)
if not exists (select name from master.dbo.sysxlogins where name='sbaillie')
EXEC master..sp_addlogin 'sbaillie', @pwd, @sid = 0x9E4BCF3FD49F714CA4133AE6FBEF4D2E, @encryptopt = 'skip_encryption_old'
 
-- Login: sbalkwil
SET @pwd = CONVERT (varchar(256), 0x2131214A212B28474E4D3D5F5B464227)
if not exists (select name from master.dbo.sysxlogins where name='sbalkwil')
EXEC master..sp_addlogin 'sbalkwil', @pwd, @sid = 0x9B0A03C96C024C4D8E87AB74E7BEE98D, @encryptopt = 'skip_encryption_old'
 
-- Login: sbanwell
SET @pwd = CONVERT (varchar(256), 0x2131214A212643262656445526553A54)
if not exists (select name from master.dbo.sysxlogins where name='sbanwell')
EXEC master..sp_addlogin 'sbanwell', @pwd, @sid = 0x0EA19113DE7BE44796A9C59118CDEC39, @encryptopt = 'skip_encryption_old'
 
-- Login: sbarrisc
SET @pwd = CONVERT (varchar(256), 0x2131212B215138514F43355B5235415C)
if not exists (select name from master.dbo.sysxlogins where name='sbarrisc')
EXEC master..sp_addlogin 'sbarrisc', @pwd, @sid = 0xCD377CA7CAEC154F9546683795BD77EB, @encryptopt = 'skip_encryption_old'
 
-- Login: sbigauskas
SET @pwd = CONVERT (varchar(256), 0x2131214A21272A4533395B5B283E343A)
if not exists (select name from master.dbo.sysxlogins where name='sbigauskas')
EXEC master..sp_addlogin 'sbigauskas', @pwd, @sid = 0xA6A36508D866E240BFFEE774DC7D54FA, @encryptopt = 'skip_encryption_old'
 
-- Login: sbosnjak
SET @pwd = CONVERT (varchar(256), 0x2131214A21235E3A5B2E32453833414C)
if not exists (select name from master.dbo.sysxlogins where name='sbosnjak')
EXEC master..sp_addlogin 'sbosnjak', @pwd, @sid = 0xC8E8EE70640CFB44AC0F36CF3696E508, @encryptopt = 'skip_encryption_old'
 
-- Login: sboyd
SET @pwd = CONVERT (varchar(256), 0x2131214A212C224C4A4C5D3B3C244247)
if not exists (select name from master.dbo.sysxlogins where name='sboyd')
EXEC master..sp_addlogin 'sboyd', @pwd, @sid = 0xF0178340839948439F475011EAB1A215, @encryptopt = 'skip_encryption_old'
 
-- Login: sbraich
SET @pwd = CONVERT (varchar(256), 0x2131214A21235C5B2421234B4352235E)
if not exists (select name from master.dbo.sysxlogins where name='sbraich')
EXEC master..sp_addlogin 'sbraich', @pwd, @sid = 0x4605157D0950C949AAF1D576DEE8C2C9, @encryptopt = 'skip_encryption_old'
 
-- Login: sbrennan
SET @pwd = CONVERT (varchar(256), 0x2131214A21305E564F233D24474E2728)
if not exists (select name from master.dbo.sysxlogins where name='sbrennan')
EXEC master..sp_addlogin 'sbrennan', @pwd, @sid = 0x3615D7AB9FD4E24F8D8FD9640B94B737, @encryptopt = 'skip_encryption_old'
 
-- Login: sbroadbe
SET @pwd = CONVERT (varchar(256), 0x213123402638484F46404157424E2240)
if not exists (select name from master.dbo.sysxlogins where name='sbroadbe')
EXEC master..sp_addlogin 'sbroadbe', @pwd, @sid = 0x9E17AFFCDDFA3D47BA5A4D96B18A59DE, @encryptopt = 'skip_encryption_old'
 
-- Login: sbrossea
SET @pwd = CONVERT (varchar(256), 0x2131214A212E5D36314A39424A60494B)
if not exists (select name from master.dbo.sysxlogins where name='sbrossea')
EXEC master..sp_addlogin 'sbrossea', @pwd, @sid = 0x802781D35B0D4A42A633418C8217AEF5, @encryptopt = 'skip_encryption_old'
 
-- Login: sbroughton
SET @pwd = CONVERT (varchar(256), 0x2131214A21284931233123403B3B3256)
if not exists (select name from master.dbo.sysxlogins where name='sbroughton')
EXEC master..sp_addlogin 'sbroughton', @pwd, @sid = 0x85855BB032AA0849B8509F0AB1A11F91, @encryptopt = 'skip_encryption_old'
 
-- Login: sbuchkow
SET @pwd = CONVERT (varchar(256), 0x2131243D3626413A5D5A38345D564245)
if not exists (select name from master.dbo.sysxlogins where name='sbuchkow')
EXEC master..sp_addlogin 'sbuchkow', @pwd, @sid = 0xCA1734C6D2ABC846B1E885BFBDD14A4E, @encryptopt = 'skip_encryption_old'
 
-- Login: scampbell
SET @pwd = CONVERT (varchar(256), 0x2131214A21304F21392C223455312B3F)
if not exists (select name from master.dbo.sysxlogins where name='scampbell')
EXEC master..sp_addlogin 'scampbell', @pwd, @sid = 0xC72F88DB551C84498255CADB2B301466, @encryptopt = 'skip_encryption_old'
 
-- Login: schaukla
SET @pwd = CONVERT (varchar(256), 0x2131214A212D47572D4E2A2B51463B50)
if not exists (select name from master.dbo.sysxlogins where name='schaukla')
EXEC master..sp_addlogin 'schaukla', @pwd, @sid = 0xE44284A54150214D904DF9499A6AE9A3, @encryptopt = 'skip_encryption_old'
 
-- Login: schnoobe
SET @pwd = CONVERT (varchar(256), 0x2131214A21283A473144242E4C2F4A35)
if not exists (select name from master.dbo.sysxlogins where name='schnoobe')
EXEC master..sp_addlogin 'schnoobe', @pwd, @sid = 0x50931DD189801F4E89046E9CE8669439, @encryptopt = 'skip_encryption_old'
 
-- Login: schou
SET @pwd = CONVERT (varchar(256), 0x2131214A21213C5C5323475D3D404D5C)
if not exists (select name from master.dbo.sysxlogins where name='schou')
EXEC master..sp_addlogin 'schou', @pwd, @sid = 0x82EE89047FB94844AC5B5803247DF14C, @encryptopt = 'skip_encryption_old'
 
-- Login: schristi
SET @pwd = CONVERT (varchar(256), 0x2131214A2123505E5625344324233F4A)
if not exists (select name from master.dbo.sysxlogins where name='schristi')
EXEC master..sp_addlogin 'schristi', @pwd, @sid = 0x2229918152D2CA4D96218D1FC6A0E9D0, @encryptopt = 'skip_encryption_old'
 
-- Login: sclair
SET @pwd = CONVERT (varchar(256), 0x21312430225530364832425B5821324F)
if not exists (select name from master.dbo.sysxlogins where name='sclair')
EXEC master..sp_addlogin 'sclair', @pwd, @sid = 0x7624781211183E4EBAA0A01D35727ACD, @encryptopt = 'skip_encryption_old'
 
-- Login: scuthill
SET @pwd = CONVERT (varchar(256), 0x2131214A21255C48584D5535313B2939)
if not exists (select name from master.dbo.sysxlogins where name='scuthill')
EXEC master..sp_addlogin 'scuthill', @pwd, @sid = 0x642B2A965CEE5D4D96188C09013374A4, @encryptopt = 'skip_encryption_old'
 
-- Login: sdaloisi
SET @pwd = CONVERT (varchar(256), 0x213121603E5254513E5D3E22574D3342)
if not exists (select name from master.dbo.sysxlogins where name='sdaloisi')
EXEC master..sp_addlogin 'sdaloisi', @pwd, @sid = 0x99C5A671CB8D3C458B084DB43D6413D9, @encryptopt = 'skip_encryption_old'
 
-- Login: sdevji
SET @pwd = CONVERT (varchar(256), 0x2131214A21215A4F50283A3D51304D25)
if not exists (select name from master.dbo.sysxlogins where name='sdevji')
EXEC master..sp_addlogin 'sdevji', @pwd, @sid = 0x787B6C437F159046BFEFB6953682D2EE, @encryptopt = 'skip_encryption_old'
 
-- Login: sdick
SET @pwd = CONVERT (varchar(256), 0x2131244233454A45233E3F305C5F4C3B)
if not exists (select name from master.dbo.sysxlogins where name='sdick')
EXEC master..sp_addlogin 'sdick', @pwd, @sid = 0xEEFFC2D25CC06C40A566607D65E4CF5F, @encryptopt = 'skip_encryption_old'
 
-- Login: sdunn
SET @pwd = CONVERT (varchar(256), 0x21312144332E512842574C4E593C2B2C)
if not exists (select name from master.dbo.sysxlogins where name='sdunn')
EXEC master..sp_addlogin 'sdunn', @pwd, @sid = 0x8A5132C7747D424C915150C29BA7DA90, @encryptopt = 'skip_encryption_old'
 
-- Login: sedel
SET @pwd = CONVERT (varchar(256), 0x2131225F3C43502B2A3D5E3E3D242947)
if not exists (select name from master.dbo.sysxlogins where name='sedel')
EXEC master..sp_addlogin 'sedel', @pwd, @sid = 0xE67E44807FE08D479FFAADF52AFDBD8A, @encryptopt = 'skip_encryption_old'
 
-- Login: sedgell
SET @pwd = CONVERT (varchar(256), 0x2131214A212E4B505D4C41505A4D5E29)
if not exists (select name from master.dbo.sysxlogins where name='sedgell')
EXEC master..sp_addlogin 'sedgell', @pwd, @sid = 0xA4E3749CC2DF1745804EFB710B49F73A, @encryptopt = 'skip_encryption_old'
 
-- Login: server50
SET @pwd = CONVERT (varchar(256), 0x21312144332D2D493C313B3C54435451)
if not exists (select name from master.dbo.sysxlogins where name='server50')
EXEC master..sp_addlogin 'server50', @pwd, @sid = 0x10B89AC318966F49AF3C1A6E8C310C4B, @encryptopt = 'skip_encryption_old'
 
-- Login: setcher
SET @pwd = CONVERT (varchar(256), 0x2131214A21232A36514D562E3D425F5C)
if not exists (select name from master.dbo.sysxlogins where name='setcher')
EXEC master..sp_addlogin 'setcher', @pwd, @sid = 0x62FF31F3F465CB41BEF9CC82B4B1085A, @encryptopt = 'skip_encryption_old'
 
-- Login: sficociell
SET @pwd = CONVERT (varchar(256), 0x2131214A2130574858282F42452F464D)
if not exists (select name from master.dbo.sysxlogins where name='sficociell')
EXEC master..sp_addlogin 'sficociell', @pwd, @sid = 0x9AA0CE6E984F324E854E96BFD848A961, @encryptopt = 'skip_encryption_old'
 
-- Login: sficociello
SET @pwd = CONVERT (varchar(256), 0x2131214A21223E5B4D55595723392B3F)
if not exists (select name from master.dbo.sysxlogins where name='sficociello')
EXEC master..sp_addlogin 'sficociello', @pwd, @sid = 0xE7FCECFA0BB4FB42953C99930A500F1D, @encryptopt = 'skip_encryption_old'
 
-- Login: sfix
SET @pwd = CONVERT (varchar(256), 0x2131214A2122232350403E28565C2431)
if not exists (select name from master.dbo.sysxlogins where name='sfix')
EXEC master..sp_addlogin 'sfix', @pwd, @sid = 0x12BA797B536733408B91DF809620BFDA, @encryptopt = 'skip_encryption_old'
 
-- Login: sfloo
SET @pwd = CONVERT (varchar(256), 0x213122333B40233339352A5B3B434A5F)
if not exists (select name from master.dbo.sysxlogins where name='sfloo')
EXEC master..sp_addlogin 'sfloo', @pwd, @sid = 0x7269A32C52182D468682E932ADE56399, @encryptopt = 'skip_encryption_old'
 
-- Login: sfoucher
SET @pwd = CONVERT (varchar(256), 0x2131214A21245C5932455E445C243E4C)
if not exists (select name from master.dbo.sysxlogins where name='sfoucher')
EXEC master..sp_addlogin 'sfoucher', @pwd, @sid = 0xBC4B894CC78C624D87B599E960A14FE4, @encryptopt = 'skip_encryption_old'
 
-- Login: sgiesbre
SET @pwd = CONVERT (varchar(256), 0x2131214A2128212E3F29594F5B3E3952)
if not exists (select name from master.dbo.sysxlogins where name='sgiesbre')
EXEC master..sp_addlogin 'sgiesbre', @pwd, @sid = 0x86258833E48E6C4D80AB09CA7830A08D, @encryptopt = 'skip_encryption_old'
 
-- Login: sgrant
SET @pwd = CONVERT (varchar(256), 0x2131214A212A2C22323C39573A4C3A32)
if not exists (select name from master.dbo.sysxlogins where name='sgrant')
EXEC master..sp_addlogin 'sgrant', @pwd, @sid = 0xE560CC1BF24A99429D511E243FCD85C6, @encryptopt = 'skip_encryption_old'
 
-- Login: sgrewal
SET @pwd = CONVERT (varchar(256), 0x2131214A21234F3A47574B4F3E373322)
if not exists (select name from master.dbo.sysxlogins where name='sgrewal')
EXEC master..sp_addlogin 'sgrewal', @pwd, @sid = 0x0D90ADFDDD23974C95FEFD35A243E5C8, @encryptopt = 'skip_encryption_old'
 
-- Login: shalterl
SET @pwd = CONVERT (varchar(256), 0x2131232F2E4B2A3B5F4C285655582360)
if not exists (select name from master.dbo.sysxlogins where name='shalterl')
EXEC master..sp_addlogin 'shalterl', @pwd, @sid = 0x70D640B2ADEDDA4DBD0703391E3E7F85, @encryptopt = 'skip_encryption_old'
 
-- Login: shamilt
SET @pwd = CONVERT (varchar(256), 0x213121443328394E38485F4A583E333B)
if not exists (select name from master.dbo.sysxlogins where name='shamilt')
EXEC master..sp_addlogin 'shamilt', @pwd, @sid = 0xC9CD2D6294C55840B480ECA8662B727E, @encryptopt = 'skip_encryption_old'
 
-- Login: shamilto
SET @pwd = CONVERT (varchar(256), 0x2131214A21234642305E6054503D3B55)
if not exists (select name from master.dbo.sysxlogins where name='shamilto')
EXEC master..sp_addlogin 'shamilto', @pwd, @sid = 0xF65842AA735182499216E69D39026AB7, @encryptopt = 'skip_encryption_old'
 
-- Login: shaugen
SET @pwd = CONVERT (varchar(256), 0x2131242C3958212347395F5C592E3F4F)
if not exists (select name from master.dbo.sysxlogins where name='shaugen')
EXEC master..sp_addlogin 'shaugen', @pwd, @sid = 0x1EADF42B1B57A14497AA9F32D94D7A81, @encryptopt = 'skip_encryption_old'
 
-- Login: shelm
SET @pwd = CONVERT (varchar(256), 0x2131214A2122385C4229384E603D2A2E)
if not exists (select name from master.dbo.sysxlogins where name='shelm')
EXEC master..sp_addlogin 'shelm', @pwd, @sid = 0x5EB54AF2975E5E4A85E86452F2F04EC4, @encryptopt = 'skip_encryption_old'
 
-- Login: shordyiu
SET @pwd = CONVERT (varchar(256), 0x2131214A2129214F2E273C40322E2739)
if not exists (select name from master.dbo.sysxlogins where name='shordyiu')
EXEC master..sp_addlogin 'shordyiu', @pwd, @sid = 0x357D980810F72A41BD827CCC029FCA0A, @encryptopt = 'skip_encryption_old'
 
-- Login: shutchison2
SET @pwd = CONVERT (varchar(256), 0x213124523746322C52462729494C2457)
if not exists (select name from master.dbo.sysxlogins where name='shutchison2')
EXEC master..sp_addlogin 'shutchison2', @pwd, @sid = 0x8D52DDEC7F40634FADC6EFFF03CEB8C9, @encryptopt = 'skip_encryption_old'
 
-- Login: sjanke
SET @pwd = CONVERT (varchar(256), 0x21312144332F4B52302E424E4B5F5632)
if not exists (select name from master.dbo.sysxlogins where name='sjanke')
EXEC master..sp_addlogin 'sjanke', @pwd, @sid = 0x1201252753BE62428C3AD3F1BCE82224, @encryptopt = 'skip_encryption_old'
 
-- Login: sjoly
SET @pwd = CONVERT (varchar(256), 0x2131214433222239404E232552492B2C)
if not exists (select name from master.dbo.sysxlogins where name='sjoly')
EXEC master..sp_addlogin 'sjoly', @pwd, @sid = 0x16EB207FC704C44DA7C578FA2D683179, @encryptopt = 'skip_encryption_old'
 
-- Login: skhndlik
SET @pwd = CONVERT (varchar(256), 0x2131214A21262D5A334D4C3822504C26)
if not exists (select name from master.dbo.sysxlogins where name='skhndlik')
EXEC master..sp_addlogin 'skhndlik', @pwd, @sid = 0xE9785DEADBD19A448B9410521459840C, @encryptopt = 'skip_encryption_old'
 
-- Login: skiidumae
SET @pwd = CONVERT (varchar(256), 0x2131214A212E404037325B504943502D)
if not exists (select name from master.dbo.sysxlogins where name='skiidumae')
EXEC master..sp_addlogin 'skiidumae', @pwd, @sid = 0xD220900E473A34419C5C886BF8EB4844, @encryptopt = 'skip_encryption_old'
 
-- Login: skormos
SET @pwd = CONVERT (varchar(256), 0x2131214A212D41602739604D3A422F37)
if not exists (select name from master.dbo.sysxlogins where name='skormos')
EXEC master..sp_addlogin 'skormos', @pwd, @sid = 0xE9883A5BC5A9204EAF90DED1927656CF, @encryptopt = 'skip_encryption_old'
 
-- Login: slarsson
SET @pwd = CONVERT (varchar(256), 0x213123313856524E3433465C25442A5E)
if not exists (select name from master.dbo.sysxlogins where name='slarsson')
EXEC master..sp_addlogin 'slarsson', @pwd, @sid = 0x35A79D1BE1D0254BAB90FF15B6B5B9F8, @encryptopt = 'skip_encryption_old'
 
-- Login: slavell
SET @pwd = CONVERT (varchar(256), 0x2131214A21212E4951412C2D5B374643)
if not exists (select name from master.dbo.sysxlogins where name='slavell')
EXEC master..sp_addlogin 'slavell', @pwd, @sid = 0x9B8FA1BD2244A8438F775012F37DDB9B, @encryptopt = 'skip_encryption_old'
 
-- Login: slee
SET @pwd = CONVERT (varchar(256), 0x2131214A21213F403B353723333E3F23)
if not exists (select name from master.dbo.sysxlogins where name='slee')
EXEC master..sp_addlogin 'slee', @pwd, @sid = 0xA8704B012435DA429D9BFDA7506FE119, @encryptopt = 'skip_encryption_old'
 
-- Login: slim
SET @pwd = CONVERT (varchar(256), 0x2131214A212C4F4A29472E243A2A5859)
if not exists (select name from master.dbo.sysxlogins where name='slim')
EXEC master..sp_addlogin 'slim', @pwd, @sid = 0x3D26FAA8847CA4489C8FFA8AEACF698F, @encryptopt = 'skip_encryption_old'
 
-- Login: sloewen
SET @pwd = CONVERT (varchar(256), 0x2131214A212C40232A5B594F5F352244)
if not exists (select name from master.dbo.sysxlogins where name='sloewen')
EXEC master..sp_addlogin 'sloewen', @pwd, @sid = 0xB10DD47E6B84C9428DF3380C7B5DA355, @encryptopt = 'skip_encryption_old'
 
-- Login: slundie
SET @pwd = CONVERT (varchar(256), 0x2131214A2127374F34464E254D482123)
if not exists (select name from master.dbo.sysxlogins where name='slundie')
EXEC master..sp_addlogin 'slundie', @pwd, @sid = 0x7CC001F8FB5ACA40AEC8ADD08A96A52F, @encryptopt = 'skip_encryption_old'
 
-- Login: smacdona
SET @pwd = CONVERT (varchar(256), 0x2131214A21224046435F302B3D262B5B)
if not exists (select name from master.dbo.sysxlogins where name='smacdona')
EXEC master..sp_addlogin 'smacdona', @pwd, @sid = 0x5505C5746AA9FC4D9D6E53B73E527C8A, @encryptopt = 'skip_encryption_old'
 
-- Login: smahil
SET @pwd = CONVERT (varchar(256), 0x2131225B2534342F344F4A2D243D2F4E)
if not exists (select name from master.dbo.sysxlogins where name='smahil')
EXEC master..sp_addlogin 'smahil', @pwd, @sid = 0x9A821F660D3A9141A2A417CEEAB8C059, @encryptopt = 'skip_encryption_old'
 
-- Login: smcadam
if not exists (select name from master.dbo.sysxlogins where name='smcadam')
EXEC master..sp_addlogin 'smcadam', NULL, @sid = 0xC66A0082ED959F449C46223BC57C0A72, @encryptopt = 'skip_encryption_old'
 
-- Login: smcindoe
SET @pwd = CONVERT (varchar(256), 0x2131214A2121502C4A3E4D4A59345435)
if not exists (select name from master.dbo.sysxlogins where name='smcindoe')
EXEC master..sp_addlogin 'smcindoe', @pwd, @sid = 0x7F8C7F00C9E37149B962EAE7805493A9, @encryptopt = 'skip_encryption_old'
 
-- Login: smcnight
SET @pwd = CONVERT (varchar(256), 0x2131214A212D3E3A312B5B2243574A36)
if not exists (select name from master.dbo.sysxlogins where name='smcnight')
EXEC master..sp_addlogin 'smcnight', @pwd, @sid = 0xD4DBCCD175EB524AAC782916C8E0E2A0, @encryptopt = 'skip_encryption_old'
 
-- Login: smiller
SET @pwd = CONVERT (varchar(256), 0x2131214A2122524B4C3A5E473C375D2F)
if not exists (select name from master.dbo.sysxlogins where name='smiller')
EXEC master..sp_addlogin 'smiller', @pwd, @sid = 0xD9F1270F8457B84CA706EDE019F6177D, @encryptopt = 'skip_encryption_old'
 
-- Login: smonfared
SET @pwd = CONVERT (varchar(256), 0x21312442334B44223A5C5C5055313844)
if not exists (select name from master.dbo.sysxlogins where name='smonfared')
EXEC master..sp_addlogin 'smonfared', @pwd, @sid = 0x070C17CD505F30468AB38BFD249B6EE0, @encryptopt = 'skip_encryption_old'
 
-- Login: smonkman
SET @pwd = CONVERT (varchar(256), 0x2131214A2129593832335356333B4C32)
if not exists (select name from master.dbo.sysxlogins where name='smonkman')
EXEC master..sp_addlogin 'smonkman', @pwd, @sid = 0x17D52F3D76E6F04ABB0B07189AECB028, @encryptopt = 'skip_encryption_old'
 
-- Login: smoore2
if not exists (select name from master.dbo.sysxlogins where name='smoore2')
EXEC master..sp_addlogin 'smoore2', NULL, @sid = 0x5D289B56E0A35145AEFAC2387A5748AE, @encryptopt = 'skip_encryption_old'
 
-- Login: smsaling
SET @pwd = CONVERT (varchar(256), 0x21312353383C31302F36544C3244333A)
if not exists (select name from master.dbo.sysxlogins where name='smsaling')
EXEC master..sp_addlogin 'smsaling', @pwd, @sid = 0x9A66530463F9BA49B8090078A1AB2945, @encryptopt = 'skip_encryption_old'
 
-- Login: snahrebe
SET @pwd = CONVERT (varchar(256), 0x2131214A212E2829512958294B5D3B43)
if not exists (select name from master.dbo.sysxlogins where name='snahrebe')
EXEC master..sp_addlogin 'snahrebe', @pwd, @sid = 0x5CB7AEA01557DB4C9E7736421B31AEE2, @encryptopt = 'skip_encryption_old'
 
-- Login: snaidu
SET @pwd = CONVERT (varchar(256), 0x213121533A5F5E274B395A314A4D5D5E)
if not exists (select name from master.dbo.sysxlogins where name='snaidu')
EXEC master..sp_addlogin 'snaidu', @pwd, @sid = 0xC80AE00A53922B4B82BDFA91579A97D9, @encryptopt = 'skip_encryption_old'
 
-- Login: snewton
SET @pwd = CONVERT (varchar(256), 0x2131214B3A494A3636512A565C2F213D)
if not exists (select name from master.dbo.sysxlogins where name='snewton')
EXEC master..sp_addlogin 'snewton', @pwd, @sid = 0x95A6F3C42AD7434E8CC6BFB88804CD29, @encryptopt = 'skip_encryption_old'
 
-- Login: snielsen2
SET @pwd = CONVERT (varchar(256), 0x2131214A21295323493B36284252494B)
if not exists (select name from master.dbo.sysxlogins where name='snielsen2')
EXEC master..sp_addlogin 'snielsen2', @pwd, @sid = 0xC80C74FC0CF26C44B6D815AA9E36A35B, @encryptopt = 'skip_encryption_old'
 
-- Login: snoble
SET @pwd = CONVERT (varchar(256), 0x2131214A2128362257254F41454F4521)
if not exists (select name from master.dbo.sysxlogins where name='snoble')
EXEC master..sp_addlogin 'snoble', @pwd, @sid = 0xA8A02A965E5EAD45A655D8CC8F5EE00D, @encryptopt = 'skip_encryption_old'
 
-- Login: snoon
SET @pwd = CONVERT (varchar(256), 0x2131214A21225E5A57302140495C3A38)
if not exists (select name from master.dbo.sysxlogins where name='snoon')
EXEC master..sp_addlogin 'snoon', @pwd, @sid = 0x73F5934A18A23B47952549A235B24CDC, @encryptopt = 'skip_encryption_old'
 
-- Login: snuraney
SET @pwd = CONVERT (varchar(256), 0x2131214A212646384F293726603F5844)
if not exists (select name from master.dbo.sysxlogins where name='snuraney')
EXEC master..sp_addlogin 'snuraney', @pwd, @sid = 0xE61498963B4E4143A5FFA76EBC469CF9, @encryptopt = 'skip_encryption_old'
 
-- Login: sosborne
SET @pwd = CONVERT (varchar(256), 0x2131214A212559462B544F274E2A3752)
if not exists (select name from master.dbo.sysxlogins where name='sosborne')
EXEC master..sp_addlogin 'sosborne', @pwd, @sid = 0xAC8310A4FDF9FD4CA4CC269E17AF440B, @encryptopt = 'skip_encryption_old'
 
-- Login: sostapov
SET @pwd = CONVERT (varchar(256), 0x21312444225041382C3249505A2C4527)
if not exists (select name from master.dbo.sysxlogins where name='sostapov')
EXEC master..sp_addlogin 'sostapov', @pwd, @sid = 0x92F90E145E30C645BDCFCE15F2838383, @encryptopt = 'skip_encryption_old'
 
-- Login: soverton
SET @pwd = CONVERT (varchar(256), 0x2131244C213954254E5B53552A604230)
if not exists (select name from master.dbo.sysxlogins where name='soverton')
EXEC master..sp_addlogin 'soverton', @pwd, @sid = 0x41C623AE79A4E44FA66353B275B6BC6C, @encryptopt = 'skip_encryption_old'
 
-- Login: spellatt
SET @pwd = CONVERT (varchar(256), 0x2131214A212D3F535B533C2A214D335B)
if not exists (select name from master.dbo.sysxlogins where name='spellatt')
EXEC master..sp_addlogin 'spellatt', @pwd, @sid = 0x36846C77373EF54E96113AA3A4A9B383, @encryptopt = 'skip_encryption_old'
 
-- Login: spetitcler
SET @pwd = CONVERT (varchar(256), 0x2131214A212B292746252A3F54524631)
if not exists (select name from master.dbo.sysxlogins where name='spetitcler')
EXEC master..sp_addlogin 'spetitcler', @pwd, @sid = 0x2F7370AC2DF2DD40AAA4691AE4C08AD5, @encryptopt = 'skip_encryption_old'
 
-- Login: sprasad
SET @pwd = CONVERT (varchar(256), 0x2131214A21214335224741344D293E46)
if not exists (select name from master.dbo.sysxlogins where name='sprasad')
EXEC master..sp_addlogin 'sprasad', @pwd, @sid = 0xF29550356E417D48A4FE2E6203831870, @encryptopt = 'skip_encryption_old'
 
-- Login: srai
SET @pwd = CONVERT (varchar(256), 0x2131214A2125243846345A5340224A5C)
if not exists (select name from master.dbo.sysxlogins where name='srai')
EXEC master..sp_addlogin 'srai', @pwd, @sid = 0xAC795127BEFC034E90FF0AAC3AA402AF, @encryptopt = 'skip_encryption_old'
 
-- Login: srao
SET @pwd = CONVERT (varchar(256), 0x2131214A212E3A2859365425235C4542)
if not exists (select name from master.dbo.sysxlogins where name='srao')
EXEC master..sp_addlogin 'srao', @pwd, @sid = 0xC0AC2E9BFFBAB94F8D221FD40635E7BA, @encryptopt = 'skip_encryption_old'
 
-- Login: srea
SET @pwd = CONVERT (varchar(256), 0x2131214A212A565240535A35334D3360)
if not exists (select name from master.dbo.sysxlogins where name='srea')
EXEC master..sp_addlogin 'srea', @pwd, @sid = 0xDEC012D16EE42A4BA93609000DDA4F02, @encryptopt = 'skip_encryption_old'
 
-- Login: sreid
SET @pwd = CONVERT (varchar(256), 0x2131214A2123605B573C2B5A22552B5D)
if not exists (select name from master.dbo.sysxlogins where name='sreid')
EXEC master..sp_addlogin 'sreid', @pwd, @sid = 0x5A2F6031423D0D47870E7A8EAA8B4655, @encryptopt = 'skip_encryption_old'
 
-- Login: srekis
SET @pwd = CONVERT (varchar(256), 0x2131214A212E3D383E402D455325534C)
if not exists (select name from master.dbo.sysxlogins where name='srekis')
EXEC master..sp_addlogin 'srekis', @pwd, @sid = 0xF4EF335A52BFEF408B220A8168C7D60B, @encryptopt = 'skip_encryption_old'
 
-- Login: sremin
SET @pwd = CONVERT (varchar(256), 0x2131214A2126302624252D33573A312B)
if not exists (select name from master.dbo.sysxlogins where name='sremin')
EXEC master..sp_addlogin 'sremin', @pwd, @sid = 0x0C4DC26112B39642A02BA63A303D9788, @encryptopt = 'skip_encryption_old'
 
-- Login: srisdahl
SET @pwd = CONVERT (varchar(256), 0x2131245D3B523340285F3C42434C2749)
if not exists (select name from master.dbo.sysxlogins where name='srisdahl')
EXEC master..sp_addlogin 'srisdahl', @pwd, @sid = 0x247A592F9DCF8B4D89A869E525C0CB61, @encryptopt = 'skip_encryption_old'
 
-- Login: srodrigu
SET @pwd = CONVERT (varchar(256), 0x2131214A2128293A245C415434535C40)
if not exists (select name from master.dbo.sysxlogins where name='srodrigu')
EXEC master..sp_addlogin 'srodrigu', @pwd, @sid = 0x44536E77EF064645A257AC0C5C3A4338, @encryptopt = 'skip_encryption_old'
 
-- Login: srosenhe
SET @pwd = CONVERT (varchar(256), 0x2131214A212434545A474D3A5636212E)
if not exists (select name from master.dbo.sysxlogins where name='srosenhe')
EXEC master..sp_addlogin 'srosenhe', @pwd, @sid = 0x02898008DDA8B74EABA266AE8E65AEAE, @encryptopt = 'skip_encryption_old'
 
-- Login: ssandhu3
SET @pwd = CONVERT (varchar(256), 0x213124372C2350263A6032512341483B)
if not exists (select name from master.dbo.sysxlogins where name='ssandhu3')
EXEC master..sp_addlogin 'ssandhu3', @pwd, @sid = 0x701D0883CFE6A640B1EF618F5D3D617D, @encryptopt = 'skip_encryption_old'
 
-- Login: ssartori
SET @pwd = CONVERT (varchar(256), 0x2131214A21264F442C52413858593A33)
if not exists (select name from master.dbo.sysxlogins where name='ssartori')
EXEC master..sp_addlogin 'ssartori', @pwd, @sid = 0x224C6F269D929746AE48CE62C74E9307, @encryptopt = 'skip_encryption_old'
 
-- Login: sscott
SET @pwd = CONVERT (varchar(256), 0x213121433C393938393E383452215626)
if not exists (select name from master.dbo.sysxlogins where name='sscott')
EXEC master..sp_addlogin 'sscott', @pwd, @sid = 0xBAA9F651A74CCA48AE444478A28D391C, @encryptopt = 'skip_encryption_old'
 
-- Login: sshepherd
SET @pwd = CONVERT (varchar(256), 0x2131214A212C5735574227223E3F284B)
if not exists (select name from master.dbo.sysxlogins where name='sshepherd')
EXEC master..sp_addlogin 'sshepherd', @pwd, @sid = 0xBC069946DCAAA349A66A39B9C2BBDAEF, @encryptopt = 'skip_encryption_old'
 
-- Login: ssholomenk
SET @pwd = CONVERT (varchar(256), 0x2131214A2129594D344A27223E3F5D4A)
if not exists (select name from master.dbo.sysxlogins where name='ssholomenk')
EXEC master..sp_addlogin 'ssholomenk', @pwd, @sid = 0x34F33983A7DA724E8BC5CDCE5081E68C, @encryptopt = 'skip_encryption_old'
 
-- Login: ssin
SET @pwd = CONVERT (varchar(256), 0x213122403E472F5B574F565E28485839)
if not exists (select name from master.dbo.sysxlogins where name='ssin')
EXEC master..sp_addlogin 'ssin', @pwd, @sid = 0xC348C6748BF06A45847B5D1FA28F16A9, @encryptopt = 'skip_encryption_old'
 
-- Login: ssingh
SET @pwd = CONVERT (varchar(256), 0x2131214A2126414E5E5C374542322A51)
if not exists (select name from master.dbo.sysxlogins where name='ssingh')
EXEC master..sp_addlogin 'ssingh', @pwd, @sid = 0xA0425AEC8D998C49864CB755ABA6DCB0, @encryptopt = 'skip_encryption_old'
 
-- Login: sskipper
SET @pwd = CONVERT (varchar(256), 0x2131245527463644402C263B4233565B)
if not exists (select name from master.dbo.sysxlogins where name='sskipper')
EXEC master..sp_addlogin 'sskipper', @pwd, @sid = 0x220696B26F7E934A958877917720E954, @encryptopt = 'skip_encryption_old'
 
-- Login: sslavell
SET @pwd = CONVERT (varchar(256), 0x2131214A2130452E595B4C24295F242B)
if not exists (select name from master.dbo.sysxlogins where name='sslavell')
EXEC master..sp_addlogin 'sslavell', @pwd, @sid = 0xDF90371115ED4C49872F75D827349A7F, @encryptopt = 'skip_encryption_old'
 
-- Login: ssoon
SET @pwd = CONVERT (varchar(256), 0x2131214A21235C3547554D4522213E4F)
if not exists (select name from master.dbo.sysxlogins where name='ssoon')
EXEC master..sp_addlogin 'ssoon', @pwd, @sid = 0x4DB3803857B5B747934A9BA422BF229A, @encryptopt = 'skip_encryption_old'
 
-- Login: sspasoje
SET @pwd = CONVERT (varchar(256), 0x21312144332B605E282723293E403F4B)
if not exists (select name from master.dbo.sysxlogins where name='sspasoje')
EXEC master..sp_addlogin 'sspasoje', @pwd, @sid = 0x1CF48A33946C8E4784DFCFA87BA99308, @encryptopt = 'skip_encryption_old'
 
-- Login: sspier
SET @pwd = CONVERT (varchar(256), 0x2131214A2124314F33534F54313E5F34)
if not exists (select name from master.dbo.sysxlogins where name='sspier')
EXEC master..sp_addlogin 'sspier', @pwd, @sid = 0xF5402CA139DBD74686DA14804FB58321, @encryptopt = 'skip_encryption_old'
 
-- Login: sstanley
SET @pwd = CONVERT (varchar(256), 0x2131214A212E2E53485841444D602658)
if not exists (select name from master.dbo.sysxlogins where name='sstanley')
EXEC master..sp_addlogin 'sstanley', @pwd, @sid = 0x4303118D9344974C9DA737710C14ADA6, @encryptopt = 'skip_encryption_old'
 
-- Login: sstrelea
SET @pwd = CONVERT (varchar(256), 0x2131214A212B3126424926214D4B224E)
if not exists (select name from master.dbo.sysxlogins where name='sstrelea')
EXEC master..sp_addlogin 'sstrelea', @pwd, @sid = 0x1162FA7ADD3FF449A1D2A113391698E7, @encryptopt = 'skip_encryption_old'
 
-- Login: sszombathy
SET @pwd = CONVERT (varchar(256), 0x21312144332A4D25555D4757343C243A)
if not exists (select name from master.dbo.sysxlogins where name='sszombathy')
EXEC master..sp_addlogin 'sszombathy', @pwd, @sid = 0x210C52F916C38446ABE00E09CBF40548, @encryptopt = 'skip_encryption_old'
 
-- Login: stnoon
SET @pwd = CONVERT (varchar(256), 0x2131214A2123545D5044442B2E495240)
if not exists (select name from master.dbo.sysxlogins where name='stnoon')
EXEC master..sp_addlogin 'stnoon', @pwd, @sid = 0x1AEFEBC489FC6E47BAD1C28E3566BC26, @encryptopt = 'skip_encryption_old'
 
-- Login: stoakley
SET @pwd = CONVERT (varchar(256), 0x2131214A212F3E4E355E272433212B2B)
if not exists (select name from master.dbo.sysxlogins where name='stoakley')
EXEC master..sp_addlogin 'stoakley', @pwd, @sid = 0x6409F65D442AE940888867D044412FBF, @encryptopt = 'skip_encryption_old'
 
-- Login: subooth
SET @pwd = CONVERT (varchar(256), 0x213121232336322823324839563A305D)
if not exists (select name from master.dbo.sysxlogins where name='subooth')
EXEC master..sp_addlogin 'subooth', @pwd, @sid = 0xED56FBE74FE7DA42AD7EC4F79F5F72E0, @encryptopt = 'skip_encryption_old'
 
-- Login: suchrist
SET @pwd = CONVERT (varchar(256), 0x2131214A212E494D2A43545F59215850)
if not exists (select name from master.dbo.sysxlogins where name='suchrist')
EXEC master..sp_addlogin 'suchrist', @pwd, @sid = 0x44901DA0977EC749AEE5595C71D609CE, @encryptopt = 'skip_encryption_old'
 
-- Login: sugill
SET @pwd = CONVERT (varchar(256), 0x213122333B3F365E555F3A232130324A)
if not exists (select name from master.dbo.sysxlogins where name='sugill')
EXEC master..sp_addlogin 'sugill', @pwd, @sid = 0xF96916026974FA4595283A304FE1DE08, @encryptopt = 'skip_encryption_old'
 
-- Login: swade
SET @pwd = CONVERT (varchar(256), 0x2131214A212F49584952505530263B40)
if not exists (select name from master.dbo.sysxlogins where name='swade')
EXEC master..sp_addlogin 'swade', @pwd, @sid = 0x3774F713CE12FD4E85D675F56379F7A5, @encryptopt = 'skip_encryption_old'
 
-- Login: swalisse
SET @pwd = CONVERT (varchar(256), 0x2131214A212C31545C3D224D21573652)
if not exists (select name from master.dbo.sysxlogins where name='swalisse')
EXEC master..sp_addlogin 'swalisse', @pwd, @sid = 0xD0A382829733814D8C9DFEE9FDF0AAEA, @encryptopt = 'skip_encryption_old'
 
-- Login: swalters
SET @pwd = CONVERT (varchar(256), 0x2131235F27303B45385F3F5E505D5E28)
if not exists (select name from master.dbo.sysxlogins where name='swalters')
EXEC master..sp_addlogin 'swalters', @pwd, @sid = 0x82546A8B770EA048876790313C968D38, @encryptopt = 'skip_encryption_old'
 
-- Login: swark
SET @pwd = CONVERT (varchar(256), 0x2131214A212458294E3E3C4627603725)
if not exists (select name from master.dbo.sysxlogins where name='swark')
EXEC master..sp_addlogin 'swark', @pwd, @sid = 0x3FE385D519664A48905171DCD0872A8E, @encryptopt = 'skip_encryption_old'
 
-- Login: swaters
SET @pwd = CONVERT (varchar(256), 0x2131233B305D4335212C46282F564F2A)
if not exists (select name from master.dbo.sysxlogins where name='swaters')
EXEC master..sp_addlogin 'swaters', @pwd, @sid = 0x80C8C6C2D3EB2747886C191A14386546, @encryptopt = 'skip_encryption_old'
 
-- Login: swebb
SET @pwd = CONVERT (varchar(256), 0x2131214A212A532D363B29362F34313E)
if not exists (select name from master.dbo.sysxlogins where name='swebb')
EXEC master..sp_addlogin 'swebb', @pwd, @sid = 0x6C203EAFD0BFE3499B6E967D32A96183, @encryptopt = 'skip_encryption_old'
 
-- Login: swilson
SET @pwd = CONVERT (varchar(256), 0x213123332E304842234E29385C2A494A)
if not exists (select name from master.dbo.sysxlogins where name='swilson')
EXEC master..sp_addlogin 'swilson', @pwd, @sid = 0x36B50ACDD154DF48BF4E642B7C7B270B, @encryptopt = 'skip_encryption_old'
 
-- Login: swinnian
SET @pwd = CONVERT (varchar(256), 0x21312144332D54393C2F5D355A353C21)
if not exists (select name from master.dbo.sysxlogins where name='swinnian')
EXEC master..sp_addlogin 'swinnian', @pwd, @sid = 0xBD7B7EEDE0F7B441A6D2C529967D04CD, @encryptopt = 'skip_encryption_old'
 
-- Login: swinniandy
SET @pwd = CONVERT (varchar(256), 0x2131214A21293D495C4E244442372C24)
if not exists (select name from master.dbo.sysxlogins where name='swinniandy')
EXEC master..sp_addlogin 'swinniandy', @pwd, @sid = 0xA89213C1D199CC4AA7124BC60B60988A, @encryptopt = 'skip_encryption_old'
 
-- Login: tasher
SET @pwd = CONVERT (varchar(256), 0x2131224725595453593D39563D383525)
if not exists (select name from master.dbo.sysxlogins where name='tasher')
EXEC master..sp_addlogin 'tasher', @pwd, @sid = 0xA8064C561B624A499A05BA17DBEF19C1, @encryptopt = 'skip_encryption_old'
 
-- Login: tbeamish
SET @pwd = CONVERT (varchar(256), 0x2131214A21304226212B274850492D4B)
if not exists (select name from master.dbo.sysxlogins where name='tbeamish')
EXEC master..sp_addlogin 'tbeamish', @pwd, @sid = 0x2E4EAD295D65894E819649882F0022FD, @encryptopt = 'skip_encryption_old'
 
-- Login: tbonner
SET @pwd = CONVERT (varchar(256), 0x2131214A212E52263339505538392548)
if not exists (select name from master.dbo.sysxlogins where name='tbonner')
EXEC master..sp_addlogin 'tbonner', @pwd, @sid = 0x14E13AD3D1CC0B4B9EEB00C541114F29, @encryptopt = 'skip_encryption_old'
 
-- Login: tbuseniu
SET @pwd = CONVERT (varchar(256), 0x2131214433222957525C4347594D3E32)
if not exists (select name from master.dbo.sysxlogins where name='tbuseniu')
EXEC master..sp_addlogin 'tbuseniu', @pwd, @sid = 0x15C76A90427F6545925AF28409BDEF49, @encryptopt = 'skip_encryption_old'
 
-- Login: tcederberg
SET @pwd = CONVERT (varchar(256), 0x2131214A212F5D3B215833225F293356)
if not exists (select name from master.dbo.sysxlogins where name='tcederberg')
EXEC master..sp_addlogin 'tcederberg', @pwd, @sid = 0x71D0BC2AACE60844B2F16E3D4C11013E, @encryptopt = 'skip_encryption_old'
 
-- Login: tchivers
SET @pwd = CONVERT (varchar(256), 0x21312144332E5B4F3E352E5B4E392946)
if not exists (select name from master.dbo.sysxlogins where name='tchivers')
EXEC master..sp_addlogin 'tchivers', @pwd, @sid = 0xDEA1C570AD294043A533F01B71C69026, @encryptopt = 'skip_encryption_old'
 
-- Login: tcooper
SET @pwd = CONVERT (varchar(256), 0x2131214433232C265C30272156415C3F)
if not exists (select name from master.dbo.sysxlogins where name='tcooper')
EXEC master..sp_addlogin 'tcooper', @pwd, @sid = 0x33D7D24808AB964AB33F67A33B86F970, @encryptopt = 'skip_encryption_old'
 
-- Login: tcorr
SET @pwd = CONVERT (varchar(256), 0x2131214A21302B36582544504F5B3526)
if not exists (select name from master.dbo.sysxlogins where name='tcorr')
EXEC master..sp_addlogin 'tcorr', @pwd, @sid = 0x275A64B550DF974ABF33F0C7F9C8853B, @encryptopt = 'skip_encryption_old'
 
-- Login: tcroucher
SET @pwd = CONVERT (varchar(256), 0x2131214A212A5F2F56375E21283F3753)
if not exists (select name from master.dbo.sysxlogins where name='tcroucher')
EXEC master..sp_addlogin 'tcroucher', @pwd, @sid = 0x1A3F8AE45149E043B173DD3F0D1248DD, @encryptopt = 'skip_encryption_old'
 
-- Login: tcurren
SET @pwd = CONVERT (varchar(256), 0x2131214A21282D4A362523462F4F3651)
if not exists (select name from master.dbo.sysxlogins where name='tcurren')
EXEC master..sp_addlogin 'tcurren', @pwd, @sid = 0xC6113935F488734C83BA077FD22D337E, @encryptopt = 'skip_encryption_old'
 
-- Login: tdeis
SET @pwd = CONVERT (varchar(256), 0x2131214A212F214B4345383F303E253F)
if not exists (select name from master.dbo.sysxlogins where name='tdeis')
EXEC master..sp_addlogin 'tdeis', @pwd, @sid = 0xA2DE3680B0FADE4C82C92C74A7787727, @encryptopt = 'skip_encryption_old'
 
-- Login: tdepape
SET @pwd = CONVERT (varchar(256), 0x2131214A212435462E5241382E225655)
if not exists (select name from master.dbo.sysxlogins where name='tdepape')
EXEC master..sp_addlogin 'tdepape', @pwd, @sid = 0x0B30E489F2599647942B7FDE20F6E3A6, @encryptopt = 'skip_encryption_old'
 
-- Login: tdhanda
SET @pwd = CONVERT (varchar(256), 0x2131235F272D3D27565022292A2B3E4D)
if not exists (select name from master.dbo.sysxlogins where name='tdhanda')
EXEC master..sp_addlogin 'tdhanda', @pwd, @sid = 0x4B60E1424322504F9C9F0E5932A9BA9A, @encryptopt = 'skip_encryption_old'
 
-- Login: tdibitet
SET @pwd = CONVERT (varchar(256), 0x2131214A21242D4B5E58253D4558373D)
if not exists (select name from master.dbo.sysxlogins where name='tdibitet')
EXEC master..sp_addlogin 'tdibitet', @pwd, @sid = 0x567BDBC9E4D00D4180FA2423FE0388B9, @encryptopt = 'skip_encryption_old'
 
-- Login: tdowning
SET @pwd = CONVERT (varchar(256), 0x2131214A2130545950582A372939374B)
if not exists (select name from master.dbo.sysxlogins where name='tdowning')
EXEC master..sp_addlogin 'tdowning', @pwd, @sid = 0x6548C3897C4F364A9528FA9D393537C7, @encryptopt = 'skip_encryption_old'
 
-- Login: tdyer
SET @pwd = CONVERT (varchar(256), 0x21312144332B2B58254B37254A5A2C44)
if not exists (select name from master.dbo.sysxlogins where name='tdyer')
EXEC master..sp_addlogin 'tdyer', @pwd, @sid = 0x567640CDA5DF094B9CB7B256DAF713B3, @encryptopt = 'skip_encryption_old'
 
-- Login: testuser
if not exists (select name from master.dbo.sysxlogins where name='testuser')
EXEC master..sp_addlogin 'testuser', NULL, @sid = 0x523DB566A2228240BDCEAB6608585901, @encryptopt = 'skip_encryption_old'
 
-- Login: tferraro
SET @pwd = CONVERT (varchar(256), 0x2131214A21232E5138523C4C59594D2D)
if not exists (select name from master.dbo.sysxlogins where name='tferraro')
EXEC master..sp_addlogin 'tferraro', @pwd, @sid = 0x95FA360F642705479C9444272997730C, @encryptopt = 'skip_encryption_old'
 
-- Login: tgoss
SET @pwd = CONVERT (varchar(256), 0x2131214A212B4E214A48465129296032)
if not exists (select name from master.dbo.sysxlogins where name='tgoss')
EXEC master..sp_addlogin 'tgoss', @pwd, @sid = 0x4A59E6C2DA7BF64CAF867640D390C0D6, @encryptopt = 'skip_encryption_old'
 
-- Login: thilton
SET @pwd = CONVERT (varchar(256), 0x2131214A2121275229363D3F4F5E5231)
if not exists (select name from master.dbo.sysxlogins where name='thilton')
EXEC master..sp_addlogin 'thilton', @pwd, @sid = 0x80810C8BC8A9714AA9982A49644A6F5E, @encryptopt = 'skip_encryption_old'
 
-- Login: tkennedy
SET @pwd = CONVERT (varchar(256), 0x21312358343C555242334C4350342251)
if not exists (select name from master.dbo.sysxlogins where name='tkennedy')
EXEC master..sp_addlogin 'tkennedy', @pwd, @sid = 0xF0C970D92B271940A64E8F18FAC4BE06, @encryptopt = 'skip_encryption_old'
 
-- Login: tleduc
SET @pwd = CONVERT (varchar(256), 0x2131214A212432603621432851214A51)
if not exists (select name from master.dbo.sysxlogins where name='tleduc')
EXEC master..sp_addlogin 'tleduc', @pwd, @sid = 0xE2251BEDCF59064AB75062D9C51A4216, @encryptopt = 'skip_encryption_old'
 
-- Login: tlew
SET @pwd = CONVERT (varchar(256), 0x213123253A54544C4A594B4D365D5C39)
if not exists (select name from master.dbo.sysxlogins where name='tlew')
EXEC master..sp_addlogin 'tlew', @pwd, @sid = 0x2115397532A3494BB05441EEBEB38A25, @encryptopt = 'skip_encryption_old'
 
-- Login: tlkent
SET @pwd = CONVERT (varchar(256), 0x2131214A212A4D2E30422C3D523D503D)
if not exists (select name from master.dbo.sysxlogins where name='tlkent')
EXEC master..sp_addlogin 'tlkent', @pwd, @sid = 0x169652F196F05443AE517BA50A1F20CF, @encryptopt = 'skip_encryption_old'
 
-- Login: tlund
SET @pwd = CONVERT (varchar(256), 0x2131214A212C4E3A2E315B59463C2233)
if not exists (select name from master.dbo.sysxlogins where name='tlund')
EXEC master..sp_addlogin 'tlund', @pwd, @sid = 0xE22560C5EBEF7743AA2239453DFB05CB, @encryptopt = 'skip_encryption_old'
 
-- Login: tmanson
SET @pwd = CONVERT (varchar(256), 0x2131214A2123595F4D402644395B3338)
if not exists (select name from master.dbo.sysxlogins where name='tmanson')
EXEC master..sp_addlogin 'tmanson', @pwd, @sid = 0xD9CD8096E5748846929E442A28437ABF, @encryptopt = 'skip_encryption_old'
 
-- Login: tmarshall
SET @pwd = CONVERT (varchar(256), 0x2131214A21274D363A425C404E414146)
if not exists (select name from master.dbo.sysxlogins where name='tmarshall')
EXEC master..sp_addlogin 'tmarshall', @pwd, @sid = 0xFBBCED057C38D147AD1C554C96DA829B, @encryptopt = 'skip_encryption_old'
 
-- Login: tmcqueen
SET @pwd = CONVERT (varchar(256), 0x21312133304E5D362F4F314758213B57)
if not exists (select name from master.dbo.sysxlogins where name='tmcqueen')
EXEC master..sp_addlogin 'tmcqueen', @pwd, @sid = 0xC6D3E20F5F5E9A47921E1AD75FFDE48F, @encryptopt = 'skip_encryption_old'
 
-- Login: tmurrell
SET @pwd = CONVERT (varchar(256), 0x213121443323592E365635434F45353C)
if not exists (select name from master.dbo.sysxlogins where name='tmurrell')
EXEC master..sp_addlogin 'tmurrell', @pwd, @sid = 0x7FB16EFF4167E54889A79117C4661A04, @encryptopt = 'skip_encryption_old'
 
-- Login: tnguyen
SET @pwd = CONVERT (varchar(256), 0x2131214A21225A25362F60543E232D4E)
if not exists (select name from master.dbo.sysxlogins where name='tnguyen')
EXEC master..sp_addlogin 'tnguyen', @pwd, @sid = 0x7F1A38575A35814BBF54DC568E622066, @encryptopt = 'skip_encryption_old'
 
-- Login: tniedjal
SET @pwd = CONVERT (varchar(256), 0x2131214A212D414E5D265D4F6052463E)
if not exists (select name from master.dbo.sysxlogins where name='tniedjal')
EXEC master..sp_addlogin 'tniedjal', @pwd, @sid = 0xFEC7068B510B694EAA704284DCE22CC4, @encryptopt = 'skip_encryption_old'
 
-- Login: tobrien
SET @pwd = CONVERT (varchar(256), 0x2131214A2125383F22595A5F5925332D)
if not exists (select name from master.dbo.sysxlogins where name='tobrien')
EXEC master..sp_addlogin 'tobrien', @pwd, @sid = 0x1AB7E547456A92438C560881C913226A, @encryptopt = 'skip_encryption_old'
 
-- Login: tparsons
SET @pwd = CONVERT (varchar(256), 0x2131214A2126274C5A2F3D285D246041)
if not exists (select name from master.dbo.sysxlogins where name='tparsons')
EXEC master..sp_addlogin 'tparsons', @pwd, @sid = 0xF59872EE7781D74EA11503D7735FF405, @encryptopt = 'skip_encryption_old'
 
-- Login: tparsons2
SET @pwd = CONVERT (varchar(256), 0x2131214A21222454485B592F22502C24)
if not exists (select name from master.dbo.sysxlogins where name='tparsons2')
EXEC master..sp_addlogin 'tparsons2', @pwd, @sid = 0x6989FAF3913A9E4FA3B22F629E62E017, @encryptopt = 'skip_encryption_old'
 
-- Login: tpeterse
SET @pwd = CONVERT (varchar(256), 0x2131214A2124225B2C5D53463A503E48)
if not exists (select name from master.dbo.sysxlogins where name='tpeterse')
EXEC master..sp_addlogin 'tpeterse', @pwd, @sid = 0xB57EA5ED581D644D91244A1E87A39D12, @encryptopt = 'skip_encryption_old'
 
-- Login: tphillip
SET @pwd = CONVERT (varchar(256), 0x213124523C3F423D552F225E5934585D)
if not exists (select name from master.dbo.sysxlogins where name='tphillip')
EXEC master..sp_addlogin 'tphillip', @pwd, @sid = 0x5495C248BDFFF74BB9A9E29CADD430B7, @encryptopt = 'skip_encryption_old'
 
-- Login: treed
SET @pwd = CONVERT (varchar(256), 0x2131224D234B4A4630475C31595F2C2E)
if not exists (select name from master.dbo.sysxlogins where name='treed')
EXEC master..sp_addlogin 'treed', @pwd, @sid = 0xBBF7C5F262ED5041AB437620D37DEF82, @encryptopt = 'skip_encryption_old'
 
-- Login: trogers
SET @pwd = CONVERT (varchar(256), 0x2131214A212C3F34532B255F5B292335)
if not exists (select name from master.dbo.sysxlogins where name='trogers')
EXEC master..sp_addlogin 'trogers', @pwd, @sid = 0xEDA0202420DC634F82A2ED2743ED1312, @encryptopt = 'skip_encryption_old'
 
-- Login: tsawchyn
SET @pwd = CONVERT (varchar(256), 0x2131214A212460453A22235630524852)
if not exists (select name from master.dbo.sysxlogins where name='tsawchyn')
EXEC master..sp_addlogin 'tsawchyn', @pwd, @sid = 0x10E372F1B59E654D939762B499CFA8EC, @encryptopt = 'skip_encryption_old'
 
-- Login: tseverin
SET @pwd = CONVERT (varchar(256), 0x2131214A212F52504B4427572E544A4D)
if not exists (select name from master.dbo.sysxlogins where name='tseverin')
EXEC master..sp_addlogin 'tseverin', @pwd, @sid = 0x35B7533C2542314DBDFAB60AF725AC7C, @encryptopt = 'skip_encryption_old'
 
-- Login: tshort
SET @pwd = CONVERT (varchar(256), 0x2131214A212B4E49373B43572D543F5C)
if not exists (select name from master.dbo.sysxlogins where name='tshort')
EXEC master..sp_addlogin 'tshort', @pwd, @sid = 0xEDCA0D55489ADE4D9645473BF066C74A, @encryptopt = 'skip_encryption_old'
 
-- Login: tsmaruj
SET @pwd = CONVERT (varchar(256), 0x213124313B325F3B433F2F2D223D5A45)
if not exists (select name from master.dbo.sysxlogins where name='tsmaruj')
EXEC master..sp_addlogin 'tsmaruj', @pwd, @sid = 0x9D9B26A0BA080E48BE7E4DEE24EFA090, @encryptopt = 'skip_encryption_old'
 
-- Login: tstanyer
SET @pwd = CONVERT (varchar(256), 0x2131214A212D254E5B57424B3A2E3632)
if not exists (select name from master.dbo.sysxlogins where name='tstanyer')
EXEC master..sp_addlogin 'tstanyer', @pwd, @sid = 0xABC1409FCFD6FC4A8961134E34EB3378, @encryptopt = 'skip_encryption_old'
 
-- Login: tvkim
SET @pwd = CONVERT (varchar(256), 0x2131214A2124322A4F3948362F45253B)
if not exists (select name from master.dbo.sysxlogins where name='tvkim')
EXEC master..sp_addlogin 'tvkim', @pwd, @sid = 0xD9FE0CE9BF00F642B9D6409E92085BAA, @encryptopt = 'skip_encryption_old'
 
-- Login: twhitema
SET @pwd = CONVERT (varchar(256), 0x213123253A584D44545B4A4C37552847)
if not exists (select name from master.dbo.sysxlogins where name='twhitema')
EXEC master..sp_addlogin 'twhitema', @pwd, @sid = 0xE2A2C87954489F4D8CB9378AB80F1352, @encryptopt = 'skip_encryption_old'
 
-- Login: tyang2
SET @pwd = CONVERT (varchar(256), 0x2131214A212E472E52534B525D2F3048)
if not exists (select name from master.dbo.sysxlogins where name='tyang2')
EXEC master..sp_addlogin 'tyang2', @pwd, @sid = 0xC334FA57BC7B86499F16328222E393DE, @encryptopt = 'skip_encryption_old'
 
-- Login: tyule
SET @pwd = CONVERT (varchar(256), 0x2131214A21244A32565724585B3C6048)
if not exists (select name from master.dbo.sysxlogins where name='tyule')
EXEC master..sp_addlogin 'tyule', @pwd, @sid = 0x113E2BE793D4EE4C9F63AB4CE5EFAD21, @encryptopt = 'skip_encryption_old'
 
-- Login: ulee
SET @pwd = CONVERT (varchar(256), 0x213121252D2D4D5D6030543C51463025)
if not exists (select name from master.dbo.sysxlogins where name='ulee')
EXEC master..sp_addlogin 'ulee', @pwd, @sid = 0x29F00D046C0D8D4EA0A630B5B0C76B7C, @encryptopt = 'skip_encryption_old'
 
-- Login: umacdona
SET @pwd = CONVERT (varchar(256), 0x2131243A252C3141472D41442F4F2B26)
if not exists (select name from master.dbo.sysxlogins where name='umacdona')
EXEC master..sp_addlogin 'umacdona', @pwd, @sid = 0x395FBA13473C9F40A2E88337A2F07278, @encryptopt = 'skip_encryption_old'
 
-- Login: valie
SET @pwd = CONVERT (varchar(256), 0x2131214A21294E3F3F4A593926493B33)
if not exists (select name from master.dbo.sysxlogins where name='valie')
EXEC master..sp_addlogin 'valie', @pwd, @sid = 0x0B85FEEE18AC9044818B6DD1AB875AEE, @encryptopt = 'skip_encryption_old'
 
-- Login: vbearder
SET @pwd = CONVERT (varchar(256), 0x213121333A3D325B292F594021334934)
if not exists (select name from master.dbo.sysxlogins where name='vbearder')
EXEC master..sp_addlogin 'vbearder', @pwd, @sid = 0xEF553980A8934148B20D8E2F367B6962, @encryptopt = 'skip_encryption_old'
 
-- Login: vbonner
SET @pwd = CONVERT (varchar(256), 0x2131242D2446402E5E223E2855212B22)
if not exists (select name from master.dbo.sysxlogins where name='vbonner')
EXEC master..sp_addlogin 'vbonner', @pwd, @sid = 0x2DB6FAE1C0102A40B2847976ACB107F4, @encryptopt = 'skip_encryption_old'
 
-- Login: vbrown
SET @pwd = CONVERT (varchar(256), 0x213124522D2F56303B5E4B3B27584A3D)
if not exists (select name from master.dbo.sysxlogins where name='vbrown')
EXEC master..sp_addlogin 'vbrown', @pwd, @sid = 0x8939799FBB9E3E4084B37075D0F9E6C4, @encryptopt = 'skip_encryption_old'
 
-- Login: vcormack
SET @pwd = CONVERT (varchar(256), 0x213123482D27334B3848233039553930)
if not exists (select name from master.dbo.sysxlogins where name='vcormack')
EXEC master..sp_addlogin 'vcormack', @pwd, @sid = 0xE7568A9284F5B340AC4FD691F5F7DC78, @encryptopt = 'skip_encryption_old'
 
-- Login: vdent
if not exists (select name from master.dbo.sysxlogins where name='vdent')
EXEC master..sp_addlogin 'vdent', NULL, @sid = 0x730E93082481D9419D287604B8DBE7E2, @encryptopt = 'skip_encryption_old'
 
-- Login: vdixon
SET @pwd = CONVERT (varchar(256), 0x2131214A2122462E4D375A412A345D57)
if not exists (select name from master.dbo.sysxlogins where name='vdixon')
EXEC master..sp_addlogin 'vdixon', @pwd, @sid = 0xCBC6D7E799E6C644A91696B14275A8DE, @encryptopt = 'skip_encryption_old'
 
-- Login: vdzelali
SET @pwd = CONVERT (varchar(256), 0x2131214A212D26405C5D543A5E49512B)
if not exists (select name from master.dbo.sysxlogins where name='vdzelali')
EXEC master..sp_addlogin 'vdzelali', @pwd, @sid = 0x146AA7979839B94AA0D5C6EEF50CC41A, @encryptopt = 'skip_encryption_old'
 
-- Login: vgoutsou
SET @pwd = CONVERT (varchar(256), 0x2131214A21276045322B5F4726412534)
if not exists (select name from master.dbo.sysxlogins where name='vgoutsou')
EXEC master..sp_addlogin 'vgoutsou', @pwd, @sid = 0xBFD79BF79AAA924DBB148F9E17745146, @encryptopt = 'skip_encryption_old'
 
-- Login: vholme
SET @pwd = CONVERT (varchar(256), 0x2131214A213023552B5221543D373728)
if not exists (select name from master.dbo.sysxlogins where name='vholme')
EXEC master..sp_addlogin 'vholme', @pwd, @sid = 0xDD9C93F4127FA64B9485147D54689FE3, @encryptopt = 'skip_encryption_old'
 
-- Login: vipharm
SET @pwd = CONVERT (varchar(256), 0x2131235F27245A393933443360532831)
if not exists (select name from master.dbo.sysxlogins where name='vipharm')
EXEC master..sp_addlogin 'vipharm', @pwd, @sid = 0xC79B25395A5BDD4B9FDA24F8C9F31D11, @encryptopt = 'skip_encryption_old'
 
-- Login: vmann
SET @pwd = CONVERT (varchar(256), 0x2131214A212245404A21214851413823)
if not exists (select name from master.dbo.sysxlogins where name='vmann')
EXEC master..sp_addlogin 'vmann', @pwd, @sid = 0x3BE2B00A99F21544A553E8FCCB9132A7, @encryptopt = 'skip_encryption_old'
 
-- Login: vpaolini
SET @pwd = CONVERT (varchar(256), 0x2131214A212E4B38434A354E4B60394D)
if not exists (select name from master.dbo.sysxlogins where name='vpaolini')
EXEC master..sp_addlogin 'vpaolini', @pwd, @sid = 0xE17F767C8F636F4A91854F4EC08DE290, @encryptopt = 'skip_encryption_old'
 
-- Login: vrizzo
SET @pwd = CONVERT (varchar(256), 0x213123253A5429583C4D5E414E525D60)
if not exists (select name from master.dbo.sysxlogins where name='vrizzo')
EXEC master..sp_addlogin 'vrizzo', @pwd, @sid = 0xE973D9AF1ADEB148B043B45C517C2E13, @encryptopt = 'skip_encryption_old'
 
-- Login: vrussell
SET @pwd = CONVERT (varchar(256), 0x2131214A2127602750505D2338442E39)
if not exists (select name from master.dbo.sysxlogins where name='vrussell')
EXEC master..sp_addlogin 'vrussell', @pwd, @sid = 0x04F6022AA960C44FBE4030555CA809F6, @encryptopt = 'skip_encryption_old'
 
-- Login: vss3315_user
if not exists (select name from master.dbo.sysxlogins where name='vss3315_user')
EXEC master..sp_addlogin 'vss3315_user', NULL, @sid = 0xFFB47AA808323945A8CC815826E117DD, @encryptopt = 'skip_encryption_old'
 
-- Login: vstark
SET @pwd = CONVERT (varchar(256), 0x2131243032505532442B31592753604F)
if not exists (select name from master.dbo.sysxlogins where name='vstark')
EXEC master..sp_addlogin 'vstark', @pwd, @sid = 0x586118B0F48B1142B6308B1E8A95931B, @encryptopt = 'skip_encryption_old'
 
-- Login: vvijay
SET @pwd = CONVERT (varchar(256), 0x2131233C3745214F42382E23333D3A42)
if not exists (select name from master.dbo.sysxlogins where name='vvijay')
EXEC master..sp_addlogin 'vvijay', @pwd, @sid = 0x20ACE84BB2F0724B9B55D29227050905, @encryptopt = 'skip_encryption_old'
 
-- Login: vwalker
SET @pwd = CONVERT (varchar(256), 0x2131214923414954505625485E47232E)
if not exists (select name from master.dbo.sysxlogins where name='vwalker')
EXEC master..sp_addlogin 'vwalker', @pwd, @sid = 0x04A9BF7DF7A33F439710675F1FDF0E29, @encryptopt = 'skip_encryption_old'
 
-- Login: watsonb
SET @pwd = CONVERT (varchar(256), 0x2131214A21304F5A3557332B323C5A51)
if not exists (select name from master.dbo.sysxlogins where name='watsonb')
EXEC master..sp_addlogin 'watsonb', @pwd, @sid = 0x8B8D84760384934AACE65324CE46F53D, @encryptopt = 'skip_encryption_old'
 
-- Login: wjfourie
SET @pwd = CONVERT (varchar(256), 0x2131214A212C2838404B3C41313E4430)
if not exists (select name from master.dbo.sysxlogins where name='wjfourie')
EXEC master..sp_addlogin 'wjfourie', @pwd, @sid = 0x501C3745FC681D4F9BB0DC3BF90C8715, @encryptopt = 'skip_encryption_old'
 
-- Login: wkearns
SET @pwd = CONVERT (varchar(256), 0x2131214A212B3639542C47342B312F4E)
if not exists (select name from master.dbo.sysxlogins where name='wkearns')
EXEC master..sp_addlogin 'wkearns', @pwd, @sid = 0xB7A645BE3021A146B1D10D6896F99538, @encryptopt = 'skip_encryption_old'
 
-- Login: wkerr
SET @pwd = CONVERT (varchar(256), 0x2131214A212A3D2323564439592D422A)
if not exists (select name from master.dbo.sysxlogins where name='wkerr')
EXEC master..sp_addlogin 'wkerr', @pwd, @sid = 0x4D73DF9D061F2146B7819E7E087C5EDE, @encryptopt = 'skip_encryption_old'
 
-- Login: wkwan
SET @pwd = CONVERT (varchar(256), 0x2131243235402F562D455F5C4C28453C)
if not exists (select name from master.dbo.sysxlogins where name='wkwan')
EXEC master..sp_addlogin 'wkwan', @pwd, @sid = 0xCF7B25FA2BDBA64D9FF824844CBD5B29, @encryptopt = 'skip_encryption_old'
 
-- Login: wmackinnon
SET @pwd = CONVERT (varchar(256), 0x2131224A3C343E2C42235D4834342C5D)
if not exists (select name from master.dbo.sysxlogins where name='wmackinnon')
EXEC master..sp_addlogin 'wmackinnon', @pwd, @sid = 0x17DC9991E90148469266A18CDBB22206, @encryptopt = 'skip_encryption_old'
 
-- Login: wmartin2
SET @pwd = CONVERT (varchar(256), 0x2131235F27284F2E2A41264F5434423D)
if not exists (select name from master.dbo.sysxlogins where name='wmartin2')
EXEC master..sp_addlogin 'wmartin2', @pwd, @sid = 0x00545E01A727BF498264E71716DFE16A, @encryptopt = 'skip_encryption_old'
 
-- Login: wmartyn
SET @pwd = CONVERT (varchar(256), 0x2131212A323C4A2521274740462C3052)
if not exists (select name from master.dbo.sysxlogins where name='wmartyn')
EXEC master..sp_addlogin 'wmartyn', @pwd, @sid = 0x27CCF5C3E864884CA916DA5759C6699B, @encryptopt = 'skip_encryption_old'
 
-- Login: wooms
SET @pwd = CONVERT (varchar(256), 0x2131214A212B47364B3C39502D4B5D5A)
if not exists (select name from master.dbo.sysxlogins where name='wooms')
EXEC master..sp_addlogin 'wooms', @pwd, @sid = 0xA668ABDBAE9F414BB2425575F3568EC2, @encryptopt = 'skip_encryption_old'
 
-- Login: wsim
SET @pwd = CONVERT (varchar(256), 0x213124323F40245E36362B3B5C305D59)
if not exists (select name from master.dbo.sysxlogins where name='wsim')
EXEC master..sp_addlogin 'wsim', @pwd, @sid = 0xC332D4990B26D5429AEAD2BA095AC05F, @encryptopt = 'skip_encryption_old'
 
-- Login: wvos
SET @pwd = CONVERT (varchar(256), 0x2131214A21255959304F295D4528295E)
if not exists (select name from master.dbo.sysxlogins where name='wvos')
EXEC master..sp_addlogin 'wvos', @pwd, @sid = 0x3E58FA70AD898F44B03CA997C6577038, @encryptopt = 'skip_encryption_old'
 
-- Login: xanadoo
SET @pwd = CONVERT (varchar(256), 0x2131242E38233D4C4756392352305D5D)
if not exists (select name from master.dbo.sysxlogins where name='xanadoo')
EXEC master..sp_addlogin 'xanadoo', @pwd, @sid = 0x7259BF307AC60941AF5F7C2DE446D8E0, @encryptopt = 'skip_encryption_old'
 
-- Login: ymacarth
SET @pwd = CONVERT (varchar(256), 0x21312247243E4F4033535D4B4D2C5C2E)
if not exists (select name from master.dbo.sysxlogins where name='ymacarth')
EXEC master..sp_addlogin 'ymacarth', @pwd, @sid = 0xCF9F306AC0F23E4F9D44E252913B3C96, @encryptopt = 'skip_encryption_old'
 
-- Login: ymccombe
SET @pwd = CONVERT (varchar(256), 0x2131215A2C475D424E4A2A29304A2142)
if not exists (select name from master.dbo.sysxlogins where name='ymccombe')
EXEC master..sp_addlogin 'ymccombe', @pwd, @sid = 0x247B0AE2DDB1C54D97104F4088556C5A, @encryptopt = 'skip_encryption_old'
 
-- Login: ymiller3
SET @pwd = CONVERT (varchar(256), 0x2131235F27304F2D393B233350432E5E)
if not exists (select name from master.dbo.sysxlogins where name='ymiller3')
EXEC master..sp_addlogin 'ymiller3', @pwd, @sid = 0x68F118ABAEBCD344A1301618B81ECB91, @encryptopt = 'skip_encryption_old'
 
-- Login: ystarchu
SET @pwd = CONVERT (varchar(256), 0x2131212E2A4B4B233D2B605556515554)
if not exists (select name from master.dbo.sysxlogins where name='ystarchu')
EXEC master..sp_addlogin 'ystarchu', @pwd, @sid = 0x344A48CFCADC194AB2C844FAAC19ACFA, @encryptopt = 'skip_encryption_old'
 
-- Login: zburgelis
SET @pwd = CONVERT (varchar(256), 0x2131214A21243C5E3B2F47453D443B3E)
if not exists (select name from master.dbo.sysxlogins where name='zburgelis')
EXEC master..sp_addlogin 'zburgelis', @pwd, @sid = 0xC8955C251171C5499D10730F004529DD, @encryptopt = 'skip_encryption_old'
 
-- Login: zcihlar
SET @pwd = CONVERT (varchar(256), 0x2131214A2124405A233D4D2F255D535C)
if not exists (select name from master.dbo.sysxlogins where name='zcihlar')
EXEC master..sp_addlogin 'zcihlar', @pwd, @sid = 0x264FB5268B6159448AEE592F56030C6B, @encryptopt = 'skip_encryption_old'
 
-- Login: zlalani2
SET @pwd = CONVERT (varchar(256), 0x2131214A21252156444E5F3031253334)
if not exists (select name from master.dbo.sysxlogins where name='zlalani2')
EXEC master..sp_addlogin 'zlalani2', @pwd, @sid = 0x197389BA12A55C44BBC0B5AC334D6633, @encryptopt = 'skip_encryption_old'
