set serveroutput on 
declare
--declaración del cursor
cursor cur_datos_profesor is
	select p.nombre,p.apellido_paterno, p.apellido_materno,
	a.nombre, count(*) cursos
	from profesor p, curso c, asignatura a
	where p.profesor_id=c.profesor_id
	and c.asignatura_id = a.asignatura_id
	group by p.nombre,p.apellido_paterno,p.apellido_materno,a.nombre;
--declaración de variables
	v_nombre profesor.nombre%type;
	v_ap_pat profesor.apellido_paterno%type;
	v_ap_mat profesor.apellido_materno%type;
	v_asignatura asignatura.nombre%type;
	v_num_cursos number;
begin
	open cur_datos_profesor;
	dbms_output.put_line('resultados obtenidos');
	dbms_output.put_line('nombre apellido paterno apellido materno asignatura #cursos');
loop
	fetch cur_datos_profesor into
	v_nombre,v_ap_pat,v_ap_mat,v_asignatura,v_num_cursos;
	exit when cur_datos_profesor%notfound;
	dbms_output.put_line(v_nombre||' , '||v_ap_pat||' , '||v_ap_mat||' , '||v_asignatura||' , '||v_num_cursos);
end loop;
--Importante: Cerrar el cursor al terminar para liberar recursos.
close cur_datos_profesor;
end;
/

