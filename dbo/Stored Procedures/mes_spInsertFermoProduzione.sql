
CREATE PROC [dbo].[mes_spInsertFermoProduzione]
   @DocEntryOP          INT,
   @CentroDiLavoroCode  NVARCHAR(50), -- Centro di lavoro
   @U_RscCode           NVARCHAR(50), -- Codice risorsa
   @U_OprCode           NVARCHAR(50) = NULL, -- Codice fase
   @U_RO_DTMachPartCode VARCHAR(10), --Parte macchina
   @U_ReasonCode        NVARCHAR(50), -- Causale fermo
   @U_RO_DTTypeCode     VARCHAR(10), -- Tipologia fermo
   @U_Remarks           VARCHAR(MAX) = NULL, --note su fermi
   @DataInizio          DATETIME = null,
   @OraInizio           INT = null,
   @DataFine            DATETIME = null,
   @OraFine             INT = null,
   @Minuti		    decimal(18,3) = null,
   @IdScartoProduzione INT = NULL
AS
   BEGIN

      DECLARE @ID INT = NULL;

      INSERT INTO dbo.MES_wsFermiProduzione
      (
             DocEntryOP
           , CentroDiLavoroCode
           , U_RscCode
           , U_OprCode
           , U_RO_DTMachPartCode
           , U_ReasonCode
           , U_RO_DTTypeCode
		   , U_Remarks	
           , DataInizio
           , OraInizio
           , DataFine
           , OraFine
		 , minuti
           , [status]
           , CreateDate
		 , IdScartoProduzione
      )
      VALUES(
             @DocEntryOP, @CentroDiLavoroCode, @U_RscCode, @U_OprCode, -- Codice fase
             @U_RO_DTMachPartCode, --Parte macchina
             @U_ReasonCode, -- Causale fermo
             @U_RO_DTTypeCode, -- Tipologia fermo
			 @U_Remarks,
             @DataInizio, @OraInizio, @DataFine, @OraFine, @Minuti, 'N', GETDATE(), @IdScartoProduzione);
   END;



