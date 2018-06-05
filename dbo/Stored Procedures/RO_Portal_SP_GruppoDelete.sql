
CREATE PROCEDURE [dbo].[RO_Portal_SP_GruppoDelete]
(
   @GruppoId INT
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
            DELETE FROM dbo.RO_Portal_Gruppi
            WHERE
                  dbo.RO_Portal_Gruppi.GruppoId = @GruppoId;
      END;
   END;


