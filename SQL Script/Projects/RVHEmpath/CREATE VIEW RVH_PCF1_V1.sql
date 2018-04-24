 CREATE VIEW RVH_PCF1_V1
(PCF1_YEAR, PCF1_RUN_ID, EM_EMPLOYEE_ID, PCF1_CHECK_SEQ_NO, PCF1_RECORD_TYPE, 
 PCF1_ALIGNMENT_NUMBER, PCF1_EMPLOYEE_ID_2, PCF1_ALT_CHECK_DATE, PCF1_ALT_CHECK_NO, PCF1_RECORD_TYPE_2, 
 PCF1_RECORD_NUMBER_2, PCF1_PAYROLL_RUN_A, PCF1_EMP_CHK_NO_A, CAL_PAY_PERIOD_ID, PYB_BANK_CODE, 
 PCF1_CHECK_NO, PCF1_CHECK_NAME, PCF1_EMPLOYEE_PAYROLL_UNIT, PCF1_CHECK_DATE, PCF1_CHECK_TYPE, 
 PCF1_CHECK_SORT, PCF1_DATA_02, PCF1_DATA_03, PCF1_DATA_04, PCF1_DATA_05, 
 PCF1_DATA_06, PCF1_DATA_07, PCF1_DATA_08, PCF1_DATA_09, PCF1_DATA_10, 
 PCF1_DATA_11, PCF1_DATA_12, PCF1_DATA_13, PCF1_DATA_14, PCF1_TAX_METHOD, 
 RVH_PCF1_SALARY_RATE, RVH_PCF1_GROSS_PAY, RVH_PCF1_CHECK_AMOUNT, RVH_PCF1_WEEKS_HRS_WORKED, RVH_PCF1_YTD_GROSS_PAY, 
 RVH_PCF1_YTD_NET_PAY, RVH_PCF1_AMOUNT1_1, RVH_PCF1_AMOUNT1_2, RVH_PCF1_AMOUNT1_3, RVH_PCF1_AMOUNT1_4, 
 RVH_PCF1_AMOUNT1_5, RVH_PCF1_AMOUNT1_6, RVH_PCF1_AMOUNT1_7, RVH_PCF1_AMOUNT1_8, RVH_PCF1_AMOUNT1_9, 
 RVH_PCF1_AMOUNT1_10, RVH_PCF1_AMOUNT1_11, RVH_PCF1_AMOUNT1_12, RVH_PCF1_AMOUNT1_13, RVH_PCF1_AMOUNT1_14, 
 RVH_PCF1_AMOUNT1_15, RVH_PCF1_AMOUNT1_16, RVH_PCF1_AMOUNT1_17, RVH_PCF1_AMOUNT1_18, RVH_PCF1_AMOUNT2_1, 
 RVH_PCF1_AMOUNT2_2, RVH_PCF1_AMOUNT2_3, RVH_PCF1_AMOUNT2_4, RVH_PCF1_AMOUNT2_5, RVH_PCF1_AMOUNT2_6, 
 RVH_PCF1_AMOUNT2_7, RVH_PCF1_AMOUNT2_8, RVH_PCF1_AMOUNT2_9, RVH_PCF1_AMOUNT2_10, RVH_PCF1_AMOUNT2_11, 
 RVH_PCF1_AMOUNT2_12, RVH_PCF1_AMOUNT2_13, RVH_PCF1_AMOUNT2_14, RVH_PCF1_AMOUNT2_15, RVH_PCF1_AMOUNT2_16, 
 RVH_PCF1_AMOUNT2_17, RVH_PCF1_AMOUNT2_18)
AS 
select pcf1.*,
	case when substring(dbo.binaryToString(pcf1_data_02,90),104,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_02,90),93,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_02,90),93,11))
	end RVH_PCF1_SALARY_RATE,

	case when substring(dbo.binaryToString(pcf1_data_02,90),116,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_02,90),105,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_02,90),105,11))
	end RVH_PCF1_GROSS_PAY,

	case when substring(dbo.binaryToString(pcf1_data_02,90),128,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_02,90),117,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_02,90),117,11))
	end RVH_PCF1_CHECK_AMOUNT,

	case when substring(dbo.binaryToString(pcf1_data_02,90),136,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_02,90),129,7)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_02,90),129,7))
	end RVH_PCF1_WEEKS_HRS_WORKED,

	case when substring(dbo.binaryToString(pcf1_data_02,90),152,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_02,90),141,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_02,90),141,11))
	end RVH_PCF1_YTD_GROSS_PAY,

	case when substring(dbo.binaryToString(pcf1_data_02,90),164,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_02,90),153,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_02,90),153,11))
	end RVH_PCF1_YTD_NET_PAY,

