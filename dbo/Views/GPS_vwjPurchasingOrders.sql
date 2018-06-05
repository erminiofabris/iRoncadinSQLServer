

CREATE VIEW [dbo].[GPS_vwjPurchasingOrders]
AS
   SELECT
          CASE
            WHEN oi.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(p.ItemCode)+'-'+RTRIM(idt1.U_Code)
            ELSE RTRIM(p.ItemCode)
          END AS item
        , REPLICATE('0', 10-LEN(CONVERT( NVARCHAR(10), o.docentry)))+CONVERT(NVARCHAR(10), o.docentry)+REPLICATE('0', 10-LEN(CONVERT(NVARCHAR(10), p.LineNum)))+CONVERT(NVARCHAR(10), p.LineNum) AS
        refr
        , opencreqty AS oQty
        , quantity - opencreqty AS dQty
        , quantity AS orQt
        , o.cardcode AS oSup
/********
docstatus
********/
        , 'R' AS oSta
        , o.docdate AS relD
        , o.docduedate AS proD
   FROM dbo.OPOR o
        JOIN dbo.POR1 p ON o.docentry = p.docEntry
        INNER JOIN dbo.oitm oi ON p.itemcode = oi.itemcode
        INNER JOIN dbo.[@CT_PF_OIDT] oidt ON p.itemcode = oidt.U_ItemCode
        INNER JOIN dbo.[@CT_PF_IDT1] idt1 ON oidt.Code = idt1.Code
   WHERE docstatus = 'O'
         AND doctype = 'I'
   UNION ALL
   SELECT
          CASE
            WHEN oi.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(p.ItemCode)+'-'+RTRIM(idt1.U_Code)
            ELSE RTRIM(p.ItemCode)
          END AS item
        , REPLICATE('0', 10-LEN(CONVERT( NVARCHAR(10), o.AbsId)))+CONVERT(NVARCHAR(10), o.AbsId)+REPLICATE('0', 10-LEN(CONVERT(NVARCHAR(10), p.AgrLineNum)))+CONVERT(NVARCHAR(10), p.AgrLineNum) AS
        refr
        ,
   (
     SELECT
            SUM(Quantity)
     FROM por1 p1
     WHERE p1.AgrNo = p.AgrNo
           AND p1.AgrLnNum = p.AgrLineNum
   ) AS oQty
        , PlanQty -
   (
     SELECT
            SUM(Quantity)
     FROM por1 p1
     WHERE p1.AgrNo = p.AgrNo
           AND p1.AgrLnNum = p.AgrLineNum
   ) AS dQty
        , PlanQty AS orQt
        , o.BpCode AS oSup
/********
docstatus
********/
        , 'A' AS oSta
        , o.StartDate AS relD
        , '' AS proD
   FROM dbo.OOAT o
        JOIN dbo.OAT1 p ON o.AbsId = p.AgrNo
        INNER JOIN dbo.oitm oi ON p.itemcode = oi.itemcode
        INNER JOIN dbo.[@CT_PF_OIDT] oidt ON p.itemcode = oidt.U_ItemCode
        INNER JOIN dbo.[@CT_PF_IDT1] idt1 ON oidt.Code = idt1.Code
   WHERE [Status] = 'O'; --and doctype = 'I'


