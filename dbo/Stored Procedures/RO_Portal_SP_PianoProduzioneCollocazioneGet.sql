
create PROC [dbo].[RO_Portal_SP_PianoProduzioneCollocazioneGet]
   @AppointmentDate DATETIME
AS
      BEGIN
         SELECT
                rpppc.PianoProduzioneCollocazioneId
              , rpppc.Descrizione
              , rpppc.Code
              , rpppc.OraDa
              , rpppc.OraA
         FROM dbo.RO_Portal_PianoProduzioneCollocazioni rpppc
         WHERE DATEPART(hour, @AppointmentDate) BETWEEN OraDa AND OraA;
      END;
