
CREATE PROC [dbo].[mes_spStoricoRilevazionePesiInLinea]
   @DocEntryOP INT,
   @U_ItemCode NVARCHAR(50) = NULL,
   @U_Revision NVARCHAR(50)
AS
   BEGIN

      SELECT
             rpil.ID
           , rpil.DocEntryOP
           , rpil.DocEntryTestCQ
           , rpil.U_OprCode
           , rpil.U_ItemCode
           , rpil.U_Revision
           , rpil.U_Remarks
           , rpil.U_Value
           , rpil.Status
           , rpil.CreateDate
           , rpil.UpdateDate
           , rpil.DestDocEntry
           , rpil.DestLineNum
           , rpil.DestSubLineNum
      FROM dbo.MES_wsRilevazioniPesiInLinea rpil
      WHERE rpil.DocEntryOP = @DocEntryOP
            AND (@U_ItemCode IS NULL
                 OR (@U_ItemCode IS NOT NULL
                     AND (rpil.U_ItemCode = @U_ItemCode
                          AND rpil.U_Revision = @U_Revision)));
   END;
