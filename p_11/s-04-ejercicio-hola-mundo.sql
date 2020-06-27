--@Autores: Rivera Pérez Blanca Estela
--			Salgado Fernández Pamela
--@Fecha creación: 13/05/2018
--@Descripción: script HolaMundo

--s-04-ejercicio-hola-mundo.sql  


set serveroutput on 

declare 
	v_usuario varchar2(20) := sys_context('USERENV', 'CURRENT_USER');
	v_fecha varchar2 (25) := to_char(sysdate, 'dd/mm/yyyy hh:mi:ss');

begin 
	dbms_output.put_line ('Hola Mundo, saludando con el usuario ' || v_usuario);
	dbms_output.put_line ('Fecha: '|| v_fecha );

end;
/
