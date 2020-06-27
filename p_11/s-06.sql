set serveroutput on 
declare
	--declaración del cursor
	cursor cur_datos_auto is
		select a.auto_id,  count (*)
			from auto a
			join pago_auto p_a
				on a.auto_id = p_a.auto_id 
	 		 group by  a.auto_id
			 having count(*) = 1
	 		 order by a.auto_id;
	--declaración de variables
		v_auto_id auto.auto_id%type;
		v_num_pago pago_auto.num_pago%type;
		v_fecha_pago pago_auto.fecha_pago%type;
		v_total_pagos number;
		v_registros_modificados number default 0;
		v_importe_reg_insert number default 0;

	-----------------------------------------------------------

	begin 
		open cur_datos_auto;
		dbms_output.put_line('-------------resultados obtenidos-------------');

	for v_index in 1 .. 50 loop 
		-- datod de pago
	--num-PAGO, AUTO_ID , FECHA_PAGO, IMPORTE 
		fetch cur_datos_auto into v_auto_id, v_num_pago, v_fecha_pago, v_total_pagos;
		if v_total_pagos = 1 then 
			insert into pago_auto (auto_id, num_pago, fecha_pago, importe)
			values (v_auto_id, 2, sysdate, 2500);
			 v_registros_modificados := v_registros_modificados+1;
			 v_importe_reg_insert := v_importe_reg_insert+2500;
			dbms_output.put_line(v_auto_id||' , '||v_num_pago||' , '||v_fecha_pago||' , '||v_total_pagos);
		end if;
	end loop;
	commit;
	close cur_datos_auto;
	dbms_output.put_line ('registros modificados: '||v_registros_modificados);
	dbms_output.put_line ( 'importe de los registros insertados: '||v_importe_reg_insert);
end;
/
