
CREATE PROC [dbo].[RO_Portal_SP_EstraiTurnoByGiornoCollocazione]
   @Data         DATETIME,
   @Collocazione INT
AS
      BEGIN
         SELECT
                [Day]
              , [Week]
              , [WeekDay]
              , [WeekDayCode]
              , Turno
              , Collocazione
		    , rpppt.PianoProduzioneTurnoId
         FROM [iSBO].[dbo].[RO_Portal_PianoProduzioneDistribuzioneTurni] 
	    UNPIVOT(collocazione FOR turno IN(  A
                                           , B
                                           , C
                                           , D
                                           , E)) upiv
								   JOIN dbo.RO_Portal_PianoProduzioneTurni rpppt ON rpppt.Code=upiv.turno
         WHERE [Day] = CAST(@Data AS DATE)
               AND upiv.collocazione = @Collocazione;
      END;
