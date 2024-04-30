-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: localhost    Database: midterm_db
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('0c4ef3b5dbfd');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Kadın','kadin','2024-04-17 02:00:58'),(2,'Erkek','erkek','2024-04-17 02:00:58'),(3,'Divided','divided','2024-04-17 02:00:58'),(4,'Bebek','bebek','2024-04-17 02:00:58'),(5,'Çocuk','cocuk','2024-04-17 02:00:58'),(6,'Spor','spor','2024-04-17 02:00:58');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `cover_image` varchar(512) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_new` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,1,'Bikini Altı',24.99,'Mercan Pembe',35,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F00%2F38%2F003886aee103144b1501a62027f0f7f1e4be16c9.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-25 15:04:45','2024-04-27 22:46:13',1),(4,1,'Mini File Elbise',49.50,'Gece Mavisi',20,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F93%2F8f%2F938faf65c1a70d3119a3955c07837c4206447cda.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-25 15:04:45','2024-04-27 22:47:25',1),(5,1,'Büzgülü Viskoz Elbise',35.75,'Zeytin Yeşili',50,'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Ff6%2Fe9%2Ff6e9245b1bb57f25c7578848063a21037a07d1d9.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D','2024-04-25 15:04:45','2024-04-27 22:44:54',1),(6,1,'Kuşaklı Gömlek Elbise',42.00,'Kömür Grisi',15,'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F75%2F29%2F7529bed2aa9d0d42d9a28a27875908ee6980be21.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D','2024-04-25 15:04:45','2024-04-27 22:44:54',1),(7,1,'Oversize Keten Gömlek',38.90,'Fildişi Beyazı',40,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F87%2Fee%2F87ee2f4e3b5adb5dfad99b00a9ba41ef6aea6dc9.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-25 15:04:45','2024-04-27 22:44:54',1),(8,1,'Kolsuz Kısa Üst',19.95,'Parlak Sarı',25,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F99%2Ffe%2F99feedd1aa5e54e1771ba6f193920719f6bb695b.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-25 15:04:45','2024-04-27 22:44:54',1),(9,1,'Büzgülü Viskoz Elbise',35.75,'Zeytin Yeşili',30,'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F80%2F66%2F8066651a10d0df1292d9b94090e9dc2719ac85f9.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D','2024-04-25 15:04:45','2024-04-27 22:44:54',1),(10,1,'Oversize Keten Gömlek',38.90,'Fildişi Beyazı',22,'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Fa0%2Fdc%2Fa0dcb61fdb4946e1154c07276486897929133f51.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D','2024-04-25 15:04:45','2024-04-27 22:44:54',1),(11,1,'Bikini Altı',24.99,'Mercan Pembe',18,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F52%2Fa9%2F52a904fc58d087076469eca62bfa138af657f4bb.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-25 15:04:45','2024-04-27 22:44:54',1),(24,2,'Relaxed Fit Erkek Yaka Keten Gömlek',97.51,'random_color',16,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F77%2F3f%2F773f1e2794f234d4ee8d8b62673e0c6f72eb7abc.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-27 22:35:49','2024-04-27 22:35:49',1),(25,2,'Relaxed Fit Erkek Yaka Keten Gömlek',87.59,'random_color',90,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fe0%2Fcb%2Fe0cb169c4410f35b48fc696ed6a70f5b2dc1bb94.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-27 22:35:49','2024-04-27 22:35:49',1),(26,2,'Relaxed Fit Erkek Yaka Keten Gömlek',86.52,'random_color',63,'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Fae%2F8c%2Fae8cf40066a0272ea03a183564b1b8caa4e62177.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D','2024-04-27 22:35:49','2024-04-27 22:35:49',1),(27,2,'Regular Fit Keten Karışımlı Gömlek',55.58,'random_color',89,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fc1%2F85%2Fc185e088726346b29907f834e46dd5a694585566.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-27 22:35:49','2024-04-27 22:35:49',1),(28,2,'Regular Fit Modal Karışımlı Erkek Yaka Gömlek',77.33,'random_color',20,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F4e%2F27%2F4e27db673624bf147d1ed8b0d0dafde7ae64db45.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-27 22:35:49','2024-04-27 22:35:49',1),(29,2,'Regular Fit Delik Desenli Triko Gömlek',69.04,'random_color',85,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fd0%2Fea%2Fd0ead92b5ea1e32f98a890d478aec4175e54387f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-27 22:35:49','2024-04-27 22:35:49',1),(30,3,'Pamuklu Tişört',81.32,'random_color',87,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fd6%2F4e%2Fd64e88b90189e5140ae0e54940553dc54efefcc0.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-27 23:06:57','2024-04-27 23:06:57',1),(31,3,'Ribanalı Tişört',89.85,'random_color',89,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F4a%2Fb3%2F4ab379a03f0cd296d911e449f36d908db608da3d.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-27 23:06:57','2024-04-27 23:06:57',1),(32,3,'Oversize Tişört',75.28,'random_color',10,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Ff8%2F33%2Ff833dc193c1a88708ee3791c1a9cd9489b27e00d.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-27 23:06:57','2024-04-27 23:06:57',1),(33,3,'Kep Kollu ve Büzgülü Üst',21.73,'random_color',80,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fb5%2Ff9%2Fb5f94cae3f3c015af4486610a1e519c38f42bc6e.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-27 23:06:57','2024-04-27 23:06:57',1),(34,3,'Kanvas Kargo Şort',35.24,'random_color',36,'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fba%2F71%2Fba711d319f66f7d9eeb332da2c4ee2f9990c7ca2.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]','2024-04-27 23:06:57','2024-04-27 23:06:57',1),(35,3,'Burgu Detaylı Tek Omuzlu Üst',74.11,'random_color',63,'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2Ffb%2Fa7%2Ffba7d9382d3d84ab552c4b062f01f3783a9fcb66.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BLOOKBOOK%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D','2024-04-27 23:06:57','2024-04-27 23:06:57',1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-29 23:33:59
