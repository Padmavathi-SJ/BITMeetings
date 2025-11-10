-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: bit_meeting_test
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `accepted_members`
--

DROP TABLE IF EXISTS `accepted_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accepted_members` (
  `user_id` int NOT NULL,
  `meeting_id` int NOT NULL,
  `accepted_status` enum('accept','reject','joined') DEFAULT NULL,
  PRIMARY KEY (`user_id`,`meeting_id`),
  KEY `meeting_id` (`meeting_id`),
  CONSTRAINT `accepted_members_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accepted_members_ibfk_2` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accepted_members`
--

LOCK TABLES `accepted_members` WRITE;
/*!40000 ALTER TABLE `accepted_members` DISABLE KEYS */;
INSERT INTO `accepted_members` VALUES (1,226,'joined'),(2,223,'joined'),(2,224,'joined'),(2,227,'accept'),(2,233,'joined'),(2,234,'joined'),(2,235,'accept'),(2,236,'joined'),(4,222,'joined'),(5,226,'joined'),(8,227,'accept');
/*!40000 ALTER TABLE `accepted_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Board Meeting'),(2,'Project Meeting'),(3,'Team Meeting'),(4,'Client Meeting'),(5,'Business');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `rollno` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `batch` varchar(50) DEFAULT NULL,
  `sem` int DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `mentor_id` varchar(255) DEFAULT NULL,
  `program_code` varchar(10) DEFAULT NULL,
  `admission_year` year DEFAULT NULL,
  `graduation_year` year DEFAULT NULL,
  `category` enum('General','SC','ST','OBC') DEFAULT NULL,
  `current_semester` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idx_program` (`program_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'DEEPAK A','deepaka.ad24@bitsathy.ac.in','STU001','student','2nd Year','2024-2028',3,'Computer Science','7376242AL153',NULL,NULL,NULL,NULL,NULL),(2,'SELVAGANAPATHY P','selvaganapathyp.ad24@bitsathy.ac.in','7376242AD297','student','2nd Year','2024-2028',3,'Computer Science','7376242AL153',NULL,NULL,NULL,NULL,NULL),(3,'VEERENDRA C ','veerendrac.ad24@bitsathy.ac.in','7376242AD336','Admin','1st Year','2025-2029',1,'Computer Science','7376242AL153',NULL,NULL,NULL,NULL,NULL),(4,'MOHAMMED KALIF T','mohammedkalift.al24@bitsathy.ac.in','7376242AL153','faculty',NULL,'',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL),(5,'RAAHUL S','raahul.ec22@bitsathy.ac.in','7376242AD138','student','2nd Year','2024-2028',3,'Computer Science','7376242AL153',NULL,NULL,NULL,NULL,NULL),(6,'TRIDEV BALAJI R ','tridevbalaji.cs23@bitsathy.ac.in','7376242AD137','student','3rd Year','2023-2027',5,'Computer Science','7376242AL153',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_id` int NOT NULL,
  `meeting_name` varchar(255) NOT NULL,
  `meeting_description` text NOT NULL,
  `priority` varchar(255) NOT NULL,
  `venue_id` int NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `meeting_status` enum('not_started','in_progress','completed') NOT NULL DEFAULT 'not_started',
  `repeat_type` varchar(255) NOT NULL,
  `custom_days` int DEFAULT NULL,
  `next_schedule` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_created_by_foreign` (`created_by`),
  KEY `meeting_venue_id_foreign` (`venue_id`),
  KEY `meeting_template_id_foreign` (`template_id`),
  CONSTRAINT `meeting_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `meeting_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `meeting_venue_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting`
--

LOCK TABLES `meeting` WRITE;
/*!40000 ALTER TABLE `meeting` DISABLE KEYS */;
INSERT INTO `meeting` VALUES (201,43,'Meeting','Meeting Description	\n','high',1,'2025-04-23 12:00:00','2025-04-23 13:30:00',1,'in_progress','Daily',NULL,'2025-04-23'),(202,43,'Meeting','Meeting Description	\n','high',1,'2025-04-23 09:00:00','2025-04-23 10:00:00',1,'in_progress','Daily',NULL,'2025-04-23'),(203,43,'Meeting','Meeting Description	\n','high',2,'2025-04-28 12:00:00','2025-04-28 13:30:00',1,'in_progress','Daily',NULL,'2025-04-28'),(204,44,'Meeting Test','','high',1,'2025-05-01 09:00:00','2025-05-01 10:00:00',5,'in_progress','Month',NULL,'2025-05-01'),(205,45,'BOS Meeting','BOS Meeting','high',1,'2025-05-02 12:00:00','2025-05-02 13:30:00',7,'completed','Week',NULL,'2025-05-02'),(206,43,'Meeting','Meeting Description	\n','high',1,'2025-05-05 12:00:00','2025-05-05 13:30:00',7,'in_progress','Daily',NULL,'2025-05-05'),(207,43,'Meeting 2','Meeting Description	\n','high',1,'2025-05-05 09:00:00','2025-05-22 10:00:00',7,'in_progress','Daily',NULL,'2025-05-22'),(208,43,'Meeting','Meeting Description	\n','high',2,'2025-05-06 12:00:00','2025-05-06 13:30:00',7,'in_progress','Daily',NULL,'2025-05-06'),(209,43,'Meeting Test','Meeting Description	\n','high',1,'2025-05-17 12:00:00','2025-05-17 13:30:00',7,'in_progress','Daily',NULL,'2025-05-17'),(210,43,'Meeting','Meeting Description	\n','high',1,'2025-06-05 12:00:00','2025-06-05 13:30:00',1,'not_started','Daily',NULL,'2025-06-05'),(211,43,'Meeting','Meeting Description	\n','high',1,'2025-06-06 09:00:00','2025-06-06 09:30:00',1,'in_progress','Daily',NULL,'2025-06-06'),(212,43,'Meeting','Meeting Description	\n','high',1,'2025-07-28 09:00:00','2025-07-28 12:00:00',1,'not_started','Daily',NULL,'2025-07-28'),(213,46,'Meeting Title','Description','high',2,'2025-07-28 12:00:00','2025-07-28 13:30:00',1,'in_progress','Daily',NULL,'2025-07-28'),(214,47,'Meeting Name','Description','high',2,'2025-07-30 12:00:00','2025-07-30 13:30:00',1,'in_progress','Week',NULL,'2025-07-30'),(215,44,'Meeting Test','','high',1,'2025-08-06 09:00:00','2025-08-06 10:00:00',1,'not_started','Month',NULL,'2025-08-06'),(216,43,'Meeting','Meeting Description	\n','high',1,'2025-08-04 12:00:00','2025-08-04 13:30:00',1,'not_started','Daily',NULL,'2025-08-04'),(217,43,'Meeting','Meeting Description	\n','high',1,'2025-08-04 12:00:00','2025-08-04 13:30:00',1,'not_started','Daily',NULL,'2025-08-04'),(218,45,'BOS Meeting','BOS Meeting','high',1,'2025-08-05 12:00:00','2025-08-05 13:30:00',3,'not_started','Week',NULL,'2025-08-05'),(219,48,'Title','Description','high',2,'2025-09-15 12:00:00','2025-09-15 13:30:00',6,'not_started','Week',NULL,'2025-09-15'),(220,49,'Template Title','Template Description','medium',1,'2025-09-17 12:00:00','2025-09-17 13:30:00',4,'not_started','Week',NULL,'2025-09-16'),(221,49,'Template Title','Template Description','medium',1,'2025-09-15 12:00:00','2025-09-15 13:30:00',4,'not_started','Week',NULL,'2025-09-15'),(222,48,'Title','Description','high',1,'2025-09-18 09:00:00','2025-09-18 09:30:00',1,'not_started','Week',NULL,'2025-09-17'),(223,43,'Meeting','Meeting Description	\n','high',1,'2025-09-19 12:00:00','2025-09-19 13:30:00',4,'in_progress','Daily',NULL,'2025-09-19'),(224,43,'Meeting','Meeting Description	\n','high',2,'2025-09-20 09:00:00','2025-09-20 10:00:00',4,'in_progress','Daily',NULL,'2025-09-20'),(225,43,'Meeting','Meeting Description	\n','high',1,'2025-09-20 09:00:00','2025-09-20 10:00:00',2,'not_started','Daily',NULL,'2025-09-20'),(226,45,'BOS Meeting','BOS Meeting','high',1,'2025-09-20 12:00:00','2025-09-20 13:30:00',2,'in_progress','Week',NULL,'2025-09-20'),(227,43,'Meeting','Meeting Description	\n','high',1,'2025-09-24 12:00:00','2025-09-24 13:30:00',1,'not_started','Daily',NULL,'2025-09-23'),(228,43,'Meeting','Meeting Description	\n','high',1,'2025-09-22 12:00:00','2025-09-22 13:30:00',1,'not_started','Daily',NULL,'2025-09-22'),(233,43,'Meeting','Meeting Description	\n','high',1,'2025-10-24 12:00:00','2025-10-24 13:30:00',1,'in_progress','Daily',NULL,'2025-10-23'),(234,43,'Meeting','Meeting Description	\n','high',1,'2025-10-22 12:00:00','2025-10-22 13:30:00',1,'in_progress','Daily',NULL,'2025-10-22'),(235,43,'Meeting','Meeting Description	\n','high',1,'2025-10-22 12:00:00','2025-10-22 13:30:00',1,'not_started','Daily',NULL,'2025-10-22'),(236,43,'Meeting','Meeting Description	\n','high',1,'2025-10-22 12:00:00','2025-10-22 13:30:00',1,'in_progress','Daily',NULL,'2025-10-22');
/*!40000 ALTER TABLE `meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_attendence`
--

DROP TABLE IF EXISTS `meeting_attendence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_attendence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meeting_id` int NOT NULL,
  `user_id` int NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_attendence_user_id_foreign` (`user_id`),
  KEY `meeting_attendence_meeting_id_foreign` (`meeting_id`),
  CONSTRAINT `meeting_attendence_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meeting_attendence_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_attendence`
--

LOCK TABLES `meeting_attendence` WRITE;
/*!40000 ALTER TABLE `meeting_attendence` DISABLE KEYS */;
INSERT INTO `meeting_attendence` VALUES (81,204,2,'Team Head','Tridev Balaji Ravi'),(82,204,3,'Team Member','Test'),(84,205,5,'Head of Department','Bob Smith'),(85,209,2,'Role 1','Tridev Balaji Ravi'),(86,209,4,'Role 1','Alice Johnson'),(87,213,2,'Role 1','Tridev Balaji Ravi'),(88,214,5,'Test Role 1','Bob Smith'),(89,214,8,'Test Role 1','Eve Adams'),(90,220,1,'Role','Balaji'),(91,220,2,'Role','Tridev Balaji Ravi');
/*!40000 ALTER TABLE `meeting_attendence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_history`
--

DROP TABLE IF EXISTS `meeting_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meeting_id` int NOT NULL,
  `schedule_date` date NOT NULL,
  `status` enum('scheduled','canceled','completed') NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `meeting_id` (`meeting_id`),
  CONSTRAINT `meeting_history_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_history`
--

LOCK TABLES `meeting_history` WRITE;
/*!40000 ALTER TABLE `meeting_history` DISABLE KEYS */;
INSERT INTO `meeting_history` VALUES (37,220,'2025-09-16','scheduled','2025-09-15 05:11:00'),(38,222,'2025-09-17','scheduled','2025-09-16 05:19:00'),(39,227,'2025-09-23','scheduled','2025-09-22 06:38:00'),(42,233,'2025-10-23','scheduled','2025-10-22 06:38:00');
/*!40000 ALTER TABLE `meeting_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_members`
--

DROP TABLE IF EXISTS `meeting_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meeting_id` int DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_id` (`meeting_id`),
  KEY `member_id` (`user_id`),
  CONSTRAINT `meeting_members_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meeting_members_member_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=615 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_members`
--

LOCK TABLES `meeting_members` WRITE;
/*!40000 ALTER TABLE `meeting_members` DISABLE KEYS */;
INSERT INTO `meeting_members` VALUES (524,201,'Role 1',2),(525,202,'Role 1',2),(526,203,'Role 1',2),(527,204,'Team Head',2),(528,204,'Team Member',6),(529,204,'Team Member',3),(530,205,'Chairman',1),(531,205,'Head of Department',5),(532,206,'Role 1',2),(533,207,'Role 1',4),(534,207,'Role 1',2),(535,207,'Role 2',8),(536,208,'Role 1',4),(537,208,'Role 2',8),(538,208,'Role 1',2),(539,209,'Role 1',4),(540,209,'Role 2',8),(541,209,'Role 1',2),(542,210,'role 3',3),(543,210,'Role 1',2),(544,210,'Role 2',8),(545,210,'Role 1',4),(546,210,'role 4',6),(547,211,'Role 1',4),(548,211,'Role 1',2),(549,211,'Role 2',8),(550,212,'Role 2',8),(551,212,'Role 1',2),(552,212,'Role 1',4),(553,213,'Role 1',2),(554,213,'Role 1',4),(555,213,'Role 2',6),(556,214,'Test Role 1',8),(557,214,'Test Role 1',5),(558,215,'Team Member',6),(559,215,'Team Head',2),(560,215,'Team Member',3),(561,216,'Role 1',2),(562,216,'Role 1',4),(563,216,'Role 2',8),(564,217,'Role 1',4),(565,217,'Role 1',2),(566,217,'Role 2',8),(567,218,'Chairman',8),(568,219,'Head',8),(569,219,'Head',4),(570,219,'Staff',5),(571,220,'Role',2),(572,220,'Role',1),(573,221,'Role',1),(574,221,'Role',2),(575,222,'Head',8),(576,222,'Head',4),(577,222,'Staff',5),(578,223,'Role 1',2),(579,223,'Role 1',4),(580,223,'Role 2',8),(581,224,'Role 1',2),(582,224,'Role 1',4),(583,224,'Role 2',8),(584,225,'Role 2',8),(585,225,'Role 1',2),(586,225,'Role 1',4),(587,226,'Chairman',1),(588,226,'Head of Department',5),(589,227,'Role 1',4),(590,227,'Role 2',8),(591,227,'Role 1',2),(592,228,'Role 1',4),(593,228,'Role 1',2),(594,228,'Role 2',8),(603,233,'Role 1',4),(604,233,'Role 1',2),(605,233,'Role 2',8),(606,234,'Role 1',2),(607,234,'Role 1',4),(608,234,'Role 2',8),(609,235,'Role 1',4),(610,236,'Role 1',4),(611,236,'Role 1',2),(612,236,'Role 2',8),(613,235,'Role 1',2),(614,235,'Role 2',8);
/*!40000 ALTER TABLE `meeting_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_members_old`
--

DROP TABLE IF EXISTS `meeting_members_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_members_old` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meeting_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_members_meeting_id_foreign` (`meeting_id`),
  CONSTRAINT `meeting_members_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_members_old`
--

LOCK TABLES `meeting_members_old` WRITE;
/*!40000 ALTER TABLE `meeting_members_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_members_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_point_future`
--

DROP TABLE IF EXISTS `meeting_point_future`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_point_future` (
  `id` int NOT NULL AUTO_INCREMENT,
  `point_id` int DEFAULT NULL,
  `current_meeting_id` int DEFAULT NULL,
  `next_meeting_id` int DEFAULT NULL,
  `template_id` int DEFAULT NULL,
  `forward_type` enum('NIL','NEXT','SPECIFIC_MEETING') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forward_decision` enum('AGREE','DISAGREE','FORWARD') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT '0',
  `forwarded_decision` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT 'false',
  `add_point_meeting` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT 'false',
  PRIMARY KEY (`id`),
  KEY `point_id` (`point_id`),
  KEY `current_meeting_id` (`current_meeting_id`),
  KEY `next_meeting_id` (`next_meeting_id`),
  KEY `meeting_point_future_ibfk_4` (`template_id`),
  CONSTRAINT `meeting_point_future_ibfk_3` FOREIGN KEY (`next_meeting_id`) REFERENCES `meeting` (`id`) ON DELETE SET NULL,
  CONSTRAINT `meeting_point_future_ibfk_4` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_point_future`
--

LOCK TABLES `meeting_point_future` WRITE;
/*!40000 ALTER TABLE `meeting_point_future` DISABLE KEYS */;
INSERT INTO `meeting_point_future` VALUES (113,537,NULL,NULL,43,'NEXT','AGREE',1,'false','true');
/*!40000 ALTER TABLE `meeting_point_future` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_points`
--

DROP TABLE IF EXISTS `meeting_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_points` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meeting_id` int NOT NULL,
  `point_name` varchar(255) NOT NULL,
  `point_status` varchar(50) DEFAULT NULL,
  `point_responsibility` int DEFAULT NULL,
  `point_deadline` date DEFAULT NULL,
  `todo` varchar(255) DEFAULT NULL,
  `remarks` text,
  `approved_by_admin` enum('APPROVED','NOT APPROVED') DEFAULT NULL,
  `remarks_by_admin` varchar(45) DEFAULT NULL,
  `old_todo` varchar(255) DEFAULT NULL,
  `parent_point_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_points_meeting_id_foreign` (`meeting_id`),
  KEY `meeting_points_point_responsibility_foreign` (`point_responsibility`),
  KEY `fk_parent_point` (`parent_point_id`),
  CONSTRAINT `fk_parent_point` FOREIGN KEY (`parent_point_id`) REFERENCES `meeting_points` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `meeting_points_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `meeting_points_point_responsibility_foreign` FOREIGN KEY (`point_responsibility`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=543 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_points`
--

LOCK TABLES `meeting_points` WRITE;
/*!40000 ALTER TABLE `meeting_points` DISABLE KEYS */;
INSERT INTO `meeting_points` VALUES (416,201,'Point 1','completed',2,NULL,'Done.',NULL,'APPROVED',NULL,NULL,NULL),(417,202,'Point 1','completed',2,NULL,'test!',NULL,'APPROVED',NULL,NULL,NULL),(418,203,'Point 1','completed',2,NULL,'Hey There',NULL,'APPROVED',NULL,NULL,NULL),(419,204,'Point 2','completed',2,'2025-05-02','asdfsadf',NULL,'APPROVED','Good Point.',NULL,NULL),(421,205,'Business Point','completed',1,NULL,'I will talk Business',NULL,'APPROVED','I don\'t like this point.',NULL,NULL),(422,205,'The role of sugar','completed',1,NULL,'I will talk about only sugar',NULL,'APPROVED','GOOD POINT','I will talk about sugar',NULL),(452,208,'Point 1','',4,'2025-05-06',NULL,NULL,NULL,NULL,NULL,NULL),(473,209,'Point 1','',4,'2025-05-17',NULL,NULL,NULL,'loplop',NULL,NULL),(474,209,'SubPoint 1',NULL,2,NULL,NULL,NULL,NULL,'FER',NULL,473),(475,209,'Point 2','',4,'2025-05-17',NULL,NULL,NULL,'3rerer',NULL,NULL),(476,209,'SubPoint 2',NULL,2,NULL,NULL,NULL,NULL,'dfdfdf',NULL,475),(477,209,'Subpoint 3',NULL,4,NULL,NULL,NULL,NULL,'FER',NULL,473),(478,209,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,473),(479,210,'Point 1',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(480,210,'Point 2',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(481,210,'Point 3',NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(482,211,'Point 1','completed',4,'2025-06-06','Done.',NULL,'APPROVED','DONE.',NULL,NULL),(483,211,'Point 2 ',NULL,4,NULL,NULL,NULL,NULL,'Good Job',NULL,482),(484,211,'Good Job.','',2,'2025-06-05',NULL,NULL,NULL,'Done.',NULL,NULL),(485,211,'Point 3',NULL,2,NULL,NULL,NULL,NULL,'Good.',NULL,484),(486,211,'Point 3','',8,NULL,NULL,NULL,NULL,'okay done.',NULL,NULL),(487,211,'Point 4',NULL,8,NULL,NULL,NULL,NULL,'Bad.',NULL,484),(488,211,'Point 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,482),(489,211,'Point 3',NULL,2,NULL,NULL,NULL,NULL,'Done.',NULL,482),(490,212,'Point 1',NULL,2,'2025-07-28',NULL,NULL,NULL,NULL,NULL,NULL),(491,213,'Point 1','completed',4,NULL,'todo example',NULL,'APPROVED','Good.',NULL,NULL),(492,213,'Point 2','completed',6,NULL,'todo example',NULL,'APPROVED','Bad.',NULL,NULL),(493,213,'Subpoint 1',NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,491),(494,214,'Point 1','completed',8,'2025-07-31','todo one',NULL,'APPROVED',NULL,NULL,NULL),(495,214,'Point 2','completed',8,'2025-07-31','todo two',NULL,'APPROVED',NULL,NULL,NULL),(496,215,'Point 1',NULL,2,'2025-08-04',NULL,NULL,NULL,NULL,NULL,NULL),(497,216,'Point 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(498,217,'Point 1','not completed',8,'2025-08-05',NULL,'Will do.',NULL,NULL,NULL,NULL),(499,218,'Business Point','completed',8,NULL,'Hello There 12',NULL,NULL,NULL,NULL,NULL),(500,219,'Point 1',NULL,4,'2025-09-20',NULL,NULL,NULL,NULL,NULL,NULL),(501,219,'Point 2',NULL,5,'2025-09-20',NULL,NULL,NULL,NULL,NULL,NULL),(502,220,'Point 1','completed',1,'2025-09-15','I am going to this work.',NULL,'APPROVED','Good Point.',NULL,NULL),(503,220,'Point 2','',1,NULL,NULL,NULL,NULL,'12334',NULL,NULL),(504,221,'Point 2',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(505,221,'Point 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(506,222,'Point 1','completed',4,NULL,'132123',NULL,'APPROVED','Good Job',NULL,NULL),(507,222,'Point 2','completed',4,NULL,'I will talk about sugar',NULL,'APPROVED','OK',NULL,NULL),(508,222,'Point 3','',8,NULL,NULL,NULL,NULL,'Please change.',NULL,NULL),(509,222,'Point 3.1',NULL,5,NULL,NULL,NULL,NULL,'Well Done.',NULL,508),(510,223,'Point 1','completed',2,'2025-09-19','done bby.',NULL,'APPROVED',NULL,NULL,NULL),(511,223,'Point 2','',4,'2025-09-19',NULL,NULL,NULL,NULL,NULL,NULL),(512,224,'Point 1','completed',2,'2025-09-20','will do',NULL,'APPROVED',NULL,NULL,NULL),(513,224,'Point 2','',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(514,224,'Point 3',NULL,2,'2025-09-19',NULL,NULL,NULL,NULL,NULL,NULL),(515,225,'Point 1',NULL,2,'2025-09-20',NULL,NULL,NULL,NULL,NULL,NULL),(516,226,'Business Point','completed',1,NULL,'okay will do',NULL,'APPROVED',NULL,NULL,NULL),(517,226,'The role of sugar','completed',5,NULL,'will do',NULL,'APPROVED',NULL,NULL,NULL),(518,227,'Point 1','completed',2,'2025-09-22','will do',NULL,'APPROVED','Good',NULL,NULL),(519,227,'Point 2','completed',8,'2025-09-22','can do',NULL,'APPROVED','Bad',NULL,NULL),(520,228,'Point 1',NULL,4,'2025-09-22',NULL,NULL,NULL,NULL,NULL,NULL),(521,228,'Point 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(522,228,'Point 2 ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(537,233,'Point 1','completed',2,'2025-10-22','done bby.',NULL,'APPROVED','good',NULL,NULL),(538,234,'Point 1','completed',2,NULL,'BOS Meeting 234',NULL,'APPROVED',NULL,NULL,NULL),(539,235,'Point 1',NULL,8,'2025-10-22',NULL,NULL,NULL,NULL,NULL,NULL),(540,235,'Point 1','completed',2,'2025-10-22','done bby.',NULL,NULL,NULL,NULL,NULL),(541,236,'Point 1','completed',2,'2025-10-21','done bby.',NULL,'APPROVED',NULL,NULL,NULL),(542,236,'Point 1','completed',2,'2025-10-21','doing it',NULL,'APPROVED',NULL,NULL,NULL);
/*!40000 ALTER TABLE `meeting_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_rejections`
--

DROP TABLE IF EXISTS `meeting_rejections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_rejections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meeting_id` int NOT NULL,
  `user_id` int NOT NULL,
  `reason` text,
  `rejected_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meeting_id` (`meeting_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `meeting_rejections_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meeting_rejections_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_rejections`
--

LOCK TABLES `meeting_rejections` WRITE;
/*!40000 ALTER TABLE `meeting_rejections` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_rejections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `template_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'John Doe',NULL),(2,'Jane Smith',NULL),(3,'Alice Johnson',NULL),(4,'Bob Brown',NULL),(5,'balaji',NULL),(6,'peter',NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_activity_log`
--

DROP TABLE IF EXISTS `point_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_activity_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `point_id` int NOT NULL,
  `meeting_id` int NOT NULL,
  `activity_type` enum('created','modified','forwarded','completed','approved','rejected','voted') NOT NULL,
  `activity_description` text NOT NULL,
  `old_value` text,
  `new_value` text,
  `performed_by` int NOT NULL,
  `performed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `additional_data` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_id` (`meeting_id`),
  KEY `performed_by` (`performed_by`),
  KEY `idx_point_activity` (`point_id`),
  KEY `idx_activity_type` (`activity_type`),
  KEY `idx_activity_timeline` (`performed_at`),
  CONSTRAINT `point_activity_log_ibfk_1` FOREIGN KEY (`point_id`) REFERENCES `meeting_points` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_activity_log_ibfk_2` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_activity_log_ibfk_3` FOREIGN KEY (`performed_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_activity_log`
--

LOCK TABLES `point_activity_log` WRITE;
/*!40000 ALTER TABLE `point_activity_log` DISABLE KEYS */;
INSERT INTO `point_activity_log` VALUES (1,518,227,'modified','Point updated: point_name, todo, point_status, point_responsibility, point_deadline, old_todo modified',NULL,NULL,1,'2025-09-22 06:36:56','{\"modifiedFields\": [\"point_name\", \"todo\", \"point_status\", \"point_responsibility\", \"point_deadline\", \"old_todo\"]}'),(2,519,227,'modified','Point updated: point_name, todo, point_status, point_responsibility, point_deadline, old_todo modified',NULL,NULL,1,'2025-09-22 06:36:56','{\"modifiedFields\": [\"point_name\", \"todo\", \"point_status\", \"point_responsibility\", \"point_deadline\", \"old_todo\"]}'),(3,518,227,'modified','Point updated: point_name, todo, point_status, point_responsibility, point_deadline, old_todo modified',NULL,NULL,1,'2025-09-22 06:36:59','{\"modifiedFields\": [\"point_name\", \"todo\", \"point_status\", \"point_responsibility\", \"point_deadline\", \"old_todo\"]}'),(4,519,227,'modified','Point updated: point_name, todo, point_status, point_responsibility, point_deadline, old_todo modified',NULL,NULL,1,'2025-09-22 06:36:59','{\"modifiedFields\": [\"point_name\", \"todo\", \"point_status\", \"point_responsibility\", \"point_deadline\", \"old_todo\"]}'),(5,518,227,'modified','Point updated: point_name, todo, point_status, point_responsibility, point_deadline, old_todo modified',NULL,NULL,1,'2025-09-22 06:37:09','{\"modifiedFields\": [\"point_name\", \"todo\", \"point_status\", \"point_responsibility\", \"point_deadline\", \"old_todo\"]}'),(6,519,227,'modified','Point updated: point_name, todo, point_status, point_responsibility, point_deadline, old_todo modified',NULL,NULL,1,'2025-09-22 06:37:09','{\"modifiedFields\": [\"point_name\", \"todo\", \"point_status\", \"point_responsibility\", \"point_deadline\", \"old_todo\"]}'),(7,521,228,'created','Point created from forwarded',NULL,NULL,1,'2025-09-22 06:37:54','null'),(8,522,228,'created','Point created from forwarded',NULL,NULL,1,'2025-09-22 06:37:54','null');
/*!40000 ALTER TABLE `point_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `point_forward_chain`
--

DROP TABLE IF EXISTS `point_forward_chain`;
/*!50001 DROP VIEW IF EXISTS `point_forward_chain`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `point_forward_chain` AS SELECT 
 1 AS `point_id`,
 1 AS `original_point_id`,
 1 AS `parent_point_id`,
 1 AS `source_meeting_id`,
 1 AS `target_meeting_id`,
 1 AS `generation_level`,
 1 AS `forward_date`,
 1 AS `forwarded_by`,
 1 AS `forward_reason`,
 1 AS `chain_path`,
 1 AS `depth`,
 1 AS `point_name`,
 1 AS `meeting_name`,
 1 AS `meeting_date`,
 1 AS `forwarded_by_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `point_forwarding_history`
--

DROP TABLE IF EXISTS `point_forwarding_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_forwarding_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `source_point_id` int NOT NULL,
  `target_point_id` int NOT NULL,
  `source_meeting_id` int NOT NULL,
  `target_meeting_id` int NOT NULL,
  `forwarded_by` int NOT NULL,
  `forwarding_reason` text,
  `forwarding_notes` text,
  `forwarded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `source_meeting_id` (`source_meeting_id`),
  KEY `target_meeting_id` (`target_meeting_id`),
  KEY `forwarded_by` (`forwarded_by`),
  KEY `idx_source_point` (`source_point_id`),
  KEY `idx_target_point` (`target_point_id`),
  KEY `idx_forwarding_timeline` (`forwarded_at`),
  CONSTRAINT `point_forwarding_history_ibfk_1` FOREIGN KEY (`source_point_id`) REFERENCES `meeting_points` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_forwarding_history_ibfk_2` FOREIGN KEY (`target_point_id`) REFERENCES `meeting_points` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_forwarding_history_ibfk_3` FOREIGN KEY (`source_meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_forwarding_history_ibfk_4` FOREIGN KEY (`target_meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_forwarding_history_ibfk_5` FOREIGN KEY (`forwarded_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_forwarding_history`
--

LOCK TABLES `point_forwarding_history` WRITE;
/*!40000 ALTER TABLE `point_forwarding_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_forwarding_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_lineage`
--

DROP TABLE IF EXISTS `point_lineage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_lineage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `point_id` int NOT NULL,
  `parent_point_id` int DEFAULT NULL,
  `original_point_id` int NOT NULL,
  `source_meeting_id` int NOT NULL,
  `target_meeting_id` int NOT NULL,
  `forwarded_by` int NOT NULL,
  `forward_reason` text,
  `forward_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `generation_level` int DEFAULT '1',
  `status` enum('forwarded','resolved','cancelled') DEFAULT 'forwarded',
  `resolution_notes` text,
  `resolved_at` timestamp NULL DEFAULT NULL,
  `resolved_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_point_id` (`parent_point_id`),
  KEY `forwarded_by` (`forwarded_by`),
  KEY `resolved_by` (`resolved_by`),
  KEY `idx_point_lineage_point` (`point_id`),
  KEY `idx_point_lineage_original` (`original_point_id`),
  KEY `idx_point_lineage_source` (`source_meeting_id`),
  KEY `idx_point_lineage_target` (`target_meeting_id`),
  CONSTRAINT `point_lineage_ibfk_1` FOREIGN KEY (`point_id`) REFERENCES `meeting_points` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_lineage_ibfk_2` FOREIGN KEY (`parent_point_id`) REFERENCES `meeting_points` (`id`) ON DELETE SET NULL,
  CONSTRAINT `point_lineage_ibfk_3` FOREIGN KEY (`original_point_id`) REFERENCES `meeting_points` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_lineage_ibfk_4` FOREIGN KEY (`source_meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_lineage_ibfk_5` FOREIGN KEY (`target_meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_lineage_ibfk_6` FOREIGN KEY (`forwarded_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_lineage_ibfk_7` FOREIGN KEY (`resolved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_lineage`
--

LOCK TABLES `point_lineage` WRITE;
/*!40000 ALTER TABLE `point_lineage` DISABLE KEYS */;
INSERT INTO `point_lineage` VALUES (2,537,NULL,537,233,233,1,'Agreed and forwarded via NEXT to template 43','2025-10-22 06:37:45',0,'forwarded',NULL,NULL,NULL);
/*!40000 ALTER TABLE `point_lineage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_origins`
--

DROP TABLE IF EXISTS `point_origins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_origins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `point_id` int NOT NULL,
  `origin_type` enum('template','meeting','forwarded','manual') NOT NULL,
  `origin_id` int DEFAULT NULL,
  `origin_meeting_id` int DEFAULT NULL,
  `origin_template_id` int DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `idx_point_origin` (`point_id`),
  KEY `idx_origin_type` (`origin_type`),
  KEY `idx_origin_meeting` (`origin_meeting_id`),
  CONSTRAINT `point_origins_ibfk_1` FOREIGN KEY (`point_id`) REFERENCES `meeting_points` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_origins_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_origins_ibfk_3` FOREIGN KEY (`origin_meeting_id`) REFERENCES `meeting` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_origins`
--

LOCK TABLES `point_origins` WRITE;
/*!40000 ALTER TABLE `point_origins` DISABLE KEYS */;
INSERT INTO `point_origins` VALUES (1,521,'forwarded',482,NULL,43,1,'2025-09-22 06:37:54'),(2,522,'forwarded',483,NULL,43,1,'2025-09-22 06:37:54');
/*!40000 ALTER TABLE `point_origins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `point_tracking_summary`
--

DROP TABLE IF EXISTS `point_tracking_summary`;
/*!50001 DROP VIEW IF EXISTS `point_tracking_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `point_tracking_summary` AS SELECT 
 1 AS `point_id`,
 1 AS `point_name`,
 1 AS `current_meeting_id`,
 1 AS `current_meeting_name`,
 1 AS `current_meeting_date`,
 1 AS `original_point_id`,
 1 AS `original_point_name`,
 1 AS `original_meeting_name`,
 1 AS `original_meeting_date`,
 1 AS `original_created_by`,
 1 AS `generation_level`,
 1 AS `forward_reason`,
 1 AS `forward_date`,
 1 AS `forwarded_by_name`,
 1 AS `parent_point_id`,
 1 AS `parent_point_name`,
 1 AS `parent_meeting_name`,
 1 AS `status`,
 1 AS `resolution_notes`,
 1 AS `resolved_at`,
 1 AS `resolved_by_name`,
 1 AS `total_forwards`,
 1 AS `meetings_involved`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `point_vote_summary`
--

DROP TABLE IF EXISTS `point_vote_summary`;
/*!50001 DROP VIEW IF EXISTS `point_vote_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `point_vote_summary` AS SELECT 
 1 AS `point_id`,
 1 AS `votes_for`,
 1 AS `votes_against`,
 1 AS `total_votes`,
 1 AS `voters_for`,
 1 AS `voters_against`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `point_votes`
--

DROP TABLE IF EXISTS `point_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_votes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `point_id` int NOT NULL,
  `user_id` int NOT NULL,
  `vote_type` enum('for','against') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_point_vote` (`user_id`,`point_id`),
  KEY `idx_point_votes_point_id` (`point_id`),
  KEY `idx_point_votes_user_id` (`user_id`),
  KEY `idx_point_votes_created_at` (`created_at`),
  CONSTRAINT `point_votes_ibfk_1` FOREIGN KEY (`point_id`) REFERENCES `meeting_points` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_votes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_votes`
--

LOCK TABLES `point_votes` WRITE;
/*!40000 ALTER TABLE `point_votes` DISABLE KEYS */;
INSERT INTO `point_votes` VALUES (1,510,4,'for','2025-09-19 05:10:40','2025-09-19 10:48:33'),(3,510,2,'for','2025-09-19 05:35:45','2025-09-19 10:43:27'),(23,511,2,'for','2025-09-19 10:47:58','2025-09-19 10:48:01'),(29,512,4,'for','2025-09-20 03:27:16','2025-09-20 03:27:51'),(31,512,2,'against','2025-09-20 03:27:32','2025-09-20 03:28:15'),(34,513,4,'for','2025-09-20 03:29:17','2025-09-20 03:29:32'),(35,513,2,'for','2025-09-20 03:29:20','2025-09-20 03:29:39'),(39,516,5,'against','2025-09-20 05:23:59','2025-09-20 05:29:19'),(40,516,1,'for','2025-09-20 05:24:18','2025-09-20 05:24:18'),(41,516,2,'for','2025-09-20 05:28:54','2025-09-20 05:28:54'),(43,517,2,'for','2025-09-20 05:41:24','2025-09-20 05:41:24');
/*!40000 ALTER TABLE `point_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_voting_sessions`
--

DROP TABLE IF EXISTS `point_voting_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_voting_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `point_id` int NOT NULL,
  `meeting_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `started_by` int NOT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `started_by` (`started_by`),
  KEY `idx_voting_sessions_point_id` (`point_id`),
  KEY `idx_voting_sessions_meeting_id` (`meeting_id`),
  KEY `idx_voting_sessions_active` (`is_active`),
  CONSTRAINT `point_voting_sessions_ibfk_1` FOREIGN KEY (`point_id`) REFERENCES `meeting_points` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_voting_sessions_ibfk_2` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`id`) ON DELETE CASCADE,
  CONSTRAINT `point_voting_sessions_ibfk_3` FOREIGN KEY (`started_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_voting_sessions`
--

LOCK TABLES `point_voting_sessions` WRITE;
/*!40000 ALTER TABLE `point_voting_sessions` DISABLE KEYS */;
INSERT INTO `point_voting_sessions` VALUES (1,510,223,0,4,'2025-09-19 05:10:16','2025-09-19 05:30:01','2025-09-19 05:10:16'),(2,510,223,0,4,'2025-09-19 05:30:01','2025-09-19 05:30:30','2025-09-19 05:30:01'),(3,510,223,0,4,'2025-09-19 05:30:30','2025-09-19 05:39:40','2025-09-19 05:30:30'),(4,510,223,0,4,'2025-09-19 05:39:40','2025-09-19 05:40:12','2025-09-19 05:39:40'),(5,510,223,1,4,'2025-09-19 05:40:12',NULL,'2025-09-19 05:40:12'),(6,511,223,1,4,NULL,NULL,'2025-09-19 10:46:29'),(7,512,224,0,4,'2025-09-20 03:27:06','2025-09-20 03:28:01','2025-09-20 03:27:06'),(8,512,224,0,4,'2025-09-20 03:28:10','2025-09-20 03:28:17','2025-09-20 03:28:10'),(9,512,224,0,4,'2025-09-20 03:28:22','2025-09-20 03:28:36','2025-09-20 03:28:22'),(10,513,224,0,4,'2025-09-20 03:29:13','2025-09-20 03:29:25','2025-09-20 03:29:13'),(11,513,224,0,4,'2025-09-20 03:29:27','2025-09-20 03:29:29','2025-09-20 03:29:27'),(12,513,224,0,4,'2025-09-20 03:29:32','2025-09-20 03:29:42','2025-09-20 03:29:32'),(13,513,224,0,4,'2025-09-20 03:29:48','2025-09-20 04:27:53','2025-09-20 03:29:48'),(14,513,224,0,4,'2025-09-20 04:27:55','2025-09-20 04:27:56','2025-09-20 04:27:55'),(15,512,224,0,4,'2025-09-20 04:27:58','2025-09-20 04:28:44','2025-09-20 04:27:58'),(16,512,224,0,4,'2025-09-20 04:28:56','2025-09-20 04:28:56','2025-09-20 04:28:56'),(17,513,224,0,4,'2025-09-20 04:41:25','2025-09-20 05:06:20','2025-09-20 04:41:25'),(18,514,224,1,4,'2025-09-20 05:06:21',NULL,'2025-09-20 05:06:21'),(19,516,226,0,2,'2025-09-20 05:23:54','2025-09-20 05:31:48','2025-09-20 05:23:54'),(20,517,226,0,2,'2025-09-20 05:41:23','2025-09-20 05:41:25','2025-09-20 05:41:23');
/*!40000 ALTER TABLE `point_voting_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_members`
--

DROP TABLE IF EXISTS `template_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_id` int DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `template_members_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `template_members_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_members`
--

LOCK TABLES `template_members` WRITE;
/*!40000 ALTER TABLE `template_members` DISABLE KEYS */;
INSERT INTO `template_members` VALUES (112,44,'Team Head',2),(113,44,'Team Member',6),(114,44,'Team Member',3),(115,45,'Chairman',1),(116,45,'Head of Department',5),(117,43,'Role 1',4),(118,43,'Role 1',2),(119,43,'Role 2',8),(120,46,'Role 1',2),(121,46,'Role 1',4),(122,46,'Role 2',6),(123,47,'Test Role 1',8),(124,47,'Test Role 1',5),(125,48,'Head',8),(126,48,'Head',4),(127,48,'Staff',5),(128,49,'Role',1),(129,49,'Role',2);
/*!40000 ALTER TABLE `template_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_points`
--

DROP TABLE IF EXISTS `template_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_points` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_id` int DEFAULT NULL,
  `sno` varchar(10) DEFAULT NULL,
  `point` text,
  `responsibility` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  CONSTRAINT `template_points_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_points`
--

LOCK TABLES `template_points` WRITE;
/*!40000 ALTER TABLE `template_points` DISABLE KEYS */;
INSERT INTO `template_points` VALUES (98,44,'01','Point 1',NULL),(99,45,'01','Business Point',NULL),(100,45,'02','The role of sugar',NULL),(101,43,'01','Point 1',NULL),(102,46,'01','Point 1',NULL),(103,46,'02','Point 2',NULL),(104,47,'01','Point 1',NULL),(105,47,'02','Point 2',NULL),(106,48,'01','Point 1',NULL),(107,48,'02','Point 2',NULL),(108,49,'01','Point 1',NULL);
/*!40000 ALTER TABLE `template_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `repeat_type` varchar(50) DEFAULT NULL,
  `priority_type` varchar(50) DEFAULT NULL,
  `venue_id` int DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `ref_number` varchar(50) DEFAULT 'Auto generate',
  `category_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Active',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom_days` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venue_id` (`venue_id`),
  KEY `category_id` (`category_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `templates_ibfk_1` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`),
  CONSTRAINT `templates_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `templates_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (43,'Meeting','Meeting Description	\n','Daily','high',1,NULL,'BITMEET-ZM34XY',1,1,'Active','2025-04-23 10:01:40','2025-05-05 15:57:56',NULL),(44,'Meeting Test','','Month','high',1,NULL,'BITMEET-829USB',1,5,'Active','2025-05-01 06:18:10','2025-05-01 11:48:10',NULL),(45,'BOS Meeting','BOS Meeting','Week','high',1,NULL,'BITMEET-IKLWMS',1,7,'Active','2025-05-01 14:43:11','2025-05-01 20:13:10',NULL),(46,'Meeting Title','Description','Daily','high',1,NULL,'BITMEET-0AA5UG',1,1,'Active','2025-07-28 05:01:41','2025-07-28 10:31:41',NULL),(47,'Meeting Name','Description','Week','high',1,NULL,'BITMEET-PIYY00',1,1,'Active','2025-07-30 10:07:35','2025-07-30 15:37:35',NULL),(48,'Title','Description','Week','high',1,NULL,'BITMEET-ZUKS0T',1,6,'Active','2025-09-15 04:34:33','2025-09-15 10:04:33',NULL),(49,'Template Title','Template Description','Week','medium',1,NULL,'BITMEET-DWYCHF',1,4,'Active','2025-09-15 04:49:33','2025-09-15 10:19:33',NULL);
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `auth_type` enum('local','google') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role` varchar(45) DEFAULT 'user',
  `department` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Balaji','balaji@example.com','123',NULL,'local','2025-03-06 15:17:46','2025-04-11 09:21:29','user','CSE'),(2,'Tridev Balaji Ravi','tridev.2416@gmail.com','123','103820645754153331161','google','2025-03-08 05:46:22','2025-03-26 05:47:08','user',NULL),(3,'Test','test@example.com','123',NULL,'local','2025-03-08 10:19:27','2025-04-15 12:17:08','user',NULL),(4,'Alice Johnson','alice@example.com','123',NULL,'local','2025-03-17 06:23:56','2025-04-15 12:17:08','user',NULL),(5,'Bob Smith','bob@example.com','123',NULL,'local','2025-03-17 06:23:56','2025-04-12 04:15:12','user','CSE'),(6,'Charlie Brown','charlie@example.com','123','google_123456','google','2025-03-17 06:23:56','2025-03-26 05:47:08','user',NULL),(7,'David Lee','david@example.com','123',NULL,'local','2025-03-17 06:23:56','2025-04-15 12:17:08','user',NULL),(8,'Eve Adams','eve@example.com','123','google_789101','google','2025-03-17 06:23:56','2025-04-11 09:21:29','user','CSE');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venues`
--

DROP TABLE IF EXISTS `venues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venues`
--

LOCK TABLES `venues` WRITE;
/*!40000 ALTER TABLE `venues` DISABLE KEYS */;
INSERT INTO `venues` VALUES (1,'Conference Room A','Building 1, Floor 2',50,'available'),(2,'Conference Room B','Building 1, Floor 3',30,'available'),(3,'Main Hall','Building 2, Ground Floor',200,'available');
/*!40000 ALTER TABLE `venues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `point_forward_chain`
--

/*!50001 DROP VIEW IF EXISTS `point_forward_chain`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `point_forward_chain` AS with recursive `point_chain` as (select `pl`.`point_id` AS `point_id`,`pl`.`original_point_id` AS `original_point_id`,`pl`.`parent_point_id` AS `parent_point_id`,`pl`.`source_meeting_id` AS `source_meeting_id`,`pl`.`target_meeting_id` AS `target_meeting_id`,`pl`.`generation_level` AS `generation_level`,`pl`.`forward_date` AS `forward_date`,`pl`.`forwarded_by` AS `forwarded_by`,`pl`.`forward_reason` AS `forward_reason`,cast(`pl`.`point_id` as char(1000) charset utf8mb4) AS `chain_path`,0 AS `depth` from `point_lineage` `pl` where (`pl`.`parent_point_id` is null) union all select `pl`.`point_id` AS `point_id`,`pl`.`original_point_id` AS `original_point_id`,`pl`.`parent_point_id` AS `parent_point_id`,`pl`.`source_meeting_id` AS `source_meeting_id`,`pl`.`target_meeting_id` AS `target_meeting_id`,`pl`.`generation_level` AS `generation_level`,`pl`.`forward_date` AS `forward_date`,`pl`.`forwarded_by` AS `forwarded_by`,`pl`.`forward_reason` AS `forward_reason`,concat(`pc`.`chain_path`,' -> ',`pl`.`point_id`) AS `chain_path`,(`pc`.`depth` + 1) AS `depth` from (`point_lineage` `pl` join `point_chain` `pc` on((`pl`.`parent_point_id` = `pc`.`point_id`)))) select `pc`.`point_id` AS `point_id`,`pc`.`original_point_id` AS `original_point_id`,`pc`.`parent_point_id` AS `parent_point_id`,`pc`.`source_meeting_id` AS `source_meeting_id`,`pc`.`target_meeting_id` AS `target_meeting_id`,`pc`.`generation_level` AS `generation_level`,`pc`.`forward_date` AS `forward_date`,`pc`.`forwarded_by` AS `forwarded_by`,`pc`.`forward_reason` AS `forward_reason`,`pc`.`chain_path` AS `chain_path`,`pc`.`depth` AS `depth`,`mp`.`point_name` AS `point_name`,`m`.`meeting_name` AS `meeting_name`,`m`.`start_time` AS `meeting_date`,`u`.`name` AS `forwarded_by_name` from (((`point_chain` `pc` join `meeting_points` `mp` on((`pc`.`point_id` = `mp`.`id`))) join `meeting` `m` on((`pc`.`target_meeting_id` = `m`.`id`))) join `users` `u` on((`pc`.`forwarded_by` = `u`.`id`))) order by `pc`.`original_point_id`,`pc`.`depth` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `point_tracking_summary`
--

/*!50001 DROP VIEW IF EXISTS `point_tracking_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `point_tracking_summary` AS select `mp`.`id` AS `point_id`,`mp`.`point_name` AS `point_name`,`mp`.`meeting_id` AS `current_meeting_id`,`m`.`meeting_name` AS `current_meeting_name`,`m`.`start_time` AS `current_meeting_date`,`pl`.`original_point_id` AS `original_point_id`,`orig_mp`.`point_name` AS `original_point_name`,`orig_m`.`meeting_name` AS `original_meeting_name`,`orig_m`.`start_time` AS `original_meeting_date`,`orig_u`.`name` AS `original_created_by`,`pl`.`generation_level` AS `generation_level`,`pl`.`forward_reason` AS `forward_reason`,`pl`.`forward_date` AS `forward_date`,`fw_u`.`name` AS `forwarded_by_name`,`pl`.`parent_point_id` AS `parent_point_id`,`parent_mp`.`point_name` AS `parent_point_name`,`parent_m`.`meeting_name` AS `parent_meeting_name`,`pl`.`status` AS `status`,`pl`.`resolution_notes` AS `resolution_notes`,`pl`.`resolved_at` AS `resolved_at`,`res_u`.`name` AS `resolved_by_name`,(select count(0) from `point_lineage` `pl2` where (`pl2`.`original_point_id` = `pl`.`original_point_id`)) AS `total_forwards`,(select count(distinct `pl3`.`target_meeting_id`) from `point_lineage` `pl3` where (`pl3`.`original_point_id` = `pl`.`original_point_id`)) AS `meetings_involved` from (((((((((`meeting_points` `mp` left join `point_lineage` `pl` on((`mp`.`id` = `pl`.`point_id`))) left join `meeting` `m` on((`mp`.`meeting_id` = `m`.`id`))) left join `meeting_points` `orig_mp` on((`pl`.`original_point_id` = `orig_mp`.`id`))) left join `meeting` `orig_m` on((`orig_mp`.`meeting_id` = `orig_m`.`id`))) left join `users` `orig_u` on((`orig_m`.`created_by` = `orig_u`.`id`))) left join `users` `fw_u` on((`pl`.`forwarded_by` = `fw_u`.`id`))) left join `meeting_points` `parent_mp` on((`pl`.`parent_point_id` = `parent_mp`.`id`))) left join `meeting` `parent_m` on((`parent_mp`.`meeting_id` = `parent_m`.`id`))) left join `users` `res_u` on((`pl`.`resolved_by` = `res_u`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `point_vote_summary`
--

/*!50001 DROP VIEW IF EXISTS `point_vote_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `point_vote_summary` AS select `pv`.`point_id` AS `point_id`,count((case when (`pv`.`vote_type` = 'for') then 1 end)) AS `votes_for`,count((case when (`pv`.`vote_type` = 'against') then 1 end)) AS `votes_against`,count(0) AS `total_votes`,group_concat((case when (`pv`.`vote_type` = 'for') then `u`.`name` end) separator ', ') AS `voters_for`,group_concat((case when (`pv`.`vote_type` = 'against') then `u`.`name` end) separator ', ') AS `voters_against` from (`point_votes` `pv` join `users` `u` on((`pv`.`user_id` = `u`.`id`))) group by `pv`.`point_id` */;
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

-- Dump completed on 2025-10-28 10:48:17
