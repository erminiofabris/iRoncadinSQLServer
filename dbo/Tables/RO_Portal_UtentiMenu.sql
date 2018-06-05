CREATE TABLE [dbo].[RO_Portal_UtentiMenu] (
    [UtenteMenuId]  INT      IDENTITY (1, 1) NOT NULL,
    [UtenteId]      INT      NOT NULL,
    [MenuId]        INT      NOT NULL,
    [DataCreazione] DATETIME DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([UtenteMenuId] ASC),
    CONSTRAINT [fk_UtentiMenu_Menu] FOREIGN KEY ([MenuId]) REFERENCES [dbo].[RO_Portal_Menu] ([MenuId]),
    CONSTRAINT [fk_UtentiMenu_Utenti] FOREIGN KEY ([UtenteId]) REFERENCES [dbo].[RO_Portal_Utenti] ([UtenteId])
);

