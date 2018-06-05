CREATE TABLE [dbo].[RO_Portal_PianoProduzione] (
    [PianoProduzioneId]             INT             IDENTITY (1, 1) NOT NULL,
    [DataProduzione]                DATETIME        NULL,
    [PianoProduzioneCollocazioneId] INT             NULL,
    [PianoProduzioneLineaId]        INT             NULL,
    [ItemCode]                      VARCHAR (50)    NULL,
    [Revision]                      VARCHAR (10)    NULL,
    [N_Pallet]                      INT             NULL,
    [N_Pezzi]                       INT             NULL,
    [Velocita]                      VARCHAR (10)    NULL,
    [DocEntryOP]                    INT             NULL,
    [PianoProduzioneTurnoId]        INT             NULL,
    [PianoExcelId]                  INT             NULL,
    [Settimana]                     INT             NULL,
    [Anno]                          INT             NULL,
    [VelTeorica]                    DECIMAL (18, 2) NULL,
    [VelEffettiva]                  DECIMAL (18, 2) NULL,
    [TempoEffettivo]                INT             NULL,
    [Ordine]                        INT             NULL,
    [Stato]                         CHAR (1)        NULL,
    [PianoProduzioneVelocitaId]     INT             NULL
);

