 select a.AppID, a.AppName, a.Description, d.InstanceName, d.DBName, asi.*, t2.*,c.*
from dbo.Applications a left join databases d on a.AppID = d.AppID
		left join dbo.AppSupportInfo asi on asi.appid = a.appid
--		left join dbo.Teams t1 on t1.TeamID = asi.OwnershipTeamID
		left join dbo.Teams t2 on t2.TeamID = asi.SupportTeamID
		left join dbo.TeamMembers tm on tm.teamid = t2.teamid
		left join dbo.ContactInfo c on c.ContactID = tm.ContactID
--		left join dbo.Teams t3 on t3.TeamID = asi.FanoutTeamID
order by a.AppName,InstanceName
