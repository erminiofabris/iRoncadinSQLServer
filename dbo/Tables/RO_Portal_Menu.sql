CREATE TABLE [dbo].[RO_Portal_Menu] (
    [MenuId]        INT           IDENTITY (1, 1) NOT NULL,
    [PadreMenuId]   INT           NULL,
    [PaginaId]      INT           NULL,
    [Descrizione]   VARCHAR (100) NOT NULL,
    [Abilitato]     BIT           CONSTRAINT [DF__RO_Portal__Abili__6A50C1DA] DEFAULT ((1)) NULL,
    [DataCreazione] DATETIME      CONSTRAINT [DF__RO_Portal__DataC__6B44E613] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK__RO_Porta__C99ED230CEAEB99A] PRIMARY KEY CLUSTERED ([MenuId] ASC),
    CONSTRAINT [fk_Menu_Pagine] FOREIGN KEY ([PaginaId]) REFERENCES [dbo].[RO_Portal_Pagine] ([PaginaId])
);

