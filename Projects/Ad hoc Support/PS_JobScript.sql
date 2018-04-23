--set showplan_all on;
--set showplan_all off;

SELECT   C.VENDOR_ID,
         C.NAME1,
         B.VNDR_LOC,
         B.ADDRESS_SEQ_NUM,
         B.INVOICE_ID,
         (CONVERT(CHAR(10),B.INVOICE_DT,121)),
         (CONVERT(CHAR(10),B.ENTERED_DT,121)),
         A.BUSINESS_UNIT,
         A.VOUCHER_ID,
         A.PYMNT_TYPE,
         A.PAID_AMT,
         A.PYMNT_GROSS_AMT,
         (CONVERT(CHAR(10),A.DUE_DT,121)),
         A.DSCNT_PAY_AMT,
         (CONVERT(CHAR(10),A.DSCNT_DUE_DT,121)),
         (CONVERT(CHAR(10),A.SCHEDULED_PAY_DT,121)),
         A.CURRENCY_PYMNT,
         A.PYMNT_SELCT_STATUS,
         A.REMIT_VENDOR,
         A.VNDR_LOC,
         A.REMIT_ADDR_SEQ_NUM,
         A.BANK_CD,
         A.BANK_ACCT_KEY,
         A.BANK_ACCT_SEQ_NBR,
         A.PYMNT_ACTION,
         A.PYMNT_METHOD,
         A.PYMNT_MESSAGE,
         A.PYMNT_HOLD_CD,
         A.PYMNT_HOLD,
         A.VNDR_PYMNT_HLD_FLG,
         A.PYMNT_HOLD_REASON,
         A.PYMNT_SEPARATE,
         A.PYMNT_HANDLING_CD,
         B.POST_STATUS_AP,
         (CONVERT(CHAR(10),SUBSTRING(CONVERT(CHAR,GETDATE(),121),1,10),
                  121)),
         (CONVERT(CHAR(10),SUBSTRING(CONVERT(CHAR,GETDATE(),121),1,10),
                  121)),
         (CONVERT(CHAR(10),SUBSTRING(CONVERT(CHAR,GETDATE(),121),1,10),
                  121)),
         (CONVERT(CHAR(10),SUBSTRING(CONVERT(CHAR,GETDATE(),121),1,10),
                  121)),
         (CONVERT(CHAR(10),SUBSTRING(CONVERT(CHAR,GETDATE(),121),1,10),
                  121)),
         C.SETID
FROM     PS_PYMNT_VCHR_XREF A
           LEFT OUTER JOIN PS_VOUCHER B
             ON A.BUSINESS_UNIT = B.BUSINESS_UNIT
                AND A.VOUCHER_ID = B.VOUCHER_ID
          LEFT OUTER JOIN PS_VENDOR C
            ON B.VENDOR_SETID = C.SETID
               AND C.VENDOR_ID = B.VENDOR_ID,
         PS_SP_BU_FS_CLSVW B1
WHERE    (B.BUSINESS_UNIT = B1.BUSINESS_UNIT
           OR B.BUSINESS_UNIT IS NULL )
         AND B1.ROWSECCLASS = 'PHGL0003'
         AND A.PYMNT_SELCT_STATUS = 'N'
         AND B.ENTRY_STATUS <> 'X'
         AND B.CLOSE_STATUS <> 'C'   
                                    -------------------------------------
         AND (EXISTS (SELECT D.REMIT_VENDOR
                           FROM   PS_PYMNT_VCHR_XREF D,
                                  PS_VOUCHER E,
                                  PS_SP_BU_FS_CLSVW E1
                           WHERE  E.BUSINESS_UNIT = E1.BUSINESS_UNIT
                                  AND E1.ROWSECCLASS = 'PHGL0003'
                                  AND D.BUSINESS_UNIT = E.BUSINESS_UNIT
                                  AND D.VOUCHER_ID = E.VOUCHER_ID
                                  AND D.PYMNT_GROSS_AMT < 0
                                  AND D.PYMNT_SELCT_STATUS = 'N'
                                  AND E.ENTRY_STATUS <> 'X'  
								  AND ((A.REMIT_SETID = D.REMIT_SETID AND A.REMIT_VENDOR = D.REMIT_VENDOR)
										OR
									   (B.VENDOR_SETID = D.REMIT_SETID AND B.VENDOR_ID = D.REMIT_VENDOR)))
              OR A.PYMNT_GROSS_AMT < 0)
ORDER BY 2,
         9;

SELECT COUNT(* )
FROM   PS_PYMNT_VCHR_XREF;
