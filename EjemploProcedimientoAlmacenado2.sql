--ejemplo 2 de procedimiento de almacenado con parametros
-- dar como parametro un numero entero que representa el codigo de la region
-- el procedimiento de almacenado mostrara el nombre de la region
set serveroutput on
                                            --parametro que el usuario dara, sera del mismo tipo region_id gracias al %type
create or replace procedure mostrar_region (codigo_region in regions.region_id%type) is
    v_nombre_region regions.region_name%type; --declaro una variable donde guardar el nombre de la region
begin --realizo la consulta
    select region_name
    into v_nombre_region  --guardo el nombre de la region
    from regions  
    where REGION_ID like codigo_region;
    
    dbms_output.put_line(v_nombre_region); --imprimo el resultado de la consulta
    
    exception  -- manejo de errores
        when others then
            dbms_output.put_line('Error algo salio mal');
end;
/


--ejecucion del procedimiento de almacenado
begin
    mostrar_region(1);
end;










--select *
--from regions
