
CREATE VIEW [dbo].[GPS_vwjProductStructures]
AS
   SELECT
          CASE
            WHEN o.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(cpo.U_ItemCode)+'-'+RTRIM(cpo.U_Revision)
            ELSE RTRIM(cpo.U_ItemCode)
          END AS prnt
        , CASE
            WHEN o1.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(cpb.U_ItemCode)+'-'+RTRIM(cpb.U_Revision)
            ELSE RTRIM(cpb.U_ItemCode)
          END AS comp
        , cpb.U_Result AS coef
/**************
cpb.U_StartDate
**************/        , CONVERT(VARCHAR(8), CONVERT(DATETIME, '1900-01-01'), 112) AS strD
/************
cpb.U_EndDate
************/        , CONVERT(VARCHAR(8), CONVERT(DATETIME, '2099-12-31'), 112) AS endD
        , o.Phantom AS phan
        , cpb.U_ScrapPercentage AS scrp
   FROM dbo.[@CT_PF_OBOM] cpo
        JOIN dbo.oitm o ON cpo.U_ItemCode = o.ItemCode
        JOIN dbo.[@CT_PF_BOM1] cpb ON cpb.Code = cpo.Code
        JOIN dbo.oitm o1 ON cpb.U_ItemCode = o1.itemcode;



