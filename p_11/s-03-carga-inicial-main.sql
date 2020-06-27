--@Autores: Rivera Pérez Blanca Estela
--			Salgado Fernández Pamela
--@Fecha creación: 13/05/2018
--@Descripción: Script carga inicial

prompt Iniciando sesion con el usuario bd_p11_SaRi
	connect bd_p11_SaRi/bd

whenever sqlerror exit rollback
Prompt ejecutando scripts de carga inicial
	@s-03-agencia.sql
	@s-03-cliente.sql
	@s-03-tarjeta-cliente.sql
	@s-03-status-auto.sql
	@s-03-auto.sql
	@s-03-auto-carga.sql
	@s-03-auto-particular.sql
	@s-03-historico-status-auto.sql
	@s-03-pago-auto.sql
	commit;
Prompt Listo!
exit
