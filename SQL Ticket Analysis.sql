--- Analysis on the management of tickets opened by the customer on the ERP system.
--- Intervention and ticket closing times are analyzed through the creation of KPIs. 
--- This project shows the architectural part: creation of tables and views in SQL.

---- create table FS_alt_ambito, it includes commessa value

CREATE TABLE [stg].[FS_alt_ambito]
(
 [alt_ambitoid]			        NVARCHAR(4000)
,[alt_name]				NVARCHAR(4000)
,[alt_integrationkeybc]	                NVARCHAR(4000)
,[_alt_responsabilecommessaid_value] 	NVARCHAR(4000)
,[_alt_areaid_value] 	                NVARCHAR(4000)
,[_alt_areatecnicaid_value] 	        NVARCHAR(4000)
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN)


---create table FS_incidents, this is our fact table with all tickets

CREATE TABLE [stg].[FS_incidents]
(
        [ticketnumber] [nvarchar](4000) NULL,
	[title] [nvarchar](4000) NULL,
	[_alt_ambitoid_value] [nvarchar](4000) NULL,
	[_alt_categoriaticketutenteid_value] [nvarchar](4000) NULL,
	[alt_costantepercommessa] [decimal](32, 6) NULL,
	[alt_canonedisponibilita] [decimal](32, 6) NULL,
	[alt_hc] [decimal](32, 6) NULL,
	[alt_hl] [decimal](32, 6) NULL,
	[alt_pserv] [decimal](32, 6) NULL,
	[alt_coeffarea_calc] [decimal](32, 6) NULL,
	[alt_coeffapp] [decimal](32, 6) NULL,
	[alt_criticitaareacalc] [decimal](32, 6) NULL,
	[alt_criticitacespitecalc] [decimal](32, 6) NULL,
	[statuscode] [nvarchar](4000) NULL,
	[alt_slainterventoore] [decimal](32, 6) NULL,
	[alt_unitaslaore] [decimal](32, 6) NULL,
	[alt_coeffhrh] [decimal](32, 6) NULL,
	[alt_coeffhrm] [decimal](32, 6) NULL,
	[alt_coeffhrl] [decimal](32, 6) NULL,
	[_alt_prioritaid_value] [nvarchar](4000) NULL,
	[createdon] [datetimeoffset](7) NULL,
	[alt_dataprimointerventoperkpi] [datetimeoffset](7) NULL,
	[alt_dataprevistadiconsegnalavori] [datetimeoffset](7) NULL,
	[alt_datarisoluzioneperkpi] [datetimeoffset](7) NULL,
	[alt_extracanonecode] [nvarchar](4000) NULL,
	[alt_tipodifatturazionecode] [nvarchar](4000) NULL,
	[alt_importopreventivo] [decimal](32, 6) NULL,
	[alt_escluderekpicategoriaticket] [nvarchar](4000) NULL,
	[alt_motivoesclusionekpicategoria] [nvarchar](4000) NULL,
	[alt_escluderekpitemposopralluogo] [nvarchar](4000) NULL,
	[alt_motivoesclusionekpitemposopralluogo] [nvarchar](4000) NULL,
	[alt_escluderekpitemporisoluzione] [nvarchar](4000) NULL,
	[alt_motivoesclusionekpitemporisoluzione] [nvarchar](4000) NULL,
	[alt_notemotivoesclusionekpi] [nvarchar](4000) NULL,
	[alt_nrascensori] [int] NULL,
	[alt_superficieindisponibilita] [decimal](32, 6) NULL,
	[_alt_companyid_value] [nvarchar](4000) NULL,
	[alt_recordurl] [nvarchar](4000) NULL,
	[alt_slarisoluzione] [decimal](32, 6) NULL,
	[alt_unitaslarisoluzione] [decimal](32, 6) NULL,
	[alt_datadipresaincarico] [datetimeoffset](7) NULL,
	[alt_datadiprimointervento] [datetimeoffset](7) NULL,
	[alt_datadirisoluzione] [datetimeoffset](7) NULL,
	[alt_dataultimamodificadate] [datetimeoffset](7) NULL,
	[alt_dataultimosollecito] [datetimeoffset](7) NULL,
	[alt_issollecito] [nvarchar](4000) NULL,
	[alt_nrrichiesta] [nvarchar](4000) NULL,
	[alt_numeroticketbc] [nvarchar](4000) NULL,
	[alt_penaliattivate] [nvarchar](4000) NULL,
	[alt_statolavorazione] [nvarchar](4000) NULL,
	[_alt_taskdicommessaid_value] [nvarchar](4000) NULL,
	[alt_tipointerventocode] [nvarchar](4000) NULL,
	[alt_ultimoapprovatore] [nvarchar](4000) NULL,
	[_alt_utentepresaincarico_value] [nvarchar](4000) NULL,
	[caseorigincode] [nvarchar](4000) NULL,
	[_createdby_value] [nvarchar](4000) NULL,
	[modifiedon] [datetimeoffset](7) NULL,
	[_msdyn_incidenttype_value] [nvarchar](4000) NULL,
	[_owningteam_value] [nvarchar](4000) NULL,
	[_owninguser_value] [nvarchar](4000) NULL,
	[resolveby] [nvarchar](4000) NULL,
	[alt_altrorichiedente] [nvarchar](4000) NULL,
	[alt_creatofuoricrmcode] [nvarchar](4000) NULL,
	[alt_bccentro] [nvarchar](4000) NULL,
	[alt_bcmanagerprogetto] [nvarchar](4000) NULL,
	[alt_bctecnicoresponsabile] [nvarchar](4000) NULL,
	[alt_bctipoedificio] [nvarchar](4000) NULL,
	[alt_modificatodaalm] [nvarchar](4000) NULL,
	[alt_notemodificaalm] [nvarchar](4000) NULL,
	[alt_tipooperazionealm] [nvarchar](4000) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)


