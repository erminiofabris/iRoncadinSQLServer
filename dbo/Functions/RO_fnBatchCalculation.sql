
CREATE FUNCTION [dbo].[RO_fnBatchCalculation]
(
   @ItemCode   NVARCHAR(50),
   @Revision   NVARCHAR(50),
   @DocEntryOP INT
)
RETURNS NVARCHAR(50)
AS
   BEGIN
      DECLARE @Data DATE = NULL;

      SELECT
             @Data = U_PlannedStartDate
      FROM SBORONCADIN_TRAINING_20180508.dbo.[@CT_PF_OMOR] cpo
      WHERE docEntry = @DocEntryOP;

      RETURN RIGHT(CAST(YEAR(@Data) AS NVARCHAR(4)), 2)+RIGHT('000'+CAST(DATEPART(dy, @Data) AS NVARCHAR(3)), 3)+ISNULL(@Revision, 'A');
   END;
