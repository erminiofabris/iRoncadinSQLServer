
CREATE PROC [dbo].[RO_Portal_SP_PianoProduzioneSlotUpdate]
   @PianoProduzioneId             INT,
   @DataProduzione                DATETIME    = NULL,
   @PianoProduzioneCollocazioneId INT         = NULL,
   @PianoProduzioneLineaId        INT         = NULL,
   @ItemCode                      VARCHAR(50) = NULL,
   @Revision                      VARCHAR(10) = NULL,
   @N_Pallet                      INT         = NULL,
   @N_Pezzi                       INT         = NULL,
   @DocEntryOP                    INT         = NULL,
   @PianoProduzioneTurnoId        INT         = NULL,
   @Stato varchar(1)   = null,
   @Ordine int = NULL,
   @VelTeorica decimal(18,2) = null,
   @VelEffettiva decimal(18,2) = null,
   @TempoEffettivo decimal(18,2) = null
AS
   BEGIN
      UPDATE [dbo].[RO_Portal_PianoProduzione] SET
        [DataProduzione] = CASE
                             WHEN @DataProduzione IS NULL
                             THEN [DataProduzione]
                             ELSE @Dataproduzione
                           END, 
					  [PianoProduzioneCollocazioneId] = CASE
                             WHEN @PianoProduzioneCollocazioneId IS NULL
                             THEN [PianoProduzioneCollocazioneId]
                             ELSE @PianoProduzioneCollocazioneId
                           END,
					  [PianoProduzioneLineaId] = CASE
                             WHEN @PianoProduzioneLineaId IS NULL
                             THEN [PianoProduzioneLineaId]
                             ELSE @PianoProduzioneLineaId
                           END,
					  [ItemCode] = CASE
                             WHEN @ItemCode IS NULL
                             THEN [ItemCode]
                             ELSE @ItemCode
                           END,
					  [Revision] = CASE
                             WHEN @Revision IS NULL
                             THEN [Revision]
                             ELSE @Revision
                           END,
					  [N_Pallet] = CASE
                             WHEN @N_Pallet IS NULL
                             THEN [N_Pallet]
                             ELSE @N_Pallet
                           END,
					  [N_Pezzi] = CASE
                             WHEN @N_Pezzi IS NULL
                             THEN [N_Pezzi]
                             ELSE @N_Pezzi
                           END,
					  [DocEntryOP] = CASE
                             WHEN @DocEntryOP IS NULL
                             THEN [DocEntryOP]
                             ELSE @DocEntryOP
                           END,
					  [PianoProduzioneTurnoId] = CASE
                             WHEN @PianoProduzioneTurnoId IS NULL
                             THEN [PianoProduzioneTurnoId]
                             ELSE @PianoProduzioneTurnoId
                           END
					  ,
					  [Stato] = CASE
                             WHEN @Stato IS NULL
                             THEN [Stato]
                             ELSE @Stato
                           END
					  ,
					  [Ordine] = CASE
                             WHEN @Ordine IS NULL
                             THEN [Ordine]
                             ELSE @Ordine
                           END
					  ,
					  [VelTeorica] = CASE
                             WHEN @VelTeorica IS NULL
                             THEN [VelTeorica]
                             ELSE @VelTeorica
                           END
					  ,
					  [VelEffettiva] = CASE
                             WHEN @VelEffettiva IS NULL
                             THEN [VelEffettiva]
                             ELSE @VelEffettiva
					   END
					    ,
					  [TempoEffettivo] = CASE
                             WHEN @TempoEffettivo IS NULL
                             THEN [TempoEffettivo]
                             ELSE @TempoEffettivo
                           END

                           
      WHERE
            PianoProduzioneId = @PianoProduzioneId;
   END;



