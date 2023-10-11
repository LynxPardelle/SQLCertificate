/* 
  Tables:
    - actions_log
    - article_subcat_relation
    - articles
    - categories
    - sections
    - sub_categories
    - users
 */
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actions_log`
--

DROP TABLE IF EXISTS `actions_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actions_log` (
  `action_id` int NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `action_date` date DEFAULT NULL,
  `action_time` time DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `actions_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions_log`
--

LOCK TABLES `actions_log` WRITE;
/*!40000 ALTER TABLE `actions_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `all_articles`
--

DROP TABLE IF EXISTS `all_articles`;
/*!50001 DROP VIEW IF EXISTS `all_articles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_articles` AS SELECT 
 1 AS `article_id`,
 1 AS `article_title`,
 1 AS `article_bg_color`,
 1 AS `article_text_color`,
 1 AS `article_title_color`,
 1 AS `article_highlight_color`,
 1 AS `article_created_at`,
 1 AS `article_updated_at`,
 1 AS `cat`,
 1 AS `subcats`,
 1 AS `autor`,
 1 AS `sections`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `article_subcat_relation`
--

DROP TABLE IF EXISTS `article_subcat_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_subcat_relation` (
  `article_id` int DEFAULT NULL,
  `subcat_id` int DEFAULT NULL,
  KEY `article_id` (`article_id`),
  KEY `subcat_id` (`subcat_id`),
  CONSTRAINT `article_subcat_relation_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`),
  CONSTRAINT `article_subcat_relation_ibfk_2` FOREIGN KEY (`subcat_id`) REFERENCES `sub_categories` (`subcat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_subcat_relation`
--

LOCK TABLES `article_subcat_relation` WRITE;
/*!40000 ALTER TABLE `article_subcat_relation` DISABLE KEYS */;
INSERT INTO `article_subcat_relation` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `article_subcat_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `autor` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `bg_color` varchar(100) DEFAULT NULL,
  `text_color` varchar(100) DEFAULT NULL,
  `title_color` varchar(100) DEFAULT NULL,
  `highlight_color` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  UNIQUE KEY `article_id` (`article_id`),
  KEY `autor` (`autor`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,1,'How to create a blog',NULL,NULL,NULL,NULL,'2020-01-01 06:00:00','2020-01-01 06:00:00'),(2,2,'How to create a blog',NULL,NULL,NULL,NULL,'2020-01-01 06:00:00','2020-01-01 06:00:00'),(3,3,'How to create a blog',NULL,NULL,NULL,NULL,'2020-01-01 06:00:00','2020-01-01 06:00:00');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `articles_by_user`
--

DROP TABLE IF EXISTS `articles_by_user`;
/*!50001 DROP VIEW IF EXISTS `articles_by_user`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `articles_by_user` AS SELECT 
 1 AS `article_id`,
 1 AS `article_title`,
 1 AS `article_bg_color`,
 1 AS `article_text_color`,
 1 AS `article_title_color`,
 1 AS `article_highlight_color`,
 1 AS `article_created_at`,
 1 AS `article_updated_at`,
 1 AS `cat`,
 1 AS `subcats`,
 1 AS `autor`,
 1 AS `sections`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `articles_dividen_by_category`
--

DROP TABLE IF EXISTS `articles_dividen_by_category`;
/*!50001 DROP VIEW IF EXISTS `articles_dividen_by_category`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `articles_dividen_by_category` AS SELECT 
 1 AS `cat_id`,
 1 AS `category_title`,
 1 AS `article_id`,
 1 AS `article_title`,
 1 AS `article_created_at`,
 1 AS `article_updated_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Technology','2020-01-01 06:00:00','2020-01-01 06:00:00'),(2,'Sports','2020-01-01 06:00:00','2020-01-01 06:00:00'),(3,'Science','2020-01-01 06:00:00','2020-01-01 06:00:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main`
--

DROP TABLE IF EXISTS `main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main` (
  `main_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `bg_color` varchar(100) DEFAULT NULL,
  `text_color` varchar(100) DEFAULT NULL,
  `title_color` varchar(100) DEFAULT NULL,
  `highlight_color` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`main_id`),
  UNIQUE KEY `main_id` (`main_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main`
--

LOCK TABLES `main` WRITE;
/*!40000 ALTER TABLE `main` DISABLE KEYS */;
INSERT INTO `main` VALUES (1,'Blog de Lynx Pardelle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `section_id` int NOT NULL AUTO_INCREMENT,
  `article` int DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `text` varchar(600) DEFAULT NULL,
  `bg_color` varchar(100) DEFAULT NULL,
  `text_color` varchar(100) DEFAULT NULL,
  `title_color` varchar(100) DEFAULT NULL,
  `highlight_color` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `article` (`article`),
  CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`article`) REFERENCES `articles` (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,'How to create a blog','How to create a blog',NULL,NULL,NULL,NULL,'2020-01-01 06:00:00','2020-01-01 06:00:00'),(2,2,'How to create a blog','How to create a blog',NULL,NULL,NULL,NULL,'2020-01-01 06:00:00','2020-01-01 06:00:00'),(3,3,'How to create a blog','How to create a blog',NULL,NULL,NULL,NULL,'2020-01-01 06:00:00','2020-01-01 06:00:00');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categories` (
  `subcat_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`subcat_id`),
  UNIQUE KEY `subcat_id` (`subcat_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `sub_categories_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'Programming',1,'2020-01-01 06:00:00','2020-01-01 06:00:00'),(2,'Football',2,'2020-01-01 06:00:00','2020-01-01 06:00:00'),(3,'Biology',3,'2020-01-01 06:00:00','2020-01-01 06:00:00');
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `subcats_by_cat`
--

