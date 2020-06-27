--@Autores: Rivera Pérez Blanca Estela
--			Salgado Fernández Pamela
--@Fecha creación: 13/05/2018
--@Descripción: Creación de usuario Practica 11


connect sys/system as sysdba

prompt creando usuario bd_p11_SaRi
	create user bd_p11_SaRi identified by bd
	quota unlimited on users; 

prompt Otorgando permisos para crear sesion, tablas, secuencias y procedimientos
	grant create session, create table, create sequence, create procedure to bd_p11_SaRi;

prompt Usuario creado con exito :D

prompt Iniciando sesion con el usuario bd_p11_SaRi
	connect bd_p11_SaRi/bd

prompt Listo! 
