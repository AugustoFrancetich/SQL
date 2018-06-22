drop database if exists clase4;
create database clase4;
use clase4;

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

create table facturas(
letra char(1),
numero integer,
fecha date,
monto double,
primary key (letra,numero)
);

create table articulos(
codigo integer,
nombre varchar(50),
precio double,
stock integer,
primary key (codigo)
);


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

insert into clientes (nombre,apellido) values
('Juan','Perez'),('Juan','Gomez'),
('Laura','Perez'),('Laura','Alonso');


insert into clientes (nombre,apellido) values ('Karina','Vasquez');

insert into facturas values
('a',2001,curdate(),250),
('a',2002,curdate(),280),
('a',2003,curdate(),300),
('a',2004,curdate(),350),
('a',2005,curdate(),380),
('a',2006,curdate(),400),
('a',2007,curdate(),420);

insert into clientes (nombre,apellido,direccion) values
('Ana','Lorre',''),('Martin','Cabrera',null);

insert into clientes (nombre,apellido) values 
('Maria','Martinez'),('Martin','Martinez'),('Omar','Martinez'),
('Mariana','Martinez'),('Monica','Martinez'),('Micaela','Martinez'),
('Marta','Martinez'),('Magali','Martinez'),('Milena','Martinez'),
('Mariano','Martinez'),('Mercedes','Martinez'),('Mario','Martinez');

insert into clientes (nombre,apellido,cuit,direccion) values ('jose','benuto','3647493','loria 940');
 
insert into facturas (letra,numero,fecha,monto) values ('a',1001,'2012/10/25',350);
insert into facturas (letra,numero,fecha,monto) values ('a',1002,curdate(),540);
select * from facturas;
 
insert into articulos (codigo,nombre,precio,stock) values (110,'destornillador',30,100);
insert into articulos (codigo,nombre,precio,stock) values (111,'martillo',40*1.21,50);

insert into clientes (nombre,apellido,direccion) values
	('Ana','Juarez','Lavalle 648');

insert into clientes values 
	(null,'Mario','Bermudez','111111',null,null);
    
insert into clientes (cuit,direccion) values ('2222','Viel 333');

insert into clientes (nombre,apellido) values
('Ana','Mendez'),
('Victor','Acosta'),
('Laura','Vera'),
('Maria','Lopez');

insert clientes set nombre='Lorena', apellido='Sucre';

show tables;
describe clientes;
describe facturas;
describe articulos;

select * from clientes;
select * from facturas;
select * from articulos;

-- subconsultas/subquerry

select max(monto) from facturas;
select * from facturas where monto=2500;
select*from facturas where monto=(select max(monto) from facturas); -- de haber 2 facturas mostraria las 2 --
select
(select count(*) from facturas where letra='a') + (select count(*) from facturas where letra='b') cantidades;

-- agrupaciones con group by

select letra, sum(monto) total from facturas where letra='a';
select letra, sum(monto) total from facturas where letra='b';
select letra, sum(monto) total from facturas where letra='c';
-- a 8770 b 1000 c 300, total 10070

select letra,sum(monto)total from facturas group by letra; -- el primero es por el cual agrupo
select fecha,sum(monto) total, count(*) cantidad from facturas group by fecha;

insert into facturas values
('c', 4001, '2018/1/10', 500),
('c', 4002, '2018/1/2', 500),
('c', 4003, '2018/10/1', 500),
('c', 4004, '2018/1/5', 500),
('c', 4005, '2018/9/1', 500),
('c', 4006, '2018/1/9', 500),
('c', 4007, '2018/1/20', 500),
('c', 4008, '2018/11/25', 500),
('c', 4009, '2018/1/22', 500),
('c', 4010, '2018/5/1', 500),
('c', 4011, '2018/12/1', 500),
('c', 4012, '2018/2/1', 500),
('c', 4013, '2018/11/1', 500),
('c', 4014, '2018/10/1', 500);

-- total recaudado en cada mes

select month(fecha) mes from facturas; -- asi elegis mes por mes sin importar el año
select concat(year(fecha),'/', month(fecha)) mes from facturas; -- aca se ve el mes de cada añoptimize
select concat(year(fecha),'-', month(fecha)) mes, sum(monto) total from facturas group by mes; -- asi es solamente un mysql, en oracle se pondre el calculo completo
-- select concat(year(fecha),'-', month(fecha)) mes, sum(monto) total from facturas group by concat(year(fecha),'-', month(fecha)) mes; asi seria en oracle o en cualquier otra base de datos

