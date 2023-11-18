/*Paso 1:Creamos la Base de datos*/
CREATE DATABASE Fuchibol;

/*Paso 2:Usamos la base de datos creada*/
USE Fuchibol;

/*Paso 3:Creamos las tablas de la base de datos*/
CREATE TABLE Estadios (
    id_estadio INT NOT NULL,
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
    localidad VARCHAR(20),
    PRIMARY KEY (id_estadio)
);

CREATE TABLE Provincias (
	id_provincia INT NOT NULL, 
    nombre_provincia VARCHAR(20),
    PRIMARY KEY (id_provincia)
);

CREATE TABLE SituacionNacionalidad (
	id_situacion INT NOT NULL,
    situacion VARCHAR(20),
    PRIMARY KEY (id_situacion)
);

CREATE TABLE Representantes (
	id_representante INT NOT NULL, 
    nombre_representante VARCHAR(20),
    PRIMARY KEY (id_representante)
);

CREATE TABLE Paises(
	id_pais INT NOT NULL, 
    abreviatura VARCHAR(5),
    PRIMARY KEY (id_pais)
);

CREATE TABLE Pie(
	id_pie INT NOT NULL, 
    pie VARCHAR(20),
    PRIMARY KEY (id_pie)
);

CREATE TABLE Demarcacion(
	id_demarcacion INT NOT NULL, 
    demarcacion VARCHAR(20),
    PRIMARY KEY (id_demarcacion)
);

CREATE TABLE Equipos(
	id_equipo INT NOT NULL,
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
    PRIMARY KEY (id_equipo)
);

CREATE TABLE Jugadores(
	id_jugador INT NOT NULL, 
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
    PRIMARY KEY (id_jugador)
);

/*Paso 4:Llaves foraneas*/
ALTER TABLE Equipos add(constraint FK_equiposProv foreign key (id_provincia) references Provincias (id_provincia))
ALTER TABLE Equipos add(constraint FK_equiposEstadio foreign key (id_estadio) references Estadios (id_estadio))
ALTER TABLE Jugadores add(constraint FK_jugProvincia FOREIGN KEY (id_provincia) REFERENCES Provincias (id_provincia))
ALTER TABLE Jugadores add(constraint FK_jugPais FOREIGN KEY (id_pais) REFERENCES Paises (id_pais))
ALTER TABLE Jugadores add(constraint FK_jugDemarcacion FOREIGN KEY (id_demarcacion) REFERENCES Demarcacion (id_demarcacion))
ALTER TABLE Jugadores add(constraint FK_jugPie FOREIGN KEY (id_pie) REFERENCES Pie (id_pie))
ALTER TABLE Jugadores add(constraint FK_jugSituacion FOREIGN KEY (id_situacion) REFERENCES SituacionNacionalidad (id_situacion))
ALTER TABLE Jugadores add(constraint FK_jugCantera FOREIGN KEY (cantera) REFERENCES Equipos (id_equipo))
ALTER TABLE Jugadores add(constraint FK_jugRepresentante FOREIGN KEY (id_representante) REFERENCES Representantes (id_representante))



