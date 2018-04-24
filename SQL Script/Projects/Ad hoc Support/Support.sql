/***************************************************************

	XTEND Recovery

****************************************************************/

exec sp_renamedb 'XtendConsole_20061017_2100', 'XtendConsole_17_Recovery'

exec sp_renamedb 'XtendConsole_20061018_BFRecovery', 'XtendConsole_18_BFRecovery'

exec sp_renamedb 'XtendConsole_19_Part1', 'XtendConsole'

exec sp_renamedb 'XtendConsole_20061019_Part2', 'XtendConsole_19_Part2'



-- select all updated non-patient records.

select * from xkm where WhereaboutsDateTime like '20061017%' and format<>'9'

select * from xkm where WhereaboutsDateTime like '20061018%' and format<>'9'

select * from xkm where Instruction1DT like '20061017%' and format<>'9'

select * from xkm where Instruction1DT like '20061018%' and format<>'9'
 
 
 use XtendConsole_19_Part2
select xkm.RecNo,xkm.WhereaboutsDateTime,xkm.Instruction1DT 
from xkm join XtendConsole_18_BFRecovery.dbo.temp_InsUpDataSet I on xkm.Recno=i.Recno
where (xkm.WhereaboutsDateTime>i.WhereaboutsDateTime and xkm.Instruction1DT < i.Instruction1DT)
	or (xkm.WhereaboutsDateTime<i.WhereaboutsDateTime and xkm.Instruction1DT > i.Instruction1DT)


--select * from xkm where WhereaboutsDateTime like '20061017%' and format<>'9'

use XtendConsole_18_BFRecovery
--drop table temp_InsUpDataSet

select * into temp_InsUpDataSet
from xkm where (WhereaboutsDateTime like '20061018%' or Instruction1DT like '20061018%') and format<>'9'
go
--select * from xkm where Instruction1DT like '20061017%' and format<>'9'


use XtendConsole_19_Part2
select xkm.RecNo,xkm.WhereaboutsDateTime,xkm.Instruction1DT 
from xkm join XtendConsole_18_BFRecovery.dbo.temp_InsUpDataSet I on xkm.Recno=i.Recno
where (xkm.WhereaboutsDateTime>i.WhereaboutsDateTime and xkm.Instruction1DT < i.Instruction1DT)
	or (xkm.WhereaboutsDateTime<i.WhereaboutsDateTime and xkm.Instruction1DT > i.Instruction1DT)

use XtendConsole_19_Part2
begin tran

delete from xkm 
where Recno in 
(
	select i.RecNo
	from xkm right join Recovery_TobeInserted I on xkm.Recno=i.Recno
	where xkm.Instruction1DT < i.Instruction1DT or xkm.WhereaboutsDateTime<i.WhereaboutsDateTime
		or xkm.RecNO is null
)

set IDENTITY_INSERT Xkm on

INSERT INTO [Xkm]
	([ProfileId], [Duplicated], [DuplicatedCounter], [Name], [FirstName], [DialNumber], [PagerId], 
	[Whereabouts], [WhereaboutsDateTime], [WhereaboutsOperator], [Department], [DepartmentOperator], 
	[DepartmentDateTime], [PatientId], [DepartmentNumber], [Location], [GroupCode], [Instruction1], 
	[Instruction1Op], [Instruction1DT], [Instruction2], [Instruction2Op], [Instruction2DT], [Instruction3],
	[Instruction3Op], [Instruction3DT], [Instruction4], [Instruction4Op], [Instruction4DT], [Instruction5], 
	[Instruction5Op], [Instruction5DT], [Instruction6], [Instruction6Op], [Instruction6DT], [Instruction7], 
	[Instruction7Op], [Instruction7DT], [Instruction8], [Instruction8Op], [Instruction8DT], [Instruction9], 
	[Instruction9Op], [Instruction9DT], [Instruction10], [Instruction10Op], [Instruction10DT], [Format], 
	[ExtensionType], [Password], [Address1], [Address2], [Address3], [Address4], [Address5], [Counter1], [Counter2], 
	[Counter3], [Counter4], [Counter5], [Counter6], [MainGroupExtension], [RegistryFlag], [PrintBills], [Lights], 
	[Lamps], [History], [YNFlag1], [YNFlag2], [YNFlag3], [YNFlag4], [YNFlag5], [YNFlag6], [YNFlag7], [YNFlag8], 
	[YNFlag9], [YNFlag10], [YNFlag11], [YNFlag12], [YNFlag13], [YNFlag14], [YNFlag15], [YNFlag16], [YNFlag17], 
	[YNFlag18], [YNFlag19], [YNFlag20], [YNFlag21], [YNFlag22], [YNFlag23], [YNFlag24], [YNFlag25], [Color], 
	[RoomNumber], [Company], [VaXfer], [CardNumber], [PasswordDateTime], [PasswordOperator], [RecordDateTime], 
	[RecordOperator], [VaXferNumber], [GroupMessage], [WebXchange], [FacilityCode], [TouchToneName], 
	[ArrivalDateTime], [DepartureDateTime], [OtherDateTime], [BillingPlan], [BaseFamilyId], [Salutation], [Free1], 
	[Free2], [Free3], [Free4], [TriggerDateTime], [RecNo], [Preferredname], [Jobtitle], [Division], [AnnounceName], 
	[PronounceName], [OFFDialPriority], [DialPriority], [Soundex], [FlashAlert], [DeliveryDays], [ProfileLocked], 
	[rowguid])
