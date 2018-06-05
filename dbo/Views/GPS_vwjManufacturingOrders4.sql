


CREATE VIEW [dbo].[GPS_vwjManufacturingOrders4]
AS
   SELECT
          CASE
            WHEN oitm.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(o.U_ItemCode)+'-'+RTRIM(o.U_Revision)
            ELSE RTRIM(o.U_ItemCode)
          END AS item
--o.U_ItemCode AS item
        , o.DocEntry AS refr
        , mor12.U_OprSequence AS [sequence]
        , '4' AS primaryResourceType
        , CASE
            WHEN mor16.U_RscType = 'L'
            THEN '2'
            ELSE '1'
          END AS primaryResourceSubType
        , orsc.Code AS primaryResourceCode
        , mor16.U_NrOfResources AS primaryResourceRequirement
        , '0' AS forTime
   FROM dbo.[@CT_PF_OMOR] o
        INNER JOIN oitm ON o.U_itemcode = oitm.itemcode
        LEFT JOIN [@CT_PF_MOR12] mor12 ON o.DocEntry = mor12.DocEntry
        LEFT JOIN [@CT_PF_MOR16] mor16 ON mor12.DocEntry = mor16.DocEntry
                                          AND mor12.U_OprCode = mor16.U_OprCode
        LEFT OUTER JOIN [@CT_PF_ORSC] orsc ON mor16.U_RscCode = orsc.U_RscCode
   WHERE o.U_Status IN('NS', 'SC', 'RL'); ---verificare lo stato avviato

/*******************************************************************************************
 verifica se è necessario togliere la risorsa già inserita in [GPS_vwjManufacturingOrders2] 
*******************************************************************************************/


