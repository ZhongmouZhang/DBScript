 CREATE VIEW RVH_PCF2_V1
(PCF2_YEAR, PCF2_RUN_ID, EM_EMPLOYEE_ID, PCF2_CHECK_SEQ_NO, PCF2_RECORD_TYPE, 
 PCF2_RECORD_NUMBER, PCF2_EMPLOYEE_ID_2, PCF2_CHECK_DATE_2, PCF2_CHECK_NO_2, PCF2_RECORD_TYPE_2, 
 PCF2_RECORD_NUMBER_2, PCF2_DATA_01, PCF2_DATA_02, PCF2_DATA_03, PCF2_DATA_04, 
 PCF2_DATA_05, PCF2_DATA_06, PCF2_DATA_07, PCF2_DATA_08, PCF2_DATA_09, 
 PCF2_DATA_10, PCF2_DATA_11, PCF2_DATA_12, PCF2_DATA_13, PCF2_DATA_14, 
 RVH_PCF2_AMOUNT1_1, RVH_PCF2_AMOUNT1_2, RVH_PCF2_AMOUNT1_3, RVH_PCF2_AMOUNT1_4, RVH_PCF2_AMOUNT1_5, 
 RVH_PCF2_AMOUNT1_6, RVH_PCF2_AMOUNT1_7, RVH_PCF2_AMOUNT1_8, RVH_PCF2_AMOUNT1_9, RVH_PCF2_AMOUNT1_10, 
 RVH_PCF2_AMOUNT1_11, RVH_PCF2_AMOUNT1_12, RVH_PCF2_AMOUNT1_13, RVH_PCF2_AMOUNT1_14, RVH_PCF2_AMOUNT1_15, 
 RVH_PCF2_AMOUNT1_16, RVH_PCF2_AMOUNT1_17, RVH_PCF2_AMOUNT1_18, RVH_PCF2_AMOUNT1_19, RVH_PCF2_AMOUNT1_20, 
 RVH_PCF2_AMOUNT1_21, RVH_PCF2_AMOUNT1_22, RVH_PCF2_AMOUNT2_1, RVH_PCF2_AMOUNT2_2, RVH_PCF2_AMOUNT2_3, 
 RVH_PCF2_AMOUNT2_4, RVH_PCF2_AMOUNT2_5, RVH_PCF2_AMOUNT2_6, RVH_PCF2_AMOUNT2_7, RVH_PCF2_AMOUNT2_8, 
 RVH_PCF2_AMOUNT2_9, RVH_PCF2_AMOUNT2_10, RVH_PCF2_AMOUNT2_11, RVH_PCF2_AMOUNT2_12, RVH_PCF2_AMOUNT2_13, 
 RVH_PCF2_AMOUNT2_14, RVH_PCF2_AMOUNT2_15, RVH_PCF2_AMOUNT2_16, RVH_PCF2_AMOUNT2_17, RVH_PCF2_AMOUNT2_18, 
 RVH_PCF2_AMOUNT2_19, RVH_PCF2_AMOUNT2_20, RVH_PCF2_AMOUNT2_21, RVH_PCF2_AMOUNT2_22)
AS 
select pcf2.*,
	case when substring(dbo.binaryToString(pcf2_data_04,90),2,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_03,90),171,10)+substring(dbo.binaryToString(pcf2_data_04,90),1,1) ) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_03,90),171,10)+substring(dbo.binaryToString(pcf2_data_04,90),1,1) )
	end RVH_pcf2_AMOUNT1_1,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),14,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),3,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),3,11))
	end RVH_pcf2_AMOUNT1_2,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),26,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),15,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),15,11))
	end RVH_pcf2_AMOUNT1_3,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),38,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),27,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),27,11))
	end RVH_pcf2_AMOUNT1_4,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),50,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),39,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),39,11))
	end RVH_pcf2_AMOUNT1_5,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),62,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),51,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),51,11))
	end RVH_pcf2_AMOUNT1_6,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),74,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),63,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),63,11))
	end RVH_pcf2_AMOUNT1_7,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),86,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),75,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),75,11))
	end RVH_pcf2_AMOUNT1_8,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),98,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),87,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),87,11))
	end RVH_pcf2_AMOUNT1_9,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),110,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),99,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),99,11))
	end RVH_pcf2_AMOUNT1_10,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),122,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),111,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),111,11))
	end RVH_pcf2_AMOUNT1_11,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),134,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),123,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),123,11))
	end RVH_pcf2_AMOUNT1_12,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),146,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),135,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),135,11))
	end RVH_pcf2_AMOUNT1_13,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),158,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),147,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),147,11))
	end RVH_pcf2_AMOUNT1_14,
	
	case when substring(dbo.binaryToString(pcf2_data_04,90),170,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),159,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),159,11))
	end RVH_pcf2_AMOUNT1_15,

