create or replace PACKAGE d07_pkg is  

    function apex_error_handling (  
        p_error in apex_error.t_error )  
        return apex_error.t_error_result;  
      
end d07_pkg; 
/

create or replace PACKAGE BODY d07_pkg as   
    function apex_error_handling (  
        p_error in apex_error.t_error )  
        return apex_error.t_error_result  
    is  
        l_result          apex_error.t_error_result;  
        l_constraint_name varchar2(255);  
    begin  
        l_result := apex_error.init_error_result (  
                        p_error => p_error );  
 
        if p_error.is_internal_error then  
            null;
        else  
            l_result.display_location := case  
                                           when l_result.display_location = apex_error.c_on_error_page 
                                           then apex_error.c_inline_in_notification  
                                           else l_result.display_location  
                                         end;  
            --   -) ORA-00001: unique constraint violated  
            --   -) ORA-02091: transaction rolled back (-> can hide a deferred constraint)  
            --   -) ORA-02290: check constraint violated  
            --   -) ORA-02291: integrity constraint violated - parent key not found  
            --   -) ORA-02292: integrity constraint violated - child record found  
            if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292) then  
                l_constraint_name := apex_error.extract_constraint_name (  
                                         p_error => p_error );  
                begin  

---------------------------------- INIZIO CODICE DA PERSONALIZZARE --------------------------
                    
                    select message  
                      into l_result.message  
                      from d07_error_lookup  
                     where constraint_name = l_constraint_name;  

---------------------------------- FINE CODICE DA PERSONALIZZARE --------------------------

                exception when no_data_found then null; -- not every constraint has to be in our lookup table  
                end;  
            end if;  

            if p_error.ora_sqlcode is not null and l_result.message = p_error.message then  
                l_result.message := apex_error.get_first_ora_error_text (  
                                        p_error => p_error );  
            end if;  
            if l_result.page_item_name is null and l_result.column_alias is null then  
                apex_error.auto_set_associated_item (  
                    p_error        => p_error,  
                    p_error_result => l_result );  
            end if;  
        end if;  
        return l_result;  
    end apex_error_handling;  
        
end d07_pkg;  
/
