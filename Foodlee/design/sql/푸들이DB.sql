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
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '푸드트럭 번호 <<FK>>',
  `ad_price` int(11) DEFAULT NULL COMMENT '광고금액 ',
  `ad_img` varchar(256) NOT NULL COMMENT '광고 이미지',
  `ad_start_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '적용 시작 기간',
  `ad_end_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '적용 종료 기간',
  `ad_type` varchar(16) DEFAULT NULL,
  `seller_id` mediumint(10) DEFAULT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_answers`
--

LOCK TABLES `event_answers` WRITE;
/*!40000 ALTER TABLE `event_answers` DISABLE KEYS */;
INSERT INTO `event_answers` VALUES (1,'ccccccccccccccc',0,23,9,'2020-06-03 01:44:47','2020-06-03 01:44:47'),(2,'dddddddddddddddd',0,23,9,'2020-06-03 01:47:38','2020-06-03 01:47:38'),(3,'ddddddddddddddd',0,23,9,'2020-06-03 01:49:37','2020-06-03 01:49:37'),(4,'eeeeeeeeeeee',0,23,9,'2020-06-03 01:51:10','2020-06-03 01:51:10'),(5,'ffffffffffff',0,23,9,'2020-06-03 01:54:41','2020-06-03 01:54:41'),(6,'wwwwwwwwwwwww',0,23,9,'2020-06-03 02:04:25','2020-06-03 02:04:25'),(7,'ssssssssssssss',0,23,9,'2020-06-03 02:04:30','2020-06-03 02:04:30'),(8,'sssssssssssszzzxxxxx',0,24,9,'2020-06-03 02:04:42','2020-06-03 02:04:42'),(9,'ddddddddwwwww',0,24,9,'2020-06-03 02:07:45','2020-06-03 02:07:45'),(10,'xzxzXZ',0,23,9,'2020-06-03 02:12:09','2020-06-03 02:12:09'),(11,'czcxzcxx',0,24,9,'2020-06-03 02:12:17','2020-06-03 02:12:17'),(12,'점심시간 입니다.',0,60,1,'2020-06-03 02:43:47','2020-06-03 02:43:47'),(13,'반갑습니다.',0,27,1,'2020-06-03 03:34:34','2020-06-03 03:34:34'),(14,'ㅁㄴㅇㄹㄴㅇㄹ',0,27,1,'2020-06-03 03:48:04','2020-06-03 03:48:04'),(15,'발표',0,23,28,'2020-06-03 04:08:28','2020-06-03 04:08:28'),(16,'ㄻㄴㅇㄹㄴㅇ',0,60,28,'2020-06-03 04:18:32','2020-06-03 04:18:32'),(17,'asdf',0,60,7,'2020-06-03 04:18:59','2020-06-03 04:18:59'),(18,'푸들이',0,60,30,'2020-06-03 06:14:30','2020-06-03 06:14:30');
/*!40000 ALTER TABLE `event_answers` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (23,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,3,34,'9,8,28',NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(24,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\" width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p><p>&nbsp;</p>','2020-05-01','1970-01-01',0,'2020-06-02 16:43:40','2020-06-02 16:54:32',1,14,'9',NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(25,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,1,15,'2',NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(26,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,5,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(27,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,1,9,'2',NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(28,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\" width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p><p>&nbsp;</p>','2020-05-01','1970-01-01',0,'2020-06-02 16:43:40','2020-06-02 16:54:21',0,8,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(29,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,2,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(30,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\" width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p><p>&nbsp;</p>','2020-05-01','1970-01-01',0,'2020-06-02 16:43:40','2020-06-02 16:54:44',0,9,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(31,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,1,6,'2',NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(32,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(33,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,2,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(34,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(35,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(36,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(37,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(38,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(39,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(40,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(41,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(42,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(43,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(44,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(45,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(46,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(47,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(48,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(49,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(50,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(51,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(52,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(53,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(54,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(55,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(56,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(57,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(58,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(59,'밤도깨비 야시장 잠정중단','<p><img src=\"/foodlee/resources/photo_upload/2020060301430957521084-899f-4806-b458-b2176270cf94.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"  width=\"800\" height=\"800\" style=\"border-color: rgb(0, 0, 0); width: 800px; height: 800px;\">&nbsp;</p>','2020-05-01',NULL,1,'2020-06-02 16:43:40',NULL,0,1,NULL,NULL,'2020060301430957521084-899f-4806-b458-b2176270cf94.jpg'),(60,'밤도깨비 야시장 장정 중단','<p><img src=\"/foodlee/resources/photo_upload/202006031137406d860487-9657-4002-9722-5acc6a98dab9.jpg\" title=\"%EB%B0%A4%EB%8F%84%EA%B9%A8%EB%B9%84%EC%95%BC%EC%8B%9C%EC%9E%A5.jpg\"><br style=\"clear:both;\">&nbsp;</p>','2020-04-02',NULL,1,'2020-06-03 02:37:43',NULL,1,18,'28',NULL,'202006031137406d860487-9657-4002-9722-5acc6a98dab9.jpg'),(62,'이벤트','<p><img src=\"/foodlee/resources/photo_upload/202006031515308aa12488-988f-43b3-8c90-724ecc5b94d9.jpg\" title=\"%EA%B3%A0%EC%96%91%EC%9D%B4.jpg\" width=\"600\" height=\"600\" rwidth=\"600\" rheight=\"600\" style=\"border-color: rgb(0, 0, 0); width: 600px; height: 600px;\"></p><p>고양이</p><p>&nbsp;ㄷㄷㄷ</p><p>&nbsp;</p><p>&nbsp;</p>','2020-05-07','2020-06-03',0,'2020-06-03 06:15:47','2020-06-03 06:28:30',0,10,NULL,NULL,'202006031515308aa12488-988f-43b3-8c90-724ecc5b94d9.jpg');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodtrucks`
--

