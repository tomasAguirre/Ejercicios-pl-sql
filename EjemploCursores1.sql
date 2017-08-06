-- ejemplo de curso en un blogue anonimo
-- creo un cursos de la tabla regios de la base de datos hr
-- y cuento las filas del cursor

set SERVEROUTPUT ON

declare 
    cursor cur is 
        select REGION_ID,
               REGION_NAME 
        from REGIONS;
begin 
    -- para abrir el cursos usamos open nombre cursor
    if not cur%isopen then -- %isopen regresa true si el cursos esta abierto 
        open cur;
        dbms_output.put_line('cantidadn de filas del cursor ' || cur%ROWCOUNT);
        close cur; -- cerramos el cursor 
    end if;
end;
/
    