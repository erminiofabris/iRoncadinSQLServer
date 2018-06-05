

CREATE PROCEDURE [dbo].[RO_Portal_SP_GruppoMenuUpdate]
(
   @GruppoMenuId INT,
   @GruppoId     INT,
   @MenuId       INT
)
AS
   BEGIN
      IF EXISTS
      (
        SELECT TOP 1
               *
        FROM dbo.RO_Portal_GruppiMenu rpgm
        WHERE rpgm.GruppoMenuId = @GruppoMenuId
      )
         BEGIN
            UPDATE dbo.RO_Portal_GruppiMenu SET
              GruppoId = @GruppoId, MenuId = @MenuId;
      END;
   END;


