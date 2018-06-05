

CREATE PROCEDURE [dbo].[RO_Portal_SP_PaginaUpdate]
(
   @PaginaId    INT,
   @Descrizione VARCHAR(100),
   @PageUrl     VARCHAR(1000)
)
AS
   BEGIN
      IF EXISTS
      (
        SELECT TOP 1
               *
        FROM dbo.RO_Portal_Pagine rpp
        WHERE rpp.PaginaId = @PaginaId
      )
         BEGIN
            UPDATE dbo.RO_Portal_Pagine SET
              descrizione = @Descrizione, pageurl = @PageUrl
            WHERE
                  Paginaid = @PaginaId;
      END;
   END;


