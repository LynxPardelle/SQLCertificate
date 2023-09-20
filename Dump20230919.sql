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
-- Dumping data for table `actions_log`
--

LOCK TABLES `actions_log` WRITE;
/*!40000 ALTER TABLE `actions_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `article_subcat_relation`
--

LOCK TABLES `article_subcat_relation` WRITE;
/*!40000 ALTER TABLE `article_subcat_relation` DISABLE KEYS */;
INSERT INTO `article_subcat_relation` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `article_subcat_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,1,'How to create a blog','2020-01-01 06:00:00','2020-01-01 06:00:00'),(2,2,'How to create a blog','2020-01-01 06:00:00','2020-01-01 06:00:00'),(3,3,'How to create a blog','2020-01-01 06:00:00','2020-01-01 06:00:00');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Technology','2020-01-01 06:00:00','2020-01-01 06:00:00'),(2,'Sports','2020-01-01 06:00:00','2020-01-01 06:00:00'),(3,'Science','2020-01-01 06:00:00','2020-01-01 06:00:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,'How to create a blog','How to create a blog','2020-01-01 06:00:00','2020-01-01 06:00:00'),(2,2,'How to create a blog','How to create a blog','2020-01-01 06:00:00','2020-01-01 06:00:00'),(3,3,'How to create a blog','How to create a blog','2020-01-01 06:00:00','2020-01-01 06:00:00');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'Programming',1,'2020-01-01 06:00:00','2020-01-01 06:00:00'),(2,'Football',2,'2020-01-01 06:00:00','2020-01-01 06:00:00'),(3,'Biology',3,'2020-01-01 06:00:00','2020-01-01 06:00:00');
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alec','Montaño','alec@montaño.com','Lynx','12345678','https://picsum.photos/200','2020-01-01 06:00:00','2020-01-01 06:00:00'),(2,'Juan','Cabrera','juan@cabrera.com','Goat','5678','https://picsum.photos/201','2020-01-01 06:00:00','2020-01-01 06:00:00'),(3,'Eliz','Lamb','elisa@lamb.com','Lamb','90AB','https://picsum.photos/202','2020-01-01 06:00:00','2020-01-01 06:00:00'),(5,'ing','think','think@er.info','thinker','contraseña','https://picsum.photos/207',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-19 19:33:06
