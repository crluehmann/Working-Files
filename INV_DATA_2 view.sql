SELECT     TOP (100) PERCENT PROD_CD, SUM(AVAIL01) AS AV01,
SUM(AVAIL05) AS AV05,
SUM(AVAIL07) AS AV07,
SUM(AVAIL20) AS AV20,
SUM(INSTK01) AS IN01,
SUM(INSTK05) AS IN05,
SUM(INSTK07) AS IN07,
SUM(INSTK20) AS IN20,
SUM(PO01) AS PO01,
SUM(PO05) AS PO05,
SUM(PO07) AS PO07,
SUM(PO20) AS PO20,
SUM(OTW01) AS OT01,
SUM(OTW05) AS OT05,
SUM(OTW07) AS OT07,
SUM(OTW20) AS OT20,
SUM(ORD01) AS OR01,
SUM(ORD05) AS OR05,
SUM(ORD07) AS OR07,
SUM(ORD20) AS OR20
FROM         omsdata2.dbo.HL_SUM_INV_DATA_1A
GROUP BY PROD_CD
ORDER BY PROD_CD
