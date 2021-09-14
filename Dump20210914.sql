-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: coffee-shop
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Coffee'),(2,'Non Coffee'),(3,'Foods'),(4,'Add-on');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details_transaction`
--

DROP TABLE IF EXISTS `details_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `details_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` int DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  `products_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_id` (`transaction_id`),
  KEY `fk_details_transaction_1_idx` (`products_id`),
  CONSTRAINT `details_transaction_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`) ON DELETE CASCADE ON UPDATE SET NULL,
  CONSTRAINT `fk_details_transaction_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details_transaction`
--

LOCK TABLES `details_transaction` WRITE;
/*!40000 ALTER TABLE `details_transaction` DISABLE KEYS */;
INSERT INTO `details_transaction` VALUES (1,35000,1,3,3),(2,25000,1,4,3),(3,35000,2,3,3),(4,25000,2,4,3),(5,35000,3,3,3),(6,25000,3,4,3),(7,35000,4,3,3),(8,25000,4,4,3),(9,35000,5,3,3),(10,25000,5,4,3),(11,35000,6,3,3),(12,25000,6,4,3),(13,35000,7,3,3),(14,25000,7,4,3),(15,35000,8,3,3),(16,25000,8,4,3),(17,35000,9,3,3),(18,25000,9,4,3),(19,35000,10,3,3),(20,25000,10,4,3),(21,35000,11,3,3),(22,25000,11,4,3),(23,35000,12,3,3),(24,25000,12,4,3),(25,35000,13,3,3),(26,25000,13,4,3),(27,35000,14,3,3),(28,25000,14,4,3),(31,35000,16,3,3),(32,25000,16,4,3),(33,35000,17,3,3),(34,25000,17,4,3),(35,35000,18,3,3),(36,25000,18,4,3),(37,35000,19,3,3),(38,25000,19,4,3),(41,35000,21,3,3),(42,25000,21,4,3),(43,35000,22,3,3),(44,25000,22,4,3),(45,35000,23,3,3),(46,25000,23,4,3),(47,35000,24,3,3),(48,25000,24,4,3),(49,35000,25,3,3),(50,25000,25,4,3),(51,35000,26,3,3),(52,25000,26,4,3),(53,35000,27,3,3),(54,25000,27,4,3),(55,35000,28,3,3),(56,25000,28,4,3),(57,35000,29,3,3),(58,25000,29,4,3),(59,35000,30,3,3),(60,25000,30,4,3),(61,35000,31,3,3),(62,25000,31,4,3),(63,35000,32,3,3),(64,25000,32,4,3),(65,35000,33,3,3),(66,25000,33,4,3),(67,35000,34,3,3),(68,25000,34,4,3),(69,35000,35,3,3),(70,25000,35,4,3),(71,35000,36,3,3),(72,25000,36,4,3),(73,35000,37,3,3),(74,25000,37,4,3),(75,35000,38,3,3),(76,25000,38,4,3),(77,35000,39,3,3),(78,25000,39,4,3),(79,35000,40,3,3),(80,25000,40,4,3),(81,35000,41,3,3),(82,25000,41,4,3),(85,35000,43,3,3),(86,25000,43,4,3),(87,35000,45,3,3),(88,25000,45,4,3),(89,35000,47,3,3),(90,25000,47,4,3),(91,35000,51,3,3),(92,25000,51,4,3),(93,35000,52,3,3),(94,25000,52,4,3),(95,35000,53,3,3),(96,25000,53,4,3),(97,35000,54,3,3),(98,25000,54,4,3),(99,35000,55,3,3),(100,25000,55,4,3),(101,35000,57,3,3),(102,25000,57,4,3);
/*!40000 ALTER TABLE `details_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `stock` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `delivery_days` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Summery Fried Rice','img1.jpg','Fried rice with concoction with selected and quality spices',15,15,3,'Tuesday','2-9PM'),(2,'Salty Rice','img2.jpg','Typical village foods',20,0,3,'Tuesday','4-8PM'),(3,'Creamy Ice Coffee','img3.jpg','Creamy Ice Coffee',23,0,1,'Thursday','3-5PM'),(4,'Hazelnut Latte','img4.jpg','Hazelnut Latte',14,10,1,'Sunday','7-9PM'),(5,'Pinky Promise','img5.jpg','Pinky Promise',25,0,2,'Monday','1-3PM'),(19,'Choco Uno','53426084.jpg','lorem ipdkdfgd jkhfgsdffbdsf',24,10,2,'Monday','1 - 5 PM'),(20,'Choco Uno','116076077.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(22,'Choco Uno','577598472.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(24,'Choco Uno','586797869.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(25,'Choco Uno','334854881.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(26,'Choco Uno','972147089.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(27,'Choco Uno','801112572.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(28,'Choco Uno','309820204.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(29,'Choco Uno','270200136.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(30,'Choco Uno','1073087.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(31,'Choco Uno','793734699.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(32,'Choco Uno','959200308.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(33,'Choco Uno','274057676.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(34,'Choco Uno','41312478.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(35,'Choco Uno','302906781.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(36,'Choco Uno','247397686.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(37,'Choco Uno','463661927.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(38,'Choco Uno','228816086.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(39,'Choco Uno','14044177.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(40,'Choco Uno','436587474.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(41,'Choco Uno','977793376.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(42,'Choco Uno','644258338.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(43,'Choco Uno','251501365.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(44,'Choco Uno','359925294.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(45,'Choco Uno','271001915.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(46,'Choco Uno','162699047.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(47,'Choco Uno','434222247.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(48,'Choco Uno','888410430.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(49,'Choco Uno','603168819.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(50,'Choco Uno','383132037.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(51,'Choco Uno','272919531.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(52,'Choco Uno','291615972.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(53,'Choco Uno','765344861.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(54,'Choco Uno','720792331.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(55,'Choco Uno','78304893.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(56,'Choco Uno','496767936.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(57,'Choco Uno','970671489.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(58,'Choco Uno','50659894.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(59,'Choco Uno','944187119.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(60,'Choco Uno','187237368.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(61,'Choco Uno','109446703.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined'),(62,'Choco Uno','899315658.jpg','dfdkjuibuf gfdgffjgj',24,10,2,'Monday','undefined');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size_products`
--

DROP TABLE IF EXISTS `size_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size` enum('R','L','XL') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `code_products` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size_products`
--

LOCK TABLES `size_products` WRITE;
/*!40000 ALTER TABLE `size_products` DISABLE KEYS */;
INSERT INTO `size_products` VALUES (1,'R',25000,1),(2,'L',30000,2),(3,'R',37000,3),(4,'XL',40000,4),(5,'L',28000,5),(27,'L',20000,19),(28,'XL',30000,19),(29,'L',20000,20),(30,'XL',30000,20),(33,'L',20000,22),(34,'XL',30000,22),(37,'L',20000,24),(38,'XL',30000,24),(39,'L',20000,25),(40,'XL',30000,25),(41,'L',20000,26),(42,'L',20000,26),(43,'XL',30000,27),(44,'XL',30000,27),(45,'L',20000,28),(46,'XL',30000,28),(47,'L',20000,29),(48,'XL',30000,29),(49,'L',20000,30),(50,'XL',30000,30),(51,'L',20000,31),(52,'XL',30000,31),(53,'L',20000,32),(54,'XL',30000,32),(55,'L',20000,33),(56,'XL',30000,33),(57,'L',20000,34),(58,'XL',30000,34),(59,'L',20000,35),(60,'XL',30000,35),(61,'L',20000,36),(62,'XL',30000,36),(63,'L',20000,37),(64,'XL',30000,37),(65,'L',20000,38),(66,'XL',30000,38),(67,'L',20000,39),(68,'XL',30000,39),(69,'L',20000,40),(70,'XL',30000,40),(71,'L',20000,41),(72,'XL',30000,41),(73,'L',20000,42),(74,'XL',30000,42),(75,'L',20000,43),(76,'XL',30000,43),(77,'L',20000,44),(78,'XL',30000,44),(79,'L',20000,45),(80,'XL',30000,45),(81,'L',20000,46),(82,'XL',30000,46),(83,'L',20000,47),(84,'XL',30000,47),(85,'L',20000,48),(86,'XL',30000,48),(87,'L',20000,49),(88,'XL',30000,49),(89,'L',20000,50),(90,'XL',30000,50),(91,'L',20000,51),(92,'XL',30000,51),(93,'L',20000,52),(94,'XL',30000,52),(95,'L',20000,53),(96,'XL',30000,53),(97,'L',20000,54),(98,'XL',30000,54),(99,'L',20000,55),(100,'XL',30000,55),(101,'L',20000,56),(102,'XL',30000,56),(103,'L',20000,57),(104,'XL',30000,57),(105,'L',20000,58),(106,'XL',30000,58),(107,'L',20000,59),(108,'XL',30000,59),(109,'L',20000,60),(110,'XL',30000,60),(111,'L',20000,61),(112,'XL',30000,61),(113,'L',20000,62),(114,'XL',30000,62);
/*!40000 ALTER TABLE `size_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `delivery_method` enum('Dine in','Door delivery','Pick up') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` enum('Card','Bank Account','Cash') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` time DEFAULT NULL,
  `shipping` int DEFAULT NULL,
  `subtotal` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transaction_1` (`user_id`),
  CONSTRAINT `fk_transaction_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(2,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(3,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(4,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(5,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(6,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(7,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(8,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(9,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(10,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(11,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(12,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(13,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(14,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(16,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(17,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(18,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(19,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(21,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(22,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(23,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(24,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(25,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(26,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(27,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(28,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(29,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(30,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(31,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(32,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(33,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(34,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(35,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(36,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(37,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(38,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(39,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(40,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(41,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',3),(43,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',1),(44,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',1),(45,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',1),(46,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',1),(47,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',2),(48,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',2),(49,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',2),(50,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',2),(51,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',2),(52,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',2),(53,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',2),(54,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',2),(55,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',2),(56,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',2),(57,'JL deandles','Pick up','Bank Account','10:10:10',20000,10000,100000,'Rouf',2);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int NOT NULL,
  `picture` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `gender` enum('Male','Female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'zulaikha17@gmail.com','$2b$10$jijU.RxdZ45aOSgZyuOKOuo32Mv0OvQolHns8rRZSzUc7BbBLC8.i',81234567,'img1.jpg','Zulaikha','Iskandar Street no. 67 block A near bus stop','Zulaikha','Nirmala','1990-04-02','Female','1'),(2,'sincere@april.biz','$2b$10$r0Evx90ALG633Je//ke0cep2aJYFANSO5BVMdiATBqL9io2XwyiKK',8770736,'img2.jpg','Bret','Kulas Light Street no. 55 ','Leanne','Graham','1991-05-03','Male','1'),(3,'ervin@howell.com','$2b$10$fZRdPhkZ8mdpQmTTMPm8PO.EaJaiJq/4Z.FkugTVYOeLTFU6i8pFy',81290566,'img3.jpg','Antone','Victor Plains Street no. 87','Ervin','Howell','1992-06-04','Male','1'),(4,'hettinger@annie.com','$2b$10$Ba6P5w8zZtg/oYoJJKC1gO77T3ENrlE1scoUCKAgoTAzsl2IrY2h.',895411289,'img4.jpg','Kamren','Skiles Walks Street no. 51','Chelsey','Dietrich','1993-07-05','Female','1'),(5,'jonner@kory.org','$2b$10$aMZqLGWHqGbGiYDZ.1NtEOvbJgi/W20xennctGICrwyLnn35VH.gS',8439170,'img5.jpg','Patric','Hoeger Mall Street no 92','Patricia','Lebsack','1994-08-06','Male','1'),(7,'newuser@mail','$2b$10$26SQY7bGVBkVacxeAkfqp.LdnSPvGw6g3kHvZcgNzh4GhZEMFApme',12345678,'683813246.jpg','New User','Surabaya','user','new','1996-10-20','Male','0'),(8,'from@testing','$2b$10$GLdHcPKX0IcmGO51PqMCc.9LPrXIwGp9ftY376enmMl7fHX2lOBRK',645635795,'951898270.jpg','fromTesting','Ngawi','from','testing','1998-10-09','Male','1'),(480,'unit@testing','$2b$10$tdozrn.ct352241MnwtsiuCU6N0rE1MzQ8VrRoUcVsDECFG47OwzC',645635795,'708961996.jpg','unit testing','Ngawi','from','testing','1998-10-09','Male','1'),(481,'from@testing','$2b$10$54gOS3z.BHMCDSYbsdpgLun/kIsI2pFII5KngsaCrPhVjhF3eJC02',645635795,'478680643.jpg','fromTesting','Ngawi','from','testing','1998-10-09','Male','1'),(483,'fromUpdate1@testing.ceo','$2b$10$5LfGfP/qOd8Vc8Q2qjs7hOmQ7OJ3VNUfbt.g5hrzHo.okNa7sVbCi',645635795,'354814023.jpg','from Testing 3','Ngawi','from','testing','1998-10-09','Male','1'),(484,'fromUpdate1@testing.ceo','$2b$10$wvjaj61RSzIRRUXZZ3/RmeoqVHvj2qnnO5j3BY.Y9rOiyFEOAeTzK',645635795,'858920919.jpg','from Testing 3','Ngawi','from','testing','1998-10-09','Male','1'),(486,'unit@testing235','$2b$10$iQDvufnfrdXfogqhpapqIOXkc.kUtWIjsCPqOc/dSiuCcrokKDmRO',645635795,'796757357.jpg','unit testing235','Ngawi','from','testing','1998-10-09','Male','1'),(487,'unit@testing236','$2b$10$wlmCNUXlvKCQmb2aVT1fJOXnosemGV45HBqwH39nKNZ00lehCbi.C',645635795,'989747132.jpg','unit testing236','Ngawi','from','testing','1998-10-09','Male','1'),(488,'unit@testing237','$2b$10$QMAKXBVmvDgl1Cri0fn3TujRshbyBRYjJJV0FhhvCNmTmSPTDaP.u',645635795,'677637292.jpg','unit testing237','Ngawi','from','testing','1998-10-09','Male','1'),(489,'unit@testing238','$2b$10$j57ikMNJTe0pseIMkXe/Ee7MnadHtPHB7qLP7.0hKSkiTksH/258i',645635795,'965249171.jpg','unit testing238','Ngawi','from','testing','1998-10-09','Male','1'),(490,'unit@testing239','$2b$10$KYKA/sPd4jAquyJWEArweuf6qFARM7j3HAVunY8yk69k3fqPaeHiu',645635795,'973900569.jpg','unit testing239','Ngawi','from','testing','1998-10-09','Male','1'),(491,'unit@testing120','$2b$10$UTfXXCYAVPpFDAgsFaTm2uJJAYMXGJXdDPOoXcrDFEk4eIOHhznmO',645635795,'806228533.jpg','unit testing120','Ngawi','from','testing','1998-10-09','Male','1'),(492,'unit@testing121','$2b$10$nTMXMIEK4UwQ5eJem9hTgO3f0o644MBroLcp9r4fk2EUUWIFfWZa.',645635795,'526032431.jpg','unit testing121','Ngawi','from','testing','1998-10-09','Male','1'),(493,'unit@testing121','$2b$10$f85A6rDKNVrLO4IIgatDY.Rb.ctZQofMvSi1uJN/9E6Q9/s1/Ek2.',645635795,'860411661.jpg','unit testing121','Ngawi','from','testing','1998-10-09','Male','1'),(494,'unit@testing122','$2b$10$W8GqsMYp4pA0vEzbBKbZU.8us7VSb/cQ42jBTXY1g7MG83wY64cdy',645635795,'286160943.jpg','unit testing122','Ngawi','from','testing','1998-10-09','Male','1'),(498,'unit@testing124','$2b$10$SH6aU33EjDu9wScH2ra8j..4zHEzWcvtDGtCrscE2ExGkQrBztb6a',645635795,'400344521.jpg','unit testing124','Ngawi','from','testing','1998-10-09','Male','1'),(499,'unit@testing125','$2b$10$nUjRmmsGfLDvcxjg9Iyk3uRiue0LhbuH7M4Phhj5N9.NqviYQPwGK',645635795,'113784002.jpg','unit testing125','Ngawi','from','testing','1998-10-09','Male','1'),(500,'unit@testing125','$2b$10$GbSRkO25MybVW86VWPUKu.fAWpuF5yCXS9R.e0FqASl0gVTpCGPZ6',645635795,'67312316.jpg','unit testing125','Ngawi','from','testing','1998-10-09','Male','1'),(501,'unit@testing126','$2b$10$W4QdeSRIK6jFak1e1eNlJeIlpKFRUJbR1Qq5dg2oVN9y5TrLrWlmi',645635795,'687592263.jpg','unit testing126','Ngawi','from','testing','1998-10-09','Male','1'),(502,'unit@testing127','$2b$10$OseaW56jRLZkDS9nvKV7Je5HVgNmPLDXCjahQC8qMeqrL5/J.DGOG',645635795,'592225576.jpg','unit testing127','Ngawi','from','testing','1998-10-09','Male','1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-14  4:31:56
