set serveroutput on 
declare 
	v_semestre_id semestre.semestre_id%type;
	v_anio semestre.anio%type;
	v_periodo semestre.periodo%type;
	v_fecha_inicio semestre.fecha_inicio%type;
	v_fecha_fin semestre.fecha_fin%type;

begin 
	select semestre_id, anio, periodo, fecha_inicio, fecha_fin
	into v_semestre_id, v_anio, v_periodo, v_fecha_inicio, v_fecha_fin
	from semestre 
	where anio = '2008' and semestre_id = 1;
	
	dbms_output.put_line ('Id: '||v_semestre_id);
	dbms_output.put_line ('anio: '||v_anio);
	dbms_output.put_line ('periodo'||v_periodo);
	dbms_output.put_line ('fecha inicio: '|| v_fecha_inicio);
	dbms_output.put_line ('fecha fin '|| v_fecha_fin);
end;
/
