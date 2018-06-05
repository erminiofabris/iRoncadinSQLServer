CREATE TABLE [dbo].[MES_wsConsumoPerProduzioneListaLotti] (
    [ID]         INT             IDENTITY (1, 1) NOT NULL,
    [FatherId]   INT             NOT NULL,
    [ItemCode]   NVARCHAR (50)   NULL,
    [DistNumber] NVARCHAR (32)   NULL,
    [Quantity]   NUMERIC (19, 6) NULL,
    [Status]     CHAR (1)        DEFAULT ('N') NULL,
    [CreateDate] DATETIME        DEFAULT (getdate()) NULL,
    [UpdateDate] DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

