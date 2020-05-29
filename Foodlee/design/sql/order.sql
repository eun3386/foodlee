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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(12) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `order_name` varchar(512) NOT NULL,
  `order_number` varchar(128) NOT NULL,
  `order_price` varchar(512) NOT NULL,
  `order_price_sum` int(11) NOT NULL,
  `order_state` int(11) NOT NULL DEFAULT '1',
  `order_reason` varchar(256) DEFAULT NULL,
  `order_requests` varchar(512) DEFAULT NULL,
  `order_merchant_uid` varchar(512) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'test',1,'닭꼬치1,닭꼬치3,닭꼬치2','1,1,1','3000,3200,3100',9300,1,'',NULL,'','2020-05-27 04:18:53'),(2,'test',1,'닭꼬치1,닭꼬치2,닭꼬치3','4,3,1','12000,9300,3200',24500,1,'',NULL,'','2020-05-27 04:18:53'),(3,'poro',1,'닭꼬치2,닭꼬치1','1,1','3100,3000',6100,1,'',NULL,'','2020-05-27 04:20:24'),(4,'poro',1,'닭꼬치1,닭꼬치2','1,1','3000,3100',6100,1,'',NULL,'','2020-05-27 04:37:19'),(5,'poro',1,'닭꼬치1','1','3000',3000,1,'',NULL,'','2020-05-27 08:39:42'),(6,'poro',1,'옛날핫도그,치즈핫도그,감자핫도그','1,2,1','2000,5000,2500',9500,1,'',NULL,'merchant_1590653292643','2020-05-28 08:09:05'),(7,'poro',1,'옛날핫도그,치즈핫도그','1,1','2000,2500',4500,1,'','요청사항 테스트','merchant_1590654268263','2020-05-28 08:25:17');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-29 16:56:42
