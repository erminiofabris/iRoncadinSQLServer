

CREATE PROCEDURE [dbo].[RO_Portal_SP_UtenteMenuDelete]
(
   @UtenteMenuId INT
)
AS
   BEGIN
      IF EXISTS
      (
        SELECT TOP 1
               *
        FROM dbo.RO_Portal_UtentiMenu rpum
        WHERE rpum.UtenteMenuId = @UtenteMenuId
      )
         BEGIN
            DELETE FROM dbo.RO_Portal_UtentiMenu
            WHERE
                  UtenteMenuId = @UtenteMenuId;
      END;
   END;


