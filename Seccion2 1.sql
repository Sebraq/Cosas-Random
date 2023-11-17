/* Paso 1 :Creacion de la base de datos*/
CREATE DATABASE Hoteles;

/* Paso 2 :Uso de la base de datos*/
USE Hoteles;

/* Paso 3 :Creacion de tablas*/
CREATE TABLE CLIENTE(
	NUM_CLIENTE INT NOT NULL,
    NOMBRE VARCHAR(20),
    NIF VARCHAR(9),
    DOMICILIO VARCHAR(50),
    LOCALIDAD VARCHAR(50),
    PROVINCIA VARCHAR(50),
    COD_POSTAL VARCHAR(50),
    PRIMARY KEY (NUM_CLIENTE)
);

CREATE TABLE HOTEL(
	NUM_HOTEL INT NOT NULL,
    NOMBRE VARCHAR(50),
    CATEGORIA VARCHAR(50),
    DOMICILIO VARCHAR(50),
    LOCALIDAD VARCHAR(50),
    PROVINCIA VARCHAR(50),
    COD_POSTAL VARCHAR(5),
    TELEFONO VARCHAR(9),
    PRIMARY KEY (NUM_HOTEL)
);

CREATE TABLE TIPO_HABITACION(
	NUM_TIPOHAB INT NOT NULL,
    NUM_HOTEL INT NOT NULL,
    NOMBRE VARCHAR(20),
    DESCRIPCION VARCHAR(50),
    CANTIDAD INT,
    MAX_OCUPANTES INT,
    PRECIO FLOAT,
    PRIMARY KEY (NUM_TIPOHAB)
);


CREATE TABLE RESERVA(
	NUM_RESERVA INT NOT NULL,
    NUM_CLIENTE INT NOT NULL,
    NUM_TIPOHAB INT NOT NULL, 
    CANTIDAD INT,
    FECHA_INI DATE,
    FECHA_FIN DATE,
    PRIMARY KEY (NUM_RESERVA)
);
/* Paso 4 :Asignacion de llaves foraneas*/
ALTER TABLE TIPO_HABITACION add(
constraint FK_tipoHotel foreign key (NUM_HOTEL)
references HOTEL(NUM_HOTEL))

ALTER TABLE RESERVA add(
constraint  fk_reservacliente foreign key (NUM_CLIENTE)
references CLIENTE(NUM_CLIENTE))

ALTER TABLE RESERVA add(
constraint FK_reservatipohab foreign key (NUM_TIPOHAB)
references TIPO_HABITACION(NUM_TIPOHAB))

/* Paso 5 :Insertamos los datos a nuestras tablas*/
INSERT INTO CLIENTE (NUM_CLIENTE, NOMBRE, NIF, DOMICILIO, LOCALIDAD, PROVINCIA, COD_POSTAL)
VALUES
  (1, 'Cliente11', '123456789', 'Calle A, 12312', 'Ciudad AD', 'Provincia AA', '1234325'),
  (2, 'Cliente22', '987654321', 'Calle B, 45456', 'Ciudad BC', 'Provincia XB', '54321'),
  (3, 'Cliente33', '111222333', 'Calle C, 72389', 'Ciudad CZ', 'Provincia CX', '67890'),
  (4, 'Cliente44', '444555666', 'Calle D, 012152', 'Ciudad JD', 'Provincia D', '01234'),
  (5, 'Cliente55', '777888999', 'Calle E, 345', 'Ciudad UE', 'Provincia ES', '34567'),
  (6, 'Cliente66', '000111222', 'Calle F, 6728', 'Ciudad OF', 'Provincia FD', '89012'),
  (7, 'Cliente77', '333444555', 'Calle G, 9051', 'Ciudad GJ', 'Provincia GS', '90123'),
  (8, 'Cliente89', '666777888', 'Calle H, 234D', 'Ciudad HR', 'Provincia HD', '23456');

INSERT INTO HOTEL (NUM_HOTEL, NOMBRE, CATEGORIA, DOMICILIO, LOCALIDAD, PROVINCIA, COD_POSTAL, TELEFONO)
VALUES
  (1, 'Hotel A1', 'Categoría A', 'Calle Principal 1', 'Ciudad A', 'Provincia A', '12345', '123456789'),
  (2, 'Hotel A2', 'Categoría A', 'Calle Principal 2', 'Ciudad B', 'Provincia B', '54321', '987654321'),
  (3, 'Hotel C1', 'Categoría C', 'Calle Central 1', 'Ciudad C', 'Provincia C', '67890', '111222333'),
  (4, 'Hotel C2', 'Categoría C', 'Calle Central 2', 'Ciudad D', 'Provincia D', '01234', '444555666'),
  (5, 'Hotel C3', 'Categoría C', 'Calle Central 3', 'Ciudad E', 'Provincia E', '34567', '777888999'),
  (6, 'Hotel B1', 'Categoría B', 'Calle Secundaria 1', 'Ciudad F', 'Provincia F', '89012', '000111222'),
  (7, 'Hotel B2', 'Categoría B', 'Calle Secundaria 2', 'Ciudad G', 'Provincia G', '90123', '333444555');

