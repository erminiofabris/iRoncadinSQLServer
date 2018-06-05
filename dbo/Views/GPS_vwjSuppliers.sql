CREATE VIEW [dbo].[GPS_vwjSuppliers]
AS
   SELECT CASE
            WHEN CardType = 'S'
            THEN 'F'
            ELSE 'C'
          END AS type,
          CardCode AS code,
          CardName AS rags
   FROM dbo.OCRD;


