







CREATE VIEW [dbo].[GPS_vwjItems]
AS
   SELECT
          CASE
            WHEN o.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(ItemCode)+'-'+RTRIM(idt1.U_Code)
            ELSE RTRIM(ItemCode)
          END AS code
        , ItemName AS [desc]
        , InvntryUom AS uOfM
        , CASE
            WHEN Phantom = 'Y'
            THEN '1'
            ELSE '0'
          END AS [type]
        , '0' AS iPol
        , '0' AS sCom
        , '0' AS lot
        , PrcrmntMtd AS supp
        , '0' AS clas
        , '0' AS fact
        , '0' AS ofwq
        , CardCode AS supC
	   , g.routingCode AS rout
        --, IF exists(SELECT TOP 1 * FROM dbo.GPS_vwjOperationsRoutings gvor WHERE gvor.routingCode = CASE
        --    WHEN o.ItmsGrpCod IN(106, 104, 103)
        --    THEN RTRIM(ItemCode)+'-'+RTRIM(idt1.U_Code)
        --    ELSE RTRIM(ItemCode)
        --  END) then '' else '' end  AS rout --- da rivedere
        , 'Y' AS impl
        , 'N' AS [tran]
        , 'Y' AS fptf
        , 999 AS avaP
        , 0 AS oraP
        , 0 AS uDel
        , 0 AS uDelR
        , CAST(0 as numeric(18,6)) AS scrp
        , '0' AS qAlg
        , '' AS calP
        , MinOrdrQty AS minQ
        , OrdrMulti AS mulQ
        , U_MaxOrdrQty AS maxQ
        , 0 AS covP
        , CAST(0 as numeric(18,6)) AS ordP
        , CAST(0 as numeric(18,6)) AS fixQ
        , CAST(0 as numeric(18,6)) AS levQ
        , LeadTime AS lead
        , 0 AS cOff
        , CAST(0 as numeric(18,6)) AS dssi
        , 0 AS dssw
        , CAST(0 as numeric(18,6)) AS ucts --Costo standard articolo
        , IWeight1 AS wght
        , cast(ItmsGrpCod AS varchar(30)) AS rag1
        , cast('' AS varchar(30)) AS rag2 ---- U_LineaProd
        , cast(Phantom AS varchar(30)) AS rag3
        , cast('' AS varchar(30)) AS rag4 --raggruppamento articoli
        , cast('' AS varchar(30)) AS rag5
        , cast('' AS varchar(30)) AS rag6
        , cast('' AS varchar(30)) AS rag7
        , cast('' AS varchar(30)) AS rag8 --diametro
        , cast('' AS varchar(30)) AS rag9
        , cast('N' AS varchar(30)) AS rag10
        , cast('' AS varchar(30)) AS cla1
        , cast('' AS varchar(30)) AS cla2 --note su produzione turni/date
        , cast('' AS varchar(30)) AS cla3
        , cast('' AS varchar(30)) AS cla4
        , cast('' AS varchar(30)) AS cla5
        , cast('' AS varchar(30)) AS cla6
        , cast('' AS varchar(30)) AS cla7
        , cast('' AS varchar(30)) AS cla8
        , cast('' AS varchar(30)) AS cla9 ---  U_Marchio
        , cast('' AS varchar(30)) AS cla10
        , cast(0 AS numeric(18,6)) AS val1
        , cast(0 AS numeric(18,6)) AS val2
        , cast(0 AS numeric(18,6)) AS val3
        , cast(0 AS numeric(18,6)) AS val4
        , cast(0 AS numeric(18,6)) AS val5
        , cast(0 AS numeric(18,6)) AS val6
        , cast(0 AS numeric(18,6)) AS val7
        , cast(0 AS numeric(18,6)) AS val8 --TSC
        , cast(0 AS numeric(18,6)) AS val9 --Rendimento
        , cast(0 AS numeric(18,6)) AS val10 --PzH effettivi
        , '' AS leavening
        , cast('' AS varchar(30)) AS mold --Martinetto
        , cast('' AS varchar(30)) AS prodLine --Linea prod. preferenziale
        , cast('' AS varchar(30)) AS packingLine --Imballatrice
        , '' AS withVegetables
        , '' AS withBakeInWoodStove
        , '' AS withAllergenics
        , cast((SELECT U_PrpConValue FROM 
				[Roncadin_Produzione].dbo.[@CT_PF_OBOM] cpo
				JOIN [Roncadin_Produzione].dbo.[@CT_PF_BOM11] cpb2 ON cpo.code = cpb2.code
				join [Roncadin_Produzione].dbo.[@CT_PF_BOM13] cpb ON cpb2.Code = cpb.code AND cpb.U_RtgCode = cpb2.U_RtgCode
				WHERE U_prpCode = 'NUMPERS'
				AND cpb2.U_IsDefault = 'Y'
				AND U_ItemCode = ItemCode) AS numeric(18,6)) AS peopleRequirement
        , 'N' AS excludeForecast
        , cast('' AS varchar(30)) AS dough
        , cast(0 AS numeric(18,6)) AS doughWght
        , cast(0 AS numeric(18,6)) AS doughTemp
        , cast('' AS varchar(30)) AS preOvenSauce
        , cast('' AS varchar(30)) AS afterOvenSauce
        , cast('' AS varchar(30)) AS moulding --Formatura
	   , 'N' AS assembl --inserire qui il valore che indica se il prodotto è un assemblato
   FROM dbo.OITM o
        INNER JOIN dbo.[@CT_PF_OIDT] oidt ON o.itemcode = oidt.U_ItemCode
        INNER JOIN dbo.[@CT_PF_IDT1] idt1 ON oidt.Code = idt1.Code
	   LEFT OUTER JOIN (SELECT DISTINCT routingCode FROM dbo.GPS_vwjOperationsRoutings gvor) g ON g.routingCode = CASE
            WHEN o.ItmsGrpCod IN(106, 104, 103)
            THEN RTRIM(ItemCode)+'-'+RTRIM(idt1.U_Code)
            ELSE RTRIM(ItemCode)
          END;








