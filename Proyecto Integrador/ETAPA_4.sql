/* =====================================================
   PROYECTO INTEGRADOR – ETAPA 4
   Introducción a Bases de Datos y SQL
   ===================================================== */


/* =====================================================
   PASO I
   ===================================================== */

USE TECNO_DB;

-- 1. Se necesita obtener el siguiente reporte:
--    a) Listado que incluya tanto los artículos como las categorías en el mismo informe.
SELECT 
    ArticuloID AS ID,
    Nombre,
    Precio,
    Stock,
    'Articulo' AS Tipo
FROM ARTICULOS

UNION

SELECT 
    CategoriaID AS ID,
    Nombre,
    NULL AS Precio,
    NULL AS Stock,
    'Categoria' AS Tipo
FROM CATEGORIA;


--    b) Listado que incluya tanto los clientes como las localidades en el mismo informe.
SELECT 
    ClienteID AS ID,
    Nombre,
    Apellido,
    Direccion,
    'Cliente' AS Tipo
FROM CLIENTES

UNION

SELECT 
    LocalidadID AS ID,
    Nombre,
    Provincia AS Apellido,
    NULL AS Direccion,
    'Localidad' AS Tipo
FROM LOCALIDADES;


-- 2. Se necesitan aplicar ciertos filtros en los reportes:
--    En el listado se deben seleccionar solo los CLIENTES cuyo apellido comience con la letra 'G'
--    y aquellas localidades que pertenecen a la provincia 'Buenos Aires'.
SELECT 
    ClienteID AS ID,
    Nombre,
    Apellido,
    Direccion,
    'Cliente' AS Tipo
FROM CLIENTES
WHERE Apellido LIKE 'G%'

UNION

SELECT 
    LocalidadID AS ID,
    Nombre,
    Provincia AS Apellido,
    NULL AS Direccion,
    'Localidad' AS Tipo
FROM LOCALIDADES
WHERE Provincia = 'Buenos Aires';


-- 3. Crear un prompt para que primero muestre los artículos con más de 50 unidades disponibles
--    y luego muestre los detalles relacionados.
--    Debe combinar los resultados en una sola lista, asegurándose una estrategia
--    que combine los resultados de dos consultas.

/*
¿Podrías escribir un código que primero muestre los artículos con más de 50 unidades 
disponibles y luego muestre los detalles relacionados, combinando los resultados en una 
sola lista? Asegúrate de hacerlo utilizando una estrategia que combine los resultados 
de dos consultas.
*/

-- 4. Código generado:
--    Primero se listan los artículos con stock mayor a 50.
--    Luego se muestran los detalles asociados a esos artículos.
--    Ambos resultados se combinan en una sola lista utilizando UNION.

SELECT 
    ArticuloID,
    Nombre,
    Precio,
    Stock,
    NULL AS DetalleID,
    NULL AS Cantidad,
    NULL AS FacturaID
FROM ARTICULOS
WHERE Stock > 50

UNION

SELECT 
    ArticuloID,
    NULL AS Nombre,
    NULL AS Precio,
    NULL AS Stock,
    DetalleID,
    Cantidad,
    FacturaID
FROM DETALLE
WHERE ArticuloID IN (
    SELECT ArticuloID
    FROM ARTICULOS
    WHERE Stock > 50
);



/* =====================================================
   PASO II
   ===================================================== */

-- 1. Se necesita obtener el siguiente reporte:
--    Listado de clientes junto con los datos de la localidad en la que se encuentran.
SELECT 
    c.ClienteID,
    c.Nombre,
    c.Apellido,
    c.CUIT,
    c.Direccion,
    c.Observaciones,
    l.Nombre AS Localidad,
    l.CP,
    l.Provincia
FROM CLIENTES c
JOIN LOCALIDADES l ON c.LocalidadID = l.LocalidadID;


-- 2. Se necesita un listado de todas las facturas junto con los detalles de los artículos
--    que están asociados a cada una de ellas.
--    No es necesaria la información de los artículos.
SELECT 
    f.FacturaID,
    f.Letra,
    f.Numero,
    f.Fecha,
    f.Monto,
    d.ArticuloID,
    d.Cantidad
FROM FACTURAS f
JOIN DETALLE d ON f.FacturaID = d.FacturaID;


-- 3. Se necesita el mismo listado, pero incluyendo el nombre de los artículos vendidos.
SELECT 
    f.FacturaID,
    f.Letra,
    f.Numero,
    f.Fecha,
    f.Monto,
    d.ArticuloID,
    a.Nombre AS NombreArticulo,
    d.Cantidad
FROM FACTURAS f
JOIN DETALLE d ON f.FacturaID = d.FacturaID
JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID;


-- 4. Se necesitan los datos de las facturas que están a nombre del cliente con apellido "García".
SELECT 
    f.FacturaID,
    f.Letra,
    f.Numero,
    f.Fecha,
    f.Monto,
    c.Nombre,
    c.Apellido
FROM FACTURAS f
JOIN CLIENTES c ON f.ClienteID = c.ClienteID
WHERE c.Apellido = 'García';


-- 5. Obtener los artículos que compró el cliente con apellido "López".
SELECT 
    a.Nombre AS NombreArticulo,
    c.Nombre AS NombreCliente,
    c.Apellido AS ApellidoCliente
FROM CLIENTES c
JOIN FACTURAS f ON c.ClienteID = f.ClienteID
JOIN DETALLE d ON f.FacturaID = d.FacturaID
JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID
WHERE c.Apellido = 'López';


/* =====================================================
   FIN DEL PROYECTO INTEGRADOR – ETAPA 4
   ===================================================== */


