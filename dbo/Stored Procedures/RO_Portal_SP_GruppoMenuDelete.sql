
CREATE PROCEDURE [dbo].[RO_Portal_SP_GruppoMenuDelete]
(
   @GruppoMenuId INT
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
            DELETE FROM dbo.RO_Portal_GruppiMenu
            WHERE
                  GruppoMenuId = @GruppoMenuId;
      END;
   END;


