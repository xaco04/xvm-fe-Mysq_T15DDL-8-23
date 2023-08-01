CREATE DATABASE  IF NOT EXISTS actividadesDDL;
USE actividadesDDL;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------EJERCICIO 2--------------------------------------------------------------------------------------------------------
-- SQL CODE Ejercicio 2

CREATE TABLE EDITORIALES(
	clave_editorial smallint auto_increment,
    nombre varchar(60),
    direccion varchar(15),
	telefono varchar(15),
    PRIMARY KEY(clave_editorial)
);

CREATE TABLE LIBROS(
	clave_libro int auto_increment,
    titulo varchar(60),
    idioma varchar(15),
	formato varchar(15),
    clave_editorial smallint,
    PRIMARY KEY(clave_libro),
    FOREIGN KEY(clave_editorial) REFERENCES EDITORIALES (clave_editorial)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE TEMAS(
	clave_tema smallint auto_increment,
    nombre varchar(40),
    PRIMARY KEY(clave_tema)
);

CREATE TABLE AUTORES(
	clave_autor smallint auto_increment,
    nombre varchar(60),
    PRIMARY KEY(clave_autor)
);

CREATE TABLE EJEMPLARES(
	clave_ejemplar int auto_increment,
    clave_libro int,
    numero_orden smallint,
    edicion smallint,
    ubicacion varchar(15),
    categoria char,
    PRIMARY KEY(clave_ejemplar),
    FOREIGN KEY(clave_libro) REFERENCES LIBROS (clave_libro)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE SOCIOS(
	clave_socio int auto_increment,
    nombre varchar(60),
    direccion varchar(60),
    telefono varchar(15),
    categoria char,
    PRIMARY KEY(clave_socio)
);

CREATE TABLE PRESTAMOS(
	clave_socio int,
    clave_ejemplar int,
    numero_orden smallint,
	fecha_prestamo date,
    fecha_devolucion date,
    notas blob,
    PRIMARY KEY(clave_socio, clave_ejemplar),
    FOREIGN KEY(clave_socio) REFERENCES SOCIOS (clave_socio)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(clave_ejemplar) REFERENCES EJEMPLARES (clave_ejemplar)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE LIBROS_TEMAS(
	clave_libro int,
    clave_tema smallint,
    PRIMARY KEY(clave_libro, clave_tema),
    FOREIGN KEY(clave_libro) REFERENCES LIBROS (clave_libro)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(clave_tema) REFERENCES TEMAS (clave_tema)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE LIBROS_AUTORES(
	clave_libro int,
    clave_autor smallint,
    PRIMARY KEY(clave_libro, clave_autor),
    FOREIGN KEY(clave_libro) REFERENCES LIBROS (clave_libro)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY(clave_autor) REFERENCES AUTORES (clave_autor)
    ON DELETE cascade
    ON UPDATE cascade
);