CREATE TABLE [dbo].[MES_wsFermiProduzione] (
    [ID]                  INT             IDENTITY (1, 1) NOT NULL,
    [DocEntryOP]          INT             NULL,
    [CentroDiLavoroCode]  VARCHAR (50)    NULL,
    [U_RscCode]           VARCHAR (50)    NULL,
    [U_OprCode]           VARCHAR (50)    NULL,
    [U_RO_DTMachPartCode] VARCHAR (10)    NULL,
    [U_ReasonCode]        VARCHAR (50)    NULL,
    [U_RO_DTTypeCode]     VARCHAR (10)    NULL,
    [DataInizio]          DATETIME        NULL,
    [OraInizio]           INT             NULL,
    [DataFine]            DATETIME        NULL,
    [OraFine]             INT             NULL,
    [Minuti]              DECIMAL (18, 3) NULL,
    [U_Remarks]           NVARCHAR (MAX)  NULL,
    [Status]              CHAR (1)        NULL,
    [CreateDate]          DATETIME        NULL,
    [IdScartoProduzione]  INT             NULL,
    [UpdateDate]          DATETIME        NULL,
    [DestDocEntry]        INT             NULL,
    [DestLineNum]         INT             NULL
);

