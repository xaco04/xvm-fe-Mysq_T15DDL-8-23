CREATE DATABASE  IF NOT EXISTS actividadesDDL;
USE actividadesDDL;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------EJERCICIO 10--------------------------------------------------------------------------------------------------------
-- SQL CODE Ejercicio 10
CREATE TABLE PRODUCTOS (
    Codigo int,
    Nombre nvarchar(100),
    Precio int,
    primary key (Codigo)
);
CREATE TABLE CAJEROS (
    Codigo int,
    NomApels nvarchar(255),
    primary key(Codigo)
);
CREATE TABLE MAQUINAS_REGISTRADORAS (
    Codigo int,
    Piso int,
    primary key(Codigo)
);
CREATE TABLE VENTA (
    Cajero int,
    Maquina int,
    Producto int,
    PRIMARY KEY (Cajero, Maquina, Producto),
    FOREIGN KEY (Cajero) REFERENCES CAJEROS (Codigo),
    FOREIGN KEY (Maquina) REFERENCES MAQUINAS_REGISTRADORAS (Codigo),
    FOREIGN KEY (Producto) REFERENCES PRODUCTOS (Codigo)
);