--- create table FS_alt_programmabilitas
CREATE TABLE [stg].[FS_alt_programmabilitas]
(
	[alt_programmabilitaid] [nvarchar](4000) NULL,
	[alt_name] [nvarchar](4000) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)


---create table FS_alt_categoria tickts

CREATE TABLE [stg].[FS_alt_categoriatickets]
(
	[alt_categoriaticketid] [nvarchar](4000) NULL,
	[alt_name] [nvarchar](4000) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)


--- create table FS_alt_company


CREATE TABLE [stg].[FS_alt_company]
(
 [alt_companyid]	NVARCHAR(4000)
,[alt_name]	        NVARCHAR(4000)
,[alt_codice]		NVARCHAR(4000)
)
WITH (HEAP, DISTRIBUTION = ROUND_ROBIN)

--- create the view for the analysis. Use cte in order to select Date fields to calculate KPI's.

CREATE VIEW [dwh_v].[incidents]
AS
WITH cte
AS (
   SELECT *
        , [createdon] AT TIME ZONE 'Central European Standard Time'                        AS [Data Creazione]
        , CASE
              WHEN [alt_dataprimointerventoperkpi] IS NULL THEN
                  GETDATE() AT TIME ZONE 'Central European Standard Time'
              ELSE
                  [alt_dataprimointerventoperkpi] AT TIME ZONE 'Central European Standard Time'
          END                                                                              AS [Data PrimoSopralluogo]
        , [alt_dataprevistadiconsegnalavori] AT TIME ZONE 'Central European Standard Time' AS [Data PrevistaConsegnaLavori]
        , CASE
              WHEN [alt_datarisoluzioneperkpi] IS NULL THEN
                  GETDATE() AT TIME ZONE 'Central European Standard Time'
              ELSE
                  [alt_datarisoluzioneperkpi] AT TIME ZONE 'Central European Standard Time'
          END                                                                              AS [Data ChiusuraEffettiva]
        , CASE
              WHEN [alt_slainterventoore] IS NULL THEN
                  0
              ELSE
                  [alt_slainterventoore]
          END                                                                              AS [SLA]
        , CASE
              WHEN [alt_unitaslaore] IS NULL THEN
                  0
              ELSE
                  [alt_unitaslaore]
          END                                                                              AS [Unita SLA]
        , CASE
              WHEN [alt_slarisoluzione] IS NULL THEN
                  0
              ELSE
                  [alt_slarisoluzione]
          END                                                                              AS [SLA Risoluzione]
        , CASE
              WHEN [alt_unitaslarisoluzione] IS NULL THEN
                  0
              ELSE
                  [alt_unitaslarisoluzione]
          END                                                                              AS [Unita SLA Risoluzione]
        , CASE
              WHEN [alt_dataprimointerventoperkpi] IS NULL THEN
                  'Today'
              ELSE
                  'Ok'
          END                                                                              AS [Check Data PrimoSopralluogo]
        , CASE
              WHEN [alt_datarisoluzioneperkpi] IS NULL THEN
                  'Today'
              ELSE
                  'Ok'
          END                                                                              AS [Check Data Risoluzione]
   FROM [stg].[FS_incidents]
   )
