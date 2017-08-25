-- Ejemplo cursor con parametros
-- cursor que de una consulta especifica dando como parametro el de trabajo
-- devolvera el maximo sueldo de ese trabajo 
set SERVEROUTPUT ON --linea para poder imprimir en pantalla 
declare 
cursor cur (titulo_trabajo varchar) is select * from jobs where job_title = titulo_trabajo; -- declaracion del cursor
cur_aux cur%rowtype; --cursor auxiliar   

begin
    open cur('Programmer');  --abrimos el cursor y pasamos por parametro el puesto de trabajo
    loop  -- iniciamos un bucle
        fetch cur into cur_aux; --guardamos el resultado de la consulta en el cursor auxiliar
        exit when cur%notfound;  --si el cursor no tiene mas informacion salimos del blucle
        dbms_output.put_line('El salario es : ' || cur_aux.max_salary); --imprimimos en pantalla
    end loop;
    
    exception --manejo de errores y excepciones
    when others then
        dbms_output.put_line('Algo salio mal');
        
    close cur; --cerramos el cursor 
end;
/
                
--select *
--from jobs