/*****************************************************************

		Grant SQL Agent Permission
		1. SQLAgentReaderRole : read permission on all the jobs
		2. SQLAgentUserRole :  create jobs and manage the jobs the user creates
		3. SQLAgentOperatorRole : allows users all of the rights assigned to the SQLAgentReaderRole 
								along with the permissions necessary to execute local jobs that they do not own.

******************************************************************/

use msdb
go

EXECUTE sp_addrolemember @rolename = 'SQLAgentReaderRole',@membername = 'PHSABC\jzhang2'