
set serveroutput on 
declare
	--declaración del cursor
	cursor cur_datos_auto is
		select a.auto_id, p_a.num_pago, p_a.fecha_pago, count (*)
			from auto a
			join pago_auto p_a
				on a.auto_id = p_a.auto_id 
	 		 group by  a.auto_id, p_a.num_pago, p_a.fecha_pago 
			 having count(*) = 1
	 		 order by a.auto_id;
	--declaración de variables
		v_auto_id auto.auto_id%type;
		v_num_pago pago_auto.num_pago%type;
		v_fecha_pago pago_auto.fecha_pago%type;
		v_total_pagos number;

	-----------------------------------------------------------

	begin 
		open cur_datos_auto;
		dbms_output.put_line('-------------resultados obtenidos-------------');

		for v_index in 1 .. 50 loop 
		fetch cur_datos_auto into v_auto_id, v_num_pago, v_fecha_pago, v_total_pagos;
		dbms_output.put_line(v_auto_id||' , '||v_num_pago||' , '||v_fecha_pago||' , '||v_total_pagos);
		end loop;
	close cur_datos_auto;

end;
/
