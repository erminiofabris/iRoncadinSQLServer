
CREATE PROC [dbo].[mes_spDeleteScartiProduzione]
   @ID INT
AS
   BEGIN

      DELETE MES_wsScartiProduzione
      WHERE
            id = @ID;
   END;
