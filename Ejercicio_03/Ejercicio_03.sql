CREATE DATABASE  IF NOT EXISTS actividadesDDL;
USE actividadesDDL;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------EJERCICIO 3--------------------------------------------------------------------------------------------------------
-- SQL CODE Ejercicio 3
DROP TABLE IF EXISTS FABRICANTES;
CREATE TABLE FABRICANTES (
    CODIGO int NOT NULL,
    NOMBRE varchar(255) NOT NULL,
    PRIMARY KEY (CODIGO)
);

DROP TABLE IF EXISTS ARTICULOS;
CREATE TABLE ARTICULOS (
    CODIGO int NOT NULL,
    NOMBRE varchar(255) NOT NULL,
    PRECIO decimal(10,0) NOT NULL,
    FABRICANTE int NOT NULL,
    PRIMARY KEY (CODIGO),
    KEY FABRICANTE (FABRICANTE),
    CONSTRAINT ARTICULOS_ibfk_1 FOREIGN KEY (FABRICANTE) REFERENCES FABRICANTES (CODIGO)
);

