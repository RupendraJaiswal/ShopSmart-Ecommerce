-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_db
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `cc_cvv` varchar(255) DEFAULT NULL,
  `cc_expiration` varchar(255) DEFAULT NULL,
  `cc_name` varchar(255) DEFAULT NULL,
  `cc_number` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `order_track_id` varchar(255) DEFAULT NULL,
  `total_amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'VILLAGE-SHADIPUR','POST-SELUMAU','3','2','RUPENDRA','1','India','jaiswalrupendra8055@gmail.com','RUPENDRA','JAISWAL','Mizoram','261001','2025-05-28 13:15:33.709506','PLACED','c7e560d3-bc56-4519-8200-aebeb458cac7',162),(2,'VILLAGE-SHADIPUR','POST-SELUMAU','2','2','RUPENDRA','8','India','jaiswalrupendra8055@gmail.com','RUPENDRA','JAISWAL','','','2025-05-28 13:16:08.945875','PLACED','d7cd59d5-1110-4dac-a1c5-47b452392727',162),(3,'VILLAGE-SHADIPUR','POST-SELUMAU','3','3','RUPENDRA','2','India','jaiswalrupendra8055@gmail.com','RUPENDRA','JAISWAL','Kerala','261001','2025-05-28 13:21:43.818461','PLACED','da875ad2-aab2-4e4d-9bf0-31d12e65fb3c',162),(4,'','','','','','','India','','RUPENDRA','JAISWAL','','','2025-05-28 13:35:26.348924','PLACED','7bf4cc39-3529-44a5-92ad-b75f108d105d',162),(5,'VILLAGE-SHADIPUR','','','','','','India','jaiswalrupendra8055@gmail.com','RUPENDRA','JAISWAL','','','2025-05-28 13:42:42.693783','PLACED','a476d9a2-f671-489b-a4f4-a64b411bbcf8',140),(6,'','','','','','','India','','','','','','2025-05-28 13:43:48.419644','PLACED','95403f4f-d374-4ce9-8cea-30cf35c7f3b1',140),(7,'','','','','','','India','','','','','','2025-05-28 13:49:33.937477','PLACED','c2578012-dd7c-41c5-a85f-b66add80fd4d',140),(8,'','','','','','','India','','','','','','2025-05-28 13:50:36.898797','PLACED','cc46b61f-d2de-4447-9f20-65229488ceb5',52),(9,'','','','','','','India','','','','','','2025-05-28 13:52:47.706082','PLACED','69f8529d-83ef-4485-b9f6-7ed349e137f3',86),(10,'','','','','','','India','','','','','','2025-05-28 13:53:26.140878','PLACED','e31025c7-3f72-41f5-901d-e2092e91b7df',198),(11,'','','','','','','India','','','','','','2025-05-28 13:55:48.225030','PLACED','d64bda8e-3333-44dd-92eb-d88048c30f85',725),(12,'','','','','','','India','','','','','','2025-05-28 13:59:59.639010','PLACED','2d4145d4-ba8f-46a3-8505-d6158a770e91',198),(13,'','','','','','','India','','','','','','2025-05-28 14:02:54.021845','PLACED','c1fee76f-eca9-4ec0-98f2-c1261852069f',140),(14,'','','','','','','India','','','','','','2025-05-28 14:03:17.957724','PLACED','d29a4bbc-99e2-41ec-9f7a-bff5bd8e8b3d',140),(15,'','','','','','','India','','','','','','2025-05-28 14:06:16.039619','PLACED','f9dfbe09-4bc7-4ad9-8ea5-82c9f50bc912',162);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_cart_items`
--

