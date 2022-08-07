-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS instituto;

-- Usar la base de datos
USE instituto;

-- Creamos las tablas
CREATE TABLE IF NOT EXISTS alumno (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    apellido1 VARCHAR(60) NOT NULL,
    apellido2 VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS profesor (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    apellido1 VARCHAR(60) NOT NULL,
    apellido2 VARCHAR(60)
);


CREATE TABLE IF NOT EXISTS asignatura (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    nHoras VARCHAR(20) NOT NULL,
    idProfesor INT UNSIGNED NOT NULL,
    FOREIGN KEY (idProfesor) REFERENCES profesor (id)
);

CREATE TABLE IF NOT EXISTS alumno_cursa_asignatura (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idAlumno INT UNSIGNED NOT NULL,
    FOREIGN KEY (idAlumno) REFERENCES alumno (id),
    idAsignatura INT UNSIGNED NOT NULL,
    FOREIGN KEY (idAsignatura) REFERENCES asignatura (id),
    fechaIniCurso DATE NOT NULL,
    fechaFinCurso DATE NOT NULL
);

-- Insertar cuatro alumnos
INSERT INTO alumno (nombre, apellido1, apellido2)
VALUES ('Jorge', 'Martinez', 'Perez'),
('John', 'Weasley', null),
('Guillermo', 'Rodriguez', 'Alonso'),
('Alejandra', 'Rodriguez', 'Novoa');

SELECT * FROM alumno;


-- Insertar 3 asignaturas
INSERT INTO asignatura (nombre, nHoras, idProfesor)
VALUES ('Lengua', '4', 1),
('Filosofía', '2', 1),
('Inglés', '4', 2);

SELECT * FROM asignatura;

-- Insertar 2 profesores (uno imparte 2 asignaturas y el otro imparte la restante)
INSERT INTO profesor (nombre, apellido1, apellido2)
VALUES ('Francisco', 'de la Torre', 'Morcillo'),
('Natalie', 'Spencer', null);

SELECT * FROM profesor;

-- Los alumnos con id (1, 2, 3 y 4) están cursando las asignaturas 1 y 3, solamente el alumno con id 2 cursa la asignatura con id 2
INSERT INTO alumno_cursa_asignatura (idAlumno, idAsignatura, fechaIniCurso, fechaFinCurso)
VALUES (1, 1, '2022-09-15', '2023-06-09'),
(1, 3, '2022-09-15', '2023-06-09'),
(2, 1, '2022-09-15', '2023-06-09'),
(2, 2, '2022-09-15', '2023-06-09'),
(2, 3, '2022-09-15', '2023-06-09'),
(3, 1, '2022-09-15', '2023-06-09'),
(3, 3, '2022-09-15', '2023-06-09'),
(4, 1, '2022-09-15', '2023-06-09'),
(4, 3, '2022-09-15', '2023-06-09');

SELECT * FROM alumno_cursa_asignatura;




