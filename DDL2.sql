CREATE DATABASE BANCOS;

USE BANCOS;

CREATE TABLE CLIENTES 
    ( 
     cedula VARCHAR (15)  NOT NULL , 
     nombre VARCHAR (30)  NOT NULL , 
     ciudad VARCHAR (30)  NOT NULL , 
     telefono VARCHAR (15)  NOT NULL 
    );

CREATE TABLE CLI_CUENTAS 
    ( 
     ced_cliente VARCHAR (15)  NOT NULL , 
     nro_cuenta INTEGER  NOT NULL 
    );

CREATE TABLE CLI_PRESTAMOS 
    ( 
     ced_cliente VARCHAR (15)  NOT NULL , 
     nro_prestamo INTEGER  NOT NULL 
    );

CREATE TABLE CUENTAS 
    ( 
     nro_cuenta INTEGER  NOT NULL , 
     saldo REAL  NOT NULL , 
     cod_suc INTEGER  NOT NULL 
    );

CREATE TABLE PRESTAMOS 
    ( 
     nro_prestamo INTEGER  NOT NULL , 
     valor REAL  NOT NULL , 
     saldo REAL  NOT NULL , 
     cod_suc INTEGER  NOT NULL 
    );

CREATE TABLE SUCURSALES 
    ( 
     codigo INTEGER  NOT NULL , 
     nombre VARCHAR (30)  NOT NULL , 
     ciudad VARCHAR (30)  NOT NULL , 
     activo REAL  NOT NULL 
    );
CREATE TABLE TRANSACCIONES(
id_transaccion int NOT NULL,
tipo_transaccion varchar(20) NOT NULL,
fecha_transaccion date NOT NULL,
monto int NOT NULL,
cuenta_origen int NOT NULL,
cuenta_destino int NOT NULL,
PRIMARY KEY (id_transaccion));

ALTER TABLE TRANSACCIONES
    ADD CONSTRAINT FK_cuenORIG FOREIGN KEY(cuenta_origen) 
    REFERENCES CUENTAS(nro_cuenta);
    
ALTER TABLE TRANSACCIONES
    ADD CONSTRAINT FK_cuenDEST FOREIGN KEY(cuenta_destino) 
    REFERENCES CUENTAS(nro_cuenta);
    
ALTER TABLE PRESTAMOS 
    ADD CONSTRAINT PRESTAMO_PK PRIMARY KEY ( nro_prestamo ) ;
    
ALTER TABLE CUENTAS 
    ADD CONSTRAINT CUENTA_PK PRIMARY KEY ( nro_cuenta ) ;
    
ALTER TABLE CLI_PRESTAMOS 
    ADD CONSTRAINT CLI_PRES_PK PRIMARY KEY ( ced_cliente, nro_prestamo ) ;

ALTER TABLE CLI_CUENTAS 
    ADD CONSTRAINT CLI_CUENTA_PK PRIMARY KEY ( nro_cuenta, ced_cliente ) ;

ALTER TABLE CLIENTES 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY (cedula ) ;
    
ALTER TABLE SUCURSALES 
    ADD CONSTRAINT SUCURSAL_PK PRIMARY KEY ( codigo ) ;

ALTER TABLE CLI_CUENTAS 
    ADD CONSTRAINT CLI_CUENTA_CLIENTE_FK FOREIGN KEY(ced_cliente) 
    REFERENCES CLIENTES 
    (cedula);

ALTER TABLE CLI_CUENTAS 
    ADD CONSTRAINT CLI_CUENTA_CUENTA_FK FOREIGN KEY(nro_cuenta) 
    REFERENCES CUENTAS (nro_cuenta);

ALTER TABLE CLI_PRESTAMOS 
    ADD CONSTRAINT CLI_PRES_CLIENTE_FK FOREIGN KEY (ced_cliente) 
    REFERENCES CLIENTES(cedula);

ALTER TABLE CLI_PRESTAMOS 
    ADD CONSTRAINT CLI_PRES_PRESTAMO_FK FOREIGN KEY(nro_prestamo) 
    REFERENCES PRESTAMOS (nro_prestamo);

