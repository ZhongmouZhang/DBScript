  if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].HSP_CreateRandomMapping') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].HSP_CreateRandomMapping
GO

CREATE         proc dbo.HSP_CreateRandomMapping
as
declare @sourcedigit varchar (10), @destdigit varchar(11)
declare @sourcealphebet varchar(26), @destalphebet varchar(26)
declare @currentdate datetime

set @sourcedigit = '123456789'
set @sourcealphebet = 'abcdefghijklmnopqrstuvwxyz'

exec HSP_GetscramblingSeed @source=@sourcedigit,@dest=@destdigit output

set @destdigit = '0' +  @destdigit
--print @destdigit
exec HSP_GetscramblingSeed @source=@sourcealphebet,@dest=@destalphebet output
--print @destalphebet

-- create the seed table
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].ScrambleSeed') and OBJECTPROPERTY(id, N'IsTable') = 1)
drop table ScrambleSeed

CREATE TABLE [dbo].[ScrambleSeed](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[DigitalSeed] [varchar](10) NOT NULL,
	[AlphebetSeed] [varchar](26) NOT NULL,
	CONSTRAINT [PK_ScrambleSeed] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)
)

insert ScrambleSeed(eventdate,[DigitalSeed], [AlphebetSeed]) 
values (getdate(), @destdigit, @destalphebet)

-- select ascii('1'), ascii('9'), ascii('a'), ascii ('z'), ascii('A'), ascii('Z')

-- select * from dbo.ScrambleSeed
