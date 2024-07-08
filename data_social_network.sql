-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: social_network
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message` (
  `chat_id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  PRIMARY KEY (`chat_id`),
  CONSTRAINT `chat_message_chk_1` CHECK ((`type` between 0 and 2))
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--

LOCK TABLES `chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
INSERT INTO `chat_message` VALUES (20,'aa','Nguyễn Thành Nhân','Dương Hoàng Long','2024-07-03 16:25:37.129072',0),(21,'bb','Dương Hoàng Long','Nguyễn Thành Nhân','2024-07-03 16:25:41.502314',0),(22,'dsadsad','Dương Hoàng Long','Nguyễn Thành Nhân','2024-07-03 16:27:05.720471',0),(23,'aaaa','Dương Hoàng Long','Nguyễn Thành Nhân','2024-07-03 16:30:26.282628',0),(24,'bbb','Nguyễn Thành Nhân','Dương Hoàng Long','2024-07-03 16:30:29.253040',0),(25,'sss','Nguyễn Thành Nhân','Dương Hoàng Long','2024-07-03 16:32:12.516226',0),(26,'ddd','Nguyễn Thành Nhân','long','2024-07-03 16:44:58.364620',0),(27,'fff','Nguyễn Thành Nhân','long','2024-07-03 16:47:37.983631',0),(28,'aa','Nguyễn Thành Nhân','long','2024-07-03 16:48:03.091844',0),(29,'sss','Nguyễn Thành Nhân','1','2024-07-03 16:49:12.117108',0),(30,'dd','Nguyễn Thành Nhân','long','2024-07-03 16:50:38.024900',0),(31,'sss','Nguyễn Thành Nhân','long','2024-07-03 16:57:14.447165',0),(32,'ddd','nhan','long','2024-07-03 17:01:07.389161',0),(33,'sssaa','Nguyễn Thành Nhân','long','2024-07-03 17:01:18.805501',0),(34,'dd','nhan','long','2024-07-03 17:01:24.066069',0),(35,'ddd','long','nhan','2024-07-03 17:01:49.378279',0),(36,'long','nhan','long','2024-07-03 17:01:56.944322',0),(37,'nhan','long','nhan','2024-07-03 17:01:59.703459',0),(38,'abc','long','nhan','2024-07-03 18:03:39.286777',0),(39,'mnmnj','nhan','long','2024-07-03 18:03:42.105456',0),(40,'yuttyuyt','long','quy','2024-07-03 21:18:53.143174',0),(41,'ỷtyr','quy','long','2024-07-03 21:18:55.260100',0),(42,'hello','nhan','quy','2024-07-05 09:58:23.171507',0),(43,'hi','quy','nhan','2024-07-05 09:58:26.739300',0),(44,'hello','long','quy','2024-07-05 11:31:00.539024',0),(45,'hi','quy','long','2024-07-05 11:31:03.601416',0);
/*!40000 ALTER TABLE `chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `post_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs1slvnkuemjsq2kj4h3vhx7i1` (`post_id`),
  CONSTRAINT `FKs1slvnkuemjsq2kj4h3vhx7i1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (102,'Nguyễn Hữu Quý','alo','2024-07-04 14:58:44.495385',4,7),(105,'Nguyễn Hữu Quý','helo','2024-07-05 00:31:54.181551',4,1),(106,'Nguyễn Hữu Quý','quy binh cluan','2024-07-05 11:33:42.288908',4,7),(107,'Nguyễn Hữu Quý','hhh','2024-07-05 11:33:59.162682',4,7);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_block`
--

