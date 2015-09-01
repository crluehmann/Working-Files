NONTHD

SELECT     TOP (100) PERCENT ord.CUS_ID, ord.ORD_NUM, ord.ORD_DT, CAST(YEAR(CAST(ord.ORD_DT - 36163 AS DateTime)) AS varchar)
                      + '-' + dbo.ISOweek(CONVERT(DATETIME, CAST(ord.ORD_DT - 36163 AS DateTime), 101)) AS [[WEEK_NO]]],
                      YEAR(CAST(ord.ORD_DT - 36163 AS DateTime)) AS YY, MONTH(CAST(ord.ORD_DT - 36163 AS DateTime)) AS MM,
                      DAY(CAST(ord.ORD_DT - 36163 AS DateTime)) AS DD, olog.PROD_CD, olog.UT_DESC, olog.ORDER_QTY, olog.PCK_QTY, olog.DEF_UT,
                      olog.ORDER_QTY * olog.UNIT_PRS AS [Q*P], ord.SP_ADR, ord.ATTN, ord.SALES_NUM, ord.SALES_NUM2, ord.PO_NUM, ord.STORE_NUM,
                      ord.INVS_NUM, ord.SALES_NUM3, ord.SALES_NUM4, olog.WHS_NUM, ord.EMAIL_ADR AS TRK_NUM, olog.CAN_QTY, olog.CAN_DT,
                          (SELECT     TOP (1) CUS_NM
                            FROM          dbo.customer
                            WHERE      (CUS_ID = ord.CUS_ID)) AS CUSTOMER,
                          (SELECT     TOP (1) INVS_NT
                            FROM          dbo.invs_lnt
                            WHERE      (INVS_NUM = ord.ORD_NUM) AND (INVS_CD = 0) AND (NT_NUM = olog.NT_NUM)) AS [LINE NOTE], ord.SHIP_DESC, ord.ORD_BY,
                      ord.ORD_TYPE, pdes.UT_DESC1, ASNH.ASN_NUM AS [ASN NO], ASNH.PRO_NUM, ASNH.CARR_NM, ASNH.CARR_CD
FROM         dbo.orders AS ord LEFT OUTER JOIN
                      dbo.asnhead AS ASNH ON ASNH.PO_NUM = ord.PO_NUM AND ASNH.STR_NUM = ord.STORE_NUM INNER JOIN
                      dbo.ord_log AS olog ON olog.ORD_NUM = ord.ORD_NUM INNER JOIN
                      dbo.proddesc AS pdes ON pdes.PROD_CD = olog.PROD_CD AND pdes.TYPE_CD = '0'
WHERE     (ord.CLOSE_CD < 20) AND (ord.ORD_DT > 75986 - 12) AND (ord.INVS_NUM < 1) AND (olog.PROD_COMP = ' ' OR
                      olog.PROD_COMP = 'C') AND (NOT (ASNH.ASN_NUM > 0)) OR
                      (ord.CLOSE_CD < 20) AND (ord.ORD_DT > 75986 - 12) AND (ord.INVS_NUM < 1) AND (olog.PROD_COMP = ' ' OR
                      olog.PROD_COMP = 'C') AND (NOT (ord.PO_NUM = '                    ')) AND (ord.CUS_ID <> 'THD')
