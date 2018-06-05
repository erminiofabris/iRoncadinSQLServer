CREATE TABLE [dbo].[RO_Portal_GruppiMenu] (
    [GruppoMenuId]  INT      IDENTITY (1, 1) NOT NULL,
    [GruppoId]      INT      NOT NULL,
    [MenuId]        INT      NOT NULL,
    [DataCreazione] DATETIME DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([GruppoMenuId] ASC),
    CONSTRAINT [fk_GruppiMenu_Gruppi] FOREIGN KEY ([GruppoId]) REFERENCES [dbo].[RO_Portal_Gruppi] ([GruppoId]),
    CONSTRAINT [fk_GruppiMenu_Menu] FOREIGN KEY ([MenuId]) REFERENCES [dbo].[RO_Portal_Menu] ([MenuId])
);

