CREATE TABLE [dbo].[RO_Portal_GruppiUtenti] (
    [GruppoUtenteId] INT      IDENTITY (1, 1) NOT NULL,
    [UtenteId]       INT      NOT NULL,
    [GruppoId]       INT      NOT NULL,
    [DataCreazione]  DATETIME DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([GruppoUtenteId] ASC),
    CONSTRAINT [fk_GruppiUtenti_Gruppi] FOREIGN KEY ([GruppoId]) REFERENCES [dbo].[RO_Portal_Gruppi] ([GruppoId]),
    CONSTRAINT [fk_GruppiUtenti_Utenti] FOREIGN KEY ([UtenteId]) REFERENCES [dbo].[RO_Portal_Utenti] ([UtenteId])
);

