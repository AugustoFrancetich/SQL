/* bloque de comentarios clasico*/
-- linea de codigo como el //
/*
	Curso base de datos y SQL
    horarios: viernes de 10-13
    profe: Carlos rios
    email: carlos.rios@educacionit.com
    materiales de estudio: alumni.educacionit.com
    user: email contra: dni
    mysqlya.com.ar
    
    software: MySql comunnity server   (server)
			  Mysql workbench          (client)
              
              paquete XAMPP 		descargar de apachefriends.org
              www.mysql.com
              
	paquete wampp-> igual que xampp pero solo para windows
			lampp-> igual que xampp pero solo apra linux
            mampp->igual que xamp pero solo para mac
            appsrv
            Sql
            
Campp control panel -> MySQL
MySQL workbench
Crear conexion con  el boton ams

*/


-- -----------------------------------
-- Tipos de datos mas comunes en MySQL
-- -----------------------------------
 
 
-- Tipo de datos Textos dedatos mas comunes
 
-- Tipo     Bytes de almacenamiento
-- _______________________________________
-- char(x)      x
-- varchar(x)   x+1

 /*
	nombre char(20) espacio para 20 caracteres
	[                     ] pongo anda y desperdicio 17 caracteres, ocupa 3 bytes pero el nombre ocupa 20
    
    nombre varchar(20)
    [                     ] pongo ana ocupa 3 bytes mas 1 de aviso de longitud, gasto lo que ocupa a dacena mas uno, se desperdicia menos y se puede agregar mas caracteres
    
 
 */
-- Tipo de datos Numérico
 
-- Tipo     Bytes de almacenamiento
-- _______________________________________
-- bool (boolean)   1   (0 es false distinto de 0 es true)
-- tinyint          1   2^8     256(-128;127) por defecto es signed, se puede declarar unsigned si se declara "numero tinyint unsigned (0; 255)
-- smallint         2   2^16        65536 igual que tinyint signed (-32000;32000) aprox, (unsigned 0; 65535)
-- mediumint        3   2^24        16777216
-- int (integer)        4   2^32        4294967296
-- bigint           8   2^64        18446744073709551616
-- float            4
-- double           8
-- decimal(t,d)     t+2 
 
 
-- Tipo de datos Fecha y Hora
 
-- Tipo     Bytes de almacenamiento
-- _______________________________________
-- date     3   Año Mes Dia ‘2012-10-25’        
-- datetime 8
-- time     3
-- year     1


show databases; -- -> muestra el catalogo de las bases de datos del servidor, ctrl + enter para ejecutar el codigo
SHOW DATABASES; -- -> es lo muismo no le afectan las mayusculas -- el rayo ejecuta todo en cascada

drop database if exists clase1; -- clase1 es la tabla que se desea borrar, drop database es para borrar una tabla
create database clase1; -- crea una bse de datos nueva
use clase1; -- entra a una base de datos

show tables; -- muestra las tablas de una base
-- columnas campos, filas registros

-- creamos tabla clientes
create table clientes(
	codigo int auto_increment primary key, -- primary key es el valor por el cual vamos a buscar y auto_increment le asigna un numero y lo crece automaticamente
    nombre varchar(20) not null, -- varchar es para que se ingresden cadenas, not null es obligatoria su ingreso
    apellido varchar(29) not null, -- la coma es solo para separar los campos, si pongo tira error
    cuit varchar(13),
    direccion varchar (50),
    comentarios varchar(255)
);

describe clientes; -- da el detalle de campos de la tabla

select * from clientes; -- selecciona un campo de la tabla

insert into clientes(nombre, apellido, cuit, direccion) values -- insert into es para hardcodear los clientes, values es para empezar a ingresar os datos
('juan', 'perez', '29994373', 'siemre verde 223'),
('perdro', 'gonzales', '54575678', 'siemre azul 223'),
('gaston', 'elias', '54575338', 'siemre azul 255'),
('pablo', 'fernandes', '21575678', 'siemre azul 22'),
('juan', 'leaz', '84575678', 'siemre azul 21');
-- se puede cargar normalmente, y una vez que cargues en la tabla mostrada pones apply y confirmas el ingreso

select curdate() as fecha; -- curdate es la fecha actual del servidor
select curtime() as hora; -- lo mismo pero para hora
select sysdate() as fecha_hora; -- fecha y hora