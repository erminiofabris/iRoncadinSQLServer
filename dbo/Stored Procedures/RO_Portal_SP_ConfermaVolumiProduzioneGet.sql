

CREATE PROC [dbo].[RO_Portal_SP_ConfermaVolumiProduzioneGet]
   @Data DATETIME
AS
      BEGIN

         DECLARE @DataN INT;
		 DECLARE @DataNFine INT;

         SET @DataN = CONVERT(NVARCHAR(8), @Data, 112);
		 SET @DataNFine = CONVERT(NVARCHAR(8), DateADd(day,1,@Data), 112);

         IF NOT EXISTS
		  (
		    SELECT TOP 1
		           *
		    FROM RO_Portal_ConfermaVolumiProduzione
		    WHERE ConfermaData = @Data
		  )
            BEGIN
               SELECT
                      CAST(ROW_NUMBER() OVER(ORDER BY codart
                                                    , oper
                                                    , palblc
                                                    , lotto) AS INT) AS ID
				, @data AS [data]
                    , codart
				, 'A' AS revision
                    , oper
                    , SUM(CASE
                            WHEN oper = 'C'
                            THEN qtaven
                            ELSE qtaven * -1
                          END) AS qtaven
                    , COUNT(*) AS npalette
                    , lotto
                    , palblc
                    , t3.Descrizione AS turno
				, t3.pianoproduzioneturnoid AS turnoid
				, t4.pianoproduzionelineaid as lineaid
				, t4.descrizione as linea
                    , Coalesce(t2.DocEntryOP, -1) AS DocEntryOP
                    , 'N' AS stato
                    , '0' AS deleted
                    , REPLICATE('0', 20-LEN(codart))+codart+REPLICATE('0', 10-LEN(oper))+oper+REPLICATE('0', 10-LEN(palblc))+palblc+REPLICATE('0', 20-LEN(lotto))+lotto AS connection
               FROM [iSBO].[dbo].[ALCMAN_RICEVO_tbMessageMAGA] T0 --[iSBO].[dbo].[ALCMAN_RICEVO_vwMessageMAGA] T0
                    INNER JOIN [iSBO].[dbo].[ACG_vwTranscodificaArticoli] T1 ON T0.CodArt COLLATE SQL_Latin1_General_CP850_CI_AS = T1.CodArtACG
                    LEFT OUTER JOIN [dbo].RO_portal_pianoproduzione T2 ON t2.ItemCode = t0.codart COLLATE SQL_Latin1_General_CP850_CI_AS
                                                                                 AND dataproduzione = @Data--convert(nvarchar(8), dataproduzione, 112) = t0.datmsg
                    LEFT OUTER JOIN [dbo].RO_portal_pianoproduzioneturni T3 ON t2.Pianoproduzioneturnoid = t3.pianoproduzioneturnoid
				left outer join [dbo].RO_Portal_pianoproduzionelinee T4 on t2.pianoproduzionelineaid = t4.Pianoproduzionelineaid
               WHERE T0.Oper IN('C', 'S')
                    AND T0.Causal IN('P', 'F')
               AND T0.NumCms = 'P' --per importare temporaneamente i messaggi da AS400
               AND T1.CLMER = 'P'
			   and ((datmsg = @DataN and oramsg > 050000)
					or (datmsg = @DataNFine and oramsg < 050000))
               --AND ((oper = 'C'
               --      AND datart = @DataN)
               --     OR (oper = 'S'
               --         AND datmsg = @DataN))
               GROUP BY
                        codart
                      , oper
                      , palblc
                      , lotto
                      , t2.DocEntryOP
                      , t3.Descrizione
				  , t3.pianoproduzioneturnoid
				  , t4.pianoproduzionelineaid
				, t4.descrizione
               ORDER BY
                        CodArt;
            END;
           ELSE
            BEGIN

               SELECT
                      ConfermaVolumiProduzioneId AS ID
                    , ConfermaData AS [data]
                    , ConfermaTurnoId AS turnoid
                    , t1.Descrizione AS turno
				, confermalineaid AS lineaid
				, t2.descrizione AS linea
                    , ConfermaItemCode AS codart
                    , ConfermaRevision AS revision
                    , ConfermaVerso AS oper
                    , ConfermaQuantita AS qtaven
                    , ConfermaPalette AS npalette
                    , ConfermaLotto AS lotto
                    , ConfermaCodicePaletta AS palblc
                    , Coalesce(ConfermaDocNumOP, -1) AS DocEntryOP
                    , 'A' AS stato
                    , '0' AS deleted
               FROM RO_Portal_ConfermaVolumiProduzione T0
                    LEFT OUTER JOIN [dbo].RO_portal_pianoproduzioneturni T1 ON t0.ConfermaTurnoId = t1.pianoproduzioneturnoid
				LEFT OUTER JOIN dbo.ro_portal_pianoproduzionelinee t2 ON T0.confermalineaid = t2.PianoProduzioneLineaId
               WHERE confermadata = @Data
			Order by ConfermaItemCode
            END;
      END;


