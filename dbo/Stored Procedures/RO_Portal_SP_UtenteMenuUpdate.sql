

CREATE PROCEDURE [dbo].[RO_Portal_SP_UtenteMenuUpdate]
(
   @UtenteMenuId INT,
   @UtenteId     INT,
   @MenuId       INT
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
            UPDATE dbo.RO_Portal_UtentiMenu SET
              UtenteId = @UtenteId, MenuId = @MenuId;
      END;
   END;


