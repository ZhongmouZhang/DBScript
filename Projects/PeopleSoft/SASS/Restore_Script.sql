
restore FILELISTONLY 
from disk = 'H:\MSSQL\backup\PROD_042809'

restore database WBSASS_0428
from disk = 'H:\MSSQL\backup\PROD_042809'
with move 'Dev_Primary' to 'H:\MSSQL\Data\wbsass\wbsass_sys.MDF',
move 'WB_EMP_DATA01' to 'H:\MSSQL\Data\wbsass\wb_emp_data01.ndf',
move 'WB_EMP_INDX01' to 'H:\MSSQL\Data\wbsass\wb_emp_indx01.ndf',
move 'WB_WORKBRAIN_DATA01' to 'H:\MSSQL\Data\wbsass\wb_workbrain_data01.ndf',
move 'WB_WORKBRAIN_INDX01' to 'H:\MSSQL\Data\wbsass\wb_workbrain_indx01.ndf',
move 'WB_WORK_DATA01' to 'H:\MSSQL\Data\wbsass\wb_work_data01.ndf',
move 'WB_WORK_INDX01' to 'H:\MSSQL\Data\wbsass\wb_work_indx01.ndf',
move 'WB_TEXTANDIMAGE01' to 'H:\MSSQL\Data\wbsass\wb_textandimage01.ndf',
move 'WB_ARCHIVE_DATA01' to 'H:\MSSQL\Data\wbsass\wb_archive_data01.ndf',
move 'WB_ARCHIVE_INDX01' to 'H:\MSSQL\Data\wbsass\wb_archive_indx01.ndf',
move 'Dev_log01' to 'H:\MSSQL\Data\wbsass\wbsass_log.ldf',

STATS

