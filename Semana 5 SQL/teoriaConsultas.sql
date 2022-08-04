-- Usaremos la base de datos de ejemploLibros

use ejemploLibros;

show tables;


-- Consulta sobre bases de datos, nos sirven para devolver datos de las tablas.alter

/* 

	SELECT -> se usa para mostrar datos de una tabla o tablas

	Estructura:

	SELECT <columna>
	FROM <tabla/s>alter
	[WHERE <condiciones>
	[GROUP BY <columna>]	
	[HAVING <condiciones de grupo>]
	[ORDER BY <columna/s a ordenar> [ASC/DESC]
*/

-- Consultas básicas, todos los datos de una tabla
select * from libro;

-- Consulta estableciendo una condición. Muestra los libros donde el género sea de cómic.
select * from libro where genero = 'comic';

-- Consulta indicando varias condiciones.
select * from libro where genero = 'comic' and idEditorial = 2;

-- Consulta las condiciones de libros que contengan la palabra 'Potter' en su título
select * from libro where titulo like '%Potter%';

-- Consulta los libros con precio entre 13 y 15€. Dentro de un rango
select * from libro where  precio between 12 and 15;

-- Seleccionamos las columnas título, género y precio de la tabla libros
select titulo, genero, precio from libro;

-- Seleccionamos las columnsa titulo, genero y precio de la tabla libros ordenadas por su precio de manera ascendente
select titulo, genero, precio
from libro
order by precio desc;

-- LIMIT -> nos permite limitar el número de resultados que recibimos.
-- Queremos recuperar el libro más caro de la tienda.alter
select titulo, genero, precio
from libro
order by precio desc
limit 1;

-- COUNT() -> cuenta el número de apariciones de los datos indicados entre paréntesis.
-- GROUP BY -> agrupa los datos según la columna indicada.
-- HAVING -> establece una condicion sobre los grupos

-- Contamos todos los datos segun el genero del libro
select count(*), genero
from libro
group by genero
having genero = 'comic';

-- Funciones de mysql que nos sirven para sacar el valor máximo, mínimo  y medio de un número.

-- Precio MÁXIMO de la tabla libros
select max(precio)
from libro;

-- MÍNIMO
select min(precio)
from libro;

-- MEDIA
select avg(precio)
from libro;

-- SUBCONSULTAS
-- Estas nos sirven para utilizar su resultado como valor para una condición de otra consulta mayor.alter

select *
from libro
where precio = (
	select max(precio) from libro
);




