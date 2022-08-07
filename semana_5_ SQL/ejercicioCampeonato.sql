-- Crear la base de datos del campeonato

-- Usar la base de datos que acabamos de crear 

-- Creamos las tablas 

-- Alterar alguna columna de cualquier tabla, eliminando y añadiendo nuevas columnas 

-- Eliminar las tablas

-- Eliminar la base de datos 

CREATE DATABASE IF NOT EXISTS campeonato;

USE campeonato;

CREATE TABLE IF NOT EXISTS equipo (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
    patrocinador1 VARCHAR(60) NOT NULL,
    patrocinador2 VARCHAR(60) NOT NULL,
    categoria VARCHAR(60) NOT NULL,
    colorCamiseta1 VARCHAR(50) NOT NULL,
    colorCamiseta2 VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS jugador (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    dni VARCHAR(12) UNIQUE NOT NULL,
	nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    fechaNacimiento DATE NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    idEquipo INT UNSIGNED NOT NULL,
    FOREIGN KEY (idEquipo) REFERENCES equipo (id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS partido (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    resultado VARCHAR(15) NOT NULL,
    campo VARCHAR(50) NOT NULL,
    arbitro VARCHAR(60) NOT NULL,
    incidencias TEXT
);

CREATE TABLE IF NOT EXISTS equipo_juega_partido (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idEquipoLocal INT UNSIGNED NOT NULL,
    FOREIGN KEY (idEquipoLocal) REFERENCES equipo (id)
    ON DELETE NO ACTION,
    idEquipoVisitante INT UNSIGNED NOT NULL,
    FOREIGN KEY (idEquipoVisitante) REFERENCES equipo (id)
    ON DELETE NO ACTION,
    idPartido INT UNSIGNED NOT NULL,
    FOREIGN KEY (idPartido)  REFERENCES partido (id),
    fechaPartido DATETIME NOT NULL
);

ALTER TABLE jugador DROP COLUMN direccion;

DESCRIBE jugador;

ALTER TABLE jugador ADD COLUMN direccion VARCHAR(225) NOT NULL;

DROP TABLE IF EXISTS equipo_juega_partido;
DROP TABLE IF EXISTS partido;
DROP TABLE IF EXISTS jugador;
DROP TABLE IF EXISTS equipo;

DROP DATABASE campeonato;





