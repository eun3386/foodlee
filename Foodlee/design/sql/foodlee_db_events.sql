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
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '이벤트번호',
  `event_title` varchar(128) NOT NULL COMMENT '이벤트제목',
  `event_content` text NOT NULL COMMENT '이벤트내용',
  `event_start_date` date NOT NULL COMMENT '이벤트 시작 날짜',
  `event_end_date` date DEFAULT NULL COMMENT '이벤트 종료 날짜',
  `event_ongoing` int(11) NOT NULL DEFAULT '1' COMMENT '진행중 여부 1=진행 0=종료 ',
  `event_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '이벤트등록날짜 CURRENT_TIMESTAMP',
  `event_updated_at` timestamp NULL DEFAULT NULL,
  `event_like_count` int(11) DEFAULT '0',
  `read_count` int(11) DEFAULT '0',
  `like_members` varchar(1024) DEFAULT NULL,
  `tags` varchar(1024) DEFAULT NULL,
  `file_path` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (2,'awefadwg','기존 DB에 저장된 내용을 에디터에 적용할 문구기존 DB에 저장된 내용을 에디터에 적용할 문구<p>asdfae<img src=\"/foodlee/resources/photo_upload/2020052911020196f8f61b-92dc-4a15-bd19-12f2f47b5c18.jpg\" title=\"65565156_1396549007168144_4736165101399791856_n.jpg\" width=\"500\" height=\"500\" rwidth=\"500\" rheight=\"500\" style=\"border-color: rgb(0, 0, 0); width: 500px; height: 500px;\">&nbsp;</p>','2020-05-29','2020-05-30',1,'2020-05-29 09:41:39',NULL,0,1,NULL,NULL,'C:\\fusion11\\spring_ws\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Foodlee\\resources/photo_upload'),(3,'werfawet','기존 DB에 저장된 내용을 에디터에 적용할 문구<p>a<img src=\"/foodlee/resources/photo_upload/20200529110619225f036d-b6c5-44bc-bf3c-612f27be7c4e.gif\" title=\"%EA%B7%80%EC%97%AC%EC%9A%B4%EA%B3%A0%EC%96%91%EC%9D%B4_12.gif\">&nbsp;</p>','2020-05-29','1970-01-01',1,'2020-05-29 02:06:23',NULL,0,0,NULL,NULL,'C:\\fusion11\\spring_ws\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Foodlee\\resources/photo_upload'),(4,'aegadrg','기존 DB에 저장된 내용을 에디터에 적용할 문구<br style=\"clear:both;\"><p><img src=\"/foodlee/resources/photo_upload/202005291129302c49f54d-d7a4-434f-9ae1-8b202ecbbb1f.jpg\" title=\"%EB%8F%85%EA%B1%B0%EB%AF%B8%EC%84%B1%EC%9A%B4.jpg\"  width=\"1920\" height=\"1080\" style=\"border-color: rgb(0, 0, 0); width: 1920px; height: 1080px;\"><br style=\"clear:both;\">&nbsp;</p>','2020-05-29','2020-08-28',1,'2020-05-29 02:31:51','2020-05-29 02:31:51',0,1,NULL,NULL,'C:\\fusion11\\spring_ws\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Foodlee\\resources/photo_upload'),(5,'gkgkgk','점심시간<img src=\"/foodlee/resources/photo_upload/20200529114731b2b56ea5-acde-4784-a571-86bcbe7ef8de.jpg\" title=\"%EC%97%AC%EC%9A%B0%EB%AA%A8%ED%94%BC%EC%84%B1%EC%9A%B4.jpg\"  width=\"740\" height=\"416\" style=\"border-color: rgb(0, 0, 0); width: 740px; height: 416px; border-width: 0px; border-style: solid;\" border=\"0\" align=\"\" rwidth=\"\" rheight=\"\"><br style=\"clear:both;\">','2020-05-29','1970-01-01',1,'2020-05-29 02:48:00','2020-05-29 02:48:00',0,1,NULL,NULL,'C:\\fusion11\\spring_ws\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Foodlee\\resources/photo_upload/20200529114731b2b56ea5-acde-4784-a571-86bcbe7ef8de.jpg'),(6,'홈ㄴㄷ교ㅗㄷㄱ','고양이<img src=\"/foodlee/resources/photo_upload/20200529115017469a238a-5acf-460a-bf62-3091a52277c9.jpg\" title=\"65565156_1396549007168144_4736165101399791856_n.jpg\"  width=\"600\" height=\"600\" rwidth=\"600\" rheight=\"600\" style=\"border-color: rgb(0, 0, 0); width: 600px; height: 600px;\"><br style=\"clear:both;\"><p>&nbsp;</p>','2020-05-29','1970-01-01',1,'2020-05-29 02:50:31','2020-05-29 02:50:31',0,1,NULL,NULL,'20200529115017469a238a-5acf-460a-bf62-3091a52277c9.jpg'),(7,'누룽지탕','누룽지탕<img src=\"/foodlee/resources/photo_upload/20200529134752dd9d8c80-7d2a-497b-b70f-d80d16a4eb44.jpg\" title=\"%EB%88%84%EB%A3%BD%EC%A7%80%ED%83%95.jpg\"  width=\"600\" height=\"600\" rwidth=\"600\" rheight=\"600\" style=\"border-color: rgb(0, 0, 0); width: 600px; height: 600px;\"><br style=\"clear:both;\"><p>&nbsp;</p>','2020-05-29','1970-01-01',1,'2020-05-29 04:48:04','2020-05-29 04:48:04',0,1,NULL,NULL,'20200529134752dd9d8c80-7d2a-497b-b70f-d80d16a4eb44.jpg'),(8,'누룽지탕','기존 DB에 저장된 내용을 에디터에 적용할 문구누룽지탕<img src=\"/foodlee/resources/photo_upload/20200529134752dd9d8c80-7d2a-497b-b70f-d80d16a4eb44.jpg\" title=\"%EB%88%84%EB%A3%BD%EC%A7%80%ED%83%95.jpg\" width=\"600\" height=\"600\" rwidth=\"600\" rheight=\"600\" style=\"border-color: rgb(0, 0, 0); width: 600px; height: 600px;\"><br style=\"clear:both;\"><p>&nbsp;</p>','2020-05-29','1970-01-01',1,'2020-05-29 04:49:08','2020-05-29 04:49:08',0,1,NULL,NULL,''),(9,'누룽지탕','누룽지<img src=\"/foodlee/resources/photo_upload/20200529135031fa77b097-eeed-4e8d-a14a-eaaa9f068916.jpg\" title=\"%EB%88%84%EB%A3%BD%EC%A7%80%ED%83%95.jpg\"  width=\"600\" height=\"600\" rwidth=\"600\" rheight=\"600\" style=\"border-color: rgb(0, 0, 0); width: 600px; height: 600px;\"><br style=\"clear:both;\"><p>&nbsp;</p>','2020-05-29','1970-01-01',1,'2020-05-29 04:50:52','2020-05-29 04:50:52',0,1,NULL,NULL,'20200529135031fa77b097-eeed-4e8d-a14a-eaaa9f068916.jpg'),(10,'누룽지탕2','기존 DB에 저장된 내용을 에디터에 적용할 문구기존 DB에 저장된 내용을 에디터에 적용할 문구누룽지<img src=\"/foodlee/resources/photo_upload/20200529135031fa77b097-eeed-4e8d-a14a-eaaa9f068916.jpg\" title=\"%EB%88%84%EB%A3%BD%EC%A7%80%ED%83%95.jpg\" width=\"600\" height=\"600\" rwidth=\"600\" rheight=\"600\" style=\"border-color: rgb(0, 0, 0); width: 600px; height: 600px;\"><br style=\"clear:both;\"><p>&nbsp;</p>','2020-05-29',NULL,1,'2020-05-29 04:54:35','2020-05-29 04:54:35',0,1,NULL,NULL,''),(11,'은하수','은하<img src=\"/foodlee/resources/photo_upload/20200529135849d9a61689-eb20-4d18-a940-72f6809236fb.jpg\" title=\"%EC%9D%80%ED%95%98%EC%88%98.jpg\"  width=\"1920\" height=\"600\" style=\"border-color: rgb(0, 0, 0); width: 1920px; height: 600px; border-width: 0px; border-style: solid;\" border=\"0\" align=\"\" rwidth=\"\" rheight=\"600\" noadjust=\"true\"><br style=\"clear:both;\"><p>&nbsp;</p>','2020-05-29',NULL,0,'2020-05-29 04:59:37','2020-05-29 04:59:37',0,1,NULL,NULL,'20200529135849d9a61689-eb20-4d18-a940-72f6809236fb.jpg'),(12,'테스트','<p>나오나?</p><p>&nbsp;</p><p><img src=\"/foodlee/resources/photo_upload/20200529155915687fcd72-c254-436d-b6ad-2e969548e4dc.jpg\" title=\"65565156_1396549007168144_4736165101399791856_n.jpg\"  width=\"600\" height=\"600\" rwidth=\"600\" rheight=\"600\" style=\"border-color: rgb(0, 0, 0); width: 600px; height: 600px;\"></p><p>&nbsp;</p>','2020-05-29',NULL,1,'2020-05-29 07:06:16','2020-05-29 07:06:16',0,7,NULL,NULL,'20200529155915687fcd72-c254-436d-b6ad-2e969548e4dc.jpg'),(13,'안녕','기존 DB에 저장된 내용을 에디터에 적용할 문구<img src=\"/foodlee/resources/photo_upload/202005291730341213bfbd-644b-4ca7-a3a8-306845dcfc1a.jpg\" title=\"%EC%9E%A5%EB%AF%B8%EC%84%B1%EC%9A%B4.jpg\"  width=\"1920\" height=\"1080\" style=\"border-color: rgb(0, 0, 0); width: 1920px; height: 1080px;\"><br style=\"clear:both;\"><p>&nbsp;</p>','2020-05-29',NULL,0,'2020-05-29 08:31:06','2020-05-29 08:31:06',0,1,NULL,NULL,'202005291730341213bfbd-644b-4ca7-a3a8-306845dcfc1a.jpg'),(14,'업데이티드앳','기존 DB에 저장된 내용을 에디터에 적용할 문구<img src=\"/foodlee/resources/photo_upload/202005291736470cee75f2-f9f3-4c79-96e7-82b4983db22d.gif\" title=\"%EA%B7%80%EC%97%AC%EC%9A%B4%EA%B3%A0%EC%96%91%EC%9D%B4_12.gif\"><br style=\"clear:both;\"><p>&nbsp;</p>','2020-05-29','2020-07-31',0,'2020-05-29 09:41:01',NULL,0,11,NULL,NULL,'202005291736470cee75f2-f9f3-4c79-96e7-82b4983db22d.gif');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-29 20:49:12
