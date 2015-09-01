Backlog_1

SELECT     TOP (100) PERCENT ord.CUS_ID, ord.ORD_NUM, ord.ORD_DT, CAST(YEAR(CAST(ord.ORD_DT - 36163 AS DateTime)) AS varchar)
                      + '-' + dbo.ISOweek(CONVERT(DATETIME, CAST(ord.ORD_DT - 36163 AS DateTime), 101)) AS [[WEEK_NO]]],
                      YEAR(CAST(ord.ORD_DT - 36163 AS DateTime)) AS YY, MONTH(CAST(ord.ORD_DT - 36163 AS DateTime)) AS MM,
                      DAY(CAST(ord.ORD_DT - 36163 AS DateTime)) AS DD, olog.PROD_CD, olog.UT_DESC, olog.ORDER_QTY, olog.PCK_QTY, olog.DEF_UT,
                      olog.ORDER_QTY * olog.UNIT_PRS AS [Q*P], ord.SP_ADR, ord.ATTN, ord.SALES_NUM, ord.SALES_NUM2, ord.PO_NUM, ord.STORE_NUM,
                      ord.INVS_NUM, ord.SALES_NUM3, ord.SALES_NUM4, olog.WHS_NUM, olog.CAN_QTY, olog.CAN_DT, ord.EMAIL_ADR AS TRK_NUM,
                          (SELECT     TOP (1) RSV_36
                            FROM          dbo.edi_po
                            WHERE      (PO_NUM = ord.PO_NUM)) AS POTYPE,
                          (SELECT     TOP (1) RSV_71
                            FROM          dbo.edi_po AS edi_po_1
                            WHERE      (PO_NUM = ord.PO_NUM)) AS PO_DELIVERY_DATE,
                          (SELECT     TOP (1) PT_NUM
                            FROM          dbo.HL_ALLOCATED
                            WHERE      (PT_NUM = ord.ORD_NUM) AND (PROD_CD = olog.PROD_CD)) AS ALLOCATED,
                          (SELECT     TOP (1) CUS_NM
                            FROM          dbo.customer
                            WHERE      (CUS_ID = ord.CUS_ID)) AS CUSTOMER,
                          (SELECT     TOP (1) SLS_TYPE
                            FROM          dbo.customer AS customer_1
                            WHERE      (CUS_ID = ord.CUS_ID)) AS SLSTYPE,
                          (SELECT     TOP (1) INVS_NT
                            FROM          dbo.invs_lnt
                            WHERE      (INVS_NUM = ord.ORD_NUM) AND (INVS_CD = 0) AND (NT_NUM = olog.NT_NUM)) AS [LINE NOTE], ord.SHIP_DESC, ord.ORD_BY,
                      ord.ORD_TYPE, pdes.UT_DESC1, olog.INVS_QTY, i.CLASS_CD, ord.SHIP_DT AS SHIPCODE, YEAR(CAST(ord.SHIP_DT - 36163 AS DateTime))
                      AS SHIPYY, MONTH(CAST(ord.SHIP_DT - 36163 AS DateTime)) AS SHIPMM, DAY(CAST(ord.SHIP_DT - 36163 AS DateTime)) AS SHIPDD, i.UNIT_NM,
                      i.WIP_QTY, i.DESCRIP, ord.SP_ADR_ST, ord.SP_ADR_CT, i.CAT_NUM, olog.UNIT_PRS, i.WHOLE_PRS, ord.SP_ADR_2, ord.SP_ADR_ZP,
                      olog.COMM_LN, i.RETAIL_PRS, i.CORP_PRS
FROM         dbo.orders AS ord INNER JOIN
                      dbo.ord_log AS olog ON olog.ORD_NUM = ord.ORD_NUM LEFT OUTER JOIN
                      dbo.proddesc AS pdes ON pdes.PROD_CD = olog.PROD_CD AND pdes.TYPE_CD = '0' LEFT OUTER JOIN
                      dbo.inv AS i ON i.PROD_CD = olog.PROD_CD
WHERE     (ord.CLOSE_CD < 20) AND (ord.ORD_DT > 77800) AND (olog.PROD_COMP = '0' OR
                      olog.PROD_COMP = ' ' OR
                      olog.PROD_COMP = 'C') AND (olog.CAN_QTY = 0) AND (olog.WHS_NUM IN (07', '20', '41', '41', '50', '70', '81')) AND (olog.INVS_NUM = 0)
