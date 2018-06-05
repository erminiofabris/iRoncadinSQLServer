

CREATE PROC [dbo].[RO_Portal_SP_DistribuzionePersonaleUpdate]
   @ItemCode  VARCHAR(50),
   @U_RtgCode VARCHAR(50),
   @U_OprCode VARCHAR(50),
   @U_RscCode VARCHAR(50),
   @BomCode   VARCHAR(50),
   @NRisorse  DECIMAL(18, 6),
   @BomFatherCode varchar(50),
   @U_RtgFatherCode varchar(50)
AS
      BEGIN
         UPDATE ro_portal_distribuzionepersonale SET
           nrisorse = @NRisorse
         WHERE
               ItemCode = @Itemcode
               AND U_RtgCode = @U_RtgCode
               AND U_OprCode = @U_OprCode
               AND U_RscCode = @U_RscCode
               AND bomCode = @BomCode
			AND bomFatherCode = @BomFatherCode
			AND U_RtgFatherCode = @U_RtgFatherCode;
      END;




