

CREATE PROCEDURE [dbo].[RO_Portal_SP_PaginaDelete]
(
   @PaginaId INT
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
            DELETE FROM dbo.RO_Portal_Pagine
            WHERE
                  PaginaId = @PaginaId;
      END;
   END;


