SELECT     TOP (100) PERCENT PROD_CD,
SUM(AV06) AS AVAIL_EAST,
SUM(IN06) AS INSTK_EAST,
SUM(PO06) AS PO_EAST,
SUM(OT06) AS OTW_EAST,
SUM(OR06) AS ORD_EAST,
SUM(AV06) AS AVAIL_ALL,
                          (SELECT     TOP (1) CLASS_CD
                            FROM          omsdata2.dbo.inv
                            WHERE      (PROD_CD = omsdata2.dbo.HL_SUM_INV_DATA_2_WHS_06.PROD_CD)) AS CLASSCODE
FROM         omsdata2.dbo.HL_SUM_INV_DATA_2_WHS_06
GROUP BY PROD_CD
ORDER BY PROD_CD
