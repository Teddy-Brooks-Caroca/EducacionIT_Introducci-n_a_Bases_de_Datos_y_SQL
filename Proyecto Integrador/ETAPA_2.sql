/* =====================================================
   PROYECTO INTEGRADOR – ETAPA 2
   Introducción a Bases de Datos y SQL
   ===================================================== */


/* =====================================================
   PASO 1
   ===================================================== */

-- 1. Crear una base de datos con el nombre TECNO_DB. En el caso de que la base de
--    datos exista previamente, eliminarla antes de iniciar el laboratorio.

DROP DATABASE IF EXISTS TECNO_DB;
CREATE DATABASE TECNO_DB;


-- 2. Poner en uso la base de datos generada en el paso anterior.
USE TECNO_DB;


-- 3. Importar y ejecutar el código SQL generado en el proyecto integrador anterior.

CREATE TABLE IF NOT EXISTS FACTURAS (
    FacturaID INT AUTO_INCREMENT NOT NULL UNIQUE,
    Letra CHAR(255) NOT NULL,
    Numero INT NOT NULL,
    ClienteID INT NOT NULL,
    Fecha DATE NOT NULL,
    Monto DECIMAL(10,0) NOT NULL,
    PRIMARY KEY (FacturaID)
);

CREATE TABLE IF NOT EXISTS ARTICULOS (
    ArticuloID INT AUTO_INCREMENT NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Precio DOUBLE NOT NULL,
    Stock INT NOT NULL,
    PRIMARY KEY (ArticuloID)
);

CREATE TABLE IF NOT EXISTS CLIENTES (
    ClienteID INT AUTO_INCREMENT NOT NULL UNIQUE,
    Nombre VARCHAR(25) NOT NULL,
    Apellido VARCHAR(25) NOT NULL,
    CUIT CHAR(16) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Comentarios VARCHAR(50) NOT NULL,
    PRIMARY KEY (ClienteID)
);

CREATE TABLE IF NOT EXISTS DETALLE (
    DetalleID INT AUTO_INCREMENT NOT NULL UNIQUE,
    ArticuloID INT NOT NULL,
    Cantidad INT NOT NULL,
    FacturaID INT NOT NULL,
    PRIMARY KEY (DetalleID)
);

ALTER TABLE FACTURAS
ADD CONSTRAINT FACTURAS_fk3
FOREIGN KEY (ClienteID) REFERENCES CLIENTES(ClienteID);

ALTER TABLE DETALLE
ADD CONSTRAINT DETALLE_fk1
FOREIGN KEY (ArticuloID) REFERENCES ARTICULOS(ArticuloID);

ALTER TABLE DETALLE
ADD CONSTRAINT DETALLE_fk3
FOREIGN KEY (FacturaID) REFERENCES FACTURAS(FacturaID);


-- 4. Crear una tabla con el nombre LOCALIDADES dentro de la base de datos y tomar en consideración la estructura definida
--    en la diapositiva.

CREATE TABLE LOCALIDADES (
    LOCALIDADID INT PRIMARY KEY,
    NOMBRE VARCHAR(40),
    CP VARCHAR(10),
    PROVINCIA VARCHAR(20)
);


-- 5. Mostrar un listado de todas las bases de datos alojadas en el servidor.
SHOW DATABASES;


-- 6. Mostrar un listado de todas las tablas generadas anteriormente dentro de la base
--    de datos con el nombre LABORATORIO.
SHOW TABLES;


-- 7. Comentar la instrucción que lista las tablas contenidas dentro de la base de
--    de datos LABORATORIO.
-- SHOW TABLES;


-- 8. Describir la estructura de la tabla CLIENTES.
DESC CLIENTES;



/* =====================================================
   PASO 2
   ===================================================== */

-- 1. Modificar la tabla FACTURAS tomando en cuenta las siguientes consideraciones:
--    a. Asignar la restricción UNSIGNED al campo Monto, manteniendo el tipo de dato ya definido para el campo.

ALTER TABLE FACTURAS
MODIFY Monto DOUBLE UNSIGNED;


-- 2. Modificar la tabla ARTICULOS tomando en cuenta las siguientes consideraciones:
--    a. Cambiar el tipo de dato del campo Nombre para que admita hasta 75 caracteres.
--    b. Asignar las restricciones UNSIGNED y NOT NULL al campo Precio, manteniendo
--       el tipo de dato ya definido para el campo.
--    d. Asignar las restricciones UNSIGNED y NOT NULL al campo Stock, manteniendo
--       el tipo de dato ya definido para el campo.

ALTER TABLE ARTICULOS
MODIFY Nombre VARCHAR(75),
MODIFY Precio DOUBLE UNSIGNED NOT NULL,
MODIFY Stock INT UNSIGNED NOT NULL;


