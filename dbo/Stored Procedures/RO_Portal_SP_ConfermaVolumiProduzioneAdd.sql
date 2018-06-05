
CREATE PROC [dbo].[RO_Portal_SP_ConfermaVolumiProduzioneAdd]
   @ConfermaData          DATETIME,
   @ConfermaTurnoId       INT         = NULL,
   @ConfermaLineaId       INT         = NULL,
   @ConfermaItemCode      VARCHAR(50),
   @ConfermaRevision      VARCHAR(20),
   @ConfermaVerso         VARCHAR(1),
   @ConfermaQuantita      INT,
   @ConfermaPalette       INT,
   @ConfermaLotto         VARCHAR(50),
   @ConfermaCodicePaletta VARCHAR(2),
   @ConfermaDocNumOP      VARCHAR(20),
   @ConfermaVolumiProduzioneId int output
AS
      BEGIN


         INSERT INTO [dbo].[RO_Portal_ConfermaVolumiProduzione]
(
                [ConfermaData]
              , [ConfermaTurnoId]
		    , [ConfermaLineaId]
              , [ConfermaItemCode]
              , [ConfermaRevision]
              , [ConfermaVerso]
              , [ConfermaQuantita]
              , [ConfermaPalette]
              , [ConfermaLotto]
              , [ConfermaCodicePaletta]
              , [ConfermaDocNumOP]
)
         VALUES(
                @ConfermaData, @ConfermaTurnoId, @ConfermaLineaId, @ConfermaItemCode, @ConfermaRevision, @ConfermaVerso, @ConfermaQuantita, @ConfermaPalette, 
			 @ConfermaLotto, @ConfermaCodicePaletta, @ConfermaDocNumOP);

	   select @ConfermaVolumiProduzioneId = SCOPE_IDentity()
      END;


