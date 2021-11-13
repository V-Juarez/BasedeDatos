SELECT c.nombre_categoria, COUNT(*) AS cant_posts
FROM platziblog.categorias AS c
	INNER JOIN posts AS p ON c.id = p.categoria_id
GROUP BY c.id
ORDER BY cant_posts DESC;

-- Usuarios con mas posts
SELECT u.nickame, COUNT(*) cant_posts
FROM platziblog.usuarios AS u
	INNER JOIN platziblog.posts AS p ON c.id = p.categoria_id
GROUP BY c.id
ORDER BY cant_posts DESC;

-- Numero de posts creados

SELECT u.nickame, COUNT(*) cant_posts, GROUP_CONCAT(nombre_categoria)
FROM platziblog.usuarios AS u
	INNER JOIN platziblog.posts AS p ON u.id = p.usuario_id
    INNER JOIN platziblog.categorias AS c ON c.id = p.categoria_id
GROUP BY u.id
ORDER BY cant_posts DESC;

-- Los que escriben poco post de nustros empleados
SELECT 
    *
FROM
    platziblog.usuarios AS u
        LEFT JOIN
    posts ON u.id = posts.usuario_id
WHERE
    posts.usuario_id IS NULL;