-- 3. Modificar la tabla CLIENTES. Tomar en cuenta las siguientes consideraciones:
--    a. Cambiar el tipo de dato del campo Nombre para que admita hasta 30 caracteres y asigne la restricción correspondiente para
--       que su carga sea obligatoria.
--    b. Cambiar el tipo de dato del campo Apellido para que admita hasta 35 caracteres y asigne la restricción
--       correspondiente para que su carga sea obligatoria.
--    c. Cambiar el nombre del campo Comentarios por Observaciones y su tipo de dato para que admita hasta
--       255 caracteres.

ALTER TABLE CLIENTES
MODIFY Nombre VARCHAR(30) NOT NULL,
MODIFY Apellido VARCHAR(35) NOT NULL,
CHANGE Comentarios Observaciones VARCHAR(255);


-- 4. Crear un PROMPT para que la IA modifique el código que venimos desarrollando, de tal forma que se
--    relacionen las tablas CLIENTES y LOCALIDAD.

/*
"Modifica el código SQL que hemos desarrollado para establecer una relación entre las tablas CLIENTES y LOCALIDADES de la base de datos TECNO_DB. Sigue estos pasos:
Agrega un campo LOCALIDADID de tipo INT a la tabla CLIENTES para poder relacionar cada cliente con una localidad específica.
Establece una restricción de clave foránea (FOREIGN KEY) en la tabla CLIENTES que vincule el campo LOCALIDADID con el campo LOCALIDADID de la tabla LOCALIDADES.
Nombra la restricción de clave foránea como FK_CLIENTES_LOCALIDAD para mantener un estándar de nomenclatura consistente con las otras restricciones ya existentes en la base de datos.
Proporciona el código SQL completo y listo para ejecutar, con comentarios explicativos para cada paso."
*/


-- 5. Copiar y ejecutar el código generado por la IA para que se reflejen los
--    cambios en la base de datos.

ALTER TABLE CLIENTES
ADD COLUMN LOCALIDADID INT;

ALTER TABLE CLIENTES
ADD CONSTRAINT FK_CLIENTES_LOCALIDAD
FOREIGN KEY (LOCALIDADID) REFERENCES LOCALIDADES(LOCALIDADID);



/* =====================================================
   PASO 3
   ===================================================== */

-- 1. Cargar 5 registros en la tabla LOCALIDADES, tal como se detallan a continuación:

INSERT INTO LOCALIDADES (LOCALIDADID, NOMBRE, CP, PROVINCIA) VALUES
(1, 'Ciudad Autónoma de Buenos Aires', '1000', 'Buenos Aires'),
(2, 'Rosario', '2000', 'Santa Fe'),
(3, 'Córdoba', '5000', 'Córdoba'),
(4, 'San Miguel de Tucumán', '4000', 'Tucumán'),
(5, 'Neuquén', '8300', 'Neuquén');


-- 2. Cargar 5 registros en la tabla CLIENTES, tal como se detallan a continuación:

INSERT INTO CLIENTES
VALUES
(5, 'Santiago', 'González', '23-24582359-9', 'Uriburu 558 - 7ºA', 'VIP', 3),
(14, 'Gloria', 'Fernández', '23-35965852-5', 'Constitución 323', 'GBA', 1),
(17, 'Gonzalo', 'López', '23-33587416-0', 'Arias 2624', 'GBA', 5),
(26, 'Carlos', 'García', '23-42321230-9', 'Pasteur 322 - 2ºC', 'VIP', 2),
(50, 'Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 'GBA', 4);


-- 3. Cargar 4 registros en la tabla ARTICULOS, tal como se detallan a continuación:

INSERT INTO ARTICULOS
VALUES
(95, 'Webcam con Micrófono Plug & Play', 513.35, 39),
(157, 'Apple AirPods Pro', 979.75, 152),
(335, 'Lavasecarropas Automático Samsung', 1589.50, 12),
(411, 'Gloria Trevi / Gloria / CD+DVD', 2385.70, 2);


-- 4. Cargar 5 registros en la tabla FACTURAS, tal como se detallan a continuación:

INSERT INTO FACTURAS
VALUES
(1, 'A', 28, 14, '2021-03-18', 1589.50),
(2, 'A', 39, 26, '2021-04-12', 979.75),
(3, 'B', 8, 17, '2021-04-25', 513.35),
(4, 'B', 12, 5, '2021-05-01', 2385.70),
(5, 'B', 19, 50, '2022-05-26', 979.75);


-- 5. Adjuntar el archivo SQL con el código y realizar un prompt donde le
--    pedimos generar el código SQL para insertar 15 registros en la tabla
--    DETALLES.

/*
¿Podrías generar el código SQL para insertar 15 registros en la tabla DETALLES?
*/


-- 6. Copiar y ejecutar en la base de datos el código generado.

INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(335, 1, 1),
(157, 2, 1),
(95, 3, 1),
(411, 4, 1),
(157, 5, 1),
(95, 1, 2),
(157, 1, 1),
(95, 2, 1),
(335, 2, 1),
(95, 3, 2),
(157, 3, 1),
(335, 4, 1),
(95, 4, 1),
(157, 5, 1),
(95, 5, 2);


/* =====================================================
   FIN PROYECTO INTEGRADOR – ETAPA 2
   ===================================================== */


