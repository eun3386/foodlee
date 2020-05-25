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
  `event_end_date` date NOT NULL COMMENT '이벤트 종료 날짜',
  `event_ongoing` int(11) NOT NULL COMMENT '진행중 여부 0=진행 1=종료 ',
  `event_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '이벤트등록날짜 CURRENT_TIMESTAMP',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
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

-- Dump completed on 2020-05-25 16:31:30



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
  `mb_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ev_as_id`),
  KEY `event_id_idx` (`event_id`),
  KEY `mb_id_idx` (`mb_id`),
  CONSTRAINT `event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mb_id` FOREIGN KEY (`mb_id`) REFERENCES `members` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_answers`
--

LOCK TABLES `event_answers` WRITE;
/*!40000 ALTER TABLE `event_answers` DISABLE KEYS */;
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

-- Dump completed on 2020-05-25 16:31:28


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
  `seller_foodtruck_coordinate` varchar(1024) DEFAULT NULL,
  `location_updated_at` timestamp NULL DEFAULT NULL COMMENT 'CURRENT_TIMESTAMP',
  `menu_category` int(11) DEFAULT '1' COMMENT '1 = 간식, 2 = 식사, 3 = 디저트, 4 = 밥차',
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `seller_id` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtrucks`
--

LOCK TABLES `foodtrucks` WRITE;
/*!40000 ALTER TABLE `foodtrucks` DISABLE KEYS */;
INSERT INTO `foodtrucks` VALUES (1,'푸드마케ㅌ.jpg','푸드마케ㅌ','닭꼬치, 양꼬치, 치즈핫도그','아차산역앞','광진구','11050','12:00 ~ 18:00',0,'',NULL,1),(2,'형아네.jpg','형아네','양꼬치','천호역앞','강동구','11250','13:00 ~ 19:00',0,'',NULL,1),(3,'BAM MA SIL.jpg','BAM MA SIL','칠리쉬림프, 갈릭버터쉬림프, 레몬크림쉬림프','용산역앞','용산구','11030','16:00 ~ 22:00',0,'',NULL,2),(4,'미드나잇.jpg','미드나잇','새우플레이트, 마약옥수수','성신여대입구역앞','성북구','11080','12:00 ~ 18:00',0,'',NULL,1),(5,'Yo! Chef!.jpg','Yo! Chef!','갈비꼬치, 데리롱닭꼬치, 마요롱닭꼬치, 매운롱닭꼬치, 스테이크꼬치, 쏘떡쏘떡, 치즈롱닭꼬치','중랑천앞','중랑구','11070','13:00 ~ 19:00',0,'',NULL,1),(6,'불아이스.jpg','불아이스','닭꼬치, 새우 모듬 튀김','롯데월드입구앞','송파구','11240','12:00 ~ 18:00',0,'',NULL,1),(7,'나는 닭강정 이다.jpg','나는 닭강정 이다','닭강정','강남역앞','강남구','11230','16:00 ~ 22:00',0,'',NULL,1),(8,'맛짱.jpg','맛짱','닭강정','교대역앞','서초구','11220','12:00 ~ 18:00',0,'',NULL,1),(9,'불타는네모반점.jpg','불타는네모반점','네모새우, 레몬크림새우','타임스퀘어앞','영등포구','11190','12:00 ~ 18:00',0,'',NULL,4),(10,'아라푸드.jpg','아라푸드','아라 타코야키','구로디지털단지역앞','구로구','11170','12:00 ~ 18:00',0,'',NULL,3);
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

-- Dump completed on 2020-05-25 18:51:33


--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원번호',
  `type` varchar(15) DEFAULT NULL,
  `login` varchar(12) NOT NULL COMMENT '아이디',
  `password` varchar(64) NOT NULL COMMENT '비밀번호',
  `name` varchar(12) NOT NULL COMMENT '이름',
  `gender` varchar(4) DEFAULT NULL COMMENT '성별',
  `age` int(11) DEFAULT '20',
  `resident_rn` varchar(13) DEFAULT NULL COMMENT '주민번호',
  `email` varchar(24) DEFAULT NULL COMMENT '이메일',
  `phone_number` varchar(12) NOT NULL COMMENT '연락처',
  `address` varchar(128) DEFAULT NULL COMMENT '주소',
  `joined_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '가입날짜',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '수정날짜',
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '메뉴 원재료',
  `logout_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'admin','admin','87CA744203A74F0E8A8CCADC92E13D49','관리자','관리',20,'1111111111111','admin@admin.com','11111111111','서울','2020-05-14 09:42:44','2020-05-14 09:42:44',NULL,NULL),(2,'member','yoon','363D063E3E1A3DB958745E85353F7E4E','윤찬규','남',32,'9001011111111','yoon@yoon.com','01011111111','인천','2020-05-14 09:42:44','2020-05-14 09:42:44',NULL,NULL);
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
  `menu_infor` varchar(512) NOT NULL,
  `raw_Materials` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'poro',1,0,NULL,'테스트',NULL,'2020-05-22 00:24:00'),(2,'poro',1,0,NULL,'테스트2',NULL,'2020-05-22 07:15:18'),(3,'seller',1,1,'2','테스트2에 대한 답변',NULL,'2020-05-22 07:46:22'),(4,'seller',1,1,'1','테스트에 대한 답변',NULL,'2020-05-22 07:46:22'),(5,'poro',1,0,NULL,'테스트3',NULL,'2020-05-22 00:24:00'),(6,'poro',1,0,NULL,'테스트4',NULL,'2020-05-22 00:24:00'),(7,'poro',1,0,NULL,'테스트4',NULL,'2020-05-22 00:24:00'),(8,'poro',1,0,NULL,'테스트4',NULL,'2020-05-22 00:24:00'),(9,'seller',1,1,'6','테스트4(6)에 대한 답변',NULL,'2020-05-22 07:46:22'),(10,'seller',1,1,'8','테스트4(8)에 대한 답변',NULL,'2020-05-22 07:46:22'),(155,'seller',1,1,'7','123',NULL,'2020-05-22 07:46:22'),(173,'poro',1,0,NULL,'789','','2020-05-22 08:24:56'),(174,'seller',1,1,'173','1127',NULL,'2020-05-22 08:29:05');
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
  `login` varchar(12) NOT NULL COMMENT '<<UQ>> 아이디 ',
  `password` varchar(64) NOT NULL COMMENT '비밀번호',
  `name` varchar(12) NOT NULL COMMENT '이름',
  `gender` varchar(10) NOT NULL COMMENT '성별',
  `age` int(11) NOT NULL COMMENT '나이',
  `resident_rn` varchar(16) NOT NULL COMMENT '주민번호',
  `email` varchar(24) NOT NULL COMMENT '이메일',
  `phone_number` varchar(45) NOT NULL COMMENT '연락처',
  `address` varchar(45) NOT NULL COMMENT '주소',
  `joined_at` timestamp NULL DEFAULT NULL COMMENT '가입날짜 ',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '수정날짜',
  `company_rn` varchar(45) NOT NULL COMMENT '사업자등록번호',
  `login_time` timestamp NULL DEFAULT NULL COMMENT '로그인일자',
  `logout_time` timestamp NULL DEFAULT NULL COMMENT '로그아웃일자',
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'foodmarkee','38BA5702892062BE76B848B2D470E484','푸드마케ㅌ','남자',32,'7511251031457','fmk@fmk.com','01012345678','서울','2020-05-14 03:12:39',NULL,'1111',NULL,NULL),(2,'brother','A874B737710F50C9E9B8F8E5F6B19022','형아네','남자',34,'8512251032311','bro@bro.com','01012425643','서울','2020-05-14 03:16:39',NULL,'3242',NULL,NULL),(3,'bms','F78893E010701F5F70C115866D20CEC3','bam','남자',31,'8912251032311','bam@bam.com','01012224643','서울','2020-05-14 03:24:13',NULL,'4232',NULL,NULL),(4,'Midnight','665C91CC091BAA7CDFD99BD3B141DFC5','mid','남자',28,'9207121034121','mid@mid.com','01011326143','서울','2020-05-14 03:27:34',NULL,'6212',NULL,NULL),(5,'YoChef','EBD5AB82014A76020A0C496E358270A6','chef','남자',32,'8907121034121','chef@chef.com','01011334122','서울','2020-05-14 03:29:34',NULL,'6212',NULL,NULL),(6,'fireice','34878E68AA8161F56ACC53E716E7F04D','fier','남자',33,'8807121034121','fier@fier.com','01042334122','서울','2020-05-14 03:31:30',NULL,'5432',NULL,NULL),(7,'ichiken','42EB46C4C9F3221BA4857D4292E4EEB3','ichken','남자',33,'8807221243212','ichken@ichken.com','01021322122','서울','2020-05-14 03:33:09',NULL,'5321',NULL,NULL),(8,'zzang','6C3E7590A37FDCB092D1CDD424109423','zzang','남자',33,'8801121223214','zzg@zzg.com','01031422127','서울','2020-05-14 03:34:42',NULL,'7253',NULL,NULL),(9,'firenemo','728505314CBF67CDB5653B3651B6F02E','firenemo','남자',33,'8801212873241','nemo@nemo.com','01031422127','서울','2020-05-14 03:35:38',NULL,'8235',NULL,NULL),(10,'arafood','E041913F7EAE06FDE943698C697474AC','arafood','남자',32,'8901212337341','ara@ara.com','01031428627','서울','2020-05-14 03:36:51',NULL,'9344',NULL,NULL);
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-22 17:36:43
