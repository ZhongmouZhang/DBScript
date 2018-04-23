delete from [destination].[Test].[TRANSACTIONS]
DELETE FROM [destination].[Test].[SUBSCRIPTIONS]
delete from [destination].Test.cancellations
delete from [destination].[Test].[USERS]

set Identity_insert [destination].[Test].[USERS] on
INSERT INTO [destination].[Test].[USERS]
           ( [User_id], 
           [Email]
           ,[Gender]
           ,[Age]
           ,[Name])
SELECT [User_id]
      ,[Email]
      ,[Gender]
      ,[Age]
      ,[Name]
  FROM [source].[Test].[USERS]
set Identity_insert [destination].[Test].[USERS] off
  

INSERT INTO [destination].[Test].[cancellations]
           ([subscription_id]
           ,[user_id])
SELECT [subscription_id]
      ,[user_id]
 FROM [source].[Test].[cancellations]
  
 
 set Identity_insert [destination].[Test].[SUBSCRIPTIONS] on
INSERT INTO [destination].[Test].[SUBSCRIPTIONS]
           ([subscription_id]
           ,[user_id]
           ,[subscription_type]
           ,[active_indicator])
SELECT [subscription_id]
      ,[user_id]
      ,[subscription_type]
      ,[active_indicator]
  FROM [source].[Test].[SUBSCRIPTIONS]
 set Identity_insert [destination].[Test].[SUBSCRIPTIONS] off

INSERT INTO [destination].[Test].[TRANSACTIONS]
           ([subscription_id]
           ,[action]
           ,[timestamp])
SELECT [subscription_id]
      ,[action]
      ,[timestamp]
  FROM [source].[Test].[TRANSACTIONS]


  ------------------------------------------------------------------------------
  select server_name
	,database_name
	,backup_start_date
	,backup_finish_date
	,type
	,convert( decimal (10,2), convert(decimal(20,2),backup_size)/(1024*1024)) as backup_size
	,convert( decimal (10,2), convert(decimal(20,2),compressed_backup_size)/(1024*1024)) as compressed_backup_size
	,DATEDIFF(second, backup_start_date,backup_finish_date) duration_second
	,database_creation_date
	,recovery_model
	,physical_device_name
	, user_name
    from msdb.dbo.backupset a join msdb.dbo.backupmediafamily b on a.media_set_id=b.media_set_id
    order by backup_set_id
    

