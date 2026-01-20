/* =====================================================
   DESAFÍOS – INTRODUCCIÓN A SQL Y BASES DE DATOS
   DESAFÍO MÓDULO 3
   ===================================================== */


/* =====================================================
   EJERCICIO 1
   ===================================================== */

-- 1. Generar una consulta de actualización en la que se modifique el nombre del autor de
--    apellido ECHEVERRÍA por Esteban. Tener en cuenta que se debe modificar el nombre
--    de este autor y no su apellido.

SET SQL_SAFE_UPDATES = 0;

UPDATE AUTORES
SET NOMBRE = 'Esteban'
WHERE APELLIDO = 'ECHEVERRÍA';


-- 2. Agregar a la tabla EMPLEADOS una columna con el nombre PERMANENCIA. Completar
--    la columna con la antigüedad (expresada en años) con 2 para cada uno de ellos.

ALTER TABLE EMPLEADOS
ADD PERMANENCIA INT;

UPDATE EMPLEADOS
SET PERMANENCIA = 2;


-- 3. Agregar a la tabla LIBROS una columna llamada PRECIO_PÚBLICO. A continuación,
--    completar la columna con el precio de venta al público de cada libro, agregándole un 21%
--    en concepto de IVA a los precios originales.

ALTER TABLE LIBROS
ADD PRECIO_PUBLICO FLOAT;

UPDATE LIBROS
SET PRECIO_PUBLICO = PRECIO * 1.21;


/* =====================================================
   EJERCICIO 2
   ===================================================== */

-- 1. Generar una tabla nueva y nombrarla como EMPLEADOS_ANTERIORES, a partir de la
--    tabla EMPLEADOS. Tomar todos los campos de la tabla original. Luego, volcar en la tabla
--    nueva los empleados cuyos apellidos sean THOMAS, PEREIRA y DEVO. Una vez
--    copiados estos 3 empleados en la tabla nueva, eliminarlos de la tabla original
--    (EMPLEADOS).

CREATE TABLE EMPLEADOS_ANTERIORES
SELECT *
FROM EMPLEADOS
WHERE APELLIDO IN ('THOMAS', 'PEREIRA', 'DEVO');

DELETE FROM EMPLEADOS
WHERE APELLIDO IN ('THOMAS', 'PEREIRA', 'DEVO');


-- 2. Copiar a la tabla EMPLEADOS_ANTERIORES al empleado de apellido CRUZ desde la tabla
--    EMPLEADOS. Una vez copiado a la tabla nueva, eliminarlo de la original.

INSERT INTO EMPLEADOS_ANTERIORES
(EMPLEADO_ID, NOMBRE, APELLIDO, PUESTO_ID, EDITORIAL_ID, FECHA_INGRESO, PERMANENCIA)
SELECT
EMPLEADO_ID, NOMBRE, APELLIDO, PUESTO_ID, EDITORIAL_ID, FECHA_INGRESO, PERMANENCIA
FROM EMPLEADOS
WHERE APELLIDO = 'CRUZ';

DELETE FROM EMPLEADOS
WHERE APELLIDO = 'CRUZ';


/* =====================================================
   FIN DESAFÍO MÓDULO 3
   ===================================================== */



