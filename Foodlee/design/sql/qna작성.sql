-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: foodlee_db
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
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qna` (
  `qna_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(12) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `qna_depth` int(11) NOT NULL,
  `qna_pnum` varchar(12) DEFAULT NULL,
  `qna_content` varchar(2048) NOT NULL,
  `qna_secret` tinyint(4) NOT NULL,
  `qna_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`qna_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'poro',1,0,NULL,'테스트',0,'2020-05-25 05:04:49'),(2,'seller1',1,1,'1','테스트 답변',0,'2020-05-25 05:05:09'),(45,'poro',1,0,NULL,'yesti',1,'2020-05-25 08:55:13'),(46,'seller1',1,1,'45','567',1,'2020-05-26 01:44:36'),(49,'poro',1,0,NULL,'44444444444',1,'2020-05-26 02:05:23'),(50,'seller1',1,1,'49','456',1,'2020-05-26 02:52:53'),(51,'test',1,0,NULL,'test',1,'2020-05-26 02:57:36'),(52,'seller2',2,0,NULL,'54',0,'2020-05-26 08:33:30'),(54,'seller2',2,0,NULL,'zxc',1,'2020-05-26 08:37:33'),(56,'seller1',1,1,'51','1234',1,'2020-05-27 03:11:06');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-29 16:37:45
