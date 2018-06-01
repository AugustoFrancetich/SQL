/*
	Curso: Introducción a la Bases de Datos y SQL
    Días: Sábado de 15:00 a 19:00 hs
    Total: 12 horas.
    Profe: Carlos Ríos	carlos.rios@educacionit.com
    Materiales:	alumni.educacionit.com
				user: email
				pass: dni
    
    Software:	MySQL Community Server		(Server)
				MySQL WorkBench				(Client)
						www.mysql.com
	
    Paquete XAMPP		apachefriends.org
		
		X		Linux/Windows/Mac
        A		Apache Web Server
        M		MySQL Community Server
        P		PHP
        P		Perl
        
	WAMP wampserver		LAMP	MAMP 	appsrv
 
	
	Editor de android: droid edit
	Bloque de comentarios.
*/

-- comentarios de una linea

#comentario no Ansi

show databases;	-- muestra las BDs del server

-- ; es el terminador de sentencias

SHOW DATABASES;	-- lenguaje no case sensitive

-- boton de Rayo: para ejecutar todo.
-- Rayo y cursos: ejecuta una sola sentencia.
-- Ctrl Enter: ejecuta una sola sentencia.


-- borramos la base de datos clase1 si existe.
drop database if exists clase1;

-- crea la database clase1
create database clase1;

-- activa la base clase1
use clase1; 

-- listado de tablas de la BD
show tables;

-- campo = columna
-- registro = fila

-- borramos la tabla clientes si existe
drop table if exists clientes;

-- creamos la tabla clientes
create table clientes(
	codigo int auto_increment,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    cuit varchar(13),
    direccion varchar(50),
    comentarios varchar(140),
    primary key(codigo)
);

describe clientes;

-- muestra los registro de la tabla
select * from clientes;

-- inserción de registro en tabla clientes
insert into clientes (nombre,apellido,cuit,direccion) values
('Juan','Perez','1111','Viel 123'),
('Laura','Soto','2222','Lima 333'),
('Lorena','Galce','3333','Florida 444'),
('Jose','Leon','4444','Maipu 555'),
('Maria','Gallo','5555','Lavalle 1234');

-- /box/carlos rios/mysql/tipo de datos.txt

-- -----------------------------------
-- Tipos de datos más comunes en MySQL
-- -----------------------------------
 
 
-- Tipo de datos Textos más comunes
 
-- Tipo     Bytes de almacenamiento
-- _______________________________________
-- char(x)      x
-- varchar(x)   x+1
/*
	nombre char(20)
    
    |ANA                 |			20 Bytes
    |CARLOS              |			20 Bytes
    |MAXIMILIANO         |			20 Bytes
							Total:	60 Bytes
	
    nombre varchar(20)
    |ANA                 |		3 + 1 =  4 Bytes
    |CARLOS              |		6 + 1 =  7 Bytes
    |MAXIMILIANO         |		11+ 1 =	12 Bytes
								Total:	23 Bytes

*/
 
 
-- Tipo de datos Numérico
 
-- Tipo     Bytes de almacenamiento
-- _______________________________________
-- bool (boolean)   1   (0 es false distinto de 0 es true)
-- tinyint          1   2^8     	256
-- smallint         2   2^16        65536
-- mediumint        3   2^24        16777216
-- int (integer)    4   2^32        4294967296
-- bigint           8   2^64        18446744073709551616
-- float            4           -3.4e+38 a –1.1e-38 (9 cifras).
-- double           8
-- decimal(t,d)     t+2 
 
/*
		codigo tinyint,      (signed)
        
        |--------|--------|
	  -128		 0		 127

		codigo tinyint unsigned,
        
        |-----------------|
        0				 255
        
        float 32 bits 9 digitos contando el punto decimal
        double 64 bits 18 digitos contando el punto decimal
        
        10/3
        
        float	3.3333333	
				---------
		
        double  3.3333333333333333
				------------------
        
        100/3
        
        float	33.333333	
				---------
		
        double  33.333333333333333
				------------------
        
        precio decimal(7,2)
        
        99999,99
        -----,--
        
        precio decimal(9,2)
        
        9999999,99
        -------,--
        
*/

 
 
 
-- Tipo de datos Fecha y Hora
 
