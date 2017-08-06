-- ejemplo de cursor usando la tabla hr y la base de datos regions
-- copio la tabla dentro de un cursor y lo recorro verificando
-- cuales regiones poseen un id par 
set SERVEROUTPUT ON
declare 
    cursor curs is  --es nesesario especificar los campos del select para el cursor
        select REGION_ID,
                REGION_NAME
        from regions;
begin
-- dentro de un bucle loop no es nesesario abrir o cerrar el cursor
    for var in curs loop
        if mod(var.region_id,2) = 0 then --verifico con el modulo si es id par
            dbms_output.put_line('la region es una region : '|| var.region_name ||' es region par');
        end if;
    end loop;
end;
/