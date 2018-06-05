
CREATE PROC [dbo].[RO_Portal_SP_PianoProduzioneSlotDelete]
    @PianoProduzioneId int
AS
   BEGIN
      
      DELETE FROM dbo.RO_Portal_PianoProduzione WHERE dbo.RO_Portal_PianoProduzione.PianoProduzioneId = @PianoProduzioneId
   END;



