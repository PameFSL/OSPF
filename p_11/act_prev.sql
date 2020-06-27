set serveroutput on 
declare 
	v_uno number;
	v_dos number:= 2;
	v_tres number not null := 3 ;
	v_cuatro number default 4;
	v_str varchar2 (50);
begin 
	v_uno := 1;
	v_str := v_uno || ',' || v_dos || ',' || v_tres || ',' || v_cuatro;
	dbms_output.put_line(v_str);
end;
/ 



-- USO DE % TYPE
set serveroutput on 
declare 
	v_id plan_estudios.plan_estudios_id%type;
	v_clave plan_estudios.clave%type;
	v_fecha plan_estudios.fecha_inicio%type;

begin 
	select plan_estudios_id, clave, fecha_inicio
	into v_id, v_clave, v_fecha
	from plan_estudios 
	where plan_estudios_id = 1;
	
	dbms_output.put_line ('id:	'||v_id);
	dbms_output.put_line ('clave:	'||v_clave);
	dbms_output.put_line ('fecha:	'||v_fecha);
end;
/ 


--*********************************************************
--procedimiento para crear una asignatura
--ponemos out cunado la vARIABLE ES DE SALIDA 


create or replace procedure creaAsignatura(
	v_asignatura_id out number, v_nombre in varchar2,
	v_creditos in number, v_clave_plan in varchar2,
	v_nombre_asignatura_requerida in varchar2 default null) is
	
	--declaracion de variables 
	v_asignatura_req_id asignatura.asignatura_requerida_id%type;
	v_plan_id plan_estudios.plan_estudios_id%type;

begin 

	--generando el is de la asignatura

	select asignatura_seq.nextval into v_asignatura_id
	from dual;
	
--		obtenemos el id del plan de estudios
	select plan_estudios_id into v_plan_id
	from plan_estudios
	where clave = v_clave_plan;

	-- en caso de haber asignatura requerida, obtiene el id
	if v_nombre_asignatura_requerida is not null then 
		select asignatura_id into v_asignatura_req_id
		from asignatura
		where lower (nombre) = lower (v_nombre_asignatura_requerida);
	else 
		v_asignatura_req_id := null;
	end if;

	--insertando a la nueva asignatura
	insert into asignatura (asignatura_id, nombre, creditos, plan_estudios_id, 
				asignatura_requerida_id)
	values (v_asignatura_id, v_nombre, v_creditos, v_plan_id, v_asignatura_req_id);
end;
/
show errors 

--**************************************************************


-- visualizando tablas, antes de modificar 
	select a.*, a2.*
	from asignatura a, asignatura a2
	where a2.asignatura_requerida_id(+) = a.asignatura_id 
	



--***************************************************************

--##################################################################
--no sirve 
set serveroutput on 
declare 
	v_id number;
begin 
	creaAsignatura (v_id, 'Electronica_pam', 12, 'PL-2009');
	dbms_output.put_line ('La asignatura Electronica creada con id: '||v_id);
	creaAsignatura (v_id, 'Electronica Digital_pam', 12, 'PL-2009', 'Electronica_pam');
	dbms_output.put_line ('La asignatura Elecronica digital pam creada con id: '||v_id);
end;
/


--########################################################################

--teoria tema 10 ejercicios
--
set serveroutput on 
declare 
	v_nombre_asignatura asignatura.nombre%type; 
begin 
	select nombre into v_nombre_asignatura
	from asignatura
	where asignatura.asignatura_id = 1;
	dbms_output.put_line('¡Hola mundo! :D  fecha actual: '|| sysdate ||' asignatura: '||v_nombre_asignatura );
end;
/


------------------------------------------------------------------------
--mostrar datos plan de estudio 




















