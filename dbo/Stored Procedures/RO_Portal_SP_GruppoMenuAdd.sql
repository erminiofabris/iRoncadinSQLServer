
CREATE PROCEDURE [dbo].[RO_Portal_SP_GruppoMenuAdd]
(
   @GruppoId INT,
   @MenuId   INT
)
AS
   BEGIN
      INSERT INTO dbo.RO_Portal_GruppiMenu
      (
             GruppoId
           , MenuId
      )
      VALUES(
             @GruppoId, @MenuId);
   END;