SELECT [ticketnumber]                                                        AS [Numero Ticket]
     , [title]                                                               AS [Titolo Ticket]
     , a.[alt_integrationkeybc]                                              AS [Commessa]
     , ct.[alt_name]                                                         AS [Categoria Ticket]
     , ct.alt_categoriaticketid                                              AS [Categoria Ticket ID]
     , [alt_costantepercommessa]                                             AS [KP]
     , [alt_canonedisponibilita]                                             AS [Cse]
     , [alt_hc]                                                              AS [HC]
     , [alt_hl]                                                              AS [HL]
     , [alt_pserv]                                                           AS [Percentuale di Servizio]
     , [alt_coeffarea_calc]                                                  AS [Coefficiente Area]
     , [alt_coeffapp]                                                        AS [Coefficiente App]
     , [alt_criticitaareacalc]                                               AS [Criticita Area]
     , [alt_criticitacespitecalc]                                            AS [Criticita Cespite]
     , [statuscode]                                                          AS [Stato Ticket]
     , [SLA]
     , [Unita SLA]
     , [alt_coeffhrh]                                                        AS [Coefficiente hrh]
     , [alt_coeffhrm]                                                        AS [Coefficiente hrm]
     , [alt_coeffhrl]                                                        AS [Coefficiente hrl]
     , p.[alt_name]                                                          AS [Priorita]
     , [Data Creazione]
     , [Data PrimoSopralluogo]
     , [Data PrevistaConsegnaLavori]
     , [Data ChiusuraEffettiva]
     , [alt_extracanonecode]                                                 AS [Extracanone]
     , [alt_tipodifatturazionecode]                                          AS [Tipo Fatturazione]
     , [alt_importopreventivo]                                               AS [Importo Preventivo]
     , [alt_escluderekpicategoriaticket]                                     AS [Escludi KPI per Categoria]
     , [alt_motivoesclusionekpicategoria]                                    AS [Motivo Esclusione KPI per Categoria]
     , [alt_escluderekpitemposopralluogo]                                    AS [Escludi KPI per TempoSopralluogo]
     , [alt_motivoesclusionekpitemposopralluogo]                             AS [Motivo Esclusione KPI per TempoSopralluogo]
     , [alt_escluderekpitemporisoluzione]                                    AS [Escludi KPI per TempoRisoluzione]
     , [alt_motivoesclusionekpitemporisoluzione]                             AS [Motivo Esclusione KPI per TempoRisoluzione]
     , [alt_notemotivoesclusionekpi]                                         AS [Note Motivo Esclusione DecurtazionePenale]
     , [alt_nrascensori]                                                     AS [Numero Ascensori]
     , [alt_superficieindisponibilita]                                       AS [Superficie Indisponibilita]
     , c.[alt_name]                                                          AS [Company]
     , [alt_recordurl]                                                       AS [Link Ticket]
     , [SLA Risoluzione]
     , [Unita SLA Risoluzione]
     , [Check Data PrimoSopralluogo]
     , [Check Data Risoluzione]
     , CASE
           WHEN DATEDIFF(hh, [Data Creazione], [Data PrimoSopralluogo]) > [SLA] THEN
               'True'
           ELSE
               'False'
       END                                                                   AS [Flag_Sopralluogo]
     , CASE
           WHEN DATEDIFF(hh, [Data Creazione], [Data ChiusuraEffettiva]) > [SLA Risoluzione] THEN
               'True'
           ELSE
               'False'
       END                                                                   AS [Flag_Risoluzione]
     , CASE
           WHEN [Data ChiusuraEffettiva] > [Data PrevistaConsegnaLavori] THEN
               'True'
           ELSE
               'False'
       END                                                                   AS [Flag_Extracanone]
     , CASE
           WHEN i._alt_categoriaticketutenteid_value = '29051be7-c766-ee11-9ae7-000d3abd8e09' THEN
               'P3 KPI Raffrescamento'
           WHEN i._alt_categoriaticketutenteid_value = 'e86717db-c766-ee11-9ae7-000d3abd8e09' THEN
               'P6 KPI Ascensori'
           WHEN i._alt_categoriaticketutenteid_value = 'f3c0964c-c866-ee11-9ae7-000d3abd8e09' THEN
               'P2 KPI ACS'
           WHEN i._alt_categoriaticketutenteid_value = 'a583cd6d-c866-ee11-9ae7-000d3abd8e09' THEN
               'P2 KPI VAP'
           WHEN i._alt_categoriaticketutenteid_value = 'e3d7d2fa-c766-ee11-9ae7-000d3abd8e09' THEN
               'P2 KPI Risc'
           WHEN i._alt_categoriaticketutenteid_value = '324d7b40-c866-ee11-9ae7-000d3abd8e09' THEN
               'P4 KPI Elettrico'
           WHEN i._alt_categoriaticketutenteid_value = '5eb05bc1-c766-ee11-9ae7-000d3abd8e09' THEN
               'P5 KPI Antincendio'
       END                                                                   AS [Nome KPI Categoria]
     , DATEDIFF(hh, [Data Creazione], [Data PrimoSopralluogo])               AS [Delta Ore PrimoSopralluogo]
     , DATEDIFF(hh, [Data Creazione], [Data ChiusuraEffettiva])              AS [Delta Ore ChiusuraEffettiva]
     , DATEDIFF(dd, [Data PrevistaConsegnaLavori], [Data ChiusuraEffettiva]) AS [Delta Giorni Extracanone]
     , CASE
           WHEN i._alt_categoriaticketutenteid_value = '29051be7-c766-ee11-9ae7-000d3abd8e09' THEN
               'Disponibilita del servizio di climatizzazione estiva presso le utenze ospedaliere'
           WHEN i._alt_categoriaticketutenteid_value = 'e86717db-c766-ee11-9ae7-000d3abd8e09' THEN
               'Disponibilita degli impianti di sollevamento verticale'
           WHEN i._alt_categoriaticketutenteid_value = 'f3c0964c-c866-ee11-9ae7-000d3abd8e09' THEN
               'Disponibilita del servizio di produzione dell ACS presso le utenze ospedaliere'
           WHEN i._alt_categoriaticketutenteid_value = 'a583cd6d-c866-ee11-9ae7-000d3abd8e09' THEN
               'Disponibilita del servizio di produzione del Vapore presso le utenze ospedaliere'
           WHEN i._alt_categoriaticketutenteid_value = 'e3d7d2fa-c766-ee11-9ae7-000d3abd8e09' THEN
               'Disponibilita del servizio di climatizzazione invernale presso le utenze ospedaliere'
           WHEN i._alt_categoriaticketutenteid_value = '324d7b40-c866-ee11-9ae7-000d3abd8e09' THEN
               'Disponibilita del servizio di erogazione dell energia elettrica presso le utenze ospedaliere'
           WHEN i._alt_categoriaticketutenteid_value = '5eb05bc1-c766-ee11-9ae7-000d3abd8e09' THEN
               'Disponibilita degli impianti e presidi antincendio'
       END                                                                   AS [Descrizione Categoria]
     , CASE
           WHEN [alt_escluderekpitemposopralluogo] = 'false' THEN
     (CASE
          WHEN p.[alt_name] = '3: Nessuna emergenza' THEN
              'P16 KPI Intervento (Non Urgente)'
          WHEN p.[alt_name] = '2: Urgente' THEN
              'P17 KPI Intervento (Urgenza)'
          WHEN p.[alt_name] = '1: Emergenza grave' THEN
              'P17 KPI Intervento (Emergenza)'
      END
     )
       END                                                                   AS [Descrizione Sopralluogo]
     , CASE
           WHEN [alt_escluderekpitemporisoluzione] = 'false' THEN
     (CASE
          WHEN p.[alt_name] = '3: Nessuna emergenza' THEN
              'P18 KPI Risoluzione (Non Urgente)'
          WHEN p.[alt_name] = '2: Urgente' THEN
              'P19 KPI Risoluzione (Urgenza)'
          WHEN p.[alt_name] = '1: Emergenza grave' THEN
              'P19 KPI Risoluzione (Emergenza)'
      END
     )
       END                                                                   AS [Descrizione Risoluzione]
     , CONVERT(date, [Data Creazione])                                       AS [Date]
FROM cte                                  i
    LEFT JOIN stg.FS_alt_ambito           a
        ON i._alt_ambitoid_value = a.alt_ambitoid
    LEFT JOIN stg.FS_alt_categoriatickets ct
        ON i._alt_categoriaticketutenteid_value = ct.alt_categoriaticketid
    LEFT JOIN stg.FS_alt_company          c
        ON i._alt_companyid_value = c.alt_companyid
    LEFT JOIN stg.FS_alt_programmabilitas p
        ON i._alt_prioritaid_value = p.alt_programmabilitaid
WHERE a.[alt_integrationkeybc] = 'ARM22042'
