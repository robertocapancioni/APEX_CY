create or replace view d051_acquisto_vw as
select a.id,
       a.fornitore_id,
       f.fornitore,
       f.zona,  
       a.prodotto_id,
       p.prodotto,
       p.tipo_prodotto_id,
       tp.tipo_prodotto,
       a.data,
       a.quantita,
       a.quantita * p.prezzo_acquisto valore
  from d051_acquisto a
  join d051_fornitore f      on a.fornitore_id     = f.id
  join d051_prodotto p       on a.prodotto_id      = p.id
  join d051_tipo_prodotto tp on p.tipo_prodotto_id = tp.id