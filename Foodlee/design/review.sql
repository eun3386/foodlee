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
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(12) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `review_depth` int(11) NOT NULL,
  `review_pnum` varchar(12) DEFAULT NULL,
  `review_content` text NOT NULL,
  `review_pic` varchar(512) DEFAULT NULL,
  `review_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'poro',0,0,NULL,'테스트',NULL,'2020-05-20 06:11:20'),(2,'poro',0,0,'2','테스트2',NULL,'2020-05-20 02:12:41'),(3,'admin',0,1,NULL,'테스트2에 대한 답변',NULL,'2020-05-20 02:17:47'),(4,'admin',0,1,'1','테스트에 대한 답변',NULL,'2020-05-10 02:01:23'),(5,'poro',0,0,NULL,'테스트3',NULL,'2020-05-20 02:17:50'),(6,'poro',0,0,NULL,'테스트4',NULL,'2020-05-20 02:17:53'),(7,'poro',0,0,NULL,'테스트4',NULL,'2020-05-20 02:17:55'),(8,'poro',0,0,NULL,'테스트4',NULL,'2020-05-20 02:17:57'),(9,'admin',0,1,'6','테스트4(6)에 대한 답변',NULL,'2020-05-10 02:01:23'),(10,'admin',0,1,'8','테스트4(8)에 대한 답변',NULL,'2020-05-10 02:01:23'),(11,'anna',1,0,NULL,'리뷰 하나 달기 ',NULL,'2020-05-20 02:17:59'),(13,'anna',0,0,NULL,'리뷰 테스트 ~~~',NULL,'2020-05-20 05:22:19');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-20 15:15:17
