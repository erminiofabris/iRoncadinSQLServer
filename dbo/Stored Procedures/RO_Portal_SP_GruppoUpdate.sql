

CREATE PROCEDURE [dbo].[RO_Portal_SP_GruppoUpdate]
(
   @GruppoId    INT,
   @Descrizione VARCHAR(100)
)
AS
   BEGIN
      IF EXISTS
      (
        SELECT TOP 1
               *
        FROM dbo.RO_Portal_Gruppi rpg
        WHERE rpg.GruppoId = @GruppoId
      )
         BEGIN
            UPDATE dbo.RO_Portal_Gruppi SET
              dbo.RO_Portal_Gruppi.Descrizione = @Descrizione
            WHERE
                  gruppoid = @Gruppoid;
      END;
   END;


