
CREATE PROC [dbo].[RO_Portal_SP_ConfermaVolumiProduzioneDelete]
    @ConfermaVolumiProduzioneId int
AS
BEGIN

DELETE FROM [dbo].[RO_Portal_ConfermaVolumiProduzione]
      WHERE ConfermaVolumiProduzioneId = @ConfermaVolumiProduzioneId

END

