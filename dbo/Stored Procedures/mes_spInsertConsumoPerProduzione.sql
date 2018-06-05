

CREATE PROC [dbo].[mes_spInsertConsumoPerProduzione]
   @DocEntryOP      INT,
   @DocEntryFather  INT,
   @U_WordCode      NVARCHAR(30),
   @U_OprCode       NVARCHAR(30),
   @ItemCode        NVARCHAR(50),
   @U_Revision      NVARCHAR(50),
   @Quantity        NUMERIC(19, 6),
   @AlternativeCode BIT                  = 0,
   @ListaLotti      dbo.MES_wsListaLotti READONLY
AS
      BEGIN

         DECLARE @ID INT = NULL;

         INSERT INTO [dbo].[MES_wsConsumoPerProduzione]
(
                [DocEntryOP]
              , [DocEntryFather]
              , [U_WordCode]
              , [U_OprCode]
              , [ItemCode]
              , [U_Revision]
              , [Quantity]
              , AlternativeCode
)
         VALUES(
                @DocEntryOP, @DocEntryFather, @U_WordCode, @U_OprCode, @ItemCode, @U_Revision, @Quantity, @AlternativeCode);

         SET @ID = SCOPE_IDENTITY();

         INSERT INTO [dbo].[MES_wsConsumoPerProduzioneListaLotti]
(
                [FatherId]
              , [ItemCode]
              , [DistNumber]
              , [Quantity]
)
                SELECT
                       @ID
                     , @ItemCode
                     , DistNumber
                     , Quantity
                FROM @ListaLotti;
      END;



