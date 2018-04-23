-- file group usage

	SELECT filename, groupid, size/128.0 [File_Size(MB)], size/128.0-CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 [Free_Space (MB)]
	FROM dbo.sysfiles 
	
	


/************************************************************

1. stop the backup job
2. set the recovery mode to simple
2. do the full backup

3. create image_new table
	
************************************************************/
USE [ODR]
GO
/****** Object:  Table [dbo].[IMAGES_OLD]    Script Date: 09/09/2008 14:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IMAGES_NEW](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ICRHEALTHNUM] [varchar](10) NULL,
	[ICRBIRTHDATE] [varchar](8) NULL,
	[OPERATOR] [varchar](40) NULL,
	[DATESTAMP] [datetime] NULL,
	[STATE] [varchar](2) NULL,
	[CARDCODE] [varchar](2) NULL,
	[MARKS] [varchar](13) NULL,
	[PER_ID] [bigint] NULL,
	[IMAGE] [image] NULL,
	[DIGITAL_SIGNATURE] [varbinary](max) NULL,
	[COMMENTS] [varchar](4000) NULL,
 CONSTRAINT [PK_IMAGES_NEW] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [IMAGE_STORE]

GO
SET ANSI_PADDING OFF



/************************************************************

	populate the data
	
*************************************************************/

 SET NOCOUNT ON
 SET IDENTITY_INSERT on IMAGES_NEW on 
 
declare @id bigint, @maxid bigint

select @id = min(id), @maxid = max(id) from ODR.dbo.images

while (@id<=@maxid)
begin
	insert into IMAGES_NEW
	select * from ODR.dbo.imageS
	where id = @id
	if @id %1000 = 0
		print (convert(varchar, @id) + ' records have been inserted')
		set @id = @id + 1
end
