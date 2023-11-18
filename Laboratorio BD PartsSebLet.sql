/* Paso 1 :Creamos la base de datos llamada Personal------------------*/
CREATE DATABASE PERSONAL;
/* Fin Paso 1---------------------------------------------------------*/

/*Paso 2:Usamos la base de datos PERSONAL*/
USE PERSONAL;

/*Paso 3: Generamos las tablas-------------------------------------------*/
CREATE TABLE empleados(
Clave_empleado varchar(8) NOT NULL,
nombre varchar(30),
apellidos varchar(30),
Clave_Depto int,
PRIMARY KEY(Clave_empleado)
) 

CREATE TABLE DEPARTAMENTO (
Clave_Depto int NOT NULL,
nombre varchar(30),
presupuesto int,
PRIMARY KEY(Clave_Depto)
)
/*Fin Paso 3---------------------------------------------------------------*/

/*Paso 4 : Llaves foraneas-------------------------------------------------*/
ALTER TABLE empleados add(
constraint FKCLAVDEPT foreign key (Clave_Depto)
references DEPARTAMENTO(Clave_Depto))
/*Fin Paso 4----------------------------------------------------------------*/

/*Paso 5: Ingreso de datos--------------------------------------------------*/
INSERT INTO DEPARTAMENTO VALUES (1,'Personal',80000);
INSERT INTO DEPARTAMENTO VALUES (2,'Almacen',70000);
INSERT INTO DEPARTAMENTO VALUES (3,'Contabilidad',60000);
INSERT INTO DEPARTAMENTO VALUES (4,'Manufactura',50000);
INSERT INTO DEPARTAMENTO VALUES (5,'Empaque',30000);

INSERT INTO empleados VALUES ('EMP01','Armando','Lopez',2);
INSERT INTO empleados VALUES ('EMP02','Tatiana','Vargas',1);
INSERT INTO empleados VALUES ('EMP03','Laura','Iturria',3);
INSERT INTO empleados VALUES ('EMP04','Juan','Perez',4);
INSERT INTO empleados VALUES ('EMP05','Ivan','Lopez',4);
INSERT INTO empleados VALUES ('EMP06','Margarita','Hernandez',1);
INSERT INTO empleados VALUES ('EMP07','Jesus','Perez',3);
INSERT INTO empleados VALUES ('EMP08','Tonatiuh','Flores',2);
INSERT INTO empleados VALUES ('EMP09','Juan','Lopez',4);
INSERT INTO empleados VALUES ('EMP10','Jose','Hernandez',5);

/*Fin Paso 5--------------------------------------------------------*/
SELECT * FROM departamento
/*Paso 6: Generar consultas-----------------------------------------*/

/* a.Obtener los nombres y apellidos de los empleados*/
SELECT nombre, apellidos FROM empleados;

/*b.Obtener los apellidos de los empleados sin repeticiones*/
SELECT DISTINCT apellidos FROM empleados;

/*c.Obtener todos los datos de los empleados que se apellidan 'Lopez'*/
SELECT * FROM empleados WHERE apellidos='Lopez';

/*d.Obtener todos los datos de los empleados que se apellidan ‘López’ y los que se apellidan
‘Pérez’*/
SELECT * FROM empleados WHERE apellidos='Lopez' OR apellidos='Perez';

/*e.Obtener el nombre y la clave de empleado de los trabajadores que trabajan en el
departamento 4.*/
SELECT nombre,Clave_empleado FROM empleados WHERE Clave_Depto=4;

/*f.Obtener todos los datos de los empleados que trabajan para el departamento 1 o 3
ordenados alfabéticamente por nombre*/
SELECT * FROM empleados WHERE Clave_Depto=1 OR Clave_Depto=3 ORDER BY nombre;

/*g.Obtener el nombre y apellidos de los empleados cuyo apellido comienza con ‘H’*/
SELECT nombre,apellidos FROM empleados WHERE apellidos LIKE 'H%';

/*h.Obtener los datos de los departamentos cuyo presupuesto esta entre $ 50,000 y $ 70,000*/
SELECT * FROM departamento WHERE presupuesto BETWEEN 50000 AND 70000;

/*i.Obtener la clave de empleado, nombres y apellidos de los empleados que trabajen en el
departamento de contabilidad*/

SELECT a.Clave_empleado , a.nombre,a.apellidos FROM empleados a
JOIN departamento d ON a.Clave_Depto = d.Clave_Depto
Where d.nombre = 'Contabilidad';

/*j.Obtener el nombre y apellidos, así como el nombre del departamento de cada uno de los
empleados que laboran en la empresa*/

SELECT a.nombre,a.apellidos, d.nombre FROM empleados a JOIN departamento d ON a.Clave_Depto = d.Clave_Depto;

/*Fin Paso 6------------------------------------------------*/


/*Paso 7: Generar vistas-------------------------------------*/

/*a. Una vista denominada Personal, con todos los datos de los empleados del departamento
de Personal.*/
CREATE VIEW PERSONAL AS SELECT * FROM empleados WHERE Clave_Depto=1;

SELECT * FROM personal;

/*b.Una vista denominada Pérez, con todos los empleados apellidados Pérez.*/
CREATE VIEW Perez AS SELECT * FROM empleados WHERE apellidos='Perez';

SELECT * FROM perez;

/*c.Una vista denominada Grandes presupuestos, con los departamentos que tienen, al menos,
Q50,000.00 de presupuesto.*/
CREATE VIEW Grandes_presupuestos AS SELECT * FROM departamento WHERE presupuesto >=50000;

SELECT * FROM grandes_presupuestos;

/*Fin Paso 7-----------------------------------------------*/