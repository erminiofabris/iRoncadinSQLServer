
CREATE PROCEDURE [dbo].[RO_Portal_SP_GruppoUtenteUpdate]
(
   @GruppoUtenteId INT,
   @UtenteId       INT,
   @GruppoId       INT
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
            UPDATE dbo.RO_Portal_GruppiUtenti SET
              UtenteId = @UtenteId, GruppoId = @GruppoId
            WHERE
                  gruppoutenteid = @GruppoUtenteId;
      END;
   END;


