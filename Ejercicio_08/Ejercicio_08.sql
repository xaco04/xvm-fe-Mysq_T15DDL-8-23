CREATE DATABASE  IF NOT EXISTS actividadesDDL;
USE actividadesDDL;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------EJERCICIO 8--------------------------------------------------------------------------------------------------------
-- SQL CODE Ejercicio 8
CREATE TABLE PIEZAS (
    Codigo INT,
    Nombre NVARCHAR(100),
    primary key (Codigo)
);
CREATE TABLE PROVEEDORES (
    Id CHAR(4),
    Nombre NVARCHAR(100),
    primary key (Id)
);
CREATE TABLE SUMINISTRA (
    CodigoPieza INT,
    IdProveedor CHAR(4),
    Precio INT,
    PRIMARY KEY (CodigoPieza, IdProveedor),
    FOREIGN KEY (CodigoPieza) REFERENCES PIEZAS(Codigo),
    FOREIGN KEY (IdProveedor) REFERENCES PROVEEDORES(Id)
);