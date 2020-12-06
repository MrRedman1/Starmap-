-- Host: localhost    Database: bsg2
-- ------------------------------------------------------
-- Server version	10.1.35-MariaDB

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
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE star(
star_identifier bigint(111) NOT NULL AUTO_INCREMENT,
star_name varchar(255) NOT NULL,
constell varchar (255) NOT NULL,
founder varchar (255) NOT NULL,
PRIMARY KEY (star_identifier)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
INSERT INTO `star` VALUES ('example_name_star','Duarkin', 'Unknown'),('Stephenson 2-18','Scutum', 'Charles Bruce Stephenson');
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star_identifier`
--

DROP TABLE IF EXISTS `star_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_identifier` (
  `star_id` bigint(111) NOT NULL DEFAULT '0',
  `constell_id` bigint(111) NOT NULL DEFAULT '0',
  `founder_id` bigint(111) NOT NULL DEFAULT '0', 
  PRIMARY KEY (`star_id`,`constell_id`,`founder_id`),
  KEY `star_id` (`star_id`),
  CONSTRAINT `star_identifier_ibfk_1` FOREIGN KEY (`star_id`) REFERENCES `star` (`star_identifier`),
  CONSTRAINT `star_identifier_ibfk_2` FOREIGN KEY (`star_id`) REFERENCES `constell` (`constell_identifier`),
  CONSTRAINT `star_identifier_ibfk_3` FOREIGN KEY (`star_id`) REFERENCES `founder` (`founder_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star_identifier`
--

LOCK TABLES `star_identifier` WRITE;
/*!40000 ALTER TABLE `star_identifier` DISABLE KEYS */;
INSERT INTO `star_identifier` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `star_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for constellation
--

DROP TABLE IF EXISTS `constell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE constell(
constell_identifier bigint(111) NOT NULL AUTO_INCREMENT,
constell_name varchar(255) NOT NULL,
PRIMARY KEY (constell_identifier)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for constellation
--

LOCK TABLES `constell` WRITE;
/*!40000 ALTER TABLE `constell` DISABLE KEYS */;
INSERT INTO `constell` VALUES ('Duarkin'),('Scutum');
/*!40000 ALTER TABLE `constell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for founder
--

DROP TABLE IF EXISTS `founder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE founder(
founder_identifier bigint(111) NOT NULL AUTO_INCREMENT,
founder_name varchar(255) NOT NULL,
PRIMARY KEY (founder_identifier)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for founder
--

LOCK TABLES `founder` WRITE;
/*!40000 ALTER TABLE `founder` DISABLE KEYS */;
INSERT INTO `founder` VALUES ('Unknown'),('Charles Bruce Stephenson');
/*!40000 ALTER TABLE `founder` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
