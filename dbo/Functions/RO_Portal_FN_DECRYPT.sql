
--DECRYPT
CREATE FUNCTION [dbo].[RO_Portal_FN_DECRYPT](@encryp varbinary(8000))
RETURNS nvarchar(4000)
AS
BEGIN
DECLARE @decript varbinary(4000)
SET @decript = DECRYPTBYPASSPHRASE('RONCADIN',@encryp)
RETURN (@decript)
END

