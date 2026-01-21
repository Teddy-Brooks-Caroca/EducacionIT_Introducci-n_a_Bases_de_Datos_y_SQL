/* =====================================================
   DESAFÍOS – INTRODUCCIÓN A SQL Y BASES DE DATOS (actualización 2025)
   DESAFÍO DEL MÓDULO I
   ===================================================== */


/* =====================================================
   EJERCICIO 1
   ===================================================== */

/*
1. En este ejercicio invitamos a utilizar DB Designer para crear un nuevo proyecto que se llamará Laboratorio_prj.
2. Luego, la siguiente actividad consiste en crear cinco tablas con los siguientes nombres: Cliente, Localidad, Provincia, Movimiento e Ítem.
*/


/* =====================================================
   EJERCICIO 2
   ===================================================== */

/*
1. Para realizar este ejercicio es importante tener en cuenta lo siguiente:
   ● El atributo localidad de Cliente se relaciona con la entidad Localidad.
   ● El atributo provincia de Localidad se relaciona con la entidad Provincia.
   ● El atributo cliente de Movimiento se relaciona con la entidad Cliente.
   ● El atributo movimiento de Ítem se relaciona con la entidad Movimiento.
2. Con la información brindada se deberán que crear las relaciones indicando la cardinalidad.
3. Por consiguiente, será importante analizar el código SQL generado.
*/

Cliente {
	id integer pk increments unique
	Nombre varchar
	Apellido varchar
	Fecha_Nacimiento date
	Direccion varchar
	Localidad integer *> Localidad.id
	Telefono varchar
}

Localidad {
	id integer pk increments unique
	Nombre varchar
	CP varchar
	Provincia integer *> Provincia.id
}

Movimiento {
	id integer pk increments unique
	Letra string
	Fecha date
	Cliente integer *> Cliente.id
}

Provincia {
	id integer pk increments unique
	Nombre varchar
	Pais varchar
}

Item {
	id integer pk increments unique
	Detalle varchar
	Cantidad integer
	Valor decimal
	Movimiento integer *> Movimiento.id
}


/* =====================================================
   EJERCICIO 3
   ===================================================== */

/*
En este ejercicio se trabarará con en W3school (https://www.w3schools.com/).
Luego de ingresar a la siguiente URL https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all 
será necesario obtener los siguientes detalle según cada tabla:
*/


-- Tabla Clientes (Customers)
-- El detalle de todos los clientes cuya ciudad de residencia es "Madrid".
SELECT * 
FROM Customers 
WHERE City = 'Madrid';


-- De esos mismos clientes, obtener el nombre de contacto y dirección cuyo código postal es 28034.
SELECT ContactName, Address 
FROM Customers 
WHERE City = 'Madrid' AND PostalCode = 28034;


-- Determinar si hay algún cliente de Argentina. En el caso de que haya, mostrar nombre y ciudad de cada uno de ellos.
SELECT ContactName, City 
FROM Customers 
WHERE Country = 'Argentina';


-- Tabla Productos (Products)
-- Obtener el nombre de aquellos productos cuyo precio sea mayor a 39.
SELECT * 
FROM Products 
WHERE Price > 39;


-- Obtener el detalle completo de los productos que la unidad sea "24 - 4 oz tins".
SELECT * 
FROM Products 
WHERE Unit = '24 - 4 oz tins';


-- Tabla Transportistas (Shippers)
-- Obtener el nombre y número de teléfono de todos los transportistas.
SELECT ShipperName, Phone 
FROM Shippers;


-- Tabla Detalle de órdenes (OrderDetails)
-- Obtener el ID de la orden y el ID del detalle de orden de aquellas cuyo ID de producto 
-- es igual a 42.
SELECT OrderID, OrderDetailID 
FROM OrderDetails 
WHERE ProductID = 42;


/* =====================================================
   FIN DESAFÍO MÓDULO I
   ===================================================== */

