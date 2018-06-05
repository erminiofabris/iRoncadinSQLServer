

CREATE PROCEDURE [dbo].[RO_Portal_SP_UtenteUpdate]
(
   @UtenteId INT,
   @Nome     VARCHAR(100),
   @Cognome  VARCHAR(100),
   @UserName VARCHAR(50),
   @Password VARCHAR(50)
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
            UPDATE dbo.RO_Portal_Utenti SET
              Nome = @Nome, Cognome = @Cognome, UserName = @UserName, [Password] =
            (
              SELECT
                     dbo.RO_Portal_FN_ENCRYPT(@Password)
            )
		  WHERE dbo.RO_Portal_Utenti.UtenteId = @UtenteId;
      END;
   END;


