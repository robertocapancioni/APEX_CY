-- drop objects
drop table d07_tipo_documento cascade constraints;
drop table d07_documento cascade constraints;

-- create tables
create table d07_tipo_documento (
    id                             number generated by default on null as identity 
                                   constraint d07_tipo_documento_id_pk primary key,
    tipo_documento                 varchar2(20 char)
                                   constraint d07_tipo_docu_tipo_documen_unq unique not null
)
;

create table d07_documento (
    id                             number generated by default on null as identity 
                                   constraint d07_documento_id_pk primary key,
    tipo_documento_id              number
                                   constraint d07_documento_tipo_document_fk
                                   references d07_tipo_documento on delete cascade,
    codice                         varchar2(20 char)
                                   constraint d07_documento_codice_unq unique not null,
    data_documento                 date not null,
    firma_yn                       varchar2(1 char) default on null 'N' constraint d07_documento_firma_yn_ck
                                   check (firma_yn in ('Y','N')) not null,
    categoria                      varchar2(100 char)
)
;

-- table index
create index d07_documento_i1 on d07_documento (tipo_documento_id);

-- load data
 
insert into d07_tipo_documento (
    id,
    tipo_documento
) values (
    1,
    'TIPO UNO'
);

insert into d07_tipo_documento (
    id,
    tipo_documento
) values (
    2,
    'TIPO DUE'
);

insert into d07_tipo_documento (
    id,
    tipo_documento
) values (
    3,
    'TIPO TRE'
);

commit;

alter table d07_tipo_documento
modify id generated by default on null as identity restart start with 4;
 
-- load data
 
-- Generated by Quick SQL Martedì Agosto 29, 2023  08:51:16
 
/*
tipo documento /insert 3
  tipo documento vc20 /nn /values tipo uno, tipo due, tipo tre /unique
  documento
    codice vc20 /nn /unique
    data documento d /nn
    firma_yn /nn /default N
    categoria vc100

# settings = { prefix: "D07", semantics: "CHAR", drop: true, language: "EN", APEX: true }
*/
