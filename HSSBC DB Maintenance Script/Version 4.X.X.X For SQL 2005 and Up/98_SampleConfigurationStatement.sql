
-- ad hoc backup cofigure
insert into [dbo].[tbl_maint_parameter] values (71, 'ITAM','#adhoc_backup_folder','K:\SQL_Backup\Adhoc\')
insert into dbo.tbl_maint_parameter values (72, 'ITAM', '#adhoc_backup_notification_email','jzhang2@phsa.ca;')
insert into dbo.tbl_maint_action values (71, '#adhoc_backup','ITAM','onetime',0,0,'00:00',null,null,'2015-05-21 16:00:00')


-- schedule a log shrinking job
insert into dbo.tbl_maint_action values (81, '#shrink_log_file','default','daily',0,0,'22:00',null,null,'2015-05-21 16:00:00')


-- exclude from default full backup
insert into dbo.tbl_maint_parameter values (1, '<database_name>', '#excluded_from_default_full_backup','')


--  #excluded_from_default_disk_space_check
insert into dbo.tbl_maint_parameter values (52, 'J:', '#excluded_from_default_disk_space_check', '');
-- reindex
insert into dbo.tbl_maint_action values (22, 



