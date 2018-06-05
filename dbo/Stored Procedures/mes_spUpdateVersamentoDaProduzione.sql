
CREATE PROC [dbo].[mes_spUpdateVersamentoDaProduzione]
   @DestDocEntry INT,
   @DestLineNum  INT        = NULL,
   @Status       VARCHAR(1),
   @ID           INT
AS
   BEGIN

      IF @DestLineNum IS NULL
         BEGIN
            SET @DestLineNum = 0
      END;

      UPDATE dbo.MES_wsVersamentoDaProduzione SET
        DestDocEntry = @DestDocEntry, DestLineNum = @DestLineNum, UpdateDate = GETDATE(), [Status] = @Status
      WHERE
            id = @ID;
   END;

