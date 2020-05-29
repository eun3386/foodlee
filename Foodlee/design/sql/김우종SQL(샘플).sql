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
INSERT INTO `foodtrucks` VALUES (1,'FoodMarkee.jpg','푸드마케ㅌ','닭꼬치, 양꼬치, 치즈핫도그','서울특별시 성동구 마장동 556','성동구','','12:00 ~ 18:00',0,'','37.5688525,127.035873',NULL,1),(2,'Brother.jpg','형아네','양꼬치','서울특별시 강동구 성내동 448-11','강동구','','13:00 ~ 19:00',0,'','37.5240682,127.129345',NULL,1),(3,'BAMMASIL.jpg','BAM MA SIL','칠리 쉬림프, 갈릭 버터 쉬림프, 레몬 크림 쉬림프','서울특별시 용산구 한남동 101-1','용산구','','16:00 ~ 22:00',0,'','37.5313367,127.0083856',NULL,1),(4,'Midnight.jpg','미드나잇','새우 플레이트, 마약 옥수수','서울특별시 성북구 삼선동3가 42-5','성북구','','12:00 ~ 18:00',0,'','37.5868638,127.0138309',NULL,1),(5,'Yo!Chef!.jpg','Yo! Chef!','갈비꼬치, 데리 롱 닭꼬치, 마요 롱 닭꼬치, 매운 롱 닭꼬치, 스테이크 꼬치, 쏘떡쏘떡, 치즈 롱 닭꼬치','서울특별시 중랑구 망우동 537-16','중랑구','','13:00 ~ 19:00',0,'','37.6020403,127.1022187',NULL,1),(6,'FireIce.jpg','불아이스','닭꼬치, 새우 모듬 튀김','서울특별시 송파구 방이동 103-26','송파구','','12:00 ~ 18:00',0,'','37.5128559,127.1120214',NULL,1),(7,'IamChickenGangjeong.jpg','나는 닭강정 이다','닭강정','서울특별시 강남구 삼성동 25-10','강남구','','16:00 ~ 22:00',0,'','37.5150933,127.0491798',NULL,1),(8,'Great.jpg','맛짱','닭강정','서울특별시 서초구 서초동 1470-1','서초구','','12:00 ~ 18:00',0,'','37.4809596,127.0076058',NULL,1),(9,'BurningSquare.jpg','불타는네모반점','네모 새우, 레몬 크림 새우','서울특별시 영등포구 당산동1가 412-1','영등포구','','12:00 ~ 18:00',0,'','37.5225183,126.8963724',NULL,1),(10,'AraFood.jpg','아라푸드','아라 타코야키','서울특별시 구로구 구로동 87-1','구로구','','12:00 ~ 18:00',0,'','37.4934591,126.8897967',NULL,1),(11,'HolicChur.jpg','홀릭츄릅','베이컨 새우말이 볶음밥, 불고기 핫도그, 치마새우(꼬치구이), 통살 새우 핫도그 ','서울특별시 금천구 시흥동 879-80','금천구','','16:00 ~ 22:00',0,'','37.4547618,126.9030182',NULL,1),(12,'HoneyFood.jpg','허니푸드','닭꼬치(데이야끼 소스, 매운맛 소스)','서울특별시 노원구 상계동 737','노원구','','13:00 ~ 19:00',0,'','37.6527914,127.0584242',NULL,1),(13,'COCOSALSA.jpg','COCO SALSA','케사디아, 타코, 부리또 볼','서울특별시 양천구 신정동 329','양천구','','12:00 ~ 18:00',0,'','37.5173164,126.8708707',NULL,1),(14,'PHILLSALSANDWICH.jpg','PHILLSAL SANDWICH','필리 치즈 스테이크 샌드위치, 연어 샌드위치, 닭발 샌드위치','서울특별시 은평구 응암동 96-38','은평구','','12:00 ~ 18:00',0,'','37.600332,126.9254505',NULL,1),(15,'TAKO-BOOM.jpg','TAKO-BOOM','타코(오리지널, 매운맛, 치즈맛)','서울특별시 노원구 상계동 624','도봉구','','13:00 ~ 19:00',0,'','37.6682245,127.0531068',NULL,1),(16,'GAESAEFOOD.jpg','GAE SAE FOOD','계란 듬뿍 샌드위치, 감자 사라다 샌드위치, 불고기 샌드위치, 돈까스 샌드위치','서울특별시 서대문구 연희동 141-34','서대문구','','16:00 ~ 22:00',0,'','37.5771163,126.9369073',NULL,1),(17,'Kim\'sDonut.jpg','킴스도넛','생 도넛츠, 꽈베기, 찹쌀 도넛츠','서울특별시 중구 신당동 405-1','중구','','12:00 ~ 18:00',0,'','37.560236,127.0103244',NULL,1),(18,'ChanicaniChickenGangjeong.jpg','차니차니 닭강정','닭강정(순한맛, 매운맛)','서울특별시 동작구 노량진동 313-39','동작구','','12:00 ~ 18:00',0,'','37.5074458,126.9385344',NULL,1),(19,'THEJAYU.jpg','THE JAYU','뉴욕 핫도그','서울특별시 강북구 미아동 195-1','강북구','','13:00 ~ 19:00',0,'','37.6320934,127.0258957',NULL,1),(20,'Bachelor.jpg','총각마차','닭꼬치(소금구이, 바베큐, 데리야끼, 매운맛)','서울특별시 광진구 자양동 621-4','광진구','','16:00 ~ 22:00',0,'','37.5349758,127.0796928',NULL,1),(21,'LayeredSand.jpg','겹겹이 쿡 샌드','바베큐 핫 샌드위치, 치킨 바베큐 핫 샌드위치, 참치 샐러드 샌드위치','서울특별시 성동구 행당동 3-18','성동구','','16:00 ~ 22:00',0,'','37.5605494,127.0405502',NULL,1),(22,'CheeseInTheTrap.jpg','치즈인더트랩','새우 버터 구이, 구워먹는 치즈','서울특별시 마포구 합정동 444-12','마포구','','13:00 ~ 19:00',0,'','37.5509813,126.9054178',NULL,1),(23,'NyamNyamJjeobJjeob.jpg','냠냠쩝쩝','수제 왕소세지, 프리미엄 파떡 닭꼬치, 양갈비 꼬치','서울특별시 금천구 시흥동 990-53','금천구','','12:00 ~ 18:00',0,'','37.4500603,126.9013445',NULL,1),(24,'Dakoachi.jpg','다코아찌','타코야끼','서울특별시 서초구 방배동 593-77','서초구','','12:00 ~ 18:00',0,'','37.4750338,126.993594',NULL,1),(25,'SURFDOG.jpg','SURFDOG','서프독, 하와이안, 치즈독, 불독, 칠리 치즈독','서울특별시 중구 순화동 217','종로구','','13:00 ~ 19:00',0,'','37.5636366,126.9701752',NULL,1),(26,'DallyeolaJaduSsing.jpg','달려라 자두씽','미니츄, 커피콩 빵, 마약 핫도그','서울특별시 강서구 화곡동 1139','강서구','','12:00 ~ 18:00',0,'','37.5461383,126.833227',NULL,1),(27,'Thug.jpg','깡패팩토리','깡패 치킨팩, 깡패 소세지볼, 깡패 핫도그','서울특별시 마포구 서교동 342-5','마포구','','13:00 ~ 19:00',0,'','37.5540433,126.925588',NULL,1),(28,'PoongryuInTheTruck.jpg','풍류인더트럭','베이직 핫도그, 칠리 핫도그, 치즈 핫도그','서울특별시 양천구 신정동 1198-3','양천구','','16:00 ~ 22:00',0,'','37.5210946,126.8483401',NULL,1),(29,'OBBAYACHU~.jpg','OBBAYA CHU~','츄러스, 핫도그','서울특별시 구로구 신도림동 646','영등포구','','12:00 ~ 18:00',0,'','37.511047,126.8864589',NULL,1),(30,'BulkkochTwigim.jpg','불꽃튀김','국물 떡볶이, 대왕 쥐포튀김, 등심 튀김, 왕고추 튀김,왕 김말이 튀김, 왕 파닭 꼬치 튀김,왕 새우꼬치 튀김','서울특별시 성동구 옥수동 204-6','용산구','','12:00 ~ 18:00',0,'','37.5408985,127.013039',NULL,1),(31,'WonderDog.jpg','Wonder Dog','필리 스테이크 원더 도그','서울특별시 중랑구 망우동 152-31','중랑구','','13:00 ~ 19:00',0,'','37.5987762,127.104107',NULL,1),(32,'KkochBodaKkochi.jpg','꽃보다 꼬치','닭꼬치, 핫도그, 떡꼬치','서울특별시 강남구 논현동 75','강남구','','12:00 ~ 18:00',0,'','37.5173399,127.0306833',NULL,1),(33,'Friend.jpg','Friend','닭꼬치, 양꼬치','서울특별시 종로구 효제동 277-2','중구','','12:00 ~ 18:00',0,'','37.5734344,127.0035438',NULL,1),(34,'JyukkoMyeon.jpg','쥬꼬면','닭꼬치, 양꼬치, 어묵, 컵밥','서울특별시 용산구 용산동2가 34-11','용산구','','16:00 ~ 22:00',0,'','37.5434505,126.9848436',NULL,1),(35,'SeoulFoodTruck.jpg','Seoul Food Truck','수제 미트볼 롤, 수제 소고기롤, 코울슬로 샐러드, 블루베리 발효 청 수제에이드','서울특별시 성동구 금호동3가 772-1','성동구','','12:00 ~ 18:00',0,'','37.5496964,127.022397',NULL,1),(36,'ChinaShrimp.jpg','차이나 쉬림프','레드쉬림프, 그린쉬림프, 블루쉬림프, 옐로쉬림프','서울특별시 중랑구 면목동 66-5','중랑구','','16:00 ~ 22:00',0,'','37.5859903,127.0916615',NULL,1),(37,'JOHNCOOKDELICAR.jpg','JOHNCOOK DELI CAR','소세지 꼬치, 어니언 핫도그, 오리지널핫도그, 치즈 갈릭 핫도그','서울특별시 도봉구 창동 355','노원구','','13:00 ~ 19:00',0,'','37.6490878,127.0459788',NULL,1),(38,'SarangFoodCar.jpg','사랑애푸드카','미인강정, 소세지, 순살 요델리, 순살치킨, 오리지널 치킨, 웨지 감자튀김, 함바그, 후라이드 꼬치','서울특별시 도봉구 쌍문동 720-3','도봉구','','12:00 ~ 18:00',0,'','37.6569795,127.0278296',NULL,1),(39,'JjangChyuDalg.jpg','짱츄닭','닭꼬치(소금구이, 데리야끼, 매운맛)','서울특별시 도봉구 쌍문동 423-57','강북구','','12:00 ~ 18:00',0,'','37.6515652,127.0134932',NULL,1),(40,'SPARTACOOK\'S.jpg','SPARTACOOK\'S','탕수육 떡볶이','서울특별시 은평구 응암동 194-17','은평구','','12:00 ~ 18:00',0,'','37.5970338,126.9242489',NULL,1),(41,'RomanticSkewers.jpg','낭만꼬치','닭꼬치(소금구이, 데리야끼, 매운맛)','서울특별시 관악구 남현동 1127','서초구','','12:00 ~ 18:00',0,'','37.4747613,126.9785736',NULL,1),(42,'ShrimpLAB.jpg','Shrimp LAB','갈릭 버터 쉬림프, 레몬 크림 쉬림프, 칠리 쉬림프','서울특별시 송파구 잠실동 229','송파구','','13:00 ~ 19:00',0,'','37.507341,127.0837401',NULL,1),(43,'LagumCook.jpg','라겸스쿡','양꼬치','서울특별시 송파구 풍납동 388-15','강동구','','12:00 ~ 18:00',0,'','37.5258036,127.1120335',NULL,1),(44,'NiceChumchu.jpg','나이스츄미츄','롱츄, 아츄','서울특별시 광진구 화양동 114-13','광진구','','12:00 ~ 18:00',0,'','37.5472259,127.0721826',NULL,1),(45,'SamcheonpoMan.jpg','삼천포사나이','매드크랩, 깐풍크랩, 오군다리','서울특별시 동대문구 청량리동 61-158','동대문구','','12:00 ~ 18:00',0,'','37.5869071,127.0496143',NULL,1),(46,'PEACEFULfoodtrailer.jpg','PEACEFUL food trailer','오꼬노미야끼, 야끼소바','서울특별시 서대문구 남가좌동 110-4','서대문구','','13:00 ~ 19:00',0,'','37.5698034,126.9161363',NULL,1),(47,'THETRAVEL.jpg','THE TRAVEL','타코, 닭꼬치(칠리 / 데리야끼 / 소금구이)','서울특별시 영등포구 양평동1가 20','영등포구','','12:00 ~ 18:00',0,'','37.5217695,126.8865019',NULL,1),(48,'HiFive.jpg','Hi Five','돈까스 덮밥, 소고기 덮밥, 연어 덮밥, 새우튀김 덮밥, 돈 스테이크&감자튀김, 롱 닭꼬치, 쉬림프&소고기말이, 핫도그&감자튀김','서울특별시 구로구 구로동 313-130','구로구','','16:00 ~ 22:00',0,'','37.490088,126.8901829',NULL,1),(49,'CubeYellow.jpg','Cube Yellow','큐브 스테이크, 수제 츄러스, 마약 롱핫도그','서울특별시 금천구 시흥동 117-5','금천구','','13:00 ~ 19:00',0,'','37.4552046,126.8975679',NULL,1),(50,'Olivette.jpg','올리베떼','떡볶이, 순대, 어묵','서울특별시 양천구 신정동 311','양천구','','12:00 ~ 18:00',0,'','37.5154101,126.857524',NULL,1);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (5,'member','poro','CBE10475A59B247D30F3881C9A5C0445','1234','남',20,'111111-1111111','test@test.com','010-1234-5678','서울특별시 성동구 왕십리역','2020-05-26 01:08:50','2020-05-26 01:08:50','2020-05-29 07:30:43','2020-05-28 08:29:32'),(6,'member','test','92689DB4CAF812D9162A3021D56B769C','test','남',20,'111111-1111111','1111111111111111@11','1111111111','','2020-05-26 02:53:24','2020-05-26 02:53:24','2020-05-29 07:30:06','2020-05-29 07:30:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,1,'옛날핫도그','간식',2000,'1_옛날핫도그.jpg','옛날핫도그옛날핫도그옛날핫도그옛날핫도그옛날핫도그옛날핫도그옛날핫도그옛날핫도그옛날핫도그옛날핫도그옛날핫도그옛날핫도그옛날핫도그옛날핫도그옛날핫도그옛날핫도그',NULL),(2,1,'치즈핫도그','간식',2500,'2_치즈핫도그.jpg','치즈핫도그치즈핫도그치즈핫도그치즈핫도그치즈핫도그치즈핫도그치즈핫도그',NULL),(3,1,'감자핫도그','간식',2500,'3_감자핫도그.jpg',NULL,NULL),(4,1,'떡핫도그','간식',2500,'4_떡핫도그.jpg',NULL,''),(5,1,'먹물핫도그','간식',2500,'5_먹물핫도그.jpg',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'poro',1,0,NULL,'테스트',NULL,'2020-05-21 15:24:00'),(2,'poro',1,0,NULL,'삭제된 리뷰입니다.',NULL,'2020-05-28 08:01:07'),(3,'seller1',1,1,'2','테스트2에 대한 답변',NULL,'2020-05-27 01:33:50'),(5,'poro',1,0,NULL,'테스트345',NULL,'2020-05-26 01:16:00'),(6,'poro',1,0,NULL,'테스트4',NULL,'2020-05-21 15:24:00'),(7,'poro',1,0,NULL,'테스트4',NULL,'2020-05-21 15:24:00'),(8,'poro',1,0,NULL,'테스트4',NULL,'2020-05-21 15:24:00'),(9,'seller1',1,1,'6','테스트4(6)에 대한 답변',NULL,'2020-05-27 01:33:50'),(10,'seller1',1,1,'8','테스트4(8)에 대한 답변',NULL,'2020-05-27 01:33:50'),(155,'seller1',1,1,'7','123',NULL,'2020-05-27 01:33:50'),(177,'seller1',2,0,NULL,'123','','2020-05-27 01:33:50'),(178,'test',2,0,NULL,'tttaa1233147','','2020-05-27 01:14:02'),(195,'seller1',1,1,'1','12',NULL,'2020-05-27 01:42:29');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '판매자 번호',
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'seller','seller1','D95DD081B1AFDDAEEB9A61E669630A01','111','남',20,'111111-1111111','11@11.com','1111111111','','2020-05-26 08:50:30','2020-05-26 08:50:30','111-11-11111','2020-05-27 04:04:57','2020-05-27 04:12:09'),(2,'seller','seller2','A1E014C1F2972E98B2A558147A7D86B6','seller2','남',20,'111111-1111111','111@11.11','111111111','','2020-05-26 08:52:22','2020-05-26 08:52:22','111-11-11111','2020-05-27 04:03:39','2020-05-27 04:04:19'),(3,'seller','seller3','7DDF2BD865C6922E8A9B6B1B7F480A51','1234','남',20,'111111-1111111','1234@1234.1234','1234','','2020-05-27 00:35:30','2020-05-27 00:35:30','111-11-11111',NULL,NULL);
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

-- Dump completed on 2020-05-29 19:35:42
