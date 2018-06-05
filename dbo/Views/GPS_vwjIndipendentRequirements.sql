


CREATE VIEW [dbo].[GPS_vwjIndipendentRequirements]
AS
   SELECT
          CASE
            WHEN oi.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(p.ItemCode)+'-'+RTRIM(idt1.U_Code)
            ELSE RTRIM(p.ItemCode)
          END AS item
        , REPLICATE('0', 10-LEN(CONVERT( NVARCHAR(10), o.docentry)))+CONVERT(NVARCHAR(10), o.docentry)+REPLICATE('0', 10-LEN(CONVERT(NVARCHAR(10), p.LineNum)))+CONVERT(NVARCHAR(10), p.LineNum) AS
        refr
        , 'C' AS reft
        , quantity AS reqQ
        , o.cardcode AS cust
	   , p.WhsCode as loca
        , 'F' AS stat
        , o.docduedate AS reqD
	   , o.NumAtCard AS rifc
   FROM dbo.ORDR o
        JOIN dbo.RDR1 p ON o.docentry = p.docEntry
        INNER JOIN dbo.OITM oi ON oi.itemcode = p.itemcode
        INNER JOIN dbo.[@CT_PF_OIDT] oidt ON oi.itemcode = oidt.U_ItemCode
        INNER JOIN dbo.[@CT_PF_IDT1] idt1 ON oidt.Code = idt1.Code
   WHERE docstatus = 'O'
         AND doctype = 'I';


