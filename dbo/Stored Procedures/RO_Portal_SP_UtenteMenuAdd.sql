
CREATE PROCEDURE [dbo].[RO_Portal_SP_UtenteMenuAdd]
(
   @UtenteId INT,
   @MenuId   INT
)
AS
   BEGIN
      INSERT INTO ro_portal_utentimenu
      (
             UtenteId
           , menuid
      )
      VALUES(
             @Utenteid, @Menuid);
   END;



