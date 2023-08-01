CREATE DATABASE  IF NOT EXISTS actividadesDDL;
USE actividadesDDL;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------EJERCICIO 11--------------------------------------------------------------------------------------------------------
-- SQL CODE Ejercicio 11
CREATE TABLE FACULTAD (
    Codigo int,
    Nombre nvarchar(100),
    primary key(Codigo)
);
CREATE TABLE INVESTIGADORES (
    DNI varchar(8),
    NomApels nvarchar(255),
    Facultad int,
    primary key (DNI),
    FOREIGN KEY (Facultad) REFERENCES FACULTAD (Codigo)
);
CREATE TABLE EQUIPOS (
    NumSerie char(4),
    Nombre nvarchar(100),
    Facultad int,
    primary key(NumSerie),
    FOREIGN KEY (Facultad) REFERENCES FACULTAD (Codigo)
);

CREATE TABLE RESERVA (
    DNI varchar(8),
    NumSerie char(4),
    Comienzo datetime,
    Fin datetime,
    PRIMARY KEY (DNI, NumSerie),
    FOREIGN KEY (DNI) REFERENCES INVESTIGADORES (DNI),
    FOREIGN KEY (NumSerie) REFERENCES EQUIPOS (NumSerie)
);
