set serveroutput on 
declare 

	--declaracion del cursor 
	cursor cur_datos_profesor is 
	select p.nombre, p.apellido_paterno, p.apellido_materno, 
		a.nombre, count (*) cursos 
	from profesor p, curso c, asignatura a 
	where p.profesor_id = c.profesor_id 
	and c.asignatura_id = a.asignatura_id
	group by p.nombre, p.apellido_paterno, p.apellido_materno, a.nombre;

	-- declaracion de las variables 
	v_nombre profesor.nombre%type;
	v_ap_pat profesor.apellido_paterno%type;
	v_ap_mat profesor.apellido_materno%type;
	v_asignatura asignatura.nombre%type ;
	v_num_cursos number;
begin 
	open cur_datos_profesor;
	dbms_output.put_line ('---------datos--------');

for p in cur_datos_profesor loop 
	--seleccionamos un renglon de la consulta y se lo asiciamos a la 
	--variables que declaramos anterior mente 
	--fetch cur_datos_profesor into 
	--v_nombre, v_ap_pat, v_ap_mat, v_asignatura, v_num_cursos;
	--exit when cur_datos_profesor%notfound;
	dbms_output.put_line (
	v_nombre||' , ' ||v_ap_pat||', ' ||v_ap_mat||', '||
	', '||v_asignatura ||', '||v_num_cursos);
end loop; 
close cur_datos_profesor;
end; 
/
