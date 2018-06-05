CREATE TABLE [dbo].[MES_wsRilevazioniPesiInLinea] (
    [ID]             INT             IDENTITY (1, 1) NOT NULL,
    [DocEntryOP]     INT             NULL,
    [DocEntryFather] INT             NULL,
    [DocEntryTestCQ] INT             NULL,
    [U_OprCode]      VARCHAR (50)    NULL,
    [U_ItemCode]     VARCHAR (50)    NULL,
    [U_Revision]     VARCHAR (50)    NULL,
    [U_Remarks]      NVARCHAR (MAX)  NULL,
    [U_Value]        DECIMAL (18, 6) NULL,
    [Status]         CHAR (1)        NULL,
    [CreateDate]     DATETIME        NULL,
    [UpdateDate]     DATETIME        NULL,
    [DestDocEntry]   INT             NULL,
    [DestLineNum]    INT             NULL,
    [DestSubLineNum] INT             NULL
);

