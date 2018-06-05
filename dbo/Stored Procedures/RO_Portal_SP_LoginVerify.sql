
CREATE PROCEDURE [dbo].[RO_Portal_SP_LoginVerify]
(
   @UserName VARCHAR(100),
   @Password VARCHAR(100)
)
AS
   BEGIN
--IF(EXISTS
--  (
      SELECT
             UtenteId
      FROM dbo.RO_Portal_Utenti rpu
      WHERE username = @UserName
            AND @Password = dbo.RO_Portal_FN_DECRYPT([password]);
--))
--   BEGIN
--      SELECT
--             1 AS Result;
--END;
--  ELSE
--   BEGIN

--      SELECT
--             0 AS Result;
--END;
   END;
