/* Check the uniqueness of RU,CRU,ACRU and PCRU  */


select userid, ue_InsertSubType 
from ptbu_userevents 
where ue_InsertSubType in (10,11,12,13)
group by userid, ue_InsertSubType
having count(*)>1

/*  count of RU, CRU, ACRU and PCRU  */
select ue_InsertSubType, count(*) 
from ptbu_userevents ue
where ue_InsertSubType in (10,11,12,13) 
group by ue_InsertSubType

/*  count of current active users  */
select count(*) from ptbu_users where u_AccStatus=1

/* count of current active RU, CRU, ACRU, and PCRU  */
select ue_InsertSubType, count(*) 
from ptbu_userevents ue
where ue_InsertSubType in (10,11,12,13)
   and exists (select * from ptbu_users u where ue.userid=u.userid and u.u_accstatus=1) 
group by ue_InsertSubType

/********************************************************************************
		
		Invertory
	
*********************************************************************************/
select count(*) allDVD, count(distinct productid) allDVDTitle from ptb_inv 

select count(*) allTradedDVD,  count(distinct productid) allTradedDVDTitle from ptb_inv where wantid>0

/* the top 100 available DVDs */
select top 100 productid, count(*) pa 
from ptb_inv 
group by productid 
order by pa desc

select pt_name, p.productID, v.pa
from 
( select top 100 productid, count(*) pa 
  from ptb_inv 
  group by productid 
 ) v join ptb_products p on v.productid=p.productid
    join ptb_productTitles pt on p.producttitleid=pt.producttitleid
order by v.pa desc


/*  the top 100 wanted DVDs   */
select top 100 productid, count(*) mostwanted 
from ptbu_wantgroups
group by productid
order by mostwanted desc

select pt_name, p.productID, v.mostwanted
from 
( select top 100 productid, count(*) mostwanted 
from ptbu_wantgroups
group by productid
 ) v join ptb_products p on v.productid=p.productid
    join ptb_productTitles pt on p.producttitleid=pt.producttitleid
order by v.mostwanted desc


/******* the DVDs which are traded most    **************/

select top 100 invID, count(distinct wantid ) tradecount
from ptb_InvEvents
where wantid > 0 
group by invID
order by tradecount desc


/******* Tracking a certain DVD   *******************/
select * from ptb_InvEvents 
where invid=42717 and wantid=203682 
order by InvEventID desc 

/******  The top 100 most active member users, counting by the times of sending or receiving DVDs */
select top 100 userid, count(distinct wantid) tradetimes
from ptb_InvEvents ie
where wantid>0 
and exists (select * from ptbu_users u where u.userid=ie.userid and u.u_roleaccesstype = 1)
group by userid
order by tradetimes desc

/******  All the trade events *********************/
select count(*)
from (
select distinct invID,wantid from ptb_InvEvents where wantid>0
) v


/***********************************************************************

	Billing
	
***********************************************************************/

/********   sum the amount, count the transaction groupped by billing type  ***************/

select ubt.*, isnull(btt_description,'All') description 
from ptba_bpf_billingtransactiontypes  btt right join 
(select billingtransactiontypeid, sum(ubt_amount) all_amount , count(*) all_transaction 
from ptbu_userbillingtransactions
group by billingtransactiontypeid 
with rollup ) ubt
on btt.billingtransactiontypeid=ubt.billingtransactiontypeid
order by ubt.billingtransactiontypeid asc



/************************************************************************

	Working Scripts
	
************************************************************************/

/********************************************************************
	All the inventories that have IsForReceivedDate event in 2005-12-20
****************************************************************************/
 
select invEventTypeID, count(*)
from 
(SELECT ie.invid FROM ptb_InvEvents ie
	inner join ptb_InvEventTypes iet
		on iet.InvEventTypeID=ie.InvEventTypeID
WHERE iet_IsForReceivedDate=1 --AND	s_StatusType = 2 --SentStatusEnum
	AND	ie_EventDate BETWEEN '2005-12-20' AND '2005-12-21') v
left join ptb_InvEvents on v.invid=ptb_InvEvents.invid
group by invEventTypeID
order by count(*) desc



select top 200 ptb_InvEvents.*
from 
(SELECT ie.invid FROM ptb_InvEvents ie
	inner join ptb_InvEventTypes iet
		on iet.InvEventTypeID=ie.InvEventTypeID
WHERE iet_IsForReceivedDate=1 --AND	s_StatusType = 2 --SentStatusEnum
	AND	ie_EventDate BETWEEN '2005-12-20' AND '2005-12-21') v
