CREATE DATABASE  IF NOT EXISTS `Costco` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Costco`;
-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Costco
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Temporary view structure for view `above_average_salaries`
--

DROP TABLE IF EXISTS `above_average_salaries`;
/*!50001 DROP VIEW IF EXISTS `above_average_salaries`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `above_average_salaries` AS SELECT 
 1 AS `employee_id`,
 1 AS `store_id`,
 1 AS `department_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Accounting`
--

DROP TABLE IF EXISTS `Accounting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounting` (
  `accounting_number` int NOT NULL,
  `employee_id` int NOT NULL,
  `salary` varchar(45) DEFAULT NULL,
  `bonuses` varchar(45) DEFAULT NULL,
  `paid_date` datetime NOT NULL,
  `paid_amount` varchar(45) NOT NULL,
  `method_of_payment` varchar(45) DEFAULT NULL,
  `over_time_pay` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`accounting_number`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounting`
--

LOCK TABLES `Accounting` WRITE;
/*!40000 ALTER TABLE `Accounting` DISABLE KEYS */;
INSERT INTO `Accounting` VALUES (1,1,'13','2500','2020-05-05 00:00:00','834','Check','76.9'),(2,2,'13.75','1900','2019-09-11 00:00:00','920.75','',''),(3,3,'13','2200','2018-12-12 00:00:00','580.23','Direct Deposit',''),(4,4,'13','2100','2020-01-12 00:00:00','730.53','','90.35'),(5,5,'13.25','2500','2020-02-10 00:00:00','630.9','Check',''),(6,6,'21.75','4000','2020-01-12 00:00:00','1740.45','Direct Deposit','238.5'),(7,7,'21','4050','2020-03-20 00:00:00','1900.45','Direct Deposit','178.40'),(8,8,'27.5','4500','2020-08-10 00:00:00','2400.59','Direct Deposit',''),(9,9,'13.5','2500','2019-10-18 00:00:00','890.45','','54.28'),(10,10,'13','','2020-04-10 00:00:00','580.23','Direct Deposit',''),(11,11,'15.5','2500','2020-05-10 00:00:00','940.56','Check',''),(12,12,'13','','2020-01-12 00:00:00','730.53','',''),(13,13,'13','','2020-04-10 00:00:00','650.53','Check','73.90'),(14,14,'15','2700','2020-01-12 00:00:00','1029.88','','65.73'),(15,15,'15','','2020-01-12 00:00:00','1238.90','Direct Deposit','');
/*!40000 ALTER TABLE `Accounting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departments`
--

DROP TABLE IF EXISTS `Departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departments` (
  `department_id` int NOT NULL,
  `department_name` varchar(45) NOT NULL,
  `department_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departments`
--

LOCK TABLES `Departments` WRITE;
/*!40000 ALTER TABLE `Departments` DISABLE KEYS */;
INSERT INTO `Departments` VALUES (1,'Appliances','Equipment to perform domestic tasks'),(2,'Clothing, Luggage & handbags','Garments and accessories for variety of events and weather'),(3,'Computers','Computer devices'),(4,'Electronics','Variety of technological devices'),(5,'Floral & Gift Baskets','Bouquets and gift assortments for variety of events'),(6,'Furntiture','Units used for lounging and sleeping'),(7,'Giftcards & Tickets','Vouchers of money or entrance passes'),(8,'Gourmet Foods','Fine dining food'),(9,'Grocery & Household','Items of food'),(10,'Essentials & Pet','Animal care supplies'),(11,'Health & Personal Care','Human care supplies'),(12,'Home & Installation Services','Appliance installation services'),(13,'Home & Kitchen','Cuttery, decor, and cleaning devices'),(14,'Home Improvement','Tools, hardware, storage, and outdoor equipment'),(15,'Jewelry, Watches & Sunglasses','Accessories'),(16,'Mattresses','Sleeping tools'),(17,'Office Products','Products for the office'),(18,'Patio, Lawn, and Garden','Outdoor tools'),(19,'Sports and Fitness','Sport and exercise equipment'),(20,'Tires and Auto','Automobile services and tools'),(21,'Toys and Books','Play things and reading material');
/*!40000 ALTER TABLE `Departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `employee_id` int NOT NULL,
  `store_id` int NOT NULL,
  `department_id` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `street_name` varchar(45) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `store_id_idx` (`store_id`),
  KEY `department_id_idx` (`department_id`),
  CONSTRAINT `department_id` FOREIGN KEY (`department_id`) REFERENCES `Departments` (`department_id`),
  CONSTRAINT `store_id` FOREIGN KEY (`store_id`) REFERENCES `Location` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (1,1,1,'Jonghyeong','Kim','1234 College rd','College Park','MD',20740),(2,2,2,'Dagmawit','Asfaw','2233 baltimore rd','College Park','MD',20740),(3,3,3,'Dana','Awad','9101 Autoville Dr apt 12','College Park','MD',20740),(4,4,4,'Mia','Garcia','33 Maryland Ave','Rockville','MD',20850),(5,5,5,'Muhammad Waleed','Akram','410 S Maple Ave','Falls Church','VA',22046),(6,6,6,'Jamie','Foxx','8224 Highham Rd','Lorton','VA',22079),(7,7,7,'Hesea','Jack','1241 W St NE','Washington','DC',20018),(8,8,8,'Joe','Smith','6411 Riggs Rd','Hyattsville','MD',20781),(9,9,9,'Randy','Bakeman','891-D Rockville Pike','Rockville','MD',20851),(10,10,10,'Tom','Hanks','6209 Erman Ct','Burke','VA',22015),(11,11,11,'Cate','Blanchett','7907 Trotters Ct','Severn','MD',21144),(12,12,12,'Jordie','Pue','5908 Plata St','Clinton','MD',20735),(13,13,13,'Joe','Mama','9012 Triple Ridge Rd','Fairfax Station','VA',22039),(14,14,14,'Kirsty','Wall','6716 Parsons Ave','Baltimore','MD',21215),(15,15,15,'Ashley','Connor','2713 Wrexham Ct','Herndon','VA',20171);
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `highest_department_sales`
--

DROP TABLE IF EXISTS `highest_department_sales`;
/*!50001 DROP VIEW IF EXISTS `highest_department_sales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `highest_department_sales` AS SELECT 
 1 AS `Highest Sold`,
 1 AS `department_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `highest_paid_employees`
--

DROP TABLE IF EXISTS `highest_paid_employees`;
/*!50001 DROP VIEW IF EXISTS `highest_paid_employees`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `highest_paid_employees` AS SELECT 
 1 AS `employee_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inventory` (
  `inventory_id` int NOT NULL,
  `department_id` int NOT NULL,
  `store_id` int NOT NULL,
  `brand_name` varchar(45) DEFAULT NULL,
  `item_names` varchar(150) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `fk_Inventory_Departments1_idx` (`department_id`),
  KEY `fk_Inventory_Location1_idx` (`store_id`),
  CONSTRAINT `fk_Inventory_Departments1` FOREIGN KEY (`department_id`) REFERENCES `Departments` (`department_id`),
  CONSTRAINT `fk_Inventory_Location1` FOREIGN KEY (`store_id`) REFERENCES `Location` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES (1,1,5,'Samsung','2.1 cu. ft. Over-the-Range Microwave with Sensor Cook',15),(2,2,7,'Calvin Klein','32 Degrees Ladies\' Hooded Stretch Jacket',30),(3,3,2,'Apple','New MacBook Air 13.3\" with Touch Bar - 10th Gen Intel Core i5 - 16GB Memory - 256 GB SSD - Silver\"',10),(4,4,4,'AvertX','4K Add-on Bullet Security Cameras, 2 pack',12),(5,5,1,'Dilettante','Chocolates The Gift of Chocolate Tower',20),(6,6,9,'La-Z-Boy','Laurel Sofa',4),(7,7,15,'Amazon','$ 100 eGift Card',15),(8,8,3,'Rastelli\'s','Antibiotic-Free Spiral Ham Holday Meal, Serves 12-16',10),(9,9,8,'Kirkland','Kirkland Signature 12-piece Hard Anodized Cookware Set',25),(10,10,12,'Chewmasters','Chewmasters Freeze Dried Beef Liver Bites, 17.6 oz, 2-count',23),(11,11,10,'Dove','Dove Deep Moisture Bodywash, 24 oz, 3-pack',70),(12,12,6,'Cosentino','Cosentino Consultation',65),(13,13,11,'SmartSilk','SmartSilk Silk Filled Comforter',30),(14,14,14,'DeWalt','Flexvolt 2 Tool Kit with Tough System',48),(15,15,13,'Citizen','Eco-Drive Axiom Stainless Steel Ladies Quartz Watch',35);
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `store_id` int NOT NULL,
  `street_name` varchar(45) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zipcode` int DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,'10925 Baltimore Ave','Beltsville','MD',20705),(2,'7077 Arundel Mills Cir','Hanover','MD',21076),(3,'11160 Veirs Mill Rd','Wheaton','MD',20902),(4,'880 Russell Ave','Gaithersburg','MD',20879),(5,'4725 West Ox Rd,','Fairfax','VA',22030),(6,'14390 Chantilly Crossing Ln','Chantilly','VA',20151),(7,'1200 S Fern St','Washington','DC',20018),(8,'6675 Marie Curie Dr','Elkridge','MD',21075),(9,'2700 Potomac Mills Cir','Woodbridge','VA',22192),(10,'7373 Boston Blvd','Springfield','VA',22153),(11,'575 E Ordnance Rd','Glen Burnie','MD',21060),(12,'16006 Crain Hwy','Brandywine','MD',20613),(13,'2700 Potomac Mills Cir','Woodbridge','VA',22192),(14,'10270 Mill Run Cir','Owings Mills','MD',21117),(15,'1300 Edwards Ferry Rd NE','Leesburg','VA',20176);
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Membership`
--

DROP TABLE IF EXISTS `Membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Membership` (
  `membership_id` int NOT NULL,
  `store_id` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `street_name` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(2) NOT NULL,
  `zipcode` int NOT NULL,
  `type_of_membership` varchar(45) NOT NULL,
  PRIMARY KEY (`membership_id`),
  KEY `fk_Membership_Location1_idx` (`store_id`),
  CONSTRAINT `fk_Membership_Location1` FOREIGN KEY (`store_id`) REFERENCES `Location` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Membership`
--

LOCK TABLES `Membership` WRITE;
/*!40000 ALTER TABLE `Membership` DISABLE KEYS */;
INSERT INTO `Membership` VALUES (1,1,'John','Smith','701 Pine Street','College Park','MD',20750,'Executive'),(2,2,'Dee','Martin','3450 Lake Hill','Beltsville','MD',21070,'Gold'),(3,3,'Bryan','Gray','','','MD',20906,'Business'),(4,4,'Kevin','Sheperd','123 Main Street','Columbia','MD',20873,'Business'),(5,5,'Courtney','Phil','8390 Fifth Ave.','Norfolk','VA',22040,'Gold'),(6,6,'Jasmine','Lin','330 Third Street','Faifax','VA',20121,'Gold'),(7,7,'Jessica','Esquivel','','Georgetown','DC',20010,'Gold'),(8,8,'Ayereon','Butler','','','MD',21073,'Executive'),(9,9,'Yanet','Zegeye','289 Maple Street','Bethesda','MD',22185,'Executive'),(10,10,'Hermela','Samson','733 Oak Ave.','Norfolk','VA',22145,'Executive'),(11,11,'Lee','Clark','','','MD',21006,'Business'),(12,12,'Mark','Johnson','6729 Baltimore Ave.','College Park','MD',20631,'Business'),(13,13,'Liam','Bensen','','','VA',22129,'Gold'),(14,14,'Joseph','Phillips','673 Elm Street','College Park','MD',21173,'Business'),(15,15,'Wintana','Solomon','','Richmond','VA',20167,'Business'),(16,2,'Max','Jeff','4606 Davidson Dr','Chevy Chase','MD',20815,'Gold'),(17,4,'James','Allan','5005 Lyttonsville Street','Silver Spring','MD',20910,'Executive'),(18,3,'Christopher','Payne','10027 Pratt pl','Silver Spring','MD',20910,'Business'),(19,2,'Elizabeth','Roberts','733 Gazebo Ct','Silver Spring','MD',20904,'Gold'),(20,5,'Chloe','Willson','9100 Entomology Rd','Beltsville','MD',20705,'Executive'),(21,10,'Hannah','Miller','2339 Lanham Severn Rd','Lanham','MD',20706,'Gold'),(22,7,'Zoe','Davis','220 Suitland Rd','Suitland','MD',20746,'Gold'),(23,8,'Zane','Brown','67490 Camp Street','Rockville','MD',20750,'Executive'),(24,9,'Arya','Williams','8930 California Street Street','Laurel','MD',20750,'Business'),(25,10,'Sienna','Halpert','577 Bay Avenue','College Park','MD',20750,'Executive'),(26,10,'Doug','Johnson','309 Barn Street','Silver Spring','MD',20750,'Business'),(27,1,'Ismael','Glover','7365 Osakaloosa Dr','Derwood','MD',20855,'Gold'),(28,3,'Janiya','Reed','2040 Middlebridge Dr','Silver Spring','MD',20906,'Executive'),(29,4,'Marco','Newton','22500 Wims Rd','Clarksburg','MD',20871,'Business'),(30,9,'Kiersten','Rios','7818 Falling Leaves Ct','Elkridge','MD',21043,'Business'),(31,10,'Karley','Walters','5335 Duke St','Alexandria','VA',22304,'Gold'),(32,11,'Chanel','Cabrera','616 Tenth St','Laurel','MD',20707,'Executive'),(33,8,'Jace','Carson','8038 Pennington Dr','Laurel','MD',20724,'Business'),(34,4,'Keith','Winters','14035 Weeping Cherry Dr','Rockville','MD',20850,'Gold'),(35,5,'Donald','Curry','8316 Kay Ct','Annandale','VA',22003,'Business'),(36,9,'Haylie','Guerrero','5548 Island Creek Rd','Alexandria','VA',22315,'Business'),(37,8,'Deegan','Bonilla','10313 College Square Rd','Columbia','MD',21044,'Gold'),(38,7,'Felix','Weaver','820 First St Ne','Washinton','DC',20002,'Business'),(39,1,'Piper','Mckke','8633 Greenbelt Rd','Greenbelt','MD',20770,'Gold'),(40,5,'Casey','Lee','5921 Kara pl','Burke','VA',22015,'Gold'),(41,13,'Ronaldo','Hayes','13495 Minnieville Rd','Woodbridge','VA',22192,'Executive'),(42,15,'Jassica','Foley','11928 Appling Valley Rd','Fairfax','VA',22030,'Executive'),(43,14,'Miranda','Davis','6600 Eberie Dr','Baltimore','MD',21215,'Gold'),(44,15,'Miravan','Bolton','1429 Laurel Hill Rd','Vienna','VA',22182,'Business'),(45,13,'Andrew','Freeman','3492 Beechwood Ln','Triangle','VA',22172,'Business'),(46,12,'Marc','Herman','7901 Drum Point','Clinton','MD',20735,'Gold'),(47,11,'Martin','Jimmy','1303 Redmore Ct','Severn','MD',21144,'Gold'),(48,2,'Mitchell','Park','100 W Maple Rd','Heights','MD',21090,'Executive'),(49,10,'Andresa','Herrera','3660 Russell Rd','Woodbridge','VA',22192,'Business'),(50,11,'Nicole','Jung','2047 Orchard Ave','Jessup','MD',20794,'Gold');
/*!40000 ALTER TABLE `Membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `membership_number`
--

DROP TABLE IF EXISTS `membership_number`;
/*!50001 DROP VIEW IF EXISTS `membership_number`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `membership_number` AS SELECT 
 1 AS `store_id`,
 1 AS `location_address`,
 1 AS `num_gold_membership`,
 1 AS `num_business_membership`,
 1 AS `num_executive_membership`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Sales Movement`
--

DROP TABLE IF EXISTS `Sales Movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales Movement` (
  `sale_number` int NOT NULL,
  `department_id` int NOT NULL,
  `inventory_id` int NOT NULL,
  `sold_item` varchar(150) NOT NULL,
  `sold_quantity` int NOT NULL,
  `sold_date` datetime NOT NULL,
  PRIMARY KEY (`sale_number`),
  KEY `fk_Sales Movement_Departments1_idx` (`department_id`),
  CONSTRAINT `fk_Sales Movement_Departments1` FOREIGN KEY (`department_id`) REFERENCES `Departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales Movement`
--

LOCK TABLES `Sales Movement` WRITE;
/*!40000 ALTER TABLE `Sales Movement` DISABLE KEYS */;
INSERT INTO `Sales Movement` VALUES (1,1,1,'2.1 cu. ft. Over-the-Range Microwave with Sensor Cook',412,'2020-11-27 00:00:00'),(2,2,2,'32 Degrees Ladies\' Hooded Stretch Jacket',234,'2020-11-27 00:00:00'),(3,3,3,'New MacBook Air 13.3\" with Touch Bar - 10th Gen Intel Core i5 - 16GB Memory - 256 GB SSD - Silver\"',188,'2020-11-27 00:00:00'),(4,4,4,'4K Add-on Bullet Security Cameras, 2 pack',456,'2020-11-27 00:00:00'),(5,5,5,'Chocolates The Gift of Chocolate Tower',321,'2020-11-27 00:00:00'),(6,6,6,'Laurel Sofa',315,'2020-11-27 00:00:00'),(7,7,7,'$ 100 eGift Card',112,'2020-11-27 00:00:00'),(8,8,8,'Antibiotic-Free Spiral Ham Holday Meal, Serves 12-16',643,'2020-11-27 00:00:00'),(9,9,9,'Kirkland Signature 12-piece Hard Anodized Cookware Set',432,'2020-11-27 00:00:00'),(10,10,10,'Chewmasters Freeze Dried Beef Liver Bites, 17.6 oz, 2-count',723,'2020-11-27 00:00:00'),(11,11,11,'Dove Deep Moisture Bodywash, 24 oz, 3-pack',212,'2020-11-27 00:00:00'),(12,12,12,'Cosentino Consultation',102,'2020-11-27 00:00:00'),(13,13,13,'SmartSilk Silk Filled Comforter',546,'2020-11-27 00:00:00'),(14,14,14,'Flexvolt 2 Tool Kit with Tough System',643,'2020-11-27 00:00:00'),(15,15,15,'Eco-Drive Axiom Stainless Steel Ladies Quartz Watch',345,'2020-11-27 00:00:00');
/*!40000 ALTER TABLE `Sales Movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Title`
--

DROP TABLE IF EXISTS `Title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Title` (
  `title_number` int NOT NULL,
  `employee_id` int NOT NULL,
  `job_title` varchar(70) NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  PRIMARY KEY (`title_number`),
  KEY `employee_id_idx` (`employee_id`),
  CONSTRAINT `title_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Title`
--

LOCK TABLES `Title` WRITE;
/*!40000 ALTER TABLE `Title` DISABLE KEYS */;
INSERT INTO `Title` VALUES (1,1,'Baker','2019-11-20 00:00:00','2020-05-05 00:00:00'),(2,2,'Cake Decorator','2018-10-20 00:00:00','2019-09-11 00:00:00'),(3,3,'Cashier','2018-05-04 00:00:00','2018-12-12 00:00:00'),(4,4,'Customer Service Representative','2019-03-20 00:00:00','2020-12-07 00:00:00'),(5,5,'Cashier Assistant','2019-04-05 00:00:00','2020-02-10 00:00:00'),(6,6,'Costco Logistics MDO Unit Manager','2020-01-20 00:00:00','2020-10-02 00:00:00'),(7,7,'Pharmacy Technician','2019-05-07 00:00:00','2020-03-20 00:00:00'),(8,8,'Department Manager','2019-06-14 00:00:00','2020-08-10 00:00:00'),(9,9,'Photo Lab Assistant','2017-01-05 00:00:00','2019-10-18 00:00:00'),(10,10,'Stocker','2018-02-10 00:00:00','2020-04-10 00:00:00'),(11,11,'Bakery Wrapper','2018-04-18 00:00:00','2020-05-10 00:00:00'),(12,12,'Deli Assisntant','2019-07-10 00:00:00','2020-11-28 00:00:00'),(13,13,'Forklift Operator','2017-05-10 00:00:00','2020-04-10 00:00:00'),(14,14,'Truck Driver','2019-08-05 00:00:00','2020-12-07 00:00:00'),(15,15,'Membership Assistant','2020-01-14 00:00:00','2020-12-07 00:00:00');
/*!40000 ALTER TABLE `Title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `above_average_salaries`
--

/*!50001 DROP VIEW IF EXISTS `above_average_salaries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `above_average_salaries` AS select `employees`.`employee_id` AS `employee_id`,`location`.`store_id` AS `store_id`,`departments`.`department_id` AS `department_id`,`employees`.`first_name` AS `first_name`,`employees`.`last_name` AS `last_name`,`accounting`.`salary` AS `salary` from (((`employees` join `accounting` on((`accounting`.`employee_id` = `employees`.`employee_id`))) join `location` on((`employees`.`store_id` = `location`.`store_id`))) join `departments` on((`employees`.`department_id` = `departments`.`department_id`))) where (`accounting`.`salary` > (select avg(`accounting`.`salary`) from `accounting`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `highest_department_sales`
--

/*!50001 DROP VIEW IF EXISTS `highest_department_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `highest_department_sales` AS select max(`sales movement`.`sold_quantity`) AS `Highest Sold`,`sales movement`.`department_id` AS `department_id` from (`sales movement` join `inventory` on((`sales movement`.`department_id` = `inventory`.`department_id`))) where (`inventory`.`store_id` < 5) group by `sales movement`.`department_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `highest_paid_employees`
--

/*!50001 DROP VIEW IF EXISTS `highest_paid_employees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `highest_paid_employees` AS select `employees`.`employee_id` AS `employee_id`,`employees`.`first_name` AS `first_name`,`employees`.`last_name` AS `last_name`,`accounting`.`salary` AS `salary` from (`employees` join `accounting` on((`employees`.`employee_id` = `accounting`.`employee_id`))) where (`accounting`.`salary` >= 15) order by `accounting`.`salary` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `membership_number`
--

/*!50001 DROP VIEW IF EXISTS `membership_number`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `membership_number` AS with `gold` as (select `l1`.`store_id` AS `store_id`,count(`m1`.`type_of_membership`) AS `num_gold_membership` from (`location` `l1` join `membership` `m1` on((`l1`.`store_id` = `m1`.`store_id`))) where (`m1`.`type_of_membership` = 'Gold') group by `l1`.`store_id`), `business` as (select `l2`.`store_id` AS `store_id`,count(`m2`.`type_of_membership`) AS `num_business_membership` from (`location` `l2` join `membership` `m2` on((`l2`.`store_id` = `m2`.`store_id`))) where (`m2`.`type_of_membership` = 'Business') group by `l2`.`store_id`), `executive` as (select `l3`.`store_id` AS `store_id`,count(`m3`.`type_of_membership`) AS `num_executive_membership` from (`location` `l3` join `membership` `m3` on((`l3`.`store_id` = `m3`.`store_id`))) where (`m3`.`type_of_membership` = 'Executive') group by `l3`.`store_id`) select `l`.`store_id` AS `store_id`,concat(`l`.`street_name`,',',`l`.`city`,',',`l`.`state`,',',`l`.`zipcode`) AS `location_address`,`gold`.`num_gold_membership` AS `num_gold_membership`,`business`.`num_business_membership` AS `num_business_membership`,`executive`.`num_executive_membership` AS `num_executive_membership` from (((`location` `l` left join `gold` on((`gold`.`store_id` = `l`.`store_id`))) left join `business` on((`business`.`store_id` = `l`.`store_id`))) left join `executive` on((`executive`.`store_id` = `l`.`store_id`))) order by `executive`.`num_executive_membership` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-14 11:46:15
