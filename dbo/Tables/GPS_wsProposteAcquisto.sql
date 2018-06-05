CREATE TABLE [dbo].[GPS_wsProposteAcquisto] (
    [ID]           INT             IDENTITY (1, 1) NOT NULL,
    [ItemCode]     NVARCHAR (50)   NULL,
    [U_Revision]   NVARCHAR (50)   NULL,
    [CardCode]     NVARCHAR (15)   NULL,
    [PQTReqDate]   DATETIME        NULL,
    [Quantity]     NUMERIC (19, 6) NULL,
    [Status]       CHAR (1)        DEFAULT ('N') NULL,
    [CreateDate]   DATETIME        DEFAULT (getdate()) NULL,
    [UpdateDate]   DATETIME        NULL,
    [DestDocEntry] INT             NULL,
    [DestLineNum]  INT             NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

