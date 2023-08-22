CREATE SCHEMA blog;

USE blog;

-- Tabla users
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    nickname VARCHAR(100),
    password VARCHAR(100),
    avatar VARCHAR(100),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Tabla categories
CREATE TABLE categories (
    cat_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    title VARCHAR(100),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Tabla sub_categories
CREATE TABLE sub_categories (
    subcat_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    title VARCHAR(100),
    cat_id INT,
    FOREIGN KEY (cat_id) REFERENCES categories(cat_id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Tabla articles
CREATE TABLE articles (
    article_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    autor INT,
    title VARCHAR(100),
    FOREIGN KEY (autor) REFERENCES users(user_id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Tabla sections
CREATE TABLE sections (
    section_id INT PRIMARY KEY AUTO_INCREMENT,
    article INT,
    title VARCHAR(100),
    text VARCHAR(600),
    FOREIGN KEY (article) REFERENCES articles(article_id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Tabla article_subcat_relation
CREATE TABLE article_subcat_relation (
    article_id INT,
    subcat_id INT,
    FOREIGN KEY (article_id) REFERENCES articles(article_id),
    FOREIGN KEY (subcat_id) REFERENCES sub_categories(subcat_id)
);

-- Probando otras cosas, favor de no prestar atención a lo de abajo.
/* 
    Vistas:

    all_articles: 
    - article_id
    - article_title
    - article_created_at
    - article_updated_at
    - cat
    - subcats
    - autor
    - sections
 */
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

/* 
    Funciones:

    get_article_by_id(article_id INT): 
    - article_id
    - article_title
    - article_created_at
    - article_updated_at
    - cat
    - subcats
    - autor
    - sections
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
        'sections', all_articles.sections
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
    Stored Procedures:

    refresh_all_articles_view(): 
    - article_id
    - article_title
    - article_created_at
    - article_updated_at
    - cat
    - subcats
    - autor
    - sections
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