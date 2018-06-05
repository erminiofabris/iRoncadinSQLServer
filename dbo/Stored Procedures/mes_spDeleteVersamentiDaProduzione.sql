
CREATE PROC [dbo].[mes_spDeleteVersamentiDaProduzione]
   @ID INT
AS
   BEGIN

      DELETE MES_wsVersamentoDaProduzione
      WHERE
            id = @ID;
   END;
