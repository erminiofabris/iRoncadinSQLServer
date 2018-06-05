
CREATE PROC [dbo].[mes_spVerificaNuoviVersamentiDaProduzione]
AS
   BEGIN

      SELECT
             VDP.ID
           , VDP.DocEntryOP
           , VDP.ItemCode
           , VDP.U_Revision
           , VDP.Quantity
           , vdp.DistNumber
      FROM MES_wsVersamentoDaProduzione VDP
	 where VDP.[status] = 'N';
   END;

