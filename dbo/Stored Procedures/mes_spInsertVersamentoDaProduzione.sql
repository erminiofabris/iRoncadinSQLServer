
CREATE PROC [dbo].[mes_spInsertVersamentoDaProduzione]
   @DocEntry       INT,
   @DocEntryFather INT,
   @U_WordCode     NVARCHAR(30),
   @U_OprCode      NVARCHAR(30),
   @ItemCode       NVARCHAR(50),
   @U_Revision     NVARCHAR(50),
   @Qty            NUMERIC(19, 6)
AS
   BEGIN

   DECLARE @DistNumber varchar(20) = NULL

   SELECT @DistNumber = [dbo].[RO_fnBatchCalculation] (@Itemcode, @U_Revision, @DocEntryFather)

      INSERT INTO [dbo].[MES_wsVersamentoDaProduzione]
      (
             [DocEntryOP]
           , [DocEntryFather]
           , [U_WordCode]
           , [U_OprCode]
           , [ItemCode]
           , [U_Revision]
           , [Quantity]
		   , [DistNumber]
      )
      VALUES(
             @DocEntry, @DocEntryFather, @U_WordCode, @U_OprCode, @ItemCode, @U_Revision, @Qty, @DistNumber);
   END;

