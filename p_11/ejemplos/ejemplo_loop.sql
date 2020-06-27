begin 
	for v_index in 1 .. 10 loop
		dbms_output.put_line('Iterando '|| v_index);
		if v_index >= 5 then 
			dbms_output.put_line('Terminando prematuramente');
			exit;
		end if;
		if v_index = 2 then 
			dbms_output.put_line ('El siguiente será el 3');
			continue;	
		end if;
	end loop;
end ;
/
