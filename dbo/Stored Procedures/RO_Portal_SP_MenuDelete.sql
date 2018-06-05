

CREATE PROCEDURE [dbo].[RO_Portal_SP_MenuDelete]
(
   @MenuId INT
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
            DELETE FROM dbo.RO_Portal_Menu
            WHERE
                  MenuId = @MenuId;
      END;
   END;


