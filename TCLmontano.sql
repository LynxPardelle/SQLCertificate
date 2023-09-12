USE blog;
START TRANSACTION;
  DELETE FROM articles WHERE id = 1;
  /* ROLLBACK; */
COMMIT;
  SELECT * FROM articles;
START TRANSACTION;
  /* 
  INSERT INTO articles (autor, title, created_at, updated_at)
  VALUES (1, 'How to create a blog', '2020-01-01', '2020-01-01');
   */
  INSERT INTO categories (title, created_at, updated_at)
  VALUES ('Art', '2020-01-01', '2020-01-01'),
  ('Social', '2020-01-01', '2020-01-01'),
  ('Economy', '2020-01-01', '2020-01-01'),
  ('Politics', '2020-01-01', '2020-01-01');
  savepoint insert_categories1;
  INSERT INTO categories (title, created_at, updated_at)
  VALUES ('Philosophy', '2020-01-01', '2020-01-01'),
  ('History', '2020-01-01', '2020-01-01'),
  ('Geography', '2020-01-01', '2020-01-01'),
  ('Mathematics', '2020-01-01', '2020-01-01');
  savepoint insert_categories2;
  /* RELEASE insert_categories1 */
COMMIT;