left join ptb_InvEvents on v.invid=ptb_InvEvents.invid

order by ptb_InvEvents.invid, InveventID




/**************************************************************************

	the winner for the 100,000th trade
	
**************************************************************************/

declare @SentTranID int 
declare @placeInTrade int

set @placeInTrade=100000
set @SentTranID = 0 

declare myCursor curSor scroll for 
	SELECT ie.invEventID
	FROM ptb_InvEvents ie
	  inner join ptb_InvEventTypes iet on iet.InvEventTypeID=ie.InvEventTypeID
	WHERE	iet_IsForReceivedDate=1 
 	order by ie.invEventID asc

open myCursor 

fetch absolute @placeInTrade from myCursor into @SentTranID 

select @SentTranID

close myCursor 

deallocate myCursor 




select * from ptb_InvEvents where invID = (select invID from ptb_InvEvents where invEventID=@SentTranID)

select userid, u_login, u_firstname, u_lastname, u_address1, u_address2, u_city, st_name, 'US'  
from ptbu_users inner join ptb_states on ptbu_users.stateid=ptb_states.stateid 
where userid=86345 or userid=10400

select pt_name, p_Asin, inv.InvID
from ptb_inv inv join ptb_products p on inv.productid = p.productid
	join ptb_ProductTitles t on p.producttitleid=t.productTitleID
where inv.InvID = 201817



/*********************************************************************************************

	Drop all the Foreign Keys
	
**********************************************************************************************/

declare @FK_Name varchar(255)
declare @tb_name varchar(255)
declare @stt varchar(5000)

declare myCur cursor for 
	select fk.name, tb.name from sysobjects fk inner join sysobjects tb
	on  tb.id=fk.parent_obj
	where fk.xtype='F'

open mycur
fetch next from mycur into @fk_name, @tb_name

while (@@fetch_status=0)
begin 
    set @stt = 'ALTER TABLE ' + @tb_name + ' DROP CONSTRAINT ' + @fk_name
    -- execute (@stt)
    select @stt
    fetch next from mycur into @fk_name, @tb_name
end 
    
close myCur
deallocate myCur   	
 
 
 /******************************************************************************************
 
	Rename the prefix of Tables, Stored Procedures, and Functions
	
********************************************************************************************/

--  rename the tables

declare @tb_name varchar(255)
declare @new_name varchar(255)
declare @stt varchar(5000)

declare myCur cursor for 
	select tb.name from sysobjects tb where tb.xtype='U'

open mycur
fetch next from mycur into @tb_name


while (@@fetch_status=0)
begin 
	if (charindex('_', @tb_name)>0)
    	set @new_name = 'ptbr' + substring (@tb_name, charindex('_', @tb_name), len(@tb_name))
	else 
    	set @new_name = 'ptbr_' + @tb_name
	exec sp_rename @tb_name, @new_name
    fetch next from mycur into @tb_name
end 
    
close myCur
deallocate myCur   	


-- rename store procedures
declare @tb_name varchar(255)
declare @new_name varchar(255)
declare @stt varchar(5000)

declare myCur cursor for 
	select tb.name from sysobjects tb where tb.xtype='P' and tb.name not like 'dt_%'


open mycur
fetch next from mycur into @tb_name


while (@@fetch_status=0)
begin 
	if (charindex('_', @tb_name)>0)
    	set @new_name = 'pspr' + substring (@tb_name, charindex('_', @tb_name), len(@tb_name))
	else 
    	set @new_name = 'pspr_' + @tb_name
	exec sp_rename @tb_name, @new_name
    fetch next from mycur into @tb_name
end 
    
close myCur
deallocate myCur   	


-- rename Functions
declare @tb_name varchar(255)
declare @new_name varchar(255)
declare @stt varchar(5000)

declare myCur cursor for 
	select tb.name from sysobjects tb where tb.xtype='FN' 


open mycur
fetch next from mycur into @tb_name


while (@@fetch_status=0)
begin 
	if (charindex('_', @tb_name)>0)
    	set @new_name = 'pfnr' + substring (@tb_name, charindex('_', @tb_name), len(@tb_name))
	else 
    	set @new_name = 'pfnr_' + @tb_name
	exec sp_rename @tb_name, @new_name
    fetch next from mycur into @tb_name
