set serveroutput on
declare
	v_sql varchar2(4000);
	v_id number := 1;
	v_empleado empleado%rowtype;
	d_cursor sys_refcursor;
begin
	v_sql := ' select empleado_id, nombre'
	||' from empleado where empleado_id = :ph_id';
--se abre un cursor dinámico, se recorre y se cierra
open d_cursor for v_sql using v_id;
loop
	fetch d_cursor into v_empleado;
	exit when d_cursor%notfound;
	dbms_output.put_line('id del empleado: '||v_empleado.empleado_id);
	dbms_output.put_line('Nombre del empleado: '||v_empleado.nombre);
end loop;
	close d_cursor;
end;
/
show errors 
