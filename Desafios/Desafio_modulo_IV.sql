/* =====================================================
   DESAFÍO MODULO IV
   Introducción a Bases de Datos y SQL
   ===================================================== */


/* =====================================================
   EJERCICIO I
   ===================================================== */

USE Laboratorio_db;

-- 1. Mostrar una lista de clientes con su nombre, apellido, localidad y provincia.
SELECT 
    Cliente.Nombre AS NombreCliente,
    Cliente.Apellido,
    Localidad.Nombre AS NombreLocalidad,
    Provincia.Nombre AS NombreProvincia
FROM Cliente
JOIN Localidad ON Cliente.Localidad_ID = Localidad.ID
JOIN Provincia ON Localidad.Provincia_ID = Provincia.ID;


-- 2. Mostrar una lista de movimientos con la letra del movimiento, la fecha,
--    el nombre del cliente, el nombre del artículo, la cantidad y el valor.
SELECT 
    Movimiento.Letra,
    Movimiento.Fecha,
    Cliente.Nombre AS NombreCliente,
    Cliente.Apellido,
    Articulo.Nombre AS NombreArticulo,
    Items.Cantidad,
    Items.Valor
FROM Movimiento
JOIN Cliente ON Movimiento.Cliente_ID = Cliente.ID
JOIN Items ON Movimiento.ID = Items.Movimiento_ID
JOIN Articulo ON Items.Articulo_ID = Articulo.ID;


-- 3. Mostrar una lista de localidades con su nombre y el nombre de la provincia a la que pertenecen.
SELECT 
    Localidad.Nombre AS NombreLocalidad,
    Provincia.Nombre AS NombreProvincia
FROM Localidad
JOIN Provincia ON Localidad.Provincia_ID = Provincia.ID;


-- 4. Mostrar una lista de clientes con su nombre, apellido y los movimientos asociados a ellos.
SELECT 
    Cliente.Nombre AS NombreCliente,
    Cliente.Apellido,
    Movimiento.Letra,
    Movimiento.Fecha
FROM Cliente
JOIN Movimiento ON Cliente.ID = Movimiento.Cliente_ID;


-- 5. Mostrar los artículos vendidos en un movimiento específico (por ejemplo, ID = 1).
SELECT 
    Articulo.Nombre AS NombreArticulo,
    Items.Cantidad,
    Items.Valor
FROM Items
JOIN Articulo ON Items.Articulo_ID = Articulo.ID
WHERE Items.Movimiento_ID = 1;



/* =====================================================
   EJERCICIO II
   ===================================================== */

USE BONUS_TRACK;

-- 1. A través del uso de la tabla ÚLTIMOS LANZAMIENTOS, obtener una lista de
--    todos aquellos temas lanzados durante el último año (año más alto que figure en la tabla).
--    En el resultado de la consulta, mostrar solo las columnas ARTISTA y TÍTULO.
--    Ordenar alfabéticamente el resultado por los nombres de los artistas;
--    en el caso de que un mismo artista haya tenido más de un lanzamiento,
--    organizar el resultado por los títulos de esos lanzamientos.
SELECT 
    ARTISTA,
    TITULO
FROM ULTIMOS_LANZAMIENTOS
WHERE ANO = (SELECT MAX(ANO) FROM ULTIMOS_LANZAMIENTOS)
ORDER BY ARTISTA, TITULO;


-- 2. A través del uso de la tabla TOP SPOTIFY, obtener una lista de todos aquellos
--    lanzamientos correspondientes a LADY GAGA con mayor permanencia en la plataforma digital.
--    En el resultado de la consulta, solo mostrar los títulos de las canciones de la artista.
--    Ordenar el resultado alfabéticamente por los títulos de las canciones.
SELECT 
    TITULO
FROM TOP_SPOTIFY
WHERE ARTISTA = 'LADY GAGA'
  AND PERMANENCIA = (SELECT MAX(PERMANENCIA) FROM TOP_SPOTIFY)
ORDER BY TITULO;


-- 3. Utiliza la tabla TOP SPOTIFY y genera una consulta que muestre los campos ARTISTA y TÍTULO.
--    Agregar una columna con el nombre TIPO en la que se muestren los siguientes valores:
--      • POP si la canción pertenece a un género que contenga la palabra POP.
--      • ELECTRÓNICA si la canción pertenece a un género que contenga las palabras ELECTRO o HOUSE.
--      • OTRO si no se cumple ninguna de las condiciones anteriores.
--    Ordena el resultado alfabéticamente por nombres de los artistas.
--    En el caso de que haya un artista con más de una canción en el listado,
--    mostrar ordenados alfabéticamente los nombres de las canciones.
SELECT 
    ARTISTA,
    TITULO,
    CASE
        WHEN GENERO LIKE '%POP%' THEN 'POP'
        WHEN GENERO LIKE '%ELECTRO%' OR GENERO LIKE '%HOUSE%' THEN 'ELECTRÓNICA'
        ELSE 'OTRO'
    END AS TIPO
FROM TOP_SPOTIFY
ORDER BY ARTISTA, TITULO;



/* =====================================================
   EJERCICIO III
   ===================================================== */

-- 1. Obtener una lista de todas aquellas canciones que contengan en su título la palabra BREAK.
--    La lista resultante debe mostrar las canciones de las tablas TOP SPOTIFY y ÚLTIMOS LANZAMIENTOS.
--    En el resultado de la consulta, mostrar todos los campos de ambas tablas.
--    Ordenar alfabéticamente el resultado por los nombres de las canciones.
--    Por último, agregar a la consulta una columna con el nombre ESTADO en la que figure
--    la palabra ANTERIOR para todos aquellos registros que provienen de la tabla TOP SPOTIFY
--    y la palabra ÚLTIMO para todos aquellos que provienen de la tabla ÚLTIMOS LANZAMIENTOS.

SELECT 
    TOP_SPOTIFY.*,
    'ANTERIOR' AS ESTADO
FROM TOP_SPOTIFY
WHERE TITULO LIKE '%BREAK%'

UNION ALL

SELECT 
    ULTIMOS_LANZAMIENTOS.*,
    'ÚLTIMO' AS ESTADO
FROM ULTIMOS_LANZAMIENTOS
WHERE TITULO LIKE '%BREAK%'
ORDER BY TITULO;


/* =====================================================
   FIN DEL DESAFÍO MODULO IV
   ===================================================== */
