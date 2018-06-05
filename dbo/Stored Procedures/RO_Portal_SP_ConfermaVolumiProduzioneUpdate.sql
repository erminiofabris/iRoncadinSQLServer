
CREATE PROC [dbo].[RO_Portal_SP_ConfermaVolumiProduzioneUpdate]
   @ConfermaData               DATETIME,
   @ConfermaTurnoId            INT = null,
   @ConfermaLineaId            INT = null,
   @ConfermaItemCode           VARCHAR(50),
   @ConfermaRevision           VARCHAR(20),
   @ConfermaVerso              VARCHAR(1),
   @ConfermaQuantita           INT,
   @ConfermaPalette            INT,
   @ConfermaLotto              VARCHAR(50),
   @ConfermaCodicePaletta      VARCHAR(2),
   @ConfermaDocNumOP           VARCHAR(20),
   @ConfermaVolumiProduzioneID INT
AS
      BEGIN

         UPDATE [dbo].[RO_Portal_ConfermaVolumiProduzione] SET
           [ConfermaData] = @ConfermaData, 
		 [ConfermaTurnoId] = @ConfermaTurnoId, 
		 [ConfermaLineaId] = @ConfermaLineaId, 
		 [ConfermaItemCode] = @ConfermaItemCode, 
		 [ConfermaRevision] = @ConfermaRevision, 
		 [ConfermaVerso] = @ConfermaVerso,
           [ConfermaQuantita] = @ConfermaQuantita, 
		 [ConfermaPalette] = @ConfermaPalette, 
		 [ConfermaLotto] = @ConfermaLotto, 
		 [ConfermaCodicePaletta] = @ConfermaCodicePaletta, 
		 [ConfermaDocNumOP] = @ConfermaDocNumOP
         WHERE
               ConfermaVolumiProduzioneId = @ConfermaVolumiProduzioneId;
      END;


