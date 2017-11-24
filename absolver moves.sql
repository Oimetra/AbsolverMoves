-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: absolver
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `axis`
--

DROP TABLE IF EXISTS `axis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `axis` (
  `axis_id` tinyint(3) NOT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`axis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `axis`
--

LOCK TABLES `axis` WRITE;
/*!40000 ALTER TABLE `axis` DISABLE KEYS */;
INSERT INTO `axis` VALUES (1,'vertical'),(2,'horizontal');
/*!40000 ALTER TABLE `axis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` tinyint(3) NOT NULL,
  `desc` varchar(15) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'bare hands'),(2,'sword');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deck`
--

DROP TABLE IF EXISTS `deck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deck` (
  `deck_id` tinyint(3) NOT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`deck_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deck`
--

LOCK TABLES `deck` WRITE;
/*!40000 ALTER TABLE `deck` DISABLE KEYS */;
INSERT INTO `deck` VALUES (1,'bare hands'),(2,'sword');
/*!40000 ALTER TABLE `deck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `grade_id` tinyint(3) NOT NULL,
  `name` char(1) NOT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,'E'),(2,'D'),(3,'C'),(4,'B'),(5,'A'),(6,'S');
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `height`
--

DROP TABLE IF EXISTS `height`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `height` (
  `height_id` tinyint(3) NOT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`height_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `height`
--

LOCK TABLES `height` WRITE;
/*!40000 ALTER TABLE `height` DISABLE KEYS */;
INSERT INTO `height` VALUES (1,'high'),(2,'mid'),(3,'low');
/*!40000 ALTER TABLE `height` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `move`
--

DROP TABLE IF EXISTS `move`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `move` (
  `move_id` smallint(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `style` tinyint(4) NOT NULL,
  `category` tinyint(4) NOT NULL,
  `transition` tinyint(4) NOT NULL,
  `parry` tinyint(4) DEFAULT NULL,
  `axis` tinyint(4) DEFAULT NULL,
  `height` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`move_id`),
  KEY `move_style_fk_idx` (`style`),
  KEY `move_category_fk_idx` (`category`),
  KEY `move_transition_fk_idx` (`transition`),
  KEY `move_parry_fk_idx` (`parry`),
  KEY `move_axis_fk_idx` (`axis`),
  KEY `move_height_fk_idx` (`height`),
  CONSTRAINT `move_axis_fk` FOREIGN KEY (`axis`) REFERENCES `axis` (`axis_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `move_category_fk` FOREIGN KEY (`category`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `move_height_fk` FOREIGN KEY (`height`) REFERENCES `height` (`height_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `move_parry_fk` FOREIGN KEY (`parry`) REFERENCES `parry` (`parry_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `move_style_fk` FOREIGN KEY (`style`) REFERENCES `style` (`style_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `move_transition_fk` FOREIGN KEY (`transition`) REFERENCES `transition` (`transition_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `move`
--

LOCK TABLES `move` WRITE;
/*!40000 ALTER TABLE `move` DISABLE KEYS */;
INSERT INTO `move` VALUES (1,'Jab Punch',2,1,1,NULL,NULL,NULL),(2,'Straight Punch',2,1,4,NULL,NULL,NULL),(3,'Roll Punch',3,1,4,NULL,NULL,NULL),(4,'Low Kick',2,1,3,NULL,NULL,NULL),(5,'Cross Punch',2,1,1,NULL,NULL,NULL),(6,'Spinning High Kick',2,1,2,NULL,NULL,NULL),(7,'Hammer Kick',1,1,4,NULL,NULL,NULL),(8,'Jumped Light Kick',1,1,4,NULL,NULL,NULL),(9,'Winged Back Kick',2,1,2,NULL,NULL,NULL),(10,'Mawashi',1,1,3,NULL,NULL,NULL),(11,'360 Tornado Kick',2,1,2,NULL,NULL,NULL),(12,'Falcon Punch',2,1,1,NULL,NULL,NULL),(13,'Furious Uppercut',2,1,3,NULL,NULL,NULL),(14,'MeiaLua',3,1,4,NULL,NULL,NULL),(15,'Curled Up Uppercut',3,1,4,NULL,NULL,NULL),(16,'Cleaver Blow',3,1,1,NULL,NULL,NULL),(17,'Leg Breaker',3,1,4,NULL,NULL,NULL),(18,'Pulmonary Palm',1,1,1,NULL,NULL,NULL),(19,'Ankle Stamp',1,1,2,NULL,NULL,NULL),(20,'Dwit Chagi',1,1,3,NULL,NULL,NULL),(21,'Front Sweep',1,1,2,NULL,NULL,NULL),(22,'Bending Palm',1,1,3,NULL,NULL,NULL),(23,'Crouching Elbow',3,1,2,NULL,NULL,NULL),(24,'Direct Punch',1,1,1,NULL,NULL,NULL),(25,'Elbow Stumble',4,1,4,NULL,NULL,NULL),(26,'Wobble Low Kick',4,1,2,NULL,NULL,NULL),(27,'Spiral Back Punch',4,1,2,NULL,NULL,NULL),(28,'Drunk Stomp',4,1,4,NULL,NULL,NULL),(29,'Jar Bash',4,1,4,NULL,NULL,NULL),(30,'Knife Hand Strike',1,1,2,NULL,NULL,NULL),(31,'Hook',2,1,1,NULL,NULL,NULL),(32,'Side Kick',3,1,4,NULL,NULL,NULL),(33,'Back Fist',3,1,1,NULL,NULL,NULL),(34,'Roll Back Fist',1,1,3,NULL,NULL,NULL),(35,'Front Kick',3,1,4,NULL,NULL,NULL),(36,'Charged Haymaker',3,1,4,NULL,NULL,NULL),(37,'Body Blow',3,1,4,NULL,NULL,NULL),(38,'Crushing Palm',1,1,3,NULL,NULL,NULL),(39,'Bounce Knee',3,1,3,NULL,NULL,NULL),(40,'Jump Out Elbow',3,1,2,NULL,NULL,NULL),(41,'Rising Kick',1,1,2,NULL,NULL,NULL),(42,'Calbot',2,1,4,NULL,NULL,NULL),(43,'Mill Punch',2,1,3,NULL,NULL,NULL),(44,'Tripped Kick',2,1,4,NULL,NULL,NULL),(45,'Drunk Crane',4,1,2,NULL,NULL,NULL),(46,'Wrist Jab',4,1,1,NULL,NULL,NULL),(47,'Double Spike Kick',4,1,1,NULL,NULL,NULL),(48,'Foot Slap',4,1,3,NULL,NULL,NULL),(49,'Drunken Paw',4,1,2,NULL,NULL,NULL),(50,'Hadrunken',4,1,1,NULL,NULL,NULL),(51,'Handstand Kick',4,1,3,NULL,NULL,NULL),(52,'Fast Back Fist',1,1,2,NULL,NULL,NULL),(53,'Parry & Strike',2,1,2,NULL,NULL,NULL),(54,'Spin Back Fist',2,1,4,NULL,NULL,NULL),(55,'Pushed Elbow',3,1,4,NULL,NULL,NULL),(56,'Pushed Back Kick',2,1,1,NULL,NULL,NULL),(57,'Jumped Spin Kick',2,1,4,NULL,NULL,NULL),(58,'Fast Punch',2,1,2,NULL,NULL,NULL),(59,'Knee Strike',2,1,3,NULL,NULL,NULL),(60,'Uramawashi',1,1,3,NULL,NULL,NULL),(61,'Illusion Twist Kick',1,1,2,NULL,NULL,NULL),(62,'Upper Elbow',3,1,4,NULL,NULL,NULL),(63,'Spinning Wide Hook',2,1,2,NULL,NULL,NULL),(64,'Tetsuzanko',1,1,4,NULL,NULL,NULL),(65,'Wallop Blow',3,1,1,NULL,NULL,NULL),(66,'Double Palm',1,1,3,NULL,NULL,NULL),(67,'Slap Kick',1,1,1,NULL,NULL,NULL),(68,'Soto-uke',1,1,3,NULL,NULL,NULL),(69,'Collar Chop',1,1,1,NULL,NULL,NULL),(70,'Liver Knee',3,1,3,NULL,NULL,NULL),(71,'Back Tripped Kick',3,1,2,NULL,NULL,NULL),(72,'Scissor Kick',2,1,4,NULL,NULL,NULL),(73,'Stretch Out Hook',2,1,3,NULL,NULL,NULL),(74,'Chin Palm',1,1,1,NULL,NULL,NULL),(75,'Spiral Palm',1,1,2,NULL,NULL,NULL),(76,'Back Turn Wrist',4,1,4,NULL,NULL,NULL),(77,'Whirlwind Double Punch',4,1,2,NULL,NULL,NULL),(78,'Backfall Strike',4,1,1,NULL,NULL,NULL),(79,'Twist Back Kick',4,1,1,NULL,NULL,NULL),(80,'Grab Punch',4,1,2,NULL,NULL,NULL),(81,'Eye Poke',4,1,2,NULL,NULL,NULL),(82,'Donkey Slap',4,1,1,NULL,NULL,NULL),(83,'Gut Punch',4,1,3,NULL,NULL,NULL),(84,'Drunken Smash',4,1,3,NULL,NULL,NULL),(85,'Fast Elbow',2,1,1,NULL,NULL,NULL),(86,'Spin Elbow',2,1,4,NULL,NULL,NULL),(87,'Low Spin Heel',1,1,2,NULL,NULL,NULL),(88,'Axe Kick',2,1,3,NULL,NULL,NULL),(89,'Roll Uppercut',3,1,3,NULL,NULL,NULL),(90,'Jackhammer Punch',3,1,2,NULL,NULL,NULL),(91,'Surging Palm',1,1,4,NULL,NULL,NULL),(92,'Underknee Kick',3,1,1,NULL,NULL,NULL),(93,'Twist Parry Strike',2,1,1,NULL,NULL,NULL),(94,'Double Fist Stretch',4,1,4,NULL,NULL,NULL),(95,'Back Hop Wrist',4,1,1,NULL,NULL,NULL),(96,'Spinning Flute Swing',4,1,2,NULL,NULL,NULL),(97,'Rising Slash',2,2,4,NULL,NULL,NULL),(98,'Keen Crouch',1,2,4,NULL,NULL,NULL),(99,'Pommel Bash',2,2,3,NULL,NULL,NULL),(100,'Light Swing Slash',1,2,4,NULL,NULL,NULL),(101,'Reverse Rising Slash',3,2,4,NULL,NULL,NULL),(102,'Reverse Sharp Slash',3,2,3,NULL,NULL,NULL),(103,'Reverse One Handed Slash',3,2,3,NULL,NULL,NULL),(104,'Parry Reverse Low Slash',3,2,2,NULL,NULL,NULL),(105,'Reverse Feet Thrust',3,2,1,NULL,NULL,NULL),(106,'Swirl Slash',1,2,2,NULL,NULL,NULL),(107,'Buchinmo',3,2,1,NULL,NULL,NULL),(108,'Spoon Slash',4,2,4,NULL,NULL,NULL),(109,'Sickle Slash',4,2,2,NULL,NULL,NULL),(110,'Tendon Slash',4,2,3,NULL,NULL,NULL),(111,'Head Splitter',2,2,4,NULL,NULL,NULL),(112,'Painstaking Slash',2,2,4,NULL,NULL,NULL),(113,'Light Thrust',2,2,1,NULL,NULL,NULL),(114,'One Handed Slash',1,2,2,NULL,NULL,NULL),(115,'Side Wind Thrust',1,2,4,NULL,NULL,NULL),(116,'Circular Slash',2,2,3,NULL,NULL,NULL),(117,'Body Slicing',3,2,2,NULL,NULL,NULL),(118,'Reverse Twist Slash',3,2,3,NULL,NULL,NULL),(119,'Reverse Hips Slash',3,2,4,NULL,NULL,NULL),(120,'Whirl Slash',1,2,3,NULL,NULL,NULL),(121,'Digging Parry Elbow',2,2,3,NULL,NULL,NULL),(122,'Kitsuneo Cut',1,2,1,NULL,NULL,NULL),(123,'Parry Shove',2,2,3,NULL,NULL,NULL),(124,'Puropera Cut',2,2,2,NULL,NULL,NULL),(125,'Tei-nami',1,2,1,NULL,NULL,NULL),(126,'Inward Slash',4,2,4,NULL,NULL,NULL),(127,'Slip Slash',4,2,2,NULL,NULL,NULL),(128,'Obvious Slash',4,2,1,NULL,NULL,NULL),(129,'Typhoon Slash',4,2,3,NULL,NULL,NULL),(130,'Parry Slash',2,2,3,NULL,NULL,NULL),(131,'Ram Thrust',2,2,2,NULL,NULL,NULL),(132,'Seven Star Thrust',1,2,3,NULL,NULL,NULL),(133,'Limbo Thrust',1,2,3,NULL,NULL,NULL),(134,'Ground Swell Slash',2,2,1,NULL,NULL,NULL),(135,'Side Thrust',3,2,3,NULL,NULL,NULL),(136,'Reverse Rising Thrust',3,2,4,NULL,NULL,NULL),(137,'Spiral Slash',2,2,4,NULL,NULL,NULL),(138,'Parry Pommel Bash',3,2,2,NULL,NULL,NULL),(139,'Duster Blow',1,2,4,NULL,NULL,NULL),(140,'Shapu Furiko',3,2,1,NULL,NULL,NULL),(141,'Poke Thrust',4,2,4,NULL,NULL,NULL),(142,'Stumble Slash',4,2,3,NULL,NULL,NULL),(143,'Wrist Roll Slash',4,2,2,NULL,NULL,NULL),(144,'Wide Slash',4,2,1,NULL,NULL,NULL),(145,'Vertical Slash',2,2,3,NULL,NULL,NULL),(146,'Ducking Spike',1,2,1,NULL,NULL,NULL),(147,'Dash Slash',1,2,3,NULL,NULL,NULL),(148,'Rising Spin Slash',2,2,4,NULL,NULL,NULL),(149,'Mill Slash',1,2,2,NULL,NULL,NULL),(150,'Thunder Slash',2,2,1,NULL,NULL,NULL),(151,'Back Thrust',3,2,4,NULL,NULL,NULL),(152,'Rising Double Hand',3,2,4,NULL,NULL,NULL),(153,'Twist Hips Slash',2,2,2,NULL,NULL,NULL),(154,'Needle Point',1,2,4,NULL,NULL,NULL),(155,'Nose Stab',4,2,3,NULL,NULL,NULL),(156,'Woosh Slash',4,2,4,NULL,NULL,NULL),(157,'Drop Slash',4,2,1,NULL,NULL,NULL),(158,'Forward Lean Slash',4,2,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `move` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `move_deck_stance`
--

DROP TABLE IF EXISTS `move_deck_stance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `move_deck_stance` (
  `move_id` smallint(6) NOT NULL,
  `deck_id` tinyint(4) NOT NULL,
  `stance_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`move_id`,`deck_id`,`stance_id`),
  KEY `mds_deck_fk_idx` (`deck_id`),
  KEY `mds_stance_fk_idx` (`stance_id`),
  CONSTRAINT `mds_deck_fk` FOREIGN KEY (`deck_id`) REFERENCES `deck` (`deck_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mds_move_fk` FOREIGN KEY (`move_id`) REFERENCES `move` (`move_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mds_stance_fk` FOREIGN KEY (`stance_id`) REFERENCES `stance` (`stance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `move_deck_stance`
--

LOCK TABLES `move_deck_stance` WRITE;
/*!40000 ALTER TABLE `move_deck_stance` DISABLE KEYS */;
INSERT INTO `move_deck_stance` VALUES (1,1,1),(1,1,4),(2,1,1),(2,1,4),(3,1,1),(3,1,4),(4,1,1),(4,1,4),(5,1,1),(5,1,4),(6,1,1),(6,1,4),(7,1,1),(7,1,4),(8,1,1),(8,1,4),(9,1,1),(9,1,4),(10,1,1),(10,1,4),(11,1,1),(11,1,4),(12,1,1),(12,1,4),(13,1,1),(13,1,4),(14,1,1),(14,1,4),(15,1,1),(15,1,4),(16,1,1),(16,1,4),(17,1,1),(17,1,4),(18,1,1),(18,1,4),(19,1,1),(19,1,4),(20,1,1),(20,1,4),(21,1,1),(21,1,4),(22,1,1),(22,1,4),(23,1,1),(23,1,4),(24,1,1),(24,1,4),(25,1,1),(25,1,4),(26,1,1),(26,1,4),(27,1,1),(27,1,4),(28,1,1),(28,1,4),(29,1,1),(29,1,4),(30,1,1),(30,1,4),(31,1,1),(31,1,4),(32,1,1),(32,1,4),(33,1,1),(33,1,4),(34,1,1),(34,1,4),(35,1,1),(35,1,4),(36,1,1),(36,1,4),(37,1,1),(37,1,4),(38,1,1),(38,1,4),(39,1,1),(39,1,4),(40,1,1),(40,1,4),(41,1,1),(41,1,4),(42,1,1),(42,1,4),(43,1,1),(43,1,4),(44,1,1),(44,1,4),(45,1,1),(45,1,4),(46,1,1),(46,1,4),(47,1,1),(47,1,4),(48,1,1),(48,1,4),(49,1,1),(49,1,4),(50,1,1),(50,1,4),(51,1,1),(51,1,4),(52,1,2),(52,1,3),(53,1,2),(53,1,3),(54,1,2),(54,1,3),(55,1,2),(55,1,3),(56,1,2),(56,1,3),(57,1,2),(57,1,3),(58,1,2),(58,1,3),(59,1,2),(59,1,3),(60,1,2),(60,1,3),(61,1,2),(61,1,3),(62,1,2),(62,1,3),(63,1,2),(63,1,3),(64,1,2),(64,1,3),(65,1,2),(65,1,3),(66,1,2),(66,1,3),(67,1,2),(67,1,3),(68,1,2),(68,1,3),(69,1,2),(69,1,3),(70,1,2),(70,1,3),(71,1,2),(71,1,3),(72,1,2),(72,1,3),(73,1,2),(73,1,3),(74,1,2),(74,1,3),(75,1,2),(75,1,3),(76,1,2),(76,1,3),(77,1,2),(77,1,3),(78,1,2),(78,1,3),(79,1,2),(79,1,3),(80,1,2),(80,1,3),(81,1,2),(81,1,3),(82,1,2),(82,1,3),(83,1,2),(83,1,3),(84,1,2),(84,1,3),(85,1,2),(85,1,3),(86,1,2),(86,1,3),(87,1,2),(87,1,3),(88,1,2),(88,1,3),(89,1,2),(89,1,3),(90,1,2),(90,1,3),(91,1,2),(91,1,3),(92,1,2),(92,1,3),(93,1,2),(93,1,3),(94,1,2),(94,1,3),(95,1,2),(95,1,3),(96,1,2),(96,1,3),(1,2,1),(4,2,1),(6,2,1),(7,2,1),(8,2,1),(9,2,1),(10,2,1),(11,2,1),(14,2,1),(17,2,1),(19,2,1),(20,2,1),(21,2,1),(23,2,1),(24,2,1),(26,2,1),(28,2,1),(30,2,1),(31,2,1),(32,2,1),(33,2,1),(35,2,1),(37,2,1),(39,2,1),(40,2,1),(41,2,1),(42,2,1),(44,2,1),(47,2,1),(48,2,1),(51,2,1),(97,2,1),(98,2,1),(99,2,1),(100,2,1),(101,2,1),(102,2,1),(103,2,1),(104,2,1),(105,2,1),(106,2,1),(107,2,1),(108,2,1),(109,2,1),(110,2,1),(111,2,4),(112,2,4),(113,2,4),(114,2,4),(115,2,4),(116,2,4),(117,2,4),(118,2,4),(119,2,4),(120,2,4),(121,2,4),(122,2,4),(123,2,4),(124,2,4),(125,2,4),(126,2,4),(127,2,4),(128,2,4),(129,2,4),(130,2,2),(131,2,2),(132,2,2),(133,2,2),(134,2,2),(135,2,2),(136,2,2),(137,2,2),(138,2,2),(139,2,2),(140,2,2),(141,2,2),(142,2,2),(143,2,2),(144,2,2),(145,2,3),(146,2,3),(147,2,3),(148,2,3),(149,2,3),(150,2,3),(151,2,3),(152,2,3),(153,2,3),(154,2,3),(155,2,3),(156,2,3),(157,2,3),(158,2,3);
/*!40000 ALTER TABLE `move_deck_stance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parry`
--

DROP TABLE IF EXISTS `parry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parry` (
  `parry_id` tinyint(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`parry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parry`
--

LOCK TABLES `parry` WRITE;
/*!40000 ALTER TABLE `parry` DISABLE KEYS */;
INSERT INTO `parry` VALUES (1,'parried from same direction attacking character is facing (Left/Right)'),(2,'parried from opposite direction attacking character is facing (Left/Right)'),(3,'parried from either side regardless of direction attacking character is facing (Left/Right)');
/*!40000 ALTER TABLE `parry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scaling`
--

DROP TABLE IF EXISTS `scaling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scaling` (
  `scaling_id` tinyint(3) NOT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`scaling_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scaling`
--

LOCK TABLES `scaling` WRITE;
/*!40000 ALTER TABLE `scaling` DISABLE KEYS */;
INSERT INTO `scaling` VALUES (1,'weapon'),(2,'strenght'),(3,'dexterity'),(4,'mobility');
/*!40000 ALTER TABLE `scaling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special`
--

DROP TABLE IF EXISTS `special`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special` (
  `special_id` tinyint(3) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`special_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special`
--

LOCK TABLES `special` WRITE;
/*!40000 ALTER TABLE `special` DISABLE KEYS */;
INSERT INTO `special` VALUES (1,'ducking attacks'),(2,'jumping attacks'),(3,'strafing attacks'),(4,'stopping attacks'),(5,'parrying attacks'),(6,'breaking attacks'),(7,'charging attacks'),(8,'double hit attacks');
/*!40000 ALTER TABLE `special` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stance`
--

DROP TABLE IF EXISTS `stance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stance` (
  `stance_id` tinyint(4) NOT NULL,
  `x` tinyint(4) NOT NULL,
  `y` tinyint(4) NOT NULL,
  `desc` varchar(2) NOT NULL,
  PRIMARY KEY (`stance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stance`
--

LOCK TABLES `stance` WRITE;
/*!40000 ALTER TABLE `stance` DISABLE KEYS */;
INSERT INTO `stance` VALUES (1,1,1,'NE'),(2,1,-1,'SE'),(3,-1,-1,'SW'),(4,-1,1,'NW');
/*!40000 ALTER TABLE `stance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style` (
  `style_id` tinyint(3) NOT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`style_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES (1,'Windfall'),(2,'Forsaken'),(3,'Kahlt Method'),(4,'Stagger Style');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transition`
--

DROP TABLE IF EXISTS `transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transition` (
  `transition_id` tinyint(4) NOT NULL,
  `x` tinyint(4) NOT NULL,
  `y` tinyint(4) NOT NULL,
  `desc` varchar(50) NOT NULL,
  PRIMARY KEY (`transition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transition`
--

LOCK TABLES `transition` WRITE;
/*!40000 ALTER TABLE `transition` DISABLE KEYS */;
INSERT INTO `transition` VALUES (1,1,1,'stays on same stance'),(2,1,-1,'switches vertically (North/South)'),(3,-1,-1,'switches diagonally (both orientations)'),(4,-1,1,'switches horizontally (East/West)');
/*!40000 ALTER TABLE `transition` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-22 22:53:50
