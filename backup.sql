-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: movies
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `concessions`
--

DROP TABLE IF EXISTS `concessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concessions` (
  `con_type` varchar(10) DEFAULT NULL,
  `item` varchar(50) NOT NULL,
  `price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concessions`
--

LOCK TABLES `concessions` WRITE;
/*!40000 ALTER TABLE `concessions` DISABLE KEYS */;
INSERT INTO `concessions` VALUES ('restaurant','alcohol',20.99),('full','candy',3.00),('basic','pop ',5.00),('basic','popcorn',10.00),('full','pretzel',12.42),('restaurant','salad',15.00),('restaurant','steak',19.99);
/*!40000 ALTER TABLE `concessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `emp_ID` varchar(5) NOT NULL,
  `loc_ID` varchar(5) DEFAULT NULL,
  `role` varchar(13) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`emp_ID`),
  KEY `loc_ID` (`loc_ID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`loc_ID`) REFERENCES `theater` (`loc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('1','3','ticket','Danielle'),('10000','2','ticket','Cameron'),('12345','1','ticket','Bob'),('12346','1','ticket','Barry'),('12347','1','concessions','Bella'),('12348','1','manager','Billy'),('2','3','ticket','Daimen'),('20000','2','ticket','Carly'),('3','3','concessions','Derek'),('30000','2','concessions','Christy'),('4','3','manager','Dominic'),('40000','2','manager','Carlos'),('70','4','ticket','Erin'),('71','4','ticket','Eric'),('72','4','concessions','Eve'),('73','4','manager','Evan'),('99996','5','manager','Phillip'),('99997','5','concessions','Frank'),('99998','5','ticket','Francis'),('99999','5','ticket','Fred');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `now_showing` tinyint(1) NOT NULL,
  `showing_ID` varchar(4) NOT NULL,
  `title` varchar(50) NOT NULL,
  `time_slot_ID` varchar(4) NOT NULL,
  `loc_ID` varchar(5) NOT NULL,
  `screen_ID` varchar(4) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`showing_ID`),
  KEY `time_slot_ID` (`time_slot_ID`),
  KEY `loc_ID` (`loc_ID`),
  KEY `screen_ID` (`screen_ID`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`time_slot_ID`) REFERENCES `time_slot` (`slot_ID`),
  CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`loc_ID`) REFERENCES `theater` (`loc_ID`),
  CONSTRAINT `movies_ibfk_3` FOREIGN KEY (`screen_ID`) REFERENCES `screens` (`screen_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (0,'1','Dog Days','1','1','1','2023-01-01','2023-06-30'),(0,'10','Dog Days','106','1','1','2023-01-01','2023-06-30'),(1,'100','Flushed away','18','3','2','2023-06-01','2023-12-31'),(1,'101','Flushed away','26','3','2','2023-06-01','2023-12-31'),(1,'102','Flushed away','40','3','2','2023-06-01','2023-12-31'),(1,'103','Flushed away','51','3','2','2023-06-01','2023-12-31'),(1,'104','Flushed away','64','3','2','2023-06-01','2023-12-31'),(1,'105','Flushed away','74','3','2','2023-06-01','2023-12-31'),(1,'106','Flushed away','88','3','2','2023-06-01','2023-12-31'),(1,'107','Flushed away','98','3','2','2023-06-01','2023-12-31'),(1,'108','Flushed away','110','3','2','2023-06-01','2023-12-31'),(1,'109','Flushed away','122','3','2','2023-06-01','2023-12-31'),(0,'11','Dog Days','125','1','1','2023-01-01','2023-06-30'),(1,'110','Flushed away','134','3','2','2023-06-01','2023-12-31'),(1,'111','Flushed away','146','3','2','2023-06-01','2023-12-31'),(1,'112','Flushed away','160','3','2','2023-06-01','2023-12-31'),(1,'113','Flushed away','2','2','2','2023-06-01','2023-12-31'),(1,'114','Flushed away','24','2','2','2023-06-01','2023-12-31'),(1,'115','Flushed away','57','2','2','2023-06-01','2023-12-31'),(1,'116','Flushed away','45','2','2','2023-06-01','2023-12-31'),(1,'117','Flushed away','50','2','2','2023-06-01','2023-12-31'),(1,'118','Flushed away','65','2','2','2023-06-01','2023-12-31'),(1,'119','Flushed away','74','2','2','2023-06-01','2023-12-31'),(0,'12','Dog Days','135','1','1','2023-01-01','2023-06-30'),(1,'120','Flushed away','95','2','2','2023-06-01','2023-12-31'),(1,'121','Flushed away','97','2','2','2023-06-01','2023-12-31'),(1,'122','Flushed away','102','2','2','2023-06-01','2023-12-31'),(1,'123','Flushed away','125','2','2','2023-06-01','2023-12-31'),(1,'124','Flushed away','143','2','2','2023-06-01','2023-12-31'),(1,'125','Flushed away','145','2','2','2023-06-01','2023-12-31'),(1,'126','Flushed away','152','2','2','2023-06-01','2023-12-31'),(1,'127','Flushed away','1','4','2','2023-06-01','2023-12-31'),(1,'128','Flushed away','7','4','2','2023-06-01','2023-12-31'),(1,'129','Flushed away','25','4','2','2023-06-01','2023-12-31'),(0,'13','Dog Days','155','1','1','2023-01-01','2023-06-30'),(1,'130','Flushed away','32','4','2','2023-06-01','2023-12-31'),(1,'131','Flushed away','49','4','2','2023-06-01','2023-12-31'),(1,'132','Flushed away','55','4','2','2023-06-01','2023-12-31'),(1,'133','Flushed away','73','4','2','2023-06-01','2023-12-31'),(1,'134','Flushed away','79','4','2','2023-06-01','2023-12-31'),(1,'135','Flushed away','97','4','2','2023-06-01','2023-12-31'),(1,'136','Flushed away','103','4','2','2023-06-01','2023-12-31'),(1,'137','Flushed away','121','4','2','2023-06-01','2023-12-31'),(1,'138','Flushed away','144','4','2','2023-06-01','2023-12-31'),(1,'139','Flushed away','156','4','2','2023-06-01','2023-12-31'),(0,'14','Dog Days','168','1','1','2023-01-01','2023-06-30'),(1,'140','Flushed away','162','4','2','2023-06-01','2023-12-31'),(1,'141','ratatouille','1','1','3','2023-09-01','2023-12-31'),(1,'142','ratatouille','13','1','3','2023-09-01','2023-12-31'),(1,'143','ratatouille','29','1','3','2023-09-01','2023-12-31'),(1,'144','ratatouille','48','1','3','2023-09-01','2023-12-31'),(1,'145','ratatouille','59','1','3','2023-09-01','2023-12-31'),(1,'146','ratatouille','71','1','3','2023-09-01','2023-12-31'),(1,'147','ratatouille','75','1','3','2023-09-01','2023-12-31'),(1,'148','ratatouille','85','1','3','2023-09-01','2023-12-31'),(1,'149','ratatouille','100','1','3','2023-09-01','2023-12-31'),(0,'15','Dog Days','1','5','1','2023-01-01','2023-06-30'),(1,'150','ratatouille','106','1','3','2023-09-01','2023-12-31'),(1,'151','ratatouille','125','1','3','2023-09-01','2023-12-31'),(1,'152','ratatouille','135','1','3','2023-09-01','2023-12-31'),(1,'153','ratatouille','155','1','3','2023-09-01','2023-12-31'),(1,'154','ratatouille','168','1','3','2023-09-01','2023-12-31'),(1,'155','ratatouille','1','5','3','2023-09-01','2023-12-31'),(1,'156','ratatouille','12','5','3','2023-09-01','2023-12-31'),(1,'157','ratatouille','25','5','3','2023-09-01','2023-12-31'),(1,'158','ratatouille','36','5','3','2023-09-01','2023-12-31'),(1,'159','ratatouille','49','5','3','2023-09-01','2023-12-31'),(0,'16','Dog Days','12','5','1','2023-01-01','2023-06-30'),(1,'160','ratatouille','56','5','3','2023-09-01','2023-12-31'),(1,'161','ratatouille','73','5','3','2023-09-01','2023-12-31'),(1,'162','ratatouille','80','5','3','2023-09-01','2023-12-31'),(1,'163','ratatouille','97','5','3','2023-09-01','2023-12-31'),(1,'164','ratatouille','110','5','3','2023-09-01','2023-12-31'),(1,'165','ratatouille','121','5','3','2023-09-01','2023-12-31'),(1,'166','ratatouille','132','5','3','2023-09-01','2023-12-31'),(1,'167','ratatouille','145','5','3','2023-09-01','2023-12-31'),(1,'168','ratatouille','158','5','3','2023-09-01','2023-12-31'),(1,'169','ratatouille','1','3','3','2023-09-01','2023-12-31'),(0,'17','Dog Days','25','5','1','2023-01-01','2023-06-30'),(1,'170','ratatouille','18','3','3','2023-09-01','2023-12-31'),(1,'171','ratatouille','26','3','3','2023-09-01','2023-12-31'),(1,'172','ratatouille','40','3','3','2023-09-01','2023-12-31'),(1,'173','ratatouille','51','3','3','2023-09-01','2023-12-31'),(1,'174','ratatouille','64','3','3','2023-09-01','2023-12-31'),(1,'175','ratatouille','74','3','3','2023-09-01','2023-12-31'),(1,'176','ratatouille','88','3','3','2023-09-01','2023-12-31'),(1,'177','ratatouille','98','3','3','2023-09-01','2023-12-31'),(1,'178','ratatouille','110','3','3','2023-09-01','2023-12-31'),(1,'179','ratatouille','122','3','3','2023-09-01','2023-12-31'),(0,'18','Dog Days','36','5','1','2023-01-01','2023-06-30'),(1,'180','ratatouille','134','3','3','2023-09-01','2023-12-31'),(1,'181','ratatouille','146','3','3','2023-09-01','2023-12-31'),(1,'182','ratatouille','160','3','3','2023-09-01','2023-12-31'),(1,'183','ratatouille','2','2','3','2023-09-01','2023-12-31'),(1,'184','ratatouille','24','2','3','2023-09-01','2023-12-31'),(1,'185','ratatouille','57','2','3','2023-09-01','2023-12-31'),(1,'186','ratatouille','45','2','3','2023-09-01','2023-12-31'),(1,'187','ratatouille','50','2','3','2023-09-01','2023-12-31'),(1,'188','ratatouille','65','2','3','2023-09-01','2023-12-31'),(1,'189','ratatouille','74','2','3','2023-09-01','2023-12-31'),(0,'19','Dog Days','49','5','1','2023-01-01','2023-06-30'),(1,'190','ratatouille','95','2','3','2023-09-01','2023-12-31'),(1,'191','ratatouille','97','2','3','2023-09-01','2023-12-31'),(1,'192','ratatouille','102','2','3','2023-09-01','2023-12-31'),(1,'193','ratatouille','125','2','3','2023-09-01','2023-12-31'),(1,'194','ratatouille','143','2','3','2023-09-01','2023-12-31'),(1,'195','ratatouille','145','2','3','2023-09-01','2023-12-31'),(1,'196','ratatouille','152','2','3','2023-09-01','2023-12-31'),(1,'197','ratatouille','1','4','3','2023-09-01','2023-12-31'),(1,'198','ratatouille','7','4','3','2023-09-01','2023-12-31'),(1,'199','ratatouille','25','4','3','2023-09-01','2023-12-31'),(0,'2','Dog Days','13','1','1','2023-01-01','2023-06-30'),(0,'20','Dog Days','56','5','1','2023-01-01','2023-06-30'),(1,'200','ratatouille','32','4','3','2023-09-01','2023-12-31'),(1,'201','ratatouille','49','4','3','2023-09-01','2023-12-31'),(1,'202','ratatouille','55','4','3','2023-09-01','2023-12-31'),(1,'203','ratatouille','73','4','3','2023-09-01','2023-12-31'),(1,'204','ratatouille','79','4','3','2023-09-01','2023-12-31'),(1,'205','ratatouille','97','4','3','2023-09-01','2023-12-31'),(1,'206','ratatouille','103','4','3','2023-09-01','2023-12-31'),(1,'207','ratatouille','121','4','3','2023-09-01','2023-12-31'),(1,'208','ratatouille','144','4','3','2023-09-01','2023-12-31'),(1,'209','ratatouille','156','4','3','2023-09-01','2023-12-31'),(0,'21','Dog Days','73','5','1','2023-01-01','2023-06-30'),(1,'210','ratatouille','162','4','3','2023-09-01','2023-12-31'),(1,'211','sherk','1','1','4','2023-07-01','2023-12-31'),(1,'212','sherk','13','1','4','2023-07-01','2023-12-31'),(1,'213','sherk','29','1','4','2023-07-01','2023-12-31'),(1,'214','sherk','48','1','4','2023-07-01','2023-12-31'),(1,'215','sherk','59','1','4','2023-07-01','2023-12-31'),(1,'216','sherk','71','1','4','2023-07-01','2023-12-31'),(1,'217','sherk','75','1','4','2023-07-01','2023-12-31'),(1,'218','sherk','85','1','4','2023-07-01','2023-12-31'),(1,'219','sherk','100','1','4','2023-07-01','2023-12-31'),(0,'22','Dog Days','80','5','1','2023-01-01','2023-06-30'),(1,'220','sherk','106','1','4','2023-07-01','2023-12-31'),(1,'221','sherk','125','1','4','2023-07-01','2023-12-31'),(1,'222','sherk','135','1','4','2023-07-01','2023-12-31'),(1,'223','sherk','155','1','4','2023-07-01','2023-12-31'),(1,'224','sherk','168','1','4','2023-07-01','2023-12-31'),(1,'225','sherk','1','5','4','2023-07-01','2023-12-31'),(1,'226','sherk','12','5','4','2023-07-01','2023-12-31'),(1,'227','sherk','25','5','4','2023-07-01','2023-12-31'),(1,'228','sherk','36','5','4','2023-07-01','2023-12-31'),(1,'229','sherk','49','5','4','2023-07-01','2023-12-31'),(0,'23','Dog Days','97','5','1','2023-01-01','2023-06-30'),(1,'230','sherk','56','5','4','2023-07-01','2023-12-31'),(1,'231','sherk','73','5','4','2023-07-01','2023-12-31'),(1,'232','sherk','80','5','4','2023-07-01','2023-12-31'),(1,'233','sherk','97','5','4','2023-07-01','2023-12-31'),(1,'234','sherk','110','5','4','2023-07-01','2023-12-31'),(1,'235','sherk','121','5','4','2023-07-01','2023-12-31'),(1,'236','sherk','132','5','4','2023-07-01','2023-12-31'),(1,'237','sherk','145','5','4','2023-07-01','2023-12-31'),(1,'238','sherk','158','5','4','2023-07-01','2023-12-31'),(1,'239','sherk','1','3','4','2023-07-01','2023-12-31'),(0,'24','Dog Days','110','5','1','2023-01-01','2023-06-30'),(1,'240','sherk','18','3','4','2023-07-01','2023-12-31'),(1,'241','sherk','26','3','4','2023-07-01','2023-12-31'),(1,'242','sherk','40','3','4','2023-07-01','2023-12-31'),(1,'243','sherk','51','3','4','2023-07-01','2023-12-31'),(1,'244','sherk','64','3','4','2023-07-01','2023-12-31'),(1,'245','sherk','74','3','4','2023-07-01','2023-12-31'),(1,'246','sherk','88','3','4','2023-07-01','2023-12-31'),(1,'247','sherk','98','3','4','2023-07-01','2023-12-31'),(1,'248','sherk','110','3','4','2023-07-01','2023-12-31'),(1,'249','sherk','122','3','4','2023-07-01','2023-12-31'),(0,'25','Dog Days','121','5','1','2023-01-01','2023-06-30'),(1,'250','sherk','134','3','4','2023-07-01','2023-12-31'),(1,'251','sherk','146','3','4','2023-07-01','2023-12-31'),(1,'252','sherk','160','3','4','2023-07-01','2023-12-31'),(1,'253','sherk','2','2','4','2023-07-01','2023-12-31'),(1,'254','sherk','24','2','4','2023-07-01','2023-12-31'),(1,'255','sherk','57','2','4','2023-07-01','2023-12-31'),(1,'256','sherk','45','2','4','2023-07-01','2023-12-31'),(1,'257','sherk','50','2','4','2023-07-01','2023-12-31'),(1,'258','sherk','65','2','4','2023-07-01','2023-12-31'),(1,'259','sherk','74','2','4','2023-07-01','2023-12-31'),(0,'26','Dog Days','132','5','1','2023-01-01','2023-06-30'),(1,'260','sherk','95','2','4','2023-07-01','2023-12-31'),(1,'261','sherk','97','2','4','2023-07-01','2023-12-31'),(1,'262','sherk','102','2','4','2023-07-01','2023-12-31'),(1,'263','sherk','125','2','4','2023-07-01','2023-12-31'),(1,'264','sherk','143','2','4','2023-07-01','2023-12-31'),(1,'265','sherk','145','2','4','2023-07-01','2023-12-31'),(1,'266','sherk','152','2','4','2023-07-01','2023-12-31'),(1,'267','sherk','1','4','4','2023-07-01','2023-12-31'),(1,'268','sherk','7','4','4','2023-07-01','2023-12-31'),(1,'269','sherk','25','4','4','2023-07-01','2023-12-31'),(0,'27','Dog Days','145','5','1','2023-01-01','2023-06-30'),(1,'270','sherk','32','4','4','2023-07-01','2023-12-31'),(1,'271','sherk','49','4','4','2023-07-01','2023-12-31'),(1,'272','sherk','55','4','4','2023-07-01','2023-12-31'),(1,'273','sherk','73','4','4','2023-07-01','2023-12-31'),(1,'274','sherk','79','4','4','2023-07-01','2023-12-31'),(1,'275','sherk','97','4','4','2023-07-01','2023-12-31'),(1,'276','sherk','103','4','4','2023-07-01','2023-12-31'),(1,'277','sherk','121','4','4','2023-07-01','2023-12-31'),(1,'278','sherk','144','4','4','2023-07-01','2023-12-31'),(1,'279','sherk','156','4','4','2023-07-01','2023-12-31'),(0,'28','Dog Days','158','5','1','2023-01-01','2023-06-30'),(1,'280','sherk','162','4','4','2023-07-01','2023-12-31'),(0,'281','spider man','1','1','5','2023-01-01','2023-08-31'),(0,'282','spider man','13','1','5','2023-01-01','2023-08-31'),(0,'283','spider man','29','1','5','2023-01-01','2023-08-31'),(0,'284','spider man','48','1','5','2023-01-01','2023-08-31'),(0,'285','spider man','59','1','5','2023-01-01','2023-08-31'),(0,'286','spider man','71','1','5','2023-01-01','2023-08-31'),(0,'287','spider man','75','1','5','2023-01-01','2023-08-31'),(0,'288','spider man','85','1','5','2023-01-01','2023-08-31'),(0,'289','spider man','100','1','5','2023-01-01','2023-08-31'),(0,'29','Dog Days','1','3','1','2023-01-01','2023-06-30'),(0,'290','spider man','106','1','5','2023-01-01','2023-08-31'),(0,'291','spider man','125','1','5','2023-01-01','2023-08-31'),(0,'292','spider man','135','1','5','2023-01-01','2023-08-31'),(0,'293','spider man','155','1','5','2023-01-01','2023-08-31'),(0,'294','spider man','168','1','5','2023-01-01','2023-08-31'),(0,'295','spider man','1','5','5','2023-01-01','2023-08-31'),(0,'296','spider man','12','5','5','2023-01-01','2023-08-31'),(0,'297','spider man','25','5','5','2023-01-01','2023-08-31'),(0,'298','spider man','36','5','5','2023-01-01','2023-08-31'),(0,'299','spider man','49','5','5','2023-01-01','2023-08-31'),(0,'3','Dog Days','29','1','1','2023-01-01','2023-06-30'),(0,'30','Dog Days','18','3','1','2023-01-01','2023-06-30'),(0,'300','spider man','56','5','5','2023-01-01','2023-08-31'),(0,'301','spider man','73','5','5','2023-01-01','2023-08-31'),(0,'302','spider man','80','5','5','2023-01-01','2023-08-31'),(0,'303','spider man','97','5','5','2023-01-01','2023-08-31'),(0,'304','spider man','110','5','5','2023-01-01','2023-08-31'),(0,'305','spider man','121','5','5','2023-01-01','2023-08-31'),(0,'306','spider man','132','5','5','2023-01-01','2023-08-31'),(0,'307','spider man','145','5','5','2023-01-01','2023-08-31'),(0,'308','spider man','158','5','5','2023-01-01','2023-08-31'),(0,'309','spider man','1','3','5','2023-01-01','2023-08-31'),(0,'31','Dog Days','26','3','1','2023-01-01','2023-06-30'),(0,'310','spider man','18','3','5','2023-01-01','2023-08-31'),(0,'311','spider man','26','3','5','2023-01-01','2023-08-31'),(0,'312','spider man','40','3','5','2023-01-01','2023-08-31'),(0,'313','spider man','51','3','5','2023-01-01','2023-08-31'),(0,'314','spider man','64','3','5','2023-01-01','2023-08-31'),(0,'315','spider man','74','3','5','2023-01-01','2023-08-31'),(0,'316','spider man','88','3','5','2023-01-01','2023-08-31'),(0,'317','spider man','98','3','5','2023-01-01','2023-08-31'),(0,'318','spider man','110','3','5','2023-01-01','2023-08-31'),(0,'319','spider man','122','3','5','2023-01-01','2023-08-31'),(0,'32','Dog Days','40','3','1','2023-01-01','2023-06-30'),(0,'320','spider man','134','3','5','2023-01-01','2023-08-31'),(0,'321','spider man','146','3','5','2023-01-01','2023-08-31'),(0,'322','spider man','160','3','5','2023-01-01','2023-08-31'),(0,'323','spider man','2','2','5','2023-01-01','2023-08-31'),(0,'324','spider man','24','2','5','2023-01-01','2023-08-31'),(0,'325','spider man','57','2','5','2023-01-01','2023-08-31'),(0,'326','spider man','45','2','5','2023-01-01','2023-08-31'),(0,'327','spider man','50','2','5','2023-01-01','2023-08-31'),(0,'328','spider man','65','2','5','2023-01-01','2023-08-31'),(0,'329','spider man','74','2','5','2023-01-01','2023-08-31'),(0,'33','Dog Days','51','3','1','2023-01-01','2023-06-30'),(0,'330','spider man','95','2','5','2023-01-01','2023-08-31'),(0,'331','spider man','97','2','5','2023-01-01','2023-08-31'),(0,'332','spider man','102','2','5','2023-01-01','2023-08-31'),(0,'333','spider man','125','2','5','2023-01-01','2023-08-31'),(0,'334','spider man','143','2','5','2023-01-01','2023-08-31'),(0,'335','spider man','145','2','5','2023-01-01','2023-08-31'),(0,'336','spider man','152','2','5','2023-01-01','2023-08-31'),(0,'337','spider man','1','4','5','2023-01-01','2023-08-31'),(0,'338','spider man','7','4','5','2023-01-01','2023-08-31'),(0,'339','spider man','25','4','5','2023-01-01','2023-08-31'),(0,'34','Dog Days','64','3','1','2023-01-01','2023-06-30'),(0,'340','spider man','32','4','5','2023-01-01','2023-08-31'),(0,'341','spider man','49','4','5','2023-01-01','2023-08-31'),(0,'342','spider man','55','4','5','2023-01-01','2023-08-31'),(0,'343','spider man','73','4','5','2023-01-01','2023-08-31'),(0,'344','spider man','79','4','5','2023-01-01','2023-08-31'),(0,'345','spider man','97','4','5','2023-01-01','2023-08-31'),(0,'346','spider man','103','4','5','2023-01-01','2023-08-31'),(0,'347','spider man','121','4','5','2023-01-01','2023-08-31'),(0,'348','spider man','144','4','5','2023-01-01','2023-08-31'),(0,'349','spider man','156','4','5','2023-01-01','2023-08-31'),(0,'35','Dog Days','74','3','1','2023-01-01','2023-06-30'),(0,'350','spider man','162','4','5','2023-01-01','2023-08-31'),(0,'36','Dog Days','88','3','1','2023-01-01','2023-06-30'),(0,'37','Dog Days','98','3','1','2023-01-01','2023-06-30'),(0,'38','Dog Days','110','3','1','2023-01-01','2023-06-30'),(0,'39','Dog Days','122','3','1','2023-01-01','2023-06-30'),(0,'4','Dog Days','48','1','1','2023-01-01','2023-06-30'),(0,'40','Dog Days','134','3','1','2023-01-01','2023-06-30'),(0,'41','Dog Days','146','3','1','2023-01-01','2023-06-30'),(0,'42','Dog Days','160','3','1','2023-01-01','2023-06-30'),(0,'43','Dog Days','2','2','1','2023-01-01','2023-06-30'),(0,'44','Dog Days','24','2','1','2023-01-01','2023-06-30'),(0,'45','Dog Days','57','2','1','2023-01-01','2023-06-30'),(0,'46','Dog Days','45','2','1','2023-01-01','2023-06-30'),(0,'47','Dog Days','50','2','1','2023-01-01','2023-06-30'),(0,'48','Dog Days','65','2','1','2023-01-01','2023-06-30'),(0,'49','Dog Days','74','2','1','2023-01-01','2023-06-30'),(0,'5','Dog Days','59','1','1','2023-01-01','2023-06-30'),(0,'50','Dog Days','95','2','1','2023-01-01','2023-06-30'),(0,'51','Dog Days','97','2','1','2023-01-01','2023-06-30'),(0,'52','Dog Days','102','2','1','2023-01-01','2023-06-30'),(0,'53','Dog Days','125','2','1','2023-01-01','2023-06-30'),(0,'54','Dog Days','143','2','1','2023-01-01','2023-06-30'),(0,'55','Dog Days','145','2','1','2023-01-01','2023-06-30'),(0,'56','Dog Days','152','2','1','2023-01-01','2023-06-30'),(0,'57','Dog Days','1','4','1','2023-01-01','2023-06-30'),(0,'58','Dog Days','7','4','1','2023-01-01','2023-06-30'),(0,'59','Dog Days','25','4','1','2023-01-01','2023-06-30'),(0,'6','Dog Days','71','1','1','2023-01-01','2023-06-30'),(0,'60','Dog Days','32','4','1','2023-01-01','2023-06-30'),(0,'61','Dog Days','49','4','1','2023-01-01','2023-06-30'),(0,'62','Dog Days','55','4','1','2023-01-01','2023-06-30'),(0,'63','Dog Days','73','4','1','2023-01-01','2023-06-30'),(0,'64','Dog Days','79','4','1','2023-01-01','2023-06-30'),(0,'65','Dog Days','97','4','1','2023-01-01','2023-06-30'),(0,'66','Dog Days','103','4','1','2023-01-01','2023-06-30'),(0,'67','Dog Days','121','4','1','2023-01-01','2023-06-30'),(0,'68','Dog Days','144','4','1','2023-01-01','2023-06-30'),(0,'69','Dog Days','156','4','1','2023-01-01','2023-06-30'),(0,'7','Dog Days','75','1','1','2023-01-01','2023-06-30'),(0,'70','Dog Days','162','4','1','2023-01-01','2023-06-30'),(1,'71','Flushed away','1','1','2','2023-06-01','2023-12-31'),(1,'72','Flushed away','13','1','2','2023-06-01','2023-12-31'),(1,'73','Flushed away','29','1','2','2023-06-01','2023-12-31'),(1,'74','Flushed away','48','1','2','2023-06-01','2023-12-31'),(1,'75','Flushed away','59','1','2','2023-06-01','2023-12-31'),(1,'76','Flushed away','71','1','2','2023-06-01','2023-12-31'),(1,'77','Flushed away','75','1','2','2023-06-01','2023-12-31'),(1,'78','Flushed away','85','1','2','2023-06-01','2023-12-31'),(1,'79','Flushed away','100','1','2','2023-06-01','2023-12-31'),(0,'8','Dog Days','85','1','1','2023-01-01','2023-06-30'),(1,'80','Flushed away','106','1','2','2023-06-01','2023-12-31'),(1,'81','Flushed away','125','1','2','2023-06-01','2023-12-31'),(1,'82','Flushed away','135','1','2','2023-06-01','2023-12-31'),(1,'83','Flushed away','155','1','2','2023-06-01','2023-12-31'),(1,'84','Flushed away','168','1','2','2023-06-01','2023-12-31'),(1,'85','Flushed away','1','5','2','2023-06-01','2023-12-31'),(1,'86','Flushed away','12','5','2','2023-06-01','2023-12-31'),(1,'87','Flushed away','25','5','2','2023-06-01','2023-12-31'),(1,'88','Flushed away','36','5','2','2023-06-01','2023-12-31'),(1,'89','Flushed away','49','5','2','2023-06-01','2023-12-31'),(0,'9','Dog Days','100','1','1','2023-01-01','2023-06-30'),(1,'90','Flushed away','56','5','2','2023-06-01','2023-12-31'),(1,'91','Flushed away','73','5','2','2023-06-01','2023-12-31'),(1,'92','Flushed away','80','5','2','2023-06-01','2023-12-31'),(1,'93','Flushed away','97','5','2','2023-06-01','2023-12-31'),(1,'94','Flushed away','110','5','2','2023-06-01','2023-12-31'),(1,'95','Flushed away','121','5','2','2023-06-01','2023-12-31'),(1,'96','Flushed away','132','5','2','2023-06-01','2023-12-31'),(1,'97','Flushed away','145','5','2','2023-06-01','2023-12-31'),(1,'98','Flushed away','158','5','2','2023-06-01','2023-12-31'),(1,'99','Flushed away','1','3','2','2023-06-01','2023-12-31');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payroll` (
  `emp_ID` varchar(5) NOT NULL,
  `salary` decimal(4,2) NOT NULL DEFAULT 10.00,
  `SSN` varchar(9) NOT NULL,
  `acct_num` varchar(13) DEFAULT NULL,
  `routing_num` varchar(13) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`emp_ID`),
  CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`emp_ID`) REFERENCES `employees` (`emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES ('1',9.75,'123456797','1800180018001','1231231231239','102 Sist'),('10000',9.75,'123456793','1400140014001','1231231231235','120 Fermilab'),('12345',9.75,'123456789','1000100010001','1231231231231','501 W Fell '),('12346',9.75,'123456790','1100110011001','1231231231232','40 N East'),('12347',10.00,'123456791','1200120012001','1231231231233','192 Golf View'),('12348',12.00,'123456792','1300130013001','1231231231234','49 Tiger St'),('2',9.75,'123456798','1900190019001','1231231231240','612 Anime St'),('20000',9.75,'123456794','1500150015001','1231231231236','81 Satama'),('3',10.00,'123456799','2000200020001','1231231231241','810 N Cowboy'),('30000',10.00,'123456795','1600160016001','1231231231237','401 Computing'),('4',12.00,'123456800','2100210021001','1231231231242','312 High Rollers'),('40000',12.00,'123456796','1700170017001','1231231231238','591 Kawishiwi'),('70',9.75,'123456801','2200220022001','1231231231243','192 Dragon Ave'),('71',9.75,'123456802','2300230023001','1231231231244','691 Emori Dr'),('72',10.00,'123456803','2400240024001','1231231231245','810 Franken Ave'),('73',12.00,'123456804','2500250025001','1231231231246','29 Toodles St'),('99996',12.00,'123456808','2900290029001','1231231231250','101 Webkin Ave'),('99997',10.00,'123456807','2800280028001','1231231231249','72 Finch St'),('99998',9.75,'123456806','2700270027001','1231231231248','910 Penguin Ave'),('99999',9.75,'123456805','2600260026001','1231231231247','101 Buzz Bean');
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screens` (
  `screen_ID` varchar(4) NOT NULL,
  `loc_ID` varchar(5) NOT NULL,
  `screen_num` varchar(2) NOT NULL,
  `seat_type` varchar(10) DEFAULT NULL,
  `screen_type` varchar(10) DEFAULT NULL,
  `capacity` decimal(3,0) NOT NULL,
  PRIMARY KEY (`screen_ID`),
  KEY `loc_ID` (`loc_ID`),
  CONSTRAINT `screens_ibfk_1` FOREIGN KEY (`loc_ID`) REFERENCES `theater` (`loc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES ('1','1','1','basic','2D',50),('10','1','10','lux','2D',35),('11','2','1','basic','3D',35),('12','2','2','recliner','imax',35),('13','2','3','lux','2D',29),('14','2','4','basic','3D',50),('15','2','5','basic','imax',25),('16','3','1','recliner','imax',25),('17','3','2','lux','2D',50),('18','3','3','basic','3D',50),('19','3','4','recliner','imax',25),('2','1','2','recliner','3D',50),('20','3','5','lux','2D',60),('21','3','6','basic','3D',37),('22','3','7','basic','imax',15),('23','3','8','recliner','2D',50),('24','3','9','lux','3D',50),('25','3','10','basic','imax',24),('26','3','11','recliner','2D',25),('27','4','1','lux','2D',60),('28','4','2','basic','2D',50),('29','4','3','basic','3D',50),('3','1','3','lux','imax',25),('30','4','4','recliner','2D',45),('31','4','5','lux','3D',45),('32','4','6','basic','imax',25),('33','4','7','recliner','imax',25),('34','4','8','lux','2D',50),('35','4','9','basic','3D',50),('36','5','1','basic','imax',36),('37','5','2','recliner','2D',37),('38','5','3','lux','3D',37),('39','5','4','basic','imax',25),('4','1','4','basic','2D',50),('40','5','5','recliner','2D',30),('41','5','6','lux','3D',30),('42','5','7','basic','imax',35),('5','1','5','recliner','2D',50),('6','1','6','lux','3D',60),('7','1','7','basic','imax',35),('8','1','8','basic','2D',28),('9','1','9','recliner','3D',38);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theater` (
  `loc_ID` varchar(5) NOT NULL,
  `location` varchar(20) NOT NULL,
  `num_screens` int(2) NOT NULL,
  `con_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`loc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES ('1','chicago',10,'basic'),('2','New York',5,'null'),('3','minneapolis',11,'full'),('4','Seattle',9,'restaurant'),('5','Dallas',7,'basic');
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_slot` (
  `slot_ID` varchar(4) NOT NULL,
  `day` varchar(1) DEFAULT NULL,
  `start_hr` decimal(2,0) DEFAULT NULL,
  `start_min` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`slot_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES ('1','0',12,0),('10','0',16,30),('100','4',13,30),('101','4',14,0),('102','4',14,30),('103','4',15,0),('104','4',15,30),('105','4',16,0),('106','4',16,30),('107','4',17,0),('108','4',17,30),('109','4',18,0),('11','0',17,0),('110','4',18,30),('111','4',19,0),('112','4',19,30),('113','4',20,0),('114','4',20,30),('115','4',21,0),('116','4',21,30),('117','4',22,0),('118','4',22,30),('119','4',23,0),('12','0',17,30),('120','4',23,30),('121','5',12,0),('122','5',12,30),('123','5',13,0),('124','5',13,30),('125','5',14,0),('126','5',14,30),('127','5',15,0),('128','5',15,30),('129','5',16,0),('13','0',18,0),('130','5',16,30),('131','5',17,0),('132','5',17,30),('133','5',18,0),('134','5',18,30),('135','5',19,0),('136','5',19,30),('137','5',20,0),('138','5',20,30),('139','5',21,0),('14','0',18,30),('140','5',21,30),('141','5',22,0),('142','5',22,30),('143','5',23,0),('144','5',23,30),('145','6',12,0),('146','6',12,30),('147','6',13,0),('148','6',13,30),('149','6',14,0),('15','0',19,0),('150','6',14,30),('151','6',15,0),('152','6',15,30),('153','6',16,0),('154','6',16,30),('155','6',17,0),('156','6',17,30),('157','6',18,0),('158','6',18,30),('159','6',19,0),('16','0',19,30),('160','6',19,30),('161','6',20,0),('162','6',20,30),('163','6',21,0),('164','6',21,30),('165','6',22,0),('166','6',22,30),('167','6',23,0),('168','6',23,30),('17','0',20,0),('18','0',20,30),('19','0',21,0),('2','0',12,30),('20','0',21,30),('21','0',22,0),('22','0',22,30),('23','0',23,0),('24','0',23,30),('25','1',12,0),('26','1',12,30),('27','1',13,0),('28','1',13,30),('29','1',14,0),('3','0',13,0),('30','1',14,30),('31','1',15,0),('32','1',15,30),('33','1',16,0),('34','1',16,30),('35','1',17,0),('36','1',17,30),('37','1',18,0),('38','1',18,30),('39','1',19,0),('4','0',13,30),('40','1',19,30),('41','1',20,0),('42','1',20,30),('43','1',21,0),('44','1',21,30),('45','1',22,0),('46','1',22,30),('47','1',23,0),('48','1',23,30),('49','2',12,0),('5','0',14,0),('50','2',12,30),('51','2',13,0),('52','2',13,30),('53','2',14,0),('54','2',14,30),('55','2',15,0),('56','2',15,30),('57','2',16,0),('58','2',16,30),('59','2',17,0),('6','0',14,30),('60','2',17,30),('61','2',18,0),('62','2',18,30),('63','2',19,0),('64','2',19,30),('65','2',20,0),('66','2',20,30),('67','2',21,0),('68','2',21,30),('69','2',22,0),('7','0',15,0),('70','2',22,30),('71','2',23,0),('72','2',23,30),('73','3',12,0),('74','3',12,30),('75','3',13,0),('76','3',13,30),('77','3',14,0),('78','3',14,30),('79','3',15,0),('8','0',15,30),('80','3',15,30),('81','3',16,0),('82','3',16,30),('83','3',17,0),('84','3',17,30),('85','3',18,0),('86','3',18,30),('87','3',19,0),('88','3',19,30),('89','3',20,0),('9','0',16,0),('90','3',20,30),('91','3',21,0),('92','3',21,30),('93','3',22,0),('94','3',22,30),('95','3',23,0),('96','3',23,30),('97','4',12,0),('98','4',12,30),('99','4',13,0);
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training` (
  `emp_ID` varchar(5) NOT NULL,
  `con_training` tinyint(1) DEFAULT NULL,
  `tix_training` tinyint(1) DEFAULT NULL,
  `man_training` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`emp_ID`),
  CONSTRAINT `training_ibfk_1` FOREIGN KEY (`emp_ID`) REFERENCES `employees` (`emp_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES ('1',0,1,0),('10000',0,1,0),('12345',0,1,0),('12346',0,1,0),('12347',1,0,0),('12348',1,1,1),('2',0,1,0),('20000',0,1,0),('3',1,0,0),('30000',1,0,0),('4',1,1,1),('40000',1,1,1),('70',0,1,0),('71',0,1,0),('72',1,0,0),('73',1,1,1),('99996',1,1,1),('99997',1,0,0),('99998',0,1,0),('99999',0,1,0);
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 10:54:12