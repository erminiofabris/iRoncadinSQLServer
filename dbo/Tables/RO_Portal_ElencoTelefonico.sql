CREATE TABLE [dbo].[RO_Portal_ElencoTelefonico] (
    [ElencoTelefonicoId] INT            IDENTITY (1, 1) NOT NULL,
    [UtenteId]           INT            NULL,
    [UfficioId]          INT            NULL,
    [Telefono]           NVARCHAR (20)  NULL,
    [Cellulare]          NVARCHAR (20)  NULL,
    [Email]              NVARCHAR (200) NULL
);

