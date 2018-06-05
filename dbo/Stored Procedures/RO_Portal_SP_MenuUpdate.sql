

CREATE PROCEDURE [dbo].[RO_Portal_SP_MenuUpdate]
(
   @MenuId      INT,
   @PadreMenuId INT,
   @PaginaId    INT,
   @Descrizione VARCHAR(100)
)
AS
   BEGIN
      IF EXISTS
      (
        SELECT TOP 1
               *
        FROM dbo.RO_Portal_Menu rpm
        WHERE rpm.MenuId = @MenuId
      )
         BEGIN
            UPDATE dbo.RO_Portal_Menu SET
              PadreMenuId = @PadreMenuId, PaginaId = @PaginaId, Descrizione = @Descrizione
            WHERE
                  MenuId = @MenuId;
      END;
   END;


