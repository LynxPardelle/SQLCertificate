USE blog;
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
    action_time TIME -- Hora de la acción
);
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

-- Triggers para views de 'articles'
/* 
  Los triggers after_articles_insert, after_articles_update 
  y after_articles_delete se ejecutan después de insertar, 
  actualizar o eliminar un registro en la tabla articles 
  y se usan para actualizar la vista all_articles.
 */
/*

DELIMITER //
CREATE TRIGGER after_articles_insert
AFTER INSERT
ON articles FOR EACH ROW
BEGIN
    CALL refresh_all_articles_view();
END;
//

CREATE TRIGGER after_articles_update
AFTER UPDATE
ON articles FOR EACH ROW
BEGIN
    CALL refresh_all_articles_view();
END;
//

CREATE TRIGGER after_articles_delete
AFTER DELETE
ON articles FOR EACH ROW
BEGIN
    CALL refresh_all_articles_view();
END;
//  DELIMITER ; */