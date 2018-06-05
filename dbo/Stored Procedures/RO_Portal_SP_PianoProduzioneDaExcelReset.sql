
CREATE PROC [dbo].[RO_Portal_SP_PianoProduzioneDaExcelReset]
   @Settimana INT = NULL,
   @Anno      INT = NULL
AS
      BEGIN
         UPDATE dbo.RO_Portal_PianoProduzione SET
           dbo.RO_Portal_PianoProduzione.Stato = 'N'
         WHERE
               dbo.RO_Portal_PianoProduzione.Anno = @Anno
               AND dbo.RO_Portal_PianoProduzione.Settimana = @Settimana
			AND dbo.RO_Portal_PianoProduzione.Stato = 'A'
      END;