-----------------------------------------------------
	case when substring(dbo.binaryToString(pcf2_data_05,90),2,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),171,10)+substring(dbo.binaryToString(pcf2_data_05,90),1,1) ) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_04,90),171,10)+substring(dbo.binaryToString(pcf2_data_05,90),1,1) )
	end RVH_pcf2_AMOUNT1_16,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),14,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),3,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),3,11))
	end RVH_pcf2_AMOUNT1_17,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),26,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),15,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),15,11))
	end RVH_pcf2_AMOUNT1_18,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),38,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),27,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),27,11))
	end RVH_pcf2_AMOUNT1_19,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),50,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),39,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),39,11))
	end RVH_pcf2_AMOUNT1_20,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),62,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),51,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),51,11))
	end RVH_pcf2_AMOUNT1_21,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),74,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),63,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),63,11))
	end RVH_pcf2_AMOUNT1_22,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),86,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),75,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),75,11))
	end RVH_pcf2_AMOUNT2_1,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),98,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),87,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),87,11))
	end RVH_pcf2_AMOUNT2_2,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),110,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),99,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),99,11))
	end RVH_pcf2_AMOUNT2_3,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),122,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),111,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),111,11))
	end RVH_pcf2_AMOUNT2_4,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),134,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),123,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),123,11))
	end RVH_pcf2_AMOUNT2_5,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),146,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),135,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),135,11))
	end RVH_pcf2_AMOUNT2_6,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),158,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),147,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),147,11))
	end RVH_pcf2_AMOUNT2_7,
	
	case when substring(dbo.binaryToString(pcf2_data_05,90),170,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),159,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),159,11))
	end RVH_pcf2_AMOUNT2_8,

-----------------------------------------------------

	case when substring(dbo.binaryToString(pcf2_data_06,90),2,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),171,10)+substring(dbo.binaryToString(pcf2_data_06,90),1,1) ) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_05,90),171,10)+substring(dbo.binaryToString(pcf2_data_06,90),1,1) )
	end RVH_pcf2_AMOUNT2_9,
	
	case when substring(dbo.binaryToString(pcf2_data_06,90),14,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),3,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),3,11))
	end RVH_pcf2_AMOUNT2_10,
	
	case when substring(dbo.binaryToString(pcf2_data_06,90),26,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),15,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),15,11))
	end RVH_pcf2_AMOUNT2_11,
	
	case when substring(dbo.binaryToString(pcf2_data_06,90),38,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),27,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),27,11))
	end RVH_pcf2_AMOUNT2_12,
	
	case when substring(dbo.binaryToString(pcf2_data_06,90),50,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),39,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),39,11))
	end RVH_pcf2_AMOUNT2_13,
	
	case when substring(dbo.binaryToString(pcf2_data_06,90),62,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),51,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),51,11))
	end RVH_pcf2_AMOUNT2_14,
	
	case when substring(dbo.binaryToString(pcf2_data_06,90),74,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),63,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),63,11))
	end RVH_pcf2_AMOUNT2_15,
	
	case when substring(dbo.binaryToString(pcf2_data_06,90),86,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),75,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),75,11))
	end RVH_pcf2_AMOUNT2_16,
	
	case when substring(dbo.binaryToString(pcf2_data_06,90),98,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),87,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),87,11))
	end RVH_pcf2_AMOUNT2_17,
	
	case when substring(dbo.binaryToString(pcf2_data_06,90),110,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),99,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),99,11))
	end RVH_pcf2_AMOUNT2_18,
	
	case when substring(dbo.binaryToString(pcf2_data_06,90),122,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),111,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),111,11))
	end RVH_pcf2_AMOUNT2_19,
	
	case when substring(dbo.binaryToString(pcf2_data_06,90),134,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),123,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),123,11))
	end RVH_pcf2_AMOUNT2_20,
	
	case when substring(dbo.binaryToString(pcf2_data_06,90),146,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),135,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),135,11))
	end RVH_pcf2_AMOUNT2_21,
	
	case when substring(dbo.binaryToString(pcf2_data_06,90),158,1)='D' 
		then -1*convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),147,11)) 
		else convert(decimal(15,0), substring(dbo.binaryToString(pcf2_data_06,90),147,11))
	end RVH_pcf2_AMOUNT2_22

from pcf2