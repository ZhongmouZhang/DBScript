 
 /***********************
 create table tbl_database_contact
(
id int identity(1,1) primary key,
instance_name varchar(64) not null,
database_name varchar(128) not null,
contact1 varchar (64) not null,
contact2 varchar(64),
contact3 varchar (64),
application_name varchar(64),
note varchar(64)
)


-- drop table tbl_instance_info

CREATE TABLE tbl_instance_info(
	id int identity (1,1) primary key,
	instance_name [varchar](200) NOT NULL,
	connection_string [varchar](200) NOT NULL,
	sql_name [varchar](50) NULL,
	sql_version [varchar](50) NULL,
	sp [varchar](50) NULL,
	edition [varchar](50) NULL,
	domain varchar(50) null, 	
	ip_port [varchar](50) NULL,
	created_date datetime not null default getdate(),
	is_connectable char(1) not null default 'Y',
	db_info_update_status varchar(10) not null  default '', -- success, processing
	db_info_update_date datetime not null default '2000-01-01',
	note [varchar](256) NULL
	
) 


******************************/

--- insert newly added instances into tbl_instance_info table

insert into tbl_instance_info (instance_name,connection_string,domain)
select a.name, server_name, b.name
from [msdb].[dbo].[sysmanagement_shared_registered_servers_internal] a 
	join msdb.dbo.sysmanagement_shared_server_groups_internal b 
		on a.server_group_id = b.server_group_id 
where a.name in (
select a.name 
from [msdb].[dbo].[sysmanagement_shared_registered_servers_internal] a 
	 left join dbo.tbl_instance_info b on a.name = b.instance_name
where b.instance_name is null )
GO



-- update the status of instance no longer in user if the instance is deteled from Central Management
update tbl_instance_info
set is_in_use='N', is_connectable='N'  -- not in use means no longer being connectable
where not instance_name in (select name from msdb.dbo.sysmanagement_shared_registered_servers_internal)
	and is_in_use != 'N'


--  get the IP address for the newly added servers
update tbl_instance_info
set ip = 	dbo.fn_InstanceIP
		(case when CHARINDEX ('\',instance_name)=0 then instance_name
		 else SUBSTRING(instance_name, 0, charindex ('\',instance_name))
		end )
where info_update_date = '2000-01-01'
	and (ip is null or ip='0.0.0.0')


update dbo.tbl_instance_info
set fqn = 
	dbo.fn_InstanceFqn( 
		case when CHARINDEX('\', instance_name) = 0 then instance_name 
			else SUBSTRING (instance_name, 0, charindex('\', instance_name)) end )
where fqn is null 
	

--  Get the SQL Version of the instances for the newly added instances
use cmdb
go

declare @connection_string varchar(500)
declare @stt nvarchar(2000)

set @connection_string = ''
while 1=1
begin
	select @connection_string=MIN(connection_string)
	from tbl_instance_info
	where connection_string > @connection_string 
		and sql_version is null 
		and ip !='0.0.0.0' 
		and is_in_use = 'Y' 
		and is_connectable ='Y'
		-- and datediff (day, info_update_date,getdate())>0
		and info_update_date = '2000-01-01'
	if @connection_string is null 
		break
	
	update tbl_instance_info
	set info_update_status = 'SQL_Version', info_update_date = getdate()
	where connection_string=@connection_string
	
	set @stt = 'update dbo.tbl_instance_info
set sql_version = convert (varchar(200),a.SQLVersion), 
	product_version=convert (varchar(50),a.ProductVersion), 
	sp=convert (varchar(50),a.ProductLevel),
	edition=convert (varchar(50),a.Edition),
	is_clustered = case IsClustered when 1 then ''Y'' else ''N'' end
 from openrowset (''SQLNCLI'', ''Server= ' 
 + @connection_string 
 + ';Trusted_Connection=yes;'',
 '' SELECT @@VERSION AS SQLVersion, SERVERPROPERTY(''''ProductVersion'''') AS ProductVersion,
SERVERPROPERTY(''''ProductLevel'''') AS ProductLevel,
SERVERPROPERTY(''''Edition'''') AS Edition ,
SERVERPROPERTY(''''isclustered'''') AS IsClustered '') as a
where connection_string=''' 
+ @connection_string +''''

	print @stt
	exec (@stt)	
	
	if @@error=0
	begin 
		update tbl_instance_info
		set info_update_status = 'Success_of_SQL_Version', info_update_date = getdate()
		where connection_string=@connection_string
	end
	

end

 


--  Add the IP address for the corresponding server  

/****************
update tbl_instance_info
set ip = 	dbo.fn_InstanceIP
		(case when CHARINDEX ('\',instance_name)=0 then instance_name
		 else SUBSTRING(instance_name, 0, charindex ('\',instance_name))
		end )
where ip is null or ip='0.0.0.0'

*****************************/