DROP TABLE IF EXISTS `friend_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_block` (
  `block_friend_id` bigint NOT NULL AUTO_INCREMENT,
  `addressee_id` bigint NOT NULL,
  `requester_id` bigint NOT NULL,
  PRIMARY KEY (`block_friend_id`),
  KEY `FKpwdromg1nyuxprhfbxe4xw1wr` (`addressee_id`),
  KEY `FKdvo5rfbkwasudeo18h7ehiqjq` (`requester_id`),
  CONSTRAINT `FKdvo5rfbkwasudeo18h7ehiqjq` FOREIGN KEY (`requester_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKpwdromg1nyuxprhfbxe4xw1wr` FOREIGN KEY (`addressee_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_block`
--

LOCK TABLES `friend_block` WRITE;
/*!40000 ALTER TABLE `friend_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `friend_request_id` bigint NOT NULL AUTO_INCREMENT,
  `accepted_at` datetime(6) DEFAULT NULL,
  `requested_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('PENDING','ACCEPTED','REJECTED') NOT NULL DEFAULT 'PENDING',
  `addressee_id` bigint NOT NULL,
  `requester_id` bigint NOT NULL,
  PRIMARY KEY (`friend_request_id`),
  KEY `FKsoyl82l4vmnu6mhihbuua8ddy` (`addressee_id`),
  KEY `FKri3588r9atpppe038o2abrasc` (`requester_id`),
  CONSTRAINT `FKri3588r9atpppe038o2abrasc` FOREIGN KEY (`requester_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKsoyl82l4vmnu6mhihbuua8ddy` FOREIGN KEY (`addressee_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,'2024-07-03 14:47:27.803000','2024-07-03 07:46:47','ACCEPTED',3,1),(2,'2024-07-03 14:47:28.859000','2024-07-03 07:47:22','ACCEPTED',3,4),(10,'2024-07-05 11:30:40.237000','2024-07-05 04:30:25','ACCEPTED',1,4);
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'user/assets/images/post/432772617_1624340828376139_6677181590091419808_n.jpg'),(4,'user/assets/images/post/Cat_and_Dog.png'),(5,'user/assets/images/post/download.jpg'),(6,'user/assets/images/post/Duck.png'),(7,'user/assets/images/post/GauTruc.png'),(8,'user/assets/images/post/279455187_594598114865951_7440947279832479676_n.jpg'),(10,'user/assets/images/post/324042873_892292125299907_176441753814452640_n.jpg'),(12,'user/assets/images/post/279455187_594598114865951_7440947279832479676_n.jpg'),(13,'user/assets/images/post/279476351_799868287658883_6513972129707658847_n.jpg'),(14,'user/assets/images/post/324042873_892292125299907_176441753814452640_n.jpg'),(15,'user/assets/images/post/324961088_1197653667553080_5512993496072532610_n.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_token`
--

DROP TABLE IF EXISTS `password_reset_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expiry_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5lwtbncug84d4ero33v3cfxvl` (`user_id`),
  CONSTRAINT `FK5lwtbncug84d4ero33v3cfxvl` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_token`
--

LOCK TABLES `password_reset_token` WRITE;
/*!40000 ALTER TABLE `password_reset_token` DISABLE KEYS */;
INSERT INTO `password_reset_token` VALUES (1,'2024-07-04 13:25:15.165000','a8008e06-cd77-451d-9ff1-fe70670a4ee9',4),(2,'2024-07-04 14:28:11.130000','99bd8b88-7d89-43ff-bf63-661d4b5adf77',4);
/*!40000 ALTER TABLE `password_reset_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `elapsed_time` varchar(255) DEFAULT NULL,
  `likes` int NOT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK72mt33dhhs48hf9gcqrq4fxte` (`user_id`),
  CONSTRAINT `FK72mt33dhhs48hf9gcqrq4fxte` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Nguyễn Thành Nhân','Nhan test',NULL,0,'2024-07-03 14:42:40.425367',3),(5,'Dương Hoàng Long','long test',NULL,0,'2024-07-03 14:46:06.635860',1),(6,'Dương Hoàng Long','logn tétttt\r\n',NULL,1,'2024-07-03 18:04:09.994978',1),(7,'Nguyễn Hữu Quý','quy test ',NULL,0,'2024-07-03 22:49:42.004187',4),(9,'Nguyễn Hữu Quý','test video',NULL,0,'2024-07-04 20:25:34.964183',4),(11,'Dương Hoàng Long','hello',NULL,0,'2024-07-05 11:35:35.375786',1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_images`
--

DROP TABLE IF EXISTS `post_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_images` (
  `post_id` bigint NOT NULL,
  `images_id` bigint NOT NULL,
  UNIQUE KEY `UKm78offcf9uxb8jox1hpjfcftf` (`images_id`),
  KEY `FK4436mqgshkhub17yvq5ku91f7` (`post_id`),
  CONSTRAINT `FK4436mqgshkhub17yvq5ku91f7` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `FK7qbn4kangy50vix0gbupf9rkp` FOREIGN KEY (`images_id`) REFERENCES `image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_images`
--

LOCK TABLES `post_images` WRITE;
/*!40000 ALTER TABLE `post_images` DISABLE KEYS */;
INSERT INTO `post_images` VALUES (1,1),(5,4),(5,5),(5,6),(5,7),(6,8),(7,10),(11,12),(11,13),(11,14),(11,15);
/*!40000 ALTER TABLE `post_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_likes` (
  `post_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `FKc85he3c94qv5vmyutmf0plp69` (`user_id`),
  CONSTRAINT `FKc85he3c94qv5vmyutmf0plp69` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKmxmoc9p5ndijnsqtvsjcuoxm3` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_likes`
--

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
INSERT INTO `post_likes` VALUES (6,1);
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_videos`
--

DROP TABLE IF EXISTS `post_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_videos` (
  `post_id` bigint NOT NULL,
  `videos_id` bigint NOT NULL,
  UNIQUE KEY `UKaft9mjkc31ju0awgngvbtremx` (`videos_id`),
  KEY `FK13hn7k9frbxaf4xfrlq46uj19` (`post_id`),
  CONSTRAINT `FK13hn7k9frbxaf4xfrlq46uj19` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `FKnucf5bll0mo5egfrk2ytw9h2s` FOREIGN KEY (`videos_id`) REFERENCES `video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_videos`
--

LOCK TABLES `post_videos` WRITE;
/*!40000 ALTER TABLE `post_videos` DISABLE KEYS */;
INSERT INTO `post_videos` VALUES (6,2),(7,3),(9,4);
/*!40000 ALTER TABLE `post_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistic`
--

DROP TABLE IF EXISTS `statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistic` (
  `id_statistic` bigint NOT NULL AUTO_INCREMENT,
  `visit_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visitors` bigint NOT NULL,
  PRIMARY KEY (`id_statistic`)
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistic`
--

LOCK TABLES `statistic` WRITE;
/*!40000 ALTER TABLE `statistic` DISABLE KEYS */;
INSERT INTO `statistic` VALUES (1,'2024-07-02 17:00:00',1),(2,'2024-07-02 17:00:00',3),(3,'2024-07-02 17:00:00',4),(4,'2024-07-02 17:00:00',5),(5,'2024-07-02 17:00:00',5),(6,'2024-07-02 17:00:00',5),(7,'2024-07-02 17:00:00',4),(8,'2024-07-02 17:00:00',1),(9,'2024-07-02 17:00:00',3),(10,'2024-07-02 17:00:00',3),(11,'2024-07-02 17:00:00',3),(12,'2024-07-02 17:00:00',3),(13,'2024-07-02 17:00:00',3),(14,'2024-07-02 17:00:00',3),(15,'2024-07-02 17:00:00',3),(16,'2024-07-02 17:00:00',3),(17,'2024-07-02 17:00:00',3),(18,'2024-07-02 17:00:00',3),(19,'2024-07-02 17:00:00',3),(20,'2024-07-02 17:00:00',3),(21,'2024-07-02 17:00:00',3),(22,'2024-07-02 17:00:00',3),(23,'2024-07-02 17:00:00',3),(24,'2024-07-02 17:00:00',3),(25,'2024-07-02 17:00:00',3),(26,'2024-07-02 17:00:00',3),(27,'2024-07-02 17:00:00',3),(28,'2024-07-02 17:00:00',3),(29,'2024-07-02 17:00:00',3),(30,'2024-07-02 17:00:00',3),(31,'2024-07-02 17:00:00',3),(32,'2024-07-02 17:00:00',4),(33,'2024-07-02 17:00:00',4),(34,'2024-07-02 17:00:00',4),(35,'2024-07-02 17:00:00',4),(36,'2024-07-02 17:00:00',1),(37,'2024-07-02 17:00:00',1),(38,'2024-07-02 17:00:00',1),(39,'2024-07-02 17:00:00',1),(40,'2024-07-02 17:00:00',1),(41,'2024-07-02 17:00:00',1),(42,'2024-07-02 17:00:00',1),(43,'2024-07-02 17:00:00',1),(44,'2024-07-02 17:00:00',1),(45,'2024-07-02 17:00:00',1),(46,'2024-07-02 17:00:00',1),(47,'2024-07-02 17:00:00',1),(48,'2024-07-02 17:00:00',1),(49,'2024-07-02 17:00:00',1),(50,'2024-07-02 17:00:00',1),(51,'2024-07-02 17:00:00',1),(52,'2024-07-02 17:00:00',1),(53,'2024-07-02 17:00:00',1),(54,'2024-07-02 17:00:00',1),(55,'2024-07-02 17:00:00',1),(56,'2024-07-02 17:00:00',1),(57,'2024-07-02 17:00:00',1),(58,'2024-07-02 17:00:00',1),(59,'2024-07-02 17:00:00',1),(60,'2024-07-02 17:00:00',1),(61,'2024-07-02 17:00:00',1),(62,'2024-07-02 17:00:00',1),(63,'2024-07-02 17:00:00',4),(64,'2024-07-02 17:00:00',4),(65,'2024-07-02 17:00:00',4),(66,'2024-07-02 17:00:00',1),(67,'2024-07-02 17:00:00',1),(68,'2024-07-02 17:00:00',1),(69,'2024-07-02 17:00:00',1),(70,'2024-07-02 17:00:00',1),(71,'2024-07-02 17:00:00',3),(72,'2024-07-02 17:00:00',3),(73,'2024-07-02 17:00:00',4),(74,'2024-07-02 17:00:00',3),(75,'2024-07-02 17:00:00',3),(76,'2024-07-02 17:00:00',4),(77,'2024-07-02 17:00:00',3),(78,'2024-07-02 17:00:00',4),(79,'2024-07-02 17:00:00',5),(80,'2024-07-02 17:00:00',5),(81,'2024-07-02 17:00:00',5),(82,'2024-07-02 17:00:00',5),(83,'2024-07-02 17:00:00',5),(84,'2024-07-02 17:00:00',5),(85,'2024-07-02 17:00:00',5),(86,'2024-07-02 17:00:00',5),(87,'2024-07-02 17:00:00',5),(88,'2024-07-02 17:00:00',5),(89,'2024-07-02 17:00:00',5),(90,'2024-07-02 17:00:00',3),(91,'2024-07-02 17:00:00',5),(92,'2024-07-02 17:00:00',3),(93,'2024-07-02 17:00:00',4),(94,'2024-07-02 17:00:00',1),(95,'2024-07-02 17:00:00',3),(96,'2024-07-02 17:00:00',3),(97,'2024-07-02 17:00:00',3),(98,'2024-07-02 17:00:00',5),(99,'2024-07-02 17:00:00',3),(100,'2024-07-02 17:00:00',3),(101,'2024-07-02 17:00:00',5),(102,'2024-07-02 17:00:00',4),(103,'2024-07-02 17:00:00',1),(104,'2024-07-02 17:00:00',1),(105,'2024-07-02 17:00:00',1),(106,'2024-07-02 17:00:00',1),(107,'2024-07-02 17:00:00',1),(108,'2024-07-02 17:00:00',5),(109,'2024-07-02 17:00:00',1),(110,'2024-07-02 17:00:00',4),(111,'2024-07-02 17:00:00',1),(112,'2024-07-02 17:00:00',3),(113,'2024-07-02 17:00:00',3),(114,'2024-07-02 17:00:00',1),(115,'2024-07-02 17:00:00',1),(116,'2024-07-02 17:00:00',3),(117,'2024-07-02 17:00:00',1),(118,'2024-07-02 17:00:00',3),(119,'2024-07-02 17:00:00',3),(120,'2024-07-02 17:00:00',1),(121,'2024-07-02 17:00:00',1),(122,'2024-07-02 17:00:00',3),(123,'2024-07-02 17:00:00',1),(124,'2024-07-02 17:00:00',3),(125,'2024-07-02 17:00:00',3),(126,'2024-07-02 17:00:00',4),(127,'2024-07-02 17:00:00',4),(128,'2024-07-02 17:00:00',3),(129,'2024-07-02 17:00:00',3),(130,'2024-07-02 17:00:00',3),(131,'2024-07-02 17:00:00',1),(132,'2024-07-02 17:00:00',1),(133,'2024-07-02 17:00:00',1),(134,'2024-07-02 17:00:00',1),(135,'2024-07-02 17:00:00',1),(136,'2024-07-02 17:00:00',1),(137,'2024-07-02 17:00:00',1),(138,'2024-07-02 17:00:00',1),(139,'2024-07-02 17:00:00',1),(140,'2024-07-02 17:00:00',1),(141,'2024-07-02 17:00:00',1),(142,'2024-07-02 17:00:00',1),(143,'2024-07-02 17:00:00',1),(144,'2024-07-02 17:00:00',1),(145,'2024-07-02 17:00:00',1),(146,'2024-07-02 17:00:00',1),(147,'2024-07-02 17:00:00',1),(148,'2024-07-02 17:00:00',1),(149,'2024-07-02 17:00:00',1),(150,'2024-07-02 17:00:00',3),(151,'2024-07-02 17:00:00',3),(152,'2024-07-02 17:00:00',3),(153,'2024-07-02 17:00:00',1),(154,'2024-07-02 17:00:00',1),(155,'2024-07-02 17:00:00',1),(156,'2024-07-02 17:00:00',3),(157,'2024-07-02 17:00:00',3),(158,'2024-07-02 17:00:00',1),(159,'2024-07-02 17:00:00',1),(160,'2024-07-02 17:00:00',3),(161,'2024-07-02 17:00:00',3),(162,'2024-07-02 17:00:00',3),(163,'2024-07-02 17:00:00',3),(164,'2024-07-02 17:00:00',1),(165,'2024-07-02 17:00:00',1),(166,'2024-07-02 17:00:00',3),(167,'2024-07-02 17:00:00',4),(168,'2024-07-02 17:00:00',4),(169,'2024-07-02 17:00:00',4),(170,'2024-07-02 17:00:00',5),(171,'2024-07-02 17:00:00',5),(172,'2024-07-02 17:00:00',3),(173,'2024-07-02 17:00:00',1),(174,'2024-07-02 17:00:00',5),(175,'2024-07-02 17:00:00',5),(176,'2024-07-02 17:00:00',5),(177,'2024-07-02 17:00:00',5),(178,'2024-07-02 17:00:00',5),(179,'2024-07-02 17:00:00',1),(180,'2024-07-02 17:00:00',1),(181,'2024-07-02 17:00:00',1),(182,'2024-07-02 17:00:00',1),(183,'2024-07-02 17:00:00',1),(184,'2024-07-02 17:00:00',1),(185,'2024-07-02 17:00:00',1),(186,'2024-07-02 17:00:00',1),(187,'2024-07-02 17:00:00',1),(188,'2024-07-02 17:00:00',1),(189,'2024-07-02 17:00:00',1),(190,'2024-07-02 17:00:00',1),(191,'2024-07-02 17:00:00',1),(192,'2024-07-02 17:00:00',1),(193,'2024-07-02 17:00:00',3),(194,'2024-07-02 17:00:00',3),(195,'2024-07-02 17:00:00',3),(196,'2024-07-02 17:00:00',3),(197,'2024-07-02 17:00:00',3),(198,'2024-07-02 17:00:00',4),(199,'2024-07-02 17:00:00',4),(200,'2024-07-02 17:00:00',4),(201,'2024-07-02 17:00:00',1),(202,'2024-07-02 17:00:00',4),(203,'2024-07-02 17:00:00',4),(204,'2024-07-02 17:00:00',1),(205,'2024-07-02 17:00:00',4),(206,'2024-07-02 17:00:00',1),(207,'2024-07-02 17:00:00',3),(208,'2024-07-02 17:00:00',1),(209,'2024-07-02 17:00:00',1),(210,'2024-07-02 17:00:00',3),(211,'2024-07-02 17:00:00',3),(212,'2024-07-02 17:00:00',1),(213,'2024-07-02 17:00:00',4),(214,'2024-07-02 17:00:00',4),(215,'2024-07-02 17:00:00',1),(216,'2024-07-02 17:00:00',4),(217,'2024-07-02 17:00:00',5),(218,'2024-07-02 17:00:00',5),(219,'2024-07-02 17:00:00',1),(220,'2024-07-02 17:00:00',1),(221,'2024-07-02 17:00:00',1),(222,'2024-07-02 17:00:00',4),(223,'2024-07-02 17:00:00',4),(224,'2024-07-02 17:00:00',5),(225,'2024-07-02 17:00:00',5),(226,'2024-07-02 17:00:00',4),(227,'2024-07-02 17:00:00',5),(228,'2024-07-02 17:00:00',5),(229,'2024-07-02 17:00:00',4),(230,'2024-07-02 17:00:00',4),(231,'2024-07-02 17:00:00',4),(232,'2024-07-02 17:00:00',4),(233,'2024-07-02 17:00:00',4),(234,'2024-07-02 17:00:00',4),(235,'2024-07-02 17:00:00',4),(236,'2024-07-02 17:00:00',3),(237,'2024-07-02 17:00:00',3),(238,'2024-07-02 17:00:00',3),(239,'2024-07-02 17:00:00',3),(240,'2024-07-02 17:00:00',4),(241,'2024-07-02 17:00:00',4),(242,'2024-07-02 17:00:00',4),(243,'2024-07-02 17:00:00',4),(244,'2024-07-02 17:00:00',4),(245,'2024-07-02 17:00:00',4),(246,'2024-07-02 17:00:00',4),(247,'2024-07-02 17:00:00',4),(248,'2024-07-02 17:00:00',4),(249,'2024-07-02 17:00:00',4),(250,'2024-07-02 17:00:00',4),(251,'2024-07-02 17:00:00',4),(252,'2024-07-02 17:00:00',4),(253,'2024-07-02 17:00:00',4),(254,'2024-07-02 17:00:00',4),(255,'2024-07-02 17:00:00',4),(256,'2024-07-02 17:00:00',4),(257,'2024-07-02 17:00:00',4),(258,'2024-07-02 17:00:00',4),(259,'2024-07-02 17:00:00',4),(260,'2024-07-02 17:00:00',4),(261,'2024-07-02 17:00:00',4),(262,'2024-07-02 17:00:00',4),(263,'2024-07-02 17:00:00',4),(264,'2024-07-02 17:00:00',4),(265,'2024-07-02 17:00:00',4),(266,'2024-07-02 17:00:00',4),(267,'2024-07-02 17:00:00',4),(268,'2024-07-02 17:00:00',4),(269,'2024-07-02 17:00:00',4),(270,'2024-07-02 17:00:00',4),(271,'2024-07-02 17:00:00',4),(272,'2024-07-02 17:00:00',4),(273,'2024-07-02 17:00:00',4),(274,'2024-07-02 17:00:00',4),(275,'2024-07-02 17:00:00',4),(276,'2024-07-02 17:00:00',4),(277,'2024-07-02 17:00:00',4),(278,'2024-07-02 17:00:00',4),(279,'2024-07-02 17:00:00',4),(280,'2024-07-02 17:00:00',4),(281,'2024-07-02 17:00:00',4),(282,'2024-07-02 17:00:00',4),(283,'2024-07-02 17:00:00',4),(284,'2024-07-02 17:00:00',4),(285,'2024-07-02 17:00:00',1),(286,'2024-07-02 17:00:00',1),(287,'2024-07-02 17:00:00',1),(288,'2024-07-02 17:00:00',1),(289,'2024-07-02 17:00:00',1),(290,'2024-07-02 17:00:00',1),(291,'2024-07-02 17:00:00',1),(292,'2024-07-02 17:00:00',1),(293,'2024-07-02 17:00:00',4),(294,'2024-07-02 17:00:00',4),(295,'2024-07-02 17:00:00',4),(296,'2024-07-02 17:00:00',4),(297,'2024-07-02 17:00:00',4),(298,'2024-07-02 17:00:00',4),(299,'2024-07-02 17:00:00',4),(300,'2024-07-02 17:00:00',4),(301,'2024-07-02 17:00:00',4),(302,'2024-07-02 17:00:00',4),(303,'2024-07-02 17:00:00',4),(304,'2024-07-02 17:00:00',4),(305,'2024-07-02 17:00:00',4),(306,'2024-07-02 17:00:00',4),(307,'2024-07-02 17:00:00',4),(308,'2024-07-02 17:00:00',1),(309,'2024-07-02 17:00:00',1),(310,'2024-07-02 17:00:00',1),(311,'2024-07-02 17:00:00',5),(312,'2024-07-02 17:00:00',5),(313,'2024-07-02 17:00:00',1),(314,'2024-07-02 17:00:00',1),(315,'2024-07-02 17:00:00',1),(316,'2024-07-02 17:00:00',1),(317,'2024-07-02 17:00:00',4),(318,'2024-07-02 17:00:00',1),(319,'2024-07-02 17:00:00',1),(320,'2024-07-02 17:00:00',1),(321,'2024-07-02 17:00:00',1),(322,'2024-07-02 17:00:00',4),(323,'2024-07-02 17:00:00',4),(324,'2024-07-02 17:00:00',1),(325,'2024-07-02 17:00:00',4),(326,'2024-07-02 17:00:00',4),(327,'2024-07-02 17:00:00',4),(328,'2024-07-02 17:00:00',4),(329,'2024-07-02 17:00:00',4),(330,'2024-07-02 17:00:00',4),(331,'2024-07-02 17:00:00',4),(332,'2024-07-02 17:00:00',4),(333,'2024-07-02 17:00:00',4),(334,'2024-07-02 17:00:00',4),(335,'2024-07-02 17:00:00',4),(336,'2024-07-02 17:00:00',4),(337,'2024-07-02 17:00:00',4),(338,'2024-07-02 17:00:00',4),(339,'2024-07-02 17:00:00',4),(340,'2024-07-02 17:00:00',4),(341,'2024-07-02 17:00:00',4),(342,'2024-07-02 17:00:00',4),(343,'2024-07-02 17:00:00',4),(344,'2024-07-02 17:00:00',4),(345,'2024-07-02 17:00:00',4),(346,'2024-07-02 17:00:00',4),(347,'2024-07-02 17:00:00',4),(348,'2024-07-02 17:00:00',4),(349,'2024-07-02 17:00:00',4),(350,'2024-07-02 17:00:00',4),(351,'2024-07-02 17:00:00',4),(352,'2024-07-02 17:00:00',4),(353,'2024-07-02 17:00:00',4),(354,'2024-07-02 17:00:00',4),(355,'2024-07-02 17:00:00',4),(356,'2024-07-02 17:00:00',4),(357,'2024-07-02 17:00:00',4),(358,'2024-07-02 17:00:00',4),(359,'2024-07-02 17:00:00',4),(360,'2024-07-02 17:00:00',4),(361,'2024-07-02 17:00:00',4),(362,'2024-07-02 17:00:00',4),(363,'2024-07-02 17:00:00',4),(364,'2024-07-02 17:00:00',4),(365,'2024-07-02 17:00:00',4),(366,'2024-07-02 17:00:00',4),(367,'2024-07-02 17:00:00',4),(368,'2024-07-02 17:00:00',4),(369,'2024-07-02 17:00:00',4),(370,'2024-07-02 17:00:00',4),(371,'2024-07-02 17:00:00',4),(372,'2024-07-02 17:00:00',4),(373,'2024-07-02 17:00:00',4),(374,'2024-07-02 17:00:00',4),(375,'2024-07-02 17:00:00',4),(376,'2024-07-02 17:00:00',4),(377,'2024-07-02 17:00:00',4),(378,'2024-07-02 17:00:00',4),(379,'2024-07-02 17:00:00',4),(380,'2024-07-02 17:00:00',4),(381,'2024-07-02 17:00:00',4),(382,'2024-07-02 17:00:00',4),(383,'2024-07-02 17:00:00',4),(384,'2024-07-02 17:00:00',4),(385,'2024-07-02 17:00:00',4),(386,'2024-07-02 17:00:00',4),(387,'2024-07-02 17:00:00',4),(388,'2024-07-02 17:00:00',4),(389,'2024-07-02 17:00:00',4),(390,'2024-07-02 17:00:00',4),(391,'2024-07-02 17:00:00',4),(392,'2024-07-02 17:00:00',4),(393,'2024-07-02 17:00:00',4),(394,'2024-07-02 17:00:00',4),(395,'2024-07-02 17:00:00',4),(396,'2024-07-02 17:00:00',4),(397,'2024-07-02 17:00:00',4),(398,'2024-07-02 17:00:00',4),(399,'2024-07-02 17:00:00',4),(400,'2024-07-02 17:00:00',4),(401,'2024-07-02 17:00:00',4),(402,'2024-07-02 17:00:00',4),(403,'2024-07-02 17:00:00',4),(404,'2024-07-02 17:00:00',4),(405,'2024-07-02 17:00:00',4),(406,'2024-07-02 17:00:00',4),(407,'2024-07-02 17:00:00',4),(408,'2024-07-02 17:00:00',4),(409,'2024-07-02 17:00:00',4),(410,'2024-07-02 17:00:00',4),(411,'2024-07-02 17:00:00',4),(412,'2024-07-02 17:00:00',4),(413,'2024-07-02 17:00:00',4),(414,'2024-07-02 17:00:00',5),(415,'2024-07-02 17:00:00',5),(416,'2024-07-02 17:00:00',5),(417,'2024-07-02 17:00:00',5),(418,'2024-07-02 17:00:00',5),(419,'2024-07-02 17:00:00',5),(420,'2024-07-02 17:00:00',4),(421,'2024-07-02 17:00:00',4),(422,'2024-07-02 17:00:00',4),(423,'2024-07-02 17:00:00',3),(424,'2024-07-02 17:00:00',1),(425,'2024-07-02 17:00:00',1),(426,'2024-07-02 17:00:00',1),(427,'2024-07-02 17:00:00',3),(428,'2024-07-02 17:00:00',5),(429,'2024-07-02 17:00:00',1),(430,'2024-07-02 17:00:00',1),(431,'2024-07-02 17:00:00',1),(432,'2024-07-02 17:00:00',1),(433,'2024-07-02 17:00:00',4),(434,'2024-07-02 17:00:00',4),(435,'2024-07-02 17:00:00',4),(436,'2024-07-02 17:00:00',4),(437,'2024-07-02 17:00:00',4),(438,'2024-07-02 17:00:00',3),(439,'2024-07-02 17:00:00',3),(440,'2024-07-02 17:00:00',3),(441,'2024-07-02 17:00:00',3),(442,'2024-07-02 17:00:00',3),(443,'2024-07-02 17:00:00',1),(444,'2024-07-02 17:00:00',3),(445,'2024-07-02 17:00:00',1),(446,'2024-07-02 17:00:00',3),(447,'2024-07-02 17:00:00',3),(448,'2024-07-03 17:00:00',4),(449,'2024-07-03 17:00:00',5),(450,'2024-07-03 17:00:00',4),(451,'2024-07-03 17:00:00',4),(452,'2024-07-03 17:00:00',4),(453,'2024-07-03 17:00:00',4),(454,'2024-07-03 17:00:00',4),(455,'2024-07-03 17:00:00',4),(456,'2024-07-03 17:00:00',4),(457,'2024-07-03 17:00:00',4),(458,'2024-07-03 17:00:00',4),(459,'2024-07-03 17:00:00',4),(460,'2024-07-03 17:00:00',4),(461,'2024-07-03 17:00:00',4),(462,'2024-07-03 17:00:00',5),(463,'2024-07-03 17:00:00',4),(464,'2024-07-03 17:00:00',4),(465,'2024-07-03 17:00:00',4),(466,'2024-07-03 17:00:00',4),(467,'2024-07-03 17:00:00',3),(468,'2024-07-03 17:00:00',1),(469,'2024-07-03 17:00:00',5),(470,'2024-07-03 17:00:00',5),(471,'2024-07-03 17:00:00',5),(472,'2024-07-03 17:00:00',5),(473,'2024-07-03 17:00:00',5),(474,'2024-07-03 17:00:00',1),(475,'2024-07-03 17:00:00',5),(476,'2024-07-03 17:00:00',5),(477,'2024-07-03 17:00:00',5),(478,'2024-07-03 17:00:00',5),(479,'2024-07-03 17:00:00',6),(480,'2024-07-03 17:00:00',6),(481,'2024-07-03 17:00:00',5),(482,'2024-07-03 17:00:00',5),(483,'2024-07-04 17:00:00',4),(484,'2024-07-04 17:00:00',4),(485,'2024-07-04 17:00:00',4),(486,'2024-07-04 17:00:00',4),(487,'2024-07-04 17:00:00',4),(488,'2024-07-04 17:00:00',4),(489,'2024-07-04 17:00:00',3),(490,'2024-07-04 17:00:00',3),(491,'2024-07-04 17:00:00',3),(492,'2024-07-04 17:00:00',3),(493,'2024-07-04 17:00:00',3),(494,'2024-07-04 17:00:00',7),(495,'2024-07-04 17:00:00',7),(496,'2024-07-04 17:00:00',1),(497,'2024-07-04 17:00:00',1),(498,'2024-07-04 17:00:00',1),(499,'2024-07-04 17:00:00',1),(500,'2024-07-04 17:00:00',4),(501,'2024-07-04 17:00:00',3),(502,'2024-07-04 17:00:00',4),(503,'2024-07-04 17:00:00',3),(504,'2024-07-04 17:00:00',3),(505,'2024-07-04 17:00:00',4),(506,'2024-07-04 17:00:00',4),(507,'2024-07-04 17:00:00',3),(508,'2024-07-04 17:00:00',3),(509,'2024-07-04 17:00:00',4),(510,'2024-07-04 17:00:00',3),(511,'2024-07-04 17:00:00',3),(512,'2024-07-04 17:00:00',4),(513,'2024-07-04 17:00:00',3),(514,'2024-07-04 17:00:00',3),(515,'2024-07-04 17:00:00',4),(516,'2024-07-04 17:00:00',3),(517,'2024-07-04 17:00:00',4),(518,'2024-07-04 17:00:00',1),(519,'2024-07-04 17:00:00',1),(520,'2024-07-04 17:00:00',4),(521,'2024-07-04 17:00:00',4),(522,'2024-07-04 17:00:00',1),(523,'2024-07-04 17:00:00',1),(524,'2024-07-04 17:00:00',4),(525,'2024-07-04 17:00:00',4),(526,'2024-07-04 17:00:00',4),(527,'2024-07-04 17:00:00',4),(528,'2024-07-04 17:00:00',4),(529,'2024-07-04 17:00:00',4),(530,'2024-07-04 17:00:00',4),(531,'2024-07-04 17:00:00',4),(532,'2024-07-04 17:00:00',4),(533,'2024-07-04 17:00:00',5),(534,'2024-07-04 17:00:00',5),(535,'2024-07-04 17:00:00',1),(536,'2024-07-04 17:00:00',1),(537,'2024-07-04 17:00:00',1),(538,'2024-07-04 17:00:00',1);
/*!40000 ALTER TABLE `statistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_status` bit(1) NOT NULL,
  `active_status` bit(1) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `cover_photo` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `gender` bit(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `user_name` varchar(50) NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UKlqjrcobrh9jc8wpcar64q1bfh` (`user_name`),
  UNIQUE KEY `UK4bgmpi98dylab6qdvf9xyaxu4` (`phone_number`),
  KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`),
  CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,_binary '',_binary '\0','/user/assets/images/profile/b0ccc852-b258-48e7-b32a-1eed2838ac44_371141871_1789575664832793_8054037732257515627_n.jpg','Long đây','/user/assets/images/profile/8cf01ae4-cc8d-4e76-a086-684a6285dff0_278676506_1449774715479558_7140619298110173106_n.jpg','2024-07-03','2024-07-12','long@gmail.com','Dương Hoàng Long',_binary '','2024-07-05 11:35:49.814661','$2a$10$fMCXK7WNqmwl/fgbl/emneaeRqyiYnnVn0vQ/UaGD4wBro9uKzVqS','0123456789','long',2),(3,_binary '',_binary '\0','/user/assets/images/profile/efc0ef08-aa31-40d5-a6a0-a18f66bed4a1_432772617_1624340828376139_6677181590091419808_n.jpg','Nhân đây','/user/assets/images/profile/aad36529-55db-4f8d-ae2e-c139b39461fc_359821688_1484450952365128_2819907387331769080_n.jpg','2024-07-03','2024-07-20','nhan@gmail.com','Nguyễn Thành Nhân',_binary '','2024-07-05 11:30:27.707400','$2a$10$9TvS53i6.q1V83aaUabCbetsJnjgbryiPMNabrn2jv5df.ByqIxNy','0321654987','nhan',2),(4,_binary '',_binary '\0','/user/assets/images/profile/33e8be63-f713-46b1-ae14-8b2bbf3c5874_324042873_892292125299907_176441753814452640_n.jpg','hello','/user/assets/images/profile/3ba7bb74-89d6-4293-b24d-79b4c9c3b1d3_279455187_594598114865951_7440947279832479676_n.jpg','2024-07-03','2024-07-03','nguyenhuuquy110203@gmail.com','Nguyễn Hữu Quý',_binary '','2024-07-05 11:34:06.912266','$2a$10$fMCXK7WNqmwl/fgbl/emneaeRqyiYnnVn0vQ/UaGD4wBro9uKzVqS','0987654321','quy',2),(5,_binary '',_binary '','/user/assets/images/profile/1a1df748-1431-4850-b973-17296b3f65de_Picture1.png','','/user/assets/images/profile/73729978-a1f1-438e-99cd-5ff9d65266d0_279455187_594598114865951_7440947279832479676_n.jpg','2024-07-03','2024-07-07','admin@gmail.com','admin Le',_binary '','2024-07-05 00:30:07.074281','$2a$10$vyaDAPeqZoOIGJeDGaLv6.Sj4NzvWSW9eG02.91TgbLXV92BPOYj.','0147852369','admin',1),(7,_binary '',_binary '',NULL,NULL,NULL,'2024-07-05','2024-07-05','tranthihieu321@gmail.com','Music',_binary '\0',NULL,'$2a$10$YIcm2FEA.HBL7aQ9xB75pelznsQFVeaCto0g/0Jv.bmYKS6iWnnwe',NULL,'tranthihieu321@gmail.com',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (2,'user/assets/images/post/video-1656257903.mp4'),(3,'user/assets/images/post/video-1656257903.mp4'),(4,'user/assets/images/post/video-1656257903.mp4');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-08 14:22:50
