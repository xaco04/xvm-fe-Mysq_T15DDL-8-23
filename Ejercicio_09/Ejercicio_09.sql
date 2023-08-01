CREATE DATABASE  IF NOT EXISTS actividadesDDL;
USE actividadesDDL;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------EJERCICIO 9--------------------------------------------------------------------------------------------------------
-- SQL CODE Ejercicio 9
CREATE TABLE CIENTIFICOS (
    DNI varchar(8),
    NomApels nvarchar(255),
    primary key (DNI)
);
CREATE TABLE PROYECTO (
    Id char(4),
    Nombre nvarchar(255),
    Horas int,
    primary key(Id)
);
CREATE TABLE ASIGNADO_A (
    Cientifico varchar(8),
    Proyecto char(4),
    PRIMARY KEY (Cientifico, Proyecto),
    FOREIGN KEY (Cientifico) REFERENCES CIENTIFICOS (DNI),
    FOREIGN KEY (Proyecto) REFERENCES PROYECTO (Id)
);

