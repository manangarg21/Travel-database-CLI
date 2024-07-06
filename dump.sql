-- MySQL dump 10.13  Distrib 8.1.0, for macos14.0 (arm64)
--
-- Host: localhost    Database: travel
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `ACCOMODATION_REVIEW`
--

DROP TABLE IF EXISTS `ACCOMODATION_REVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACCOMODATION_REVIEW` (
  `acc_rev_id` int NOT NULL,
  `review_id` int NOT NULL,
  `accommodation_id` int NOT NULL,
  PRIMARY KEY (`acc_rev_id`),
  KEY `accommodation_id` (`accommodation_id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `accomodation_review_ibfk_1` FOREIGN KEY (`accommodation_id`) REFERENCES `ACCOMODATIONS` (`accommodation_id`),
  CONSTRAINT `accomodation_review_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `REVIEWS` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCOMODATION_REVIEW`
--

LOCK TABLES `ACCOMODATION_REVIEW` WRITE;
/*!40000 ALTER TABLE `ACCOMODATION_REVIEW` DISABLE KEYS */;
INSERT INTO `ACCOMODATION_REVIEW` VALUES (3821,4351,1289),(3822,4352,1378);
/*!40000 ALTER TABLE `ACCOMODATION_REVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACCOMODATIONS`
--

DROP TABLE IF EXISTS `ACCOMODATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACCOMODATIONS` (
  `accommodation_id` int NOT NULL,
  `accommodation_name` varchar(255) NOT NULL,
  `type_of_accomodation` varchar(255) DEFAULT NULL,
  `location` int DEFAULT NULL,
  `is_massage_provided` varchar(5) DEFAULT NULL,
  `is_buffet_provided` varchar(5) DEFAULT NULL,
  `is_swimming_pool_present` varchar(5) DEFAULT NULL,
  `AC_rooms_provided` varchar(5) DEFAULT NULL,
  `extra_services` varchar(255) DEFAULT NULL,
  `cost` int DEFAULT NULL,
  PRIMARY KEY (`accommodation_id`),
  KEY `fk_location_reference` (`location`),
  CONSTRAINT `fk_location_reference` FOREIGN KEY (`location`) REFERENCES `TRAVEL_DESTINATIONS` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCOMODATIONS`
--

LOCK TABLES `ACCOMODATIONS` WRITE;
/*!40000 ALTER TABLE `ACCOMODATIONS` DISABLE KEYS */;
INSERT INTO `ACCOMODATIONS` VALUES (1239,'Switzerland1Hotel','Type2',1987,'No','Yes','No','No','Museum',2000),(1249,'Ladakh1Hotel','Type1',9837,'Yes','No','No','No',NULL,900),(1289,'Paris1Hotel','Type1',1234,'Yes','Yes','No','Yes',NULL,1000),(1378,'Paris2Hotel','Type2',1234,'Yes','Yes','Yes','Yes','Sports',3000),(2348,'Kerala2Hotel','Type1',5678,'Yes','Yes','Yes','Yes','Horse Riding',6000),(2764,'Kerala1Hotel','Type1',5678,'Yes','Yes','Yes','Yes','Boat Riding',4000),(8726,'Uttarakhand1Hotel','Type3',6742,'Yes','No','No','No',NULL,700);
/*!40000 ALTER TABLE `ACCOMODATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACCOMODATIONS_IN_ITINERARY`
--

DROP TABLE IF EXISTS `ACCOMODATIONS_IN_ITINERARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACCOMODATIONS_IN_ITINERARY` (
  `itinerary_id` int NOT NULL,
  `accommodation_id` int NOT NULL,
  PRIMARY KEY (`itinerary_id`,`accommodation_id`),
  KEY `accommodation_id` (`accommodation_id`),
  CONSTRAINT `accomodations_in_itinerary_ibfk_1` FOREIGN KEY (`itinerary_id`) REFERENCES `TRAVEL_ITINERARY` (`itinerary_id`),
  CONSTRAINT `accomodations_in_itinerary_ibfk_2` FOREIGN KEY (`accommodation_id`) REFERENCES `ACCOMODATIONS` (`accommodation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCOMODATIONS_IN_ITINERARY`
--

LOCK TABLES `ACCOMODATIONS_IN_ITINERARY` WRITE;
/*!40000 ALTER TABLE `ACCOMODATIONS_IN_ITINERARY` DISABLE KEYS */;
INSERT INTO `ACCOMODATIONS_IN_ITINERARY` VALUES (5783,1239),(5784,1249),(5781,1289),(5782,2764),(5785,8726);
/*!40000 ALTER TABLE `ACCOMODATIONS_IN_ITINERARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUISINE_AT_DESTINATIONS`
--

DROP TABLE IF EXISTS `CUISINE_AT_DESTINATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUISINE_AT_DESTINATIONS` (
  `destination_id` int NOT NULL,
  `cuisine_types` varchar(255) NOT NULL,
  PRIMARY KEY (`destination_id`,`cuisine_types`),
  CONSTRAINT `cuisine_at_destinations_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `TRAVEL_DESTINATIONS` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUISINE_AT_DESTINATIONS`
--

LOCK TABLES `CUISINE_AT_DESTINATIONS` WRITE;
/*!40000 ALTER TABLE `CUISINE_AT_DESTINATIONS` DISABLE KEYS */;
INSERT INTO `CUISINE_AT_DESTINATIONS` VALUES (1234,'Chinese'),(1987,'Continental'),(5678,'Mughali'),(6742,'Mexican'),(9837,'Comfort');
/*!40000 ALTER TABLE `CUISINE_AT_DESTINATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUISINES`
--

DROP TABLE IF EXISTS `CUISINES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUISINES` (
  `cuisine_id` int NOT NULL,
  `cuisine_name` varchar(255) NOT NULL,
  `cuisine_desc` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`cuisine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUISINES`
--

LOCK TABLES `CUISINES` WRITE;
/*!40000 ALTER TABLE `CUISINES` DISABLE KEYS */;
INSERT INTO `CUISINES` VALUES (2341,'Continental','Continental description 1'),(2342,'Chinese','Chinese description 2'),(2343,'Mughali','Mughali description 3'),(2344,'Comfort','Comfort description 4'),(2345,'Mexican','Mexican description 5');
/*!40000 ALTER TABLE `CUISINES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DESTINATION_REVIEW`
--

DROP TABLE IF EXISTS `DESTINATION_REVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DESTINATION_REVIEW` (
  `dest_rev_id` int NOT NULL,
  `review_id` int NOT NULL,
  `destination_id` int NOT NULL,
  PRIMARY KEY (`dest_rev_id`),
  KEY `destination_id` (`destination_id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `destination_review_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `TRAVEL_DESTINATIONS` (`destination_id`),
  CONSTRAINT `destination_review_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `REVIEWS` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DESTINATION_REVIEW`
--

LOCK TABLES `DESTINATION_REVIEW` WRITE;
/*!40000 ALTER TABLE `DESTINATION_REVIEW` DISABLE KEYS */;
INSERT INTO `DESTINATION_REVIEW` VALUES (3825,4355,6742);
/*!40000 ALTER TABLE `DESTINATION_REVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DISHES_AT_LOCATION`
--

DROP TABLE IF EXISTS `DISHES_AT_LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DISHES_AT_LOCATION` (
  `dish_id` int NOT NULL,
  `location` int NOT NULL,
  PRIMARY KEY (`dish_id`,`location`),
  KEY `location` (`location`),
  CONSTRAINT `dishes_at_location_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `FAMOUS_DISHES` (`dish_id`),
  CONSTRAINT `dishes_at_location_ibfk_2` FOREIGN KEY (`location`) REFERENCES `TRAVEL_DESTINATIONS` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DISHES_AT_LOCATION`
--

LOCK TABLES `DISHES_AT_LOCATION` WRITE;
/*!40000 ALTER TABLE `DISHES_AT_LOCATION` DISABLE KEYS */;
INSERT INTO `DISHES_AT_LOCATION` VALUES (7281,1234),(7283,1987),(7282,5678),(7285,6742),(7284,9837);
/*!40000 ALTER TABLE `DISHES_AT_LOCATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DISHES_AT_WHICH_RESTAURANT`
--

DROP TABLE IF EXISTS `DISHES_AT_WHICH_RESTAURANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DISHES_AT_WHICH_RESTAURANT` (
  `dish_id` int NOT NULL,
  `spice_level` varchar(255) DEFAULT NULL,
  `restaurant` varchar(255) NOT NULL,
  `cost` int DEFAULT NULL,
  `extra_info` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`dish_id`),
  CONSTRAINT `dishes_at_which_restaurant_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `FAMOUS_DISHES` (`dish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DISHES_AT_WHICH_RESTAURANT`
--

LOCK TABLES `DISHES_AT_WHICH_RESTAURANT` WRITE;
/*!40000 ALTER TABLE `DISHES_AT_WHICH_RESTAURANT` DISABLE KEYS */;
INSERT INTO `DISHES_AT_WHICH_RESTAURANT` VALUES (7281,'Low','Restaurant 1',2000,NULL),(7282,'Low','Restaurant 2',3000,NULL),(7283,'High','Restaurant 3',4000,NULL),(7284,'Moderate','Restaurant 4',5000,'Gluten Free'),(7285,'Low','Restaurant 5',8000,'Gluten Free');
/*!40000 ALTER TABLE `DISHES_AT_WHICH_RESTAURANT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DISHES_IN_ITINERARY`
--

DROP TABLE IF EXISTS `DISHES_IN_ITINERARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DISHES_IN_ITINERARY` (
  `itinerary_id` int NOT NULL,
  `dish_id` int NOT NULL,
  PRIMARY KEY (`itinerary_id`,`dish_id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `dishes_in_itinerary_ibfk_1` FOREIGN KEY (`itinerary_id`) REFERENCES `TRAVEL_ITINERARY` (`itinerary_id`),
  CONSTRAINT `dishes_in_itinerary_ibfk_2` FOREIGN KEY (`dish_id`) REFERENCES `FAMOUS_DISHES` (`dish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DISHES_IN_ITINERARY`
--

LOCK TABLES `DISHES_IN_ITINERARY` WRITE;
/*!40000 ALTER TABLE `DISHES_IN_ITINERARY` DISABLE KEYS */;
INSERT INTO `DISHES_IN_ITINERARY` VALUES (5781,7281),(5782,7282),(5783,7283),(5784,7284),(5785,7285);
/*!40000 ALTER TABLE `DISHES_IN_ITINERARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DISHES_IN_SEGMENT`
--

DROP TABLE IF EXISTS `DISHES_IN_SEGMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DISHES_IN_SEGMENT` (
  `segment_id` int NOT NULL,
  `dishes` varchar(255) NOT NULL,
  `cuisines_available` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`segment_id`),
  CONSTRAINT `dishes_in_segment_ibfk_1` FOREIGN KEY (`segment_id`) REFERENCES `SEGMENTS` (`segment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DISHES_IN_SEGMENT`
--

LOCK TABLES `DISHES_IN_SEGMENT` WRITE;
/*!40000 ALTER TABLE `DISHES_IN_SEGMENT` DISABLE KEYS */;
INSERT INTO `DISHES_IN_SEGMENT` VALUES (4561,'7281','Continental'),(4562,'7282','Chinese'),(4563,'7283','Mughali'),(4564,'7283','Comfort'),(4565,'7285','Mexican');
/*!40000 ALTER TABLE `DISHES_IN_SEGMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXPERIENCE_REVIEW`
--

DROP TABLE IF EXISTS `EXPERIENCE_REVIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EXPERIENCE_REVIEW` (
  `exp_rev_id` int NOT NULL,
  `review_id` int NOT NULL,
  `experience_id` int NOT NULL,
  PRIMARY KEY (`exp_rev_id`),
  KEY `experience_id` (`experience_id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `experience_review_ibfk_1` FOREIGN KEY (`experience_id`) REFERENCES `EXPERIENCES` (`experience_id`),
  CONSTRAINT `experience_review_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `REVIEWS` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXPERIENCE_REVIEW`
--

LOCK TABLES `EXPERIENCE_REVIEW` WRITE;
/*!40000 ALTER TABLE `EXPERIENCE_REVIEW` DISABLE KEYS */;
INSERT INTO `EXPERIENCE_REVIEW` VALUES (3823,4353,7641),(3824,4354,7644);
/*!40000 ALTER TABLE `EXPERIENCE_REVIEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXPERIENCES`
--

DROP TABLE IF EXISTS `EXPERIENCES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EXPERIENCES` (
  `experience_id` int NOT NULL,
  `destination_id` int NOT NULL,
  `experience_name` varchar(255) NOT NULL,
  `descriptions` varchar(1000) NOT NULL,
  PRIMARY KEY (`experience_id`),
  KEY `destination_id` (`destination_id`),
  CONSTRAINT `experiences_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `TRAVEL_DESTINATIONS` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXPERIENCES`
--

LOCK TABLES `EXPERIENCES` WRITE;
/*!40000 ALTER TABLE `EXPERIENCES` DISABLE KEYS */;
INSERT INTO `EXPERIENCES` VALUES (7641,1234,'Eiffel Tower','Tower of steel, landmark of Paris'),(7642,5678,'Karakoram','Backwaters can be toured with houseboats'),(7643,9837,'Nubra Valley','Cold Desert'),(7644,6742,'Mussoorie','Great Market and restaurants with down city view.'),(7645,1234,'Zurich','The capital city with flourishing trade and greenery.');
/*!40000 ALTER TABLE `EXPERIENCES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FAMOUS_DISHES`
--

DROP TABLE IF EXISTS `FAMOUS_DISHES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FAMOUS_DISHES` (
  `dish_id` int NOT NULL,
  `cuisine_id` int NOT NULL,
  `dish_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dish_id`),
  KEY `cuisine_id` (`cuisine_id`),
  CONSTRAINT `famous_dishes_ibfk_1` FOREIGN KEY (`cuisine_id`) REFERENCES `CUISINES` (`cuisine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FAMOUS_DISHES`
--

LOCK TABLES `FAMOUS_DISHES` WRITE;
/*!40000 ALTER TABLE `FAMOUS_DISHES` DISABLE KEYS */;
INSERT INTO `FAMOUS_DISHES` VALUES (7281,2341,'Stew'),(7282,2342,'Chicken Garlic Noodles'),(7283,2343,'Butter Chicken'),(7284,2344,'Maggi'),(7285,2345,'Taco');
/*!40000 ALTER TABLE `FAMOUS_DISHES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHOTOS`
--

DROP TABLE IF EXISTS `PHOTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PHOTOS` (
  `photo_id` int NOT NULL,
  `user_id` int NOT NULL,
  `destination_id` int NOT NULL,
  `photo` varchar(255) NOT NULL,
  `photo_type` varchar(255) NOT NULL,
  `photo_name` varchar(255) NOT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `user_id` (`user_id`),
  KEY `destination_id` (`destination_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `USER_DETAILS` (`user_id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`destination_id`) REFERENCES `TRAVEL_DESTINATIONS` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHOTOS`
--

LOCK TABLES `PHOTOS` WRITE;
/*!40000 ALTER TABLE `PHOTOS` DISABLE KEYS */;
INSERT INTO `PHOTOS` VALUES (9381,2022101103,1234,'paris1.png','Type1','Eiffel Tower'),(9382,2022101109,5678,'kerala1.png','Type2','Karakoram Backwaters'),(9383,2022101122,1987,'switzerland1.png','Type1','Titlis Mountains'),(9384,2022101124,9837,'ladakh1.png','Type3','Pangong Lake'),(9385,2022113008,6742,'uttarakhand1.png','Type1','Mussoorie');
/*!40000 ALTER TABLE `PHOTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RELATED_DESTINATIONS`
--

DROP TABLE IF EXISTS `RELATED_DESTINATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RELATED_DESTINATIONS` (
  `destination_id` int NOT NULL,
  `related_destination_id` int NOT NULL,
  PRIMARY KEY (`destination_id`,`related_destination_id`),
  KEY `related_destination_id` (`related_destination_id`),
  CONSTRAINT `related_destinations_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `TRAVEL_DESTINATIONS` (`destination_id`),
  CONSTRAINT `related_destinations_ibfk_2` FOREIGN KEY (`related_destination_id`) REFERENCES `TRAVEL_DESTINATIONS` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RELATED_DESTINATIONS`
--

LOCK TABLES `RELATED_DESTINATIONS` WRITE;
/*!40000 ALTER TABLE `RELATED_DESTINATIONS` DISABLE KEYS */;
INSERT INTO `RELATED_DESTINATIONS` VALUES (1987,1234),(5678,1234),(1234,1987),(9837,6742),(6742,9837);
/*!40000 ALTER TABLE `RELATED_DESTINATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVIEWS`
--

DROP TABLE IF EXISTS `REVIEWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REVIEWS` (
  `review_id` int NOT NULL,
  `user_id` int NOT NULL,
  `review_desc` varchar(1000) NOT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `USER_DETAILS` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVIEWS`
--

LOCK TABLES `REVIEWS` WRITE;
/*!40000 ALTER TABLE `REVIEWS` DISABLE KEYS */;
INSERT INTO `REVIEWS` VALUES (4351,2022101103,'Great Place 1',5),(4352,2022101109,'Great Place 3',5),(4353,2022101124,'Great Place 2',5),(4354,2022101122,'Great Place 4',5),(4355,2022113008,'Average Place 5',3);
/*!40000 ALTER TABLE `REVIEWS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEGMENT_IN_ITINERARY`
--

DROP TABLE IF EXISTS `SEGMENT_IN_ITINERARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SEGMENT_IN_ITINERARY` (
  `itinerary_id` int NOT NULL,
  `segment_id` int NOT NULL,
  PRIMARY KEY (`itinerary_id`,`segment_id`),
  KEY `segment_id` (`segment_id`),
  CONSTRAINT `segment_in_itinerary_ibfk_1` FOREIGN KEY (`itinerary_id`) REFERENCES `TRAVEL_ITINERARY` (`itinerary_id`),
  CONSTRAINT `segment_in_itinerary_ibfk_2` FOREIGN KEY (`segment_id`) REFERENCES `SEGMENTS` (`segment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEGMENT_IN_ITINERARY`
--

LOCK TABLES `SEGMENT_IN_ITINERARY` WRITE;
/*!40000 ALTER TABLE `SEGMENT_IN_ITINERARY` DISABLE KEYS */;
INSERT INTO `SEGMENT_IN_ITINERARY` VALUES (5781,4561),(5782,4562),(5783,4563),(5784,4564),(5785,4565);
/*!40000 ALTER TABLE `SEGMENT_IN_ITINERARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEGMENTS`
--

DROP TABLE IF EXISTS `SEGMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SEGMENTS` (
  `segment_id` int NOT NULL,
  `segment_name` varchar(255) NOT NULL,
  `origin` int NOT NULL,
  `destination` int NOT NULL,
  `mode_of_transport` int NOT NULL,
  `time_taken` varchar(255) NOT NULL,
  `cost` int NOT NULL,
  PRIMARY KEY (`segment_id`),
  KEY `origin` (`origin`),
  KEY `destination` (`destination`),
  KEY `mode_of_transport` (`mode_of_transport`),
  CONSTRAINT `segments_ibfk_1` FOREIGN KEY (`origin`) REFERENCES `TRAVEL_DESTINATIONS` (`destination_id`),
  CONSTRAINT `segments_ibfk_2` FOREIGN KEY (`destination`) REFERENCES `TRAVEL_DESTINATIONS` (`destination_id`),
  CONSTRAINT `segments_ibfk_3` FOREIGN KEY (`mode_of_transport`) REFERENCES `TRANSPORTATION` (`transportation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEGMENTS`
--

LOCK TABLES `SEGMENTS` WRITE;
/*!40000 ALTER TABLE `SEGMENTS` DISABLE KEYS */;
INSERT INTO `SEGMENTS` VALUES (4561,'Segment1',1234,1987,8925,'12 hrs',2000),(4562,'Segment2',5678,1234,8923,'14 hrs',3000),(4563,'Segment3',1987,1234,8922,'16 hrs',5000),(4564,'Segment1',9837,6742,8924,'18 hrs',7000),(4565,'Segment1',6742,9837,8921,'20 hrs',9000);
/*!40000 ALTER TABLE `SEGMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSPORTATION`
--

DROP TABLE IF EXISTS `TRANSPORTATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRANSPORTATION` (
  `transportation_id` int NOT NULL,
  `destination_id` int NOT NULL,
  `modes` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `schedules` varchar(255) NOT NULL,
  `cost` int NOT NULL,
  PRIMARY KEY (`transportation_id`),
  KEY `destination_id` (`destination_id`),
  CONSTRAINT `transportation_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `TRAVEL_DESTINATIONS` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSPORTATION`
--

LOCK TABLES `TRANSPORTATION` WRITE;
/*!40000 ALTER TABLE `TRANSPORTATION` DISABLE KEYS */;
INSERT INTO `TRANSPORTATION` VALUES (8921,6742,'Bus','Route1-Uttarakhand','09:00 hrs to 19:00 hrs',250),(8922,1987,'Bat Mobile','Route2-Switzerland','09:00 hrs to 23:00 hrs',100000),(8923,5678,'Mini Van','Route3-Kerala','09:00 hrs to 21:00 hrs',450),(8924,9837,'Sedan','Route4-Ladakh','09:00 hrs to 19:00 hrs',600),(8925,1234,'Ferari','Route5-Paris','08:00 hrs to 02:00 hrs',80000);
/*!40000 ALTER TABLE `TRANSPORTATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAVEL_DESTINATIONS`
--

DROP TABLE IF EXISTS `TRAVEL_DESTINATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRAVEL_DESTINATIONS` (
  `destination_id` int NOT NULL,
  `destination_name` varchar(255) NOT NULL,
  `descriptions` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAVEL_DESTINATIONS`
--

LOCK TABLES `TRAVEL_DESTINATIONS` WRITE;
/*!40000 ALTER TABLE `TRAVEL_DESTINATIONS` DISABLE KEYS */;
INSERT INTO `TRAVEL_DESTINATIONS` VALUES (1234,'Paris','City of Love and Food: You’ll find the best cuisine of the world here along the banks of the romantic river Siène.','paris1.png'),(1987,'Switzerland','Nose of Europe: You’ll find here the highest snowy peaks of Europe, with the best ski resorts, and hot chocolate.','switzerland1.png'),(5678,'Kerala','State of Backwaters and Coffee: You’ll find the best backwaters in India here meanwhile you enjoy your coconut water in the best eco-friendly accommodation provided.','kerala1.png'),(6742,'Uttarakhand','City of Gods: If you want to get some spiritual enlightenment, then the serenity of Himalayas in Uttarakhand, and the eco-friendly dharmshalas is the place for you.','uttarakhand1.png'),(9837,'Ladakh','Cold Desert of India: Here you’ll get to experience a blend of cuisines, and cultures, and tourists everywhere. The mountain peaks and camel rides in the desert are the main attraction points.','ladakh1.png');
/*!40000 ALTER TABLE `TRAVEL_DESTINATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAVEL_DETAILS`
--

DROP TABLE IF EXISTS `TRAVEL_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRAVEL_DETAILS` (
  `user_id` int NOT NULL,
  `dish_id` int NOT NULL,
  `segment_id` int NOT NULL,
  `accommodation_id` int NOT NULL,
  `itinerary_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`dish_id`,`segment_id`,`accommodation_id`,`itinerary_id`),
  KEY `dish_id` (`dish_id`),
  KEY `segment_id` (`segment_id`),
  KEY `itinerary_id` (`itinerary_id`),
  KEY `accommodation_id` (`accommodation_id`),
  CONSTRAINT `travel_details_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `FAMOUS_DISHES` (`dish_id`),
  CONSTRAINT `travel_details_ibfk_2` FOREIGN KEY (`segment_id`) REFERENCES `SEGMENTS` (`segment_id`),
  CONSTRAINT `travel_details_ibfk_3` FOREIGN KEY (`itinerary_id`) REFERENCES `TRAVEL_ITINERARY` (`itinerary_id`),
  CONSTRAINT `travel_details_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `USER_DETAILS` (`user_id`),
  CONSTRAINT `travel_details_ibfk_5` FOREIGN KEY (`accommodation_id`) REFERENCES `ACCOMODATIONS` (`accommodation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAVEL_DETAILS`
--

LOCK TABLES `TRAVEL_DETAILS` WRITE;
/*!40000 ALTER TABLE `TRAVEL_DETAILS` DISABLE KEYS */;
INSERT INTO `TRAVEL_DETAILS` VALUES (2022101103,7281,4561,1289,5781),(2022101109,7282,4562,2764,5782),(2022101122,7283,4563,1239,5783),(2022101124,7284,4564,1249,5784),(2022113008,7285,4565,8726,5785);
/*!40000 ALTER TABLE `TRAVEL_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAVEL_ITINERARY`
--

DROP TABLE IF EXISTS `TRAVEL_ITINERARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRAVEL_ITINERARY` (
  `itinerary_id` int NOT NULL,
  `itinerary_name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `cost` int NOT NULL,
  PRIMARY KEY (`itinerary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAVEL_ITINERARY`
--

LOCK TABLES `TRAVEL_ITINERARY` WRITE;
/*!40000 ALTER TABLE `TRAVEL_ITINERARY` DISABLE KEYS */;
INSERT INTO `TRAVEL_ITINERARY` VALUES (5781,'Itinerary-1','2024-04-02','2024-04-24',6000),(5782,'Itinerary-2','2024-03-02','2024-03-14',9000),(5783,'Itinerary-3','2024-09-01','2024-09-21',7000),(5784,'Itinerary-4','2024-04-02','2024-04-24',9000),(5785,'Itinerary-5','2023-12-02','2023-12-29',8000);
/*!40000 ALTER TABLE `TRAVEL_ITINERARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_DETAILS`
--

DROP TABLE IF EXISTS `USER_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_DETAILS` (
  `user_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Date_change_pass` date DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_DETAILS`
--

LOCK TABLES `USER_DETAILS` WRITE;
/*!40000 ALTER TABLE `USER_DETAILS` DISABLE KEYS */;
INSERT INTO `USER_DETAILS` VALUES (2022101103,'aanvik26','aanvik.bhatnagar@students.iiit.ac.in','abcdefg','2004-09-26','2023-10-23',19),(2022101109,'manan21','manan.garg@students.iiit.ac.in','hijklmno','2004-07-21','2022-12-22',19),(2022101122,'fantasticChacha123','karan.nirjhawan@students.iiit.ac.in','karan1234','2003-11-14','2022-08-14',20),(2022101124,'kassi6969','harshit.gupta@students.iiit.ac.in','pqrstuv','2005-04-16','2023-10-23',18),(2022113008,'prati007','pratishtha.saxena@research.iiit.ac.in','qwoidonf','2002-12-03','2022-10-23',21);
/*!40000 ALTER TABLE `USER_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS_INTERESTED_IN_ITINERARY`
--

DROP TABLE IF EXISTS `USERS_INTERESTED_IN_ITINERARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERS_INTERESTED_IN_ITINERARY` (
  `itinerary_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`itinerary_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_interested_in_itinerary_ibfk_1` FOREIGN KEY (`itinerary_id`) REFERENCES `TRAVEL_ITINERARY` (`itinerary_id`),
  CONSTRAINT `users_interested_in_itinerary_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `USER_DETAILS` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS_INTERESTED_IN_ITINERARY`
--

LOCK TABLES `USERS_INTERESTED_IN_ITINERARY` WRITE;
/*!40000 ALTER TABLE `USERS_INTERESTED_IN_ITINERARY` DISABLE KEYS */;
INSERT INTO `USERS_INTERESTED_IN_ITINERARY` VALUES (5781,2022101103),(5782,2022101109),(5783,2022101122),(5784,2022101124),(5785,2022113008);
/*!40000 ALTER TABLE `USERS_INTERESTED_IN_ITINERARY` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-02 13:06:23
