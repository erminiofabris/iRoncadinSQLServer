create PROC [dbo].[RO_Portal_SP_GetMainMenu]
   @UtenteId INT
AS
   BEGIN

      SELECT DISTINCT
             MenuId
           , PadreMenuId
           , Descrizione
           , PaginaId
           , PageUrl
      FROM
      (
        SELECT
               rpm.MenuId
             , rpm.PadreMenuId
             , rpm.Descrizione
             , rpp.PaginaId
             , rpp.PageUrl
        FROM dbo.RO_Portal_GruppiUtenti rpgu
             JOIN dbo.RO_Portal_GruppiMenu rpgm ON rpgu.GruppoId = rpgm.GruppoId
             JOIN dbo.RO_Portal_Menu rpm ON rpgm.MenuId = rpm.MenuId
             LEFT JOIN dbo.RO_Portal_Pagine rpp ON rpm.PaginaId = rpp.PaginaId
        WHERE rpgu.UtenteId = @UtenteId
        UNION ALL
        SELECT
               rpm.MenuId
             , rpm.PadreMenuId
             , rpm.Descrizione
             , rpp.PaginaId
             , rpp.PageUrl
        FROM dbo.RO_Portal_UtentiMenu rpum
             JOIN dbo.RO_Portal_Menu rpm ON rpum.MenuId = rpm.MenuId
             LEFT JOIN dbo.RO_Portal_Pagine rpp ON rpm.PaginaId = rpp.PaginaId
        WHERE rpum.UtenteId = @UtenteId
      ) dati
   END;