-- Tipo     Bytes de almacenamiento
-- _______________________________________
-- date     3   Año Mes Dia '2012-10-25'  '2017/12/02'      
-- datetime 8
-- time     3
-- year     1

select 'Hola Mundo!';
select 2 + 2;
select 2+2 as valor; -- as cambiamos el alias de la columna

select pi();
select pi() as valor_PI;
select pi() as 'valor PI';
select round(pi(),2) as valor_PI;

select curdate() as fecha_actual;	-- fecha actual del servidor
select curtime() as hora_actual;	-- hora del servidor
select sysdate() as fecha_y_hora; 	-- fecha y hora del servidor

select year(curdate()) as año;
select month(curdate()) as mes;	
select day(curdate()) as dia;

select week(curdate()) as semana;

-- --------------------
-- -------- Ejercicio 1
-- --------------------
 
 
-- 1- Crear la tabla Facturas dentro de la base de datos con el 
--    siguiente detalle:
 
-- Letra        char y PK
-- Numero       integer y PK
-- Fecha        date
-- Monto        double
 
-- PK significa Primary Key
-- observar que se esta declarando una clave primaria compuesta
-- es decir (letra,codigo)
-- cada campo por si solo no es clave, ni tampoco identifica al registro
-- pero la suma de los dos forman la clave
 
create table facturas(
letra char(1),
numero int,
fecha date,
monto double,
primary key (letra,numero)
);
 
 
-- 2- Crear la tabla Articulos dentro de la base de datos con 
--    el siguiente detalle:
 
-- Codigo       integer y PK
-- Nombre       varchar (50)
-- Precio       double
-- Stock        integer
 
create table articulos(
codigo integer,
nombre varchar(50),
precio double,
stock integer,
primary key (codigo)
);
 
show tables;
describe facturas;
describe articulos;
 
-- 3- Cargar 5 registros en cada tabla
 
insert into articulos values (1,'destornillador',25,50);
insert into articulos values (2,'pinza',35,22);
insert into articulos values (3,'martillo',15,28);
insert into articulos values (4,'maza',35,18);
insert into articulos values (5,'valde',55,13);
 
insert into facturas values ('a',0001,'2011/10/18',500);
insert into facturas values ('a',0002,'2011/10/18',2500);
insert into facturas values ('b',0003,'2011/10/18',320);
insert into facturas values ('b',0004,'2011/10/18',120);
insert into facturas values ('b',0005,'2011/10/18',560);
-- inserto un registro con la fecha actual
insert into facturas values ('c',0006,curdate(),300);


select * from facturas;
select * from clientes;

-- ------------------------
-- Definiciones importantes
-- ------------------------
 
 
-- Significado de SQL
-- Structured Query Language
 
-- ANSI SQL
-- En la actualidad el SQL es el estándar de facto de la inmensa mayoría de los SGBD comerciales.
-- Y, aunque la diversidad de añadidos particulares que incluyen las distintas implementaciones
-- comerciales del lenguaje es amplia, el soporte al estándar SQL-92 es general y muy amplio.
 
 
-- DDL (DATA DEFINITION LANGUAGE) (Estructura de datos tablas)
-- (Baja Compatibilidad con ANSI)
-- Create table
-- Alter table
-- Drop table
 
-- DML (DATA MANIPULATION LANGUAGE) (Registros)
-- (Alta Compatibilidad con ANSI)
-- Select
-- Insert
-- Update
-- Delete

-- Comando DML Select
 
-- * comodin 'todos los campos'
select * from clientes;
select nombre,apellido from clientes;



 	












