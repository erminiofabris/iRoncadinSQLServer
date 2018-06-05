
CREATE PROC [dbo].[RO_Portal_SP_ConfermaVolumiProduzioneResetData]
   @Data DATETIME
AS
      BEGIN
         DECLARE @ConfermaVolumiProduzioneId INT = NULL;

         SELECT
                @ConfermaVolumiProduzioneId = MIN(confermavolumiproduzioneid)
         FROM dbo.RO_Portal_ConfermaVolumiProduzione rpcvp
         WHERE rpcvp.ConfermaData = @Data;

         WHILE @ConfermaVolumiProduzioneId IS NOT NULL
            BEGIN
               DELETE FROM dbo.RO_Portal_ConfermaVolumiProduzioneDettagli
               WHERE
                     confermavolumiproduzioneid = @ConfermaVolumiProduzioneId;

               SELECT
                      @ConfermaVolumiProduzioneId = MIN(confermavolumiproduzioneid)
               FROM dbo.RO_Portal_ConfermaVolumiProduzione rpcvp
               WHERE rpcvp.ConfermaData = @Data
                     AND confermavolumiproduzioneid > @ConfermaVolumiProduzioneId;
            END;

		  DELETE FROM dbo.RO_Portal_ConfermaVolumiProduzione WHERE confermadata = @Data
      END;
