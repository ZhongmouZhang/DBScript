-- =============================================
-- Script Template
-- =============================================


USE [CMDB_V2]
GO

alter table tbl_database
add appcation_name varchar(128)



drop table [tbl_contact]

CREATE TABLE [dbo].[tbl_contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[database_id] int,
	[first_name] [varchar](64) not null,
	[last_name] [varchar](128) NULL,
	[email] [varchar](128) NULL,
	[title] [varchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

