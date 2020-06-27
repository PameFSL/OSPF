--@Autores: Rivera Pérez Blanca Estela
--			Salgado Fernández Pamela
--@Fecha creación: 13/05/2018
--@Descripción: consulta autos 

connect bd_p11_SaRi/bd
set serveroutput on
declare
	v_auto_id auto.auto_id%type;
	v_modelo auto.modelo%type;
	v_marca auto.marca%type;
	v_num_serie auto.num_serie%type;
	v_tipo auto.tipo%type;

------------------------------------------
-- variables de cada tipo 
	v_num_cilindros auto_particular.num_cilindros%type;
	v_num_pasajeros auto_particular.num_pasajeros%type;
------------------------------------------
	v_peso_maximo auto_carga.peso_maximo%type;
	v_volumen auto_carga.volumen%type;

begin
	v_auto_id := &auto_id;
	select a.auto_id, a.modelo, a.marca, a.num_serie, a.tipo, 
		ap.num_cilindros, ap.num_pasajeros, 
		ac.peso_maximo, ac.volumen
	into v_auto_id, v_modelo, v_marca, v_num_serie, v_tipo, 
		v_num_cilindros, v_num_pasajeros,
		v_peso_maximo, v_volumen
	from auto a
	left join auto_particular ap
		on a.auto_id = ap.auto_id 
	left join auto_carga ac 
		on a.auto_id = ac.auto_id 
	where a.auto_id = v_auto_id;

	dbms_output.put_line ('-------INFORMACION DEL AUTO-------');

	case upper(v_tipo)

		when 'P' then 
			dbms_output.put_line ('id: ' || v_auto_id );
			dbms_output.put_line ('modelo: '|| v_modelo);
			dbms_output.put_line ('marca: ' || v_marca );
			dbms_output.put_line ('numero de serie: '|| v_num_serie);
			dbms_output.put_line ('tipo: ' || v_tipo);

			dbms_output.put_line ('numero de cilindros: '|| v_num_cilindros);
			dbms_output.put_line ('numero de pasajeros: '|| v_num_pasajeros);

		when 'C' then 
			dbms_output.put_line ('id: ' || v_auto_id );
			dbms_output.put_line ('modelo: '|| v_modelo);
			dbms_output.put_line ('marca: ' || v_marca );
			dbms_output.put_line ('numero de serie: '|| v_num_serie);
			dbms_output.put_line ('tipo: ' || v_tipo);

			dbms_output.put_line ( 'peso maximo: '|| v_peso_maximo);
			dbms_output.put_line ( 'volumen: '|| v_volumen);
	end case;

end;
/












