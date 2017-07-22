-- usando la base de datos rh y la tabla countries
-- ejemplo que toma el primer registro de una tabla
-- y compara la nacionalidad para ver si es argentino.
set serverout on -- serverout on sirve para poder imprimir datos

declare     --declaracion de variables
    region varchar(20);
begin      --seleciono el primer elemento de la tabla countries
    select country_name into region     --con into guardamos dentro de la 
    from COUNTRIES                      -- variable region el country name
    where rownum = 1;     --rownum nos permite elegir el primer elemento de la tabla
    
    if region like 'Argentina' then     -- comparo si la region es de argentina
        dbms_output.put_line('es argentino');     --esta instrucion sirve para imprimir en consola
        else
        dbms_output.put_line('no es argentino');
    end if;     -- el if en pl/sql se cierra con punto y coma
    
exception     --- capturo alguna exepcion que se llegue a presentar
    when others then     -- con others puedo capturar la exepcion sin importar cual sea
        dbms_output.put_line('Algo salio mal'); 
end;
/ -- esta pleca invertida indica el final del bloque 

select *
from countries