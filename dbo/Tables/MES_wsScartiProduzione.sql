CREATE TABLE [dbo].[MES_wsScartiProduzione] (
    [ID]                 INT             IDENTITY (1, 1) NOT NULL,
    [DocEntryOP]         INT             NULL,
    [CausaleScarto]      VARCHAR (50)    NULL,
    [CentroDiLavoroCode] VARCHAR (50)    NULL,
    [TipoScarto]         VARCHAR (10)    NULL,
    [Quantita]           DECIMAL (19, 6) NULL,
    [Status]             CHAR (1)        NULL,
    [CreateDate]         DATETIME        NULL,
    [UpdateDate]         DATETIME        NULL,
    [DestDocEntry]       INT             NULL,
    [DestLineNum]        INT             NULL
);

