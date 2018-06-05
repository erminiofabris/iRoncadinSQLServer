
CREATE PROC [dbo].[mes_spDeleteFermoMacchina]
   @ID INT
AS
   BEGIN

      DELETE MES_wsFermiProduzione
      WHERE
            id = @ID;
   END;
