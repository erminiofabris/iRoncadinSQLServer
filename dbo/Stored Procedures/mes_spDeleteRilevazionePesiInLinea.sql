
CREATE PROC [dbo].[mes_spDeleteRilevazionePesiInLinea]
   @ID INT
AS
   BEGIN

      DELETE mes_wsRilevazioniPesiInLinea
      WHERE
            id = @ID;
   END;
