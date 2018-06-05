CREATE PROC [dbo].[mes_spVerificaNuoviConsumiPerProduzione]
AS
   BEGIN

      SELECT
             cpp.ID
           , cpp.DocEntryOP
           , cpp.ItemCode
           , cpp.U_Revision
           , cpp.Quantity
      FROM mes_wsConsumoPerProduzione cpp
      WHERE status = 'N';
   END;
