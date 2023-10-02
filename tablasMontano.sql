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
    action_time TIME -- Hora de la acción
    FOREIGN KEY (user_id) REFERENCES users(user_id),
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