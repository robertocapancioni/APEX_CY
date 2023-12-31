alter table comune
modify id generated by default on null as identity restart start with 111111;

alter table provincia
modify id generated by default on null as identity restart start with 112;

alter table regione
modify id generated by default on null as identity restart start with 21;

create or replace view d052_comune_vw as
select c.id
      ,c.comune 
      ,c.provincia_id
      ,p.provincia
      ,p.regione_id
      ,r.regione
  from d052_comune c
  join d052_provincia p on c.provincia_id = p.id
  join d052_regione r on p.regione_id = r.id;

create or replace view d052_provincia_vw as
select p.id
      ,p.provincia
      ,p.regione_id
      ,r.regione
  from d052_provincia p 
  join d052_regione r on p.regione_id = r.id;