USE Mysql;
/* 
  CREATE USER 'montano'@'localhost' IDENTIFIED BY 'montano';
  Creará el usuario montano con la contraseña montano.
 */
CREATE USER 'montano'@'localhost' IDENTIFIED BY 'montano';
/* 
  GRANT SELECT, INSERT, UPDATE ON blog.* TO 'montano'@'localhost';
  Concederá permisos de SELECT, INSERT y UPDATE en la base de datos blog al usuario montano.
 */
GRANT SELECT, INSERT, UPDATE ON blog.* TO 'montano'@'localhost';
/* 
  FLUSH PRIVILEGES;
  Actualizará los privilegios.
 */
FLUSH PRIVILEGES;
/* 
  SHOW GRANTS FOR 'montano'@'localhost';
  Mostrará los permisos del usuario montano.
 */
SHOW GRANTS FOR 'montano'@'localhost';
/* 
  CREATE USER 'visitante'@'localhost' IDENTIFIED BY 'visitante';
  Creará el usuario visitante con la contraseña visitante.
 */
CREATE USER 'visitante'@'localhost' IDENTIFIED BY 'visitante';
/* 
  GRANT SELECT ON blog.* TO 'visitante'@'localhost';
  Concederá permisos de SELECT en la base de datos blog al usuario visitante.
 */
GRANT SELECT ON blog.* TO 'visitante'@'localhost';
/* 
  FLUSH PRIVILEGES;
  Actualizará los privilegios.
 */
FLUSH PRIVILEGES;
/* 
  SHOW GRANTS FOR 'visitante'@'localhost';
  Mostrará los permisos del usuario visitante.
 */
SHOW GRANTS FOR 'visitante'@'localhost';
