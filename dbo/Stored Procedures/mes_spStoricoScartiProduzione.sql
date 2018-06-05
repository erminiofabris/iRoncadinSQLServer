
CREATE PROC [dbo].[mes_spStoricoScartiProduzione]
   @DocEntryOP         INT,
   @CentroDiLavoroCode NVARCHAR(50) = NULL,
   @TipoScarto         NVARCHAR(50) = NULL, --U_WordCode tipo scarto [BB, BR, BF]
   @CausaleScarto      NVARCHAR(50) = NULL
AS
   BEGIN

      SELECT
             mwsp.ID
           , mwsp.DocEntryOP
           , mwsp.CausaleScarto
           , mwsp.TipoScarto
           , mwsp.Quantita
           , mwsp.Status
           , mwsp.CreateDate
           , mwsp.UpdateDate
           , mwsp.DestDocEntry
           , mwsp.DestLineNum
      FROM dbo.MES_wsScartiProduzione mwsp
      WHERE mwsp.DocEntryOP = @DocEntryOP
            AND (@TipoScarto IS NULL
                 OR (@TipoScarto IS NOT NULL
                     AND mwsp.TipoScarto = @TipoScarto));
   END;