INSERT INTO TIPO_HABITACION (NUM_TIPOHAB, NUM_HOTEL, NOMBRE, DESCRIPCION, CANTIDAD, MAX_OCUPANTES, PRECIO)
VALUES
  (1, 1, 'Simple', 'Habitación individual', 20, 1, 50.0),
  (2, 1, 'Doble', 'Habitación doble', 30, 2, 80.0),
  (3, 1, 'Triple', 'Habitación triple', 20, 3, 100.0),
  (4, 2, 'Simple', 'Habitación individual', 20, 1, 55.0),
  (5, 2, 'Doble', 'Habitación doble', 30, 2, 90.0),
  (6, 2, 'Triple', 'Habitación triple', 20, 3, 110.0),
  (7, 3, 'Simple', 'Habitación individual', 20, 1, 60.0),
  (8, 3, 'Doble', 'Habitación doble', 30, 2, 95.0),
  (9, 3, 'Triple', 'Habitación triple', 20, 3, 120.0),
  (10, 4, 'Simple', 'Habitación individual', 20, 1, 50.0),
  (11, 4, 'Doble', 'Habitación doble', 30, 2, 80.0),
  (12, 4, 'Triple', 'Habitación triple', 20, 3, 100.0),
  (13, 5, 'Simple', 'Habitación individual', 20, 1, 55.0),
  (14, 5, 'Doble', 'Habitación doble', 30, 2, 90.0),
  (15, 5, 'Triple', 'Habitación triple', 20, 3, 110.0),
  (16, 6, 'Simple', 'Habitación individual', 20, 1, 60.0),
  (17, 6, 'Doble', 'Habitación doble', 30, 2, 95.0),
  (18, 6, 'Triple', 'Habitación triple', 20, 3, 120.0),
  (19, 7, 'Simple', 'Habitación individual', 20, 1, 50.0),
  (20, 7, 'Doble', 'Habitación doble', 30, 2, 80.0),
  (21, 7, 'Triple', 'Habitación triple', 20, 3, 100.0);

INSERT INTO RESERVA (NUM_RESERVA, NUM_CLIENTE, NUM_TIPOHAB, CANTIDAD, FECHA_INI, FECHA_FIN)
VALUES
  (1, 1, 1, 2, '2023-12-01', '2023-12-05'),
  (2, 2, 2, 1, '2023-12-10', '2023-12-15'),
  (3, 3, 5, 3, '2023-12-20', '2023-12-25'),
  (4, 4, 8, 2, '2023-12-05', '2023-12-10'),
  (5, 5, 11, 1, '2023-12-01', '2023-12-05'),
  (6, 6, 14, 2, '2023-12-10', '2023-12-15'),
  (7, 7, 17, 1, '2023-12-20', '2023-12-25'),
  (8, 8, 20, 3, '2023-12-05', '2023-12-10');

/* Paso 6 :Verificamos los datos de nuestras tablas*/
SELECT * FROM CLIENTE;
SELECT * FROM HOTEL;
SELECT * FROM TIPO_HABITACION;
SELECT * FROM RESERVA;

/* Paso 7 :hacemos las consultas*/

/*--Consulta 1:*/
SELECT HOTEL.NOMBRE,HOTEL.CATEGORIA,CLIENTE.NOMBRE
FROM HOTEL
JOIN TIPO_HABITACION ON HOTEL.NUM_HOTEL = TIPO_HABITACION.NUM_HOTEL
JOIN RESERVA ON TIPO_HABITACION.NUM_TIPOHAB = RESERVA.NUM_TIPOHAB
JOIN CLIENTE ON RESERVA.NUM_CLIENTE = CLIENTE.NUM_CLIENTE;

/*--Consulta 2: */
SELECT HOTEL.CATEGORIA, COUNT(DISTINCT RESERVA.NUM_CLIENTE) AS TOTAL_HUESPEDES
FROM HOTEL
JOIN TIPO_HABITACION ON HOTEL.NUM_HOTEL = TIPO_HABITACION.NUM_HOTEL
JOIN RESERVA ON TIPO_HABITACION.NUM_TIPOHAB = RESERVA.NUM_TIPOHAB
GROUP BY HOTEL.CATEGORIA;
