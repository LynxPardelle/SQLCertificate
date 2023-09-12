USE blog;
/* 
    Stored Procedures:
 */
/* 
    sp_sort_table(): 
    - table_name
    - order_column
    - order_direction
    Description: Ordena una tabla por una columna específica.
    Objetivo: Ordenar una tabla por una columna específica.
    Tablas Relacionadas: Todas las tablas.
 */
DELIMITER //

CREATE PROCEDURE sp_sort_table(
    IN table_name VARCHAR(255),
    IN order_column VARCHAR(255),
    IN order_direction VARCHAR(10)
)
BEGIN
    SET @query = CONCAT('SELECT * FROM ', table_name, ' ORDER BY ', order_column, ' ', order_direction);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;
/* 
  Se consume así:
  CALL sp_sort_table('users', 'name', 'ASC');
 */ 
/* 
    sp_insert_or_delete_user(): 
    - action
    - user_id
    - new_name
    - new_last_name
    - new_email
    - new_nickname
    - new_password
    - new_avatar
    Description: Inserta o elimina un usuario de la tabla.
    Objetivo: Insertar o eliminar un usuario de la tabla.
    Tablas Relacionadas: users
 */
DELIMITER //

CREATE PROCEDURE sp_insert_or_delete_user(
    IN action VARCHAR(10),
    IN id INT, -- Para la eliminación
    IN new_name VARCHAR(100), -- Para la inserción
    IN new_last_name VARCHAR(100), -- Para la inserción
    IN new_email VARCHAR(100), -- Para la inserción
    IN new_nickname VARCHAR(100), -- Para la inserción
    IN new_password VARCHAR(100), -- Para la inserción
    IN new_avatar VARCHAR(100) -- Para la inserción
)
BEGIN
    IF action = 'insert' THEN
        -- Insertar un nuevo usuario en la tabla
        INSERT INTO users (name, last_name, email, nickname, password, avatar)
        VALUES (new_name, new_last_name, new_email, new_nickname, new_password, new_avatar);
    ELSEIF action = 'delete' THEN
        -- Eliminar un usuario específico de la tabla por su ID
        DELETE FROM users WHERE user_id = id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Acción no válida';
    END IF;
END //

DELIMITER ;
/* 
  Se consume así:
  CALL sp_insert_or_delete_user('insert', NULL, 'Nuevo Nombre', 'Nuevo Apellido', 'nuevo@email.com', 'nuevo_nick', 'nueva_contraseña', 'nuevo_avatar');
  CALL sp_insert_or_delete_user('delete', 123, NULL, NULL, NULL, NULL, NULL, NULL);
 */
/* 
    refresh_all_articles_view(): 
    - article_id
    - article_title
    - article_created_at
    - article_updated_at
    - cat
    - subcats
    - autor
    - sections
    Description: Actualiza la vista all_articles.
    Objetivo: Actualizar la vista all_articles.
    Tablas Relacionadas: all_articles
*/
DELIMITER //

CREATE PROCEDURE refresh_all_articles_view()
BEGIN
    DROP VIEW IF EXISTS all_articles;

    CREATE VIEW all_articles AS
    SELECT 
        articles.article_id,
        articles.title AS article_title,
        articles.created_at AS article_created_at,
        articles.updated_at AS article_updated_at,
        JSON_OBJECT(
            'cat_id', categories.cat_id,
            'title', categories.title
        ) AS cat,
        JSON_ARRAYAGG(JSON_OBJECT('subcat_id', sub_categories.subcat_id, 'title', sub_categories.title)) AS subcats,
        JSON_OBJECT(
            'user_id', users.user_id,
            'name', users.name,
            'last_name', users.last_name,
            'email', users.email,
            'nickname', users.nickname,
            'avatar', users.avatar,
            'created_at', users.created_at,
            'updated_at', users.updated_at
        ) AS autor,
        JSON_ARRAYAGG(JSON_OBJECT('section_id', sections.section_id, 'title', sections.title, 'text', sections.text)) AS sections
    FROM articles
    JOIN users ON articles.autor = users.user_id
    JOIN article_subcat_relation ON articles.article_id = article_subcat_relation.article_id
    JOIN sub_categories ON article_subcat_relation.subcat_id = sub_categories.subcat_id
    JOIN categories ON sub_categories.cat_id = categories.cat_id
    LEFT JOIN sections ON articles.article_id = sections.article
    GROUP BY articles.article_id, users.user_id, categories.cat_id;

    SELECT 'View "all_articles" has been refreshed.' AS message;
END;
//

DELIMITER ;
/* 
  Se consume así:
  CALL refresh_all_articles_view();
  SELECT * FROM all_articles;
 */