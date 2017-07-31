-- ejemplo de un procedimiento de almacenado 
-- el cual muestra el primer apellido de el empleado
-- de la tabla employes de la base de datos hr
set serveroutput on

--un procedimiento almacenado es un bloque de codigo anonimo que tiene nombre
create or replace procedure primer_apellido is --nombre del procedimeinto
    v_apellido employees.last_name%type; --%type es usado para declarar una variable
begin                                    --con el mismo tipo del dato de la columna
    select last_name
    into v_apellido  --guardo el valor que devuelve la consulta 
    from EMPLOYEES
    where employee_id = 100;
    
    dbms_output.put_line(v_apellido);
    
    exception -- manejo de errores
        when others then
            dbms_output.put_line('Algo salio mal');
end; 
/

--ejecucion
BEGIN
  PRIMER_APELLIDO();
--rollback; 
END;

--select *
-- from EMPLOYEES


