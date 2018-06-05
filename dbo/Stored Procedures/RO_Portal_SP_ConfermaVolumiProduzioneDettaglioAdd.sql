
CREATE PROC [dbo].[RO_Portal_SP_ConfermaVolumiProduzioneDettaglioAdd]
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
	, @AlcmanId int
AS
      BEGIN


INSERT INTO [dbo].[RO_Portal_ConfermaVolumiProduzioneDettagli]
           ([ConfermaVolumiProduzioneId]
           ,[ConfermaItemCodeDettaglio]
           ,[ConfermaRevisionDettaglio]
           ,[DatMsgDettaglio]
           ,[OraMsgDettaglio]
           ,[ConfermaVersoDettaglio]
           ,[ConfermaQuantitaDettaglio]
           ,[ConfermaPaletteDettaglio]
           ,[ConfermaLottoDettaglio]
           ,[ConfermaCodicePalettaDettaglio]
		 , AlcmanId)
         VALUES(
                @ConfermaVolumiProduzioneId
	, @ConfermaItemCodeDettaglio
	, @ConfermaRevisionDettaglio
	, @DatMsgDettaglio
	, @OraMsgDettaglio
	, @ConfermaVersoDettaglio
	, @ConfermaQuantitaDettaglio
	, @ConfermaPaletteDettaglio
	, @ConfermaLottoDettaglio
	, @ConfermaCodicePalettaDettaglio
	, @AlcmanId);
      END;


