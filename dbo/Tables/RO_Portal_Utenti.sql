CREATE TABLE [dbo].[RO_Portal_Utenti] (
    [UtenteId]      INT             IDENTITY (1, 1) NOT NULL,
    [Nome]          VARCHAR (100)   NOT NULL,
    [Cognome]       VARCHAR (100)   NOT NULL,
    [UserName]      VARCHAR (50)    NOT NULL,
    [Password]      VARBINARY (MAX) NOT NULL,
    [Abilitato]     BIT             DEFAULT ((1)) NULL,
    [DataCreazione] DATETIME        DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([UtenteId] ASC)
);

