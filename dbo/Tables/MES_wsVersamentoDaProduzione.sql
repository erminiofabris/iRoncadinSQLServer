CREATE TABLE [dbo].[MES_wsVersamentoDaProduzione] (
    [ID]             INT             IDENTITY (1, 1) NOT NULL,
    [DocEntryOP]     INT             NOT NULL,
    [DocEntryFather] INT             NULL,
    [U_WordCode]     NVARCHAR (30)   NULL,
    [U_OprCode]      NVARCHAR (30)   NULL,
    [ItemCode]       NVARCHAR (50)   NULL,
    [U_Revision]     NVARCHAR (50)   NULL,
    [Quantity]       NUMERIC (19, 6) NULL,
    [Status]         CHAR (1)        CONSTRAINT [DF__MES_wsVer__Statu__2116E6DF] DEFAULT ('N') NULL,
    [CreateDate]     DATETIME        CONSTRAINT [DF__MES_wsVer__Creat__220B0B18] DEFAULT (getdate()) NULL,
    [UpdateDate]     DATETIME        NULL,
    [DestDocEntry]   INT             NULL,
    [DestLineNum]    INT             NULL,
    [DistNumber]     NVARCHAR (32)   NULL,
    CONSTRAINT [PK__MES_wsVe__3214EC271E5E6B50] PRIMARY KEY CLUSTERED ([ID] ASC)
);

