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
-- Table structure for table `foodtrucks`
--

DROP TABLE IF EXISTS `foodtrucks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodtrucks` (
  `seller_id` int(11) NOT NULL COMMENT '<<FK>> 판매자 번호',
  `foodtruck_img_path` varchar(256) NOT NULL COMMENT '푸드트럭 이미지 경로',
  `foodtruck_name` varchar(64) NOT NULL COMMENT '푸드트럭 이름 ',
  `foodtruck_main_menu` varchar(512) NOT NULL,
  `foodtruck_location` varchar(256) NOT NULL COMMENT '푸드트럭 위치',
  `foodtruck_muni` varchar(256) NOT NULL COMMENT '푸드트럭 구',
  `foodtruck_gu_code` varchar(1024) NOT NULL,
  `foodtruck_operation_hour` varchar(64) NOT NULL,
  `favorite_count` int(11) DEFAULT NULL COMMENT '<<FK>> 좋아요 트럭',
  `member_like_count` int(11) DEFAULT NULL,
  `member_like_ids` varchar(1024) DEFAULT NULL,
  `seller_foodtruck_coordinate` varchar(1024) DEFAULT NULL,
  `location_updated_at` timestamp NULL DEFAULT NULL COMMENT 'CURRENT_TIMESTAMP',
  KEY `for_sel_key_idx` (`seller_id`),
  CONSTRAINT `seller_key` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtrucks`
--

LOCK TABLES `foodtrucks` WRITE;
/*!40000 ALTER TABLE `foodtrucks` DISABLE KEYS */;
INSERT INTO `foodtrucks` VALUES (1,'푸드마케ㅌ.jpg','푸드마케ㅌ','닭꼬치, 양꼬치, 치즈핫도그','아차산역앞','광진구','11050','12:00 ~ 18:00',0,0,NULL,'',NULL),(2,'형아네.jpg','형아네','양꼬치','천호역앞','강동구','11250','13:00 ~ 19:00',0,0,NULL,'',NULL),(3,'BAM MA SIL.jpg','BAM MA SIL','칠리쉬림프, 갈릭버터쉬림프, 레몬크림쉬림프','용산역앞','용산구','11030','16:00 ~ 22:00',0,0,NULL,'',NULL),(4,'미드나잇.jpg','미드나잇','새우플레이트, 마약옥수수','성신여대입구역앞','성북구','11080','12:00 ~ 18:00',0,0,NULL,'',NULL),(5,'Yo! Chef!.jpg','Yo! Chef!','갈비꼬치, 데리롱닭꼬치, 마요롱닭꼬치, 매운롱닭꼬치, 스테이크꼬치, 쏘떡쏘떡, 치즈롱닭꼬치','중랑천앞','중랑구','11070','13:00 ~ 19:00',0,0,NULL,'',NULL),(6,'불아이스.jpg','불아이스','닭꼬치, 새우 모듬 튀김','롯데월드입구앞','송파구','11240','12:00 ~ 18:00',0,0,NULL,'',NULL),(7,'나는 닭강정 이다.jpg','나는 닭강정 이다','닭강정','강남역앞','강남구','11230','16:00 ~ 22:00',0,0,NULL,'',NULL),(8,'맛짱.jpg','맛짱','닭강정','교대역앞','서초구','11220','12:00 ~ 18:00',0,0,NULL,'',NULL),(9,'불타는네모반점.jpg','불타는네모반점','네모새우, 레몬크림새우','타임스퀘어앞','영등포구','11190','12:00 ~ 18:00',0,0,NULL,'',NULL),(10,'아라푸드.jpg','아라푸드','아라 타코야키','구로디지털단지역앞','구로구','11170','12:00 ~ 18:00',0,0,NULL,'',NULL);
/*!40000 ALTER TABLE `foodtrucks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-21 18:34:47
