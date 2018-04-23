 -- statement 1.1

SELECT   100 AS "C0" 
FROM     "BPP"."dbo"."FactLedger" "FactLedger", 
         "BPP"."dbo"."Dim_BusinessUnit" "Dim_BusinessUnit", 
         "BPP"."dbo"."Dim_Fund" "Dim_Fund", 
         "BPP"."dbo"."Dim_Account_BPP" "Dim_Account_BPP", 
         "BPP"."dbo"."Dim_Time" "Dim_Time" 
WHERE    ("FactLedger"."BUSINESS_UNIT" IN (N'BC Centre for Disease Control') 
           OR "Dim_BusinessUnit"."BusinessUnit_L2_Descr" IN (N'BC Centre for Disease Control') 
           OR CASE 
                WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
              END IN (N'BC Centre for Disease Control')) 
         AND ("FactLedger"."FUND_CODE" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L1_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L2_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L3_Descr" IN (N'OPERATING FUND')) 
         AND ("FactLedger"."ACCOUNT" IN (N'6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L1_Descr" IN ('6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L2_Descr" IN ('6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L3_Descr" IN ('6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L4_Descr" IN ('6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L5_Descr" IN ('6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L6_Descr" IN ('6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L7_Descr" IN ('6800060')) 
         AND (Cast("Dim_Time"."YearKey" AS CHAR(4)) + '.' + "Dim_Time"."Quarter" IN ('P12-09') 
               OR "Dim_Time"."PeriodDescr" IN ('P12-09') 
               OR "Dim_Time"."YearDescr" IN ('P12-09')) 
         AND ('All' = 'All' 
               OR "Dim_BusinessUnit"."BusinessUnit_LeafNode_Descr" IN (N'All') 
               OR CASE 
                    WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                    ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
                  END = N'All') 
         AND "Dim_Time"."YearKey" = "FactLedger"."FISCAL_YEAR" 
         AND "Dim_Time"."PeriodKey" = "FactLedger"."ACCOUNTING_PERIOD" 
         AND "Dim_Account_BPP"."Account_BPP_LeafNode_Code" = "FactLedger"."ACCOUNT" 
         AND "Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" = "FactLedger"."BUSINESS_UNIT" 
         AND "Dim_Fund"."Fund_LeafNode_Code" = "FactLedger"."FUND_CODE" 
ORDER BY 1 ASC 


-- statement 1.2
SELECT   "FactLedger"."BUSINESS_UNIT" AS "C0", 
         "FactLedger"."FUND_CODE"     AS "C1", 
         "FactLedger"."ACCOUNT"       AS "C2", 
         "FactLedger"."DEPTID"        AS "C3", 
         "FactLedger"."SITE"          AS "C4", 
         "FactLedger"."PROJECT_ID"    AS "C5", 
         "FactLedger"."TRANS_DATE"    AS "C6", 
         "FactLedger"."JRNL_LN_REF"   AS "C7", 
         "FactLedger"."LINE_DESCR"    AS "C8", 
         Rtrim("FactLedger"."REF_04") AS "C9", 
         Rtrim("FactLedger"."REF_06") AS "C10", 
         "FactLedger"."JOURNAL_ID"    AS "C11", 
         "Dim_Time"."PeriodDescr"     AS "C12", 
         "FactLedger"."MONETARY_AMT"  AS "C13" 
FROM     "BPP"."dbo"."FactLedger" "FactLedger", 
         "BPP"."dbo"."Dim_Time" "Dim_Time", 
         "BPP"."dbo"."Dim_BusinessUnit" "Dim_BusinessUnit", 
         "BPP"."dbo"."Dim_Fund" "Dim_Fund", 
         "BPP"."dbo"."Dim_Account_BPP" "Dim_Account_BPP" 
WHERE    ("FactLedger"."BUSINESS_UNIT" IN (N'BC Centre for Disease Control') 
           OR "Dim_BusinessUnit"."BusinessUnit_L2_Descr" IN (N'BC Centre for Disease Control') 
           OR CASE 
                WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
              END IN (N'BC Centre for Disease Control')) 
         AND ("FactLedger"."FUND_CODE" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L1_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L2_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L3_Descr" IN (N'OPERATING FUND')) 
         AND ("FactLedger"."ACCOUNT" IN (N'6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L1_Descr" IN ('6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L2_Descr" IN ('6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L3_Descr" IN ('6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L4_Descr" IN ('6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L5_Descr" IN ('6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L6_Descr" IN ('6800060') 
               OR "Dim_Account_BPP"."Account_BPP_L7_Descr" IN ('6800060')) 
         AND (Cast("Dim_Time"."YearKey" AS CHAR(4)) + '.' + "Dim_Time"."Quarter" IN ('P12-09') 
               OR "Dim_Time"."PeriodDescr" IN ('P12-09') 
               OR "Dim_Time"."YearDescr" IN ('P12-09')) 
         AND ('All' = 'All' 
               OR "Dim_BusinessUnit"."BusinessUnit_LeafNode_Descr" IN (N'All') 
               OR CASE 
                    WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                    ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
                  END = N'All') 
         AND "Dim_Time"."YearKey" = "FactLedger"."FISCAL_YEAR" 
         AND "Dim_Time"."PeriodKey" = "FactLedger"."ACCOUNTING_PERIOD" 
         AND "Dim_Account_BPP"."Account_BPP_LeafNode_Code" = "FactLedger"."ACCOUNT" 
         AND "Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" = "FactLedger"."BUSINESS_UNIT" 
         AND "Dim_Fund"."Fund_LeafNode_Code" = "FactLedger"."FUND_CODE" 
ORDER BY 12 ASC 

-- statement 2.1
SELECT   100 AS "C0" 
FROM     "BPP"."dbo"."FactLedger" "FactLedger", 
         "BPP"."dbo"."Dim_BusinessUnit" "Dim_BusinessUnit", 
         "BPP"."dbo"."Dim_Fund" "Dim_Fund", 
         "BPP"."dbo"."Dim_Account_BPP" "Dim_Account_BPP", 
         "BPP"."dbo"."Dim_Time" "Dim_Time" 
WHERE    ("FactLedger"."BUSINESS_UNIT" IN (N'BC Centre for Disease Control') 
           OR "Dim_BusinessUnit"."BusinessUnit_L2_Descr" IN (N'BC Centre for Disease Control') 
           OR CASE 
                WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
              END IN (N'BC Centre for Disease Control')) 
         AND ("FactLedger"."FUND_CODE" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L1_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L2_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L3_Descr" IN (N'OPERATING FUND')) 
         AND ("FactLedger"."ACCOUNT" IN (N'Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L1_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L2_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L3_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L4_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L5_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L6_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L7_Descr" IN ('Travel')) 
         AND (Cast("Dim_Time"."YearKey" AS CHAR(4)) + '.' + "Dim_Time"."Quarter" IN ('P11-09') 
               OR "Dim_Time"."PeriodDescr" IN ('P11-09') 
               OR "Dim_Time"."YearDescr" IN ('P11-09')) 
         AND ('All' = 'All' 
               OR "Dim_BusinessUnit"."BusinessUnit_LeafNode_Descr" IN (N'All') 
               OR CASE 
                    WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                    ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
                  END = N'All') 
         AND "Dim_Time"."YearKey" = "FactLedger"."FISCAL_YEAR" 
         AND "Dim_Time"."PeriodKey" = "FactLedger"."ACCOUNTING_PERIOD" 
         AND "Dim_Account_BPP"."Account_BPP_LeafNode_Code" = "FactLedger"."ACCOUNT" 
         AND "Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" = "FactLedger"."BUSINESS_UNIT" 
         AND "Dim_Fund"."Fund_LeafNode_Code" = "FactLedger"."FUND_CODE" 
ORDER BY 1 ASC 

------------------------------2.2---------------------------------------------------------------

SELECT   "FactLedger"."BUSINESS_UNIT" AS "C0", 
         "FactLedger"."FUND_CODE"     AS "C1", 
         "FactLedger"."ACCOUNT"       AS "C2", 
         "FactLedger"."DEPTID"        AS "C3", 
         "FactLedger"."SITE"          AS "C4", 
         "FactLedger"."PROJECT_ID"    AS "C5", 
         "FactLedger"."TRANS_DATE"    AS "C6", 
         "FactLedger"."JRNL_LN_REF"   AS "C7", 
         "FactLedger"."LINE_DESCR"    AS "C8", 
         Rtrim("FactLedger"."REF_04") AS "C9", 
         Rtrim("FactLedger"."REF_06") AS "C10", 
         "FactLedger"."JOURNAL_ID"    AS "C11", 
         "Dim_Time"."PeriodDescr"     AS "C12", 
         "FactLedger"."MONETARY_AMT"  AS "C13" 
FROM     "BPP"."dbo"."FactLedger" "FactLedger", 
         "BPP"."dbo"."Dim_Time" "Dim_Time", 
         "BPP"."dbo"."Dim_BusinessUnit" "Dim_BusinessUnit", 
         "BPP"."dbo"."Dim_Fund" "Dim_Fund", 
         "BPP"."dbo"."Dim_Account_BPP" "Dim_Account_BPP" 
WHERE    ("FactLedger"."BUSINESS_UNIT" IN (N'BC Centre for Disease Control') 
           OR "Dim_BusinessUnit"."BusinessUnit_L2_Descr" IN (N'BC Centre for Disease Control') 
           OR CASE 
                WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
              END IN (N'BC Centre for Disease Control')) 
         AND ("FactLedger"."FUND_CODE" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L1_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L2_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L3_Descr" IN (N'OPERATING FUND')) 
         AND ("FactLedger"."ACCOUNT" IN (N'Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L1_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L2_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L3_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L4_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L5_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L6_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L7_Descr" IN ('Travel')) 
         AND (Cast("Dim_Time"."YearKey" AS CHAR(4)) + '.' + "Dim_Time"."Quarter" IN ('P11-09') 
               OR "Dim_Time"."PeriodDescr" IN ('P11-09') 
               OR "Dim_Time"."YearDescr" IN ('P11-09')) 
         AND ('All' = 'All' 
               OR "Dim_BusinessUnit"."BusinessUnit_LeafNode_Descr" IN (N'All') 
               OR CASE 
                    WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                    ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
                  END = N'All') 
         AND "Dim_Time"."YearKey" = "FactLedger"."FISCAL_YEAR" 
         AND "Dim_Time"."PeriodKey" = "FactLedger"."ACCOUNTING_PERIOD" 
         AND "Dim_Account_BPP"."Account_BPP_LeafNode_Code" = "FactLedger"."ACCOUNT" 
         AND "Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" = "FactLedger"."BUSINESS_UNIT" 
         AND "Dim_Fund"."Fund_LeafNode_Code" = "FactLedger"."FUND_CODE" 
ORDER BY 12 ASC 


-----------------------------------------3.1 -------------------------------------------------


SELECT   100 AS "C0" 
FROM     "BPP"."dbo"."FactLedger" "FactLedger", 
         "BPP"."dbo"."Dim_BusinessUnit" "Dim_BusinessUnit", 
         "BPP"."dbo"."Dim_Fund" "Dim_Fund", 
         "BPP"."dbo"."Dim_Account_BPP" "Dim_Account_BPP", 
         "BPP"."dbo"."Dim_Project" "Dim_Project", 
         "BPP"."dbo"."Dim_Time" "Dim_Time" 
WHERE    ("FactLedger"."BUSINESS_UNIT" IN (N'BC Centre for Disease Control') 
           OR "Dim_BusinessUnit"."BusinessUnit_L2_Descr" IN (N'BC Centre for Disease Control') 
           OR CASE 
                WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
              END IN (N'BC Centre for Disease Control')) 
         AND ("FactLedger"."FUND_CODE" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L1_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L2_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L3_Descr" IN (N'OPERATING FUND')) 
         AND ("FactLedger"."ACCOUNT" IN (N'Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L1_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L2_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L3_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L4_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L5_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L6_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L7_Descr" IN ('Travel')) 
         AND ("FactLedger"."PROJECT_ID" IN (N'EOX00012') 
               OR "Dim_Project"."PROJECT_L1_Descr" IN (N'EOX00012') 
               OR "Dim_Project"."PROJECT_L2_Descr" IN (N'EOX00012') 
               OR "Dim_Project"."PROJECT_L3_Descr" IN (N'EOX00012') 
               OR "Dim_Project"."PROJECT_L4_Descr" IN (N'EOX00012')) 
         AND (Cast("Dim_Time"."YearKey" AS CHAR(4)) + '.' + "Dim_Time"."Quarter" IN ('P11-09') 
               OR "Dim_Time"."PeriodDescr" IN ('P11-09') 
               OR "Dim_Time"."YearDescr" IN ('P11-09')) 
         AND ('All' = 'All' 
               OR "Dim_BusinessUnit"."BusinessUnit_LeafNode_Descr" IN (N'All') 
               OR CASE 
                    WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                    ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
                  END = N'All') 
         AND "Dim_Time"."YearKey" = "FactLedger"."FISCAL_YEAR" 
         AND "Dim_Time"."PeriodKey" = "FactLedger"."ACCOUNTING_PERIOD" 
         AND "Dim_Account_BPP"."Account_BPP_LeafNode_Code" = "FactLedger"."ACCOUNT" 
         AND "Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" = "FactLedger"."BUSINESS_UNIT" 
         AND "Dim_Fund"."Fund_LeafNode_Code" = "FactLedger"."FUND_CODE" 
         AND "Dim_Project"."PROJECT_LeafNode_Code" = "FactLedger"."PROJECT_ID" 
ORDER BY 1 ASC 

--------------------------------------------------------3.2 ---------------------------------------------------

SELECT   "FactLedger"."BUSINESS_UNIT" AS "C0", 
         "FactLedger"."FUND_CODE"     AS "C1", 
         "FactLedger"."ACCOUNT"       AS "C2", 
         "FactLedger"."DEPTID"        AS "C3", 
         "FactLedger"."SITE"          AS "C4", 
         "FactLedger"."PROJECT_ID"    AS "C5", 
         "FactLedger"."TRANS_DATE"    AS "C6", 
         "FactLedger"."JRNL_LN_REF"   AS "C7", 
         "FactLedger"."LINE_DESCR"    AS "C8", 
         Rtrim("FactLedger"."REF_04") AS "C9", 
         Rtrim("FactLedger"."REF_06") AS "C10", 
         "FactLedger"."JOURNAL_ID"    AS "C11", 
         "Dim_Time"."PeriodDescr"     AS "C12", 
         "FactLedger"."MONETARY_AMT"  AS "C13" 
FROM     "BPP"."dbo"."FactLedger" "FactLedger", 
         "BPP"."dbo"."Dim_Time" "Dim_Time", 
         "BPP"."dbo"."Dim_BusinessUnit" "Dim_BusinessUnit", 
         "BPP"."dbo"."Dim_Fund" "Dim_Fund", 
         "BPP"."dbo"."Dim_Account_BPP" "Dim_Account_BPP", 
         "BPP"."dbo"."Dim_Project" "Dim_Project" 
WHERE    ("FactLedger"."BUSINESS_UNIT" IN (N'BC Centre for Disease Control') 
           OR "Dim_BusinessUnit"."BusinessUnit_L2_Descr" IN (N'BC Centre for Disease Control') 
           OR CASE 
                WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
              END IN (N'BC Centre for Disease Control')) 
         AND ("FactLedger"."FUND_CODE" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L1_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L2_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L3_Descr" IN (N'OPERATING FUND')) 
         AND ("FactLedger"."ACCOUNT" IN (N'Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L1_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L2_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L3_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L4_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L5_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L6_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L7_Descr" IN ('Travel')) 
         AND ("FactLedger"."PROJECT_ID" IN (N'EOX00012') 
               OR "Dim_Project"."PROJECT_L1_Descr" IN (N'EOX00012') 
               OR "Dim_Project"."PROJECT_L2_Descr" IN (N'EOX00012') 
               OR "Dim_Project"."PROJECT_L3_Descr" IN (N'EOX00012') 
               OR "Dim_Project"."PROJECT_L4_Descr" IN (N'EOX00012')) 
         AND (Cast("Dim_Time"."YearKey" AS CHAR(4)) + '.' + "Dim_Time"."Quarter" IN ('P11-09') 
               OR "Dim_Time"."PeriodDescr" IN ('P11-09') 
               OR "Dim_Time"."YearDescr" IN ('P11-09')) 
         AND ('All' = 'All' 
               OR "Dim_BusinessUnit"."BusinessUnit_LeafNode_Descr" IN (N'All') 
               OR CASE 
                    WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                    ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
                  END = N'All') 
         AND "Dim_Time"."YearKey" = "FactLedger"."FISCAL_YEAR" 
         AND "Dim_Time"."PeriodKey" = "FactLedger"."ACCOUNTING_PERIOD" 
         AND "Dim_Account_BPP"."Account_BPP_LeafNode_Code" = "FactLedger"."ACCOUNT" 
         AND "Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" = "FactLedger"."BUSINESS_UNIT" 
         AND "Dim_Fund"."Fund_LeafNode_Code" = "FactLedger"."FUND_CODE" 
         AND "Dim_Project"."PROJECT_LeafNode_Code" = "FactLedger"."PROJECT_ID" 
ORDER BY 12 ASC 


-----------------------------------------4.1 ----------------------------------------------------------
SELECT   100 AS "C0" 
FROM     "BPP"."dbo"."FactLedger" "FactLedger", 
         "BPP"."dbo"."Dim_BusinessUnit" "Dim_BusinessUnit", 
         "BPP"."dbo"."Dim_Fund" "Dim_Fund", 
         "BPP"."dbo"."Dim_Account_BPP" "Dim_Account_BPP", 
         "BPP"."dbo"."Dim_Project" "Dim_Project", 
         "BPP"."dbo"."Dim_Time" "Dim_Time" 
WHERE    ("FactLedger"."BUSINESS_UNIT" IN (N'BC Centre for Disease Control') 
           OR "Dim_BusinessUnit"."BusinessUnit_L2_Descr" IN (N'BC Centre for Disease Control') 
           OR CASE 
                WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
              END IN (N'BC Centre for Disease Control')) 
         AND ("FactLedger"."FUND_CODE" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L1_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L2_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L3_Descr" IN (N'OPERATING FUND')) 
         AND ("FactLedger"."ACCOUNT" IN (N'Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L1_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L2_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L3_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L4_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L5_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L6_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L7_Descr" IN ('Travel')) 
         AND ("FactLedger"."PROJECT_ID" IN (N'') 
               OR "Dim_Project"."PROJECT_L1_Descr" IN (N'') 
               OR "Dim_Project"."PROJECT_L2_Descr" IN (N'') 
               OR "Dim_Project"."PROJECT_L3_Descr" IN (N'') 
               OR "Dim_Project"."PROJECT_L4_Descr" IN (N'')) 
         AND (Cast("Dim_Time"."YearKey" AS CHAR(4)) + '.' + "Dim_Time"."Quarter" IN ('P11-09') 
               OR "Dim_Time"."PeriodDescr" IN ('P11-09') 
               OR "Dim_Time"."YearDescr" IN ('P11-09')) 
         AND ('All' = 'All' 
               OR "Dim_BusinessUnit"."BusinessUnit_LeafNode_Descr" IN (N'All') 
               OR CASE 
                    WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                    ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
                  END = N'All') 
         AND "Dim_Time"."YearKey" = "FactLedger"."FISCAL_YEAR" 
         AND "Dim_Time"."PeriodKey" = "FactLedger"."ACCOUNTING_PERIOD" 
         AND "Dim_Account_BPP"."Account_BPP_LeafNode_Code" = "FactLedger"."ACCOUNT" 
         AND "Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" = "FactLedger"."BUSINESS_UNIT" 
         AND "Dim_Fund"."Fund_LeafNode_Code" = "FactLedger"."FUND_CODE" 
         AND "Dim_Project"."PROJECT_LeafNode_Code" = "FactLedger"."PROJECT_ID" 
ORDER BY 1 ASC 


------------------------------------------------4.2 -----------------------------------------------------------

SELECT   "FactLedger"."BUSINESS_UNIT" AS "C0", 
         "FactLedger"."FUND_CODE"     AS "C1", 
         "FactLedger"."ACCOUNT"       AS "C2", 
         "FactLedger"."DEPTID"        AS "C3", 
         "FactLedger"."SITE"          AS "C4", 
         "FactLedger"."PROJECT_ID"    AS "C5", 
         "FactLedger"."TRANS_DATE"    AS "C6", 
         "FactLedger"."JRNL_LN_REF"   AS "C7", 
         "FactLedger"."LINE_DESCR"    AS "C8", 
         Rtrim("FactLedger"."REF_04") AS "C9", 
         Rtrim("FactLedger"."REF_06") AS "C10", 
         "FactLedger"."JOURNAL_ID"    AS "C11", 
         "Dim_Time"."PeriodDescr"     AS "C12", 
         "FactLedger"."MONETARY_AMT"  AS "C13" 
FROM     "BPP"."dbo"."FactLedger" "FactLedger", 
         "BPP"."dbo"."Dim_Time" "Dim_Time", 
         "BPP"."dbo"."Dim_BusinessUnit" "Dim_BusinessUnit", 
         "BPP"."dbo"."Dim_Fund" "Dim_Fund", 
         "BPP"."dbo"."Dim_Account_BPP" "Dim_Account_BPP", 
         "BPP"."dbo"."Dim_Project" "Dim_Project" 
WHERE    ("FactLedger"."BUSINESS_UNIT" IN (N'BC Centre for Disease Control') 
           OR "Dim_BusinessUnit"."BusinessUnit_L2_Descr" IN (N'BC Centre for Disease Control') 
           OR CASE 
                WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
              END IN (N'BC Centre for Disease Control')) 
         AND ("FactLedger"."FUND_CODE" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L1_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L2_Descr" IN (N'OPERATING FUND') 
               OR "Dim_Fund"."Fund_L3_Descr" IN (N'OPERATING FUND')) 
         AND ("FactLedger"."ACCOUNT" IN (N'Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L1_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L2_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L3_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L4_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L5_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L6_Descr" IN ('Travel') 
               OR "Dim_Account_BPP"."Account_BPP_L7_Descr" IN ('Travel')) 
         AND ("FactLedger"."PROJECT_ID" IN (N'') 
               OR "Dim_Project"."PROJECT_L1_Descr" IN (N'') 
               OR "Dim_Project"."PROJECT_L2_Descr" IN (N'') 
               OR "Dim_Project"."PROJECT_L3_Descr" IN (N'') 
               OR "Dim_Project"."PROJECT_L4_Descr" IN (N'')) 
         AND (Cast("Dim_Time"."YearKey" AS CHAR(4)) + '.' + "Dim_Time"."Quarter" IN ('P11-09') 
               OR "Dim_Time"."PeriodDescr" IN ('P11-09') 
               OR "Dim_Time"."YearDescr" IN ('P11-09')) 
         AND ('All' = 'All' 
               OR "Dim_BusinessUnit"."BusinessUnit_LeafNode_Descr" IN (N'All') 
               OR CASE 
                    WHEN ("Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" IN (N'00020',N'00050',N'00060')) THEN N'BCMHAS' 
                    ELSE "Dim_BusinessUnit"."BusinessUnit_L3_Descr" 
                  END = N'All') 
         AND "Dim_Time"."YearKey" = "FactLedger"."FISCAL_YEAR" 
         AND "Dim_Time"."PeriodKey" = "FactLedger"."ACCOUNTING_PERIOD" 
         AND "Dim_Account_BPP"."Account_BPP_LeafNode_Code" = "FactLedger"."ACCOUNT" 
         AND "Dim_BusinessUnit"."BusinessUnit_LeafNode_Code" = "FactLedger"."BUSINESS_UNIT" 
         AND "Dim_Fund"."Fund_LeafNode_Code" = "FactLedger"."FUND_CODE" 
         AND "Dim_Project"."PROJECT_LeafNode_Code" = "FactLedger"."PROJECT_ID" 
ORDER BY 12 ASC 