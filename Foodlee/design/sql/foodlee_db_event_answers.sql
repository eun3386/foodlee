-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: foodlee_db
-- ------------------------------------------------------
-- Server version	5.6.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `event_answers`
--

DROP TABLE IF EXISTS `event_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_answers` (
  `ev_as_id` int(11) NOT NULL AUTO_INCREMENT,
  `ev_as_reply` text NOT NULL,
  `ev_as_compassion` int(11) DEFAULT '0',
  `event_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ev_as_id`),
  KEY `event_id_idx` (`event_id`),
  KEY `mb_id_idx` (`member_id`),
  CONSTRAINT `event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mb_id` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_answers`
--

LOCK TABLES `event_answers` WRITE;
/*!40000 ALTER TABLE `event_answers` DISABLE KEYS */;
INSERT INTO `event_answers` VALUES (1,'ccccccccccccccc',0,23,9,'2020-06-03 01:44:47','2020-06-03 01:44:47'),(2,'dddddddddddddddd',0,23,9,'2020-06-03 01:47:38','2020-06-03 01:47:38'),(3,'ddddddddddddddd',0,23,9,'2020-06-03 01:49:37','2020-06-03 01:49:37'),(4,'eeeeeeeeeeee',0,23,9,'2020-06-03 01:51:10','2020-06-03 01:51:10'),(5,'ffffffffffff',0,23,9,'2020-06-03 01:54:41','2020-06-03 01:54:41'),(6,'wwwwwwwwwwwww',0,23,9,'2020-06-03 02:04:25','2020-06-03 02:04:25'),(7,'ssssssssssssss',0,23,9,'2020-06-03 02:04:30','2020-06-03 02:04:30'),(8,'sssssssssssszzzxxxxx',0,24,9,'2020-06-03 02:04:42','2020-06-03 02:04:42'),(9,'ddddddddwwwww',0,24,9,'2020-06-03 02:07:45','2020-06-03 02:07:45'),(10,'xzxzXZ',0,23,9,'2020-06-03 02:12:09','2020-06-03 02:12:09'),(11,'czcxzcxx',0,24,9,'2020-06-03 02:12:17','2020-06-03 02:12:17'),(12,'점심시간 입니다.',0,60,1,'2020-06-03 02:43:47','2020-06-03 02:43:47'),(13,'반갑습니다.',0,27,1,'2020-06-03 03:34:34','2020-06-03 03:34:34'),(14,'ㅁㄴㅇㄹㄴㅇㄹ',0,27,1,'2020-06-03 03:48:04','2020-06-03 03:48:04');
/*!40000 ALTER TABLE `event_answers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-03 12:48:42
