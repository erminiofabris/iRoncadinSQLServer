
CREATE PROCEDURE [dbo].[RO_Portal_SP_UtenteAdd]
(
   @Nome     VARCHAR(100),
   @Cognome  VARCHAR(100),
   @UserName VARCHAR(50),
   @Password VARCHAR(50)
)
AS
   BEGIN
      INSERT INTO ro_portal_utenti
      (
             Nome
           , Cognome
           , UserName
           , [Password]
      )
      VALUES(
             @Nome, @Cognome, @UserName,
            (
              SELECT
                     dbo.RO_Portal_FN_ENCRYPT(@Password)
            ));
   END;
