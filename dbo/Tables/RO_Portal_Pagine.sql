CREATE TABLE [dbo].[RO_Portal_Pagine] (
    [PaginaId]      INT            IDENTITY (1, 1) NOT NULL,
    [Descrizione]   VARCHAR (100)  NOT NULL,
    [PageUrl]       VARCHAR (1000) NULL,
    [Abilitato]     BIT            CONSTRAINT [DF__RO_Portal__Abili__668030F6] DEFAULT ((1)) NULL,
    [DataCreazione] DATETIME       CONSTRAINT [DF__RO_Portal__DataC__6774552F] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK__RO_Porta__31EFFAADE6191B2A] PRIMARY KEY CLUSTERED ([PaginaId] ASC)
);

