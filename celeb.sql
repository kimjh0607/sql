-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: zerobase
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `celeb`
--

DROP TABLE IF EXISTS `celeb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `celeb` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) NOT NULL DEFAULT '',
  `BIRTHDAY` date DEFAULT NULL,
  `AGE` int DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `JOB_TITLE` varchar(32) DEFAULT NULL,
  `AGENCY` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celeb`
--

LOCK TABLES `celeb` WRITE;
/*!40000 ALTER TABLE `celeb` DISABLE KEYS */;
INSERT INTO `celeb` VALUES (1,'아이유','1993-05-16',29,'F','가수, 탤런트','EDAM엔터테이먼트'),(2,'이미주','1994-09-23',28,'F','가수','울림엔터테이먼트'),(3,'송강','1994-04-23',28,'M','탤런트','나무액터스'),(4,'강동원','1981-01-18',41,'M','영화배우, 탤런트','YG엔터테이먼트'),(5,'유재석','1972-08-14',50,'M','MC, 개그맨','안테나'),(6,'차승원','1970-06-07',48,'M','영화배우, 모델','YG엔터테이먼트'),(7,'이수현','1999-05-04',23,'F','가수','YG엔터테이먼트');
/*!40000 ALTER TABLE `celeb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-02  3:30:13