DROP TABLE IF EXISTS `foodtrucks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodtrucks` (
  `seller_id` int(11) NOT NULL COMMENT '<<FK>> 판매자 번호',
  `foodtruck_img_path` varchar(512) NOT NULL COMMENT '푸드트럭 이미지 경로',
  `foodtruck_name` varchar(64) NOT NULL COMMENT '푸드트럭 이름 ',
  `foodtruck_main_menu` varchar(512) NOT NULL,
  `foodtruck_location` varchar(256) NOT NULL COMMENT '푸드트럭 위치',
  `foodtruck_muni` varchar(256) NOT NULL COMMENT '푸드트럭 구',
  `foodtruck_gu_code` varchar(1024) NOT NULL,
  `foodtruck_operation_hour` varchar(64) NOT NULL,
  `member_like_count` int(11) NOT NULL DEFAULT '0',
  `member_like_ids` varchar(1024) DEFAULT NULL,
  `seller_foodtruck_coordinate` varchar(1024) NOT NULL,
  `location_updated_at` timestamp NULL DEFAULT NULL COMMENT 'CURRENT_TIMESTAMP',
  `menu_category` int(11) DEFAULT '1' COMMENT '1 = 간식, 2 = 식사, 3 = 디저트, 4 = 밥차',
  KEY `for_sel_key_idx` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtrucks`
--

LOCK TABLES `foodtrucks` WRITE;
/*!40000 ALTER TABLE `foodtrucks` DISABLE KEYS */;
INSERT INTO `foodtrucks` VALUES (1,'FoodMarkee.jpg','푸드마케ㅌ','닭꼬치, 양꼬치, 치즈핫도그','서울특별시 성동구 마장동 556','성동구','11040','12:00 ~ 18:00',28,'35,39','37.5688525,127.035873',NULL,1),(2,'Brother.jpg','형아네','양꼬치','서울특별시 강동구 성내동 448-11','강동구','11250','13:00 ~ 19:00',0,'','37.5240682,127.129345',NULL,1),(3,'BAMMASIL.jpg','BAM MA SIL','칠리 쉬림프, 갈릭 버터 쉬림프, 레몬 크림 쉬림프','서울특별시 용산구 한남동 101-1','용산구','11030','16:00 ~ 22:00',15,'','37.5313367,127.0083856',NULL,1),(4,'Midnight.jpg','미드나잇','새우 플레이트, 마약 옥수수','서울특별시 성북구 삼선동3가 42-5','성북구','11080','12:00 ~ 18:00',0,'','37.5868638,127.0138309',NULL,1),(5,'Yo!Chef!.jpg','Yo! Chef!','갈비꼬치, 데리 롱 닭꼬치, 마요 롱 닭꼬치, 매운 롱 닭꼬치, 스테이크 꼬치, 쏘떡쏘떡, 치즈 롱 닭꼬치','서울특별시 중랑구 망우동 537-16','중랑구','11070','13:00 ~ 19:00',0,'','37.6020403,127.1022187',NULL,1),(6,'FireIce.jpg','불아이스','닭꼬치, 새우 모듬 튀김','서울특별시 송파구 방이동 103-26','송파구','11240','12:00 ~ 18:00',0,'','37.5128559,127.1120214',NULL,1),(7,'IamChickenGangjeong.jpg','나는 닭강정 이다','닭강정','서울특별시 강남구 삼성동 25-10','강남구','11230','16:00 ~ 22:00',0,'','37.5150933,127.0491798',NULL,1),(8,'Great.jpg','맛짱','닭강정','서울특별시 서초구 서초동 1470-1','서초구','11220','12:00 ~ 18:00',1,'5','37.4809596,127.0076058',NULL,1),(9,'BurningSquare.jpg','불타는네모반점','네모 새우, 레몬 크림 새우','서울특별시 영등포구 당산동1가 412-1','영등포구','11190','12:00 ~ 18:00',0,'','37.5225183,126.8963724',NULL,1),(10,'AraFood.jpg','아라푸드','아라 타코야키','서울특별시 구로구 구로동 87-1','구로구','11170','12:00 ~ 18:00',13,'','37.4934591,126.8897967',NULL,1),(11,'HolicChur.jpg','홀릭츄릅','베이컨 새우말이 볶음밥, 불고기 핫도그, 치마새우(꼬치구이), 통살 새우 핫도그 ','서울특별시 금천구 시흥동 879-80','금천구','11180','16:00 ~ 22:00',17,'','37.4547618,126.9030182',NULL,2),(12,'HoneyFood.jpg','허니푸드','닭꼬치(데이야끼 소스, 매운맛 소스)','서울특별시 노원구 상계동 737','노원구','11110','13:00 ~ 19:00',0,'','37.6527914,127.0584242',NULL,2),(13,'COCOSALSA.jpg','COCO SALSA','케사디아, 타코, 부리또 볼','서울특별시 양천구 신정동 329','양천구','11150','12:00 ~ 18:00',0,'','37.5173164,126.8708707',NULL,2),(14,'PHILLSALSANDWICH.jpg','PHILLSAL SANDWICH','필리 치즈 스테이크 샌드위치, 연어 샌드위치, 닭발 샌드위치','서울특별시 은평구 응암동 96-38','은평구','11120','12:00 ~ 18:00',0,'','37.600332,126.9254505',NULL,2),(15,'TAKO-BOOM.jpg','TAKO-BOOM','타코(오리지널, 매운맛, 치즈맛)','서울특별시 노원구 상계동 624','도봉구','11100','13:00 ~ 19:00',0,'','37.6682245,127.0531068',NULL,2),(16,'GAESAEFOOD.jpg','GAE SAE FOOD','계란 듬뿍 샌드위치, 감자 사라다 샌드위치, 불고기 샌드위치, 돈까스 샌드위치','서울특별시 서대문구 연희동 141-34','서대문구','11130','16:00 ~ 22:00',0,'','37.5771163,126.9369073',NULL,2),(17,'Kim\'sDonut.jpg','킴스도넛','생 도넛츠, 꽈베기, 찹쌀 도넛츠','서울특별시 중구 신당동 405-1','중구','11020','12:00 ~ 18:00',0,'','37.560236,127.0103244',NULL,2),(18,'ChanicaniChickenGangjeong.jpg','차니차니 닭강정','닭강정(순한맛, 매운맛)','서울특별시 동작구 노량진동 313-39','동작구','11200','12:00 ~ 18:00',0,'','37.5074458,126.9385344',NULL,2),(19,'THEJAYU.jpg','THE JAYU','뉴욕 핫도그','서울특별시 강북구 미아동 195-1','강북구','11090','13:00 ~ 19:00',20,'','37.6320934,127.0258957',NULL,2),(20,'Bachelor.jpg','총각마차','닭꼬치(소금구이, 바베큐, 데리야끼, 매운맛)','서울특별시 광진구 자양동 621-4','광진구','11050','16:00 ~ 22:00',0,'','37.5349758,127.0796928',NULL,2),(21,'LayeredSand.jpg','겹겹이 쿡 샌드','바베큐 핫 샌드위치, 치킨 바베큐 핫 샌드위치, 참치 샐러드 샌드위치','서울특별시 성동구 행당동 3-18','성동구','11040','16:00 ~ 22:00',22,'','37.5605494,127.0405502',NULL,3),(22,'CheeseInTheTrap.jpg','치즈인더트랩','새우 버터 구이, 구워먹는 치즈','서울특별시 마포구 합정동 444-12','마포구','11140','13:00 ~ 19:00',0,'','37.5509813,126.9054178',NULL,3),(23,'NyamNyamJjeobJjeob.jpg','냠냠쩝쩝','수제 왕소세지, 프리미엄 파떡 닭꼬치, 양갈비 꼬치','서울특별시 금천구 시흥동 990-53','금천구','11180','12:00 ~ 18:00',16,'','37.4500603,126.9013445',NULL,3),(24,'Dakoachi.jpg','다코아찌','타코야끼','서울특별시 서초구 방배동 593-77','서초구','11220','12:00 ~ 18:00',0,'','37.4750338,126.993594',NULL,3),(25,'SURFDOG.jpg','SURFDOG','서프독, 하와이안, 치즈독, 불독, 칠리 치즈독','서울특별시 중구 순화동 217','종로구','11010','13:00 ~ 19:00',0,'','37.5636366,126.9701752',NULL,3),(26,'DallyeolaJaduSsing.jpg','달려라 자두씽','미니츄, 커피콩 빵, 마약 핫도그','서울특별시 강서구 화곡동 1139','강서구','11160','12:00 ~ 18:00',0,'','37.5461383,126.833227',NULL,3),(27,'Thug.jpg','깡패팩토리','깡패 치킨팩, 깡패 소세지볼, 깡패 핫도그','서울특별시 마포구 서교동 342-5','마포구','11140','13:00 ~ 19:00',0,'','37.5540433,126.925588',NULL,3),(28,'PoongryuInTheTruck.jpg','풍류인더트럭','베이직 핫도그, 칠리 핫도그, 치즈 핫도그','서울특별시 양천구 신정동 1198-3','양천구','11150','16:00 ~ 22:00',0,'','37.5210946,126.8483401',NULL,3),(29,'OBBAYACHU~.jpg','OBBAYA CHU~','츄러스, 핫도그','서울특별시 구로구 신도림동 646','영등포구','11190','12:00 ~ 18:00',0,'','37.511047,126.8864589',NULL,3),(30,'BulkkochTwigim.jpg','불꽃튀김','국물 떡볶이, 대왕 쥐포튀김, 등심 튀김, 왕고추 튀김,왕 김말이 튀김, 왕 파닭 꼬치 튀김,왕 새우꼬치 튀김','서울특별시 성동구 옥수동 204-6','용산구','11030','12:00 ~ 18:00',10,'','37.5408985,127.013039',NULL,3),(31,'WonderDog.jpg','Wonder Dog','필리 스테이크 원더 도그','서울특별시 중랑구 망우동 152-31','중랑구','11070','13:00 ~ 19:00',0,'','37.5987762,127.104107',NULL,4),(32,'KkochBodaKkochi.jpg','꽃보다 꼬치','닭꼬치, 핫도그, 떡꼬치','서울특별시 강남구 논현동 75','강남구','11230','12:00 ~ 18:00',0,'','37.5173399,127.0306833',NULL,4),(33,'Friend.jpg','Friend','닭꼬치, 양꼬치','서울특별시 종로구 효제동 277-2','중구','11020','12:00 ~ 18:00',1,'32','37.5734344,127.0035438',NULL,4),(34,'JyukkoMyeon.jpg','쥬꼬면','닭꼬치, 양꼬치, 어묵, 컵밥','서울특별시 용산구 용산동2가 34-11','용산구','11030','16:00 ~ 22:00',2,'39,32','37.5434505,126.9848436',NULL,4),(35,'SeoulFoodTruck.jpg','Seoul Food Truck','수제 미트볼 롤, 수제 소고기롤, 코울슬로 샐러드, 블루베리 발효 청 수제에이드','서울특별시 성동구 금호동3가 772-1','성동구','11040','12:00 ~ 18:00',30,'','37.5496964,127.022397',NULL,4),(36,'ChinaShrimp.jpg','차이나 쉬림프','레드쉬림프, 그린쉬림프, 블루쉬림프, 옐로쉬림프','서울특별시 중랑구 면목동 66-5','중랑구','11070','16:00 ~ 22:00',0,'','37.5859903,127.0916615',NULL,4),(37,'JOHNCOOKDELICAR.jpg','JOHNCOOK DELI CAR','소세지 꼬치, 어니언 핫도그, 오리지널핫도그, 치즈 갈릭 핫도그','서울특별시 도봉구 창동 355','노원구','11110','13:00 ~ 19:00',0,'','37.6490878,127.0459788',NULL,4),(38,'SarangFoodCar.jpg','사랑애푸드카','미인강정, 소세지, 순살 요델리, 순살치킨, 오리지널 치킨, 웨지 감자튀김, 함바그, 후라이드 꼬치','서울특별시 도봉구 쌍문동 720-3','도봉구','11100','12:00 ~ 18:00',0,'','37.6569795,127.0278296',NULL,4),(39,'JjangChyuDalg.jpg','짱츄닭','닭꼬치(소금구이, 데리야끼, 매운맛)','서울특별시 도봉구 쌍문동 423-57','강북구','11090','12:00 ~ 18:00',0,'','37.6515652,127.0134932',NULL,4),(40,'SPARTACOOK\'S.jpg','SPARTACOOK\'S','탕수육 떡볶이','서울특별시 은평구 응암동 194-17','은평구','11120','12:00 ~ 18:00',0,'','37.5970338,126.9242489',NULL,4),(41,'RomanticSkewers.jpg','낭만꼬치','닭꼬치(소금구이, 데리야끼, 매운맛)','서울특별시 관악구 남현동 1127','서초구','11220','12:00 ~ 18:00',0,'','37.4747613,126.9785736',NULL,1),(42,'ShrimpLAB.jpg','Shrimp LAB','갈릭 버터 쉬림프, 레몬 크림 쉬림프, 칠리 쉬림프','서울특별시 송파구 잠실동 229','송파구','11240','13:00 ~ 19:00',0,'','37.507341,127.0837401',NULL,1),(43,'LagumCook.jpg','라겸스쿡','양꼬치','서울특별시 송파구 풍납동 388-15','강동구','11250','12:00 ~ 18:00',0,'','37.5258036,127.1120335',NULL,1),(44,'NiceChumchu.jpg','나이스츄미츄','롱츄, 아츄','서울특별시 광진구 화양동 114-13','광진구','11050','12:00 ~ 18:00',0,'','37.5472259,127.0721826',NULL,2),(45,'SamcheonpoMan.jpg','삼천포사나이','매드크랩, 깐풍크랩, 오군다리','서울특별시 동대문구 청량리동 61-158','동대문구','11060','12:00 ~ 18:00',0,'','37.5869071,127.0496143',NULL,2),(46,'PEACEFULfoodtrailer.jpg','PEACEFUL food trailer','오꼬노미야끼, 야끼소바','서울특별시 서대문구 남가좌동 110-4','서대문구','11130','13:00 ~ 19:00',0,'','37.5698034,126.9161363',NULL,3),(47,'THETRAVEL.jpg','THE TRAVEL','타코, 닭꼬치(칠리 / 데리야끼 / 소금구이)','서울특별시 영등포구 양평동1가 20','영등포구','11190','12:00 ~ 18:00',0,'','37.5217695,126.8865019',NULL,3),(48,'HiFive.jpg','Hi Five','돈까스 덮밥, 소고기 덮밥, 연어 덮밥, 새우튀김 덮밥, 돈 스테이크&감자튀김, 롱 닭꼬치, 쉬림프&소고기말이, 핫도그&감자튀김','서울특별시 구로구 구로동 313-130','구로구','11170','16:00 ~ 22:00',9,'','37.490088,126.8901829',NULL,3),(49,'CubeYellow.jpg','Cube Yellow','큐브 스테이크, 수제 츄러스, 마약 롱핫도그','서울특별시 금천구 시흥동 117-5','금천구','11180','13:00 ~ 19:00',0,'','37.4552046,126.8975679',NULL,4),(50,'Olivette.jpg','올리베떼','떡볶이, 순대, 어묵','서울특별시 양천구 신정동 311','양천구','11150','12:00 ~ 18:00',0,'','37.5154101,126.857524',NULL,4);
/*!40000 ALTER TABLE `foodtrucks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원번호',
  `type` varchar(15) DEFAULT NULL,
  `login` varchar(20) NOT NULL COMMENT '아이디',
  `password` varchar(64) NOT NULL COMMENT '비밀번호',
  `name` varchar(12) NOT NULL COMMENT '이름',
  `gender` varchar(4) DEFAULT NULL COMMENT '성별',
  `age` int(11) DEFAULT '20',
  `resident_rn` varchar(20) DEFAULT NULL COMMENT '주민번호',
  `email` varchar(48) DEFAULT NULL COMMENT '이메일',
  `phone_number` varchar(20) NOT NULL COMMENT '연락처',
  `address` varchar(128) DEFAULT NULL COMMENT '주소',
  `joined_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '가입날짜',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수정날짜',
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '메뉴 원재료',
  `logout_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `img_path` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (5,'member','poro','CBE10475A59B247D30F3881C9A5C0445','1234','여',20,'111111-1111111','test@test.com','010-1234-5678','서울특별시 성동구 왕십리역','2020-05-26 01:08:50','2020-05-26 01:08:50','2020-06-05 00:57:15','2020-06-04 06:17:24',NULL),(6,'member','test','92689DB4CAF812D9162A3021D56B769C','test','남',20,'111111-1111111','1111111111111111@11','1111111111','','2020-05-26 02:53:24','2020-05-26 02:53:24','2020-06-02 05:48:52','2020-06-02 05:58:13',NULL),(7,'admin','admin','87CA744203A74F0E8A8CCADC92E13D49','admin','남',20,'111111-1111111','1234@1234.1234','1111111111','1','2020-06-01 01:02:36','2020-06-01 01:02:36','2020-06-04 06:49:12','2020-06-04 06:56:26',NULL),(8,'member','poro123','8BA027BFB4AE0B0350F1D82367828804','poro','여',20,'222222-2222222','2@2.2','010-2222-2222','','2020-06-02 06:00:07','2020-06-02 06:00:07','2020-06-02 06:00:27','2020-06-02 06:02:15',''),(9,'member','sudo57','078C2E46A740B4A9A16EC6AC66965A7F','sudo','여',20,'222222-2222222','su@do.com','010-2082-5175','','2020-06-02 06:32:57','2020-06-02 06:32:57','2020-06-04 05:39:20','2020-06-04 05:39:29',''),(10,'member','odd007','7434506140B41E020C9499B41D2D7632','odd','여',20,'222222-2222222','odd@odd.com','010-2312-8726','','2020-06-02 06:44:37','2020-06-02 06:44:37','2020-06-04 05:07:18','2020-06-03 05:21:33',''),(11,'member','dummy1','1234','dummy1','남',20,'111111-1111111','dummy1@test.com','010-0000-0000',NULL,'2020-01-02 06:51:09','2020-06-02 06:51:09','2020-04-02 06:51:09','2020-05-02 06:51:09',NULL),(12,'member','dummy2','1234','dummy','남',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-01-02 06:51:33','2020-06-02 06:51:33','2020-06-02 06:51:33','2020-06-02 06:51:33',NULL),(13,'member','dummy3','1234','dummy','남',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-02-02 06:51:40','2020-06-02 06:51:40','2020-06-02 06:51:40','2020-06-02 06:51:40',NULL),(14,'member','dummy4','1234','dummy','남',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-02-02 06:51:42','2020-06-02 06:51:42','2020-06-02 06:51:42','2020-06-02 06:51:42',NULL),(15,'member','dummy5','1234','dummy','남',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-04-02 06:51:43','2020-06-02 06:51:43','2020-06-02 06:51:43','2020-06-02 06:51:43',NULL),(16,'member','dummy6','1234','dummy','남',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-04-02 06:51:45','2020-06-02 06:51:45','2020-06-02 06:51:45','2020-06-02 06:51:45',NULL),(17,'member','dummy7','1234','dummy','남',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-05-02 06:51:46','2020-06-02 06:51:46','2020-06-02 06:51:46','2020-06-02 06:51:46',NULL),(18,'member','dummy8','1234','dummy','남',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-05-02 06:51:47','2020-06-02 06:51:47','2020-06-02 06:51:47','2020-06-02 06:51:47',NULL),(19,'member','dummy9','1234','dummy','남',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-05-02 06:51:48','2020-06-02 06:51:48','2020-06-02 06:51:48','2020-06-02 06:51:48',NULL),(20,'member','dummy10','1234','dummy','남',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-05-02 06:51:49','2020-06-02 06:51:49','2020-06-02 06:51:49','2020-06-02 06:51:49',NULL),(22,'member','dummy11','1234','dummy','여',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-05-02 06:51:58','2020-06-02 06:51:58','2020-06-02 06:51:58','2020-06-02 06:51:58',NULL),(23,'member','dummy12','1234','dummy','여',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-06-02 06:51:59','2020-06-02 06:51:59','2020-06-02 06:51:59','2020-06-02 06:51:59',NULL),(24,'member','dummy13','1234','dummy','여',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-06-02 06:52:00','2020-06-02 06:52:00','2020-06-02 06:52:00','2020-06-02 06:52:00',NULL),(25,'member','dummy14','1234','dummy','여',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-06-02 06:52:01','2020-06-02 06:52:01','2020-06-02 06:52:01','2020-06-02 06:52:01',NULL),(26,'member','dummy15','1234','dummy','여',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-06-02 06:52:02','2020-06-02 06:52:02','2020-06-02 06:52:02','2020-06-02 06:52:02',NULL),(27,'member','dummy16','1234','dummy','여',20,'111111-1111111','dummy@test.com','010-0000-0000',NULL,'2020-06-02 06:52:04','2020-06-02 06:52:04','2020-06-02 06:52:04','2020-06-02 06:52:04',NULL),(28,'member','yoon0233','A1F542DBFB5780D55F85207D03255637','윤찬규','남',20,'900101-1111111','ycg0233@naver.com','010-6891-1231','서울','2020-06-03 04:03:28','2020-06-03 04:03:28','2020-06-03 04:08:12','2020-06-03 04:18:41','/uploads/members/yoon0233/UP_foodlee-face_20200603130328_57c5a33a-6e5c-4c4d-ac08-1f61198b9922.png'),(29,'member','yck1231','AF4344F9463143ABA73B20FF54F71725','윤찬규','남',20,'900101-1111111','ycg0233@naver.com','010-6891-1231','인천','2020-06-03 04:13:48','2020-06-03 04:13:48',NULL,NULL,'/uploads/members/yck1231/UP_foodlee-face_20200603131348_23316f85-2056-4a17-9b59-28a782c06d89.png'),(30,'member','foodlee1','3F4029188B971C944928423AFCD8B15D','홍길동','남',22,'900101-1111111','hong@hong.com','010-1234-1234','서울','2020-06-03 04:16:35','2020-06-03 04:16:35','2020-06-03 06:13:11','2020-06-03 06:14:37','/uploads/members/foodlee1/UP_foodlee-face_20200603131635_2b77149b-7d3a-4ed2-86cd-f8dfd284fb09.png'),(31,'member','ttt111','D7A7037AFC81B4EC09EBED432CF1803C','ttt','남',20,'111111-1111111','11@11.com','010-1121-1111','','2020-06-03 04:28:25','2020-06-03 04:28:25','2020-06-03 04:28:32','2020-06-03 04:28:44',''),(32,'member','food123','97B00E7182ADC3C880C2DA5B836B1FBB','푸들이','여',20,'920504-2548645','lee0504@email.com','010-4685-5213','서울 성동구','2020-06-03 05:19:27','2020-06-03 05:19:27','2020-06-04 07:35:08','2020-06-04 06:23:46',''),(33,'member','member','28A8ABEF5C89CF9B81B106DAD65AFE75','윤찬규','남',20,'900101-1111111','ycg0233@naver.com','010-6891-1231','교육원','2020-06-04 05:28:43','2020-06-04 05:28:43','2020-06-04 05:28:55','2020-06-04 05:30:46','/uploads/members/member/UP_Lighthouse_20200604142843_a540f537-88fd-4a99-bb0e-0b5ce534f19e.jpg'),(34,'member','member1','112653DE9C769C26C0783011AA247CB8','멤버','남',22,'900101-1111111','member@member.com','010-6891-1231','교육원','2020-06-04 05:44:26','2020-06-04 05:44:26','2020-06-04 05:44:51','2020-06-04 05:46:18','/uploads/members/member1/UP_Lighthouse_20200604144426_57ff1989-c0aa-450b-a4c2-b090d15cdd0a.jpg'),(35,'member','skyonme1','59F164C63A1443A7BAAAF7816EEF984A','김하늘','여',26,'951101-2105317','skyonme1@gmail.com','010-0127-2715','경기도 성남시 분당구','2020-06-04 05:46:05','2020-06-04 05:46:05','2020-06-04 06:07:17','2020-06-04 06:15:30',''),(36,'member','member12','80D66A6651DBBB1D7D5073031B1AEB17','멤버','여',22,'901111-1111111','member@member.com','010-1234-5678','교육원','2020-06-04 05:48:48','2020-06-04 05:48:48','2020-06-04 06:02:54','2020-06-04 06:08:20','/uploads/members/member12/UP_Lighthouse_20200604144848_808ae25a-f18c-46ca-b3c5-1267a4caffe9.jpg'),(37,'member','member123','4D4A4531EC005D68D7E1DA56F4D7374E','멤버','여',22,'901111-1111111','member@member.com','010-1234-1234','교육원','2020-06-04 06:02:42','2020-06-04 06:02:42',NULL,NULL,'/uploads/members/member123/UP_Lighthouse_20200604150242_a90b4628-225a-4252-b0ee-ef7c900c6202.jpg'),(38,'member','member1234','2EC0BB8BAA68DE2D3AB94D472455823C','멤버','여',22,'901111-1111111','member@member.com','010-6891-1231','교육원','2020-06-04 06:11:37','2020-06-04 06:11:37','2020-06-04 06:11:47',NULL,'/uploads/members/member1234/UP_Lighthouse_20200604151137_e6ccae61-3899-4146-9497-08e599129688.jpg'),(39,'member','foodlee123','1A1F976F082345FF979EFA6CF8637AA9','푸들이','여',20,'920504-2222222','foodlee@email.com','010-1234-1234','서울 성동구','2020-06-04 06:25:09','2020-06-04 06:25:09','2020-06-04 06:25:34','2020-06-04 06:35:15','');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `menu_name` varchar(64) NOT NULL,
  `menu_type` varchar(32) NOT NULL,
  `menu_price` int(11) NOT NULL,
  `menu_pic` varchar(512) NOT NULL,
  `menu_infor` varchar(512) DEFAULT NULL,
  `raw_Materials` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,1,'옛날핫도그','간식',2000,'/uploads/menus/seller1/1_옛날핫도그.jpg','옛날풍의 핫도그',NULL),(2,1,'치즈핫도그','간식',2500,'/uploads/menus/seller1/2_치즈핫도그.jpg','치즈가 가득한 핫도그',NULL),(3,1,'감자핫도그','간식',2500,'/uploads/menus/seller1/3_감자핫도그.jpg','고소한 감자가 잔뜩!',NULL),(4,1,'떡핫도그','간식',2500,'/uploads/menus/seller1/4_떡핫도그.jpg','쫄깃한 떡의 식감!',''),(5,1,'먹물핫도그','간식',2500,'/uploads/menus/seller1/5_먹물핫도그.jpg','까만 먹물 핫도그',NULL),(6,1,'닭꼬치','간식',2500,'/uploads/menus/seller1/6_닭꼬치.jpg','바삭한 식감이 가득한 닭꼬치',NULL);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'test',1,'닭꼬치1,닭꼬치3,닭꼬치2','1,1,1','3000,3200,3100',9300,1,'',NULL,'','2020-01-27 04:18:53'),(2,'test',1,'닭꼬치1,닭꼬치2,닭꼬치3','4,3,1','12000,9300,3200',24500,1,'',NULL,'','2020-01-27 04:18:53'),(3,'poro',1,'닭꼬치2,닭꼬치1','1,1','3100,3000',6100,1,'',NULL,'','2020-02-27 04:20:24'),(4,'poro',1,'닭꼬치1,닭꼬치2','1,1','3000,3100',6100,1,'',NULL,'','2020-02-27 04:37:19'),(5,'poro',1,'닭꼬치1','1','3000',3000,1,'',NULL,'','2020-03-27 08:39:42'),(6,'poro',1,'옛날핫도그,치즈핫도그,감자핫도그','1,2,1','2000,5000,2500',9500,1,'',NULL,'merchant_1590653292643','2020-04-28 08:09:05'),(7,'poro',1,'옛날핫도그,치즈핫도그','1,1','2000,2500',4500,1,'','요청사항 테스트','merchant_1590654268263','2020-05-28 08:25:17'),(8,'poro',1,'옛날핫도그','1','3000',3000,2,NULL,NULL,'','2020-06-01 02:50:32'),(9,'testt',2,'옛날닭꼬치','1','3500',3500,1,NULL,NULL,'','2020-06-02 03:14:29'),(10,'poro',1,'닭꼬치','1','2500',2500,2,'','1','merchant_1591155724714','2020-06-03 03:43:25'),(11,'food123',1,'옛날핫도그','1','2000',2000,3,'','설탕 많이 주세요','merchant_1591162024398','2020-06-03 05:28:44'),(12,'food123',1,'치즈핫도그,감자핫도그','1,1','2500,2500',5000,2,'','케찹 뿌리지 말아주세요','merchant_1591162160645','2020-06-03 05:30:38'),(13,'food123',1,'떡핫도그,먹물핫도그,닭꼬치','1,1,2','2500,2500,5000',10000,2,'','','merchant_1591162247802','2020-06-03 05:32:01'),(14,'food123',1,'닭꼬치,치즈핫도그','2,1','5000,2500',7500,2,'','','merchant_1591162341579','2020-06-03 05:33:34'),(15,'poro',1,'옛날핫도그,치즈핫도그','1,1','2000,2500',4500,1,'','11','merchant_1591165403318','2020-06-03 06:24:23'),(16,'food123',1,'감자핫도그,치즈핫도그,떡핫도그','1,1,1','2500,2500,2500',7500,2,'','','merchant_1591251077571','2020-06-04 06:12:47'),(17,'food123',1,'옛날핫도그','4','8000',8000,2,'','','merchant_1591251179721','2020-06-04 06:14:14'),(18,'skyonme1',1,'옛날핫도그,치즈핫도그','2,1','4000,2500',6500,1,'','맛있게 부탁드려요','merchant_1591251254586','2020-06-04 06:15:13'),(19,'foodlee123',1,'닭꼬치','2','5000',5000,1,'','','merchant_1591252278361','2020-06-04 06:32:24'),(20,'foodlee123',1,'먹물핫도그,떡핫도그','1,1','2500,2500',5000,1,'','','merchant_1591252348991','2020-06-04 06:33:21'),(21,'foodlee123',1,'치즈핫도그,옛날핫도그,감자핫도그,떡핫도그','1,1,1,1','2500,2000,2500,2500',9500,1,'','','merchant_1591252408526','2020-06-04 06:34:44');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,'sudo57',1,0,NULL,'비밀글 테스트',1,'2020-06-02 06:36:00'),(2,'seller1',1,1,'1','비밀글 답변',1,'2020-06-02 06:36:27'),(3,'poro',1,0,NULL,'현충일도 영업하시나요?',0,'2020-06-02 06:42:38'),(4,'seller1',1,1,'3','네 영업합니다~',0,'2020-06-02 06:43:04'),(6,'poro',24,0,NULL,'오늘 영업 하시나요?',0,'2020-06-03 02:35:14'),(8,'food123',3,0,NULL,'예약도 가능한가요?',0,'2020-06-03 05:21:07'),(9,'food123',9,0,NULL,'땅콩이 들어가는 메뉴가 어떤건가요?',0,'2020-06-03 05:21:41'),(10,'food123',30,0,NULL,'떡볶이가 얼마나 매운가요?',0,'2020-06-03 06:04:44'),(29,'poro',2,0,NULL,'123',0,'2020-06-04 04:22:48'),(39,'skyonme1',1,0,NULL,'비밀글',1,'2020-06-04 06:13:50'),(41,'foodlee123',21,0,NULL,'땅콩 들어가는 메뉴가 있나요?',0,'2020-06-04 06:29:27'),(42,'foodlee123',18,0,NULL,'매운맛은 얼마나 매운가요?',0,'2020-06-04 06:29:44'),(47,'food123',3,0,NULL,'영업',0,'2020-06-04 07:01:03'),(50,'seller1',1,1,'39','비밀글 답변',1,'2020-06-04 07:08:06'),(51,'food123',3,0,NULL,'안녕하세요',0,'2020-06-04 07:36:53');
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'poro',1,0,NULL,'닭꼬치가 정말 맛있습니다!','/uploads/review/poro/UP_photo_20200602152714_ad1bfc1d-fa80-4e48-b247-32f7ee41c8b6.jpg','2020-06-02 06:27:14'),(7,'poro',41,0,NULL,'너무 맛있어요','','2020-06-03 02:34:43'),(11,'food123',8,0,NULL,'JMT!!!','','2020-06-03 05:34:10'),(12,'food123',20,0,NULL,'데리야끼맛이 제일 맛있어요','','2020-06-03 05:34:41'),(14,'food123',34,0,NULL,'맛있어요','','2020-06-03 05:35:22'),(81,'poro',2,0,NULL,'123','','2020-06-04 04:26:25'),(98,'seller1',1,1,'1','소중한 리뷰 감사합니다!',NULL,'2020-06-04 06:04:31'),(104,'skyonme1',1,0,NULL,'치즈 핫도그가 정말 진짜 맛있어요!','/uploads/review/skyonme1/UP_hotdog1_20200604151334_0cc5ebe0-6e7c-4884-b20f-d76350a10b24.jpg|/uploads/review/skyonme1/UP_hotdog2_20200604151334_a914d6de-0d10-454b-9e32-cbfc73416abd.jpg','2020-06-04 06:13:40'),(106,'foodlee123',7,0,NULL,'소스가 맛있어요','','2020-06-04 06:27:01'),(107,'foodlee123',30,0,NULL,'튀김이 바삭바삭해서 좋아요','','2020-06-04 06:27:29'),(108,'foodlee123',27,0,NULL,'맛도 깡패!!','','2020-06-04 06:27:48'),(109,'foodlee123',42,0,NULL,'갈릭버터맛이 제일 좋아요','','2020-06-04 06:28:31'),(112,'food123',8,0,NULL,'리뷰','','2020-06-04 07:02:02'),(114,'food123',8,0,NULL,'리뷰2','','2020-06-04 07:37:06');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellers` (
  `seller_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '판매자 번호',
  `type` varchar(15) DEFAULT NULL,
  `login` varchar(20) NOT NULL COMMENT '아이디',
  `password` varchar(64) NOT NULL COMMENT '비밀번호',
  `name` varchar(12) NOT NULL COMMENT '이름',
  `gender` varchar(4) DEFAULT NULL COMMENT '성별',
  `age` int(11) DEFAULT '20',
  `resident_rn` varchar(20) DEFAULT NULL COMMENT '주민번호',
  `email` varchar(48) DEFAULT NULL COMMENT '이메일',
  `phone_number` varchar(20) NOT NULL COMMENT '연락처',
  `address` varchar(128) DEFAULT NULL COMMENT '주소',
  `joined_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '가입날짜',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수정날짜',
  `company_rn` varchar(45) DEFAULT NULL COMMENT '사업자등록번호',
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `img_path` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`seller_id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'seller','seller1','D95DD081B1AFDDAEEB9A61E669630A01','111','남',20,'111111-1111111','11@11.com','010-1234-5678','','2020-05-26 08:50:30','2020-05-26 08:50:30','111-11-11111','2020-06-05 01:13:32','2020-06-04 06:04:39','/uploads/sellers/seller1/UP_Desert_20200603135818_014fe719-fa6e-4130-b10f-a97296e9f008.jpg'),(2,'seller','seller2','A1E014C1F2972E98B2A558147A7D86B6','seller2','남',20,'111111-1111111','111@11.11','111111111','','2020-05-26 08:52:22','2020-05-26 08:52:22','111-11-11111','2020-06-04 04:26:30','2020-06-04 05:05:43',NULL),(3,'seller','seller3','7DDF2BD865C6922E8A9B6B1B7F480A51','1234','남',20,'111111-1111111','1234@1234.1234','1234','','2020-05-27 00:35:30','2020-05-27 00:35:30','111-11-11111',NULL,NULL,NULL),(4,'seller','seller4','1234','seller4','여',21,'222222-2222222','seller4@sel.com','010-1234-5678',NULL,'2020-06-02 07:20:43','2020-06-02 07:20:43',NULL,'2020-06-02 07:20:43','2020-06-02 07:20:43',NULL),(5,'seller','jjs8091','2C8C2554D67B2B5F4A602CF9C73C6616','장재석','남',32,'213213-3213132','jsr8091@naver.com','010-8111-9022','sadasdasd','2020-06-03 01:57:18','2020-06-03 01:57:18','232-32-21321','2020-06-03 04:48:02','2020-06-03 04:48:04',''),(6,'seller','sellerYoon','9BBFA046921D81381B0D4E61CE98F5FE','윤찬규','남',20,'900101-1111111','ycg0233@naver.com','010-6891-1231','경기도','2020-06-03 04:05:05','2020-06-03 04:06:26','123-45-67890','2020-06-03 04:07:12','2020-06-03 04:07:46','/uploads/sellers/sellerYoon/UP_foodlee-face_20200603130505_edc95b52-9cfe-415a-86b8-ca361961f5e4.png'),(7,'seller','jsr8091','DA67A229F428EC7C09C67E9D8C4E208D','jj','남',20,'213213-3231231','jsr8091@naver.com','010-8111-9022','sdsdasd','2020-06-03 04:48:49','2020-06-03 04:48:49','323-31-12312','2020-06-03 06:27:36','2020-06-03 06:30:14',''),(8,'seller','poro123','6DDCAD347DD64F4ED4A127403D0DA8C5','elsa','남',20,'111111-1111111','seo@jun.com','010-1121-1111','1','2020-06-03 04:56:51','2020-06-03 04:56:51','111-11-11111',NULL,NULL,'/uploads/sellers/poro123/UP_Chrysanthemum_20200603135651_2de05b80-b1b4-4292-b3f1-cb654b85d0fa.jpg'),(9,'seller','seller123','59603B981CB49644DE4C2189F8D5A47F','elsa','남',20,'111111-1111111','seo@jun.com','010-1121-1111','1','2020-06-03 04:58:18','2020-06-03 04:58:18','111-11-11111','2020-06-03 04:58:28','2020-06-03 05:01:46','/uploads/sellers/seller123/UP_Desert_20200603135818_014fe719-fa6e-4130-b10f-a97296e9f008.jpg'),(10,'seller','foodlee2','5B060250082A1B1D2682348A065F52ED','윤찬규','남',20,'900101-1111111','ycg0233@naver.com','010-6891-1231','왕십리','2020-06-03 06:12:44','2020-06-03 06:12:44','123-45-67890',NULL,NULL,'/uploads/sellers/foodlee2/UP_testimg4_20200603151244_fb541def-641d-4c5a-ad60-8d2602e4e9d9.jpg');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tempdate`
--

DROP TABLE IF EXISTS `tempdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tempdate` (
  `temp_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`temp_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tempdate`
--

LOCK TABLES `tempdate` WRITE;
/*!40000 ALTER TABLE `tempdate` DISABLE KEYS */;
INSERT INTO `tempdate` VALUES ('2019-12-31 15:00:00'),('2020-01-31 15:00:00'),('2020-02-29 15:00:00'),('2020-03-31 15:00:00'),('2020-04-30 15:00:00'),('2020-05-31 15:00:00');
/*!40000 ALTER TABLE `tempdate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-05 10:22:25
