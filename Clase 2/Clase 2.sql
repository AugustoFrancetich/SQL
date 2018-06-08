drop database if exists clase2;
create database clase2;
use clase2;

create table clientes(
	codigo int auto_increment primary key,
    nombre varchar(20) not null,
    apellido varchar(29) not null,
    cuit varchar(13),
    direccion varchar(50),
	comentarios varchar(255)
);


insert into clientes (nombre,apellido,cuit,direccion) values
('Juan','Perez','111111','Lima 222'),
('Jhon','Smith','222222','Viel 222'),
('Ana','Garcia','333333','Maipu 333'),
('Laura','Godoy','444444','Lavalle 648'),
('Cristian','Molina','555555','Florida 222');

show tables;
describe clientes;
select * from clientes;

-- --------------------
-- -------- Ejercicio 1
-- --------------------
 
 
-- 1- Crear la tabla Facturas dentro de la base de datos con el siguiente detalle:
 
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
numero integer,
fecha date,
monto double,
primary key (letra,numero)
);
 
 
-- 2- Crear la tabla Articulos dentro de la base de datos con el siguiente detalle:
 
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
insert into articulos values (5,'balde',55,13);
 
insert into facturas values ('a',0001,'2011/10/18',500);
insert into facturas values ('a',0002,'2011/10/18',2500);
insert into facturas values ('b',0003,'2011/10/18',320);
insert into facturas values ('b',0004,'2011/10/18',120);
insert into facturas values ('b',0005,'2011/10/18',560);
-- inserto un registro con la fecha actual
insert into facturas values ('c',0006,curdate(),300);
select * from articulos;
select * from facturas;

-- ------------------------
-- Definiciones importantes
-- ------------------------
 
 
-- Significado de SQL
-- Structured Query Language
 
-- ANSI SQL
-- En la actualidad el SQL es el estándar de facto de la inmensa mayoría de los SGBD comerciales.
-- Y, aunque la diversidad de añadidos particulares que incluyen las distintas implementaciones
-- comerciales del lenguaje es amplia, el soporte al estándar SQL-92 es general y muy amplio.
 
 
-- DDL (DATA DEFINITION LANGUAGE)baja comparibilidad con ansi
-- Create table
-- Alter table
-- Drop table
 
-- DML (DATA MANIPULATION LANGUAGE) alta compatibilidad de ansi
-- Select  
-- Insert
-- Update
-- Delete

-- select
drop table clientes;

select 'hola mundo!'; -- salida
select 2+2;
select 2+2 as total;
select 2+2 valor;
select 2+2 valor_total;
select 2+2 'valor total';
select pi() PI;
select round(pi(),2);

select * from clientes; -- el * significa todos los campos
select nombre from clientes;
select nombre, apellido, codigo, curdate() from clientes;
select *,monto*.21 valor_iva from facturas;
select * from clientes where nombre = 'juan';
select * from clientes where codigo = 3;
select * from clientes where codigo < 3;
select * from clientes where codigo <= 3;
select * from clientes where nombre < 'juan';
select * from clientes where codigo != 3;
select * from clientes where codigo <> 3;
insert into clientes (nombre, apellido) values
('maxi','meza'),
('emanuel','gigliotti'),
('nico','tagliafico'),
('nico','domingo'),
('martin','benitez'),
('martin','campaña');

select * from clientes where nombre = 'nico';
select * from clientes where nombre = 'nico' or nombre = 'martin';
insert into clientes (nombre, apellido) values ('juan', 'dominguez');
insert into facturas values
('a',0022,'2011/10/18',454),
('a',0033,'2011/10/18',213),
('a',0043,'2011/10/18',199);

-- clausula between --

select * from facturas where monto between 300 and 400; -- es igual al and
select * from facturas where monto not between 300 and 400; -- es igual al or

select * from clientes where codigo = 1 or codigo = 4 or codigo = 2;
select * from clientes where codigo in ( 2, 4, 8, 1); -- igual a la de arriba pero mejorada
select * from clientes where codigo not in ( 2, 4, 8, 1); -- contraria a la de arriba

insert into clientes (nombre, apellido, direccion) values
('pedro','dominguez', null),
('martin','cabrera','lavalle 444');

