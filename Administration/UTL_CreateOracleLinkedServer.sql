 EXEC sp_addlinkedserver 
  'OracleLinkedServer_2', 'Oracle', 
  'MSDAORA', 'EMPATH_WAGNER' 
P1: Linked server name
P2,P3: fixed
P4: service name

EXEC sp_addlinkedsrvlogin 
'OracleLinkedServer_2', false, 
  null, 'system',  '<password>' 
P1: Linked Server name
P2: false. No mapping between SQL login and Oracle Login
P3: null. All all SQL login
P4:Oracle user name
P5: oralce account password.

select * into temp_BN1_Locale from OracleLinkedServer_2..HR61.BN1_LOCALE