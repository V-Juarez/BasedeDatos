
-- Ejercicio 1
SELECT estatus, COUNT(*) post_quantity
FROM platziblog.posts
GROUP BY estatus;


-- Ejercicio 2

SELECT YEAR(fecha_publicacion) AS post_year, COUNT(*) AS post_quantity
FROM platziblog.posts
GROUP BY post_year;

-- Ejercicio 3
SELECT MONTHNAME(fecha_publicacion) AS post_month, COUNT(*) AS post_quantity
FROM platziblog.posts
GROUP BY post_month;


-- Ejemplo 4
SELECT estatus, MONTHNAME(fecha_publicacion) AS post_month, COUNT(*) AS post_quantity
FROM platziblog.posts
GROUP BY estatus, post_month;