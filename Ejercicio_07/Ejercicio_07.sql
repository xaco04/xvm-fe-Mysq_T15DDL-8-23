CREATE DATABASE  IF NOT EXISTS actividadesDDL;
USE actividadesDDL;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------EJERCICIO 7--------------------------------------------------------------------------------------------------------
-- SQL CODE Ejercicio 7
CREATE TABLE DESPACHOS (
    Numero INT,
    Capacidad INT,
    primary key(Numero)
);

CREATE TABLE DIRECTORES (
    DNI VARCHAR(8),
    NomApels NVARCHAR(255),
    DNIJefe VARCHAR(8),
    Despacho INT,
    primary key (DNI),
    FOREIGN KEY (DNIJefe) REFERENCES DIRECTORES(DNI),
    FOREIGN KEY (Despacho) REFERENCES DESPACHOS(Numero)
);
