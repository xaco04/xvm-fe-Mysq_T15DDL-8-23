CREATE DATABASE  IF NOT EXISTS actividadesDDL;
USE actividadesDDL;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------EJERCICIO 5------------------------------------------------------------------------------------------------------------
-- SQL CODE Ejercicio 5
DROP TABLE IF EXISTS ALMACENES;
CREATE TABLE ALMACENES (
    CODIGO int NOT NULL,
    LUGAR varchar(255) NOT NULL,
    CAPACIDAD int NOT NULL,
    PRIMARY KEY (CODIGO)
);

DROP TABLE IF EXISTS CAJAS;
CREATE TABLE CAJAS (
    NUMREFERENCIA varchar(255) NOT NULL,
    CONTENIDO varchar(255) NOT NULL,
    VALOR double NOT NULL,
    ALMACEN int NOT NULL,
    PRIMARY KEY (NUMREFERENCIA),
    KEY ALMACEN (ALMACEN),
    CONSTRAINT CAJAS_ibfk_1 FOREIGN KEY (ALMACEN) REFERENCES ALMACENES (CODIGO)
);
