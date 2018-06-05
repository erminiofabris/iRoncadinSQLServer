

CREATE VIEW [dbo].[GPS_vwjInventoryQuantities]
AS
   SELECT
          CASE
            WHEN o.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(T0.ItemCode)+'-'+RTRIM(idt1.U_Code)
            ELSE RTRIM(T0.ItemCode)
          END AS item
        , t4.DistNumber AS lot
        , t0.loccode AS loca
        , SUM(T1.Quantity) AS invQ
	   , t4.ExpDate as expDt
   FROM dbo.[OITL] T0
        INNER JOIN dbo.[ITL1] T1 ON T1.[LogEntry] = T0.[LogEntry]
        INNER JOIN dbo.OBTN T4 ON T1.MdAbsEntry = T4.AbsEntry
        INNER JOIN dbo.OITM o ON o.itemcode = t0.itemcode
        INNER JOIN dbo.[@CT_PF_OIDT] oidt ON o.itemcode = oidt.U_ItemCode
        INNER JOIN dbo.[@CT_PF_IDT1] idt1 ON oidt.Code = idt1.Code
   GROUP BY
            T0.ItemCode
          , T0.ItemName
          , t4.DistNumber
          , t0.loccode
          , o.itmsgrpcod
          , idt1.U_code
		, t4.ExpDate;


