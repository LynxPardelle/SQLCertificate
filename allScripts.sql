CREATE SCHEMA blog;
USE blog;
/* 
    users:
    - user_id
    - name
    - last_name
    - email
    - nickname
    - password
    - avatar
    - bg_color
    - text_color
    - title_color
    - highlight_color
    - created_at
    - updated_at
 */
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    nickname VARCHAR(100),
    password VARCHAR(100),
    avatar VARCHAR(100),
    bg_color VARCHAR(100),
    text_color VARCHAR(100),
    title_color VARCHAR(100),
    highlight_color VARCHAR(100),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
/* 
    categories:
    - cat_id
    - title
    - created_at
    - updated_at
 */
CREATE TABLE categories (
    cat_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    title VARCHAR(100),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
/* 
    sub_categories:
    - subcat_id
    - title
    - cat_id
    - created_at
    - updated_at
 */
CREATE TABLE sub_categories (
    subcat_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    title VARCHAR(100),
    cat_id INT,
    FOREIGN KEY (cat_id) REFERENCES categories(cat_id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
/* 
    articles:
    - article_id
    - autor
    - title
    - bg_color
    - text_color
    - title_color
    - highlight_color
    - created_at
    - updated_at
 */
CREATE TABLE articles (
    article_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    autor INT,
    title VARCHAR(100),
    FOREIGN KEY (autor) REFERENCES users(user_id),
    bg_color VARCHAR(100),
    text_color VARCHAR(100),
    title_color VARCHAR(100),
    highlight_color VARCHAR(100),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
/* 
    sections:
    - section_id
    - article
    - title
    - text
    - bg_color
    - text_color
    - title_color
    - highlight_color
    - created_at
    - updated_at
 */
CREATE TABLE sections (
    section_id INT PRIMARY KEY AUTO_INCREMENT,
    article INT,
    title VARCHAR(100),
    text VARCHAR(600),
    FOREIGN KEY (article) REFERENCES articles(article_id),
    bg_color VARCHAR(100),
    text_color VARCHAR(100),
    title_color VARCHAR(100),
    highlight_color VARCHAR(100),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
/* 
    article_subcat_relation:
    - article_id
    - subcat_id
 */
CREATE TABLE article_subcat_relation (
    article_id INT,
    subcat_id INT,
    FOREIGN KEY (article_id) REFERENCES articles(article_id),
    FOREIGN KEY (subcat_id) REFERENCES sub_categories(subcat_id)
);
/* 
    actions_log:
    - action_id
    - timestamp
    - user_id
    - action
    - table_name
    - user_name
    - action_date
    - action_time
 */
CREATE TABLE actions_log (
    action_id INT AUTO_INCREMENT PRIMARY KEY,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT, -- ID del usuario que realizó la acción
    action VARCHAR(255) NOT NULL, -- Descripción de la acción o evento
    table_name VARCHAR(100), -- Nombre de la tabla relacionada con la acción (si es aplicable)
    action_date DATE, -- Fecha de la acción
    action_time TIME, -- Hora de la acción
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
/* 
    main:
    - main_id
    - name
    - description
    - logo
    - bg_color
    - text_color
    - title_color
    - highlight_color
    - created_at
    - updated_at
 */
CREATE TABLE main (
    main_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    name VARCHAR(100),
    description VARCHAR(600),
    logo VARCHAR(100),
    bg_color VARCHAR(100),
    text_color VARCHAR(100),
    title_color VARCHAR(100),
    highlight_color VARCHAR(100),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
/* Insert into users */
INSERT INTO users (name, last_name, email, nickname, password, avatar, created_at, updated_at) 
VALUES ('Alec', 'Montaño', 'alec@montaño.com', 'Lynx', '1234', 'https://picsum.photos/200', '2020-01-01', '2020-01-01'), 
('Juan', 'Cabrera', 'juan@cabrera.com', 'Goat', '5678', 'https://picsum.photos/201', '2020-01-01', '2020-01-01'),
('Eliz', 'Lamb','elisa@lamb.com','Lamb', '90AB', 'https://picsum.photos/202', '2020-01-01', '2020-01-01');

/* Insert into categories */
INSERT INTO categories (title, created_at, updated_at)
VALUES ('Technology', '2020-01-01', '2020-01-01'),
('Sports', '2020-01-01', '2020-01-01'),
('Science', '2020-01-01', '2020-01-01');

/* Insert into sub_categories */
INSERT INTO sub_categories (title, cat_id, created_at, updated_at)
VALUES ('Programming', 1, '2020-01-01', '2020-01-01'),
('Football', 2, '2020-01-01', '2020-01-01'),
('Biology', 3, '2020-01-01', '2020-01-01');

/* Insert into articles */
INSERT INTO articles (autor, title, created_at, updated_at)
VALUES (1, 'How to create a blog', '2020-01-01', '2020-01-01'),
(2, 'How to create a blog', '2020-01-01', '2020-01-01'),
(3, 'How to create a blog', '2020-01-01', '2020-01-01');

/* Insert into sections */
INSERT INTO sections (article, title, text, created_at, updated_at)
VALUES (1, 'How to create a blog', 'How to create a blog', '2020-01-01', '2020-01-01'),
(2, 'How to create a blog', 'How to create a blog', '2020-01-01', '2020-01-01'),
(3, 'How to create a blog', 'How to create a blog', '2020-01-01', '2020-01-01');

/* Insert into article_subcat_relation */
INSERT INTO article_subcat_relation (article_id, subcat_id)
VALUES (1, 1),
(2, 2),
(3, 3);
/* Insert into main */
INSERT INTO main (name)
VALUES ('Blog de Lynx Pardelle');
/* 
    Vistas:
*/
/*  
    all_articles: 
    - article_id
    - article_title
    - article_created_at
    - article_updated_at
    - cat
    - subcats
    - autor
    - sections
    Description:
    Esta vista contiene todos los artículos, con sus categorías, subcategorías, autor y secciones.
    Objetivo:
    Esta vista se utiliza para mostrar todos los artículos y sus tablas relacionadas de manera sencilla.
    Tablas Relacionadas:
    - articles
    - users
    - article_subcat_relation
    - sub_categories
    - categories
    - sections
    Uso:
    SELECT * FROM all_articles;
 */
CREATE VIEW all_articles AS
SELECT 
    articles.article_id,
    articles.title AS article_title,
    articles.bg_color As article_bg_color,
    articles.text_color As article_text_color,
    articles.title_color As article_title_color,
    articles.highlight_color As article_highlight_color,
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
            'bg_color', users.bg_color,
            'text_color', users.text_color,
            'title_color', users.title_color,
            'highlight_color', users.highlight_color,
        'created_at', users.created_at,
        'updated_at', users.updated_at
    ) AS autor,
        JSON_ARRAYAGG(JSON_OBJECT(
            'section_id', sections.section_id, 
            'title', sections.title, 
            'text', sections.text,
            'bg_color', sections.bg_color,
            'text_color', sections.text_color,
            'title_color', sections.title_color,
            'highlight_color', sections.highlight_color,
            'created_at', sections.created_at,
            'updated_at', sections.updated_at
        )) AS sections
FROM articles
JOIN users ON articles.autor = users.user_id
JOIN article_subcat_relation ON articles.article_id = article_subcat_relation.article_id
JOIN sub_categories ON article_subcat_relation.subcat_id = sub_categories.subcat_id
JOIN categories ON sub_categories.cat_id = categories.cat_id
LEFT JOIN sections ON articles.article_id = sections.article
GROUP BY articles.article_id, users.user_id, categories.cat_id;

/* 
    articles_by_user(user_id INT):
    - article_id
    - article_title
    - article_created_at
    - article_updated_at
    - cat
    - subcats
    - autor
    - sections
    Description:
    Esta vista contiene todos los artículos de un usuario, con sus categorías, subcategorías, autor y secciones.
    Objetivo:
    Esta vista se utiliza para mostrar todos los artículos de un usuario y sus tablas relacionadas de manera sencilla.
    Tablas Relacionadas:
    - articles
    - users
    - article_subcat_relation
    - sub_categories
    - categories
    - sections
 */
CREATE VIEW articles_by_user AS
SELECT
    articles.article_id,
    articles.title AS article_title,
    articles.bg_color As article_bg_color,
    articles.text_color As article_text_color,
    articles.title_color As article_title_color,
    articles.highlight_color As article_highlight_color,
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
            'bg_color', users.bg_color,
            'text_color', users.text_color,
            'title_color', users.title_color,
            'highlight_color', users.highlight_color,
        'created_at', users.created_at,
        'updated_at', users.updated_at
    ) AS autor,
        JSON_ARRAYAGG(JSON_OBJECT(
            'section_id', sections.section_id, 
            'title', sections.title, 
            'text', sections.text,
            'bg_color', sections.bg_color,
            'text_color', sections.text_color,
            'title_color', sections.title_color,
            'highlight_color', sections.highlight_color,
            'created_at', sections.created_at,
            'updated_at', sections.updated_at
        )) AS sections
FROM articles
JOIN users ON articles.autor = users.user_id
JOIN article_subcat_relation ON articles.article_id = article_subcat_relation.article_id
JOIN sub_categories ON article_subcat_relation.subcat_id = sub_categories.subcat_id
JOIN categories ON sub_categories.cat_id = categories.cat_id
LEFT JOIN sections ON articles.article_id = sections.article
WHERE users.user_id = user_id
GROUP BY articles.article_id, users.user_id, categories.cat_id;
/* 
  Se consulta así:
  SELECT * FROM articles_by_user WHERE autor->"$.user_id" = 1;
 */
/* 
    subcats_by_cat(cat_id INT):
    - subcat_id
    - title
    - cat_id
    - created_at
    - updated_at
    Description:
    Esta vista contiene todas las subcategorías de una categoría.
    Objetivo:
    Esta vista se utiliza para mostrar todas las subcategorías de una categoría.
    Tablas Relacionadas:
    - sub_categories
    - categories
 */
CREATE VIEW subcats_by_cat AS
SELECT
    sub_categories.subcat_id,
    sub_categories.title,
    sub_categories.cat_id,
    sub_categories.created_at,
    sub_categories.updated_at
FROM sub_categories
WHERE sub_categories.cat_id = cat_id;
/* 
  Se consulta así:
  SELECT * FROM subcats_by_cat WHERE cat_id = 1;
 */
/* 
    articles_dividen_by_category:
    - cat_id
    - title
    - article_id
    - article_title
    - article_created_at
    - article_updated_at
    Description:
    Esta vista contiene todos los artículos, con sus categorías, subcategorías, autor y secciones.
    Objetivo:
    Esta vista se utiliza para mostrar todos los artículos divididos por categorías y sus tablas relacionadas de manera sencilla.
    Tablas Relacionadas:
    - articles
    - users
    - article_subcat_relation
    - sub_categories
    - categories
    - sections
 */
CREATE VIEW articles_dividen_by_category AS
SELECT
    c.cat_id,
    c.title AS category_title,
    a.article_id,
    a.title AS article_title,
    a.created_at AS article_created_at,
    a.updated_at AS article_updated_at
FROM
    categories c
JOIN
    sub_categories sc ON c.cat_id = sc.cat_id
JOIN
    article_subcat_relation asr ON sc.subcat_id = asr.subcat_id
JOIN
    articles a ON asr.article_id = a.article_id;
/* 
  Se consulta así:
  SELECT * FROM articles_by_category;
*/
/* 
    user_article_counts:
    - user_id
    - name
    - last_name
    - article_count
    Description:
    Esta vista contiene todos los artículos, con sus categorías, subcategorías, autor y secciones.
    Objetivo:
    Esta vista se utiliza para mostrar los usuarios y la cantidad de artículos que han escrito.
    Tablas Relacionadas:
    - users
    - articles
 */
CREATE VIEW user_article_counts AS
SELECT
    u.user_id,
    u.name,
    u.last_name,
    COUNT(a.article_id) AS article_count
FROM
    users u
LEFT JOIN
    articles a ON u.user_id = a.autor
GROUP BY
    u.user_id, u.name, u.last_name;
/* 
  Se consulta así:
  SELECT * FROM user_article_counts;
*/
/* 
    usage_statistics:
    - total_users
    - total_articles
    - total_categories
    - total_subcategories
    - total_sections
    Description:
    Esta vista contiene todos los artículos, con sus categorías, subcategorías, autor y secciones.
    Objetivo:
    Esta vista ayudará a mostrar las estadísticas de uso de la aplicación.
    Tablas Relacionadas:
    - users
    - articles
    - article_subcat_relation
    - sub_categories
    - categories
    - sections
 */
CREATE VIEW usage_statistics AS
SELECT
    COUNT(DISTINCT u.user_id) AS total_users,
    COUNT(DISTINCT a.article_id) AS total_articles,
    COUNT(DISTINCT c.cat_id) AS total_categories,
    COUNT(DISTINCT sc.subcat_id) AS total_subcategories,
    COUNT(DISTINCT s.section_id) AS total_sections
FROM
    users u
LEFT JOIN
    articles a ON u.user_id = a.autor
LEFT JOIN
    article_subcat_relation asr ON a.article_id = asr.article_id
LEFT JOIN
    sub_categories sc ON asr.subcat_id = sc.subcat_id
LEFT JOIN
    categories c ON sc.cat_id = c.cat_id
LEFT JOIN
    sections s ON a.article_id = s.article;
/* 
  Se consulta así:
  SELECT * FROM usage_statistics;
*/
/* 
    Funciones:
*/
/* 
    get_article_by_id(article_id INT): 
    - article_id
    - article_title
    - article_created_at
    - article_updated_at
    - cat
    - subcats
    - autor
    - sections
    Descripción: Retorna un artículo por su id.
    Objetivo: Obtener un artículo por su id.
    Tablas Relacionadas: articles, categories, subcategories, users, sections, article_sections
 */
DELIMITER //

CREATE FUNCTION get_article_by_id(article_id INT) RETURNS JSON DETERMINISTIC
BEGIN
    DECLARE article_json JSON;

    -- Verificar si la vista existe
    DECLARE view_exists INT DEFAULT 0;
    SELECT COUNT(*) INTO view_exists FROM information_schema.views WHERE table_name = 'all_articles';

    -- Si la vista no existe, llamar al stored procedure para crearla
    IF view_exists = 0 THEN
        CALL refresh_all_articles_view();
    END IF;

    -- Obtener el artículo de la vista
    SELECT JSON_OBJECT(
        'article_id', all_articles.article_id,
        'article_title', all_articles.article_title,
        'article_created_at', all_articles.article_created_at,
        'article_updated_at', all_articles.article_updated_at,
        'cat', all_articles.cat,
        'subcats', all_articles.subcats,
        'autor', all_articles.autor,
        'sections', all_articles.sections,
        'article_bg_color', all_articles.article_bg_color,
        'article_text_color', all_articles.article_text_color,
        'article_title_color', all_articles.article_title_color,
        'article_highlight_color', all_articles.article_highlight_color
    )
    INTO article_json
    FROM all_articles
    WHERE all_articles.article_id = article_id;

    RETURN article_json;
END;

//

DELIMITER ;

/* 
    Llamada de la función get_article_by_id(article_id INT):

    SELECT get_article_by_id(1);
 */
/* 
    change_password(user_email VARCHAR(100), old_password VARCHAR(100), new_password VARCHAR(100)): BOOLEAN
    Descripción: Cambia la contraseña de un usuario.
    Objetivo: Cambiar la contraseña de un usuario.
    Tablas Relacionadas: users
 */
DELIMITER //

CREATE FUNCTION change_password(
    user_email VARCHAR(100),
    old_password VARCHAR(100),
    new_password VARCHAR(100)
) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE user_data JSON;
    
    -- Verificar si el usuario existe y las credenciales son correctas
    SELECT JSON_OBJECT(
        'user_id', user_id,
        'name', name,
        'last_name', last_name,
        'email', email,
        'nickname', nickname,
        'avatar', avatar,
        'bg_color', bg_color,
        'text_color', text_color,
        'title_color', title_color,
        'highlight_color', highlight_color,
        'created_at', created_at,
        'updated_at', updated_at
    ) INTO user_data
    FROM users
    WHERE email = user_email AND password = old_password;
    -- Si el usuario existe con la contraseña actual, actualizar la contraseña
    IF user_data IS NOT NULL THEN
        UPDATE users
        SET password = new_password
        WHERE email = user_email;
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //

DELIMITER ;
/* 
    Llamada de la función change_password(user_email VARCHAR(100), old_password VARCHAR(100), new_password VARCHAR(100))
    
    SELECT change_password('usuario@email.com', 'contraseña_antigua', 'nueva_contraseña');
 */
/* 
    login_user(user_email VARCHAR(100), user_password VARCHAR(100)): JSON
    Descripción: Retorna los datos de un usuario si las credenciales son correctas.
    Objetivo: Obtener los datos de un usuario si las credenciales son correctas.
    Tablas Relacionadas: users
 */
DELIMITER //

CREATE FUNCTION login_user(
    user_email VARCHAR(100),
    user_password VARCHAR(100)
) RETURNS JSON
DETERMINISTIC
BEGIN
    DECLARE user_data JSON;
    
    -- Verificar si el usuario existe y las credenciales son correctas
    SELECT JSON_OBJECT(
        'user_id', user_id,
        'name', name,
        'last_name', last_name,
        'email', email,
        'nickname', nickname,
        'avatar', avatar,
        'bg_color', bg_color,
        'text_color', text_color,
        'title_color', title_color,
        'highlight_color', highlight_color,
        'created_at', created_at,
        'updated_at', updated_at
    ) INTO user_data
    FROM users
    WHERE email = user_email AND password = user_password;
    
    RETURN user_data;
END //

DELIMITER ;
/* 
    Llamada de la función login_user(user_email VARCHAR(100), user_password VARCHAR(100))
    
    SELECT login_user('email', 'password');
 */
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
        articles.bg_color As article_bg_color,
        articles.text_color As article_text_color,
        articles.title_color As article_title_color,
        articles.highlight_color As article_highlight_color,
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
            'bg_color', users.bg_color,
            'text_color', users.text_color,
            'title_color', users.title_color,
            'highlight_color', users.highlight_color,
            'created_at', users.created_at,
            'updated_at', users.updated_at
        ) AS autor,
        JSON_ARRAYAGG(JSON_OBJECT(
            'section_id', sections.section_id, 
            'title', sections.title, 
            'text', sections.text,
            'bg_color', sections.bg_color,
            'text_color', sections.text_color,
            'title_color', sections.title_color,
            'highlight_color', sections.highlight_color,
            'created_at', sections.created_at,
            'updated_at', sections.updated_at
        )) AS sections
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
/* 
    Triggers:
*/
/* 
    El trigger before_users_insert se ejecuta antes de insertar 
    un nuevo registro en la tabla users y se usa para crear 
    un nuevo registro en la tabla actions_log.
*/
DELIMITER //

CREATE TRIGGER before_users_insert
BEFORE INSERT
ON users FOR EACH ROW
BEGIN
    INSERT INTO actions_log (action, table_name, action_date, action_time)
    VALUES ('Usuario creado', 'users',  CURDATE(), CURTIME());
END;
// DELIMITER ;
/* 
    El trigger before_users_delete se ejecuta antes de eliminar 
    un registro en la tabla users y se usa para crear 
    un nuevo registro en la tabla actions_log.
*/
DELIMITER //

CREATE TRIGGER before_users_delete
BEFORE DELETE
ON users FOR EACH ROW
BEGIN
    INSERT INTO actions_log (action, table_name, action_date, action_time)
    VALUES ('Usuario eliminado', 'users',  CURDATE(), CURTIME());
END;
// DELIMITER ;
/* 
    El trigger before_articles_insert se ejecuta antes de insertar 
    un nuevo registro en la tabla articles y se usa para crear 
    un nuevo registro en la tabla actions_log.
*/
DELIMITER //

CREATE TRIGGER before_articles_insert
BEFORE INSERT
ON articles FOR EACH ROW
BEGIN
    INSERT INTO actions_log (action, table_name, action_date, action_time)
    VALUES ('Artículo creado', 'articles',  CURDATE(), CURTIME());
END;
// DELIMITER ;
/* 
    El trigger before_articles_delete se ejecuta antes de eliminar 
    un registro en la tabla articles y se usa para crear 
    un nuevo registro en la tabla actions_log.
*/
DELIMITER //

CREATE TRIGGER before_articles_delete
BEFORE DELETE
ON articles FOR EACH ROW
BEGIN
    INSERT INTO actions_log (action, table_name, action_date, action_time)
    VALUES ('Artículo eliminado', 'articles',  CURDATE(), CURTIME());
END;
//  DELIMITER ;