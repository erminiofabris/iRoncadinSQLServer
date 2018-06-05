

CREATE PROCEDURE [dbo].[RO_Portal_SP_GruppoUtenteDelete]
(
   @GruppoUtenteId INT
)
AS
   BEGIN
      IF EXISTS
      (
        SELECT TOP 1
               *
        FROM dbo.RO_Portal_GruppiUtenti rpgu
        WHERE rpgu.GruppoUtenteId = @GruppoUtenteId
      )
         BEGIN
            DELETE FROM dbo.RO_Portal_GruppiUtenti
            WHERE
                  GruppoUtenteId = @GruppoUtenteId;
      END;
   END;


