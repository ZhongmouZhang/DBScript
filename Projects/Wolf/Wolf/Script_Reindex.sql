 user master;

-- log backup before switching recovery mode to simple
exec master.dbo.hsp_LogSwitchAndLogBackup_Only
alter database WolfTables set RECOVERY SIMPLE

    ALTER INDEX [PK_ProviderPayeeNumber] ON dbo.ProviderPayeeNumber REORGANIZE
    ALTER INDEX [PK_Facility] ON WolfReference.Facility REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_dbo.WellnetFormCodeXReference] ON dbo.WellnetFDBFormXRef REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblBuilding_PK] ON dbo.tblBuilding REBUILD WITH (ONLINE=ON)
    ALTER INDEX [IX_tblBuildingBCInstitutionNumber] ON dbo.tblBuilding REBUILD WITH (ONLINE=ON)
    ALTER INDEX [tblPatientID_uq] ON dbo.tblPatientID REORGANIZE
    ALTER INDEX [PK_FeeVisitRuleGroupCode] ON dbo.FeeVisitRuleGroupCode REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblCDMFlowSheet_PK] ON dbo.tblCDMFlowSheet REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_Address] ON WolfCommon.Address REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_tblChild] ON dbo.tblChild REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblVaccineLot_PK] ON dbo.tblVaccineLot REBUILD WITH (ONLINE=ON)
    ALTER INDEX [idx_tblPtRefillFlagPharmCalledPharmIDMedicationNo] ON dbo.tblPtRefill REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblInvoice_PK] ON dbo.tblInvoice REBUILD WITH (ONLINE=ON)
    ALTER INDEX [IX_tblInvoiceInvoiceDate] ON dbo.tblInvoice REORGANIZE
    ALTER INDEX [IX_tblInvoicePaidDate] ON dbo.tblInvoice REORGANIZE
    ALTER INDEX [PK_FeeCodeFeeGroup] ON WolfReference.FeeCodeFeeGroup REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblPregnancyTopicDiscussions_PK] ON dbo.tblPregnancyTopicDiscussions REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_specialties] ON dbo.Specialties REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblInvoiceBilling_PK] ON dbo.tblInvoiceBilling REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblPtStatus_PK] ON dbo.tblPtStatus REBUILD WITH (ONLINE=ON)
    ALTER INDEX [tblAddress_uq] ON dbo.tblAddress REORGANIZE
    ALTER INDEX [aaaaatblInvoicePayment_PK] ON dbo.tblInvoicePayment REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_tblAnticoag] ON dbo.tblAnticoag REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaaAllergies_PK] ON dbo.Allergies REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_MergeMetadata] ON dbo.MergeMetaData REBUILD WITH (ONLINE=ON)
    ALTER INDEX [tblAppt_uq] ON dbo.tblAppt REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaamultum_category_drug_xref_PK] ON dbo.multum_category_drug_xref REBUILD WITH (ONLINE=ON)
    ALTER INDEX [IX_tblRemitRemitID] ON dbo.tblRemit REBUILD WITH (ONLINE=ON)
    ALTER INDEX [IX_tblRemitRemitDate] ON dbo.tblRemit REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblRemit_PK] ON dbo.tblRemit REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_tblRemitAdjustment] ON dbo.tblRemitAdjustment REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblWCBFormDetails_PK] ON dbo.tblWCBFormDetails REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_tblPtPregnancyMain] ON dbo.tblPtPregnancyMain REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_CDMFlowsheetElement] ON dbo.CDMFlowsheetElement REBUILD WITH (ONLINE=ON)
    ALTER INDEX [idx_tblHL7AS4_AS4Code_ID] ON dbo.tblHL7AS4 REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_FeeModifierRate] ON WolfReference.FeeModifierRate REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_tblRequisitionCode] ON dbo.tblRequisitionCode REBUILD WITH (ONLINE=ON)
    ALTER INDEX [tblPtImpression_uq] ON dbo.tblPtImpression REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_tblHL7LabLookUpTables] ON dbo.tblHL7LabLookUpTables REBUILD WITH (ONLINE=ON)
    ALTER INDEX [IX_tblHL7LabLookUpTables] ON dbo.tblHL7LabLookUpTables REBUILD WITH (ONLINE=ON)
    ALTER INDEX [IX_tblMDAssocEffectiveFromDateEffectiveToDate] ON dbo.tblMDAssoc REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblMDCoverage_PK] ON dbo.tblMDCoverage REBUILD WITH (ONLINE=ON)
    ALTER INDEX [IX_PhysicianCovering] ON dbo.Physician REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblPtPregnancy_PK] ON dbo.tblPtPregnancyOLD3 REBUILD WITH (ONLINE=ON)
    ALTER INDEX [idx_tblPtPregnancyPatientID] ON dbo.tblPtPregnancyOLD3 REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblEBill_PK] ON dbo.tblEBill REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblEBillRefusalCode_PK] ON dbo.tblEBillRefusalCode REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_tblMunicipality] ON dbo.tblMunicipality REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_tblDemographicsBackup] ON dbo.tblDemographicsBackup REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblEmployer_PK] ON dbo.tblEmployer REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblINR_PK] ON dbo.tblINR REBUILD WITH (ONLINE=ON)
    ALTER INDEX [tblExam_uq] ON dbo.tblExam REBUILD WITH (ONLINE=ON)
    ALTER INDEX [idx_PatientID] ON dbo.RuleMatch REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblBillingAdjustment_PK] ON dbo.tblBillingAdjustment REBUILD WITH (ONLINE=ON)
    ALTER INDEX [PK_CDMXMLValueConversion] ON dbo.CDMXMLValueConversion REBUILD WITH (ONLINE=ON)
    ALTER INDEX [aaaaatblInvestigation_PK] ON dbo.tblInvestigation REBUILD WITH (ONLINE=ON)
    ALTER INDEX [IX_tblInvestigationStatus] ON dbo.tblInvestigation REBUILD WITH (ONLINE=ON)
    ALTER INDEX [IX_tblInvestigationPatientID] ON dbo.tblInvestigation REBUILD WITH (ONLINE=ON)
    ALTER INDEX [tblPatientAddress_uq] ON dbo.tblPatientAddress REORGANIZE
    ALTER INDEX [aaaaaConsultants_PK] ON dbo.Consultants REORGANIZE


alter database WolfTables set RECOVERY full;

-- full backup after switch recovery to FULL
declare @dest varchar(1000)
select @dest='E:\MSSQL\BACKUP\WolfTables'  + '_Full_'
	+convert(varchar,getdate(),112)+'_' 
	+ 
	case when datepart(hour,getdate())>9 then convert(varchar,datepart(hour,getdate()))
		 else '0' + convert(varchar,datepart(hour,getdate()))
	end
	+
	case when datepart(minute,getdate())>9 then  convert(varchar,datepart(minute,getdate()))
		 else '0' + convert(varchar,datepart(hour,getdate()))
	end
	+ '00'
	+'.bak'
backup database WolfTables to Disk=@dest with init,STATS 

