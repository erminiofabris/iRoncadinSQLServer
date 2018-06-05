
CREATE PROCEDURE [dbo].[RO_Portal_SP_GruppoUtenteAdd]
(
   @UtenteId INT,
   @GruppoId INT
)
AS
   BEGIN
      INSERT INTO dbo.RO_Portal_GruppiUtenti
      (
             UtenteId
           , GruppoId
      )
      VALUES(
             @UtenteId, @GruppoId);
   END;
