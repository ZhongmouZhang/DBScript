 --select the job alert operator
 
 SELECT  --Job name 
        [Job Name] = sj.[name], 
        --Job owner 
        [Owner] = SUSER_SNAME(sj.[owner_sid]), 
        --Job category e.g. "Database Maintenance", "Report Server", "[Uncategorized (Local)]"
        [Category] = c.[name], 
        --Operator to be e-mailed (may be NULL) 
        [Email Operator] = o.[name], 
        --notification in Event log (notify when job fails, succeeds, always, never) 
        [Event LOG Notification] = CASE sj.[notify_level_eventlog] 
            WHEN 0 THEN 'Never'
            WHEN 1 THEN 'When the job succeeds'
            WHEN 2 THEN 'When the job fails'
            WHEN 3 THEN 'When the job completes (regardless of the job outcome)'
            ELSE 'UNKNOWN' END, 
        --e-mail notification (notify when job fails, succeeds, always, never) 
        [Email Notification] = CASE sj.[notify_level_email] 
            WHEN 0 THEN 'Never'
            WHEN 1 THEN 'When the job succeeds'
            WHEN 2 THEN 'When the job fails'
            WHEN 3 THEN 'When the job completes (regardless of the job outcome)'
            ELSE 'UNKNOWN' END 
FROM    msdb.dbo.[sysjobs] sj LEFT OUTER JOIN 
            --E-Mail Operator
            msdb.dbo.[sysoperators] o ON 
                sj.[notify_email_operator_id] = o.[id] LEFT OUTER JOIN 
            --Job categories 
            msdb.dbo.[syscategories] C ON 
                sj.[category_id] = c.[category_id]
WHERE   --ignore auto-created jobs (Reporting Services schedules) 
        NOT (sj.[name] LIKE '_____________-____-____-____________') AND 
        --only enabled Jobs 
        sj.[enabled] = 1 
ORDER BY sj.[name] 