end 
    
close myCur
deallocate myCur   	
/********************************************************************************************
	Change UserinfoChange to a new table
	
*********************************************************************************************/
select * from ptbu_userinfochanges where userid=37 order by userinfochangeid desc

select * from ptbu_users where userid=80995

select count(*) from ptbu_users u 
where not exists(select * from ptbu_userinfochanges c where u.userid=c.userid)

-- populating the missing changes from users table
declare @changeid int
declare @insertdate datetime
declare @userid int
declare @Login varchar(50)
declare @Password varchar(20)
declare @Address1 varchar(255)
declare @Address2 varchar(50)
declare @City varchar(30)
declare @StateID int
declare @Zip varchar(15)
declare @CcNumber varchar(50)
declare @CcExpiry varchar(10)
declare @PhoneHome varchar(50)
declare @BillPlanStatus varchar(50)
declare @AccStatus int
declare @ShowMatureContent  int
declare @EnvSentQty int
declare @EnvSendThresh int
declare @EnvAutoRefil int
declare @AddrVerifType int
declare @AdminID int
declare @RoleAccessType int

declare my_cur cursor 
	SELECT [UserInfoChangeID], [uic_InsertDate], [UserID], [uic_Login], [uic_Password], 
		[uic_Address1], [uic_Address2], [uic_City], [uic_StateType], [uic_Zip], 
		[uic_CcNumber], [uic_CcExpiry], [uic_PhoneHome], [uic_BillPlanStatus], [uic_AccStatus], 
		[uic_ShowMatureContent], [uic_EnvSentQty], [uic_EnvSendThresh], [uic_EnvAutoRefil], [uic_AddrVerifType], 
		[uic_AdminID], [uic_RoleAccessType] 
	FROM ptbu_UserInfoChanges

open my_cur
fetch next into @changeid, @insertdate, @userid, @Login, @Password,
	@Address1, @Address2, @City, @StateID, @Zip,
	@CcNumber, @CcExpiry, @PhoneHome, @BillPlanStatus, @AccStatus,
	@ShowMatureContent, @EnvSentQty, @EnvSendThresh, @EnvAutoRefil, @AddrVerifType,
	@AdminID, @RoleAccessType

