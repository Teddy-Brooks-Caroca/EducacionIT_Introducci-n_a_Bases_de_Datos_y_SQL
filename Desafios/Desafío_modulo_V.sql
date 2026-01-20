/* =====================================================
   DESAFÍOS – INTRODUCCIÓN A SQL Y BASES DE DATOS
   DESAFÍO MÓDULO 5
   ===================================================== */


/* =====================================================
   EJERCICIO 1
   ===================================================== */

-- 1. Generar una lista en la que se muestren todos
-- los artistas y las canciones de la tabla TOP
-- SPOTIFY. El nombre de cada artista y el título
-- de la canción deben mostrarse separados con
-- un guion en una columna llamada CANCIÓN.
-- Utilizar la función CONCAT para llevar a cabo
-- este ejercicio. Ordenar la lista resultante de
-- forma alfabética por la columna CANCIÓN.
-- Esta consulta, además, debe mostrar el
-- campo GENERO.

SELECT
CONCAT(ARTISTA, ' - ', TITULO) CANCION,
GENERO
FROM TOP_SPOTIFY
ORDER BY CANCION;


-- 2. Modificar la consulta anterior para obtener el
-- mismo resultado con la función
-- CONCAT_WS.

SELECT
CONCAT_WS(' - ', ARTISTA, TITULO) CANCION,
GENERO
FROM TOP_SPOTIFY
ORDER BY CANCION;


-- 3. Modificar la consulta anterior para mostrar
-- los géneros en mayúsculas.

SELECT
CONCAT_WS(' - ', ARTISTA, TITULO) CANCION,
UPPER(GENERO) GENERO
FROM TOP_SPOTIFY
ORDER BY CANCION;


-- 4. Agregar a la consulta anterior una columna
-- con el nombre AÑOS en la que se calcule la
-- cantidad de años transcurridos desde que
-- se lanzó cada una de las canciones al
-- año actual.

SELECT
CONCAT_WS(' - ', ARTISTA, TITULO) CANCION,
UPPER(GENERO) GENERO,
YEAR(CURDATE()) - ANO AÑOS
FROM TOP_SPOTIFY
ORDER BY CANCION;


-- 5. Generar una consulta que calcule la cantidad
-- de registros que figuran en la tabla TOP
-- SPOTIFY. El resultado debe mostrarse en
-- una columna con el nombre CANCIONES.

SELECT
COUNT(*) CANCIONES
FROM TOP_SPOTIFY;


-- 6. Generar una consulta que muestre la cantidad de
-- canciones lanzadas al mercado por año.

SELECT
ANO,
COUNT(*) CANCIONES
FROM TOP_SPOTIFY
GROUP BY ANO;


-- 7. Modificar la consulta anterior para no mostrar
-- aquellos años en los que se hayan lanzado menos
-- de 50 canciones.

SELECT
ANO,
COUNT(*) CANCIONES
FROM TOP_SPOTIFY
GROUP BY ANO
HAVING CANCIONES >= 50;


/* =====================================================
   EJERCICIO 2
   ===================================================== */

-- 1. Utilizar la base de datos LIBRERIA y generar
-- una lista en la que se muestren todos los
-- autores y la provincia en la que nacieron.
-- El apellido y el nombre de cada autor deben
-- mostrarse separados con una coma y un
-- espacio en una columna llamada AUTOR.
-- Utilizar la función CONCAT para llevar a cabo
-- este ejercicio. Ordenar alfabéticamente los
-- apellidos resultantes.

SELECT
CONCAT(APELLIDO, ', ', NOMBRE) AUTOR,
PROVINCIA
FROM AUTORES
ORDER BY AUTOR;


-- 2. Modificar la consulta anterior para obtener el
-- mismo resultado con la función
-- CONCAT_WS.

SELECT
CONCAT_WS(', ', APELLIDO, NOMBRE) AUTOR,
PROVINCIA
FROM AUTORES
ORDER BY AUTOR;


-- 3. Modificar la consulta anterior para mostrar
-- los nombres de los autores en mayúsculas.

SELECT
UPPER(CONCAT_WS(', ', APELLIDO, NOMBRE)) AUTOR,
PROVINCIA
FROM AUTORES
ORDER BY AUTOR;


-- 4. Modificar la consulta anterior para mostrar
-- únicamente la inicial del nombre del autor
-- y su apellido.

SELECT
UPPER(CONCAT(APELLIDO, ', ', LEFT(NOMBRE, 1), '.')) AUTOR,
PROVINCIA
FROM AUTORES
ORDER BY AUTOR;


/* =====================================================
   FIN DESAFÍO MÓDULO 5
   ===================================================== */
