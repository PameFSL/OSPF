--@Autor: Salgado Fernández Pamela
--@Fecha creación: 20.05.2018
--@Descripción: Procedimiento almacenado encargado de crear un auto.
set serveroutput on;
create or replace procedure autoNuevo
	(
	p_auto_id in out number,
	p_marca varchar2, 
	p_modelo varchar2, 
	p_anio varchar2, 
	p_num_serie varchar2,
	p_tipo char,
	p_precio number,
	p_foto blob := empty_blob(),
	p_fecha_status varchar2 := sysdate,
	p_agencia_id number,
	p_num_cilindros number default null,
	p_num_pasajeros number default null,
	p_clase char default null,
	p_peso_maximo number default null,
	p_volumen number default null,
	p_tipo_combustible char default null
	)
	is
	p_status_auto_id number;
begin 
 select auto_seq.NEXTVAL into p_auto_id from dual;
 p_status_auto_id :=2;
	insert into auto
		(auto_id, marca, modelo, anio, num_serie, tipo, precio, foto, fecha_status, agencia_id,status_auto_id)
	values 
		(p_auto_id, p_marca, p_modelo,p_anio,p_num_serie,p_tipo,p_precio, p_foto,p_fecha_status,p_agencia_id,p_status_auto_id);
	case p_tipo 
		when 'P' then 
			insert into auto_particular
			(auto_id, num_cilindros, num_pasajeros, clase)
			values 
			(p_auto_id, p_num_cilindros,p_num_pasajeros, p_clase);
		when 'C' then
			insert into auto_carga
			(auto_id, peso_maximo, volumen, tipo_combustible)
			values 
			(p_auto_id, p_peso_maximo, p_volumen, p_tipo_combustible);
	end case;
	insert into historico_status_auto
		(historico_status_id, fecha_status, status_auto_id , auto_id)
	values 
		(historico_status_auto_seq.NEXTVAL,p_fecha_status, p_status_auto_id,p_auto_id);

		DBMS_OUTPUT.PUT_LINE('El auto ha sido creado con exito');
		DBMS_OUTPUT.PUT_LINE('Id del auto Creado : '|| p_auto_id);
end;
/
show errors
