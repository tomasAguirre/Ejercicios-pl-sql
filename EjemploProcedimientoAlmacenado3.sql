-- usando la base de datos hr y la tabla regions
-- procedimiento de almacenado que inserta un id y region dentro de la tabla
-- regions el procedimiento verifica que el id sea el siguiente numero
-- al ultimo id ingresado
set serveroutput on

create or replace procedure insertar_region(id_region regions.region_id%type, nombre_region regions.region_name%type) is
    id int; -- en un procedimiento de almacenado no tiene que colocar el declare para declarar las variables
begin 
    select region_id  --seleciono el mayor id 
    into id  -- lo guardamos en la variable
    from regions 
    where region_id = (select max(region_id) --hacemos una sub query
                    from regions);
                    
    -- validamos que el id que se desea ingresar sea siguiente al ultimo                 
    if (id_region != id + 1) then
        dbms_output.put_line('el id no es correcto tiene que ser mayor al ultimo id de la tabla');
    else
        insert into regions(region_id,region_name) --insertamos
            values(id_region, nombre_region);
        dbms_output.put_line('se inserto correctamente los datos');   
    end if;
    
    exception  -- manejo de errores
    when others then
    dbms_output.put_line('Error algo salio mal');
end;
/

select *
from regions

--ejecucion
begin
    insertar_region(6,'prueba2');
end;