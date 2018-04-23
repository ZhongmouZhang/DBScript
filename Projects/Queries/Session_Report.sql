 USE [SESSIONS_FOR_TEST]
GO
/****** Object:  View [dbo].[SESSION_REPORT]    Script Date: 09/08/2010 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER view [dbo].[SESSION_REPORT]
as
select  u.FirstName, u.LastName, 0 MSPPractitionerID,  u.VendorNumber, u.VendorName,   --count(*) 
		--u.PayeeName, 
		u.DoNotPay, g.Name GroupName, fy.StartDateTime FiscalYear,r.Start RateStartDate,
		r.Amount GroupRate, r.RuralRetentionPremium RRPRate, g.TimeSharablePercentage,VendorType PayToGroup, c.CertficateCode,
		c.CreatedDateTime, lcs.text CertificateStatus, f.CreatedDateTime FinanceCertificateDateCreated, l_fcs.text, f.AttachedToVoucher,
		l_a.name Agency, l_s.name Site, l_p.name Program, l_c.name Control, l_sc.name Subcontrol,
		l_a.Number AgencyCode, l_s.Number SiteCode, l_p.Number ProgramCode, l_c.Number ControlCode, l_sc.Number SubcontrolCode,
		s.StartTime DateTimeFrom, s.EndTime DateTimeTo, datediff(mi, s.StartTime,s.EndTime)/60.0 HoursWorked, s.FinanceAdjustment, l_ss.text SessionStatus,
		c.PhysicianSignature, c.SigningAuthoritySignature, g.AgencyFinanceCode, g.OperatingFundFinanceCode,g.SiteFinanceCode,
		g.ProjectsFinanceCode, g.APPExpenseDepartmentCode, g.APPExpenseAccountCode, g.NonAPPExpenseDepartmentCode, g.NonAPPExpenseAccountCode,
		v.Code VoucherCode, r_f.tbl_ReimbursementsID
from tbl_users u join dbo.li_OneToMany_tbl_Users_tbl_Sessions u_s on u.id = u_s.tbl_UsersID
		join dbo.tbl_Sessions s on s.id = u_s.tbl_sessionsid
		join lu_SessionStates l_ss on l_ss.id = s.lu_SessionStatesID
		join dbo.li_OneToMany_tbl_Groups_tbl_Sessions g_s on s.id = g_s.tbl_sessionsid
		join dbo.tbl_Groups g on g.id = g_s.tbl_groupsid
		join dbo.li_OneToMany_tbl_Certificates_tbl_Sessions c_s on s.id = c_s.tbl_SessionsID
		join dbo.tbl_Certificates c on c.ID = c_s.tbl_CertificatesID
		join dbo.lu_CertificateStates lcs on lcs.id = c.lu_CertificateStatesID
		join dbo.li_OneToMany_tbl_FinanceCertificates_tbl_Sessions f_s on s.id = f_s.tbl_SessionsID
		join dbo.tbl_FinanceCertificates f on f.id = f_s.tbl_FinanceCertificatesID
		join dbo.lu_FinanceCertificateStates l_fcs on l_fcs.id = f.lu_FinanceCertificateStatesID
		join dbo.lu_Agencies l_a on l_a.id = g.lu_AgenciesID
		join dbo.lu_Sites l_s on l_s.id = g.lu_SitesID
		join dbo.lu_Programs l_p on l_p.id = g.lu_ProgramsID
		join dbo.lu_Controls l_c on l_c.id = g.lu_ControlsID
		join dbo.lu_SubControls l_sc on l_sc.id=g.lu_SubControlsID
		join dbo.li_OneToMany_tbl_Vouchers_tbl_FinanceCertificates v_f on v_f.tbl_FinanceCertificatesID=f.id
		join dbo.tbl_Vouchers v on v.id = v_f.tbl_VouchersID
		join dbo.li_OneToMany_tbl_Reimbursements_tbl_FinanceCertificates r_f on r_f.tbl_FinanceCertificatesID = f.id
		join dbo.tbl_FinancialYears fy on fy.id = dbo.fn_get_financialyear_id (s.starttime)
		join dbo.li_OneToMany_tbl_Groups_tbl_Rates g_r on g_r.tbl_GroupsID = g.id
		join dbo.tbl_Rates r on r.id =g_r.tbl_RatesID and dbo.fn_get_financialyear_id (r.Start)=fy.id

