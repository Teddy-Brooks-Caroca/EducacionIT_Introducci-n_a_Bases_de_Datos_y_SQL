/* =====================================================
   PROYECTO INTEGRADOR – ETAPA 3
   Introducción a Bases de Datos y SQL
   ===================================================== */


/* =====================================================
   PASO 1
   ===================================================== */

-- 1. Hay que organizar los ARTICULOS por CATEGORIA, por lo que es necesario crear la siguiente tabla: 

/*
CREATE TABLE IF EXISTS CATEGORIA (
    CategoriaID INT NOT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(255),
    PRIMARY KEY (CategoriaID)
);
*/

-- a. Preguntar a la IA si hay algún error y si se puede optimizar la tabla.

/*
necesito saber si la tabla que te estoy pasando tiene erorres o si es posible mejorarla: 

CREATE TABLE IF EXISTS CATEGORIA ( 
CategoriaID INT NOT, 
Nombre VARCHAR(50) NOT NULL, 
Descripcion VARCHAR(255), 
PRIMARY KEY (CategoriaID) 
);
*/

/*
Sí, la tabla **tiene un error sintáctico** y además **se puede mejorar** 
desde el punto de vista de buenas prácticas en MySQL.
*/

-- b. Copiar el código sugerido y ejecutarlo en la base de datos.

CREATE TABLE IF NOT EXISTS categoria (
    categoria_id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255),
    PRIMARY KEY (categoria_id)
);

-- c. Crear un prompt para que la IA que genere un insert para agregar 10 registros para 
--    una empresa de tecnología a la tabla CATEGORIA.

-- A la tabla recién corregida, necesito que le ingreses 10 registros con INSERT


-- d. Copiar el código sugerido y ejecutarlo en la base de datos.

INSERT INTO categoria (nombre, descripcion) VALUES
('Novela', 'Obras de ficción narrativa extensas'),
('Cuento', 'Relatos breves de ficción'),
('Ensayo', 'Textos reflexivos y argumentativos'),
('Poesía', 'Obras literarias en verso'),
('Historia', 'Libros de contenido histórico'),
('Biografía', 'Relatos de la vida de una persona'),
('Crónica', 'Narraciones de hechos reales'),
('Antología', 'Colección de textos seleccionados'),
('Relato', 'Narraciones breves o testimoniales'),
('Sin asignar', 'Categoría provisoria para clasificación');


-- e. Crear un Prompt para que la IA genere el código para modificar la tabla 
--    ARTICULOS agregando un campo Categoria que se relacione con la tabla creada y 
--    que tenga por defecto el valor 1.

/*
¿Podrías generar el código para Modificar la tabla ARTICULOS 
para agregar un campo Categoría que se relacione con la 
tabla creada y que tenga por defecto el valor 1.?
*/


-- f. Copiar el código sugerido y ejecutarlo en la base de datos.

ALTER TABLE ARTICULOS
ADD COLUMN categoria_id INT NOT NULL DEFAULT 1,
ADD CONSTRAINT fk_articulos_categoria
FOREIGN KEY (categoria_id) REFERENCES categoria(categoria_id);


/* ::::::::::::::::::::::::::::::::::::::
   FIN ETAPA 3 – PROYECTO INTEGRADOR
   :::::::::::::::::::::::::::::::::::::: */


