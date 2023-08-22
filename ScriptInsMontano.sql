USE blog;
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