DROP TABLE IF EXISTS `order_cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_cart_items` (
  `order_id` bigint NOT NULL,
  `product_id` int NOT NULL,
  KEY `FKh78r1x3tiacm5l0cbp4en6kpt` (`product_id`),
  KEY `FKf3huuscrvr5snm4j5uo3lpipc` (`order_id`),
  CONSTRAINT `FKf3huuscrvr5snm4j5uo3lpipc` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `FKh78r1x3tiacm5l0cbp4en6kpt` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_cart_items`
--

LOCK TABLES `order_cart_items` WRITE;
/*!40000 ALTER TABLE `order_cart_items` DISABLE KEYS */;
INSERT INTO `order_cart_items` VALUES (1,1),(1,2),(2,1),(2,2),(3,1),(3,2),(4,1),(4,2),(5,1),(6,1),(7,1),(8,2),(9,3),(10,6),(11,5),(12,6),(13,1),(14,1),(15,1),(15,2);
/*!40000 ALTER TABLE `order_cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `count` int DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'men\'s clothing','Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday','c1d35ea3-04ea-47fc-b7a2-0dcbaa245c3f-81fPKd-2AYL._AC_SL1500_.jpg',109.95,120,3.9,'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops'),(2,'men\'s clothing','Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.','28add59d-97d3-46b3-a181-a1f6bf29c886-71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',22.3,259,4.1,'Mens Casual Premium Slim Fit T-Shirts '),(3,'men\'s clothing','great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.','de9547e1-f023-49b3-89aa-7aaa3a4e03ec-71li-ujtlUL._AC_UX679_.jpg',55.99,500,4.7,'Mens Cotton Jacket'),(4,'men\'s clothing','The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.','c3cb662e-fb7a-4384-b023-af414f6ec95b-71YXzeOuslL._AC_UY879_.jpg',15.99,430,2.1,'Mens Casual Slim Fit'),(5,'jewelery','From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.','0d557306-eaaa-4deb-aab3-99c40ef386d4-71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',695,400,4.6,'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet'),(6,'jewelery','Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.','c02cf7d1-2835-4cdc-a660-eb136142581d-61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg',168,70,3.9,'Solid Gold Petite Micropave '),(7,'jewelery','Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine\'s Day...','3b1450b8-53bd-4d7c-aa65-624cd26b5563-71YAIFU48IL._AC_UL640_QL65_ML3_.jpg',9.99,400,3,'White Gold Plated Princess'),(8,'jewelery','Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel','c7417f1e-2446-4382-958e-715f36be40d8-51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg',10.99,100,1.9,'Pierced Owl Rose Gold Plated Stainless Steel Double'),(9,'electronics','USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system','a4a300ca-d0bc-42dc-a26a-6d9dc8e027f9-61IBBVJvSDL._AC_SY879_.jpg',64,203,3.3,'WD 2TB Elements Portable External Hard Drive - USB 3.0 '),(10,'electronics','Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5” hard drive; Based on published specifications and internal benchmarking tests using PCMark vantage scores) Boosts burst write performance, making it ideal for typical PC workloads The perfect balance of performance and reliability Read/write speeds of up to 535MB/s/450MB/s (Based on internal testing; Performance may vary depending upon drive capacity, host device, OS and application.)','0e9a9f11-450c-485c-9796-ade9dc611d22-61U7T1koQqL._AC_SX679_.jpg',109,470,2.9,'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s'),(11,'electronics','3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.','762f7424-7925-4bef-b3cf-de5bf44ad71f-71kWymZ+c+L._AC_SX679_.jpg',109,319,4.8,'Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5'),(12,'electronics','Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer\'s limited warranty','3956c90d-a260-4065-bdeb-25013e392eb4-61mtL65D4cL._AC_SX679_.jpg',114,400,4.8,'WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive'),(13,'electronics','21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz','1825828c-40e4-48d2-b65f-b64c7b1949de-81QpkIctqPL._AC_SX679_.jpg',599,250,2.9,'Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin'),(14,'electronics','49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch screen side by side QUANTUM DOT (QLED) TECHNOLOGY, HDR support and factory calibration provides stunningly realistic and accurate color and contrast 144HZ HIGH REFRESH RATE and 1ms ultra fast response time work to eliminate motion blur, ghosting, and reduce input lag','450a0a4e-49cb-4397-add5-283df7f7ebb1-81Zt42ioCgL._AC_SX679_.jpg',999.99,140,2.2,'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED '),(15,'women\'s clothing','Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates','26e4568f-e9c2-4a7d-9219-f38264179fcd-51Y5NI-I5jL._AC_UX679_.jpg',56.99,235,2.6,'BIYLACLESEN Women\'s 3-in-1 Snowboard Jacket Winter Coats'),(16,'women\'s clothing','100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON','f7d07b6a-f3a2-44fc-b5e7-27916330bb29-81XH0e8fefL._AC_UY879_.jpg',29.95,340,2.9,'Lock and Love Women\'s Removable Hooded Faux Leather Moto Biker Jacket'),(17,'women\'s clothing','Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn\'t overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look.','1df7e01c-718b-4155-9e33-116c38df9ce5-71HblAHs5xL._AC_UY879_-2.jpg',39.99,679,3.8,'Rain Jacket Women Windbreaker Striped Climbing Raincoats'),(18,'women\'s clothing','95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem','e2515379-625d-4a18-b010-99e52e11bcb5-71z3kpMAYsL._AC_UY879_.jpg',9.85,130,4.7,'MBJ Women\'s Solid Short Sleeve Boat Neck V '),(19,'women\'s clothing','100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort','69b2f3ff-cc3f-4f19-8a1a-2af84f81dede-51eg55uWmdL._AC_UX679_.jpg',7.95,146,4.5,'Opna Women\'s Short Sleeve Moisture'),(20,'women\'s clothing','95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.','dc77672d-9021-4eb0-af13-32b7f847d577-61pHAEJ4NML._AC_UX679_.jpg',12.99,145,3.6,'DANVOUY Womens T Shirt Casual Cotton Short');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 16:44:37
