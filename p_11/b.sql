set serveroutput on 

declare 
	v_auto_id auto.auto_id%type;
	v_tipo auto.tipo%type;
	v_volumen auto_carga.volumen%type default null;
	v_num_pasajeros auto_particular.num_pasajeros%type default null;

begin 
	select a.auto_id, 
	case 
		when v_tipo = 'C'
		then ac.volumen into v_volumen 
		else ap.num_pasajeros into v_num_pasajeros
		end as name
	into v_auto_id 
	from auto a
	left join auto_particular ap
		on a.auto_id = ap.auto_id
	left join auto_carga ac
		on a.auto_id = ac.auto_id 
	when v_auto = a.auto_id ;

	dbms_output.put_line ('id:	'||v_auto_id);
	dbms_output.put_line ('clave:	'||v_tipo auto);
	--dbms_output.put_line ('fecha:	'||v_fecha);
end; 
/

	
