
CREATE VIEW [dbo].[GPS_vwjOperationsRoutings]
AS
   SELECT 
          CASE
            WHEN oitm.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(obom.U_ItemCode)+'-'+RTRIM(obom.U_Revision)
            ELSE RTRIM(obom.U_ItemCode)
          END AS routingCode
        , bom12.U_OprSequence AS [sequence]
        , bom11.U_RtgCode AS subRouting
        , SUBSTRING(bom12.U_OprCode, 1, 4) AS [type]
        , bom12.U_OprCode AS operationDescription
        , bom16.U_QueueTime AS queueTime
        , bom16.U_SetupTime AS setUpTime
        , bom16.U_RunTime AS WorkingTime
        , CASE
            WHEN Bom16.U_RunRate IN('PPH', 'PPM', 'PPS', 'HPP', 'MPP', 'SPP')
            THEN 0
            ELSE 1
          END AS timeType
        , bom16.U_StockTime AS waitTime
        , '4' AS primaryResourceType
        , CASE
            WHEN bom16.U_RscType = 'L'
            THEN '2'
            ELSE '1'
          END AS primaryResourceSubType
        --, orsc.Code AS primaryResourceCode
	   , orsc.U_RscCode AS primaryResourceCode
        , bom16.U_NrOfResources AS primaryResourceRequirement
   FROM [@CT_PF_OBOM] obom
        JOIN OITM oitm ON oitm.ItemCode = obom.U_ItemCode
        LEFT OUTER JOIN [@CT_PF_BOM11] bom11 ON obom.Code = bom11.Code
        LEFT OUTER JOIN [@CT_PF_BOM12] bom12 ON obom.Code = bom12.Code
                                                AND bom11.U_RtgCode = bom12.U_RtgCode
        LEFT OUTER JOIN [@CT_PF_BOM16] bom16 ON obom.Code = bom16.Code
                                                AND bom12.U_OprCode = bom16.U_OprCode
                                                AND bom11.U_RtgCode = bom16.U_RtgCode
        LEFT OUTER JOIN [@CT_PF_ORSC] orsc ON bom16.U_RscCode = orsc.U_RscCode
--WHERE obom.code = '00000021'
   WHERE bom16.U_RtgOprRscCode =
   (
     SELECT
            MIN(bom16_.U_RtgOprRscCode)
     FROM [@CT_PF_OBOM] obom_
          LEFT OUTER JOIN [@CT_PF_BOM11] bom11_ ON obom_.Code = bom11_.Code
          LEFT OUTER JOIN [@CT_PF_BOM12] bom12_ ON obom_.Code = bom12_.Code
                                                   AND bom11_.U_RtgCode = bom12_.U_RtgCode
          LEFT OUTER JOIN [@CT_PF_BOM16] bom16_ ON obom_.Code = bom16_.Code
                                                   AND bom12_.U_OprCode = bom16_.U_OprCode
                                                   AND bom11_.U_RtgCode = bom16_.U_RtgCode
										 and bom12.U_RtgOprCode = bom16.U_RtgOprCode
     WHERE obom_.Code = obom.code
   )
   
   and CASE
            WHEN oitm.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(obom.U_ItemCode)+'-'+RTRIM(obom.U_Revision)
            ELSE RTRIM(obom.U_ItemCode)
          END = '046BVEGE001S-A' and bom12.U_OprSequence = '50' 
   ;


