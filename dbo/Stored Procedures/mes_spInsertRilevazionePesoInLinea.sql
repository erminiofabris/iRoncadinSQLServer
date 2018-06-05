
CREATE PROC [dbo].[mes_spInsertRilevazionePesoInLinea]
   @DocEntryOP     INT,
   @DocEntryFather INT,
   @DocEntryTestCQ INT,
   @U_OprCode      NVARCHAR(50)   = NULL,
   @U_ItemCode     NVARCHAR(50)   = NULL,
   @U_Revision     NVARCHAR(50)   = NULL,
   @U_Remarks      NVARCHAR(MAX)  = NULL,
   @U_Value        DECIMAL(18, 6)
AS
   BEGIN

      INSERT INTO [dbo].[MES_wsRilevazioniPesiInLinea]
      (
             [DocEntryOP]
           , [DocEntryFather]
           , [DocEntryTestCQ]
           , [U_OprCode]
           , [U_ItemCode]
           , [U_Revision]
           , [U_Remarks]
           , [U_Value]
           , [Status]
           , [CreateDate]
      )
      VALUES(
             @DocEntryOP, @DocEntryFather, @DocEntryTestCQ, @U_OprCode, @U_ItemCode, @U_Revision, @U_Remarks, @U_Value, 'N', GETDATE());
   END;
