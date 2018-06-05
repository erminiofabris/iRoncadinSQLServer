


CREATE VIEW [dbo].[GPS_vwjOperationsRoutings2]
AS
   SELECT
          CASE
            WHEN oitm.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(obom.U_ItemCode)+'-'+RTRIM(obom.U_Revision)
            ELSE RTRIM(obom.U_ItemCode)
          END AS item
--obom.U_ItemCode + obom.U_Revision AS routingCode
        , bom12.U_OprSequence AS [sequence]
        , bom11.U_RtgCode AS subRouting
        , '4' AS primaryResourceType
        , bom16.U_RscType
        , CASE
            WHEN bom16.U_RscType = 'L'
            THEN '2'
            ELSE '1'
          END AS primaryResourceSubType
        , orsc.U_RscCode AS primaryResourceCode
        , bom16.U_NrOfResources AS primaryResourceRequirement
        , '0' AS forTime
   FROM [@CT_PF_OBOM] obom
        INNER JOIN oitm ON obom.U_itemCode = oitm.itemcode
        LEFT OUTER JOIN [@CT_PF_BOM11] bom11 ON obom.Code = bom11.Code
        LEFT OUTER JOIN [@CT_PF_BOM12] bom12 ON obom.Code = bom12.Code
                                                AND bom11.U_RtgCode = bom12.U_RtgCode
        LEFT OUTER JOIN [@CT_PF_BOM16] bom16 ON obom.Code = bom16.Code
                                                AND bom12.U_OprCode = bom16.U_OprCode
                                                AND bom11.U_RtgCode = bom16.U_RtgCode
        LEFT OUTER JOIN [@CT_PF_ORSC] orsc ON bom16.U_RscCode = orsc.U_RscCode
--WHERE obom.code = '00000021'
                                              AND bom16.U_RtgOprRscCode =
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
     WHERE obom_.Code = obom.code
   );