DROP TABLE IF EXISTS `subcats_by_cat`;
/*!50001 DROP VIEW IF EXISTS `subcats_by_cat`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `subcats_by_cat` AS SELECT 
 1 AS `subcat_id`,
 1 AS `title`,
 1 AS `cat_id`,
 1 AS `created_at`,
 1 AS `updated_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `usage_statistics`
--

DROP TABLE IF EXISTS `usage_statistics`;
/*!50001 DROP VIEW IF EXISTS `usage_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usage_statistics` AS SELECT 
 1 AS `total_users`,
 1 AS `total_articles`,
 1 AS `total_categories`,
 1 AS `total_subcategories`,
 1 AS `total_sections`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_article_counts`
--

DROP TABLE IF EXISTS `user_article_counts`;
/*!50001 DROP VIEW IF EXISTS `user_article_counts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_article_counts` AS SELECT 
 1 AS `user_id`,
 1 AS `name`,
 1 AS `last_name`,
 1 AS `article_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `bg_color` varchar(100) DEFAULT NULL,
  `text_color` varchar(100) DEFAULT NULL,
  `title_color` varchar(100) DEFAULT NULL,
  `highlight_color` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alec','Montaño','alec@montaño.com','Lynx','1234','https://picsum.photos/200',NULL,NULL,NULL,NULL,'2020-01-01 06:00:00','2020-01-01 06:00:00'),(2,'Juan','Cabrera','juan@cabrera.com','Goat','5678','https://picsum.photos/201',NULL,NULL,NULL,NULL,'2020-01-01 06:00:00','2020-01-01 06:00:00'),(3,'Eliz','Lamb','elisa@lamb.com','Lamb','90AB','https://picsum.photos/202',NULL,NULL,NULL,NULL,'2020-01-01 06:00:00','2020-01-01 06:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `all_articles`
--

/*!50001 DROP VIEW IF EXISTS `all_articles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_articles` AS select `articles`.`article_id` AS `article_id`,`articles`.`title` AS `article_title`,`articles`.`bg_color` AS `article_bg_color`,`articles`.`text_color` AS `article_text_color`,`articles`.`title_color` AS `article_title_color`,`articles`.`highlight_color` AS `article_highlight_color`,`articles`.`created_at` AS `article_created_at`,`articles`.`updated_at` AS `article_updated_at`,json_object('cat_id',`categories`.`cat_id`,'title',`categories`.`title`) AS `cat`,json_arrayagg(json_object('subcat_id',`sub_categories`.`subcat_id`,'title',`sub_categories`.`title`)) AS `subcats`,json_object('user_id',`users`.`user_id`,'name',`users`.`name`,'last_name',`users`.`last_name`,'email',`users`.`email`,'nickname',`users`.`nickname`,'avatar',`users`.`avatar`,'bg_color',`users`.`bg_color`,'text_color',`users`.`text_color`,'title_color',`users`.`title_color`,'highlight_color',`users`.`highlight_color`,'created_at',`users`.`created_at`,'updated_at',`users`.`updated_at`) AS `autor`,json_arrayagg(json_object('section_id',`sections`.`section_id`,'title',`sections`.`title`,'text',`sections`.`text`,'bg_color',`sections`.`bg_color`,'text_color',`sections`.`text_color`,'title_color',`sections`.`title_color`,'highlight_color',`sections`.`highlight_color`,'created_at',`sections`.`created_at`,'updated_at',`sections`.`updated_at`)) AS `sections` from (((((`articles` join `users` on((`articles`.`autor` = `users`.`user_id`))) join `article_subcat_relation` on((`articles`.`article_id` = `article_subcat_relation`.`article_id`))) join `sub_categories` on((`article_subcat_relation`.`subcat_id` = `sub_categories`.`subcat_id`))) join `categories` on((`sub_categories`.`cat_id` = `categories`.`cat_id`))) left join `sections` on((`articles`.`article_id` = `sections`.`article`))) group by `articles`.`article_id`,`users`.`user_id`,`categories`.`cat_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `articles_by_user`
--

/*!50001 DROP VIEW IF EXISTS `articles_by_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `articles_by_user` AS select `articles`.`article_id` AS `article_id`,`articles`.`title` AS `article_title`,`articles`.`bg_color` AS `article_bg_color`,`articles`.`text_color` AS `article_text_color`,`articles`.`title_color` AS `article_title_color`,`articles`.`highlight_color` AS `article_highlight_color`,`articles`.`created_at` AS `article_created_at`,`articles`.`updated_at` AS `article_updated_at`,json_object('cat_id',`categories`.`cat_id`,'title',`categories`.`title`) AS `cat`,json_arrayagg(json_object('subcat_id',`sub_categories`.`subcat_id`,'title',`sub_categories`.`title`)) AS `subcats`,json_object('user_id',`users`.`user_id`,'name',`users`.`name`,'last_name',`users`.`last_name`,'email',`users`.`email`,'nickname',`users`.`nickname`,'avatar',`users`.`avatar`,'bg_color',`users`.`bg_color`,'text_color',`users`.`text_color`,'title_color',`users`.`title_color`,'highlight_color',`users`.`highlight_color`,'created_at',`users`.`created_at`,'updated_at',`users`.`updated_at`) AS `autor`,json_arrayagg(json_object('section_id',`sections`.`section_id`,'title',`sections`.`title`,'text',`sections`.`text`,'bg_color',`sections`.`bg_color`,'text_color',`sections`.`text_color`,'title_color',`sections`.`title_color`,'highlight_color',`sections`.`highlight_color`,'created_at',`sections`.`created_at`,'updated_at',`sections`.`updated_at`)) AS `sections` from (((((`articles` join `users` on((`articles`.`autor` = `users`.`user_id`))) join `article_subcat_relation` on((`articles`.`article_id` = `article_subcat_relation`.`article_id`))) join `sub_categories` on((`article_subcat_relation`.`subcat_id` = `sub_categories`.`subcat_id`))) join `categories` on((`sub_categories`.`cat_id` = `categories`.`cat_id`))) left join `sections` on((`articles`.`article_id` = `sections`.`article`))) where (`users`.`user_id` = `users`.`user_id`) group by `articles`.`article_id`,`users`.`user_id`,`categories`.`cat_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `articles_dividen_by_category`
--

/*!50001 DROP VIEW IF EXISTS `articles_dividen_by_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `articles_dividen_by_category` AS select `c`.`cat_id` AS `cat_id`,`c`.`title` AS `category_title`,`a`.`article_id` AS `article_id`,`a`.`title` AS `article_title`,`a`.`created_at` AS `article_created_at`,`a`.`updated_at` AS `article_updated_at` from (((`categories` `c` join `sub_categories` `sc` on((`c`.`cat_id` = `sc`.`cat_id`))) join `article_subcat_relation` `asr` on((`sc`.`subcat_id` = `asr`.`subcat_id`))) join `articles` `a` on((`asr`.`article_id` = `a`.`article_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subcats_by_cat`
--

/*!50001 DROP VIEW IF EXISTS `subcats_by_cat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subcats_by_cat` AS select `sub_categories`.`subcat_id` AS `subcat_id`,`sub_categories`.`title` AS `title`,`sub_categories`.`cat_id` AS `cat_id`,`sub_categories`.`created_at` AS `created_at`,`sub_categories`.`updated_at` AS `updated_at` from `sub_categories` where (`sub_categories`.`cat_id` = `sub_categories`.`cat_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usage_statistics`
--

/*!50001 DROP VIEW IF EXISTS `usage_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usage_statistics` AS select count(distinct `u`.`user_id`) AS `total_users`,count(distinct `a`.`article_id`) AS `total_articles`,count(distinct `c`.`cat_id`) AS `total_categories`,count(distinct `sc`.`subcat_id`) AS `total_subcategories`,count(distinct `s`.`section_id`) AS `total_sections` from (((((`users` `u` left join `articles` `a` on((`u`.`user_id` = `a`.`autor`))) left join `article_subcat_relation` `asr` on((`a`.`article_id` = `asr`.`article_id`))) left join `sub_categories` `sc` on((`asr`.`subcat_id` = `sc`.`subcat_id`))) left join `categories` `c` on((`sc`.`cat_id` = `c`.`cat_id`))) left join `sections` `s` on((`a`.`article_id` = `s`.`article`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_article_counts`
--

/*!50001 DROP VIEW IF EXISTS `user_article_counts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_article_counts` AS select `u`.`user_id` AS `user_id`,`u`.`name` AS `name`,`u`.`last_name` AS `last_name`,count(`a`.`article_id`) AS `article_count` from (`users` `u` left join `articles` `a` on((`u`.`user_id` = `a`.`autor`))) group by `u`.`user_id`,`u`.`name`,`u`.`last_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-10 19:55:36
