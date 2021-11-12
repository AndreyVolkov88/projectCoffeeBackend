-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: coffee_shop
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `products_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_id` (`transaction_id`),
  KEY `fk_details_transaction_1_idx` (`products_id`),
  CONSTRAINT `details_transaction_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`) ON DELETE CASCADE ON UPDATE SET NULL,
  CONSTRAINT `fk_details_transaction_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details_transaction`
--

LOCK TABLES `details_transaction` WRITE;
/*!40000 ALTER TABLE `details_transaction` DISABLE KEYS */;
INSERT INTO `details_transaction` VALUES (159,25000,93,64,2),(160,23000,93,72,2),(163,25000,95,69,2),(164,21000,95,70,2),(165,25000,96,64,2),(166,32000,97,68,2),(167,31000,97,71,2),(168,32000,98,63,2),(173,32000,102,63,2),(174,35000,103,63,3),(175,35000,104,63,3),(176,35000,105,63,3),(178,35000,107,63,3),(179,35000,108,63,3),(180,35000,109,63,3),(181,35000,110,63,3),(182,35000,111,63,3),(183,35000,112,63,3),(184,35000,113,63,3),(185,35000,114,63,3),(186,35000,115,63,3),(187,35000,116,63,3);
/*!40000 ALTER TABLE `details_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `delivery_days` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` enum('L','R','XL') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (63,'Summery Fried Rice','948498844.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus explicabo eos dolorum tempora quisquam, expedita aliquam inventore labore consectetur incidunt consequuntur deleniti a facilis voluptatibus assumenda reprehenderit iste perspiciatis! Enim perferendis magnam modi labore, ducimus sapiente officia dicta eos sunt',11,13,3,'Sunday - Saturday','1 - 3 PM','L','32000'),(64,'Drum Sticks','11988202.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus explicabo eos dolorum tempora quisquam, expedita aliquam inventore labore consectetur incidunt consequuntur deleniti a facilis voluptatibus assumenda reprehenderit iste perspiciatis! Enim perferendis magnam modi labore, ducimus sapiente officia dicta eos sunt',11,20,3,'Saturday - Tuesday','1 - 6 PM','R','25000'),(65,'Salty Rice','442165792.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus explicabo eos dolorum tempora quisquam, expedita aliquam inventore labore consectetur incidunt consequuntur deleniti a facilis voluptatibus assumenda reprehenderit iste perspiciatis! Enim perferendis magnam modi labore, ducimus sapiente officia dicta eos sunt',11,0,3,'Saturday - Tuesday','1 - 6 PM','XL','35000'),(66,'Veggie tomato mix','477455029.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus explicabo eos dolorum tempora quisquam, expedita aliquam inventore labore consectetur incidunt consequuntur deleniti a facilis voluptatibus assumenda reprehenderit iste perspiciatis! Enim perferendis magnam modi labore, ducimus sapiente officia dicta eos sunt',11,10,3,'Saturday - Tuesday','1 - 6 PM','R','34000'),(67,'Chicken Fire Wings','654569674.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus explicabo eos dolorum tempora quisquam, expedita aliquam inventore labore consectetur incidunt consequuntur deleniti a facilis voluptatibus assumenda reprehenderit iste perspiciatis! Enim perferendis magnam modi labore, ducimus sapiente officia dicta eos sunt',13,0,3,'Saturday - Tuesday','1 - 6 PM','L','30000'),(68,'Beef Spaghetti','508693785.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus explicabo eos dolorum tempora quisquam, expedita aliquam inventore labore consectetur incidunt consequuntur deleniti a facilis voluptatibus assumenda reprehenderit iste perspiciatis! Enim perferendis magnam modi labore, ducimus sapiente officia dicta eos sunt',13,10,3,'Saturday - Tuesday','1 - 6 PM','XL','32000'),(69,'Creamy Ice Coffee','853264071.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus explicabo eos dolorum tempora quisquam, expedita aliquam inventore labore consectetur incidunt consequuntur deleniti a facilis voluptatibus assumenda reprehenderit iste perspiciatis! Enim perferendis magnam modi labore, ducimus sapiente officia dicta eos sunt',13,0,3,'Saturday - Tuesday','1 - 6 PM','L','25000'),(70,'Hazelnut Latte','159331493.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus explicabo eos dolorum tempora quisquam, expedita aliquam inventore labore consectetur incidunt consequuntur deleniti a facilis voluptatibus assumenda reprehenderit iste perspiciatis! Enim perferendis magnam modi labore, ducimus sapiente officia dicta eos sunt',13,0,3,'Saturday - Tuesday','1 - 6 PM','R','21000'),(71,'Cold Brew','595270922.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus explicabo eos dolorum tempora quisquam, expedita aliquam inventore labore consectetur incidunt consequuntur deleniti a facilis voluptatibus assumenda reprehenderit iste perspiciatis! Enim perferendis magnam modi labore, ducimus sapiente officia dicta eos sunt',13,15,3,'Saturday - Tuesday','1 - 6 PM','XL','31000'),(72,'Pinky Promise','639104494.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus explicabo eos dolorum tempora quisquam, expedita aliquam inventore labore consectetur incidunt consequuntur deleniti a facilis voluptatibus assumenda reprehenderit iste perspiciatis! Enim perferendis magnam modi labore, ducimus sapiente officia dicta eos sunt',13,10,3,'Saturday - Tuesday','1 - 6 PM','R','23000'),(74,'Choco Oreo','153553170.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus explicabo eos dolorum tempora quisquam, expedita aliquam inventore labore consectetur incidunt consequuntur deleniti a facilis voluptatibus assumenda reprehenderit iste perspiciatis! Enim perferendis magnam modi labore, ducimus sapiente officia dicta eos sunt',13,10,3,'Saturday - Tuesday','1 - 6 PM','XL','29000'),(75,'Ice Cream Caramel','558357770.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus explicabo eos dolorum tempora quisquam, expedita aliquam inventore labore consectetur incidunt consequuntur deleniti a facilis voluptatibus assumenda reprehenderit iste perspiciatis! Enim perferendis magnam modi labore, ducimus sapiente officia dicta eos sunt',13,10,3,'Saturday - Tuesday','1 - 6 PM','L','27000');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_method` enum('Dine in','Door delivery','Pick up') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` enum('Card','Bank account','Cash on delivery') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` int(11) DEFAULT NULL,
  `tax` int(10) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transaction_1` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (93,'Iskandar Street no. 67 block A near bus stop','Dine in','Bank account',0,15000,96000,111000,'Zulaikha',503,NULL),(95,'Iskandar Street no. 67 block A near bus stop','Pick up','Cash on delivery',10000,15000,92000,117000,'Zulaikha',503,NULL),(96,'Jl Deandles No.28 Surabaya Utara','Door delivery','Bank account',10000,15000,50000,75000,'Zulaikha',503,NULL),(97,'meja nomor 5','Dine in','Card',0,15000,126000,141000,'Zulaikha',503,NULL),(98,'Iskandar Street no. 67 block A near bus stop','Door delivery','Bank account',10000,15000,64000,89000,'Zulaikha',503,NULL),(102,'meja 3','Dine in','Card',0,15000,64000,79000,'sirorouf37@gmail.com',530,NULL),(103,'Iskandar Street no. 67 block A near bus stop','Door delivery','Card',0,15000,64000,79000,'Zulaikha',503,NULL),(104,'JL deandles','Pick up','Bank account',20000,15000,10000,100000,'Rouf',503,NULL),(105,'JL deandles','Pick up','Bank account',20000,15000,10000,100000,'Rouf',503,NULL),(107,'JL deandles','Pick up','Bank account',20000,15000,10000,100000,'Rouf',503,NULL),(108,'JL deandles','Pick up','Bank account',20000,15000,10000,100000,'Rouf',503,NULL),(109,'JL deandles','Pick up','Bank account',20000,15000,10000,100000,'Rouf',503,NULL),(110,'JL deandles','Pick up','Bank account',20000,15000,10000,100000,'Rouf',503,NULL),(111,'JL deandles','Pick up','Bank account',20000,15000,10000,100000,'Rouf',503,NULL),(112,'JL deandles','Pick up','Bank account',20000,15000,10000,100000,'Rouf',503,NULL),(113,'JL deandles','Pick up','Bank account',20000,15000,10000,100000,'Rouf',503,NULL),(114,'JL deandles','Pick up','Bank account',20000,15000,10000,100000,'Rouf',503,NULL),(115,'JL deandles','Pick up','Bank account',20000,15000,10000,100000,'Rouf',503,NULL),(116,'JL deandles','Pick up','Bank account',20000,15000,10000,100000,'Rouf',503,NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `gender` enum('Male','Female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=559 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (503,'zulaikha17@gmail.com','$2b$10$TDOuxGNpScE01Ti5KldeCOA1ZEzaWBFyL0EUexVopvboItVBIszti','+6281234567812','410392591.jpg','Zulaikha','Iskandar Street no. 67 block A near bus stop','Zulaikha','Nirmala','1997-12-15','Female',1),(504,'sincere@april.biz','$2b$10$o32gSbfFaAwqSOun8zKxpeQ1oM/hL.rTy7CB/EuQEAAkDDwoa6e/6','+6281234567823','716322551.jpg','Bret','Kulas Light Street no. 55 ','Leanne','undefined','1997-12-15','Male',1),(505,'ervin@howell.com','$2b$10$D//rrzim/oPoicUsVb0kQ.Rq2C2BcWR6KRTD.JEKyEW6ky8tszJPy','+6281234567824','534282367.jpg','Antone','Victor Plains Street no. 87','Ervin','undefined','1997-12-15','Male',1),(506,'hettinger@annie.com','$2b$10$4gDQp9tb.F/LXDXxuXP5HeTmBnWQhqJ8VlN8EVgSVr0i9GBfKKeNy','+6281234567825','337884356.jpg','Kamren','Skiles Walks Street no. 51','Chelsey','undefined','1997-12-15','Female',1),(507,'jonner@kory.org','$2b$10$ECHClFOQVnnxNytFf5dcY.c/2VtcJ/4i8IWi.yU1mCI2sQcA52Xmy','+6281234567826','364180030.jpg','Patric','Hoeger Mall Street no 92','Patricia','undefined','1997-12-15','Male',1);
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

-- Dump completed on 2021-11-12 10:52:28
