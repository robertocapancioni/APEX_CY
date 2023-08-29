
CREATE OR REPLACE FORCE EDITIONABLE VIEW "D07_APPUNTAMENTO_COLORE_VW"  AS 
  select 
 a.ID,
 a.DATA_INIZIO,
 a.DATA_FINE,
 a.DESCRIZIONE,
 a.TIPO_APPUNTAMENTO_ID,
 a.NOME_ID,
 ta.TIPO_APPUNTAMENTO,
 n.nome,
            case ta.TIPO_APPUNTAMENTO
          when 'Primo Appuntamento'  then 'apex-cal-red'
          when 'Altro Appuntamento'  then 'apex-cal-blue'
          when 'Ultimo Appuntamento' then 'apex-cal-green'
      end CLASSE_COLORE
 from d07_appuntamento a 
 join D07_TIPO_APPUNTAMENTO ta on a.tipo_appuntamento_id = ta.tipo_appuntamento_id
 join d07_nome n on a.nome_id = n.nome_id;

