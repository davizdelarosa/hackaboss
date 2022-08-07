
-- Ejercicio 1

create database if not exists ejerciciosJueves1;

use ejerciciosJueves1;

create table if not exists datosUsuario (
	id int unsigned primary key auto_increment,
    tlf varchar(15) not null,
    email varchar(50) not null,
    nombre varchar (40) not null,
    apellido1 varchar (60) not null,
    apellido2 varchar (60),
    pais varchar(50) not null,
    dni varchar(10) unique not null,
    cp char(5) not null,
    direccion1 varchar(60) not null,
    direccion2 varchar(60)
);

describe datosUsuario;

-- Ejercicio2

alter table datosUsuario drop column cp;
alter table datosUsuario drop column direccion1;
alter table datosUsuario drop column direccion2;
alter table datosUsuario drop column dni;
alter table datosUsuario add column dni varchar(20) unique not null;


create table if not exists direccion (
	id int unsigned primary key auto_increment,
    cp char(5) not null,
    direccion1 varchar(60) not null,
    direccion2 varchar(60),
    idDatosUsuario int unsigned not null,
    foreign key (idDatosUsuario) references datosUsuario (id)
);

-- Ejercicio 3

insert into datosUsuario (tlf, email, nombre, apellido1, pais, dni)
values('993870144', 'ilethem0@google.com.au', 'Irvin', 'Lethem', 'Indonesia', '279948941-9'),
('497494899', 'kmungan1@howstuffworks.com', 'Kylie', 'Mungan', 'Philippines', '748551874-7'),
('776631050', 'ydibbert2@businesswire.com', 'Yul', 'Dibbert', 'Indonesia', '215649413-4'),
('921948685', 'tmcgorley3@studiopress.com', 'Tamra', 'Mc Gorley', 'Norway', '617064473-7'),
('304168000', 'eimbrey4@cpanel.net', 'Elmira', 'Imbrey', 'United States', '178988896-4'); 

select * from datosUsuario;

insert into direccion (cp, direccion1, direccion2, idDatosUsuario)
values('83297', '98339 Loftsgordon Road', 'Babakanbandung', 1),
('44455', '74641 Dwight Avenue', 'Bilar', 2),
('62965', '9510 Milwaukee Street', 'Sumberejo', 3),
('54756', '8902 Doe Crossing Alley', 'Steinkjer', 4),
('51471', '8616 Stephen Hill', 'Charleston', 5);

-- Ejercicio 4

select nombre, apellido1, tlf
from datosUsuario
order by apellido1 asc;

select count(*), pais
from datosUsuario
group by pais;

-- Ejercicio 5

select *
from datosUsuario U inner join direccion D
	on (D.idDatosUsuario = U.id);


-- Ejercicio 6 

alter table datosUsuario add column edad int not null;

UPDATE datosUsuario SET edad = '29' WHERE nombre = 'Irvin';
UPDATE datosUsuario SET edad = '33' WHERE nombre = 'Kylie';
UPDATE datosUsuario SET edad = '21' WHERE nombre = 'Yul';
UPDATE datosUsuario SET edad = '45' WHERE nombre = 'Tamra';
UPDATE datosUsuario SET edad = '30' WHERE nombre = 'Elmira';

-- Ejercicio 7

select nombre, edad
from datosUsuario
where edad = (
	select max(edad) from datosUsuario
);


