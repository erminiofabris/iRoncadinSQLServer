CREATE VIEW [dbo].[GPS_vwjManufacturingOrders]
AS
	SELECT CASE
            WHEN o.ItmsGrpCod IN(106, 104, 103)
            THEN codartacg --RTRIM(rppp.ItemCode)+'-'+RTRIM(rppp.Revision)
            ELSE RTRIM(rppp.ItemCode)
			END AS item
			, omor.DocEntry AS refr
			, 'M' AS oTyp
			, CASE U_Status
            WHEN 'NS'
            THEN 'O'
            WHEN 'SC'
            THEN 'F'
            WHEN 'RL'
            THEN 'R'
            ELSE 'C' -- verificare il default
          END AS oSta
        , N_Pezzi/*U_Quantity*/ AS oQty
        , 0/*U_ActualQty*/ AS dQty
        , dataproduzione/*U_PlannedStartDate*/ AS relD
        , dataproduzione/*U_PlannedEndDate*/ AS proD
        , 'N' AS toExplode
		FROM dbo.RO_Portal_PianoProduzione rppp
			INNER JOIN iSBO.dbo.ACGTransArticoli aa ON rppp.ItemCode = aa.CodArtACG AND rppp.Revision = aa.CodRevSAP
			INNER JOIN dbo.OITM o ON aa.codartsap = o.itemcode
			LEFT OUTER JOIN dbo.[@CT_PF_OMOR] omor on rppp.docentryop = omor.DocEntry