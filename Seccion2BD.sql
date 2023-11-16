CREATE DATABASE Fuchibol;/*Creamos la Base de datos*/

USE Fuchibol;/*Usamos la base de datos creada*/

/*Creamos las tablas de la base de datos*/
CREATE TABLE Estadios (
    id_estadio INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(20),
	capacidad INT,
    direccion VARCHAR(20),
    cp INT, 
    provincia VARCHAR(20),
    telefono BIGINT,
    inauguracion DATE, 
    propietario VARCHAR(20),
    dimensiones VARCHAR(20),
    otras_instalaciones VARCHAR(20),
    localidad VARCHAR(20)
);

CREATE TABLE Provincias (
	id_provincia INT PRIMARY KEY NOT NULL, 
    nombre_provincia VARCHAR(20)
);

CREATE TABLE SituacionNacionalidad (
	id_situacion INT PRIMARY KEY NOT NULL,
    situacion VARCHAR(20)
);

CREATE TABLE Representantes (
	id_representante INT PRIMARY KEY NOT NULL, 
    nombre_representante VARCHAR(20)
);

CREATE TABLE Paises(
	id_pais INT PRIMARY KEY NOT NULL, 
    abreviatura VARCHAR(5)
);

CREATE TABLE Pie(
	id_pie INT PRIMARY KEY NOT NULL, 
    pie VARCHAR(20)
);

CREATE TABLE Demarcacion(
	id_demarcacion INT PRIMARY KEY NOT NULL, 
    demarcacion VARCHAR(20)
);

CREATE TABLE Equipos(
	id_equipo INT PRIMARY KEY NOT NULL,
    nombre_equipo VARCHAR(20),
    nombre_oficial VARCHAR(20),
    direccion VARCHAR(20),
    cp INT,
    id_provincia INT NOT NULL,
    pais VARCHAR(20),
    direccion_internet VARCHAR(20),
    email VARCHAR(20),
    penias VARCHAR(20),
    telefono BIGINT,
    fax BIGINT,
    otras_secciones VARCHAR(20),
    fecha_fundacion DATE,
    historia VARCHAR (500),
    himno VARCHAR (500),
    id_estadio INT NOT NULL, 
    localidad VARCHAR(20),
    CONSTRAINT fk_equipos_provincia FOREIGN KEY (id_provincia) REFERENCES Provincias (id_provincia),
    CONSTRAINT fk_equipos_estadio FOREIGN KEY (id_estadio) REFERENCES Estadios (id_estadio) 
);

CREATE TABLE Jugadores(
	id_jugador INT PRIMARY KEY NOT NULL, 
    nombre_futbolistico VARCHAR(20),
    nombre_jugador VARCHAR(20),
    apellidos_jugador VARCHAR(20),
    fecha_nacimiento DATE, 
    lugar_nacimiento VARCHAR(20),
    id_provincia INT NOT NULL, 
    id_pais INT NOT NULL, 
    id_pie INT NOT NULL,
    id_demarcacion INT NOT NULL, 
    id_situacion INT NOT NULL, 
    altura INT,
    peso INT, 
    cantera INT NOT NULL, 
    internacional VARCHAR(20),
    historial VARCHAR(20),
    id_representante INT NOT NULL, 
    pais_nacionalidad VARCHAR(20),
    retirado VARCHAR(20),
    CONSTRAINT fk_jug_provincia FOREIGN KEY (id_provincia) REFERENCES Provincias (id_provincia), 
    CONSTRAINT fk_jug_pais FOREIGN KEY (id_pais) REFERENCES Paises (id_pais),
    CONSTRAINT fk_jug_demarcacion FOREIGN KEY (id_demarcacion) REFERENCES Demarcacion (id_demarcacion),
    CONSTRAINT fk_jug_pie FOREIGN KEY (id_pie) REFERENCES Pie (id_pie),
    CONSTRAINT fk_jug_situacion FOREIGN KEY (id_situacion) REFERENCES SituacionNacionalidad (id_situacion), 
    CONSTRAINT fk_jug_cantera FOREIGN KEY (cantera) REFERENCES Equipos (id_equipo), 
    CONSTRAINT fk_jug_representante FOREIGN KEY (id_representante) REFERENCES Representantes (id_representante) 
);