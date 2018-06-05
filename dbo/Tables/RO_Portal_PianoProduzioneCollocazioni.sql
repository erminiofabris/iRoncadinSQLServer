CREATE TABLE [dbo].[RO_Portal_PianoProduzioneCollocazioni] (
    [PianoProduzioneCollocazioneId] INT          IDENTITY (1, 1) NOT NULL,
    [Descrizione]                   VARCHAR (50) NULL,
    [Code]                          VARCHAR (1)  NULL,
    [OraDa]                         INT          NULL,
    [OraA]                          INT          NULL
);

