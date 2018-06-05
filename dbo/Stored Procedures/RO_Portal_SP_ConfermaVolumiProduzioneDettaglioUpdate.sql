
create PROC [dbo].[RO_Portal_SP_ConfermaVolumiProduzioneDettaglioUpdate]
  @ConfermaVolumiProduzioneId int = null
	, @ConfermaItemCodeDettaglio VARCHAR(50) = null
	, @ConfermaRevisionDettaglio VARCHAR(20) = null
	, @DatMsgDettaglio int = null
	, @OraMsgDettaglio int = null
	, @ConfermaVersoDettaglio VARCHAR(1) = null
	, @ConfermaQuantitaDettaglio int = null
	, @ConfermaPaletteDettaglio int = null
	, @ConfermaLottoDettaglio VARCHAR(50) = null
	, @ConfermaCodicePalettaDettaglio VARCHAR(2) = null
	, @ConfermaVolumiProduzioneDettaglioId INT
AS
      BEGIN

         UPDATE [dbo].[RO_Portal_ConfermaVolumiProduzioneDettagli] SET
           [ConfermaVolumiProduzioneId] = @ConfermaVolumiProduzioneId
		 , [ConfermaItemCodeDettaglio] = @ConfermaItemCodeDettaglio
		 , [ConfermaRevisionDettaglio] = @ConfermaRevisionDettaglio
		 , [DatMsgDettaglio] = @DatMsgDettaglio
		 , [OraMsgDettaglio] = @OraMsgDettaglio
		 , [ConfermaVersoDettaglio] = @ConfermaVersoDettaglio
		 , [ConfermaQuantitaDettaglio] = @ConfermaQuantitaDettaglio
		 , [ConfermaPaletteDettaglio] = @ConfermaPaletteDettaglio
		 , [ConfermaLottoDettaglio] = @ConfermaLottoDettaglio
		 , [ConfermaCodicePalettaDettaglio] = @ConfermaCodicePalettaDettaglio
         WHERE
               ConfermaVolumiProduzioneDettaglioId = @ConfermaVolumiProduzioneDettaglioId;
      END;


