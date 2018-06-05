

CREATE VIEW [dbo].[GPS_vwjManufacturingOrders3]
AS
   SELECT
          CASE
            WHEN oitm.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(o.U_ItemCode)+'-'+RTRIM(o.U_Revision)
            ELSE RTRIM(o.U_ItemCode)
          END AS item
--o.U_ItemCode AS item
        , o.DocEntry AS refr
        , mor3.U_Sequence AS [sequence]
	   , CASE
            WHEN oitm2.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(mor3.U_ItemCode)+'-'+RTRIM(mor3.U_Revision)
            ELSE RTRIM(mor3.U_ItemCode)
          END AS ckey
        --, mor3.U_ItemCode AS ckey
        , mor3.U_Quantity AS reqQ
   FROM dbo.[@CT_PF_OMOR] o
        INNER JOIN oitm ON o.U_ItemCode = oitm.ItemCode
        LEFT outer JOIN [@CT_PF_MOR3] mor3 ON o.DocEntry = mor3.DocEntry
	   left outer join oitm oitm2 on mor3.U_ItemCode = oitm2.ItemCode;



