

CREATE PROC [dbo].[RO_Portal_SP_PianoProduzioneDaExcel]
   @PianoExcelId   INT,
   @DataProduzione DATETIME       = NULL,
   @Collocazione   VARCHAR(1)     = NULL,
   @LineaId        INT            = NULL,
   @ItemCode       VARCHAR(50)    = NULL,
   @Revision       VARCHAR(10)    = NULL,
   @Turno          VARCHAR(1)     = NULL,
   @Settimana      INT            = NULL,
   @Anno           INT            = NULL,
   @Ordine         INT            = NULL,
   @N_Pezzi         NUMERIC(18, 4)  = NULL,
   @N_Pallet        NUMERIC(18, 4)  = NULL,
   @Velocita       VARCHAR(10)
AS
      BEGIN

         DECLARE @CollocazioneId INT = NULL;
         DECLARE @TurnoId INT = NULL;
	    declare @PianoProduzioneVelocitaId INT = null;
	    Declare @ItemCodeSAP varchar(50) = null;
	    DEclare @RevisionSAP varchar(20) = null;

         SELECT
                @CollocazioneId = PianoProduzioneCollocazioneId
         FROM RO_Portal_PianoProduzioneCollocazioni
         WHERE Code = @Collocazione;

         SELECT
                @TurnoId = PianoProduzioneTurnoId
         FROM RO_Portal_PianoProduzioneTurni
         WHERE Code = @Turno;

	    SELECT
                @PianoProduzioneVelocitaId = PianoProduzioneVelocitaId
         FROM RO_Portal_PianoProduzioneVelocita
         WHERE Code = @Velocita;

	    /********************************************
	    -- da sistemare con estrazione itemcode e revision di sap

	    --select @ItemCodeSAP = 

	    *********************************************/

/********************************
  se il record esiste già nel DB 
********************************/
         IF EXISTS
(
  SELECT
         *
  FROM ro_portal_pianoproduzione
  WHERE PianoExcelid = @PianoExcelId
)
            BEGIN
/****************************************************
se il record esiste già ma si è modificato l'articolo
****************************************************/
               IF NOT EXISTS
(
  SELECT
         *
  FROM Ro_portal_pianoproduzione p
  WHERE pianoexcelId = @PIanoExcelId
        AND itemcode = @ItemCode
)
                  BEGIN
/****************************
 elimino il vecchio articolo 
****************************/
                     DELETE FROM ro_portal_pianoproduzione
                     WHERE
                           pianoexcelid = @PianoExcelId
                           AND stato = 'N'; --solo quelli che non hanno già generato un ordine di produzione
/**************************
 aggiungo il nuovo articolo
**************************/
                     INSERT INTO [dbo].[RO_Portal_PianoProduzione]
(
                            PianoExcelId
                          , [DataProduzione]
                          , [PianoProduzioneCollocazioneId]
                          , [PianoProduzioneLineaId]
                          , [ItemCode]
                          , [Revision]
                          , [PianoProduzioneTurnoId]
                          , Settimana
                          , Anno
                          , Ordine
                          , Stato
                          , N_Pezzi
                          , N_Pallet
                          , PianoProduzioneVelocitaId
)
                     VALUES(
                            @PianoExcelId, @DataProduzione, @CollocazioneId, @LineaId, @ItemCode, 'A', @TurnoId, @Settimana, @Anno, @Ordine, 'A', @N_Pezzi, @N_Pallet, @PianoProduzioneVelocitaId);
                  END;
/*************************************
 se l'articolo non è stato modificato 
*************************************/
               IF EXISTS
(
  SELECT
         *
  FROM Ro_portal_pianoproduzione p
  WHERE pianoexcelId = @PIanoExcelId
        AND itemcode = @ItemCode
)
                  BEGIN
/***************************
 setto lo stato a ADDED = A 
***************************/
                     UPDATE ro_portal_pianoproduzione SET
                       stato = 'A'
                     WHERE
                           @PianoExcelId = @PianoExcelId
                           AND @ItemCode = itemcode;
                  END;
            END;
           ELSE
            BEGIN
               INSERT INTO [dbo].[RO_Portal_PianoProduzione]
(
                      PianoExcelId
                    , [DataProduzione]
                    , [PianoProduzioneCollocazioneId]
                    , [PianoProduzioneLineaId]
                    , [ItemCode]
                    , [Revision]
                    , [PianoProduzioneTurnoId]
                    , Settimana
                    , Anno
                    , Ordine
                    , stato
                    , N_Pezzi
                    , N_Pallet
                    , PianoProduzioneVelocitaId
)
               VALUES(
                      @PianoExcelId, @DataProduzione, @CollocazioneId, @LineaId, @ItemCode, 'A', @TurnoId, @Settimana, @Anno, @Ordine, 'A', @N_Pezzi, @N_Pallet, @PianoProduzioneVelocitaId);
            END;
      END;

