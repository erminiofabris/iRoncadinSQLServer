CREATE TABLE [dbo].[RO_Portal_ConfermaVolumiProduzioneDettagli] (
    [ConfermaVolumiProduzioneDettaglioId] INT          IDENTITY (1, 1) NOT NULL,
    [ConfermaVolumiProduzioneId]          INT          NULL,
    [ConfermaItemCodeDettaglio]           VARCHAR (50) NULL,
    [ConfermaRevisionDettaglio]           VARCHAR (20) NULL,
    [DatMsgDettaglio]                     INT          NULL,
    [OraMsgDettaglio]                     INT          NULL,
    [ConfermaVersoDettaglio]              VARCHAR (1)  NULL,
    [ConfermaQuantitaDettaglio]           INT          NULL,
    [ConfermaPaletteDettaglio]            INT          NULL,
    [ConfermaLottoDettaglio]              VARCHAR (50) NULL,
    [ConfermaCodicePalettaDettaglio]      VARCHAR (2)  NULL,
    [AlcmanId]                            INT          NULL
);

