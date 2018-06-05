
CREATE PROC [dbo].[mes_spVerificaNuoviConsumiPerProduzioneListaLotti]
   @FatherId INT
AS
   BEGIN

      SELECT
             CPPLL.ID
           , CPPLL.ItemCode
           , CPPLL.Quantity
           , CPPLL.DistNumber
      FROM MES_wsConsumoPerProduzioneListaLotti CPPLL
      WHERE CPPLL.FatherId = @FatherId;
   END;

