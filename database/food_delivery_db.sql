-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: food_delivery_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `uq_cart_item` (`user_id`,`menu_id`),
  KEY `fk_cart_menu` (`menu_id`),
  CONSTRAINT `fk_cart_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int NOT NULL,
  `item_name` varchar(140) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`menu_id`),
  KEY `fk_menu_restaurant` (`restaurant_id`),
  CONSTRAINT `fk_menu_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`restaurant_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Paneer Butter Masala','Creamy tomato gravy with soft paneer cubes.',249.00,'https://images.unsplash.com/photo-1631452180519-c014fe946bc7?auto=format&fit=crop&w=900&q=80',1),(2,1,'Butter Naan','Soft tandoor naan brushed with butter.',55.00,'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=900&q=80',1),(3,2,'Chicken Biryani','Aromatic basmati rice cooked with tender chicken.',299.00,'https://images.unsplash.com/photo-1633945274405-b6c8069047b0?auto=format&fit=crop&w=900&q=80',1),(4,2,'Tandoori Platter','Smoky kebabs with chutney and salad.',449.00,'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?auto=format&fit=crop&w=900&q=80',1),(5,3,'Alfredo Pasta','Penne tossed in creamy parmesan sauce.',279.00,'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?auto=format&fit=crop&w=900&q=80',1),(6,3,'Margherita Pizza','Classic cheese pizza with fresh basil.',329.00,'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?auto=format&fit=crop&w=900&q=80',1),(7,4,'California Roll','Crab, avocado, cucumber, and seasoned rice.',399.00,'https://images.unsplash.com/photo-1611143669185-af224c5e3252?auto=format&fit=crop&w=900&q=80',1),(8,5,'Idli Sambar','Traditional South Indian breakfast featuring soft idlis paired with spicy vegetable sambar and creamy coconut chutney.',200.00,'https://img.freepik.com/premium-photo/traditional-idli-sambar-with-colorful-chutneys-south-indian-breakfast-featuring-steamed-rice-cakes-rich-sambar_1260445-4952.jpg?w=1380',1),(9,5,'dosa','Traditional South Indian crispy dosa made from fermented rice and lentil batter, served with hot sambar and coconut chutney.',300.00,'https://img.freepik.com/premium-photo/masala-dosa-this-is-popular-south-indian-dosa-variety-made-with-potato-filling-known-as-masala-dosa-is-made-by-spreading-thin-layer-fermented-rice-lentil-batter-hot-griddle_57665-25046.jpg?w=2000',1),(10,6,'Mutton Briyani','Enjoy our signature Mutton Biryani made with premium basmati rice, tender marinated mutton, traditional spices, and slow-cooked to deliver authentic taste in every bite.',400.00,'https://anantha.in/wp-content/uploads/2020/03/Mutton-Biryani-Img.jpg',1),(11,7,'Chicken Briyani','Aromatic basmati rice cooked with tender chicken pieces, traditional Indian spices, and fresh herbs for an authentic biryani experience.',299.00,'https://b.zmtcdn.com/data/pictures/chains/1/50691/ecfdc75d21bd7cd9d880f05c8382bc65.jpg',1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_order_items_order` (`order_id`),
  KEY `fk_order_items_menu` (`menu_id`),
  CONSTRAINT `fk_order_items_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`),
  CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,7,2,399.00),(2,2,1,2,249.00),(3,2,2,2,55.00),(4,3,7,4,399.00),(5,4,7,1,399.00),(6,5,7,2,399.00),(7,6,7,1,399.00),(8,7,7,2,399.00),(9,8,7,1,399.00),(10,9,1,2,249.00),(11,9,2,2,55.00),(12,10,7,2,399.00),(13,11,4,1,449.00),(14,12,7,3,399.00),(15,13,7,2,399.00),(16,14,7,2,399.00),(19,16,7,1,399.00),(28,21,7,1,399.00),(29,22,1,1,249.00),(30,23,7,4,399.00),(31,24,7,1,399.00),(33,26,5,1,279.00),(34,26,6,1,329.00),(35,27,1,1,249.00),(36,27,2,1,55.00),(37,28,7,2,399.00),(38,29,7,1,399.00),(39,30,7,1,399.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` enum('Cash On Delivery','UPI','Credit Card') NOT NULL,
  `status` enum('Pending','Preparing','Out For Delivery','Delivered') NOT NULL DEFAULT 'Pending',
  `delivery_address` text NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_user` (`user_id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,798.00,'Cash On Delivery','Pending','KANYAKUMARI','2026-06-23 15:54:24'),(2,3,608.00,'UPI','Pending','KANYAKUMARI','2026-06-23 15:58:04'),(3,3,1596.00,'UPI','Pending','KANYAKUMARI','2026-06-23 16:08:13'),(4,3,399.00,'Credit Card','Pending','KANYAKUMARI','2026-06-23 16:49:11'),(5,3,798.00,'Cash On Delivery','Pending','KANYAKUMARI','2026-06-25 05:41:12'),(6,3,399.00,'Cash On Delivery','Pending','KANYAKUMARI','2026-06-26 10:00:00'),(7,3,798.00,'Cash On Delivery','Pending','KANYAKUMARI','2026-06-28 04:48:12'),(8,3,399.00,'UPI','Pending','KANYAKUMARI','2026-06-28 14:25:48'),(9,3,608.00,'Cash On Delivery','Pending','KANYAKUMARI','2026-06-28 16:11:53'),(10,3,798.00,'Credit Card','Pending','KANYAKUMARI','2026-07-01 13:49:59'),(11,3,449.00,'Cash On Delivery','Pending','KANYAKUMARI','2026-07-01 13:50:30'),(12,9,1197.00,'Cash On Delivery','Pending','kerala','2026-07-06 10:59:28'),(13,3,798.00,'Cash On Delivery','Pending','KANYAKUMARI','2026-07-07 11:30:29'),(14,3,798.00,'UPI','Pending','KANYAKUMARI','2026-07-08 04:32:51'),(16,3,399.00,'Cash On Delivery','Pending','KANYAKUMARI','2026-07-08 15:40:34'),(21,1,399.00,'Cash On Delivery','Pending','Food Delivery HQ','2026-07-10 15:17:08'),(22,1,249.00,'Cash On Delivery','Delivered','Food Delivery HQ','2026-07-10 15:37:34'),(23,1,1596.00,'Cash On Delivery','Delivered','Food Delivery HQ','2026-07-11 14:02:14'),(24,1,399.00,'Cash On Delivery','Pending','Food Delivery HQ','2026-07-11 16:45:52'),(26,1,608.00,'UPI','Delivered','Food Delivery HQ','2026-07-12 13:53:50'),(27,1,304.00,'Credit Card','Preparing','Food Delivery HQ','2026-07-14 13:41:54'),(28,1,798.00,'Cash On Delivery','Delivered','Food Delivery HQ','2026-07-20 09:03:47'),(29,1,399.00,'Cash On Delivery','Pending','Food Delivery HQ','2026-08-06 12:12:01'),(30,1,399.00,'Cash On Delivery','Pending','Food Delivery HQ','2026-08-06 12:20:26');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(140) NOT NULL,
  `cuisine_type` varchar(120) NOT NULL,
  `delivery_time` varchar(40) NOT NULL,
  `rating` decimal(2,1) NOT NULL DEFAULT '4.0',
  `image_url` varchar(500) NOT NULL,
  PRIMARY KEY (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Spice Street','North Indian','25-30 min',4.6,'https://images.unsplash.com/photo-1585937421612-70a008356fbe?auto=format&fit=crop&w=900&q=80'),(2,'Urban Tandoor','Mughlai','30-35 min',4.4,'https://images.unsplash.com/photo-1565557623262-b51c2513a641?auto=format&fit=crop&w=900&q=80'),(3,'Pasta Palace','Italian','20-25 min',4.5,'https://images.unsplash.com/photo-1551183053-bf91a1d81141?auto=format&fit=crop&w=900&q=80'),(4,'Sushi Central','Japanese','35-40 min',4.7,'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?auto=format&fit=crop&w=900&q=80'),(5,'A2B','VEG MEALS','30 - 40 Mins',4.5,'https://tb-static.uber.com/prod/image-proc/processed_images/0e766bab579c08cba8a0ba279315c8b2/b15c9ad51e970f3ee593eca3d03cee54.jpeg'),(6,'Asif Briyani','Mutton Briyani','20-30min',4.0,'https://www.uengage.in/images/addo/logos/logo-7057-1680525431.png'),(7,'Meghanas Kitchen','Briyani','20-30min',4.0,'https://imgstaticcontent.lbb.in/lbbnew/wp-content/uploads/sites/2/2016/02/meghnasbiryani.jpg'),(8,'Nahdi Mandi Restaurant ','authentic Arabic cuisine','35-40 min',4.0,'https://www.bing.com/th/id/OLC.Z5zdOupaennhNA480x360?w=222&h=200&c=8&rs=1&qlt=90&cdv=1&dpr=1.3&pid=Local');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `role` enum('CUSTOMER','ADMIN') NOT NULL DEFAULT 'CUSTOMER',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@food.com','admin123','Food Delivery HQ','ADMIN','2026-06-22 14:02:24'),(3,' Nila','niladevaraj51@gmail.com','nila','KANYAKUMARI','CUSTOMER','2026-06-23 04:06:02'),(9,'Akash D','akash@gmail.com','123456','kerala','CUSTOMER','2026-07-06 10:56:03');
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

-- Dump completed on 2026-08-12 15:59:03
