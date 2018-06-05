CREATE TABLE [dbo].[RO_Portal_Gruppi] (
    [GruppoId]      INT           IDENTITY (1, 2) NOT NULL,
    [Descrizione]   VARCHAR (100) NULL,
    [Abilitato]     BIT           DEFAULT ((1)) NULL,
    [DataCreazione] DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([GruppoId] ASC)
);

