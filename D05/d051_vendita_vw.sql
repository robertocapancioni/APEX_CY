create or replace view d051_vendita_vw as
select v.id,
       v.cliente_id,
       c.cliente,
       c.zona,
       v.prodotto_id,
       p.prodotto,
       p.tipo_prodotto_id,
       tp.tipo_prodotto,
       v.data,
       v.quantita,
       v.quantita * p.prezzo_vendita valore
  from d051_vendita v
  join d051_cliente c on v.cliente_id = c.id
  join d051_prodotto p on v.prodotto_id = p.id
  join d051_tipo_prodotto tp on p.tipo_prodotto_id = tp.id;