-- uso de having

select letra, sum(monto) total from facturas group by letra having total>=3000;

 --  -----------
--  EJERCICIO 5
--  -----------
 
-- 1. Crear la tabla 'autos' con el siguiente detalle:
 
--  codigo  INTEGER y PK
--  marca   VARCHAR(255)
--  modelo  VARCHAR(255)
--  color   VARCHAR(255)
--  anio        INTEGER
--  precio  DOUBLE
 
-- 2. Cargar la tabla con 10 autos.

-- 3. Realizar las siguientes consultas:
--  a. obtener el precio máximo.
--  b. obtener el precio mínimo.
--  c. obtener el precio mínimo entre los años 2000 y 2008.
--  d. obtener el precio promedio.
--  e. obtener el precio promedio del año 2006.
--  f. obtener la cantidad de autos.
--  g. obtener la cantidad de autos que tienen un precio entre $35.000 y $40.000.
--  h. obtener la cantidad de autos que hay en cada año.
--  i. obtener la cantidad de autos y el precio promedio en cada año.
--  j. obtener la suma de precios y el promedio de precios según marca.
--  k. informar los autos con el menor precio.
--  l. informar los autos con el menor precio entre los años 2008 y 2010

create table autos(
codigo int primary key,
marca varchar(255),
modelo varchar(255),
color varchar(255),
anio int,
precio double);

insert into autos values
(1001,'fiat','toro','verde', 2017, 450000),
(1002,'peugeot','308','azul', 2018, 670000),
(1003,'ford','ranger','gris', 2018, 800000),
(1004,'chevrolet','camaro','rojo', 2012, 1200000),
(1005,'toyota','hilux','blanco', 2010, 700000),
(1006,'mercedes benz','c280','gris', 2002, 1200000),
(1007,'bmw','135','gris', 2016, 1200000),
(1008,'audi','a4','azul', 2015, 600000),
(1009,'renault','clio','negro', 2005, 100000),
(1010,'citroen','c5','verde', 2018, 500000);

select max(precio) from autos; -- a
select min(precio) from autos; -- b
select min(precio) from autos where anio between 2000 and 2008; -- c
select avg(precio) from autos; -- d
select avg(precio) from autos where anio= 2006; -- e
select count(*) cantidad from autos; -- f
select count(*) cantidad from autos where precio between 35000 and 40000; -- g
select anio año, count(*) cantidad from autos group by anio; -- h
select avg(precio), marca from autos group by marca; -- i
select sum(precio) suma, avg(precio) promedio, marca from autos group by marca; -- j
select * from autos where precio=(select min(precio) from autos); -- k
select * from autos where anio between 2008 and 2010 and precio=(select min(precio) from autos where anio between 2008 and 2010); -- l
select * from autos;

-- agregamos foreign key, o fk o clave foranea

alter table facturas add codigo int;
describe facturas;
select * from facturas;
select * from clientes;
set sql_safe_updates=0;
update facturas set codigo=1 where numero=2001;
update facturas set codigo=2 where numero=2002;
update facturas set codigo=2 where numero=2003;
update facturas set codigo=4 where numero=2004;
update facturas set codigo=5 where numero=2005;
select * from clientes, facturas;
select count(*) cantidad from clientes;
select count(*) cantidad from facturas;
select count(*) cantidad from clientes, facturas;
-- consulta del preoducto relacionado

select * from clientes, facturas where clientes.codigo=facturas.codigo;

select * from clientes c, facturas f where c.codigo=f.codigo;

select * from clientes c join facturas f on c.codigo=f.codigo;

-- uso de left join y right join

select * from clientes c right join facturas f on c.codigo=f.codigo;
select * from clientes c left join facturas f on c.codigo=f.codigo;

update facturas set codigo=6 where codigo is null and letra='a';
update facturas set codigo=7 where codigo is null and letra='b';
update facturas set codigo=8 where codigo is null and letra='c';

-- quienes(codigo, nombre y apellido) realizaron compras en el dia de hoy?

select distinct c.codigo,nombre,apellido from clientes c join facturas f on c.codigo=f.codigo where fecha=curdate();  

-- cuanto compro cada cliente?

select c.codigo, nombre, apellido, sum(monto) total from clientes c join facturas f on c.codigo=f.codigo group by c.codigo;