ALTER TABLE CUENTAS 
    ADD CONSTRAINT CUENTA_SUCURSAL_FK FOREIGN KEY(cod_suc) 
    REFERENCES SUCURSALES(codigo);

ALTER TABLE PRESTAMOS 
    ADD CONSTRAINT PRESTAMO_SUCURSAL_FK FOREIGN KEY(cod_suc)
    REFERENCES SUCURSALES(codigo);
    
    


INSERT INTO clientes  VALUES (67, 'Monica Rojas', 'Medellin','123');
INSERT INTO clientes  VALUES (71, 'Francisco Sanchez', 'Cali','567');
INSERT INTO clientes  VALUES (78, 'Andres Castellanos', 'Medellin','568');


INSERT INTO sucursales VALUES (10, 'Poblado', 'Medellin',100000);
INSERT INTO sucursales VALUES (20, 'San Diego', 'Medellin',100000);
INSERT INTO sucursales VALUES (30, 'Exito', 'Medellin',100000);
INSERT INTO sucursales VALUES (40, 'Parque', 'Envigado',500000);
INSERT INTO sucursales VALUES (50, 'Exito', 'Envigado',1000000);
INSERT INTO sucursales VALUES (60, 'Exito', 'Bogota',200000);
INSERT INTO sucursales VALUES (70, 'Centro', 'Bogota',500000);

INSERT INTO cuentas VALUES (1, 10000, 10);
INSERT INTO cuentas VALUES (2, 10000, 20);
INSERT INTO cuentas VALUES (3, 10000, 20);
INSERT INTO cuentas VALUES (4, 10000, 40);
INSERT INTO cuentas VALUES (5, 10000, 50);
INSERT INTO cuentas VALUES (6, 10000, 10);
INSERT INTO cuentas VALUES (7, 10000, 10);




INSERT INTO cli_cuentas VALUES (71,1);
INSERT INTO cli_cuentas VALUES (67,2);
INSERT INTO cli_cuentas VALUES (71,3);
INSERT INTO cli_cuentas VALUES (67,4);
INSERT INTO cli_cuentas VALUES (67,6);
INSERT INTO cli_cuentas VALUES (67,7);
INSERT INTO cli_cuentas VALUES (78,7);

INSERT INTO prestamos VALUES (11, 10000, 3000,30);
INSERT INTO prestamos VALUES (22, 100000, 30000,10);
INSERT INTO prestamos VALUES (33, 100000, 30000,40);

INSERT INTO cli_prestamos VALUES (78,11);
INSERT INTO cli_prestamos VALUES (71,22);
INSERT INTO cli_prestamos VALUES (78,22);
INSERT INTO cli_prestamos VALUES (78,33);

INSERT INTO clientes  VALUES (89, 'Hubert Gold', 'Bogota','177');
INSERT INTO clientes  VALUES (97, 'Luis Diaz', 'Medellin','666');

--Cuenta cliente 89
INSERT INTO cuentas VALUES (8, 10000, 60);
INSERT INTO cuentas VALUES (9, 10000, 60);

--Cuenta cliente 97
INSERT INTO cuentas VALUES (10, 10000, 10);
INSERT INTO cuentas VALUES (11, 10000, 10);

--Relacion cliente 89 a cuentas
INSERT INTO cli_cuentas VALUES (89,8);
INSERT INTO cli_cuentas VALUES (89,9);

--Relacion cliente 97 a cuentas
INSERT INTO cli_cuentas VALUES (97,10);
INSERT INTO cli_cuentas VALUES (97,11);


--Realizar prestamos del cliente 89
INSERT INTO prestamos VALUES (12, 10000, 3000,60);

--Realizar prestamos del cliente 97
INSERT INTO prestamos VALUES (62, 10000, 3600,10);

--Formar una relacion entre el cliente y el prestamo:
--Cliente 89
INSERT INTO cli_prestamos VALUES (89,12);
--Cliente 97
INSERT INTO cli_prestamos VALUES (97,62);

SELECT * FROM cli_cuentas
SELECT * FROM cli_prestamos
SELECT * FROM clientes
SELECT * FROM cuentas
SELECT * FROM prestamos
SELECT * FROM sucursales