----------

	case when substring(dbo.binaryToString(pcf1_data_06,90),32,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),21,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),21,11))
	end RVH_PCF1_AMOUNT1_1,

	case when substring(dbo.binaryToString(pcf1_data_06,90),44,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),33,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),33,11))
	end RVH_PCF1_AMOUNT1_2,
	
	case when substring(dbo.binaryToString(pcf1_data_06,90),56,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),45,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),45,11))
	end RVH_PCF1_AMOUNT1_3,
	
	case when substring(dbo.binaryToString(pcf1_data_06,90),68,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),57,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),57,11))
	end RVH_PCF1_AMOUNT1_4,
	
	case when substring(dbo.binaryToString(pcf1_data_06,90),80,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),69,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),69,11))
	end RVH_PCF1_AMOUNT1_5,
	
	case when substring(dbo.binaryToString(pcf1_data_06,90),92,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),81,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),81,11))
	end RVH_PCF1_AMOUNT1_6,
	
	case when substring(dbo.binaryToString(pcf1_data_06,90),104,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),93,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),93,11))
	end RVH_PCF1_AMOUNT1_7,
	
	case when substring(dbo.binaryToString(pcf1_data_06,90),116,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),105,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),105,11))
	end RVH_PCF1_AMOUNT1_8,
	
	case when substring(dbo.binaryToString(pcf1_data_06,90),128,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),117,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),117,11))
	end RVH_PCF1_AMOUNT1_9,
	
	case when substring(dbo.binaryToString(pcf1_data_06,90),140,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),129,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),129,11))
	end RVH_PCF1_AMOUNT1_10,
	
	case when substring(dbo.binaryToString(pcf1_data_06,90),152,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),141,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),141,11))
	end RVH_PCF1_AMOUNT1_11,
	
	case when substring(dbo.binaryToString(pcf1_data_06,90),164,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),153,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),153,11))
	end RVH_PCF1_AMOUNT1_12,
	
	case when substring(dbo.binaryToString(pcf1_data_06,90),176,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),165,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),165,11))
	end RVH_PCF1_AMOUNT1_13,
--------



	case when substring(dbo.binaryToString(pcf1_data_07,90),8,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),177,4)+substring(dbo.binaryToString(pcf1_data_07,90),1,7) ) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_06,90),177,4)+substring(dbo.binaryToString(pcf1_data_07,90),1,7) )
	end RVH_PCF1_AMOUNT1_14,
	
	case when substring(dbo.binaryToString(pcf1_data_07,90),20,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),9,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),9,11))
	end RVH_PCF1_AMOUNT1_15,
	
	case when substring(dbo.binaryToString(pcf1_data_07,90),32,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),21,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),21,11))
	end RVH_PCF1_AMOUNT1_16,

	case when substring(dbo.binaryToString(pcf1_data_07,90),44,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),33,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),33,11))
	end RVH_PCF1_AMOUNT1_17,

	case when substring(dbo.binaryToString(pcf1_data_07,90),56,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),45,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),45,11))
	end RVH_PCF1_AMOUNT1_18,
	
		

	case when substring(dbo.binaryToString(pcf1_data_07,90),68,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),57,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),57,11))
	end RVH_PCF1_AMOUNT2_1,


	case when substring(dbo.binaryToString(pcf1_data_07,90),80,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),69,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),69,11))
	end RVH_PCF1_AMOUNT2_2,

	case when substring(dbo.binaryToString(pcf1_data_07,90),92,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),81,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),81,11))
	end RVH_PCF1_AMOUNT2_3,


	case when substring(dbo.binaryToString(pcf1_data_07,90),104,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),93,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),93,11))
	end RVH_PCF1_AMOUNT2_4,
	
	

	case when substring(dbo.binaryToString(pcf1_data_07,90),116,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),105,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),105,11))
	end RVH_PCF1_AMOUNT2_5,

	case when substring(dbo.binaryToString(pcf1_data_07,90),128,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),117,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),117,11))
	end RVH_PCF1_AMOUNT2_6,

	case when substring(dbo.binaryToString(pcf1_data_07,90),140,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),129,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),129,11))
	end RVH_PCF1_AMOUNT2_7,

	case when substring(dbo.binaryToString(pcf1_data_07,90),152,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),141,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),141,11))
	end RVH_PCF1_AMOUNT2_8,

	case when substring(dbo.binaryToString(pcf1_data_07,90),164,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),153,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),153,11))
	end RVH_PCF1_AMOUNT2_9,

	case when substring(dbo.binaryToString(pcf1_data_07,90),176,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),165,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),165,11))
	end RVH_PCF1_AMOUNT2_10,
	
	
--------
	case when substring(dbo.binaryToString(pcf1_data_08,90),8,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),177,4)+substring(dbo.binaryToString(pcf1_data_08,90),1,7) ) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_07,90),177,4)+substring(dbo.binaryToString(pcf1_data_08,90),1,7) )
	end RVH_PCF1_AMOUNT2_11,
	
	case when substring(dbo.binaryToString(pcf1_data_08,90),20,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),9,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),9,11))
	end RVH_PCF1_AMOUNT2_12,
	
	


	case when substring(dbo.binaryToString(pcf1_data_08,90),32,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),21,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),21,11))
	end RVH_PCF1_AMOUNT2_13,

	case when substring(dbo.binaryToString(pcf1_data_08,90),44,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),33,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),33,11))
	end RVH_PCF1_AMOUNT2_14,

	case when substring(dbo.binaryToString(pcf1_data_08,90),56,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),45,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),45,11))
	end RVH_PCF1_AMOUNT2_15,
	
		

	case when substring(dbo.binaryToString(pcf1_data_08,90),68,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),57,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),57,11))
	end RVH_PCF1_AMOUNT2_16,


	case when substring(dbo.binaryToString(pcf1_data_08,90),80,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),69,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),69,11))
	end RVH_PCF1_AMOUNT2_17,

	case when substring(dbo.binaryToString(pcf1_data_08,90),92,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),81,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf1_data_08,90),81,11))
	end RVH_PCF1_AMOUNT2_18



from pcf1

