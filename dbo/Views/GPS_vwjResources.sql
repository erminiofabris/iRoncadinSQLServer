

CREATE VIEW [dbo].[GPS_vwjResources]
AS
   SELECT
          o.U_rscCode AS [resource]
        , '4' AS [type]
        , CASE
            WHEN o.U_RscType = 'L'
            THEN '2'
            ELSE '1'
          END AS sType
        , '0' AS WorkCenterType
        , o.U_RscName AS [desc]
   FROM [@CT_PF_ORSC] o;



