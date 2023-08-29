select 
      a.ID,
      a.DATA_INIZIO,
      a.DATA_FINE,
      a.DESCRIZIONE,
      a.TIPO_APPUNTAMENTO_ID,
     ta.TIPO_APPUNTAMENTO, 
      a.NOME_ID,
      n.NOME
 from D07_APPUNTAMENTO a
 join D07_TIPO_APPUNTAMENTO ta
   on a.TIPO_APPUNTAMENTO_ID = ta.TIPO_APPUNTAMENTO_ID
 join D07_NOME n
   on a.NOME_ID = n.NOME_ID;


  CREATE OR REPLACE FORCE EDITIONABLE VIEW "D07_APPUNTAMENTO_VW"  AS 
  select 
 a.ID,
 a.DATA_INIZIO,
 a.DATA_FINE,
 a.DESCRIZIONE,
 a.TIPO_APPUNTAMENTO_ID,
 a.NOME_ID,
 ta.TIPO_APPUNTAMENTO,
 n.nome
 from d07_appuntamento a 
 join D07_TIPO_APPUNTAMENTO ta on a.tipo_appuntamento_id = ta.tipo_appuntamento_id
 join d07_nome n on a.nome_id = n.nome_id;

