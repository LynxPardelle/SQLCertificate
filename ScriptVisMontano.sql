USE blog;
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
WHERE users.user_id = user_id
GROUP BY articles.article_id, users.user_id, categories.cat_id;
/* 
  Se consulta así:
  SELECT * FROM articles_by_user WHERE autor->"$.user_id" = 1;
 */

/*
    articles_by_cat(cat_id INT):
    - article_id
    - article_title
    - article_created_at
    - article_updated_at
    - cat
    - subcats
    - autor
    - sections
 */
/* 
// FIXME: Error Code: 1052. Column 'cat_id' in where clause is ambiguous

CREATE VIEW articles_by_cat AS
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
WHERE categories.cat_id = cat_id
GROUP BY articles.article_id, users.user_id, categories.cat_id; */
/* Se consulta así: 
    SELECT * FROM articles_by_cat WHERE cat->"$.cat_id" = 1;
*/
/* 
    articles_by_subcat(subcat_id INT):
    - article_id
    - article_title
    - article_created_at
    - article_updated_at
    - cat
    - subcats
    - autor
    - sections
 */
/* 
// FIXME: Error Code: 1052. Column 'subcat_id' in where clause is ambiguous

CREATE VIEW articles_by_subcat AS
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
WHERE sub_categories.subcat_id = subcat_id
GROUP BY articles.article_id, users.user_id, categories.cat_id; */
/* 
  Se consulta así:
  SELECT * FROM articles_by_cat WHERE cat->'$.cat_id' = 1;
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