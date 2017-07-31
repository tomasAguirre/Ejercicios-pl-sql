-- ejemplo de un procedimiento de almacenado 
-- el cual muestra el primer apellido de el empleado
-- de la tabla employes de la base de datos hr
set serveroutput on

create or replace procedure primer_apellido is
    v_apellido employees.last_name%type;
begin
    select last_name
    into v_apellido
    from EMPLOYEES
    where employee_id = 100;
    
    dbms_output.put_line(v_apellido);
    
    exception
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


