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
 */