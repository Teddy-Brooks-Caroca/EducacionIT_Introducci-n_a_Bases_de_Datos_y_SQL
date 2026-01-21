/* =====================================================
   INTRODUCCIÓN A BASES DE DATOS Y SQL (actualización 2025)
   PROYECTO INTEGRADOR 2026
   ===================================================== */

/*
Etapa 1
Durante el curso se debe desarrollar un proyecto integrador con lo aprendido en las clases. En esta primera etapa se presenta a la idea y las acciones a realizar.

Idea principal
Una empresa de tecnología decide utilizar SQL para generar una base de datos en la que va a almacenar información sobre sus clientes, los artículos que comercializa 
y las ventas que realiza. Para ello, se generará el diagrama y las tablas en las cuales se almacenará la información solicitada. Luego, se llevarán a cabo modificaciones 
en su estructura y se cargarán datos en ellas, incluyendo la IA para acelerar procesos.

Algunas acciones a realizar son:
1. Generar el diagrama de Entidad - Relación.
2. Crear estructura de la Base de datos.
3. Insertar y trabajar sobre los datos.
4. Generación de distintos tipos de consultas para obtener información específica de cada una de las tablas, utilizando distintos operadores de comparación y operadores lógicos.
5. Generar funciones sobre los datos contenidos en las tablas y consultas para actualizar y eliminar distintos registros de las tablas.

Pasos a seguir
1. Crear un proyecto en DBDesigner llamado TECNO_PRJ, para MySQL.
2. Crear el diagrama que represente la estructura de la base de datos con la descripción que se detalla en la siguiente diapositiva y con el conocimiento de que:
   a. Uno a muchos entre CLIENTES y FACTURAS: un cliente puede tener muchas facturas.
   b. Uno a muchos entre FACTURAS y DETALLE: una factura puede tener varios detalles.
   c. Uno a muchos entre ARTÍCULOS y DETALLE: un artículo puede estar en varios detalles de facturas.
3. Crear las relaciones indicando cardinalidad.

Referencia - Estructuras de las tablas a generar:

TABLA: FACTURAS
- FacturaID integer PK
- Letra char
- Número integer
- ClienteID integer
- Fecha date
- Monto double

TABLA: ARTÍCULOS
- ArticuloID integer PK
- Nombre varchar(50)
- Precio double
- Stock integer

TABLA: CLIENTES
- ClienteID integer PK
- Nombre varchar(25)
- Apellido varchar(25)
- CUIT char(16)
- Dirección varchar(50)
- Comentarios varchar(50)

TABLA: DETALLE
- DetalleID integer PK
- ArticuloID integer FK
- FacturaID integer FK
- Cantidad integer
*/


/* =====================================================
   MODELO ENTIDAD – RELACIÓN (DBDesigner)
   ===================================================== */

FACTURAS {
	FacturaID integer pk increments unique
	Letra char
	Número integer
	ClienteID integer > CLIENTES.ClienteID
	Fecha date
	Monto decimal
}

ARTÍCULOS {
	ArticuloID integer pk increments unique
	Nombre varchar(50)
	Precio double
	Stock integer
}

CLIENTES {
	ClienteID integer pk increments unique
	Nombre varchar(25)
	Apellido varchar(25)
	CUIT char(16)
	Dirección varchar(50)
	Comentarios varchar(50)
}

DETALLE {
	DetalleID integer pk increments unique
	ArticuloID integer *> ARTÍCULOS.ArticuloID
	Cantidad integer
	FacturaID integer *> FACTURAS.FacturaID
}


/* ::::::::::::::::::::::::::::::::::::::
   FIN ETAPA 1 – PROYECTO INTEGRADOR
   :::::::::::::::::::::::::::::::::::::: */


