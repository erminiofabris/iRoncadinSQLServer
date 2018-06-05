--ENCRYPT
CREATE FUNCTION [dbo].[RO_Portal_FN_ENCRYPT](@str nvarchar(4000))
RETURNS varbinary(8000)
AS
BEGIN
DECLARE @encript varbinary(8000)
SET @encript = ENCRYPTBYPASSPHRASE('RONCADIN',@str)
RETURN (@encript)
END

