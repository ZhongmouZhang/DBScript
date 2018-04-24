drop table PHSA_Login

create table PHSA_Login
(
event_date datetime not null,
instance_name varchar(50) not null,
login_name varchar(200) collate SQL_Latin1_General_CP1_CS_AS,
default_db_name varchar(100),
sid varbinary(85),
createdate datetime,
updatedate datetime,
status int,
constraint PK_PHSA_Login primary key clustered 
 (event_date, instance_name, login_name)
)

drop table phsa_dbuser
create table PHSA_DBuser
(
event_date datetime not null,
instance_name varchar(50) not null,
database_name varchar(100)not null,
dbuser_name varchar(200) collate SQL_Latin1_General_CP1_CS_AS,
sid varbinary(85),
createdate datetime,
updatedate datetime,
hasdbaccess int,
islogin int,
isntname int,
isntgroup int,
isntuser int,
issqluser int,
isaliased int,
issqlrole int,
isapprole int,
constraint PK_PHSA_DBUser primary key clustered
(event_date, instance_name, database_name, dbuser_name)
)


--  Transfer the data from PNG to PHSABC
INSERT INTO [Metadata].[dbo].[PHSA_DBuser]
           ([event_date]
           ,[instance_name]
           ,[database_name]
           ,[dbuser_name]
           ,[sid]
           ,[createdate]
           ,[updatedate]
           ,[hasdbaccess]
           ,[islogin]
           ,[isntname]
           ,[isntgroup]
           ,[isntuser]
           ,[issqluser]
           ,[isaliased]
           ,[issqlrole]
           ,[isapprole])
SELECT [event_date]
      ,[instance_name]
      ,[database_name]
      ,[dbuser_name]
      ,[sid]
      ,[createdate]
      ,[updatedate]
      ,[hasdbaccess]
      ,[islogin]
      ,[isntname]
      ,[isntgroup]
      ,[isntuser]
      ,[issqluser]
      ,[isaliased]
      ,[issqlrole]
      ,[isapprole]
  FROM [PNG_METADATA].[Metadata].[dbo].[PHSA_DBuser]

INSERT INTO [Metadata].[dbo].[PHSA_Login]
           ([event_date]
           ,[instance_name]
           ,[login_name]
           ,[default_db_name]
           ,[sid]
           ,[createdate]
           ,[updatedate]
           ,[status])
SELECT [event_date]
      ,[instance_name]
      ,[login_name]
      ,[default_db_name]
      ,[sid]
      ,[createdate]
      ,[updatedate]
      ,[status]
  FROM [PNG_METADATA].[Metadata].[dbo].[PHSA_Login]