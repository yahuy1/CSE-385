-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: University
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
-- Table structure for table `Capacity`
--

DROP TABLE IF EXISTS `Capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Capacity` (
  `classnumber` varchar(20) NOT NULL,
  `facId` varchar(20) DEFAULT NULL,
  `schedule` varchar(20) DEFAULT NULL,
  `room` varchar(20) DEFAULT NULL,
  `currentEnroll` decimal(3,0) DEFAULT NULL,
  `maxEnroll` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`classnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Capacity`
--

LOCK TABLES `Capacity` WRITE;
/*!40000 ALTER TABLE `Capacity` DISABLE KEYS */;
INSERT INTO `Capacity` VALUES ('ART103A','F101','MWF9','H221',3,4),('CSC201A','F105','TuThF10','M110',1,4),('CSC203A','F105','MTHF12','M110',0,4),('HST205A','F115','MWF11','H221',1,4),('MTH101B','F110','MTuTh9','H225',1,4),('MTH103C','F110','MWF11','H225',2,4);
/*!40000 ALTER TABLE `Capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Class`
--

DROP TABLE IF EXISTS `Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Class` (
  `classNumber` varchar(8) NOT NULL,
  `facId` varchar(6) DEFAULT NULL,
  `schedule` varchar(8) DEFAULT NULL,
  `room` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`classNumber`),
  UNIQUE KEY `class_schedule_uk` (`schedule`,`room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class`
--

LOCK TABLES `Class` WRITE;
/*!40000 ALTER TABLE `Class` DISABLE KEYS */;
INSERT INTO `Class` VALUES ('ART103A','F101','MWF9','H221'),('CSC201A','F105','TuThF10','M110'),('CSC203A','F105','MTHF12','M110'),('HST205A','F115','MWF11','H221'),('MTH101B','F110','MTuTh9','H225'),('MTH103C','F110','MWF11','H225');
/*!40000 ALTER TABLE `Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENROLL`
--

DROP TABLE IF EXISTS `ENROLL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENROLL` (
  `studId` varchar(6) NOT NULL,
  `classNumber` varchar(8) NOT NULL,
  `grade` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`classNumber`,`studId`),
  KEY `Enroll_studId_fk` (`studId`),
  CONSTRAINT `Enroll_ClassNumber_fk` FOREIGN KEY (`classNumber`) REFERENCES `Class` (`classNumber`),
  CONSTRAINT `Enroll_studId_fk` FOREIGN KEY (`studId`) REFERENCES `Student` (`studId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENROLL`
--

LOCK TABLES `ENROLL` WRITE;
/*!40000 ALTER TABLE `ENROLL` DISABLE KEYS */;
INSERT INTO `ENROLL` VALUES ('S1001','ART103A','A'),('S1002','ART103A','D'),('S1010','ART103A',NULL),('S1002','CSC201A','F'),('S1020','CSC201A','B'),('S1001','HST205A','C'),('S1020','MTH101B','A'),('S1002','MTH103C','B'),('S1010','MTH103C',NULL);
/*!40000 ALTER TABLE `ENROLL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Faculty` (
  `facId` varchar(6) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL,
  `therank` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`facId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES ('F101','Adams','Art','Professor'),('F105','Tanaka','CSC','Instructor'),('F110','Byrne','MATH','Assistant'),('F115','Smith','HISTORY','Associate'),('F221','Smith','CSC','Professor');
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `studId` varchar(6) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `major` varchar(20) DEFAULT NULL,
  `credits` decimal(3,0) DEFAULT '0',
  PRIMARY KEY (`studId`),
  CONSTRAINT `Student_credits_cc` CHECK (((`credits` >= 0) and (`credits` < 150)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('S1001','Smith','Tom','History',90),('S1002','Chin','Anne','Math',36),('S1005','Lee','Perry','History',3),('S1010','Burns','Edward','Art',63),('S1013','McCarthy','Owen','Math',0),('S1015','Jones','Mary','Math',42),('S1020','Rivera','Jane','CSC',15);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-21 21:54:42
