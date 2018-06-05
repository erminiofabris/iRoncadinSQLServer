

CREATE PROC [dbo].[RO_Portal_SP_ConfermaVolumiProduzioneDettaglioGet]
   @Data DATETIME,
   @ID   INT      = NULL
AS
      BEGIN

         DECLARE @DataN INT;

         SET @DataN = CONVERT(NVARCHAR(8), @Data, 112);

         SELECT
                *
         FROM
(
  SELECT
         ROW_NUMBER() OVER(ORDER BY codart
                                  , datmsg
                                  , oramsg
                                  , oper
                                  , palblc
                                  , lotto) AS ID
       , codart
	  , 'A' AS revision
       , datmsg
       , oramsg
       , oper
       , CASE
           WHEN oper = 'C'
           THEN qtaven
           ELSE qtaven * -1
         END AS qtaven
       , lotto
	  , numpal
       , palblc
	  , 'N' AS stato
	  , '0' AS deleted
	  --, -1 as turnoid
	  , ID AS AlcmanId
	  , replicate('0', 20 - len(codart)) + codart + replicate('0', 10 - len(oper)) + oper + replicate('0', 10 - len(palblc)) + palblc + replicate('0', 20 - len(lotto)) + lotto AS connection
  FROM [iSBO].[dbo].[ALCMAN_RICEVO_tbMessageMAGA] T0 --[iSBO].[dbo].[ALCMAN_RICEVO_vwMessageMAGA] T0
       INNER JOIN [iSBO].[dbo].[ACG_vwTranscodificaArticoli] T1 ON T0.CodArt COLLATE SQL_Latin1_General_CP850_CI_AS = T1.CodArtACG
  WHERE T0.Oper IN('C', 'S')
       AND T0.Causal IN('P', 'F')
  AND T0.NumCms = 'P' --per importare temporaneamente i messaggi da AS400
  AND T1.CLMER = 'P'
  AND ((oper = 'C'
        AND datart = @DataN)
       OR (oper = 'S'
           AND datmsg = @DataN))
) dati
         WHERE(@ID IS NULL
               OR (@ID IS NOT NULL
                   AND ID = @ID))
         ORDER BY
                  CodArt;
      END;