while (@@fetch_statue=0)
begin
	if (@login is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_login', @login)
	end

	if (@Password is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_password', @Password)
	end

	if (@Address1 is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_Address1', @Address1)
	end

	if (@Address2 is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_Address2', @Address2)
	end

	if (@City is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_City', @City)
	end

	if (@StateID is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_StateType', @StateID)
	end

	if (@Zip is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_Zip', @Zip)
	end

	if (@CcNumber is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_CcNumber', @CcNumber)
	end

	if (@CcExpiry is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_CcExpiry', @CcExpiry)
	end

	if (@PhoneHome is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_PhoneHome', @PhoneHome)
	end

	if (@BillPlanStatus is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_BillPlanStatus', @BillPlanStatus)
	end

	if (@AccStatus is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_AccStatus', @AccStatus)
	end
	
	@ShowMatureContent, @EnvSentQty, @EnvSendThresh, @EnvAutoRefil, @AddrVerifType,
	@AdminID, @RoleAccessType
	
	if (@login is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_login', @login)
	end

	if (@login is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_login', @login)
	end

	if (@login is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_login', @login)
	end

	if (@login is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_login', @login)
	end

	if (@login is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_login', @login)
	end

	if (@login is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_login', @login)
	end

	if (@login is not null)
	begin
		insert into ptbr_userinfochanges(OrgChangeID, userid, insertDate, columnName, updatedValue)
		values (@changeid, @userid, @insertdate, 'uic_login', @login)
	end
end



/*************************************************************************

	SP_WHO2 temporary table
	
**************************************************************************/
-- drop table #active_sp
create table #active_sp
(
	spid int,
	status varchar(500),
	login varchar (500),
	hostname varchar(500),
	blkby varchar (500),
	dbname varchar(500),
	command varchar(1256),
	cputime int,
	diskIO 	int,
	LastBatch varchar(500),
	prgramName varchar(500),
	spid1 int,
	requestid int
)



insert into #active_sp
exec sp_who2 


select hostname, login, status, count(*) number from #active_sp 
--where login='web' 
group by hostname, login, status
order by status, hostname




/**************************************************************************

	Inventory Monitor Script
	
***************************************************************************/

declare @eventdate datetime
declare @countryid int

set @eventdate = '2006-01-31'
set @countryid = 2


SELECT convert (varchar,eventdate,102)  eventdate, 
	(case countryid when 1 then 'US' else 'CA' end) countryid, 
	producttitleid, [Title], 
	max([RetailPrice]) retail_price, convert (varchar, max([ReleaseDate]), 102) release_date, 
	convert (varchar, max(TitleDate), 102) Title_date,
	max (PeerbuxValue) PeerBuxValue, count(MailedLast7Days) MailedLast7Days, 
	sum([TtlActiveWants]) TtlActiveWants, sum([TtlValidWants]) TtlValidWants, 
	sum([Q1Count]) Q1Count, sum([Q2Count]) Q2Count, sum([Q3Count]) Q3Count, sum([Q4Count]) Q4Count, 
	sum([Q5Count]) Q5Count, sum([Q6Count]) Q6Count, sum([Q7Count]) Q7Count, sum([Q8Count]) Q8Count, 
	sum([TtlShipmentToDate]) TtlShipmentToDate, sum([TtlHaveInvToDate]) TtlHaveInvToDate, 
	sum([TtlHoldInvToDate]) TtlHoldInvToDate, sum([CurHaveInv]) CurHaveInv, 
	sum([CurHoldInv]) CurHoldInv, sum(CurInTransit) CurInTransit, sum([LostCount]) LostCount, sum([DamagedCount] ) DamagedCount
FROM [ptb_Snapshot_InventoryMonitor]
where eventdate = @eventdate and (title is not null and ltrim(title)!='') and countryid=@countryID
group by  convert (varchar,eventdate,102) , countryid, producttitleid, title
order by convert (varchar,eventdate,102) , countryid, ltrim(title)



/****************************************************************************

	Create a snapshot database on SQL Server 2005
	
*****************************************************************************/
CREATE DATABASE peerflix_ss ON
( NAME = peerflix_Data, FILENAME = 
'C:\SQLData\Peerflix_data_data.ss' )
AS SNAPSHOT OF peerflix;
GO


/******************************************************************************

	Today's inventory 
	
*******************************************************************************/
select * from dbo.ptb_Snapshot_InventoryMonitor 
where eventdate = (select max(eventdate) from dbo.ptb_Snapshot_InventoryMonitor)
order by countryid, ltrim(title)

/***************************************************************************
	Get the latest inventory status for a specific day
	
****************************************************************************/
-- snapshot of InvEvents
create table #temp_InvEvents (
	[InvEventID] [int] NOT NULL,
	[InvID] [int] NOT NULL,
	[WantID] [int] NULL,
	[UserID] [int] NULL,
	[AdminID] [int] NULL,
	[InvEventTypeID] [int] NULL,
	[ie_InsertDate] [datetime] NULL CONSTRAINT [DF_ptb_InvEvents_ie_InsertDate]  DEFAULT (getdate()),
	[ie_EventDate] [datetime] NULL,
	[ie_Pbv] [int] NULL,
	[SentTranID] [int] NULL
	)
INSERT INTO #temp_InvEvents
			([InvEventID]
		   ,[InvID]
           ,[WantID]
           ,[UserID]
           ,[AdminID]
           ,[InvEventTypeID]
           ,[ie_InsertDate]
           ,[ie_EventDate]
           ,[ie_Pbv]
           ,[SentTranID])
SELECT [InvEventID]
      ,[InvID]
      ,[WantID]
      ,[UserID]
      ,[AdminID]
      ,[InvEventTypeID]
      ,[ie_InsertDate]
      ,[ie_EventDate]
      ,[ie_Pbv]
      ,[SentTranID]
FROM [ptb_InvEvents] i
Where InvEventID = (select max(InvEventID) 
					from ptb_InvEvents i1 
					where i.invID=i1.InvID and i1.ie_InsertDate < dateadd(day, 1, @theDate)
					)


/***************************************************************************

	Set an users as friend and Family
	
****************************************************************************/

UPDATE ptbu_Users set Billingplanid=105 where u_login='raebuf@aol.com'


/*************************************************************************

		Cache Performance Test Script
		
*************************************************************************/

-- Responding time is not very good. 1.3S. But the throughput is good. 1000 calls take about 24 Second. Have
-- the most wants.

	declare @chosenWanterUserId int, @chosenWanterWantId int
	declare @count int
	declare @userid int
--exec pspS_GetBestValidWanterWithScoring_Cache 12442, 92407, @chosenWanterUserId out, @chosenWanterWantId out

	set @count = 1
	while ( @count < 1000)
	begin
		set @userid = 12440 + @count
		exec pspS_GetBestValidWanterWithScoring_Cache @userid, 92407, @chosenWanterUserId out, @chosenWanterWantId out
		set @count = @count + 1
	end



exec pspS_GetProductAggregatesByProduct_Cache 92407, 1
exec pspS_GetProductAggregatesByProductAggregateType_Cache 8,1


exec pspS_RssAvailable_Cache 166
exec pspS_RssAvailable 166

exec pspS_RssFeatured 166
exec pspS_RssFeatured_cache 166

exec pspS_RssInDemand 166
exec pspS_RssInDemand_Cache 166

exec pspS_RssRecentlyAdded 166 --'xukemicupu'
exec pspS_RssRecentlyAdded_Cache 166 --'xukemicupu'



/**************************************************************
	count sends and receives for a user list in a specific 
	period
***************************************************************/
select u.userid, u_login, u_firstname, u_lastname, 
	(select isnull(count(SentTranID),0) 
	 from ptb_InvEvents ie join ptb_InvEventTypes iet on ie.InvEventTypeID=iet.InvEventTypeID
	 where iet_IsForSentDate = 1 
		and datediff (day, ie_insertDate, getdate()) <= 60
		and ie.userid=tu.userid
	) Sends,
	(select isnull(count(SentTranID),0) 
	 from ptb_InvEvents ie join ptb_InvEventTypes iet on ie.InvEventTypeID=iet.InvEventTypeID
		join ptbu_wants w on ie.wantid=w.wantid
	 where iet_IsForReceivedDate = 1 
		and datediff (day, ie_insertDate, getdate()) <= 60
		and w.userid=tu.userid
	) receives
from ptbu_users u join temp_users tu on u.userid=tu.userid
order by u.userid 


/*************************************************
	Data Request Reports
	
**************************************************/
select count(userid)
from ptbu_users u
where exists (select *  
	 from ptb_InvEvents ie join ptb_InvEventTypes iet on ie.InvEventTypeID=iet.InvEventTypeID
	 where iet_IsForSentDate = 1 
		and datediff (day, ie_insertDate, getdate()) <= 30
		and ie.userid=u.userid
	)
	or
	exists (select *
	 from ptb_InvEvents ie join ptb_InvEventTypes iet on ie.InvEventTypeID=iet.InvEventTypeID
		join ptbu_wants w on ie.wantid=w.wantid
	 where iet_IsForReceivedDate = 1 
		and datediff (day, ie_insertDate, getdate()) <= 30
		and w.userid=u.userid
	)


/*************************************************
	SQL Statement for get the data from MySQL
	
**************************************************/

SELECT * into #temp_table FROM OPENROWSET('MSDASQL','Driver={MySQL ODBC 3.51 Driver};DB=Peerflix_Matrix_dbo;SERVER=localhost;uid=root;pwd=zzmzzm', 'select * from ptb_advertising')


/*************************************************
	Endicia users' address update
****************************************************/

--select count(*) from dbo.temp_address_new2 where status in ('25','31','32')
--select count(*) from dbo.temp_address_new2 where status in ('11','13','21','22')

set xact_abort on

begin transaction
declare @currDate datetime

set @currDate = getdate()

-- update the users' address with status 25,31, 32 
insert into dbo.ptbu_UserInfoChanges(
	uic_insertDate, 
	userid, 
	uic_Statetype, 
	uic_city,
	uic_zip,
	uic_Address1,
	uic_Address2
	)
select 
	@currDate,
	n.user_id, 
	s.StateID, 
	CITY,
	convert(varchar,zip)+'-'+convert(varchar,plus4),
	address_1,
	address_2
from temp_address_new2 n join ptb_states s on n.State_Code=s.st_Code
where n.status in ('25','31','32')
	and exists ( select * from ptbu_users u join ptbu_UserEvents ue on u.userid=ue.userid
				 where ue_insertsubtype=13 and u.userid=n.user_id)

update ptbu_users
set StateID = s.StateID,
	u_city = city,
	u_zip = convert(varchar,zip)+'-'+convert(varchar,plus4),
	u_Address1 = address_1,
	u_Address2 = address_2
from temp_address_new2 n join ptb_states s on n.State_Code=s.st_Code
where n.status in ('25','31','32')
	and ptbu_users.userid = n.user_id
	and exists ( select * from ptbu_users u join ptbu_UserEvents ue on u.userid=ue.userid
				 where ue_insertsubtype=13 and u.userid=n.user_id)

-- suspend user with status 11, 13, 21, 22
insert into ptbu_UserInfoChanges(userid, uic_Insertdate, uic_accStatus)
select user_id, @currDate, 3
from dbo.temp_address_new2 n
where status in ('11','13','21','22') 
	and exists (select * from ptbu_users u where u.userid=n.user_id)

update ptbu_users
set u_accStatus=3
from dbo.temp_address_new2 n
where n.user_ID = ptbu_users.userid and n.status in ('11','13','21','22')

commit transaction


/***************************************************************************

-- Set Free Account on Staging

****************************************************************************/
set xact_abort on
begin transaction


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221577

insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221577, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221580
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221580, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221581
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221581, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221583
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221583, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221584
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221584, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221585
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221585, 6, 6, 8, getdate(), 'Staging Test', 80995)

update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221586
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221586, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221592
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221592, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221595
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221595, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221596
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221596, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221597
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221597, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221600
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221600, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221602
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221602, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221607
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221607, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221609
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221609, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221612
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221612, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221614
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221614, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221618
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221618, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221621
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221621, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221622
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221622, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221623
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221623, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221626
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221626, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221627
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221627, 6, 6, 8, getdate(), 'Staging Test', 80995)


update ptbu_users 
set Billingplanid=6, u_pbbd = 6
where userid=221628
insert into dbo.ptb_CreditDebitAuditLogEntries (UserID, cda_PbbdIncrOrDecrAmount, cda_PbbdAfter,
	cda_CreditDebitType, cda_InsertDate, cda_Notes, cda_AdminID)
values (221628, 6, 6, 8, getdate(), 'Staging Test', 80995)


rollback transaction


/**********************************************************************
		update SentTran table with last scan date
		
***********************************************************************/

declare @tbl table (seqno int identity(1,1), sentTranID int, LastScanDate datetime,City varchar(50), stateid int, zip varchar(10))
create table #temp (sentTranID int, LastScanDate datetime,City varchar(50), stateid int, zip varchar(10))

insert @tbl (SentTranID, city, stateid, zip)
	select distinct st.sentTranID, c.city, c.stateid, c.zip
	from ptbu_SentTrans st
	inner join ptb_UspsMailScanLog usl on usl.SentTranID=st.SentTranID --7595r
	inner join ptb_Cities c on c.zip=(case when usl_CalcLocationZip5='-1' then usl_FacilityZipCode else usl.usl_CalcLocationZip5 end) --usl_CalcLocationZip5 --15625r
	where 1=1 --st_IsScanned=1
	and st.countryID=1 --58293r
	and st.st_LastScanDate is null

insert #temp (SentTranID, city, stateid, zip)
select SentTranID, city, stateid, zip
from @tbl t1
where seqno = (select min(seqno) from @tbl t2 where t1.senttranid=t2.senttranid)

update #temp
set LastScanDate = (select max(usl_ScanDate) from ptb_UspsMailScanLog where ptb_UspsMailScanLog.SentTranID=#temp.SentTranID)


begin tran
update ptbu_SentTrans
set st_LastScanDate = #temp.LastScanDate,
	st_LastScanCity = #temp.city,
	st_lastScanState = #temp.stateid,
	st_lastScanZip = #temp.zip
from #temp
where #temp.SentTranID = ptbu_SentTrans.SentTranID

rollback tran


/**********************************************************************
		investigating Product aggregates
***********************************************************************/

select pa.ProductAggregateTypeId, pat.pat_Description, pa_InsertDate, count(*) rownumber
from ptb_ProductAggregates pa join dbo.ptb_ProductAggregateTypes pat 
	on pa.ProductAggregateTypeId = pat.ProductAggregateTypeId
group by pa.ProductAggregateTypeId, pat.pat_Description, pa_InsertDate
order by pa.ProductAggregateTypeId, pat.pat_Description, pa_InsertDate
