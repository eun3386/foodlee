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
  `event_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '이벤트등록날짜 CURRENT_TIMESTAMP',
  `event_updated_at` timestamp NULL DEFAULT NULL,
  `like_count` int(11) DEFAULT '0',
  `read_count` int(11) DEFAULT '0',
  `like_members` varchar(1024) DEFAULT NULL,
  `tags` varchar(1024) DEFAULT NULL,
  `file_path` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (23,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,2,30,'9,8',NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(24,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\" width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p><p>&nbsp;</p>','2020-05-01','1970-01-01',0,'2020-06-02 16:43:40','2020-06-02 16:54:32',1,14,'9',NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(25,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,1,15,'2',NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(26,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,4,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(27,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,1,8,'2',NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(28,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\" width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p><p>&nbsp;</p>','2020-05-01','1970-01-01',0,'2020-06-02 16:43:40','2020-06-02 16:54:21',0,8,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(29,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,2,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(30,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\" width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p><p>&nbsp;</p>','2020-05-01','1970-01-01',0,'2020-06-02 16:43:40','2020-06-02 16:54:44',0,8,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(31,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,1,6,'2',NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(32,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(33,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,2,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(34,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(35,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(36,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(37,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(38,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(39,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(40,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(41,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(42,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(43,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(44,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(45,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(46,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(47,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(48,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(49,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(50,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(51,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(52,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(53,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(54,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(55,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(56,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(57,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(58,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(59,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(60,'밤도깨비 야시장 장정 중단','<p><img src=\"/foodlee/resources/photo_upload/202006031137406d860487-9657-4002-9722-5acc6a98dab9.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"><br style=\"clear:both;\">&nbsp;</p>','2020-04-02',NULL,1,'2020-06-03 02:37:43',NULL,0,7,NULL,NULL,'202006031137406d860487-9657-4002-9722-5acc6a98dab9.jpg');
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

-- Dump completed on 2020-06-03 12:57:02
