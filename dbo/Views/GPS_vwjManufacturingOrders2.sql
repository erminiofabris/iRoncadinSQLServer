

CREATE VIEW [dbo].[GPS_vwjManufacturingOrders2]
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
        , SUBSTRING(mor12.U_OprCode, 1, 4) AS [type]
        , mor12.U_operStartDate
        , mor12.U_OperEndDate
        , CASE o.U_Status
            WHEN 'NS'
            THEN 'O'
            WHEN 'SC'
            THEN 'F'
            WHEN 'RL'
            THEN 'R'
            ELSE 'C' -- verificare il default
          END AS opSt
        , mor16.U_QueueTime AS queueTime
        , mor16.U_SetupTime AS setUpTime
        , mor16.U_RunTime AS workingTime
        , CASE
            WHEN mor16.U_RunRate IN('PPH', 'PPM', 'PPS', 'HPP', 'MPP', 'SPP')
            THEN 0
            ELSE 1
          END AS timeType
        , mor16.U_StockTime AS waitTime
        , '4' AS primaryResourceType
        , CASE
            WHEN mor16.U_RscType = 'L'
            THEN '2'
            ELSE '1'
          END AS primaryResourceSubType
        , orsc.Code AS primaryResourceCode
        , mor16.U_NrOfResources AS primaryResourceRequirement
   FROM dbo.[@CT_PF_OMOR] o
        INNER JOIN oitm ON o.U_Itemcode = oitm.ItemCode
        LEFT JOIN [@CT_PF_MOR12] mor12 ON o.DocEntry = mor12.DocEntry
        LEFT JOIN [@CT_PF_MOR16] mor16 ON mor12.DocEntry = mor16.DocEntry
                                          AND mor12.U_OprCode = mor16.U_OprCode
        LEFT OUTER JOIN [@CT_PF_ORSC] orsc ON mor16.U_RscCode = orsc.U_RscCode
   WHERE o.U_Status IN('NS', 'SC', 'RL') ---verificare lo stato avviato
        AND mor16.U_RtgOprRscCode =
   (
     SELECT
            MIN(mor16_.U_RtgOprRscCode)
     FROM [@CT_PF_OMOR] OMOR_
          LEFT OUTER JOIN [@CT_PF_MOR12] mor12_ ON OMOR_.DocEntry = mor12_.DocEntry
          LEFT OUTER JOIN [@CT_PF_MOR16] mor16_ ON OMOR_.DocEntry = mor16_.DocEntry
                                                   AND mor12_.U_OprCode = mor16_.U_OprCode
     WHERE OMOR_.DocEntry = o.DocEntry
   );


