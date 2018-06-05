
CREATE PROC [dbo].[mes_spInsertScartoProduzione]
   @DocEntryOP         INT,
   @CentroDiLavoroCode NVARCHAR(50),
   @CausaleScarto      NVARCHAR(50),
   @TipoScarto         VARCHAR(10),
   @Quantita           DECIMAL(18, 6),
   @IdScartoPerFermi   INT OUTPUT
AS
   BEGIN

      DECLARE @ID INT = NULL;

      INSERT INTO dbo.MES_wsScartiProduzione
      (
             DocEntryOP
           , CentroDiLavoroCode
           , CausaleScarto
           , TipoScarto
           , Quantita
           , [status]
           , CreateDate
      )
      VALUES(
             @DocEntryOP, @CentroDiLavoroCode, @CausaleScarto, @TipoScarto, @Quantita, 'N', GETDATE());

      SET @IdScartoPerFermi = SCOPE_IDENTITY();
   END;



