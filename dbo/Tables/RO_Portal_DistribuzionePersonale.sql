CREATE TABLE [dbo].[RO_Portal_DistribuzionePersonale] (
    [Id]              INT             IDENTITY (1, 1) NOT NULL,
    [ItemCode]        VARCHAR (50)    NULL,
    [U_RtgCode]       VARCHAR (50)    NULL,
    [U_OprCode]       VARCHAR (50)    NULL,
    [U_RscCode]       VARCHAR (50)    NULL,
    [BomCode]         VARCHAR (50)    NULL,
    [NRisorse]        DECIMAL (18, 6) NULL,
    [BomFatherCode]   VARCHAR (50)    NULL,
    [U_RtgFatherCode] VARCHAR (50)    NULL
);

