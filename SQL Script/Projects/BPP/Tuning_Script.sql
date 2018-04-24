alter table dbo.FactLedger
add id bigint identity not null


alter table dbo.FactLedger
add constraint PK_ID primary key clustered (id)


create index IX_FactLedger_Acct
on factLedger (Account)


create index IX_FactLedger_Acct_FY_AP_BU_FC_PI
on factLedger (Account, Fiscal_year, Accounting_period, Business_Unit, Fund_code, Project_ID)

create index IX_FactLedger_BU
on factLedger (Business_Unit)

create index IX_FactLedger_FC
on factLedger (Fund_code)

create index IX_FactLedger_PI
on factLedger (Project_ID)

