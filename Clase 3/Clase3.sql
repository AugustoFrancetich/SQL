drop table if exists clase3;
create database clase3;
use clase3;

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

show tables;

describe clientes;
describe facturas;
describe articulos;
select * from clientes;
select*from facturas;
select*from articulos;

-- insert -- 

-- onsert normal que soporta la norma amsi esta es sin definicion de campos y el abreviado que tambien lo soporta la amsi que es con definicion de campos

insert into clientes (nombre,apellido,direccion) values
('juan','fernandez','ameghino 2291');

insert into clientes values(null, 'mario', 'bermudez','2223485','larrea 334',''); -- los que auto incrementan se puede poner null para que el sistema le ponga y comentario que no pongo se puede dejar vacio o poner null

select * from clientes;
insert into clientes (cuit, direccion) values ('443423', 'viel 443');
-- insert masivo 

insert into clientes (nombre, apellido) values
('jose', 'rafecas'),
('juan', 'gomez'),
('mauro', 'godinez'),
('jorge', 'fernandez'),
('marcos', 'fernandes'),
('marcus', 'fernandes'),
('domingo', 'mauro'),
('sebastian', 'gomes'),
('gaston', 'gomes'),
('julian', 'gomez'),
('mariano', 'gomez');

-- insert set (no ansi, solo en my sql) no es std

 insert clientes set nombre = 'rodriguo', apellido='sucre';
 
 select * from clientes;
 
 -- comando delete
 
-- delete from clientes where codigo=10;
-- delete from clientes where nombre='juan'; -- safe update evita las modificaciones masivas 
 -- desactivar el safe update, 
 
 set sql_safe_updates=0; -- =1 es on, =0 es off
 
 -- delete from clientes; -- borra todos los registros
 insert into clientes (nombre, apellido) values
 ('bart', 'simpson');
 insert into clientes (codigo,nombre, apellido) values
 (200,'bart', 'simpson');
  insert into clientes (nombre, apellido) values
 ('lisa', 'simpson');
 
 -- truncate, trunca
 
 -- truncate clientes; -- resetea los codigos
  insert into clientes (nombre, apellido) values
 ('marge', 'simpson');
 
 -- update
 update clientes set nombre='magali' where codigo=3;
 -- update clientes set nombre='magali'; -- cambia todos los nombres a magali
 
 -- alter tabla
 
 alter table clientes add edad int; -- add el nombre de lo que se agrega y como va a ser (char, int float)
 
  select * from clientes; 
  
   alter table clientes add titulo varchar(20) first;-- agrega el titulo primero y en orden de ejecucucion
alter table clientes add estadoCivil varchar(20) after apellido;

update clientes set titulo='dr.', estadoCivil='casado', edad=45 where codigo=1;
update clientes set titulo='lic.', estadoCivil='viudo', edad=60 where codigo=2;

-- modify

alter table clientes modify edad tinyint unsigned;
alter table clientes drop edad;
alter table clientes drop titulo;
alter table clientes drop estadoCivil;

-- import y pone en separado por ; y ahi se guarda para archivos excel

-- -----------
-- Ejercicio 4
-- -----------
 
 
-- Basándose en la tabla clientes realizar los siguientes puntos.
 
-- 1-   Insertar 5 clientes en la tabla clientes utilizando el insert into sin utilizar campos como parte de la sentencias, es decir de la forma simplificada.
-- 2-   Insertar 5 clientes en la tabla clientes utilizando los campos como parte de la sentencias, es decir de la forma extendida. Completar solo los campos nombre, apellido y CUIT.
-- 3-   Actualizar el nombre del cliente 1 a Jose.
-- 4-   Actualizar el nombre apellido y cuit del cliente 3 a Pablo Fuentes 20-21053119-0.
-- 5-   Actualizar todos los comentarios NULL  a ‘ ‘.
-- 6-   Eliminar los clientes con apellido Perez.
-- 7-   Eliminar los clientes con CUIT Terminan en 0.
 
-- Basando se en la tabla artículos, realizar los siguientes puntos.
--  8- Aumentar un 20% los precios de los artículos con precio menor igual a 50.
--  9- Aumentar un 15% los precios de los artículos con precio mayor a 50.
--  10- Bajar un 5% los precios de los artículos con precio mayor a 200.
--  11- Eliminar los artículos con stock menor a 0.
  select * from clientes; 

insert into clientes values -- 1
(null, 'carlos', 'manuel', 849328409, 'marcos paz 221',''),
(null, 'carlos', 'manuel', 849328409, 'marcos paz 221',''),
(null, 'carlos', 'manuel', 849328409, 'marcos paz 221',''),
(null, 'carlos', 'manuel', 849328409, 'marcos paz 221',''),
(null, 'carlos', 'manuel', 849328409, 'marcos paz 221','');

insert into clientes (nombre, apellido) values -- 2
('jose', 'dominguez'),
('jose', 'dominguez'),
('jose', 'dominguez'),
('jose', 'dominguez'),
('jose', 'dominguez');

update clientes set nombre='jose' where codigo=1; -- 3

update clientes set nombre='pablo', apellido='fuentes',cuit=20-21053119-0 where codigo =3; -- 4

update clientes set comentarios=''; -- 5

delete from clientes where apellido='perez'; -- 6
delete from clientes where cuit ='%0';

update articulos set precio= (precio*1.20) where precio<50; -- 8
update articulos set precio= (precio*1.15) where precio>50; -- 9
update articulos set precio= (precio*0.98) where precio>200; -- 10
delete from articulos where stock<0; -- 11

-- funciones de agrupamiento

-- funcion max

select max(monto) from facturas; -- no dejar espacios
select max(monto) monto_maximo from facturas; -- se le pone un alias en este caso
select max(fecha) ultima_fecha from facturas;
select max(nombre) eltumo_nombre from clientes; -- elige ultimo nombre de la lista

-- funcion min

select min(monto) from facturas; -- no dejar espacios
select min(monto) monto_minimo from facturas; -- se le pone un alias en este caso
select min(fecha) primera_fecha from facturas;
select min(nombre) primer_nombre from clientes; -- primer nombre

-- funcion sum

select sum(monto) total_facturtacion from facturas;

-- funcion promedio

select round(avg(monto),2) promedio from facturas; -- asi redondea con la cantidad de decimales que se le ponga

-- funcion count

select count(*) cantidad from facturas; -- cantidad de registros
select count(*) cantidad from clientes; -- el * selecciona todo registro ingresado
select count(direccion) from clientes; -- esto selecciona cuantos registros de esa direccion, puede ser con un where si la direccion is null o is not null

 -- subquerries y group by
 
 