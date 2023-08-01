CREATE DATABASE  IF NOT EXISTS actividadesDDL;
USE actividadesDDL;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------EJERCICIO 4---------------------------------------------------------------------------------------------------------------
-- SQL CODE Ejercicio 4
DROP TABLE IF EXISTS DEPARTAMENTOS;
CREATE TABLE DEPARTAMENTOS(
    CODIGO int NOT NULL,
    NOMBRE varchar(255) NOT NULL,
    PRESUPUESTO decimal(10,0) NOT NULL,
    PRIMARY KEY (CODIGO)
);

DROP TABLE IF EXISTS EMPLEADOS;
CREATE TABLE EMPLEADOS (
    DNI int NOT NULL,
    NOMBRE varchar(255) NOT NULL,
    APELLIDOS varchar(255) NOT NULL,
    DEPARTAMENTO int NOT NULL,
    PRIMARY KEY (DNI),
    KEY DEPARTAMENTO (DEPARTAMENTO),
    CONSTRAINT EMPLEADOS_ibfk_1 FOREIGN KEY (DEPARTAMENTO) REFERENCES DEPARTAMENTOS (CODIGO)
);

