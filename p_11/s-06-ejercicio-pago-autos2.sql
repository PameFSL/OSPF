set serveroutput on 
declare
	--declaración del cursor
	cursor cur_datos_auto is
		select a.auto_id,  count (*)
			from auto a
			join pago_auto p_a
				on a.auto_id = p_a.auto_id 
			 where a.auto_id <= 50
	 		 group by  a.auto_id
			 having count(*) = 1
	 		 order by a.auto_id;
	--declaración de variables
		v_auto_id auto.auto_id%type;
		v_total_pagos number;
		v_registros_modificados number default 0;
		v_importe_reg_insert number default 0;

	--	s-06-ejercicio-pago-autos2.sql

-------------------------------------------------------------

begin 
		open cur_datos_auto;
		dbms_output.put_line('-------------resultados obtenidos-------------');		
	loop 
		-- datod de pago
	--num-PAGO, AUTO_ID , FECHA_PAGO, IMPORTE 
		fetch cur_datos_auto into v_auto_id, v_total_pagos;
		exit when cur_datos_auto%notfound;
		if v_total_pagos = 1 then 
			insert into pago_auto (num_pago, auto_id, fecha_pago, importe)
			values (2, v_auto_id, sysdate, 2500);
			 v_importe_reg_insert := v_importe_reg_insert+2500;
			--dbms_output.put_line(v_auto_id||' , '||v_num_pago||' , '||v_fecha_pago||' , '||v_total_pagos);
		end if;
	end loop;
	v_registros_modificados := cur_datos_auto%rowcount;
	close cur_datos_auto;
	dbms_output.put_line ('registros modificados: '||v_registros_modificados);
	dbms_output.put_line ( 'importe de los registros insertados: '||v_importe_reg_insert);
end;
/
show errors 