SELECT 
	[ProfileId], [Duplicated], [DuplicatedCounter], [Name], [FirstName], [DialNumber], [PagerId], 
	[Whereabouts], [WhereaboutsDateTime], [WhereaboutsOperator], [Department], [DepartmentOperator], 
	[DepartmentDateTime], [PatientId], [DepartmentNumber], [Location], [GroupCode], [Instruction1], 
	[Instruction1Op], [Instruction1DT], [Instruction2], [Instruction2Op], [Instruction2DT], [Instruction3],
	[Instruction3Op], [Instruction3DT], [Instruction4], [Instruction4Op], [Instruction4DT], [Instruction5], 
	[Instruction5Op], [Instruction5DT], [Instruction6], [Instruction6Op], [Instruction6DT], [Instruction7], 
	[Instruction7Op], [Instruction7DT], [Instruction8], [Instruction8Op], [Instruction8DT], [Instruction9], 
	[Instruction9Op], [Instruction9DT], [Instruction10], [Instruction10Op], [Instruction10DT], [Format], 
	[ExtensionType], [Password], [Address1], [Address2], [Address3], [Address4], [Address5], [Counter1], [Counter2], 
	[Counter3], [Counter4], [Counter5], [Counter6], [MainGroupExtension], [RegistryFlag], [PrintBills], [Lights], 
	[Lamps], [History], [YNFlag1], [YNFlag2], [YNFlag3], [YNFlag4], [YNFlag5], [YNFlag6], [YNFlag7], [YNFlag8], 
	[YNFlag9], [YNFlag10], [YNFlag11], [YNFlag12], [YNFlag13], [YNFlag14], [YNFlag15], [YNFlag16], [YNFlag17], 
	[YNFlag18], [YNFlag19], [YNFlag20], [YNFlag21], [YNFlag22], [YNFlag23], [YNFlag24], [YNFlag25], [Color], 
	[RoomNumber], [Company], [VaXfer], [CardNumber], [PasswordDateTime], [PasswordOperator], [RecordDateTime], 
	[RecordOperator], [VaXferNumber], [GroupMessage], [WebXchange], [FacilityCode], [TouchToneName], 
	[ArrivalDateTime], [DepartureDateTime], [OtherDateTime], [BillingPlan], [BaseFamilyId], [Salutation], [Free1], 
	[Free2], [Free3], [Free4], [TriggerDateTime], [RecNo], [Preferredname], [Jobtitle], [Division], [AnnounceName], 
	[PronounceName], [OFFDialPriority], [DialPriority], [Soundex], [FlashAlert], [DeliveryDays], [ProfileLocked], 
	[rowguid]
from Recovery_TobeInserted
where Recno in 
(
	select i.RecNo
	from xkm right join Recovery_TobeInserted I on xkm.Recno=i.Recno
	where xkm.Instruction1DT < i.Instruction1DT or xkm.WhereaboutsDateTime<i.WhereaboutsDateTime
		or xkm.RecNO is null
)

rollback tran
