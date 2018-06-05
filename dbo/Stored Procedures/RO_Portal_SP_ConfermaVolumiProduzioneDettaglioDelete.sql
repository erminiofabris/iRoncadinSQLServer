
create PROC [dbo].[RO_Portal_SP_ConfermaVolumiProduzioneDettaglioDelete]
    @ConfermaVolumiProduzioneDettaglioId int
AS
BEGIN

DELETE FROM [dbo].[RO_Portal_ConfermaVolumiProduzioneDettagli]
      WHERE ConfermaVolumiProduzioneDettaglioId = @ConfermaVolumiProduzioneDettaglioId

END

