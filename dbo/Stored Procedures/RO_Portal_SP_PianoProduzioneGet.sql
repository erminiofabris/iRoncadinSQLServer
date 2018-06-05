
CREATE PROC [dbo].[RO_Portal_SP_PianoProduzioneGet]
   @DaData         DATETIME = NULL,
   @AData          DATETIME = NULL,
   @CollocazioneId INT      = NULL,
   @TurnoId        INT      = NULL
AS
   BEGIN

   create table #Distinta (id int IDENTITY(1,1) not null, itemcode nvarchar(50), revision nvarchar(20))

      IF(@DaData IS NULL)
         BEGIN
            SET @DaData = DATEADD(dd, -(DATEPART(dw, GETDATE()) - 2), GETDATE()); --WeekStart
            SET @AData = DATEADD(dd, 7 - (DATEPART(dw, GETDATE())) + 1, GETDATE()); --WeekEnd
         END;

      SELECT
             rppp.PianoProduzioneId
           , rppp.DataProduzione
           , DATEADD(hour, ordine, rppp.DataProduzione) AS DataInizio
           , DATEADD(minute, -1, DATEADD(hour, ordine + 1, rppp.DataProduzione)) AS DataFine
--, DATEADD(minute, -1, DATEADD(dd, 1, rppp.DataProduzione)) AS DataFine
           , rppp.PianoProduzioneCollocazioneId
           , rppp.PianoProduzioneLineaId
           , rppp.PianoProduzioneTurnoId
           , codartsap AS itemcode--rppp.ItemCode
           , rppp.Revision
           , rppp.ItemCode+'-'+rppp.Revision AS [Subject]
           , rppp.N_Pallet
           , rppp.N_Pezzi
           , rppp.Velocita
           , rppp.DocEntryOP
           , rpppc.Descrizione AS CollocazioneDescrizione
           , rpppl.Descrizione AS LineaDescrizione
           , rpppt.Descrizione AS TurnoDescrizione
           , omor.U_Status AS StatusOP
           , rppp.Stato
           , rppp.Ordine % 4 AS Ordine
           , rppp.VelTeorica
           , rppp.VelEffettiva
           , rppp.TempoEffettivo
           , rppp.PianoProduzioneVelocitaId
           , rpppv.Code AS PianoProduzioneVelocitaCode
           , rpppv.Valore AS PianoProduzioneVelocitaValore
           , rpppc.OraDa AS CollocazioneOraDa
           , rpppc.OraA AS CollocazioneOraA
           , itm4.QtyPerPack
           , 0 AS ProcessiOK
      INTO
           #Dati
      FROM dbo.RO_Portal_PianoProduzione rppp
           LEFT OUTER JOIN SBORONCADIN_TRAINING_20180508.dbo.itm4 itm4 ON rppp.itemcode = itm4.ItemCode
           JOIN dbo.RO_Portal_PianoProduzioneLinee rpppl ON rppp.PianoProduzioneLineaId = rpppl.PianoProduzioneLineaId
           LEFT OUTER JOIN dbo.RO_Portal_PianoProduzioneCollocazioni rpppc ON rppp.PianoProduzioneCollocazioneId = rpppc.PianoProduzioneCollocazioneId
           LEFT OUTER JOIN dbo.RO_Portal_PianoProduzioneTurni rpppt ON rppp.PianoProduzioneTurnoId = rpppt.PianoProduzioneTurnoId
           LEFT OUTER JOIN dbo.RO_Portal_PianoProduzioneVelocita rpppv ON rppp.PianoProduzioneVelocitaId = rpppv.PianoProduzioneVelocitaId
           LEFT OUTER JOIN SBORONCADIN_TRAINING_20180508.dbo.[@CT_PF_OMOR] omor ON rppp.docentryop = omor.docentry
		   LEFT OUTER JOIN isbo.dbo.ACGTransArticoli aa ON rppp.ItemCode = aa.CodArtACG AND rppp.Revision = aa.CodRevSAP
      WHERE rppp.DataProduzione BETWEEN @DaData AND @AData
            AND ((@CollocazioneId IS NOT NULL
                  AND rppp.PianoProduzioneCollocazioneId = @CollocazioneId)
                 OR (@CollocazioneId IS NULL))
            AND ((@TurnoId IS NOT NULL
                  AND rppp.PianoProduzioneTurnoId = @TurnoId)
                 OR (@TurnoId IS NULL))
            AND (itm4.uomtype IS NULL
                 OR itm4.uomtype = 'S') --Vendita
            AND (itm4.uomentry IS NULL
                 OR itm4.uomentry = 1) --PZ
            AND (itm4.pkgcode IS NULL
                 OR itm4.pkgcode = 1); --Pallet;
      DECLARE @Id INT = NULL;
      DECLARE @ItemCode VARCHAR(50) = NULL;
      DECLARE @Revision VARCHAR(20) = NULL;
      DECLARE @NumSemilavorati INT = NULL;
      DECLARE @NumCicliSemilavorati INT = NULL;

	  declare @IdD int = null
		declare @ItemCodeD nvarchar(50) = null
		declare @RevisionD nvarchar(20) = null

      SELECT
             @Id = MIN(pianoproduzioneid)
      FROM #dati;

      WHILE @Id IS NOT NULL
         BEGIN

            SELECT
                   @ItemCode = ItemCode
                 , @Revision = Revision
            FROM #dati
            WHERE pianoproduzioneid = @Id;


			INSERT INTO #Distinta (itemcode, revision)
            SELECT
                   ItemCode, Revision
            FROM [SBORONCADIN_TRAINING_20180508].[dbo].[RO_fnEsplosione](@ItemCode, @Revision) bom
            WHERE ProcurementMethod = 'M'

			--SELECT * FROM #Distinta d

			SET @IdD = NULL
			
			select @IdD = min(id) from #Distinta
			
			
			while @IdD is not null
			begin
				
				SELECT @ItemCodeD = Itemcode, @RevisionD = revision FROM #distinta WHERE id = @IdD
			
				SELECT
                   @NumCicliSemilavorati = COUNT(*) from
				(
				  SELECT DISTINCT
				         bom1.U_RtgCode
				  FROM  [SBORONCADIN_TRAINING_20180508].[dbo].[@CT_PF_OBOM] bom 
				       JOIN [SBORONCADIN_TRAINING_20180508].[dbo].[@CT_PF_BOM11] bom1 ON bom.code = bom1.code
				  WHERE bom.U_itemcode = @ItemcodeD AND bom.U_Revision = @RevisionD
				) a
			
			
			
				if(@NumCicliSemilavorati > 0)
				BEGIN
					select @IdD = min(id) from #Distinta WHERE id > @IdD
					SET @ItemCodeD = NULL
					SET @RevisionD= NULL
					SET @NumCicliSemilavorati = NULL
				END
				ELSE
				BEGIN
					SET @ItemCodeD = NULL
					SET @RevisionD= NULL
					SET @NumCicliSemilavorati = NULL
					UPDATE #dati SET
                    ProcessiOK = 0
                  WHERE
                        pianoproduzioneid = @Id;
					BREAK;
				END
			
                  UPDATE #dati SET
                    ProcessiOK = 1
                  WHERE
                        pianoproduzioneid = @Id;
               END;
			
			
            SELECT
                   @Id = MIN(pianoproduzioneid)
            FROM #dati
            WHERE pianoproduzioneid > @Id;

            SET @ItemCode = NULL;
            SET @Revision = NULL;
            SET @NumSemilavorati = NULL;
            SET @NumCicliSemilavorati = NULL;

			--SELECT * FROM #Distinta d

			DELETE FROM #Distinta

         END;

      SELECT
             *
      FROM #Dati d;

	  drop table #Distinta

   END;
