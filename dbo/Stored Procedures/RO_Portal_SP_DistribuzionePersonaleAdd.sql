
CREATE PROC [dbo].[RO_Portal_SP_DistribuzionePersonaleAdd]
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
         IF EXISTS
(
  SELECT
         1
  FROM ro_portal_distribuzionepersonale
  WHERE ItemCode = @Itemcode
        AND U_RtgCode = @U_RtgCode
        AND U_OprCode = @U_OprCode
        AND U_RscCode = @U_RscCode
        AND bomCode = @BomCode
	   AND bomFatherCode = @BomFatherCode
	   AND U_RtgFatherCode = @U_RtgFatherCode
)
            BEGIN
               EXEC ro_portal_sp_distribuzionepersonaleupdate
                 @ItemCode = @Itemcode, @U_RtgCode = @U_RtgCode, @U_OprCode = @U_OprCode, @U_RscCode = @U_RscCode, @BomCode = @BomCode, 
			  @Nrisorse = @Nrisorse, @BomFatherCode = @BomFatherCode, @U_RtgFatherCode = @U_RtgFatherCode;
            END;
           ELSE
            BEGIN
               INSERT INTO [dbo].[RO_Portal_DistribuzionePersonale]
(
                      [ItemCode]
                    , [U_RtgCode]
                    , [U_OprCode]
                    , [U_RscCode]
                    , [BomCode]
                    , [NRisorse]
				, [BomFatherCode]
				, [U_RtgFatherCode]
)
               VALUES(
                      @ItemCode, @U_RtgCode, @U_OprCode, @U_RscCode, @BomCode, @NRisorse, @BomFatherCode, @U_RtgFatherCode);
            END;
      END;




