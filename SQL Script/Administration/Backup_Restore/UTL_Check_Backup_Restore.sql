select backup_set_id, database_name, physical_device_name, backup_start_date,backup_finish_date,type, 
        convert( decimal (10,2), convert(decimal(20,2),backup_size)/(1024*1024)) as backup_size,server_name
        from msdb.dbo.backupset a join msdb.dbo.backupmediafamily b on a.media_set_id=b.media_set_id
        where Type='D'
        order by backup_set_id desc