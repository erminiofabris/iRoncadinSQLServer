
CREATE PROCEDURE [dbo].[RO_Portal_SP_PaginaAdd]
(
   @Descrizione VARCHAR(100),
   @PageUrl     VARCHAR(1000)
)
AS
   BEGIN
      INSERT INTO dbo.RO_Portal_Pagine
      (
             Descrizione
           , PageUrl
      )
      VALUES(
             @Descrizione, @PageUrl);
   END;


