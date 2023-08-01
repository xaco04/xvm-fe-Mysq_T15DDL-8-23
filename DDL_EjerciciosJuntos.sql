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


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------EJERCICIO 4---------------------------------------------------------------------------------------------------------------
-- SQL CODE Ejercicio 4
DROP TABLE IF EXISTS DEPARTAMENTOS;
CREATE TABLE DEPARTAMENTOS(
    CODIGO int NOT NULL,
    NOMBRE varchar(255) NOT NULL,
    PRESUPUESTO decimal(10,0) NOT NULL,
    PRIMARY KEY (CODIGO)
);

DROP TABLE IF EXISTS EMPLEADOS;
CREATE TABLE EMPLEADOS (
    DNI int NOT NULL,
    NOMBRE varchar(255) NOT NULL,
    APELLIDOS varchar(255) NOT NULL,
    DEPARTAMENTO int NOT NULL,
    PRIMARY KEY (DNI),
    KEY DEPARTAMENTO (DEPARTAMENTO),
    CONSTRAINT EMPLEADOS_ibfk_1 FOREIGN KEY (DEPARTAMENTO) REFERENCES DEPARTAMENTOS (CODIGO)
);


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


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------EJERCICIO 12--------------------------------------------------------------------------------------------------------
-- SQL CODE Ejercicio 12
CREATE TABLE PROFESORES(
	dni varchar(8),
    nombre varchar(50) unique,
    apellido1 varchar(50),
    apellido2 varchar(50),
    direccion varchar(50),
    titulo varchar(50),
    gana float not null,
    PRIMARY KEY(dni)
);

CREATE TABLE CURSOS(
	cod_curso int auto_increment,
    nombre_curso varchar(50) unique,
    maximo_alumnos int,
    fecha_inicio date,
    fecha_fin date,
    num_horas int not null,
    dni_profesor varchar(8),
    PRIMARY KEY(cod_curso),
    FOREIGN KEY(dni_profesor) REFERENCES PROFESORES (dni)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE ALUMNOS(
	dni varchar(8),
    nombre varchar(50),
    apellido1 varchar(50),
    apellido2 varchar(50),
    direccion varchar(50),
    sexo enum('M', 'H'),
    fecha_nacimiento date,
    curso int not null,
    PRIMARY KEY(dni),
    FOREIGN KEY(curso) REFERENCES CURSOS (cod_curso)
    ON DELETE cascade
    ON UPDATE cascade
);