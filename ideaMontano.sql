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