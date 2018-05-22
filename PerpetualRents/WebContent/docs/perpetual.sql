CREATE DATABASE  IF NOT EXISTS `perpetual` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `perpetual`;
-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: perpetual
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.12.04.1

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
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `username` varchar(45) NOT NULL,
  `authority` varchar(45) NOT NULL,
  PRIMARY KEY (`username`,`authority`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES ('admin1','ALL'),('con','ALL'),('con adpl','ALL'),('con1','ALL'),('con2','ALL'),('con3','ALL'),('lana','ALL'),('lana1','ALL'),('lana2','ALL'),('Nikhil_122','ALL'),('pmc','ALL'),('PMC1','ALL'),('pmc3','ALL'),('super','ALL'),('susanta','ALL');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_address`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `addressLine1` varchar(45) NOT NULL,
  `addressLine2` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `county` varchar(45) DEFAULT NULL,
  `landmark` varchar(45) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `objectType` int(11) NOT NULL,
  `objectId` int(11) NOT NULL,
  `postCode` varchar(45) NOT NULL,
  `countryId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_address`
--

LOCK TABLES `tbl_perpetualRents_address` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_address` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_address` VALUES (1,'2014-09-18 12:20:57',NULL,0,NULL,'11 Belgrave Road','Opal Drive','London','London','Word Vision UK',NULL,NULL,9,1,'SW1V 1RB',1),(2,'2014-09-19 05:38:24',NULL,1,NULL,'addressLine1','addressLine2','london','abc',NULL,NULL,NULL,3,1,'SE164RP',0),(3,'2014-09-19 05:39:44',NULL,0,NULL,'addressLine1','addressLine2','London',NULL,NULL,NULL,NULL,1,1,'se164rp',1),(4,'2014-09-19 05:40:32',NULL,3,NULL,'AddressKLine1',NULL,'London','London',NULL,NULL,NULL,4,1,'SE164RP',0),(5,'2014-09-22 04:08:25','2014-10-15 06:38:59',0,4,'addressLine1',NULL,'London','london',NULL,NULL,NULL,2,1,'se164r',0),(6,'2014-09-22 15:13:31',NULL,0,NULL,'Test lana1',NULL,'Bradfort','UK','no marks',NULL,NULL,1,2,'TYIO',1),(7,'2014-09-22 15:14:23',NULL,5,NULL,'vicky street',NULL,'Bradfort','test coumty',NULL,NULL,NULL,4,2,'oiyoyoyoy',0),(8,'2014-09-23 08:56:31',NULL,5,NULL,'Kelly Stret','Kelly building','Bradfort','kelly county',NULL,NULL,NULL,4,3,'797979779',0),(9,'2014-09-23 10:07:34',NULL,0,NULL,'UK',NULL,'Oxford','UK',NULL,NULL,NULL,2,2,'9797979797',0),(10,'2014-09-23 10:09:25',NULL,0,NULL,'Dan street',NULL,'London','UK',NULL,NULL,NULL,2,3,'uyouyo',0),(11,'2014-09-23 10:41:07',NULL,2,NULL,'Test street omc','2','Oxford','UK','no Marks',NULL,NULL,3,2,'oyoyoyo',0),(12,'2014-09-23 11:03:00',NULL,1,NULL,'Test Sub Admin Street','Building 2','UK','UK','No Marks',NULL,NULL,7,2,'ufuuytt',0),(13,'2014-09-23 11:05:32',NULL,5,NULL,'karl ster','Test','Lancaster','UK',NULL,NULL,NULL,4,4,'UYRUTII',0),(14,'2014-09-24 09:11:39',NULL,0,NULL,'Henry Street',NULL,'Chester','UK',NULL,NULL,NULL,2,4,'UIOKJ',0),(15,'2014-09-24 09:14:03',NULL,5,NULL,'Bryan Street',NULL,'Cambridge','test County',NULL,NULL,NULL,4,5,'UTYIUYYO',0),(16,'2014-09-24 09:33:56',NULL,0,NULL,'adpl street',NULL,'UK','uk',NULL,NULL,NULL,2,5,'iuyyyoyo',0),(17,'2014-09-24 09:37:19',NULL,0,NULL,'Lana 2 stret','hkg','Bradfort','uk',NULL,NULL,NULL,1,3,'YUOI',1),(18,'2014-09-24 09:40:02',NULL,12,NULL,'Ray Street',NULL,'Cambridge','UK',NULL,NULL,NULL,4,6,'OOHH',0),(19,'2014-09-24 11:12:53',NULL,5,NULL,'test','test','Bradfort','UK',NULL,NULL,NULL,4,7,'iyiyiy',0),(20,'2014-09-24 11:56:29',NULL,1,NULL,'Doogle street',NULL,'USA','UK','No Marks',NULL,NULL,3,3,'131313',0),(21,'2014-09-24 12:20:25',NULL,5,NULL,'test','test','Bradfort','hj',NULL,NULL,NULL,4,8,'rtyu',0),(22,'2014-09-24 18:23:32',NULL,0,NULL,'Test Add line 1','Test add line 2','Cambridge','Cambridgeshire',NULL,NULL,NULL,1,4,'CA33HU',1),(23,'2014-09-24 18:26:07',NULL,14,NULL,'House 4','Add line 1','London','London',NULL,NULL,NULL,4,9,'SE184RP',0),(24,'2014-09-29 06:38:58',NULL,0,NULL,'Chintan','Chintan','Chester','Chintan','Chintan',NULL,NULL,1,5,'se3123',1),(25,'2014-10-06 05:15:05',NULL,3,NULL,'addressLine1','addressLine1','Bradfort','Bradfort',NULL,NULL,NULL,4,10,'201301',0),(26,'2014-10-14 09:23:38',NULL,3,NULL,'a','a','Cambridge','a',NULL,NULL,NULL,4,11,'a',0);
/*!40000 ALTER TABLE `tbl_perpetualRents_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_admin`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `uniqueReference` varchar(45) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `enable` bit(1) NOT NULL DEFAULT b'1',
  `userLoginId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_admin`
--

LOCK TABLES `tbl_perpetualRents_admin` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_admin` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_admin` VALUES (1,'2014-09-18 12:22:37',NULL,0,NULL,'PRUKAD00198','Super','Admin','',1),(2,'2014-09-23 11:03:00',NULL,1,NULL,'PRUKAD11881','Admin','sub','',9);
/*!40000 ALTER TABLE `tbl_perpetualRents_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_applicationsession`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_applicationsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_applicationsession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(32) NOT NULL,
  `IPAddress` varchar(32) NOT NULL,
  `sessionIdentity` varchar(128) NOT NULL,
  `destroyedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sessionStatus` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_applicationsession`
--

LOCK TABLES `tbl_perpetualRents_applicationsession` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_applicationsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_perpetualRents_applicationsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_assignmodel`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_assignmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_assignmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `assignById` int(11) NOT NULL,
  `assignByTypeId` int(11) NOT NULL,
  `assignToId` int(11) NOT NULL,
  `assignToTypeId` int(11) NOT NULL,
  `cityId` int(11) NOT NULL,
  `propertyId` int(11) NOT NULL,
  `enable` bit(1) DEFAULT b'1',
  `statusId` int(5) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `estimatedCompletionDate` varchar(45) DEFAULT NULL,
  `estimatedCost` varchar(45) DEFAULT NULL,
  `functionalityId` int(5) DEFAULT NULL,
  `jobDescription` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assignById` (`assignById`,`assignByTypeId`,`assignToId`,`assignToTypeId`,`propertyId`,`functionalityId`),
  UNIQUE KEY `index3` (`functionalityId`,`propertyId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_assignmodel`
--

LOCK TABLES `tbl_perpetualRents_assignmodel` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_assignmodel` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_assignmodel` VALUES (1,'2014-09-24 10:02:58','2014-09-24 10:05:53',12,11,3,1,5,2,2,6,'',4,NULL,'27-SEP-2014','54',1,'hdashdasdhkahsdlashdlashdlhaslhdoidoieydhasbcbkbchsdfohfjsdbfbczxb,cbkjfkjdkjhdkgfkdsfksgdfkdsfbnbvcbvbjkfkjdshfoyorywoeyroefjdhfjshfsjfjsdhfjsdhjfhsdjhflsdhflhsdflhsddlhfsldhflsdhflhsdlhflsddhfhlsdhflshflsdfldskhflsdkhflsdkfhlsdkhfkldshflkshdflhsdlf'),(2,'2014-09-24 10:40:19','2014-09-24 13:55:40',5,6,2,1,2,2,1,3,'',4,NULL,'25-SEP-2014','2',2,'2'),(3,'2014-09-24 10:41:53','2014-09-24 14:01:07',5,6,2,1,2,2,1,3,'',4,NULL,'27-SEP-2014','23',3,'nbn'),(4,'2014-09-24 11:02:40','2014-09-24 19:25:10',5,7,2,1,3,2,5,4,'',4,NULL,'27-SEP-2014','23',3,'The process\nWe know that renting your property can be daunting task particularly for the first time investor. To make this easy we have a simple process which involves an online or telephone registration process, this site I only temporary as the mai'),(5,'2014-09-24 11:28:49','2014-09-24 11:29:32',5,11,2,1,5,2,1,7,'',4,NULL,'26-SEP-2014','32',7,'Any gas or oil programmable central heating ? 5Any gas or oil programmable central heating ? 5Any gas or oil programmable central heating ? 5Any gas or oil programmable central heating ? 5Any gas or oil programmable central heating ? 5Any gas or oil '),(6,'2014-09-24 11:33:34','2014-09-24 11:34:27',5,11,2,1,5,2,1,7,'',4,NULL,'27-SEP-2014','23233',9,'3'),(7,'2014-09-24 12:29:14','2014-09-24 12:31:05',5,7,2,1,3,2,5,4,'',4,NULL,'26-SEP-2014','23',1,'ytytytytyty'),(8,'2014-09-24 14:05:05','2014-09-24 14:09:08',5,6,2,1,2,2,2,5,'',4,NULL,'26-SEP-2014','225',1,'nmmnm'),(9,'2014-09-24 14:05:19','2014-09-24 14:08:37',5,6,2,1,2,2,2,5,'',4,NULL,'26-SEP-2014','23',4,'2'),(10,'2014-09-24 19:12:00','2014-10-15 10:58:56',14,4,4,1,1,2,6,9,'',4,NULL,'30-SEP-2014','50',1,'Is this the job we are talking about.'),(11,'2014-09-25 08:29:28','2014-09-25 08:30:01',5,6,2,1,2,2,1,3,'',4,NULL,'27-SEP-2014','25',1,'khkhkh'),(12,'2014-10-14 13:13:10',NULL,3,NULL,1,1,3,2,6,1,'',7,NULL,'16-OCT-2014','111',6,'1111111111');
/*!40000 ALTER TABLE `tbl_perpetualRents_assignmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_charity`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_charity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_charity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `companyName` varchar(45) NOT NULL,
  `authorisedPerson` varchar(45) NOT NULL,
  `uniqueReference` varchar(45) NOT NULL,
  `weburl` varchar(45) DEFAULT NULL,
  `enable` bit(1) DEFAULT b'1',
  `userLoginId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_charity`
--

LOCK TABLES `tbl_perpetualRents_charity` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_charity` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_charity` VALUES (1,'2014-09-19 05:38:24',NULL,1,NULL,'PCS','Chintan','PRUKPMC13959',NULL,'',2),(2,'2014-09-23 10:41:07',NULL,2,NULL,'PCS','himanshu','PRUKPMC14058',NULL,'',8),(3,'2014-09-24 11:56:29',NULL,1,NULL,'Doogle','Harry','PRUKPMC14157',NULL,'',13);
/*!40000 ALTER TABLE `tbl_perpetualRents_charity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_city`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(11) NOT NULL,
  `objectType` varchar(45) NOT NULL,
  `objectId` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city` (`city`,`objectType`,`objectId`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_city`
--

LOCK TABLES `tbl_perpetualRents_city` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_city` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_city` VALUES (1,'Bradfort','3','1'),(101,'Bradfort','3','2'),(205,'Bradfort','3','3'),(7,'Bradfort','5','1'),(57,'Bradfort','5','10'),(61,'Bradfort','5','11'),(65,'Bradfort','5','12'),(71,'Bradfort','5','13'),(77,'Bradfort','5','14'),(83,'Bradfort','5','15'),(89,'Bradfort','5','16'),(95,'Bradfort','5','17'),(109,'Bradfort','5','18'),(115,'Bradfort','5','19'),(13,'Bradfort','5','2'),(121,'Bradfort','5','20'),(127,'Bradfort','5','21'),(133,'Bradfort','5','22'),(139,'Bradfort','5','23'),(145,'Bradfort','5','24'),(151,'Bradfort','5','25'),(157,'Bradfort','5','26'),(163,'Bradfort','5','27'),(169,'Bradfort','5','28'),(175,'Bradfort','5','29'),(19,'Bradfort','5','3'),(181,'Bradfort','5','30'),(187,'Bradfort','5','31'),(193,'Bradfort','5','32'),(199,'Bradfort','5','33'),(25,'Bradfort','5','4'),(31,'Bradfort','5','5'),(37,'Bradfort','5','6'),(43,'Bradfort','5','7'),(49,'Bradfort','5','8'),(53,'Bradfort','5','9'),(105,'Bradfort','7','2'),(2,'Cambridge','3','1'),(102,'Cambridge','3','2'),(206,'Cambridge','3','3'),(8,'Cambridge','5','1'),(58,'Cambridge','5','10'),(62,'Cambridge','5','11'),(66,'Cambridge','5','12'),(72,'Cambridge','5','13'),(78,'Cambridge','5','14'),(84,'Cambridge','5','15'),(90,'Cambridge','5','16'),(96,'Cambridge','5','17'),(110,'Cambridge','5','18'),(116,'Cambridge','5','19'),(14,'Cambridge','5','2'),(122,'Cambridge','5','20'),(128,'Cambridge','5','21'),(134,'Cambridge','5','22'),(140,'Cambridge','5','23'),(146,'Cambridge','5','24'),(152,'Cambridge','5','25'),(158,'Cambridge','5','26'),(164,'Cambridge','5','27'),(170,'Cambridge','5','28'),(176,'Cambridge','5','29'),(20,'Cambridge','5','3'),(182,'Cambridge','5','30'),(188,'Cambridge','5','31'),(194,'Cambridge','5','32'),(200,'Cambridge','5','33'),(26,'Cambridge','5','4'),(32,'Cambridge','5','5'),(38,'Cambridge','5','6'),(44,'Cambridge','5','7'),(50,'Cambridge','5','8'),(54,'Cambridge','5','9'),(106,'Cambridge','7','2'),(3,'Chester','3','1'),(103,'Chester','3','2'),(207,'Chester','3','3'),(9,'Chester','5','1'),(59,'Chester','5','10'),(63,'Chester','5','11'),(67,'Chester','5','12'),(73,'Chester','5','13'),(79,'Chester','5','14'),(85,'Chester','5','15'),(91,'Chester','5','16'),(97,'Chester','5','17'),(111,'Chester','5','18'),(117,'Chester','5','19'),(15,'Chester','5','2'),(123,'Chester','5','20'),(129,'Chester','5','21'),(135,'Chester','5','22'),(141,'Chester','5','23'),(147,'Chester','5','24'),(153,'Chester','5','25'),(159,'Chester','5','26'),(165,'Chester','5','27'),(171,'Chester','5','28'),(177,'Chester','5','29'),(21,'Chester','5','3'),(183,'Chester','5','30'),(189,'Chester','5','31'),(195,'Chester','5','32'),(201,'Chester','5','33'),(27,'Chester','5','4'),(33,'Chester','5','5'),(39,'Chester','5','6'),(45,'Chester','5','7'),(51,'Chester','5','8'),(55,'Chester','5','9'),(107,'Chester','7','2'),(4,'Durham','3','1'),(104,'Durham','3','2'),(208,'Durham','3','3'),(10,'Durham','5','1'),(60,'Durham','5','10'),(64,'Durham','5','11'),(68,'Durham','5','12'),(74,'Durham','5','13'),(80,'Durham','5','14'),(86,'Durham','5','15'),(92,'Durham','5','16'),(98,'Durham','5','17'),(112,'Durham','5','18'),(118,'Durham','5','19'),(16,'Durham','5','2'),(124,'Durham','5','20'),(130,'Durham','5','21'),(136,'Durham','5','22'),(142,'Durham','5','23'),(148,'Durham','5','24'),(154,'Durham','5','25'),(160,'Durham','5','26'),(166,'Durham','5','27'),(172,'Durham','5','28'),(178,'Durham','5','29'),(22,'Durham','5','3'),(184,'Durham','5','30'),(190,'Durham','5','31'),(196,'Durham','5','32'),(202,'Durham','5','33'),(28,'Durham','5','4'),(34,'Durham','5','5'),(40,'Durham','5','6'),(46,'Durham','5','7'),(52,'Durham','5','8'),(56,'Durham','5','9'),(108,'Durham','7','2'),(5,'Lancaster','3','1'),(11,'Lancaster','5','1'),(69,'Lancaster','5','12'),(75,'Lancaster','5','13'),(81,'Lancaster','5','14'),(87,'Lancaster','5','15'),(93,'Lancaster','5','16'),(99,'Lancaster','5','17'),(113,'Lancaster','5','18'),(119,'Lancaster','5','19'),(17,'Lancaster','5','2'),(125,'Lancaster','5','20'),(131,'Lancaster','5','21'),(137,'Lancaster','5','22'),(143,'Lancaster','5','23'),(149,'Lancaster','5','24'),(155,'Lancaster','5','25'),(161,'Lancaster','5','26'),(167,'Lancaster','5','27'),(173,'Lancaster','5','28'),(179,'Lancaster','5','29'),(23,'Lancaster','5','3'),(185,'Lancaster','5','30'),(191,'Lancaster','5','31'),(197,'Lancaster','5','32'),(203,'Lancaster','5','33'),(29,'Lancaster','5','4'),(35,'Lancaster','5','5'),(41,'Lancaster','5','6'),(47,'Lancaster','5','7'),(6,'London','3','1'),(12,'London','5','1'),(70,'London','5','12'),(76,'London','5','13'),(82,'London','5','14'),(88,'London','5','15'),(94,'London','5','16'),(100,'London','5','17'),(114,'London','5','18'),(120,'London','5','19'),(18,'London','5','2'),(126,'London','5','20'),(132,'London','5','21'),(138,'London','5','22'),(144,'London','5','23'),(150,'London','5','24'),(156,'London','5','25'),(162,'London','5','26'),(168,'London','5','27'),(174,'London','5','28'),(180,'London','5','29'),(24,'London','5','3'),(186,'London','5','30'),(192,'London','5','31'),(198,'London','5','32'),(204,'London','5','33'),(30,'London','5','4'),(36,'London','5','5'),(42,'London','5','6'),(48,'London','5','7');
/*!40000 ALTER TABLE `tbl_perpetualRents_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_contactdetails`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_contactdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_contactdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `emailId` varchar(55) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `landlinePhoneNumber` varchar(20) DEFAULT NULL,
  `objectType` int(11) NOT NULL,
  `objectId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_contactdetails`
--

LOCK TABLES `tbl_perpetualRents_contactdetails` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_contactdetails` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_contactdetails` VALUES (1,'2014-09-18 12:21:03',NULL,1,NULL,'himanshu.v@perceptive-solutions.com','+44 0123456789','+440987654321',9,1),(2,'2014-09-19 05:38:24',NULL,1,NULL,'chintan.dhingra@perceptive-solutions.com','9896542295',NULL,3,1),(3,'2014-09-22 04:08:25',NULL,NULL,NULL,'chintan.dhingra@perceptive-solutions.com','9896542295',NULL,2,1),(4,'2014-09-23 10:07:34',NULL,NULL,NULL,'verma89@outlook.com','98979879799',NULL,2,2),(5,'2014-09-23 10:09:25',NULL,NULL,NULL,'req.henry@gmail.com','986986896998',NULL,2,3),(6,'2014-09-23 10:41:07',NULL,2,NULL,'himanshu@yahoo.in','9896542295',NULL,3,2),(7,'2014-09-23 11:03:00',NULL,1,NULL,'himanshu_vui@yahoo.in','9869669969',NULL,7,2),(8,'2014-09-24 09:11:39',NULL,NULL,NULL,'henry.mobistec@gmail.com','8688899898897898',NULL,2,4),(9,'2014-09-24 09:33:56',NULL,NULL,NULL,'himanshu_vui@yahoo.in','75999696999',NULL,2,5),(10,'2014-09-24 11:56:29',NULL,1,NULL,'himanshu_vui@yahoo.in','13131311313',NULL,3,3);
/*!40000 ALTER TABLE `tbl_perpetualRents_contactdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_contractor`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_contractor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_contractor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `uniqueReference` varchar(45) NOT NULL,
  `contactPerson` varchar(45) DEFAULT NULL,
  `companyName` varchar(45) DEFAULT NULL,
  `vatNo` varchar(45) DEFAULT NULL,
  `weburl` varchar(45) DEFAULT NULL,
  `enabled` bit(1) DEFAULT b'1',
  `userLoginId` int(11) NOT NULL,
  `statusId` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_contractor`
--

LOCK TABLES `tbl_perpetualRents_contractor` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_contractor` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_contractor` VALUES (1,'2014-09-22 04:08:25','2014-09-22 08:38:59',NULL,1,'PRUKC17920','Chintan','PCS123','chintan12',NULL,'',4,5),(2,'2014-09-23 10:07:34','2014-09-23 10:11:56',NULL,1,'PRUKC18019','Andy','Andy inc','9869696',NULL,'',6,5),(3,'2014-09-23 10:09:25','2014-09-23 10:12:02',NULL,1,'PRUKC18118','Dan','Dan Inc','986',NULL,'',7,5),(4,'2014-09-24 09:11:39','2014-09-24 09:11:57',NULL,1,'PRUKC18217','Henry','Henry inc','759959859',NULL,'',10,5),(5,'2014-09-24 09:33:56','2014-09-24 09:35:50',NULL,1,'PRUKC18316','New Addpl2','ADPL','585587585',NULL,'',11,5);
/*!40000 ALTER TABLE `tbl_perpetualRents_contractor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_conversation`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_conversation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUserId` int(11) DEFAULT NULL,
  `conversationIdentity` varchar(255) NOT NULL,
  `actorOneObjectTypeId` int(5) NOT NULL,
  `actorOneId` int(45) NOT NULL,
  `actorTwoObjectTypeId` int(5) NOT NULL,
  `actorTwoId` int(11) NOT NULL,
  `propertyId` varchar(50) DEFAULT NULL,
  `mailId1` varchar(50) DEFAULT NULL,
  `mailId2` varchar(50) DEFAULT NULL,
  `functionalityId` int(11) DEFAULT NULL,
  `jobsDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_conversation`
--

LOCK TABLES `tbl_perpetualRents_conversation` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_conversation` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_conversation` VALUES (3,'2014-09-22 09:09:29',3,'Quotation-Perpetual For Electrical Installation (PRUKL219700-PRUKC17920)',1,1,2,1,'1','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',1,'ppp'),(4,'2014-09-22 09:16:47',3,'Quotation-Perpetual For Electrical Test (PRUKL219700-PRUKC17920)',1,1,2,1,'1','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',2,'kya hua tera vada??'),(5,'2014-09-22 09:35:23',3,'Quotation-Perpetual For Gas Certificate (PRUKL219700-PRUKC17920)',1,1,2,1,'1','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',3,'Ana mere pyar ko na tum jootha samjho jana'),(6,'2014-09-22 09:53:10',3,'Quotation-Perpetual For Sketch Plan (PRUKL219700-PRUKC17920)',1,1,2,1,'1','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',7,'222222222222'),(7,'2014-09-22 11:00:10',2,'Interested In Your Property Situated at SE164RP(PRUKL219700-PRUKPMC13959)',3,1,1,1,'1','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',NULL,NULL),(8,'2014-09-22 14:31:03',3,'Quotation-Perpetual For Energy Performance (PRUKL219700-PRUKC17920)',1,1,2,1,'1','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',4,'hi whats up '),(9,'2014-09-22 14:33:25',3,'Quotation-Perpetual For Central Heating System (PRUKL219700-PRUKC17920)',1,1,2,1,'1','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',5,'lag araha hai na'),(10,'2014-09-23 10:13:00',5,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18019)',1,2,2,2,'3','himanshu8798@gmail.com','verma89@outlook.com',1,'hiiiiii'),(11,'2014-09-23 10:13:02',5,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18118)',1,2,2,3,'3','himanshu8798@gmail.com','req.henry@gmail.com',1,'hiiiiii'),(12,'2014-09-23 10:14:25',5,'Quotation-Perpetual For Gas Certificate (PRUKL219799-PRUKC18019)',1,2,2,2,'3','himanshu8798@gmail.com','verma89@outlook.com',3,'hellooooooo'),(13,'2014-09-23 10:14:28',5,'Quotation-Perpetual For Gas Certificate (PRUKL219799-PRUKC18118)',1,2,2,3,'3','himanshu8798@gmail.com','req.henry@gmail.com',3,'hellooooooo'),(14,'2014-09-23 10:14:41',5,'Quotation-Perpetual For Electrical Test (PRUKL219799-PRUKC18019)',1,2,2,2,'3','himanshu8798@gmail.com','verma89@outlook.com',2,'hellooooooo'),(15,'2014-09-23 10:44:09',8,'Interested In Your Property Situated at oiyoyoyoy(PRUKL219799-PRUKPMC14058)',3,2,1,2,'2','himanshu@yahoo.in','himanshu8798@gmail.com',NULL,NULL),(16,'2014-09-23 10:45:08',8,'Interested In Your Property Situated at 797979779(PRUKL219799-PRUKPMC14058)',3,2,1,2,'3','himanshu@yahoo.in','himanshu8798@gmail.com',NULL,NULL),(17,'2014-09-23 10:54:45',2,'Interested In Your Property Situated at oiyoyoyoy(PRUKL219799-PRUKPMC13959)',3,1,1,2,'2','chintan.dhingra@perceptive-solutions.com','himanshu8798@gmail.com',NULL,NULL),(18,'2014-09-23 11:06:02',5,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18118)',1,2,2,3,'4','himanshu8798@gmail.com','req.henry@gmail.com',1,'uuuuuuuuuuuu'),(19,'2014-09-24 09:08:30',5,'Quotation-Perpetual For Gas Certificate (PRUKL219799-PRUKC18118)',1,2,2,3,'4','himanshu8798@gmail.com','req.henry@gmail.com',3,'Hiii dan '),(20,'2014-09-24 09:08:45',5,'Quotation-Perpetual For Energy Performance (PRUKL219799-PRUKC18118)',1,2,2,3,'4','himanshu8798@gmail.com','req.henry@gmail.com',4,'Hiii dan '),(21,'2014-09-24 09:14:34',5,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18019)',1,2,2,2,'5','himanshu8798@gmail.com','verma89@outlook.com',1,'Hey i need a contractor'),(22,'2014-09-24 09:14:36',5,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18118)',1,2,2,3,'5','himanshu8798@gmail.com','req.henry@gmail.com',1,'Hey i need a contractor'),(23,'2014-09-24 09:14:39',5,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18217)',1,2,2,4,'5','himanshu8798@gmail.com','henry.mobistec@gmail.com',1,'Hey i need a contractor'),(24,'2014-09-24 09:15:41',5,'Quotation-Perpetual For Electrical Test (PRUKL219799-PRUKC18217)',1,2,2,4,'5','himanshu8798@gmail.com','henry.mobistec@gmail.com',2,'contractor hiiii hor r y'),(25,'2014-09-24 09:15:58',5,'Quotation-Perpetual For Gas Certificate (PRUKL219799-PRUKC18118)',1,2,2,3,'5','himanshu8798@gmail.com','req.henry@gmail.com',3,'no needddddd'),(26,'2014-09-24 09:16:00',5,'Quotation-Perpetual For Gas Certificate (PRUKL219799-PRUKC18217)',1,2,2,4,'5','himanshu8798@gmail.com','henry.mobistec@gmail.com',3,'no needddddd'),(27,'2014-09-24 09:16:14',5,'Quotation-Perpetual For Energy Performance (PRUKL219799-PRUKC18019)',1,2,2,2,'5','himanshu8798@gmail.com','verma89@outlook.com',4,'no needddddd'),(28,'2014-09-24 09:16:16',5,'Quotation-Perpetual For Energy Performance (PRUKL219799-PRUKC18217)',1,2,2,4,'5','himanshu8798@gmail.com','henry.mobistec@gmail.com',4,'no needddddd'),(29,'2014-09-24 09:16:28',5,'Quotation-Perpetual For Central Heating System (PRUKL219799-PRUKC18118)',1,2,2,3,'5','himanshu8798@gmail.com','req.henry@gmail.com',5,'no needddddd'),(30,'2014-09-24 09:16:38',5,'Quotation-Perpetual For Building Performance (PRUKL219799-PRUKC18217)',1,2,2,4,'5','himanshu8798@gmail.com','henry.mobistec@gmail.com',6,'no needddddd'),(31,'2014-09-24 09:40:34',12,'Quotation-Perpetual For Electrical Installation (PRUKL219898-PRUKC17920)',1,3,2,1,'6','himanshu8798@gmail.com','chintan.dhingra@perceptive-solutions.com',1,'hi al\n'),(32,'2014-09-24 09:40:36',12,'Quotation-Perpetual For Electrical Installation (PRUKL219898-PRUKC18019)',1,3,2,2,'6','himanshu8798@gmail.com','verma89@outlook.com',1,'hi al\n'),(33,'2014-09-24 09:40:39',12,'Quotation-Perpetual For Electrical Installation (PRUKL219898-PRUKC18118)',1,3,2,3,'6','himanshu8798@gmail.com','req.henry@gmail.com',1,'hi al\n'),(34,'2014-09-24 09:40:41',12,'Quotation-Perpetual For Electrical Installation (PRUKL219898-PRUKC18217)',1,3,2,4,'6','himanshu8798@gmail.com','henry.mobistec@gmail.com',1,'hi al\n'),(35,'2014-09-24 09:40:43',12,'Quotation-Perpetual For Electrical Installation (PRUKL219898-PRUKC18316)',1,3,2,5,'6','himanshu8798@gmail.com','himanshu_vui@yahoo.in',1,'hi al\n'),(36,'2014-09-24 09:41:25',12,'Quotation-Perpetual For Electrical Test (PRUKL219898-PRUKC17920)',1,3,2,1,'6','himanshu8798@gmail.com','chintan.dhingra@perceptive-solutions.com',2,'hi al\n'),(37,'2014-09-24 09:41:27',12,'Quotation-Perpetual For Electrical Test (PRUKL219898-PRUKC18019)',1,3,2,2,'6','himanshu8798@gmail.com','verma89@outlook.com',2,'hi al\n'),(38,'2014-09-24 09:41:29',12,'Quotation-Perpetual For Electrical Test (PRUKL219898-PRUKC18217)',1,3,2,4,'6','himanshu8798@gmail.com','henry.mobistec@gmail.com',2,'hi al\n'),(39,'2014-09-24 09:41:32',12,'Quotation-Perpetual For Electrical Test (PRUKL219898-PRUKC18316)',1,3,2,5,'6','himanshu8798@gmail.com','himanshu_vui@yahoo.in',2,'hi al\n'),(40,'2014-09-24 09:41:57',12,'Quotation-Perpetual For Sketch Plan (PRUKL219898-PRUKC18118)',1,3,2,3,'6','himanshu8798@gmail.com','req.henry@gmail.com',7,'hi al\n'),(41,'2014-09-24 09:42:00',12,'Quotation-Perpetual For Sketch Plan (PRUKL219898-PRUKC18217)',1,3,2,4,'6','himanshu8798@gmail.com','henry.mobistec@gmail.com',7,'hi al\n'),(42,'2014-09-24 09:42:02',12,'Quotation-Perpetual For Sketch Plan (PRUKL219898-PRUKC18316)',1,3,2,5,'6','himanshu8798@gmail.com','himanshu_vui@yahoo.in',7,'hi al\n'),(43,'2014-09-24 11:14:00',5,'Quotation-Perpetual For Periodic Inspection Of Water Supply (PRUKL219799-PRUKC18316)',1,2,2,5,'7','himanshu8798@gmail.com','himanshu_vui@yahoo.in',9,' '),(44,'2014-09-24 11:14:36',5,'Quotation-Perpetual For Sketch Plan (PRUKL219799-PRUKC18316)',1,2,2,5,'7','himanshu8798@gmail.com','himanshu_vui@yahoo.in',7,' '),(45,'2014-09-24 11:57:21',13,'Interested In Your Property Situated at oiyoyoyoy(PRUKL219799-PRUKPMC14157)',3,3,1,2,'2','himanshu_vui@yahoo.in','himanshu8798@gmail.com',NULL,NULL),(46,'2014-09-24 12:21:26',5,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC17920)',1,2,2,1,'8','himanshu8798@gmail.com','chintan.dhingra@perceptive-solutions.com',1,' hiiiiiii contrators'),(47,'2014-09-24 12:21:29',5,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18019)',1,2,2,2,'8','himanshu8798@gmail.com','verma89@outlook.com',1,' hiiiiiii contrators'),(48,'2014-09-24 12:21:31',5,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18118)',1,2,2,3,'8','himanshu8798@gmail.com','req.henry@gmail.com',1,' hiiiiiii contrators'),(49,'2014-09-24 12:21:34',5,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18316)',1,2,2,5,'8','himanshu8798@gmail.com','himanshu_vui@yahoo.in',1,' hiiiiiii contrators'),(50,'2014-09-24 18:27:36',14,'Quotation-Perpetual For Electrical Installation (PRUKL219997-PRUKC17920)',1,4,2,1,'9','nikhil_122@yahoo.com','chintan.dhingra@perceptive-solutions.com',1,'I need a boiler replacement quotation, The boiler is model number abcd '),(51,'2014-09-24 18:27:39',14,'Quotation-Perpetual For Electrical Installation (PRUKL219997-PRUKC18118)',1,4,2,3,'9','nikhil_122@yahoo.com','req.henry@gmail.com',1,'I need a boiler replacement quotation, The boiler is model number abcd '),(52,'2014-09-24 18:27:41',14,'Quotation-Perpetual For Electrical Installation (PRUKL219997-PRUKC18217)',1,4,2,4,'9','nikhil_122@yahoo.com','henry.mobistec@gmail.com',1,'I need a boiler replacement quotation, The boiler is model number abcd '),(53,'2014-09-24 18:27:44',14,'Quotation-Perpetual For Electrical Installation (PRUKL219997-PRUKC18316)',1,4,2,5,'9','nikhil_122@yahoo.com','himanshu_vui@yahoo.in',1,'I need a boiler replacement quotation, The boiler is model number abcd '),(54,'2014-09-24 19:40:24',8,'Interested In Your Property Situated at rtyu(PRUKL219799-PRUKPMC14058)',3,2,1,2,'8','himanshu@yahoo.in','himanshu8798@gmail.com',NULL,NULL),(55,'2014-10-08 08:55:20',3,'Quotation-Perpetual For Building Performance (PRUKL219700-PRUKC17920)',1,1,2,1,'1','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',6,'hello'),(56,'2014-10-08 08:55:26',3,'Quotation-Perpetual For Building Performance (PRUKL219700-PRUKC18118)',1,1,2,3,'1','chintan.dhingra@perceptive-solutions.com','req.henry@gmail.com',6,'hello'),(57,'2014-10-08 08:56:16',3,'Quotation-Perpetual For Periodic Inspection Of Water Supply (PRUKL219700-PRUKC18316)',1,1,2,5,'1','chintan.dhingra@perceptive-solutions.com','himanshu_vui@yahoo.in',9,'safe water supply'),(58,'2014-10-11 11:48:30',3,'Quotation-Perpetual For Asbestos Survey (PRUKL219700-PRUKC18316)',1,1,2,5,'1','chintan.dhingra@perceptive-solutions.com','himanshu_vui@yahoo.in',8,'11'),(59,'2014-10-11 12:13:21',3,'Quotation-Perpetual For Electrical Installation (PRUKL219700-PRUKC18316)',1,1,2,5,'1','chintan.dhingra@perceptive-solutions.com','himanshu_vui@yahoo.in',1,'aaaa'),(60,'2014-10-11 12:35:08',3,'Quotation-Perpetual For Electrical Installation (PRUKL219700-PRUKC18118)',1,1,2,3,'1','chintan.dhingra@perceptive-solutions.com','req.henry@gmail.com',1,'aaaa');
/*!40000 ALTER TABLE `tbl_perpetualRents_conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_country`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `countryName` varchar(45) NOT NULL,
  `countryAlias` varchar(45) NOT NULL,
  `countryCode` varchar(45) NOT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `timezone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_country`
--

LOCK TABLES `tbl_perpetualRents_country` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_country` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_country` VALUES (1,'2014-06-28 08:41:37',NULL,1,NULL,'United Kingdom','UK','UK','GBP','BST');
/*!40000 ALTER TABLE `tbl_perpetualRents_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_documents`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `fileName` varchar(45) NOT NULL,
  `contractorId` int(11) NOT NULL,
  `propertyId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `documentTypeId` int(5) NOT NULL,
  `functionalityId` int(11) DEFAULT NULL,
  `statusId` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_documents`
--

LOCK TABLES `tbl_perpetualRents_documents` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_documents` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_documents` VALUES (1,'2014-10-08 07:14:44',4,NULL,NULL,'abc.png',1,9,5,1,1,11),(2,'2014-10-08 07:16:34',4,NULL,NULL,'abc.png',1,9,6,1,1,11),(3,'2014-10-08 08:37:03',4,NULL,NULL,'1977158_776244719052826_576846881_n.jpg',1,9,9,2,1,11),(4,'2014-10-08 08:38:04',4,NULL,NULL,'abc.png',1,9,10,2,1,11),(5,'2014-10-08 08:38:57',4,NULL,NULL,'abc.png',1,9,11,2,1,11),(6,'2014-10-08 08:39:03',4,NULL,NULL,'cute-parrots-hd-wallpaper.jpg',1,9,12,1,1,11),(7,'2014-10-15 10:59:12',4,NULL,NULL,'1891187_275191805970653_1405402991_n.jpg',1,9,60,2,1,11),(8,'2014-10-15 10:59:20',4,NULL,NULL,'1977158_776244719052826_576846881_n.jpg',1,9,61,1,1,11);
/*!40000 ALTER TABLE `tbl_perpetualRents_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_expertise`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_expertise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_expertise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `functionalityId` int(5) NOT NULL,
  `qualification` varchar(45) NOT NULL,
  `referenceOwnerName1` varchar(45) NOT NULL,
  `referenceOwnerName2` varchar(45) NOT NULL,
  `referenceOwnerContact1` varchar(45) DEFAULT NULL,
  `referenceOwnerContact2` varchar(45) DEFAULT NULL,
  `referenceCompletionDate1` varchar(45) NOT NULL,
  `referenceCompletionDate2` varchar(45) NOT NULL,
  `trainingPlace` varchar(45) NOT NULL,
  `experienceYears` varchar(45) NOT NULL,
  `enable` bit(1) DEFAULT b'1',
  `contractorId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_expertise`
--

LOCK TABLES `tbl_perpetualRents_expertise` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_expertise` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_expertise` VALUES (1,'2014-09-22 04:08:25',NULL,NULL,NULL,1,'B.Tech','owner1','owner1',NULL,NULL,'19-SEP-2014','11-SEP-2014','London','0.6+','',1),(2,'2014-09-22 04:08:25',NULL,NULL,NULL,2,'B.Tech','owner1','owner1',NULL,NULL,'19-SEP-2014','11-SEP-2014','London','0.6+','',1),(3,'2014-09-22 04:08:25',NULL,NULL,NULL,3,'B.Tech','owner1','owner1',NULL,NULL,'19-SEP-2014','11-SEP-2014','London','0.6+','',1),(4,'2014-09-22 04:08:25',NULL,NULL,NULL,4,'B.Tech','owner1','owner1',NULL,NULL,'19-SEP-2014','11-SEP-2014','London','0.6+','',1),(5,'2014-09-22 04:08:25',NULL,NULL,NULL,5,'B.Tech','owner1','owner1',NULL,NULL,'19-SEP-2014','11-SEP-2014','London','0.6+','',1),(6,'2014-09-22 04:08:25',NULL,NULL,NULL,6,'B.Tech','owner1','owner1',NULL,NULL,'19-SEP-2014','11-SEP-2014','London','0.6+','',1),(7,'2014-09-22 04:08:25',NULL,NULL,NULL,7,'B.Tech','owner1','owner1',NULL,NULL,'19-SEP-2014','11-SEP-2014','London','0.6+','',1),(8,'2014-09-23 10:07:34',NULL,NULL,NULL,1,'Btech','Test','Test',NULL,NULL,'18-SEP-2014','23-SEP-2014','UK','1+','',2),(9,'2014-09-23 10:07:34',NULL,NULL,NULL,2,'Btech','Test','Test',NULL,NULL,'18-SEP-2014','23-SEP-2014','UK','1+','',2),(10,'2014-09-23 10:07:34',NULL,NULL,NULL,3,'Btech','Test','Test',NULL,NULL,'18-SEP-2014','23-SEP-2014','UK','1+','',2),(11,'2014-09-23 10:07:34',NULL,NULL,NULL,4,'Btech','Test','Test',NULL,NULL,'18-SEP-2014','23-SEP-2014','UK','1+','',2),(12,'2014-09-23 10:09:25',NULL,NULL,NULL,1,'ITUS','Test','Test',NULL,NULL,'16-SEP-2014','04-SEP-2014','UK','1+','',3),(13,'2014-09-23 10:09:25',NULL,NULL,NULL,3,'ITUS','Test','Test',NULL,NULL,'16-SEP-2014','04-SEP-2014','UK','1+','',3),(14,'2014-09-23 10:09:25',NULL,NULL,NULL,4,'ITUS','Test','Test',NULL,NULL,'16-SEP-2014','04-SEP-2014','UK','1+','',3),(15,'2014-09-23 10:09:25',NULL,NULL,NULL,5,'ITUS','Test','Test',NULL,NULL,'16-SEP-2014','04-SEP-2014','UK','1+','',3),(16,'2014-09-23 10:09:25',NULL,NULL,NULL,6,'ITUS','Test','Test',NULL,NULL,'16-SEP-2014','04-SEP-2014','UK','1+','',3),(17,'2014-09-23 10:09:25',NULL,NULL,NULL,7,'ITUS','Test','Test',NULL,NULL,'16-SEP-2014','04-SEP-2014','UK','1+','',3),(18,'2014-09-24 09:11:39',NULL,NULL,NULL,1,'ITUS','Test','Test','1235646463323',NULL,'11-SEP-2014','04-SEP-2014','UK','0.6+','',4),(19,'2014-09-24 09:11:39',NULL,NULL,NULL,2,'ITUS','Test','Test','1235646463323',NULL,'11-SEP-2014','04-SEP-2014','UK','0.6+','',4),(20,'2014-09-24 09:11:39',NULL,NULL,NULL,3,'ITUS','Test','Test','1235646463323',NULL,'11-SEP-2014','04-SEP-2014','UK','0.6+','',4),(21,'2014-09-24 09:11:39',NULL,NULL,NULL,4,'ITUS','Test','Test','1235646463323',NULL,'11-SEP-2014','04-SEP-2014','UK','0.6+','',4),(22,'2014-09-24 09:11:39',NULL,NULL,NULL,5,'ITUS','Test','Test','1235646463323',NULL,'11-SEP-2014','04-SEP-2014','UK','0.6+','',4),(23,'2014-09-24 09:11:39',NULL,NULL,NULL,6,'ITUS','Test','Test','1235646463323',NULL,'11-SEP-2014','04-SEP-2014','UK','0.6+','',4),(24,'2014-09-24 09:11:39',NULL,NULL,NULL,7,'ITUS','Test','Test','1235646463323',NULL,'11-SEP-2014','04-SEP-2014','UK','0.6+','',4),(25,'2014-09-24 09:33:56',NULL,NULL,NULL,1,'oo','test','test',NULL,NULL,'12-SEP-2014','04-SEP-2014','UK','0.6+','',5),(26,'2014-09-24 09:33:56',NULL,NULL,NULL,2,'oo','test','test',NULL,NULL,'12-SEP-2014','04-SEP-2014','UK','0.6+','',5),(27,'2014-09-24 09:33:56',NULL,NULL,NULL,3,'oo','test','test',NULL,NULL,'12-SEP-2014','04-SEP-2014','UK','0.6+','',5),(28,'2014-09-24 09:33:56',NULL,NULL,NULL,4,'oo','test','test',NULL,NULL,'12-SEP-2014','04-SEP-2014','UK','0.6+','',5),(29,'2014-09-24 09:33:56',NULL,NULL,NULL,5,'oo','test','test',NULL,NULL,'12-SEP-2014','04-SEP-2014','UK','0.6+','',5),(30,'2014-09-24 09:33:56',NULL,NULL,NULL,6,'oo','test','test',NULL,NULL,'12-SEP-2014','04-SEP-2014','UK','0.6+','',5),(31,'2014-09-24 09:33:56',NULL,NULL,NULL,7,'oo','test','test',NULL,NULL,'12-SEP-2014','04-SEP-2014','UK','0.6+','',5),(32,'2014-09-24 09:33:56',NULL,NULL,NULL,8,'oo','test','test',NULL,NULL,'12-SEP-2014','04-SEP-2014','UK','0.6+','',5),(33,'2014-09-24 09:33:56',NULL,NULL,NULL,9,'oo','test','test',NULL,NULL,'12-SEP-2014','04-SEP-2014','UK','0.6+','',5);
/*!40000 ALTER TABLE `tbl_perpetualRents_expertise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_file`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUserId` int(11) DEFAULT NULL,
  `filePath` varchar(9999) NOT NULL,
  `fileName` mediumtext NOT NULL,
  `contentType` varchar(255) NOT NULL,
  `documentType` int(5) NOT NULL,
  `objectType` int(5) DEFAULT NULL,
  `objectId` int(11) NOT NULL,
  `size` int(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_file`
--

LOCK TABLES `tbl_perpetualRents_file` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_file` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_file` VALUES (1,'2014-10-14 11:05:51',3,'uploadFiles/2014/October/PRUKP31483/9-14-12-5-105-article-2538222-1A97DEF100000578-380_964x952.jpg','article-2538222-1A97DEF100000578-380_964x952.jpg','image/jpeg',3,6,9,98658),(2,'2014-10-14 11:05:51',3,'uploadFiles/2014/October/PRUKP31483/9-14-12-5-113-best-places-in-the-world-gallery-halloween-monsters-wallpers-of-280756.jpg','best-places-in-the-world-gallery-halloween-monsters-wallpers-of-280756.jpg','image/jpeg',3,6,9,280756),(3,'2014-10-14 11:05:51',3,'uploadFiles/2014/October/PRUKP31483/9-14-12-5-115-computer-hd-wallpapers-10.jpg','computer-hd-wallpapers-10.jpg','image/jpeg',3,6,9,284343),(4,'2014-10-14 11:05:51',3,'uploadFiles/2014/October/PRUKP31483/9-14-12-5-117-cute-parrots-hd-wallpaper.jpg','cute-parrots-hd-wallpaper.jpg','image/jpeg',3,6,9,515361),(5,'2014-10-14 11:05:51',3,'uploadFiles/2014/October/PRUKP31483/9-14-12-5-118-golden-temple-in-night.jpg','golden-temple-in-night.jpg','image/jpeg',3,6,9,234427),(6,'2014-10-14 11:05:51',3,'uploadFiles/2014/October/PRUKP31483/9-14-12-5-120-Hare krishna HD Wallpapers.jpg','Hare krishna HD Wallpapers.jpg','image/jpeg',3,6,9,447948),(7,'2014-10-14 11:05:51',3,'uploadFiles/2014/October/PRUKP31483/9-14-12-5-121-HD-Wallpapers-Desktop-Car-Background-HD-Wallpapers.jpg','HD-Wallpapers-Desktop-Car-Background-HD-Wallpapers.jpg','image/jpeg',3,6,9,1240807),(8,'2014-10-14 13:14:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-14-726-golden-temple-in-night.jpg','golden-temple-in-night.jpg','image/jpeg',1,4,10,234427),(9,'2014-10-14 13:14:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-14-730-214201474724PM_superdongle_hb.jpg','214201474724PM_superdongle_hb.jpg','image/jpeg',1,4,10,39003),(10,'2014-10-14 13:14:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-14-732-cute-parrots-hd-wallpaper.jpg','cute-parrots-hd-wallpaper.jpg','image/jpeg',1,4,10,515361),(11,'2014-10-14 13:14:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-14-735-HD-Wallpapers-Desktop-Car-Background-HD-Wallpapers.jpg','HD-Wallpapers-Desktop-Car-Background-HD-Wallpapers.jpg','image/jpeg',1,4,10,1240807),(12,'2014-10-14 13:14:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-14-739-images.jpeg','images.jpeg','image/jpeg',1,4,10,8004),(13,'2014-10-14 13:14:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-14-742-computer-hd-wallpapers-10.jpg','computer-hd-wallpapers-10.jpg','image/jpeg',1,4,10,284343),(14,'2014-10-14 13:14:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-14-746-article-2538222-1A97DEF100000578-380_964x952.jpg','article-2538222-1A97DEF100000578-380_964x952.jpg','image/jpeg',1,4,10,98658),(15,'2014-10-14 13:14:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-14-750-HD-Wallpapers-Desktop-Car-Background-HD-Wallpapers.jpg','HD-Wallpapers-Desktop-Car-Background-HD-Wallpapers.jpg','image/jpeg',1,4,10,1240807),(16,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-39-abc.png','abc.png','image/png',3,6,8,241646),(17,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-40-article-2538222-1A97DEF100000578-380_964x952.jpg','article-2538222-1A97DEF100000578-380_964x952.jpg','image/jpeg',3,6,8,98658),(18,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-41-best-places-in-the-world-gallery-halloween-monsters-wallpers-of-280756.jpg','best-places-in-the-world-gallery-halloween-monsters-wallpers-of-280756.jpg','image/jpeg',3,6,8,280756),(19,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-42-computer-hd-wallpapers-10.jpg','computer-hd-wallpapers-10.jpg','image/jpeg',3,6,8,284343),(20,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-43-cute-parrots-hd-wallpaper.jpg','cute-parrots-hd-wallpaper.jpg','image/jpeg',3,6,8,515361),(21,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-45-golden-temple-in-night.jpg','golden-temple-in-night.jpg','image/jpeg',3,6,8,234427),(22,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-46-Hare krishna HD Wallpapers.jpg','Hare krishna HD Wallpapers.jpg','image/jpeg',3,6,8,447948),(23,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-48-HD-Wallpapers-Desktop-Car-Background-HD-Wallpapers.jpg','HD-Wallpapers-Desktop-Car-Background-HD-Wallpapers.jpg','image/jpeg',3,6,8,1240807),(24,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-52-images.jpeg','images.jpeg','image/jpeg',3,6,8,8004),(25,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-54-Login2013-11-28 05:58:50.png','Login2013-11-28 05:58:50.png','image/png',3,6,8,163559),(26,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-57-NOMURA_Its_The_End_Ofd96ff698a0773434c6449cf131a97e81.jpeg','NOMURA_It\'s_The_End_Ofd96ff698a0773434c6449cf131a97e81.jpeg','image/jpeg',3,6,8,27358),(27,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-59-pixars_up_hd_wide-wide.jpg','pixars_up_hd_wide-wide.jpg','image/jpeg',3,6,8,1380194),(28,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-62-Screenshot from 2013-11-29 05:26:14.png','Screenshot from 2013-11-29 05:26:14.png','image/png',3,6,8,266795),(29,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-64-Screenshot from 2013-11-29 05:33:55.png','Screenshot from 2013-11-29 05:33:55.png','image/png',3,6,8,244136),(30,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-66-Screenshot from 2013-11-29 05:43:01.png','Screenshot from 2013-11-29 05:43:01.png','image/png',3,6,8,259982),(31,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-68-Screenshot from 2014-01-02 08:34:26.png','Screenshot from 2014-01-02 08:34:26.png','image/png',3,6,8,170325),(32,'2014-10-14 13:15:51',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-15-69-Screenshot from 2014-05-16 11:52:04.png','Screenshot from 2014-05-16 11:52:04.png','image/png',3,6,8,204990),(33,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-192-abc.png','abc.png','image/png',3,6,8,241646),(34,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-197-article-2538222-1A97DEF100000578-380_964x952.jpg','article-2538222-1A97DEF100000578-380_964x952.jpg','image/jpeg',3,6,8,98658),(35,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-198-best-places-in-the-world-gallery-halloween-monsters-wallpers-of-280756.jpg','best-places-in-the-world-gallery-halloween-monsters-wallpers-of-280756.jpg','image/jpeg',3,6,8,280756),(36,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-200-computer-hd-wallpapers-10.jpg','computer-hd-wallpapers-10.jpg','image/jpeg',3,6,8,284343),(37,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-201-cute-parrots-hd-wallpaper.jpg','cute-parrots-hd-wallpaper.jpg','image/jpeg',3,6,8,515361),(38,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-203-golden-temple-in-night.jpg','golden-temple-in-night.jpg','image/jpeg',3,6,8,234427),(39,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-204-Hare krishna HD Wallpapers.jpg','Hare krishna HD Wallpapers.jpg','image/jpeg',3,6,8,447948),(40,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-206-HD-Wallpapers-Desktop-Car-Background-HD-Wallpapers.jpg','HD-Wallpapers-Desktop-Car-Background-HD-Wallpapers.jpg','image/jpeg',3,6,8,1240807),(41,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-209-images.jpeg','images.jpeg','image/jpeg',3,6,8,8004),(42,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-212-Login2013-11-28 05:58:50.png','Login2013-11-28 05:58:50.png','image/png',3,6,8,163559),(43,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-214-NOMURA_Its_The_End_Ofd96ff698a0773434c6449cf131a97e81.jpeg','NOMURA_It\'s_The_End_Ofd96ff698a0773434c6449cf131a97e81.jpeg','image/jpeg',3,6,8,27358),(44,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-215-pixars_up_hd_wide-wide.jpg','pixars_up_hd_wide-wide.jpg','image/jpeg',3,6,8,1380194),(45,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-218-Screenshot from 2013-11-29 05:26:14.png','Screenshot from 2013-11-29 05:26:14.png','image/png',3,6,8,266795),(46,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-220-Screenshot from 2013-11-29 05:33:55.png','Screenshot from 2013-11-29 05:33:55.png','image/png',3,6,8,244136),(47,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-221-Screenshot from 2013-11-29 05:43:01.png','Screenshot from 2013-11-29 05:43:01.png','image/png',3,6,8,259982),(48,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-223-Screenshot from 2014-01-02 08:34:26.png','Screenshot from 2014-01-02 08:34:26.png','image/png',3,6,8,170325),(49,'2014-10-14 13:17:42',3,'uploadFiles/2014/October/PRUKP31384/9-14-14-17-225-Screenshot from 2014-05-16 11:52:04.png','Screenshot from 2014-05-16 11:52:04.png','image/png',3,6,8,204990),(50,'2014-10-14 13:23:22',3,'uploadFiles/2014/October/PRUKP30493/9-14-14-23-948-best-places-in-the-world-gallery-halloween-monsters-wallpers-of-280756.jpg','best-places-in-the-world-gallery-halloween-monsters-wallpers-of-280756.jpg','image/jpeg',3,6,1,280756),(51,'2014-10-14 13:23:22',3,'uploadFiles/2014/October/PRUKP30493/9-14-14-23-954-computer-hd-wallpapers-10.jpg','computer-hd-wallpapers-10.jpg','image/jpeg',3,6,1,284343),(52,'2014-10-14 13:23:22',3,'uploadFiles/2014/October/PRUKP30493/9-14-14-23-956-cute-parrots-hd-wallpaper.jpg','cute-parrots-hd-wallpaper.jpg','image/jpeg',3,6,1,515361),(53,'2014-10-14 13:23:22',3,'uploadFiles/2014/October/PRUKP30493/9-14-14-23-958-golden-temple-in-night.jpg','golden-temple-in-night.jpg','image/jpeg',3,6,1,234427),(54,'2014-10-14 13:23:22',3,'uploadFiles/2014/October/PRUKP30493/9-14-14-23-959-Hare krishna HD Wallpapers.jpg','Hare krishna HD Wallpapers.jpg','image/jpeg',3,6,1,447948),(55,'2014-10-14 13:23:22',3,'uploadFiles/2014/October/PRUKP30493/9-14-14-23-961-HD-Wallpapers-Desktop-Car-Background-HD-Wallpapers.jpg','HD-Wallpapers-Desktop-Car-Background-HD-Wallpapers.jpg','image/jpeg',3,6,1,1240807),(56,'2014-10-14 13:23:22',3,'uploadFiles/2014/October/PRUKP30493/9-14-14-23-964-images.jpeg','images.jpeg','image/jpeg',3,6,1,8004),(57,'2014-10-14 13:23:22',3,'uploadFiles/2014/October/PRUKP30493/9-14-14-23-965-Login2013-11-28 05:58:50.png','Login2013-11-28 05:58:50.png','image/png',3,6,1,163559),(58,'2014-10-14 13:23:22',3,'uploadFiles/2014/October/PRUKP30493/9-14-14-23-966-NOMURA_Its_The_End_Ofd96ff698a0773434c6449cf131a97e81.jpeg','NOMURA_It\'s_The_End_Ofd96ff698a0773434c6449cf131a97e81.jpeg','image/jpeg',3,6,1,27358),(59,'2014-10-15 10:59:05',4,'uploadFiles/2014/October/CommonFolder/9-15-11-59-397-article-2538222-1A97DEF100000578-380_964x952.jpg','article-2538222-1A97DEF100000578-380_964x952.jpg','image/jpeg',2,2,1,98658),(60,'2014-10-15 10:59:12',4,'uploadFiles/2014/October/CommonFolder/9-15-11-59-414-1891187_275191805970653_1405402991_n.jpg','1891187_275191805970653_1405402991_n.jpg','image/jpeg',2,2,1,68428),(61,'2014-10-15 10:59:20',4,'uploadFiles/2014/October/CommonFolder/9-15-11-59-909-1977158_776244719052826_576846881_n.jpg','1977158_776244719052826_576846881_n.jpg','image/jpeg',1,2,1,141504);
/*!40000 ALTER TABLE `tbl_perpetualRents_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_identitygenerator`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_identitygenerator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_identitygenerator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `objective` varchar(45) NOT NULL,
  `prefix` varchar(45) NOT NULL,
  `identityNumber` varchar(45) NOT NULL,
  `length` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `objective` (`objective`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_identitygenerator`
--

LOCK TABLES `tbl_perpetualRents_identitygenerator` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_identitygenerator` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_identitygenerator` VALUES (1,0,9999999,'LandLord','PRUKL','209998',5),(2,0,9999999,'Contractor','PRUKC','8218',5),(3,0,9999999,'Property','PRUKP','21385',5),(4,0,9999999,'Pmc','PRUKPMC','4059',5),(5,0,9999999,'Admin','PRUKAD','1783',5);
/*!40000 ALTER TABLE `tbl_perpetualRents_identitygenerator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_landlord`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_landlord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_landlord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `uniqueReference` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `primaryEmailId` varchar(45) NOT NULL,
  `secondaryEmailId` varchar(45) DEFAULT NULL,
  `primaryPhoneNumber` varchar(45) NOT NULL,
  `secondaryPhoneNumber` varchar(45) DEFAULT NULL,
  `enable` bit(1) NOT NULL DEFAULT b'1',
  `userLoginId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueReference` (`uniqueReference`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_landlord`
--

LOCK TABLES `tbl_perpetualRents_landlord` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_landlord` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_landlord` VALUES (1,'2014-09-19 05:39:44',NULL,NULL,NULL,'PRUKL219700','Chintan','Dhingra','chintan.dhingra@perceptive-solutions.com',NULL,'9896542295',NULL,'',3),(2,'2014-09-22 15:13:31',NULL,NULL,NULL,'PRUKL219799','himanshu','Verma','himanshu8798@gmail.com',NULL,'788888888888888',NULL,'',5),(3,'2014-09-24 09:37:19',NULL,NULL,NULL,'PRUKL219898','Himanshu','Verma','himanshu8798@gmail.com',NULL,'87979779797979799',NULL,'',12),(4,'2014-09-24 18:23:32',NULL,NULL,NULL,'PRUKL219997','Test ','Nikhil','nikhil_122@yahoo.com','nkjhjkh@hjh.com','09766556566','09887687687','',14),(5,'2014-09-29 06:38:58',NULL,NULL,NULL,'PRUKL220096','Chintan','Dhingra','chintan@gmail.com','chintan@gmail.com','889898989898','98998989898','',15);
/*!40000 ALTER TABLE `tbl_perpetualRents_landlord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_mail`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `mailBody` mediumtext NOT NULL,
  `mailFrom` varchar(100) NOT NULL,
  `mailTo` varchar(100) NOT NULL,
  `attachmentCount` int(11) DEFAULT '0',
  `mailFlowType` tinyint(4) DEFAULT NULL,
  `mailEventType` tinyint(4) DEFAULT NULL,
  `mailEventActor` tinyint(4) DEFAULT NULL,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mailMessageId` varchar(50) DEFAULT NULL,
  `mailMessageReference` text,
  `mailOrigin` varchar(100) NOT NULL,
  `receivedOn` varchar(255) DEFAULT NULL,
  `conversationId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_mail`
--

LOCK TABLES `tbl_perpetualRents_mail` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_mail` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_mail` VALUES (1,'Quotation-Perpetual For Electrical Installation (PRUKL219700-PRUKC17920)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE164RP</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>ppp</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-22 09:09:49',NULL,NULL,'perpetual.rents@gmail.com',NULL,3),(2,'Quotation-Perpetual For Electrical Test (PRUKL219700-PRUKC17920)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE164RP</span></strong> for <strong><span>Electrical Test</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>kya hua tera vada??</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-22 09:16:54',NULL,NULL,'perpetual.rents@gmail.com',NULL,4),(3,'Quotation-Perpetual For Electrical Test (PRUKL219700-PRUKC17920)','hi','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-22 09:17:25',NULL,NULL,'perpetual.rents@gmail.com',NULL,4),(4,'Quotation-Perpetual For Electrical Installation (PRUKL219700-PRUKC17920)','jj','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-22 09:19:37',NULL,NULL,'perpetual.rents@gmail.com',NULL,3),(5,'Quotation-Perpetual For Electrical Installation (PRUKL219700-PRUKC17920)','hello','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-22 09:28:42',NULL,NULL,'perpetual.rents@gmail.com',NULL,3),(6,'Quotation-Perpetual For Electrical Installation (PRUKL219700-PRUKC17920)','458855','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-22 09:29:42',NULL,NULL,'perpetual.rents@gmail.com',NULL,3),(7,'Quotation-Perpetual For Gas Certificate (PRUKL219700-PRUKC17920)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE164RP</span></strong> for <strong><span>Gas Certificate</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>Ana mere pyar ko na tum jootha samjho jana</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-22 09:35:28',NULL,NULL,'perpetual.rents@gmail.com',NULL,5),(8,'Quotation-Perpetual For Sketch Plan (PRUKL219700-PRUKC17920)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE164RP</span></strong> for <strong><span>Sketch Plan</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>222222222222</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-22 09:53:15',NULL,NULL,'perpetual.rents@gmail.com',NULL,6),(9,'Interested In Your Property Situated at SE164RP(PRUKL219700-PRUKPMC13959)','asbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurveyasbestosSurvey','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,5,'2014-09-22 11:00:16',NULL,NULL,'perpetual.rents@gmail.com',NULL,7),(10,'Quotation-Perpetual For Energy Performance (PRUKL219700-PRUKC17920)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE164RP</span></strong> for <strong><span>Energy Performance</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hi whats up </span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-22 14:31:06',NULL,NULL,'perpetual.rents@gmail.com',NULL,8),(11,'Quotation-Perpetual For Central Heating System (PRUKL219700-PRUKC17920)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE164RP</span></strong> for <strong><span>Central Heating System</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>lag araha hai na</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-22 14:33:28',NULL,NULL,'perpetual.rents@gmail.com',NULL,9),(12,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18019)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>797979779</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hiiiiii</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','verma89@outlook.com',0,1,6,1,'2014-09-23 10:13:02',NULL,NULL,'perpetual.rents@gmail.com',NULL,10),(13,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>797979779</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hiiiiii</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','req.henry@gmail.com',0,1,6,1,'2014-09-23 10:13:05',NULL,NULL,'perpetual.rents@gmail.com',NULL,11),(14,'Quotation-Perpetual For Gas Certificate (PRUKL219799-PRUKC18019)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>797979779</span></strong> for <strong><span>Gas Certificate</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hellooooooo</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','verma89@outlook.com',0,1,6,1,'2014-09-23 10:14:28',NULL,NULL,'perpetual.rents@gmail.com',NULL,12),(15,'Quotation-Perpetual For Gas Certificate (PRUKL219799-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>797979779</span></strong> for <strong><span>Gas Certificate</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hellooooooo</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','req.henry@gmail.com',0,1,6,1,'2014-09-23 10:14:30',NULL,NULL,'perpetual.rents@gmail.com',NULL,13),(16,'Quotation-Perpetual For Electrical Test (PRUKL219799-PRUKC18019)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>797979779</span></strong> for <strong><span>Electrical Test</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hellooooooo</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','verma89@outlook.com',0,1,6,1,'2014-09-23 10:14:43',NULL,NULL,'perpetual.rents@gmail.com',NULL,14),(17,'Interested In Your Property Situated at oiyoyoyoy(PRUKL219799-PRUKPMC14058)','Hii intertested in your property\n','himanshu@yahoo.in','himanshu8798@gmail.com',0,1,6,5,'2014-09-23 10:44:11',NULL,NULL,'perpetual.rents@gmail.com',NULL,15),(18,'Interested In Your Property Situated at 797979779(PRUKL219799-PRUKPMC14058)','hi kelly','himanshu@yahoo.in','himanshu8798@gmail.com',0,1,6,5,'2014-09-23 10:45:10',NULL,NULL,'perpetual.rents@gmail.com',NULL,16),(19,'Interested In Your Property Situated at 797979779(PRUKL219799-PRUKPMC14058)','hiiiiii reply from kelly','himanshu8798@gmail.com','himanshu@yahoo.in',0,1,6,1,'2014-09-23 10:51:55',NULL,NULL,'perpetual.rents@gmail.com',NULL,16),(20,'Interested In Your Property Situated at oiyoyoyoy(PRUKL219799-PRUKPMC13959)','hi','chintan.dhingra@perceptive-solutions.com','himanshu8798@gmail.com',0,1,6,5,'2014-09-23 10:54:48',NULL,NULL,'perpetual.rents@gmail.com',NULL,17),(21,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>UYRUTII</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>uuuuuuuuuuuu</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','req.henry@gmail.com',0,1,6,1,'2014-09-23 11:06:04',NULL,NULL,'perpetual.rents@gmail.com',NULL,18),(22,'Interested In Your Property Situated at SE164RP(PRUKL219700-PRUKPMC13959)','hiiiiiiiiiiiiiiiiiiiiiiiiiiii','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,5,'2014-09-24 07:29:21',NULL,NULL,'perpetual.rents@gmail.com',NULL,7),(23,'Interested In Your Property Situated at oiyoyoyoy(PRUKL219799-PRUKPMC14058)','hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii','himanshu@yahoo.in','himanshu8798@gmail.com',0,1,6,5,'2014-09-24 07:31:53',NULL,NULL,'perpetual.rents@gmail.com',NULL,15),(24,'Interested In Your Property Situated at oiyoyoyoy(PRUKL219799-PRUKPMC14058)','please calll me','himanshu8798@gmail.com','himanshu@yahoo.in',0,1,6,1,'2014-09-24 07:33:00',NULL,NULL,'perpetual.rents@gmail.com',NULL,15),(25,'Quotation-Perpetual For Gas Certificate (PRUKL219799-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>UYRUTII</span></strong> for <strong><span>Gas Certificate</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>Hiii dan </span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','req.henry@gmail.com',0,1,6,1,'2014-09-24 09:08:32',NULL,NULL,'perpetual.rents@gmail.com',NULL,19),(26,'Quotation-Perpetual For Energy Performance (PRUKL219799-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>UYRUTII</span></strong> for <strong><span>Energy Performance</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>Hiii dan </span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','req.henry@gmail.com',0,1,6,1,'2014-09-24 09:08:47',NULL,NULL,'perpetual.rents@gmail.com',NULL,20),(27,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18019)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>UTYIUYYO</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>Hey i need a contractor</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','verma89@outlook.com',0,1,6,1,'2014-09-24 09:14:36',NULL,NULL,'perpetual.rents@gmail.com',NULL,21),(28,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>UTYIUYYO</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>Hey i need a contractor</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','req.henry@gmail.com',0,1,6,1,'2014-09-24 09:14:39',NULL,NULL,'perpetual.rents@gmail.com',NULL,22),(29,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18217)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>UTYIUYYO</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>Hey i need a contractor</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','henry.mobistec@gmail.com',0,1,6,1,'2014-09-24 09:14:41',NULL,NULL,'perpetual.rents@gmail.com',NULL,23),(30,'Quotation-Perpetual For Electrical Test (PRUKL219799-PRUKC18217)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>UTYIUYYO</span></strong> for <strong><span>Electrical Test</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>contractor hiiii hor r y</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','henry.mobistec@gmail.com',0,1,6,1,'2014-09-24 09:15:43',NULL,NULL,'perpetual.rents@gmail.com',NULL,24),(31,'Quotation-Perpetual For Gas Certificate (PRUKL219799-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>UTYIUYYO</span></strong> for <strong><span>Gas Certificate</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>no needddddd</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','req.henry@gmail.com',0,1,6,1,'2014-09-24 09:16:00',NULL,NULL,'perpetual.rents@gmail.com',NULL,25),(32,'Quotation-Perpetual For Gas Certificate (PRUKL219799-PRUKC18217)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>UTYIUYYO</span></strong> for <strong><span>Gas Certificate</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>no needddddd</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','henry.mobistec@gmail.com',0,1,6,1,'2014-09-24 09:16:03',NULL,NULL,'perpetual.rents@gmail.com',NULL,26),(33,'Quotation-Perpetual For Energy Performance (PRUKL219799-PRUKC18019)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>UTYIUYYO</span></strong> for <strong><span>Energy Performance</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>no needddddd</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','verma89@outlook.com',0,1,6,1,'2014-09-24 09:16:16',NULL,NULL,'perpetual.rents@gmail.com',NULL,27),(34,'Quotation-Perpetual For Energy Performance (PRUKL219799-PRUKC18217)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>UTYIUYYO</span></strong> for <strong><span>Energy Performance</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>no needddddd</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','henry.mobistec@gmail.com',0,1,6,1,'2014-09-24 09:16:18',NULL,NULL,'perpetual.rents@gmail.com',NULL,28),(35,'Quotation-Perpetual For Central Heating System (PRUKL219799-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>UTYIUYYO</span></strong> for <strong><span>Central Heating System</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>no needddddd</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','req.henry@gmail.com',0,1,6,1,'2014-09-24 09:16:30',NULL,NULL,'perpetual.rents@gmail.com',NULL,29),(36,'Quotation-Perpetual For Building Performance (PRUKL219799-PRUKC18217)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>UTYIUYYO</span></strong> for <strong><span>Building Performance</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>no needddddd</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','henry.mobistec@gmail.com',0,1,6,1,'2014-09-24 09:16:40',NULL,NULL,'perpetual.rents@gmail.com',NULL,30),(37,'Quotation-Perpetual For Electrical Installation (PRUKL219898-PRUKC17920)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>OOHH</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hi al\n</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-24 09:40:36',NULL,NULL,'perpetual.rents@gmail.com',NULL,31),(38,'Quotation-Perpetual For Electrical Installation (PRUKL219898-PRUKC18019)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>OOHH</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hi al\n</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','verma89@outlook.com',0,1,6,1,'2014-09-24 09:40:39',NULL,NULL,'perpetual.rents@gmail.com',NULL,32),(39,'Quotation-Perpetual For Electrical Installation (PRUKL219898-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>OOHH</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hi al\n</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','req.henry@gmail.com',0,1,6,1,'2014-09-24 09:40:41',NULL,NULL,'perpetual.rents@gmail.com',NULL,33),(40,'Quotation-Perpetual For Electrical Installation (PRUKL219898-PRUKC18217)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>OOHH</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hi al\n</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','henry.mobistec@gmail.com',0,1,6,1,'2014-09-24 09:40:43',NULL,NULL,'perpetual.rents@gmail.com',NULL,34),(41,'Quotation-Perpetual For Electrical Installation (PRUKL219898-PRUKC18316)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>OOHH</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hi al\n</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','himanshu_vui@yahoo.in',0,1,6,1,'2014-09-24 09:40:45',NULL,NULL,'perpetual.rents@gmail.com',NULL,35),(42,'Quotation-Perpetual For Electrical Test (PRUKL219898-PRUKC17920)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>OOHH</span></strong> for <strong><span>Electrical Test</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hi al\n</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-24 09:41:27',NULL,NULL,'perpetual.rents@gmail.com',NULL,36),(43,'Quotation-Perpetual For Electrical Test (PRUKL219898-PRUKC18019)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>OOHH</span></strong> for <strong><span>Electrical Test</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hi al\n</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','verma89@outlook.com',0,1,6,1,'2014-09-24 09:41:29',NULL,NULL,'perpetual.rents@gmail.com',NULL,37),(44,'Quotation-Perpetual For Electrical Test (PRUKL219898-PRUKC18217)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>OOHH</span></strong> for <strong><span>Electrical Test</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hi al\n</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','henry.mobistec@gmail.com',0,1,6,1,'2014-09-24 09:41:32',NULL,NULL,'perpetual.rents@gmail.com',NULL,38),(45,'Quotation-Perpetual For Electrical Test (PRUKL219898-PRUKC18316)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>OOHH</span></strong> for <strong><span>Electrical Test</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hi al\n</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','himanshu_vui@yahoo.in',0,1,6,1,'2014-09-24 09:41:34',NULL,NULL,'perpetual.rents@gmail.com',NULL,39),(46,'Quotation-Perpetual For Sketch Plan (PRUKL219898-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>OOHH</span></strong> for <strong><span>Sketch Plan</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hi al\n</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','req.henry@gmail.com',0,1,6,1,'2014-09-24 09:42:00',NULL,NULL,'perpetual.rents@gmail.com',NULL,40),(47,'Quotation-Perpetual For Sketch Plan (PRUKL219898-PRUKC18217)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>OOHH</span></strong> for <strong><span>Sketch Plan</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hi al\n</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','henry.mobistec@gmail.com',0,1,6,1,'2014-09-24 09:42:02',NULL,NULL,'perpetual.rents@gmail.com',NULL,41),(48,'Quotation-Perpetual For Sketch Plan (PRUKL219898-PRUKC18316)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>OOHH</span></strong> for <strong><span>Sketch Plan</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hi al\n</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','himanshu_vui@yahoo.in',0,1,6,1,'2014-09-24 09:42:04',NULL,NULL,'perpetual.rents@gmail.com',NULL,42),(49,'Quotation-Perpetual For Electrical Installation (PRUKL219898-PRUKC18316)','hiiiiiiiii','himanshu_vui@yahoo.in','himanshu8798@gmail.com',0,1,6,2,'2014-09-24 10:10:31',NULL,NULL,'perpetual.rents@gmail.com',NULL,35),(50,'Quotation-Perpetual For Electrical Installation (PRUKL219898-PRUKC18316)','hiiiiiiiiiiiii','himanshu_vui@yahoo.in','himanshu8798@gmail.com',0,1,6,2,'2014-09-24 10:15:09',NULL,NULL,'perpetual.rents@gmail.com',NULL,35),(51,'Quotation-Perpetual For Electrical Test (PRUKL219799-PRUKC18019)','hiiiiiiiiiiiiiiiiiiiiiiiiiii andy','himanshu8798@gmail.com','verma89@outlook.com',0,1,6,1,'2014-09-24 10:40:33',NULL,NULL,'perpetual.rents@gmail.com',NULL,14),(52,'Quotation-Perpetual For Periodic Inspection Of Water Supply (PRUKL219799-PRUKC18316)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>iyiyiy</span></strong> for <strong><span>Periodic Inspection Of Water Supply</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span> </span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','himanshu_vui@yahoo.in',0,1,6,1,'2014-09-24 11:14:02',NULL,NULL,'perpetual.rents@gmail.com',NULL,43),(53,'Quotation-Perpetual For Sketch Plan (PRUKL219799-PRUKC18316)','hiiiii assighn the property','himanshu8798@gmail.com','himanshu_vui@yahoo.in',0,1,6,1,'2014-09-24 11:28:29',NULL,NULL,'perpetual.rents@gmail.com',NULL,44),(54,'Interested In Your Property Situated at oiyoyoyoy(PRUKL219799-PRUKPMC14157)','hiiiiiiiii vickuy','himanshu_vui@yahoo.in','himanshu8798@gmail.com',0,1,6,5,'2014-09-24 11:57:23',NULL,NULL,'perpetual.rents@gmail.com',NULL,45),(55,'Interested In Your Property Situated at oiyoyoyoy(PRUKL219799-PRUKPMC14157)','helllo\r\n','himanshu8798@gmail.com','himanshu_vui@yahoo.in',0,1,6,1,'2014-09-24 11:59:19',NULL,NULL,'perpetual.rents@gmail.com',NULL,45),(56,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC17920)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>rtyu</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span> hiiiiiii contrators</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-24 12:21:29',NULL,NULL,'perpetual.rents@gmail.com',NULL,46),(57,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18019)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>rtyu</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span> hiiiiiii contrators</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','verma89@outlook.com',0,1,6,1,'2014-09-24 12:21:31',NULL,NULL,'perpetual.rents@gmail.com',NULL,47),(58,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>rtyu</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span> hiiiiiii contrators</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','req.henry@gmail.com',0,1,6,1,'2014-09-24 12:21:34',NULL,NULL,'perpetual.rents@gmail.com',NULL,48),(59,'Quotation-Perpetual For Electrical Installation (PRUKL219799-PRUKC18316)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>rtyu</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span> hiiiiiii contrators</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','himanshu8798@gmail.com','himanshu_vui@yahoo.in',0,1,6,1,'2014-09-24 12:21:36',NULL,NULL,'perpetual.rents@gmail.com',NULL,49),(60,'Interested In Your Property Situated at oiyoyoyoy(PRUKL219799-PRUKPMC13959)','hiiiiiiiiiiiiii','chintan.dhingra@perceptive-solutions.com','himanshu8798@gmail.com',0,1,6,5,'2014-09-24 12:34:06',NULL,NULL,'perpetual.rents@gmail.com',NULL,17),(61,'Quotation-Perpetual For Electrical Installation (PRUKL219997-PRUKC17920)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE184RP</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>I need a boiler replacement quotation, The boiler is model number abcd </span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','nikhil_122@yahoo.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-09-24 18:27:39',NULL,NULL,'perpetual.rents@gmail.com',NULL,50),(62,'Quotation-Perpetual For Electrical Installation (PRUKL219997-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE184RP</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>I need a boiler replacement quotation, The boiler is model number abcd </span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','nikhil_122@yahoo.com','req.henry@gmail.com',0,1,6,1,'2014-09-24 18:27:41',NULL,NULL,'perpetual.rents@gmail.com',NULL,51),(63,'Quotation-Perpetual For Electrical Installation (PRUKL219997-PRUKC18217)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE184RP</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>I need a boiler replacement quotation, The boiler is model number abcd </span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','nikhil_122@yahoo.com','henry.mobistec@gmail.com',0,1,6,1,'2014-09-24 18:27:44',NULL,NULL,'perpetual.rents@gmail.com',NULL,52),(64,'Quotation-Perpetual For Electrical Installation (PRUKL219997-PRUKC18316)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE184RP</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>I need a boiler replacement quotation, The boiler is model number abcd </span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','nikhil_122@yahoo.com','himanshu_vui@yahoo.in',0,1,6,1,'2014-09-24 18:27:46',NULL,NULL,'perpetual.rents@gmail.com',NULL,53),(65,'Interested In Your Property Situated at rtyu(PRUKL219799-PRUKPMC14058)','dfhjgjdhsgfjhdgf\n\nfgdsjfgdskfgds\n\nvsdhfdsjfgdshjgfjsdh','himanshu@yahoo.in','himanshu8798@gmail.com',0,1,6,5,'2014-09-24 19:40:26',NULL,NULL,'perpetual.rents@gmail.com',NULL,54),(66,'Interested In Your Property Situated at oiyoyoyoy(PRUKL219799-PRUKPMC13959)','kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua kya hua ','chintan.dhingra@perceptive-solutions.com','himanshu8798@gmail.com',0,1,6,5,'2014-09-25 10:00:54',NULL,NULL,'perpetual.rents@gmail.com',NULL,17),(67,'Interested In Your Property Situated at oiyoyoyoy(PRUKL219799-PRUKPMC13959)','kuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai huakuch nai hua','chintan.dhingra@perceptive-solutions.com','himanshu8798@gmail.com',0,1,6,5,'2014-09-25 10:03:45',NULL,NULL,'perpetual.rents@gmail.com',NULL,17),(68,'Quotation-Perpetual For Central Heating System (PRUKL219700-PRUKC17920)','h','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-10-08 06:35:05',NULL,NULL,'perpetual.rents@gmail.com',NULL,9),(69,'Quotation-Perpetual For Building Performance (PRUKL219700-PRUKC17920)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE164RP</span></strong> for <strong><span>Building Performance</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hello</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-10-08 08:55:26',NULL,NULL,'perpetual.rents@gmail.com',NULL,55),(70,'Quotation-Perpetual For Building Performance (PRUKL219700-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE164RP</span></strong> for <strong><span>Building Performance</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>hello</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','chintan.dhingra@perceptive-solutions.com','req.henry@gmail.com',0,1,6,1,'2014-10-08 08:55:31',NULL,NULL,'perpetual.rents@gmail.com',NULL,56),(71,'Quotation-Perpetual For Periodic Inspection Of Water Supply (PRUKL219700-PRUKC18316)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE164RP</span></strong> for <strong><span>Periodic Inspection Of Water Supply</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>safe water supply</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','chintan.dhingra@perceptive-solutions.com','himanshu_vui@yahoo.in',0,1,6,1,'2014-10-08 08:56:21',NULL,NULL,'perpetual.rents@gmail.com',NULL,57),(72,'Quotation-Perpetual For Electrical Installation (PRUKL219700-PRUKC17920)','hhh','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-10-11 09:40:01',NULL,NULL,'perpetual.rents@gmail.com',NULL,3),(73,'Quotation-Perpetual For Asbestos Survey (PRUKL219700-PRUKC18316)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE164RP</span></strong> for <strong><span>Asbestos Survey</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>11</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','chintan.dhingra@perceptive-solutions.com','himanshu_vui@yahoo.in',0,1,6,1,'2014-10-11 11:48:36',NULL,NULL,'perpetual.rents@gmail.com',NULL,58),(74,'Quotation-Perpetual For Electrical Installation (PRUKL219700-PRUKC18316)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE164RP</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>aaaa</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','chintan.dhingra@perceptive-solutions.com','himanshu_vui@yahoo.in',0,1,6,1,'2014-10-11 12:13:27',NULL,NULL,'perpetual.rents@gmail.com',NULL,59),(75,'Quotation-Perpetual For Electrical Installation (PRUKL219700-PRUKC18118)','<!DOCTYPE html>\n\n<html>\n    <head>\n        \n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n    </head>\n    <body>\n            \n        <p>Hello ,</p>\n\n		<p>I am very much interesting in to provide you a work on Property situated in <strong><span>SE164RP</span></strong> for <strong><span>Electrical Installation</span> </strong>.</p>\n\n		<p>Please send me the following details filled :</p>\n		\n		<p>Job\'s Description : <strong><span>aaaa</span></strong> </p> \n\n		<p>Time to complete :</p>\n\n		<p>Amount:</p>\n		\n		<p>Please reply back if you need any more information regarding this.</p>\n\n		<p>Thanks</p>\n\n		<p><span></span></p>\n\n		<p>&nbsp;</p>\n       			     \n    </body>\n    \n\n</html>','chintan.dhingra@perceptive-solutions.com','req.henry@gmail.com',0,1,6,1,'2014-10-11 12:35:14',NULL,NULL,'perpetual.rents@gmail.com',NULL,60),(76,'Quotation-Perpetual For Electrical Installation (PRUKL219700-PRUKC17920)','kya hua bhai','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-10-14 12:36:34',NULL,NULL,'perpetual.rents@gmail.com',NULL,3),(77,'Interested In Your Property Situated at SE164RP(PRUKL219700-PRUKPMC13959)','hello','chintan.dhingra@perceptive-solutions.com','chintan.dhingra@perceptive-solutions.com',0,1,6,1,'2014-10-14 13:11:17',NULL,NULL,'perpetual.rents@gmail.com',NULL,7),(78,'Quotation-Perpetual For Electrical Installation (PRUKL219997-PRUKC17920)','hello','chintan.dhingra@perceptive-solutions.com','nikhil_122@yahoo.com',0,1,6,2,'2014-10-15 10:29:18',NULL,NULL,'perpetual.rents@gmail.com',NULL,50),(79,'Quotation-Perpetual For Electrical Installation (PRUKL219997-PRUKC17920)','kya hua tera vada??','chintan.dhingra@perceptive-solutions.com','nikhil_122@yahoo.com',0,1,6,2,'2014-10-15 10:59:46',NULL,NULL,'perpetual.rents@gmail.com',NULL,50);
/*!40000 ALTER TABLE `tbl_perpetualRents_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_mailattachementfile`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_mailattachementfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_mailattachementfile` (
  `id` int(11) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `fileData` longblob NOT NULL,
  `contentType` varchar(5) DEFAULT NULL,
  `referenceId` int(11) NOT NULL,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_mailattachementfile`
--

LOCK TABLES `tbl_perpetualRents_mailattachementfile` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_mailattachementfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_perpetualRents_mailattachementfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_maileventconfiguration`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_maileventconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_maileventconfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `mailEventTypeId` int(11) NOT NULL,
  `mailEventTypeName` varchar(45) NOT NULL,
  `mailEventActorId` int(11) NOT NULL,
  `mailEventActorName` varchar(45) NOT NULL,
  `actorTypeId` int(11) NOT NULL,
  `actorTypeName` varchar(45) NOT NULL,
  `documentId` int(11) DEFAULT NULL,
  `enable` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index2` (`mailEventTypeId`,`mailEventActorId`,`actorTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_maileventconfiguration`
--

LOCK TABLES `tbl_perpetualRents_maileventconfiguration` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_maileventconfiguration` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_maileventconfiguration` VALUES (1,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',1,'Landlord',1,'Landlord',0,''),(2,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',1,'Landlord',3,'Admin',0,''),(3,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',1,'Landlord',4,'SuperAdmin',0,''),(4,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',2,'Contractor',2,'Contractor',0,''),(5,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',2,'Contractor',3,'Admin',0,''),(6,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',2,'Contractor',4,'SuperAdmin',0,''),(7,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',3,'Admin',3,'Admin',0,''),(8,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',3,'Admin',4,'SuperAdmin',0,''),(9,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',5,'Charity-Admin',4,'SuperAdmin',0,''),(10,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',5,'Charity-Admin',3,'Admin',0,''),(11,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',5,'Charity-Admin',5,'Charity-Admin',0,''),(12,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',6,'Charity-User',4,'SuperAdmin',0,''),(13,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',6,'Charity-User',3,'Admin',0,''),(14,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',6,'Charity-User',5,'Charity-Admin',0,''),(15,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',6,'Charity-User',6,'Charity-Users',0,''),(16,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',7,'Property',1,'Landlord',0,''),(17,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',7,'Property',3,'Admin',0,''),(18,'2014-09-16 05:12:16',NULL,NULL,NULL,1,'Register',7,'Property',4,'SuperAdmin',0,''),(19,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',1,'Landlord',4,'SuperAdmin',0,''),(20,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',1,'Landlord',3,'Admin',0,''),(21,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',1,'Landlord',1,'Landlord',0,''),(22,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',2,'Contractor',1,'Landlord',0,''),(23,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',2,'Contractor',3,'Admin',0,''),(24,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',2,'Contractor',4,'SuperAdmin',0,''),(25,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',3,'Admin',3,'Admin',0,''),(26,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',3,'Admin',4,'SuperAdmin',0,''),(27,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',5,'Charity-Admin',4,'SuperAdmin',0,''),(28,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',5,'Charity-Admin',3,'Admin',0,''),(29,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',5,'Charity-Admin',5,'Charity-Admin',0,''),(30,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',6,'Charity-User',4,'SuperAdmin',0,''),(31,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',6,'Charity-User',3,'Admin',0,''),(32,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',6,'Charity-User',5,'Charity-Admin',0,''),(33,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Profile Edit',6,'Charity-User',6,'Charity-Users',0,''),(34,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Edit',13,'Property',1,'Landlord',0,''),(35,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Edit',13,'Property',3,'Admin',0,''),(36,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Edit',13,'Property',4,'SuperAdmin',0,''),(37,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Edit',13,'Property',2,'Contractor',0,'\0'),(38,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Edit',13,'Property',5,'Charity-Admin',0,''),(39,'2014-09-16 05:12:16',NULL,NULL,NULL,2,'Edit',13,'Property',6,'Charity-Users',0,''),(40,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',1,'Landlord',4,'SuperAdmin',0,'\0'),(41,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',1,'Landlord',3,'Admin',0,'\0'),(42,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',1,'Landlord',1,'Landlord',0,''),(43,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',2,'Contractor',1,'Landlord',0,'\0'),(44,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',2,'Contractor',3,'Admin',0,'\0'),(45,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',2,'Contractor',4,'SuperAdmin',0,''),(46,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',3,'Admin',3,'Admin',0,''),(47,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',3,'Admin',4,'SuperAdmin',0,'\0'),(48,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',5,'Charity-Admin',5,'Charity-Admin',0,''),(49,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',5,'Charity-Admin',3,'Admin',0,'\0'),(50,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',5,'Charity-Admin',4,'SuperAdmin',0,'\0'),(51,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',6,'Charity-User',5,'Charity-Admin',0,'\0'),(52,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',6,'Charity-User',3,'Admin',0,'\0'),(53,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',6,'Charity-User',4,'SuperAdmin',0,'\0'),(54,'2014-09-16 05:12:16',NULL,NULL,NULL,3,'Change Passwword',6,'Charity-User',6,'Charity-Users',0,''),(55,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',1,'Landlord',1,'Landlord',0,'\0'),(56,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',1,'Landlord',3,'Admin',0,'\0'),(57,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',1,'Landlord',4,'SuperAdmin',0,'\0'),(58,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',2,'Contractor',1,'Landlord',0,'\0'),(59,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',2,'Contractor',3,'Admin',0,'\0'),(60,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',2,'Contractor',4,'SuperAdmin',0,'\0'),(61,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',3,'Admin',3,'Admin',0,''),(62,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',3,'Admin',4,'SuperAdmin',0,''),(63,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',5,'Charity-Admin',5,'Charity-Admin',0,''),(64,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',5,'Charity-Admin',3,'Admin',0,''),(65,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',5,'Charity-Admin',4,'SuperAdmin',0,''),(66,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',6,'Charity-Users',5,'Charity-Admin',0,''),(67,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',6,'Charity-Users',3,'Admin',0,''),(68,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',6,'Charity-Users',4,'SuperAdmin',0,''),(69,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',6,'Charity-Users',6,'Charity-Users',0,''),(70,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',7,'Property',4,'Super-Admin',0,'\0'),(71,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',7,'Property',3,'Admin',0,'\0'),(72,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',7,'Property',1,'Landlord',0,'\0'),(73,'2014-09-16 05:12:16',NULL,NULL,NULL,4,'Enable',7,'Property',2,'Contractor',0,'\0'),(74,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',1,'Landlord',1,'Landlord',0,'\0'),(75,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',1,'Landlord',3,'Admin',0,'\0'),(76,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',1,'Landlord',4,'SuperAdmin',0,'\0'),(77,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',2,'Contractor',1,'Landlord',0,''),(78,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',2,'Contractor',3,'Admin',0,''),(79,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',2,'Contractor',4,'SuperAdmin',0,''),(80,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',3,'Admin',3,'Admin',0,''),(81,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',3,'Admin',4,'SuperAdmin',0,''),(82,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',5,'Charity-Admin',5,'Charity-Admin',0,''),(83,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',5,'Charity-Admin',3,'Admin',0,''),(84,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',5,'Charity-Admin',4,'Super-Admin',0,''),(85,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',7,'Property',4,'SuperAdmin',0,''),(86,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',7,'Property',3,'Admin',0,''),(87,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',7,'Property',1,'Landlord',0,''),(88,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',7,'Property',2,'Contractor',0,''),(89,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',6,'Charity-Users',4,'SuperAdmin',0,''),(90,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',6,'Charity-Users',3,'Admin',0,''),(91,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',6,'Charity-Users',5,'Charity-Admin',0,''),(92,'2014-09-16 05:12:16',NULL,NULL,NULL,5,'Disable',6,'Charity-Users',6,'Charity-Users',0,''),(93,'2014-09-16 05:12:16',NULL,NULL,NULL,7,'Approve',2,'Contractor',2,'Contractor',0,''),(94,'2014-09-16 05:12:16',NULL,NULL,NULL,7,'Approve',2,'Contractor',3,'Admin',0,''),(95,'2014-09-16 05:12:16',NULL,NULL,NULL,7,'Approve',2,'Contractor',4,'SuperAdmin',0,''),(96,'2014-09-16 05:12:16',NULL,NULL,NULL,7,'Approve',5,'Charity',5,'Charity',0,'\0'),(97,'2014-09-16 05:12:16',NULL,NULL,NULL,7,'Approve',5,'Charity',3,'Admin',0,'\0'),(98,'2014-09-16 05:12:16',NULL,NULL,NULL,7,'Approve',5,'Charity',4,'SuperAdmin',0,'\0'),(99,'2014-09-16 05:12:16',NULL,NULL,NULL,7,'Approve',7,'Property',1,'Landlord',0,''),(100,'2014-09-16 05:12:16',NULL,NULL,NULL,7,'Approve',7,'Property',3,'Admin',0,''),(101,'2014-09-16 05:12:16',NULL,NULL,NULL,7,'Approve',7,'Property',4,'SuperAdmin',0,''),(102,'2014-09-16 05:12:16',NULL,NULL,NULL,7,'Approve',7,'Property',5,'Charity-Admin',0,''),(103,'2014-09-16 05:12:16',NULL,NULL,NULL,7,'Approve',7,'Property',6,'Charity-Users',0,''),(104,'2014-09-16 05:12:16',NULL,NULL,NULL,8,'Disapprove',2,'Contractor',1,'Contractor',0,'\0'),(105,'2014-09-16 05:12:16',NULL,NULL,NULL,8,'Disapprove',2,'Contractor',3,'Admin',0,'\0'),(106,'2014-09-16 05:12:16',NULL,NULL,NULL,8,'Disapprove',2,'Contractor',4,'SuperAdmin',0,'\0'),(107,'2014-09-16 05:12:16',NULL,NULL,NULL,8,'Disapprove',7,'Property',1,'Landlord',0,''),(108,'2014-09-16 05:12:16',NULL,NULL,NULL,8,'Disapprove',7,'Property',3,'Admin',0,''),(109,'2014-09-16 05:12:16',NULL,NULL,NULL,8,'Disapprove',7,'Property',4,'SuperAdmin',0,''),(110,'2014-09-16 05:12:16',NULL,NULL,NULL,10,'Assign',10,'Property',1,'Landlord',0,''),(111,'2014-09-16 05:12:16',NULL,NULL,NULL,10,'Assign',10,'Property',2,'Contractor',0,''),(112,'2014-09-16 05:12:16',NULL,NULL,NULL,10,'Assign',10,'Property',3,'Admin',0,''),(113,'2014-09-16 05:12:16',NULL,NULL,NULL,10,'Assign',10,'Property',4,'SuperAdmin',0,''),(114,'2014-09-16 05:12:16',NULL,NULL,NULL,15,'Reject',7,'Property',1,'Landlord',0,''),(115,'2014-09-16 05:12:16',NULL,NULL,NULL,15,'Reject',7,'Property',2,'Contractor',0,''),(116,'2014-09-16 05:12:16',NULL,NULL,NULL,15,'Reject',7,'Property',3,'Admin',0,''),(117,'2014-09-16 05:12:16',NULL,NULL,NULL,15,'Reject',7,'Property',4,'SuperAdmin',0,''),(118,'2014-09-16 05:12:16',NULL,NULL,NULL,14,'Accept',7,'Property',1,'Landlord',0,''),(119,'2014-09-16 05:12:16',NULL,NULL,NULL,14,'Accept',7,'Property',2,'Contractor',0,''),(120,'2014-09-16 05:12:16',NULL,NULL,NULL,14,'Accept',7,'Property',3,'Admin',0,''),(121,'2014-09-16 05:12:16',NULL,NULL,NULL,14,'Accept',7,'Property',4,'SuperAdmin',0,''),(122,'2014-09-16 05:12:16',NULL,NULL,NULL,12,'Password reset',2,'Contractor',2,'Contractor',0,''),(123,'2014-09-16 05:12:16',NULL,NULL,NULL,12,'Password reset',5,'Charity-Admin',5,'Charity-Admin',0,''),(124,'2014-09-16 05:12:16',NULL,NULL,NULL,12,'Password reset',5,'Charity-Users',6,'Charity-Users',0,''),(125,'2014-09-16 05:12:16',NULL,NULL,NULL,12,'Password reset',5,'Admin',3,'Admin',0,''),(126,'2014-09-16 05:12:16',NULL,NULL,NULL,9,'BAR-STATUS',7,'Property',1,'Landlord',0,''),(127,'2014-09-16 05:12:16',NULL,NULL,NULL,9,'BAR-STATUS',7,'Property',3,'Admin',0,''),(128,'2014-09-16 05:12:16',NULL,NULL,NULL,9,'BAR-STATUS',7,'Property',5,'Charity-Admin',0,''),(129,'2014-09-16 05:12:16',NULL,NULL,NULL,9,'BAR-STATUS',7,'Property',6,'Charity-Users',0,'');
/*!40000 ALTER TABLE `tbl_perpetualRents_maileventconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_perpetualcity`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_perpetualcity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_perpetualcity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`city`),
  UNIQUE KEY `city_UNIQUE` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_perpetualcity`
--

LOCK TABLES `tbl_perpetualRents_perpetualcity` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_perpetualcity` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_perpetualcity` VALUES (12,'Bradfort'),(8,'Cambridge'),(13,'Chester'),(14,'Chester-Le-Street'),(9,'Durham'),(10,'Lancaster'),(6,'London');
/*!40000 ALTER TABLE `tbl_perpetualRents_perpetualcity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_property`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `contactPerson` varchar(255) NOT NULL,
  `agentName` varchar(255) DEFAULT NULL,
  `agentContactNumber` varchar(255) DEFAULT NULL,
  `agentAddressLine` varchar(255) DEFAULT NULL,
  `uniqueReference` varchar(255) NOT NULL,
  `statusPercentage` int(5) NOT NULL DEFAULT '0',
  `landlordID` int(11) NOT NULL,
  `enable` bit(1) DEFAULT b'1',
  `statusId` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_property`
--

LOCK TABLES `tbl_perpetualRents_property` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_property` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_property` VALUES (1,'2014-09-19 05:40:32','2014-10-15 05:16:58',3,3,'Chintan',NULL,NULL,NULL,'PRUKP30493',0,1,'',6),(2,'2014-09-22 15:14:23','2014-09-23 09:18:14',5,5,'Vicky',NULL,NULL,NULL,'PRUKP30592',0,2,'',6),(3,'2014-09-23 08:56:31','2014-09-23 12:40:00',5,5,'Kelly',NULL,NULL,NULL,'PRUKP30691',0,2,'',6),(4,'2014-09-23 11:05:32','2014-09-24 09:08:04',5,5,'Karl',NULL,NULL,NULL,'PRUKP30790',0,2,'',6),(5,'2014-09-24 09:14:03','2014-09-24 11:01:56',5,5,'Bryan',NULL,NULL,NULL,'PRUKP30889',0,2,'',6),(6,'2014-09-24 09:40:02','2014-09-24 14:56:16',12,12,'Carolyn',NULL,NULL,NULL,'PRUKP30988',0,3,'',6),(7,'2014-09-24 11:12:53','2014-09-24 11:37:22',5,5,'Chintan',NULL,NULL,NULL,'PRUKP31087',0,2,'',6),(8,'2014-09-24 12:20:25',NULL,5,NULL,'test',NULL,NULL,NULL,'PRUKP31186',0,2,'',6),(9,'2014-09-24 18:26:07','2014-09-24 19:03:03',14,14,'Nikgil Kumar','Nikhil','08778775765','kkhkjhkj','PRUKP31285',0,4,'',6),(10,'2014-10-06 05:15:05','2014-10-14 13:13:52',3,3,'test',NULL,NULL,NULL,'PRUKP31384',0,1,'',6),(11,'2014-10-14 09:23:38','2014-10-14 11:11:56',3,3,'a',NULL,NULL,NULL,'PRUKP31483',0,1,'',6);
/*!40000 ALTER TABLE `tbl_perpetualRents_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_propertymarketinginformation`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_propertymarketinginformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_propertymarketinginformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `availability` varchar(45) NOT NULL,
  `rentAmount` varchar(45) NOT NULL,
  `propertyType` varchar(45) NOT NULL,
  `propertyOtherType` varchar(45) DEFAULT NULL,
  `rentPeriod` varchar(45) NOT NULL,
  `bedroomCount` int(5) NOT NULL,
  `bathroomCount` int(5) NOT NULL,
  `seprateWC` int(5) NOT NULL,
  `furnished` bit(1) DEFAULT NULL,
  `flooring` bit(1) DEFAULT NULL,
  `curtains` bit(1) DEFAULT NULL,
  `frontGarden` bit(1) DEFAULT NULL,
  `rearGarden` bit(1) DEFAULT NULL,
  `wheelChairAccess` bit(1) DEFAULT NULL,
  `extraStairs` bit(1) DEFAULT NULL,
  `extraStairsComments` varchar(255) DEFAULT NULL,
  `otherPropertyInformation` varchar(255) DEFAULT NULL,
  `propertyId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_propertymarketinginformation`
--

LOCK TABLES `tbl_perpetualRents_propertymarketinginformation` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_propertymarketinginformation` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_propertymarketinginformation` VALUES (1,'15-OCT-2014','12000','Other','','6',12,12,12,'\0','\0','\0','\0','\0','\0','\0',NULL,NULL,1),(2,'25-SEP-2014','232','Other','','6',3,3,3,'\0','','','','','','\0',NULL,NULL,2),(3,'24-SEP-2014','78','Other','','18',89,3,3,'\0','\0','\0','\0','\0','\0','\0',NULL,NULL,3),(4,'26-SEP-2014','54','HMO','45','6',45,54,54,'\0','\0','\0','\0','\0','\0','\0',NULL,NULL,6),(5,'26-SEP-2014','23','Other','','6',23,232,23,'\0','\0','\0','\0','\0','\0','\0',NULL,NULL,7),(6,'26-SEP-2014','23','HMO','yu','6',2,2,2,'\0','\0','\0','\0','\0','\0','\0',NULL,NULL,8),(7,'28-SEP-2014','550','Flat','2','36',2,2,1,'\0','','','','\0','\0','\0',NULL,NULL,9),(8,'09-OCT-2014','1200','Flat','','24',12,12,12,'\0','\0','\0','\0','\0','\0','\0',NULL,NULL,10),(9,'15-OCT-2014','1200','Flat','','6',12,12,12,'\0','\0','\0','\0','\0','\0','\0',NULL,NULL,11);
/*!40000 ALTER TABLE `tbl_perpetualRents_propertymarketinginformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_propertyquestions`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_propertyquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_propertyquestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `fieldName` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `question` varchar(999) DEFAULT NULL,
  `documentSupported` bit(1) DEFAULT b'0',
  `affirmativeAns` bit(1) NOT NULL,
  `considerable` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldName` (`fieldName`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_propertyquestions`
--

LOCK TABLES `tbl_perpetualRents_propertyquestions` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_propertyquestions` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_propertyquestions` VALUES (1,1,'hmoLicence','','The property is not a licensable HMO (please delete as appropriate)NB: A licensable HMO is a property that is three or more stories high and has\n Five or more people living in, it in more than one household and sharing amenities such as bathrooms, toilets','\0','',''),(2,1,'licenceNumber','','license number for the property','\0','\0','\0'),(3,2,'propertyMeetStandards','','Does the property meet all the standards as laid down under section A of the property standards guidance note?','\0','',''),(4,2,'whereITFails','',' If not; where does it fail?','\0','','\0'),(5,2,'upgradeProperty','','Do you intend to upgrade the property to meet our specification and Decent Homes Standards?','\0','',''),(6,2,'workCompletedBy','','If yes, when will this work be completed by? Please provide a schedule with task priorities. We can provided a template if needed.','\0','','\0'),(7,3,'electricalInstallation','','A satisfactory periodic inspection report for the fixed electrical installation in the property from a recognised inspection body','\0','',''),(8,3,'electricalTest','','A satisfactory Electrical Test Certificate, obtained in the last five years for the fire alarm system (HMO / Bedsit only) from a recognised inspection body (i.e. NICEIC, ECA etc.)','\0','',''),(9,3,'gasCertificate','','A satisfactory gas safety certificate- a new one will be required every year. And will be paid for by the landlord.','\0','',''),(10,3,'energyPerformance','','A satisfactory Energy Performance Certificate (EPC band A - High D all other bands will need to be updated by 2018 or your property may be deemed as been uninhabitable thus been in breach of contract) for more information see website for details ','\0','',''),(11,3,'centralHeatingSystem','','A satisfactory service contract for the central heating system (optional).','\0','',''),(12,3,'buildingInsaurance','','A satisfactory Insurance Certificate / policy document for your building insurance (needed).','\0','',''),(13,3,'asbestosSurvey','','Asbestos survey and any removal works','\0','',''),(14,3,'periodicInspectionOfWaterSupply','','Periodic inspection of the water system, for example Legionella and any remedial works required to maintain a safe water supply','\0','',''),(15,3,'keySet','','We need two set of key as NACRO  will retain a set and so will Ashantidutch Property Letting,\n At the end of the scheme both sets of keys will be returned','\0','',''),(16,4,'readAndUnderstandTerms','','Local authorities are under a duty to take action in the case of category 1 hazards. If necessary (or if the owner/manager or tenant requests) the local authority may carry out any necessary remedial work themselves and reclaim the costs. They also have powers to take action in the case of all category 2 hazards (i.e. those which carry lower risks)','\0','','\0'),(17,5,'structurallyStable','','Structurally Stable ','\0','',''),(18,5,'freeFromSeriousDisRepair','',' Free from Serious Disrepair     ','\0','',''),(19,5,'freeFromDampness','','Free from dampness or mould growth ','\0','',''),(20,5,'insulation270mm','','Loft insulation of minimum thickness 270mm ','\0','',''),(21,6,'adequateHeating','','Adequate heating Please indicate GCH, other','\0','',''),(22,7,'pollutants','','Pollutants such as Asbestos, MMF fibres Carbon monoxide (and fuel combustion Products), Biocides, Volatile organic compounds found in paints, radiation & lead?','\0','',''),(23,7,'existingRadonRiskReport','','Do you have an existing Radon Risk Report?','\0','',''),(24,7,'needRadonRiskReport','','Does your property need a Radon risk Report?','\0','',''),(25,8,'adequateSizeandLayout','','If Applicable, Adequate size and layout of common entrance areas for blocks of flats (e.g. must not have narrow access ways or steep stairs)','\0','',''),(26,8,'safeAgainstUnauthorizedEntry','','Is the property safe against unauthorized entry so as to delay and deter intruders and make the occupants feel safer.','\0','',''),(27,8,'careTaker','','Is there caretaker/entry phone system to block of flats','\0','',''),(28,8,'burglarAlarmSystem','','Is there a burglar alarm systems','\0','',''),(29,8,'allWindowsHaveKeys','','If lockable windows have been fitted do all of the windows have keys?','\0','',''),(30,8,'adequateLightening','','Adequate lighting (natural and artificial)','\0','',''),(31,8,'adequateSecurityLightening','','Is there adequate Security lighting and is it in working condition','\0','',''),(32,8,'externalLighteningAtNight','','Is the property protected from intrusive artificial external lighting at night','\0','',''),(33,8,'complaintsAgainstNoise','','Has there been complaints by your tenant or the neighbours in regard to excessive noise levels, Traffic/other external noise also considered','\0','',''),(34,8,'safeBarriersAgainstFire','','Safe barriers against fires, flames and hot objects, (fire doors etc.) with means of escape','\0','',''),(35,8,'adequateNoiceInsulation','','Is there adequate noise insulation as overlap of domestic noise between one dwelling and another (e.g. toilet flushing/television/conversation etc.)','\0','',''),(36,9,'kitchen','','Kitchen floor should be reasonably smooth and impervious for easy cleaning thus maintaining a hygienic condition, joints between sink/drainer/worktop and adjacent wall should be sealed and water tight','\0','',''),(37,9,'adequateKitchenSpace','','A kitchen with adequate space and layout (e.g. large enough to fit sink, cupboards, cooker, worktops','\0','',''),(38,9,'appropriatePowerSockets','','At least four appropriate power sockets associated with the worktop(s) as well as two for general use.','\0','',''),(39,10,'riskOfFall','','The risk of falls has been reduced when getting out of the bath/shower/similar facility, to mitigate falls on the same level, or from one level or room to another','\0','',''),(40,10,'adequateNaturalLightening','','There is adequate natural lighting to the top and foot of the stairs','\0','',''),(41,10,'securedStepsAndRamps','','That trip steps/thresholds/ramps are secured where the change in level is less than 300mm.','\0','',''),(42,10,'doorsDirection','','That doors do not open directly onto stairs or the head of the stairs causing obstruction or increasing the likelihood of a fall.','\0','',''),(43,10,'moreThanOneFlightOfStairs','','Do you have more than 1 flight of stairs in the property','\0','',''),(44,10,'buildingRegulation','','Do all stairs comply with current building regulations i.e\nTread dimensions to be between 280mm and 360mm;\nRise dimensions to be between 100mm-180mm;\nPitch (angle of stairs) to be less than 42Â°;\nStairs should be checked for above average steepness or sha','\0','',''),(45,10,'spaceAccessedViaFlightOfStairs','','what space is accessed via the non compliant flight of stairs','\0','\0','\0'),(46,10,'electricalWiringStandards','','Electrical wiring installation meets the latest requirements of Institution of Electrical Engineers/British Standard (BS 7671)','\0','',''),(47,10,'trappingBodyParts','','Includes threats of trapping body parts (e.g. fingers/limbs) in architectural features(e.g. doors/windows).','\0','','');
/*!40000 ALTER TABLE `tbl_perpetualRents_propertyquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_propertyresponse`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_propertyresponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_propertyresponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `propertyId` int(11) NOT NULL,
  `questionId` int(11) DEFAULT NULL,
  `fieldName` varchar(45) NOT NULL,
  `response` varchar(11) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `documentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupId` (`questionId`,`fieldName`,`propertyId`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_propertyresponse`
--

LOCK TABLES `tbl_perpetualRents_propertyresponse` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_propertyresponse` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_propertyresponse` VALUES (1,'2014-10-09 09:59:35','2014-10-11 12:49:46',3,3,1,16,'readAndUnderstandTerms','false',NULL,NULL),(2,'2014-10-09 09:59:35','2014-10-14 09:51:53',3,3,1,17,'structurallyStable','true','',NULL),(3,'2014-10-09 09:59:35','2014-10-14 09:51:53',3,3,1,18,'freeFromSeriousDisRepair','true','',NULL),(4,'2014-10-09 09:59:35','2014-10-14 09:51:53',3,3,1,19,'freeFromDampness','true','',NULL),(5,'2014-10-09 09:59:35','2014-10-14 09:51:53',3,3,1,20,'insulation270mm','true','',NULL),(6,'2014-10-09 09:59:35','2014-10-14 09:51:53',3,3,1,21,'adequateHeating','true','',NULL),(7,'2014-10-09 09:59:35','2014-10-14 09:51:53',3,3,1,22,'pollutants','true','',NULL),(8,'2014-10-09 09:59:35','2014-10-14 09:51:53',3,3,1,23,'existingRadonRiskReport','true','',NULL),(9,'2014-10-09 09:59:35','2014-10-14 09:51:53',3,3,1,24,'needRadonRiskReport','true','',NULL),(16,'2014-10-09 10:03:54','2014-10-11 11:37:40',3,3,1,1,'hmoLicence','true',NULL,NULL),(17,'2014-10-09 10:03:54','2014-10-13 05:36:24',3,3,1,2,'licenceNumber',NULL,'123456',NULL),(18,'2014-10-09 10:03:54','2014-10-11 11:27:54',3,3,1,3,'propertyMeetStandards','true',NULL,NULL),(19,'2014-10-09 10:03:54','2014-10-13 05:36:24',3,3,1,4,'whereITFails',NULL,'',NULL),(20,'2014-10-09 10:03:54','2014-10-11 11:27:54',3,3,1,5,'upgradeProperty','true',NULL,NULL),(21,'2014-10-09 10:03:54','2014-10-13 05:36:24',3,3,1,6,'workCompletedBy',NULL,'17-OCT-2014',NULL),(40,'2014-10-09 10:15:51','2014-10-14 13:14:42',3,3,10,1,'hmoLicence','true',NULL,NULL),(41,'2014-10-09 10:15:51','2014-10-14 13:14:42',3,3,10,2,'licenceNumber',NULL,'',NULL),(42,'2014-10-09 10:15:51','2014-10-14 13:14:42',3,3,10,3,'propertyMeetStandards','true',NULL,NULL),(43,'2014-10-09 10:15:51','2014-10-14 13:14:42',3,3,10,4,'whereITFails',NULL,'',NULL),(44,'2014-10-09 10:15:51','2014-10-14 13:14:42',3,3,10,5,'upgradeProperty','true',NULL,NULL),(45,'2014-10-09 10:15:51','2014-10-14 13:14:42',3,3,10,6,'workCompletedBy',NULL,'16-OCT-2014',NULL),(46,'2014-10-09 10:15:55','2014-10-14 13:14:57',3,3,10,16,'readAndUnderstandTerms','true',NULL,NULL),(47,'2014-10-09 10:15:55','2014-10-14 13:14:57',3,3,10,17,'structurallyStable','true','',NULL),(48,'2014-10-09 10:15:55','2014-10-14 13:14:57',3,3,10,18,'freeFromSeriousDisRepair','true','',NULL),(49,'2014-10-09 10:15:55','2014-10-14 13:14:57',3,3,10,19,'freeFromDampness','true','',NULL),(50,'2014-10-09 10:15:55','2014-10-14 13:14:57',3,3,10,20,'insulation270mm','true','',NULL),(51,'2014-10-09 10:15:55','2014-10-14 13:14:57',3,3,10,21,'adequateHeating','true','',NULL),(52,'2014-10-09 10:15:55','2014-10-14 13:14:57',3,3,10,22,'pollutants','true','',NULL),(53,'2014-10-09 10:15:55','2014-10-14 13:14:57',3,3,10,23,'existingRadonRiskReport','true','',NULL),(54,'2014-10-09 10:15:55','2014-10-14 13:14:57',3,3,10,24,'needRadonRiskReport','true','',NULL),(55,'2014-10-11 05:52:46','2014-10-14 09:52:06',3,3,1,36,'kitchen','true','',NULL),(56,'2014-10-11 05:52:46','2014-10-14 09:52:06',3,3,1,37,'adequateKitchenSpace','true','',NULL),(59,'2014-10-11 06:48:28',NULL,3,NULL,1,45,'centralHeating',NULL,NULL,NULL),(60,'2014-10-11 12:36:42',NULL,3,NULL,1,7,'electricalInstallation','true',NULL,13),(61,'2014-10-11 12:36:42',NULL,3,NULL,1,8,'electricalTest','true',NULL,14),(62,'2014-10-11 12:36:42',NULL,3,NULL,1,9,'gasCertificate','true',NULL,15),(63,'2014-10-11 12:36:42',NULL,3,NULL,1,10,'energyPerformance','true',NULL,16),(64,'2014-10-11 12:36:42',NULL,3,NULL,1,11,'centralHeatingSystem','true',NULL,17),(65,'2014-10-11 12:36:42',NULL,3,NULL,1,12,'buildingInsaurance','true',NULL,18),(66,'2014-10-11 12:36:42',NULL,3,NULL,1,13,'asbestosSurvey','true',NULL,19),(67,'2014-10-11 12:36:42',NULL,3,NULL,1,14,'periodicInspectionOfWaterSupply','true',NULL,20),(68,'2014-10-11 12:36:42',NULL,3,NULL,1,15,'keySet','true',NULL,NULL),(69,'2014-10-11 13:19:41','2014-10-13 05:36:31',3,3,1,25,'adequateSizeandLayout','true','',NULL),(70,'2014-10-11 13:19:41','2014-10-13 05:36:31',3,3,1,26,'safeAgainstUnauthorizedEntry','true','',NULL),(71,'2014-10-11 13:19:41','2014-10-13 05:36:31',3,3,1,27,'careTaker','true','',NULL),(72,'2014-10-11 13:19:41','2014-10-13 05:36:31',3,3,1,28,'burglarAlarmSystem','true','',NULL),(73,'2014-10-11 13:19:41','2014-10-13 05:36:31',3,3,1,29,'allWindowsHaveKeys','true','',NULL),(74,'2014-10-11 13:19:41','2014-10-13 05:36:31',3,3,1,30,'adequateLightening','true','',NULL),(75,'2014-10-11 13:19:41','2014-10-13 05:36:31',3,3,1,31,'adequateSecurityLightening','true','',NULL),(76,'2014-10-11 13:19:41','2014-10-13 05:36:31',3,3,1,32,'externalLighteningAtNight','true','',NULL),(77,'2014-10-11 13:19:41','2014-10-13 05:36:31',3,3,1,33,'complaintsAgainstNoise','true','',NULL),(78,'2014-10-11 13:19:41','2014-10-13 05:36:31',3,3,1,34,'safeBarriersAgainstFire','true','',NULL),(79,'2014-10-11 13:19:41','2014-10-13 05:36:31',3,3,1,35,'adequateNoiceInsulation','true','',NULL),(83,'2014-10-11 13:35:05','2014-10-14 09:52:06',3,3,1,38,'appropriatePowerSockets','true','',NULL),(84,'2014-10-13 05:49:26','2014-10-14 09:58:28',3,3,1,39,'riskOfFall','true','',NULL),(85,'2014-10-13 05:49:26','2014-10-14 09:58:28',3,3,1,40,'adequateNaturalLightening','true','',NULL),(86,'2014-10-13 05:49:26','2014-10-14 09:58:28',3,3,1,41,'securedStepsAndRamps','true','',NULL),(87,'2014-10-13 05:49:26','2014-10-14 09:58:28',3,3,1,42,'doorsDirection','true','',NULL),(88,'2014-10-13 05:49:26','2014-10-14 09:58:28',3,3,1,43,'moreThanOneFlightOfStairs','true','',NULL),(89,'2014-10-13 05:49:26','2014-10-14 09:58:28',3,3,1,44,'buildingRegulation','true','',NULL),(90,'2014-10-13 05:49:26','2014-10-14 09:58:28',3,3,1,46,'electricalWiringStandards','true','',NULL),(91,'2014-10-13 05:49:26','2014-10-14 09:58:28',3,3,1,47,'trappingBodyParts','true','',NULL),(92,'2014-10-14 09:23:47',NULL,3,NULL,11,1,'hmoLicence','true',NULL,NULL),(93,'2014-10-14 09:23:47','2014-10-14 09:25:13',3,3,11,2,'licenceNumber',NULL,'',NULL),(94,'2014-10-14 09:23:47','2014-10-14 09:25:13',3,3,11,3,'propertyMeetStandards','true',NULL,NULL),(95,'2014-10-14 09:23:47','2014-10-14 09:25:13',3,3,11,4,'whereITFails',NULL,'',NULL),(96,'2014-10-14 09:23:47','2014-10-14 09:25:13',3,3,11,5,'upgradeProperty','true',NULL,NULL),(97,'2014-10-14 09:23:47','2014-10-14 09:25:13',3,3,11,6,'workCompletedBy',NULL,'16-OCT-2014',NULL),(98,'2014-10-14 09:25:13',NULL,3,NULL,11,7,'electricalInstallation','true',NULL,1),(99,'2014-10-14 09:25:13',NULL,3,NULL,11,8,'electricalTest','true',NULL,2),(100,'2014-10-14 09:25:13',NULL,3,NULL,11,9,'gasCertificate','true',NULL,3),(101,'2014-10-14 09:25:13',NULL,3,NULL,11,10,'energyPerformance','true',NULL,4),(102,'2014-10-14 09:25:13',NULL,3,NULL,11,11,'centralHeatingSystem','true',NULL,5),(103,'2014-10-14 09:25:13',NULL,3,NULL,11,12,'buildingInsaurance','true',NULL,6),(104,'2014-10-14 09:25:13',NULL,3,NULL,11,13,'asbestosSurvey','true',NULL,7),(105,'2014-10-14 09:25:13',NULL,3,NULL,11,14,'periodicInspectionOfWaterSupply','true',NULL,8),(106,'2014-10-14 09:25:13',NULL,3,NULL,11,15,'keySet','true',NULL,NULL),(107,'2014-10-14 09:25:40',NULL,3,NULL,11,16,'readAndUnderstandTerms','false',NULL,NULL),(108,'2014-10-14 09:25:40',NULL,3,NULL,11,17,'structurallyStable','true','',NULL),(109,'2014-10-14 09:25:40',NULL,3,NULL,11,18,'freeFromSeriousDisRepair','true','',NULL),(110,'2014-10-14 09:25:40',NULL,3,NULL,11,19,'freeFromDampness','true','',NULL),(111,'2014-10-14 09:25:40',NULL,3,NULL,11,20,'insulation270mm','true','',NULL),(112,'2014-10-14 09:25:40',NULL,3,NULL,11,21,'adequateHeating','true','',NULL),(113,'2014-10-14 09:25:40',NULL,3,NULL,11,22,'pollutants','true','',NULL),(114,'2014-10-14 09:25:40',NULL,3,NULL,11,23,'existingRadonRiskReport','true','',NULL),(115,'2014-10-14 09:25:40',NULL,3,NULL,11,24,'needRadonRiskReport','true','',NULL),(116,'2014-10-14 09:26:12','2014-10-14 09:31:32',3,3,11,25,'adequateSizeandLayout','true','',NULL),(117,'2014-10-14 09:26:12','2014-10-14 09:31:32',3,3,11,26,'safeAgainstUnauthorizedEntry','true','',NULL),(118,'2014-10-14 09:26:12','2014-10-14 09:31:32',3,3,11,27,'careTaker','true','',NULL),(119,'2014-10-14 09:26:12','2014-10-14 09:31:32',3,3,11,28,'burglarAlarmSystem','true','',NULL),(120,'2014-10-14 09:26:12','2014-10-14 09:31:32',3,3,11,29,'allWindowsHaveKeys','true','',NULL),(121,'2014-10-14 09:26:12','2014-10-14 09:31:32',3,3,11,30,'adequateLightening','true','',NULL),(122,'2014-10-14 09:26:12','2014-10-14 09:31:32',3,3,11,31,'adequateSecurityLightening','true','',NULL),(123,'2014-10-14 09:26:12','2014-10-14 09:31:32',3,3,11,32,'externalLighteningAtNight','true','',NULL),(124,'2014-10-14 09:26:12','2014-10-14 09:31:32',3,3,11,33,'complaintsAgainstNoise','true','',NULL),(125,'2014-10-14 09:26:12','2014-10-14 09:31:32',3,3,11,34,'safeBarriersAgainstFire','true','',NULL),(126,'2014-10-14 09:26:12','2014-10-14 09:31:32',3,3,11,35,'adequateNoiceInsulation','true','',NULL),(128,'2014-10-14 09:31:39',NULL,3,NULL,11,36,'kitchen','true','',NULL),(129,'2014-10-14 09:31:39',NULL,3,NULL,11,37,'adequateKitchenSpace','true','',NULL),(130,'2014-10-14 09:31:39',NULL,3,NULL,11,38,'appropriatePowerSockets','true','',NULL),(131,'2014-10-14 09:32:22','2014-10-14 09:36:46',3,3,11,39,'riskOfFall','true','',NULL),(132,'2014-10-14 09:32:22','2014-10-14 09:36:46',3,3,11,40,'adequateNaturalLightening','true','',NULL),(133,'2014-10-14 09:32:22','2014-10-14 09:36:46',3,3,11,41,'securedStepsAndRamps','true','',NULL),(134,'2014-10-14 09:32:22','2014-10-14 09:36:46',3,3,11,42,'doorsDirection','true','',NULL),(135,'2014-10-14 09:32:22','2014-10-14 09:36:46',3,3,11,43,'moreThanOneFlightOfStairs','true','',NULL),(136,'2014-10-14 09:32:22','2014-10-14 09:36:46',3,3,11,44,'buildingRegulation','true','',NULL),(137,'2014-10-14 09:32:22','2014-10-14 09:36:46',3,3,11,46,'electricalWiringStandards','true','',NULL),(138,'2014-10-14 09:32:22','2014-10-14 09:36:46',3,3,11,47,'trappingBodyParts','true','',NULL),(139,'2014-10-14 13:14:42',NULL,3,NULL,10,7,'electricalInstallation','true',NULL,8),(140,'2014-10-14 13:14:42',NULL,3,NULL,10,8,'electricalTest','true',NULL,9),(141,'2014-10-14 13:14:42',NULL,3,NULL,10,9,'gasCertificate','true',NULL,10),(142,'2014-10-14 13:14:42',NULL,3,NULL,10,10,'energyPerformance','true',NULL,11),(143,'2014-10-14 13:14:42',NULL,3,NULL,10,11,'centralHeatingSystem','true',NULL,12),(144,'2014-10-14 13:14:42',NULL,3,NULL,10,12,'buildingInsaurance','true',NULL,13),(145,'2014-10-14 13:14:42',NULL,3,NULL,10,13,'asbestosSurvey','true',NULL,14),(146,'2014-10-14 13:14:42',NULL,3,NULL,10,14,'periodicInspectionOfWaterSupply','true',NULL,15),(147,'2014-10-14 13:14:42',NULL,3,NULL,10,15,'keySet','true',NULL,NULL),(148,'2014-10-14 13:15:13',NULL,3,NULL,10,25,'adequateSizeandLayout','true','',NULL),(149,'2014-10-14 13:15:13',NULL,3,NULL,10,26,'safeAgainstUnauthorizedEntry','true','',NULL),(150,'2014-10-14 13:15:13',NULL,3,NULL,10,27,'careTaker','true','',NULL),(151,'2014-10-14 13:15:13',NULL,3,NULL,10,28,'burglarAlarmSystem','true','',NULL),(152,'2014-10-14 13:15:13',NULL,3,NULL,10,29,'allWindowsHaveKeys','true','',NULL),(153,'2014-10-14 13:15:13',NULL,3,NULL,10,30,'adequateLightening','true','',NULL),(154,'2014-10-14 13:15:13',NULL,3,NULL,10,31,'adequateSecurityLightening','true','',NULL),(155,'2014-10-14 13:15:13',NULL,3,NULL,10,32,'externalLighteningAtNight','true','',NULL),(156,'2014-10-14 13:15:13',NULL,3,NULL,10,33,'complaintsAgainstNoise','true','',NULL),(157,'2014-10-14 13:15:13',NULL,3,NULL,10,34,'safeBarriersAgainstFire','true','',NULL),(158,'2014-10-14 13:15:13',NULL,3,NULL,10,35,'adequateNoiceInsulation','true','',NULL),(160,'2014-10-14 13:15:20',NULL,3,NULL,10,36,'kitchen','true','',NULL),(161,'2014-10-14 13:15:20',NULL,3,NULL,10,37,'adequateKitchenSpace','true','',NULL),(162,'2014-10-14 13:15:20',NULL,3,NULL,10,38,'appropriatePowerSockets','true','',NULL),(163,'2014-10-14 13:15:34',NULL,3,NULL,10,39,'riskOfFall','true','',NULL),(164,'2014-10-14 13:15:34',NULL,3,NULL,10,40,'adequateNaturalLightening','true','',NULL),(165,'2014-10-14 13:15:34',NULL,3,NULL,10,41,'securedStepsAndRamps','true','',NULL),(166,'2014-10-14 13:15:34',NULL,3,NULL,10,42,'doorsDirection','true','',NULL),(167,'2014-10-14 13:15:34',NULL,3,NULL,10,43,'moreThanOneFlightOfStairs','true','',NULL),(168,'2014-10-14 13:15:34',NULL,3,NULL,10,44,'buildingRegulation','true','',NULL),(169,'2014-10-14 13:15:34',NULL,3,NULL,10,46,'electricalWiringStandards','true','',NULL),(170,'2014-10-14 13:15:34',NULL,3,NULL,10,47,'trappingBodyParts','true','',NULL);
/*!40000 ALTER TABLE `tbl_perpetualRents_propertyresponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_perpetualRents_questiongroup`
--

DROP TABLE IF EXISTS `tbl_perpetualRents_questiongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_perpetualRents_questiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(45) NOT NULL,
  `failThreshold` int(5) NOT NULL,
  `criteriaStr` varchar(999) DEFAULT NULL,
  `groupDetail` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupName` (`groupName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_perpetualRents_questiongroup`
--

LOCK TABLES `tbl_perpetualRents_questiongroup` WRITE;
/*!40000 ALTER TABLE `tbl_perpetualRents_questiongroup` DISABLE KEYS */;
INSERT INTO `tbl_perpetualRents_questiongroup` VALUES (1,'HMOLicenceQuestionID',5,'HMOLicense','HMO License'),(2,'propertyStandardGroupID',5,'HMOLicense','Property Standards'),(3,'certificationGroupID',5,'HMOLicense','Certification'),(4,'ReadTerms',5,'Free from ALL Category 1 Hazards as set out In the Governments Housing Health and Safety Rating System (HHSRS)','none'),(5,'IsThePropertyGroupID',5,'Free from ALL Category 1 Hazards as set out In the Governments Housing Health and Safety Rating System (HHSRS)','Is the Property: '),(6,'DoesThePropertyHaveGroupID',5,'Free from ALL Category 1 Hazards as set out In the Governments Housing Health and Safety Rating System (HHSRS)','Does the property have'),(7,'PropertyFreeFromGroupID',5,'Free from ALL Category 1 Hazards as set out In the Governments Housing Health and Safety Rating System (HHSRS)',' Is the property free from'),(8,'CriteriaB-Group-1',5,'Criteria B. It must be in a reasonable state of repair ','Does the property have'),(9,'PropertyHaveGroup-CR-C-ID',5,'Criteria C - It must have reasonably modern facilities and services','Does the property have '),(10,'PropertyHaveGroup-CR-D-ID1',5,'Criteria D - It must provide a reasonable degree of thermal comfort','Does the property have');
/*!40000 ALTER TABLE `tbl_perpetualRents_questiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  `createdUserId` int(11) DEFAULT NULL,
  `modifiedUserId` int(11) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `hintQuestion` varchar(45) DEFAULT NULL,
  `hintAnswer` varchar(45) DEFAULT NULL,
  `userTypeId` varchar(45) DEFAULT NULL,
  `enabled` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2014-09-18 12:20:14',NULL,1,NULL,'super','admin',NULL,NULL,'1',''),(2,'2014-09-19 05:38:24',NULL,1,NULL,'pmc','admin',NULL,NULL,'5',''),(3,'2014-09-19 05:39:44',NULL,NULL,NULL,'lana','lana',NULL,NULL,'3',''),(4,'2014-09-22 04:08:25',NULL,NULL,NULL,'con','admin',NULL,NULL,'4',''),(5,'2014-09-22 15:13:31',NULL,NULL,NULL,'lana1','test',NULL,NULL,'3',''),(6,'2014-09-23 10:07:34',NULL,NULL,NULL,'con1','test',NULL,NULL,'4',''),(7,'2014-09-23 10:09:25',NULL,NULL,NULL,'con2','test',NULL,NULL,'4',''),(8,'2014-09-23 10:41:07',NULL,2,NULL,'PMC1','PMC17uk53',NULL,NULL,'6',''),(9,'2014-09-23 11:03:00',NULL,1,NULL,'admin1','admin1r90dt',NULL,NULL,'2',''),(10,'2014-09-24 09:11:39',NULL,NULL,NULL,'con3','test',NULL,NULL,'4',''),(11,'2014-09-24 09:33:56',NULL,NULL,NULL,'con adpl','test',NULL,NULL,'4',''),(12,'2014-09-24 09:37:19',NULL,NULL,NULL,'lana2','test',NULL,NULL,'3',''),(13,'2014-09-24 11:56:29',NULL,1,NULL,'pmc3','pmc3uu497',NULL,NULL,'5',''),(14,'2014-09-24 18:23:32',NULL,NULL,NULL,'Nikhil_122','Password',NULL,NULL,'3',''),(15,'2014-09-29 06:38:58',NULL,NULL,NULL,'susanta','susanta',NULL,NULL,'3','');
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

-- Dump completed on 2014-10-15 12:12:21
