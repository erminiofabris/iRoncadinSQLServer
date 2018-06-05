
CREATE PROC [dbo].[RO_Portal_SP_PianoProduzioneSlotAdd]
   @DataProduzione                DATETIME    = NULL,
   @PianoProduzioneCollocazioneId INT         = NULL,
   @PianoProduzioneLineaId        INT         = NULL,
   @ItemCode                      VARCHAR(50) = NULL,
   @Revision                      VARCHAR(10) = NULL,
   @N_Pallet                      INT         = NULL,
   @N_Pezzi                       INT         = NULL,
   @DocEntryOP                    INT         = NULL,
   @PianoProduzioneTurnoId        INT         = NULL,
   @Ordine                        INT         = NULL,
   @PianoProduzioneId             INT         = NULL OUTPUT
AS
      BEGIN
         IF NOT EXISTS
(
  SELECT
         *
  FROM [RO_Portal_PianoProduzione]
  WHERE [DataProduzione] = @DataProduzione
        AND (@PianoProduzioneCollocazioneId IS NULL
             OR (@PianoProduzioneCollocazioneId IS NOT NULL
                 AND [PianoProduzioneCollocazioneId] = @PianoProduzioneCollocazioneId))
        AND (@PianoProduzioneLineaId IS NULL
             OR (@PianoProduzioneLineaId IS NOT NULL
                 AND [PianoProduzioneLineaId] = @PianoProduzioneLineaId))
        AND (@ItemCode IS NULL
             OR (@ItemCode IS NOT NULL
                 AND [ItemCode] = @ItemCode))
        AND (@Revision IS NULL
             OR (@Revision IS NOT NULL
                 AND [Revision] = @Revision))
        AND (@N_Pallet IS NULL
             OR (@N_Pallet IS NOT NULL
                 AND [N_Pallet] = @N_Pallet))
        AND (@N_Pezzi IS NULL
             OR (@N_Pezzi IS NOT NULL
                 AND [N_Pezzi] = @N_Pezzi))
        AND (@DocEntryOP IS NULL
             OR (@DocEntryOP IS NOT NULL
                 AND [DocEntryOP] = @DocEntryOP))
        AND (@PianoProduzioneTurnoId IS NULL
             OR (@PianoProduzioneTurnoId IS NOT NULL
                 AND [PianoProduzioneTurnoId] = @PianoProduzioneTurnoId))
        AND (@Ordine IS NULL
             OR (@Ordine IS NOT NULL
                 AND [Ordine] = @Ordine))
)
            BEGIN
               INSERT INTO [dbo].[RO_Portal_PianoProduzione]
(
                      [DataProduzione]
                    , [PianoProduzioneCollocazioneId]
                    , [PianoProduzioneLineaId]
                    , [ItemCode]
                    , [Revision]
                    , [N_Pallet]
                    , [N_Pezzi]
                    , [DocEntryOP]
                    , [PianoProduzioneTurnoId]
                    , [Ordine]
)
               VALUES(
                      @DataProduzione, @PianoProduzioneCollocazioneId, @PianoProduzioneLineaId, @ItemCode, @Revision, @N_Pallet, @N_Pezzi, @DocEntryOP, @PianoProduzioneTurnoId, @Ordine);

               SET @PianoProduzioneId = SCOPE_IDENTITY();
            END;
      END;



