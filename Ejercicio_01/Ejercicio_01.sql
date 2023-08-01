CREATE DATABASE  IF NOT EXISTS actividadesDDL;
USE actividadesDDL;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------EJERCICIO 1--------------------------------------------------------------------------------------------------------
-- SQL CODE Ejercicio 1
CREATE TABLE ESTACIONES(
	id int auto_increment,
    latitud float,
    longitud float,
    altitud float,
    PRIMARY KEY(id)
);

CREATE TABLE MUESTRAS(
	id int auto_increment,
    id_estacion int,
    fecha date,
    temp_min float,
    temp_max float,
    precipitaciones float,
    humedad_min float,
    humedad_max float,
    vel_viento_max float,
    vel_viento_min float,
    PRIMARY KEY(id),
    FOREIGN KEY(id_estacion) REFERENCES ESTACIONES (id)
    ON DELETE cascade
    ON UPDATE cascade
);