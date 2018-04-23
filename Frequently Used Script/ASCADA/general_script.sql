-- =============================================
-- Script Template
-- =============================================

select SUM(apartment) apt_total, SUM(shared) shared_total, SUM(town_house) th_total, 
	SUM(budget) budget_total ,
	SUM(from_strata_fee) strata_fee_total, 
	SUM(from_surplus) from_surplus_total
from
(
select a.code, b.description, a.budget, a.from_surplus, budget-from_surplus from_strata_fee, 
	(budget-from_surplus)*pc_apartment/100.00 Apartment, 
	(budget-from_surplus)*pc_shared/100.00 Shared,	
	(budget-from_surplus)*pc_townhouse/100.00 Town_House,
	b.pc_apartment, b.pc_shared, b.pc_townhouse, 
	b.pc_apartment+b.pc_shared + b.pc_townhouse total_percent
	
from tbl_budget_actual a join dbo.lu_ledger_code_distribution b on a.code=b.code
) v



-- calculating UE percentage
declare @ue_all decimal (10,2), @ue_apt decimal (10,2), @ue_th decimal(10,2)

select @ue_all = SUM(unit_entitlement)
from dbo.tbl_unit_entitlement

select @ue_apt = SUM(unit_entitlement)
from dbo.tbl_unit_entitlement
where u_type = 'A'

select @ue_th = SUM(unit_entitlement)
from dbo.tbl_unit_entitlement
where u_type = 'T'


update dbo.tbl_unit_entitlement 
set pc_ue_all = unit_entitlement/@ue_all, 
	pc_ue_apt = case when u_type = 'A' then unit_entitlement/@ue_apt else 0 end,
	pc_ue_th = case when u_type = 'T' then unit_entitlement/@ue_th else 0 end


-- calculating strata fee
declare @fiscal_year int
declare @budget_apt decimal (12,2), @budget_shared decimal (12,2)

set @fiscal_year = 2014
set @budget_apt =  162651.00 
set @budget_shared =   366608.00 
 --325365.00 

select @fiscal_year, unit_number, 
	(@budget_apt*pc_ue_apt + @budget_shared*pc_ue_all)/12 [Total],
	@budget_apt*pc_ue_apt/12 [Apartment], @budget_shared*pc_ue_all/12 [Shared]
from dbo.tbl_unit_entitlement
order by @budget_apt*pc_ue_apt + @budget_shared*pc_ue_all desc

