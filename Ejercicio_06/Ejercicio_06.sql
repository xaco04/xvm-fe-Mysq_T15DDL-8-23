CREATE DATABASE  IF NOT EXISTS actividadesDDL;
USE actividadesDDL;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------EJERCICIO 6------------------------------------------------------------------------------------------------------------
-- SQL CODE Ejercicio 6
DROP TABLE IF EXISTS PELICULAS;
CREATE TABLE PELICULAS (
    CODIGO int NOT NULL,
    NOMBRE varchar(255) NOT NULL,
    CALIFICACIONEDAD varchar(255) DEFAULT NULL,
    PRIMARY KEY (CODIGO)
);


DROP TABLE IF EXISTS SALAS;
CREATE TABLE SALAS (
    CODIGO int NOT NULL,
    NOMBRE varchar(255) NOT NULL,
    PELICULA int DEFAULT NULL,
    PRIMARY KEY (CODIGO),
    KEY PELICULA (PELICULA),
    CONSTRAINT SALAS_ibfk_1 FOREIGN KEY (PELICULA) REFERENCES PELICULAS (CODIGO)
);

