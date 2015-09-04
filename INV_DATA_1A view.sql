SELECT     PROD_CD, CASE WHEN (AVAIL_06 IS NULL) THEN 0 ELSE AVAIL_06 END AS AVAIL06,
                    CASE WHEN (INSTK_06 IS NULL) THEN 0 ELSE INSTK_06 END AS INSTK06,
                    CASE WHEN (PO_06 IS NULL) THEN 0 ELSE PO_06 END AS PO06,
                    CASE WHEN (OTW_06 IS NULL) THEN 0 ELSE OTW_06 END AS OTW06,
                    CASE WHEN (ORD_06 IS NULL) THEN 0 ELSE ORD_06 END AS ORD06
FROM         omsdata2.dbo.HL_SUM_INV_DATA_1
