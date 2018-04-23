/*
        INSTRUCTIONS:
                Replace Parameters (CTRL+SHIFT+M or Query > Specify Values for Templates)
                        For more information on parameters (i.e., <parameters>) see the following:
                                http://www.sqlservervideos.com/video/sql-server-2008-t-sql-enhancements/ 

        PARAMETERS:
                <OperatorName,sysname,Alerts> - Name of the Operator/Alias to alert. 
                <Notification,int,1> - Bitmap of notification types/options: 1 = email, 2 = pager, 4 = netsend

*/


-- 1480 - AG Role Change (failover)
EXEC msdb.dbo.sp_add_alert
        @name = N'AG Role Change',
        @message_id = 1480,
    @severity = 0,
    @enabled = 1,
    @delay_between_responses = 0,
    @include_event_description_in = 1;
GO
EXEC msdb.dbo.sp_add_notification 
        @alert_name = N'AG Role Change', 
        @operator_name = N'<OperatorName,sysname,Alerts>', 
        @notification_method = <Notification,INT,1>; 
GO

-- 35264 - AG Data Movement - Resumed
EXEC msdb.dbo.sp_add_alert
        @name = N'AG Data Movement - Suspended',
        @message_id = 35264,
    @severity = 0,
    @enabled = 1,
    @delay_between_responses = 0,
    @include_event_description_in = 1;
GO
EXEC msdb.dbo.sp_add_notification 
        @alert_name = N'AG Data Movement - Suspended', 
        @operator_name = N'<OperatorName,sysname,Alerts>', 
        @notification_method = <Notification,INT,1>; 
GO

-- 35265 - AG Data Movement - Resumed
EXEC msdb.dbo.sp_add_alert
        @name = N'AG Data Movement - Resumed',
        @message_id = 35265,
    @severity = 0,
    @enabled = 1,
    @delay_between_responses = 0,
    @include_event_description_in = 1;
GO
EXEC msdb.dbo.sp_add_notification 
        @alert_name = N'AG Data Movement - Resumed', 
        @operator_name = N'<OperatorName,sysname,Alerts>', 
        @notification_method = <Notification,INT,1>; 
GO



/*
        INSTRUCTIONS:
                Replace Parameters (CTRL+SHIFT+M or Query > Specify Values for Templates)
                        For more information on parameters (i.e., <parameters>) see the following:
                                http://www.sqlservervideos.com/video/sql-server-2008-t-sql-enhancements/ 

        PARAMETERS:
                <OperatorName,sysname,Alerts> - Name of the Operator/Alias to alert. 
                <Notification,int,1> - Bitmap of notification types/options: 1 = email, 2 = pager, 4 = netsend

*/

EXEC msdb.dbo.sp_add_alert 
        @name=N'Severity 017',
        @message_id=0,
        @severity=17,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1;
GO
EXEC msdb.dbo.sp_add_notification 
        @alert_name=N'Severity 017', 
        @operator_name=N'<OperatorName,sysname,Alerts>', 
        @notification_method = <Notification,INT,1>;
GO

EXEC msdb.dbo.sp_add_alert 
        @name=N'Severity 018',
        @message_id=0,
        @severity=18,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1;
GO
EXEC msdb.dbo.sp_add_notification 
        @alert_name=N'Severity 018', 
        @operator_name=N'<OperatorName,sysname,Alerts>', 
        @notification_method = <Notification,INT,1>;
GO

EXEC msdb.dbo.sp_add_alert 
        @name=N'Severity 019',
        @message_id=0,
        @severity=19,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1;
GO
EXEC msdb.dbo.sp_add_notification 
        @alert_name=N'Severity 019', 
        @operator_name=N'<OperatorName,sysname,Alerts>',
        @notification_method = <Notification,INT,1>;
GO

EXEC msdb.dbo.sp_add_alert 
        @name=N'Severity 020',
        @message_id=0,
        @severity=20,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1;
GO
EXEC msdb.dbo.sp_add_notification 
        @alert_name=N'Severity 020', 
        @operator_name=N'<OperatorName,sysname,Alerts>', 
        @notification_method = <Notification,INT,1>;
GO

EXEC msdb.dbo.sp_add_alert 
        @name=N'Severity 021',
        @message_id=0,
        @severity=21,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1;
GO
EXEC msdb.dbo.sp_add_notification 
        @alert_name=N'Severity 021', 
        @operator_name=N'<OperatorName,sysname,Alerts>', 
        @notification_method = <Notification,INT,1>;
GO

EXEC msdb.dbo.sp_add_alert 
        @name=N'Severity 022',
        @message_id=0,
        @severity=22,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1;
GO
EXEC msdb.dbo.sp_add_notification 
        @alert_name=N'Severity 022', 
        @operator_name=N'<OperatorName,sysname,Alerts>', 
        @notification_method = <Notification,INT,1>;
GO

EXEC msdb.dbo.sp_add_alert 
        @name=N'Severity 023',
        @message_id=0,
        @severity=23,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1;
GO
EXEC msdb.dbo.sp_add_notification 
        @alert_name=N'Severity 023', 
        @operator_name=N'<OperatorName,sysname,Alerts>', 
        @notification_method = <Notification,INT,1>;
GO

EXEC msdb.dbo.sp_add_alert @name=N'Severity 024',
        @message_id=0,
        @severity=24,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1;
GO
EXEC msdb.dbo.sp_add_notification 
        @alert_name=N'Severity 024', 
        @operator_name=N'<OperatorName,sysname,Alerts>', 
        @notification_method = <Notification,INT,1>;
GO

EXEC msdb.dbo.sp_add_alert @name=N'Severity 025',
        @message_id=0,
        @severity=25,
        @enabled=1,
        @delay_between_responses=60,
        @include_event_description_in=1;
GO
EXEC msdb.dbo.sp_add_notification 
        @alert_name=N'Severity 025', 
        @operator_name=N'<OperatorName,sysname,Alerts>', 
        @notification_method = <Notification,INT,1>;
GO