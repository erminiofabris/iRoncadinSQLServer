CREATE TABLE [dbo].[RO_Portal_ConfermaVolumiProduzione] (
    [ConfermaVolumiProduzioneId] INT          IDENTITY (1, 1) NOT NULL,
    [ConfermaData]               DATETIME     NULL,
    [ConfermaTurnoId]            INT          NULL,
    [ConfermaItemCode]           VARCHAR (50) NULL,
    [ConfermaRevision]           VARCHAR (20) NULL,
    [ConfermaVerso]              VARCHAR (1)  NULL,
    [ConfermaQuantita]           INT          NULL,
    [ConfermaPalette]            INT          NULL,
    [ConfermaLotto]              VARCHAR (50) NULL,
    [ConfermaCodicePaletta]      VARCHAR (2)  NULL,
    [ConfermaDocNumOP]           VARCHAR (20) NULL,
    [ConfermaLineaId]            INT          NULL
);

