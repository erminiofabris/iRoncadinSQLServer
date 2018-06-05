
CREATE PROCEDURE [dbo].[RO_Portal_SP_MenuAdd]
(
   @PadreMenuId INT,
   @PaginaId    INT,
   @Descrizione VARCHAR(100)
)
AS
   BEGIN
      INSERT INTO dbo.RO_Portal_Menu
      (
             PadreMenuId
           , PaginaId
           , Descrizione
      )
      VALUES(
             @PadreMenuId, @PaginaId, @Descrizione);
   END;

