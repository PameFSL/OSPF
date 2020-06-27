--@Autor: SalgadoFernández Pamela
--@Fecha creación: 24.20.2018
--@Descripción: Script de prueba para crear un auto.
set serveroutput on
declare 
v_result number;
begin 
autoNuevo(
v_result,
p_marca=>'Volkswagen', 
p_modelo=>'lamborghini veneno', 
p_anio=>'2016', 
p_num_serie=>'PSF8943SA342BTS21', 
p_tipo=>'P', 
p_precio=>999999,  
p_agencia_id=>7, 
p_num_cilindros => 9,
p_num_pasajeros =>2,
p_clase => 'A'
); 
DBMS_OUTPUT.PUT_LINE('SE HA CREADO UN AUTO  ');
DBMS_OUTPUT.PUT_LINE('Auto ID = ' || v_result);
end;
/
show errors

commit;