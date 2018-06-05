CREATE PROC [dbo].[mes_spStoricoVersamentiDaProduzione]
   @DocEntryOP INT
AS
   BEGIN

	   declare @Esplosione table (FatherCode varchar(50), DocEntryFather int, DocNumFather int, ChildCode varchar(50), DocEntryChild int, DocNumChild int)

	   insert into @esplosione (FatherCode, DocEntryFather, DocNumFather, ChildCode, DocEntryChild, DocNumChild)
	   SELECT
             rfweoppf.FatherCode
           , rfweoppf.DocEntryFather
           , rfweoppf.DocNumFather
           , rfweoppf.ChildCode
           , rfweoppf.DocEntryChild
           , rfweoppf.DocNumChild
      --INTO
      --     #Esplosione
      FROM SBORONCADIN_TRAINING_20180508.dbo.RO_FN_WS_EsplodiOrdineProduzioneProdottoFinito(@DocEntryOP) rfweoppf;

      SELECT
             VDP.ID
           , VDP.DocEntryOP
           , VDP.U_WordCode
           , VDP.U_OprCode
           , VDP.ItemCode
           , VDP.U_Revision
           , VDP.Quantity
           , VDP.Status
           , VDP.CreateDate
           , VDP.UpdateDate
           , VDP.DestDocEntry
           , VDP.DestLineNum
           , VDP.DistNumber
      FROM MES_wsVersamentoDaProduzione VDP
      WHERE DocEntryOP IN (SELECT docEntryChild FROM @esplosione e);
   END;
