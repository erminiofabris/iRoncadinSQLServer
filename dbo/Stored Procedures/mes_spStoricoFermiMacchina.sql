
CREATE PROC [dbo].[mes_spStoricoFermiMacchina]
   @DocEntryOP     INT,
   @DTTypeCode     VARCHAR(50) = NULL,
   @ReasonCode     VARCHAR(50) = NULL,
   @DTMachPartCode VARCHAR(50) = NULL,
   @RscCode        VARCHAR(50) = NULL
AS
   BEGIN

      SELECT
             mwfp.ID
           , mwfp.DocEntryOP
           , mwfp.U_OprCode
           , mwfp.U_RscCode
           , mwfp.U_RO_DTMachPartCode
           , mwfp.U_ReasonCode
           , mwfp.U_RO_DTTypeCode
           , mwfp.DataInizio
           , mwfp.OraInizio
           , mwfp.DataFine
           , mwfp.OraFine
           , mwfp.U_Remarks
           , mwfp.Status
           , mwfp.CreateDate
           , mwfp.UpdateDate
           , mwfp.DestDocEntry
           , mwfp.DestLineNum
      FROM dbo.MES_wsFermiProduzione mwfp
      WHERE DocEntryOP = @DocEntryOP
            AND (@DTTypeCode IS NULL
                 OR (@DTTypeCode IS NOT NULL
                     AND U_RO_DTTypeCode = @DTTypeCode))
            AND (@ReasonCode IS NULL
                 OR (@ReasonCode IS NOT NULL
                     AND U_ReasonCode = @ReasonCode))
            AND (@DTMachPartCode IS NULL
                 OR (@DTMachPartCode IS NOT NULL
                     AND U_RO_DTMachPartCode = @DTMachPartCode))
            AND (@RscCode IS NULL
                 OR (@RscCode IS NOT NULL
                     AND U_RscCode = @RscCode));
   END;
