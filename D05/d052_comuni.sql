-- drop objects
drop table d052_regione cascade constraints;
drop table d052_provincia cascade constraints;
drop table d052_comune cascade constraints;
drop table d052_anagrafica cascade constraints;
drop table d052_anagrafica2 cascade constraints;

-- create tables
create table d052_regione (
    id                             number generated by default on null as identity 
                                   constraint d052_regione_id_pk primary key,
    regione                        varchar2(30 char)
                                   constraint d052_regione_regione_unq unique not null
)
;

create table d052_provincia (
    id                             number generated by default on null as identity 
                                   constraint d052_provincia_id_pk primary key,
    regione_id                     number
                                   constraint d052_provincia_regione_id_fk
                                   references d052_regione not null,
    provincia                      varchar2(5 char)
                                   constraint d052_provincia_provincia_unq unique not null
)
;

-- table index
create index d052_provincia_i1 on d052_provincia (regione_id);

create table d052_comune (
    id                             number generated by default on null as identity 
                                   constraint d052_comune_id_pk primary key,
    provincia_id                   number
                                   constraint d052_comune_provincia_id_fk
                                   references d052_provincia not null,
    comune                         varchar2(50 char)
                                   constraint d052_comune_comune_unq unique not null
)
;

-- table index
create index d052_comune_i1 on d052_comune (provincia_id);

create table d052_anagrafica (
    id                             number generated by default on null as identity 
                                   constraint d052_anagrafica_id_pk primary key,
    comune_id                      number
                                   constraint d052_anagrafica_comune_id_fk
                                   references d052_comune,
    nome                           varchar2(50 char),
    cognome                        varchar2(50 char),
    indirizzo                      varchar2(50 char),
    cap                            varchar2(5 char),
    note                           varchar2(1000 char)
)
;

-- table index
create index d052_anagrafica_i1 on d052_anagrafica (comune_id);

create table d052_anagrafica2 (
    id                             number generated by default on null as identity 
                                   constraint d052_anagrafica2_id_pk primary key,
    nome                           varchar2(50 char),
    cognome                        varchar2(50 char),
    indirizzo                      varchar2(50 char),
    cap                            varchar2(5 char),
    comune                         varchar2(50 char),
    provincia                      varchar2(5 char),
    regione                        varchar2(30 char)
)
;

-- load data
 
-- Generated by Quick SQL Tuesday July 04, 2023  07:19:49
 
/*
regione 
  regione vc30 /nn /unique

provincia
  provincia vc5 /nn /unique
  regione_id /nn

comune
  comune vc50 /nn /unique
  provincia_id /nn

anagrafica
  nome vc50
  cognome vc50
  indirizzo vc50
  cap vc5
  comune_id
  note vc1000

anagrafica2
  nome vc50
  cognome vc50
  indirizzo vc50
  cap vc5
  comune vc50
  provincia vc5
  regione vc30

# settings = { prefix: "d052", onDelete: "RESTRICT", semantics: "CHAR", drop: true, language: "EN", APEX: true }
*/
