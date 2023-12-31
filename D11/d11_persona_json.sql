drop table drop table d11_persona;

create table d11_persona (
    id   integer not null primary key,
    persona clob not null check (persona is json)
);


insert into d11_persona 
  values ( 1, '{"id":1,
                                         "nome":"Giovanni",
                                         "cognome":"Rossi",
                                         "indirizzo": {"via":"Viale della Vittoria",
                                                     "citta":"Roma",
                                                     "cap":"00100",
                                                     "provincia":"MI",
                                                     "telefono":null
                                                    
                                                    }
                                        }' );
insert into d11_persona 
  values ( 2, '{"id":2,
                                         "nome":"Maria",
                                         "cognome":"Verdi",
                                         "indirizzo": {"via":"Viale dei Giardini",
                                                     "citta":"Milano",
                                                     "cap":"20100",
                                                     "provincia":"MI",
                                                     "telefono":null
                                                    
                                                    }
                                        }' );


select * from d11_persona

update d11_persona
set    persona = 
'{
 "id":1,
 "nome":"Giovanni",
 "cognome":"Rossi",
 "indirizzo": {"via":"Viale della Vittoria",
			 "citta":"Roma",
			 "cap":"00100",
			 "provincia":"RM",
			 "telefono":"06 333 333"
			
			}
}'
 where  id = 1;

select * from d11_persona


update d11_persona
set    persona = json_mergepatch ( 
         persona,
         '{"cognome":"Bianchi",
           "indirizzo" : {"telefono":"06 444 444"}
          }'
       )
where  id = 2;

select * from d11_persona


update d11_persona
set    persona = json_mergepatch ( 
         persona,
         '{"titolo":"Sig.ra"}'
       )
where  id = 2;

select * from d11_persona


update d11_persona  
set    persona = json_transform (
  persona, 
  replace '$.indirizzo.telefono' = '06 999 999'
)
where  id = 2;

select * from d11_persona

/*
funzioni json_transform:
REMOVE  
KEEP    
RENAME  
SET     
REPLACE 
INSERT  
APPEND  
https://docs.oracle.com/en/database/oracle/oracle-database/21/adjsn/oracle-sql-function-json_transform.html
*/

update d11_persona  
set    persona = json_transform (
  persona, 
  set '$.indirizzo.nazione' = 'IT'
)
where  id = 2;

select * from d11_persona


select p.persona.nome,
       p.persona.cognome
from d11_persona p;

select p.persona.titolo,
       p.persona.nome,
       p.persona.cognome,
       p.persona.indirizzo.via via,
       p.persona.indirizzo.citta citta,
       p.persona.indirizzo.cap cap,
       p.persona.indirizzo.provincia provincia,
       p.persona.indirizzo.telefono telefono,
       p.persona.indirizzo.nazione nazione
from d11_persona p;

select json_value (persona,'$.titolo' returning varchar2) titolo,
       json_value (persona,'$.nome' returning varchar2) nome,
       json_value (persona,'$.cognome' returning varchar2) cognome,
       json_value (persona,'$.indirizzo.via' returning varchar2) via,
       json_value (persona,'$.indirizzo.citta' returning varchar2) citta
from   d11_persona p;

create table d11_persona (
    id   integer not null primary key,
    persona clob not null check (persona is json)
);


insert into d11_persona 
  values ( 1, '{"id":1,
                                         "nome":"Giovanni",
                                         "cognome":"Rossi",
                                         "indirizzo": {"via":"Viale della Vittoria",
                                                     "citta":"Roma",
                                                     "cap":"00100",
                                                     "provincia":"MI",
                                                     "telefono":null
                                                    
                                                    }
                                        }' );
insert into d11_persona 
  values ( 2, '{"id":2,
                                         "nome":"Maria",
                                         "cognome":"Verdi",
                                         "indirizzo": {"via":"Viale dei Giardini",
                                                     "citta":"Milano",
                                                     "cap":"20100",
                                                     "provincia":"MI",
                                                     "telefono":null
                                                    
                                                    }
                                        }' );


select * from d11_persona

update d11_persona
set    persona = 
'{
 "id":1,
 "nome":"Giovanni",
 "cognome":"Rossi",
 "indirizzo": {"via":"Viale della Vittoria",
			 "citta":"Roma",
			 "cap":"00100",
			 "provincia":"RM",
			 "telefono":"06 333 333"
			
			}
}'
 where  id = 1;

select * from d11_persona


update d11_persona
set    persona = json_mergepatch ( 
         persona,
         '{"cognome":"Bianchi",
           "indirizzo" : {"telefono":"06 444 444"}
          }'
       )
where  id = 2;

select * from d11_persona


update d11_persona
set    persona = json_mergepatch ( 
         persona,
         '{"titolo":"Sig.ra"}'
       )
where  id = 2;

select * from d11_persona


update d11_persona  
set    persona = json_transform (
  persona, 
  replace '$.indirizzo.telefono' = '06 999 999'
)
where  id = 2;

select * from d11_persona

/*
funzioni json_transform:
REMOVE  
KEEP    
RENAME  
SET     
REPLACE 
INSERT  
APPEND  
https://docs.oracle.com/en/database/oracle/oracle-database/21/adjsn/oracle-sql-function-json_transform.html
*/

update d11_persona  
set    persona = json_transform (
  persona, 
  set '$.indirizzo.nazione' = 'IT'
)
where  id = 2;

select * from d11_persona


select p.persona.nome,
       p.persona.cognome
from d11_persona p;

select p.persona.titolo,
       p.persona.nome,
       p.persona.cognome,
       p.persona.indirizzo.via via,
       p.persona.indirizzo.citta citta,
       p.persona.indirizzo.cap cap,
       p.persona.indirizzo.provincia provincia,
       p.persona.indirizzo.telefono telefono,
       p.persona.indirizzo.nazione nazione
from d11_persona p;

select json_value (persona,'$.titolo' returning varchar2) titolo,
       json_value (persona,'$.nome' returning varchar2) nome,
       json_value (persona,'$.cognome' returning varchar2) cognome,
       json_value (persona,'$.indirizzo.via' returning varchar2) via,
       json_value (persona,'$.indirizzo.citta' returning varchar2) citta
from   d11_persona p
