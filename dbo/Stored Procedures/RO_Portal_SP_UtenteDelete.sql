
CREATE PROCEDURE [dbo].[RO_Portal_SP_UtenteDelete]
(
   @UtenteId INT
)
AS
   BEGIN
      IF EXISTS
      (
        SELECT TOP 1
               *
        FROM dbo.RO_Portal_Utenti rpu
        WHERE rpu.UtenteId = @UtenteId
      )
         BEGIN
            DELETE FROM dbo.RO_Portal_Utenti
            WHERE
                  dbo.RO_Portal_Utenti.UtenteId = @UtenteId;
      END;
   END;