select * from clientes where direccion is null; -- no igualar en null, se pone is

insert into clientes (nombre, apellido) values
('jose','dominguez'),
('juan','dominguez'),
('marcos','dominguez'),
('augusto','dominguez'),
('matias','dominguez'),
('marta','dominguez'),
('josue','dominguez'),
('milena','dominguez'),
('magali','dominguez'),
('vernon','dominguez'),
('gaston','dominguez'),
('julian','dominguez'),
('juancito','dominguez');

select * from clientes where apellido like 'd%'; -- muestra el que empiece con esa letra
select * from clientes where apellido like 'dominguez%'; -- muestra el apellido dominguez
select * from clientes where apellido like '%dominguez%'; -- muestra todos los apellidos asi aunque sea compuesto 
select * from clientes where apellido like 'd%o'; -- empieza con d y termina en o

select * from clientes where apellido like 'd_m%'; -- el _ cuenta como cualquier letra

select * from clientes order by nombre; -- ordena por nombre INTENTAR EVITAR
select * from clientes order by nombre asc; -- orden ascendente
select * from clientes order by nombre desc; -- ordena al revez
select * from clientes order by apellido,nombre;

-- -----------
-- Ejercicio 2
-- -----------
 
 
-- Llenar las tablas artículos clientes y facturas con 5 registros cada una,
 
-- ejemplo:
insert into clientes (nombre,apellido,cuit,direccion) values ('jose','benuto','3647493','loria 940');
 
insert into facturas (letra,numero,fecha,monto) values ('a',1001,'2012/10/25',350);
insert into facturas (letra,numero,fecha,monto) values ('a',1002,curdate(),540);
select * from facturas;
 
insert into articulos (codigo,nombre,precio,stock) values (110,'destornillador',30,100);
insert into articulos (codigo,nombre,precio,stock) values (111,'martillo',40*1.21,50);
-- en este ultimo ejemplo le calculamos el valor del iva al valor del articulos
select * from articulos;
 
 -- ---------------------------------------------------------------------------------------- --
 insert into clientes (nombre,apellido,cuit,direccion) values ('juan','benuto','35625688','manuel 940');
 
insert into facturas (letra,numero,fecha,monto) values ('a',1005,'2012/10/25',356);
insert into facturas (letra,numero,fecha,monto) values ('a',1006,curdate(),888);
select * from facturas;
 
insert into articulos (codigo,nombre,precio,stock) values (555,'maza',500,33);
insert into articulos (codigo,nombre,precio,stock) values (556,'tornillo',10*1.21,1000);
 
-- -----------
-- Ejercicio 3
-- -----------
 
 
-- 1 - Basándose en la tabla artículos obtener los siguientes listados.
 
-- a-   artículos con precio mayor a 100
-- b-   artículos con precio entre 20 y 40 (usar < y >)
-- c-   artículos con precio entre 40 y 60 (usar BETWEEN)
-- d-   artículos con precio = 20 y stock mayor a 30
-- e-   artículos con precio (12,20,30) no usar IN
-- f-   artículos con precio (12,20,30) usar el IN
-- g-   artículos que su precio no sea (12,20,30)
 
--  2- Listar los artículos ordenados por precio de mayor a menor, y si hubiera precio iguales deben quedar ordenados por nombre.
--  3- Listar todos los artículos incluyendo una columna denominada precio con IVA, la cual deberá tener el monto con el iva del producto.
--  4- Listar todos los artículos incluyendo una columna denominada ?cantidad de cuotas? y otra ?valor de cuota?, la cantidad es fija y es 3, el valor de cuota corresponde a 1/3 del monto con un 5% de interés.


select * from articulos where precio > 100; -- a
select * from articulos where precio > 20 and monto < 40; -- b
select * from aticulos where precio between 40 and 60; -- c
select * from articulos where precio = 20 and stock = 30; -- d
select * from articulos where precio = 12 or precio = 20 or precio = 30; -- e
select * from articulos where precio in (12,20,30); -- f
select * from articulos where precio not in (12,20,30); -- g

select * from articulos order by precio, nombre; -- 2
select *,precio*.21 valor_iva from articulos; -- 3
select *,precio/3 valor_cuotas, 3 cuotas from articulos; -- 4
