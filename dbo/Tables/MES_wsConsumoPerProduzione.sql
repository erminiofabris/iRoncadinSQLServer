CREATE TABLE [dbo].[MES_wsConsumoPerProduzione] (
    [ID]              INT             IDENTITY (1, 1) NOT NULL,
    [DocEntryOP]      INT             NOT NULL,
    [DocEntryFather]  INT             NULL,
    [U_WordCode]      NVARCHAR (30)   NULL,
    [U_OprCode]       NVARCHAR (30)   NULL,
    [ItemCode]        NVARCHAR (50)   NULL,
    [U_Revision]      NVARCHAR (50)   NULL,
    [Quantity]        NUMERIC (19, 6) NULL,
    [Status]          CHAR (1)        CONSTRAINT [DF__MES_wsCon__Statu__1975C517] DEFAULT ('N') NULL,
    [CreateDate]      DATETIME        CONSTRAINT [DF__MES_wsCon__Creat__1A69E950] DEFAULT (getdate()) NULL,
    [UpdateDate]      DATETIME        NULL,
    [DestDocEntry]    INT             NULL,
    [DestLineNum]     INT             NULL,
    [AlternativeCode] BIT             CONSTRAINT [DF_MES_wsConsumoPerProduzione_AlternativeCode] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__MES_wsCo__3214EC27B6F12605] PRIMARY KEY CLUSTERED ([ID] ASC)
);

