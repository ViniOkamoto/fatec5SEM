-- MySQL dump 10.13  Distrib 8.0.21, for osx10.15 (x86_64)
--
-- Host: localhost    Database: SheepSchool
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` text,
  `name` varchar(30) DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Get to know how to build web pages.','Frontend','frontend'),(2,'Get to know how to build logics and database access.','Backend','backend'),(3,'Make beautiful things.','Design','design'),(4,'Make good things for the users.','UX','ux');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_level` int DEFAULT NULL,
  `course_score` float DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `long_description` text,
  `permalink` varchar(30) DEFAULT NULL,
  `short_description` text,
  `subtitle` varchar(70) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_hfy85o10dsflbnm0qwiey899c` (`permalink`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,3,1.65,'2020-11-29 18:06:20.086919','The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', \"\n+ \"making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, ','springboot','This course is It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.','Developing web applications with Angular and Java','SpringBoot',NULL),(2,3,264.5,'2020-11-29 18:06:20.087066','venenatis urna non dui convallis, et tincidunt sapien vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per\', \"\n+ \"inceptos himenaeos. Aliquam erat volutpat. Proin eget lobortis libero. Vestibulum in imperdiet nulla. Vestibulum eget feugiat sem. Pellentesque tellus felis, imperdiet ac urna et, hendrerit faucibus est. Mauris mollis condimentum risus vitae mattis. Sed sagittis vitae lacus sit amet consectetur. Ut pellentesque efficitur eros nec venenatis. ','microsof-cobol','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nisl felis, eleifend non commodo sed, condimentum a nisi. Praesent','Sistema de gerenciamento de estoque.','Microsoft Cobol 2.2',NULL),(3,2,1.65,'2020-11-29 18:06:20.087092','venenatis urna non dui convallis, et tincidunt sapien vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per\', \"\n+ \"inceptos himenaeos. Aliquam erat volutpat. Proin eget lobortis libero. Vestibulum in imperdiet nulla. Vestibulum eget feugiat sem. Pellentesque tellus felis, imperdiet ac urna et, hendrerit faucibus est. Mauris mollis condimentum risus vitae mattis. Sed sagittis vitae lacus sit amet consectetur. Ut pellentesque efficitur eros nec venenatis. ','html5','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nisl felis, eleifend non commodo sed, condimentum a nisi. Praesent','Conhecendo a linguagem de marcação de hipertexto.','HTML5',NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_area`
--

DROP TABLE IF EXISTS `course_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_area` (
  `course_id` bigint NOT NULL,
  `area_id` bigint NOT NULL,
  PRIMARY KEY (`course_id`,`area_id`),
  KEY `FKe8tydi5emri75dpfc7va3j45e` (`area_id`),
  CONSTRAINT `FKe8tydi5emri75dpfc7va3j45e` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`),
  CONSTRAINT `FKnvmcf11n1v6m29g7n9igk3l5` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_area`
--

LOCK TABLES `course_area` WRITE;
/*!40000 ALTER TABLE `course_area` DISABLE KEYS */;
INSERT INTO `course_area` VALUES (1,1),(3,1),(1,2),(2,2),(3,4);
/*!40000 ALTER TABLE `course_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_instructor`
--

DROP TABLE IF EXISTS `course_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_instructor` (
  `course_id` bigint NOT NULL,
  `instructor_id` bigint NOT NULL,
  PRIMARY KEY (`course_id`,`instructor_id`),
  KEY `FKltori8qni3ivrlovca4gd9yw3` (`instructor_id`),
  CONSTRAINT `FKeqej22fgwa29i98ucd9x9ycie` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FKltori8qni3ivrlovca4gd9yw3` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_instructor`
--

LOCK TABLES `course_instructor` WRITE;
/*!40000 ALTER TABLE `course_instructor` DISABLE KEYS */;
INSERT INTO `course_instructor` VALUES (3,5),(3,6),(1,7),(2,7),(3,8),(1,9);
/*!40000 ALTER TABLE `course_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_requirement`
--

DROP TABLE IF EXISTS `course_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_requirement` (
  `course_id` bigint NOT NULL,
  `requirement` varchar(255) DEFAULT NULL,
  KEY `FK47nrxl0qoeri0rxbmlujpei63` (`course_id`),
  CONSTRAINT `FK47nrxl0qoeri0rxbmlujpei63` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_requirement`
--

LOCK TABLES `course_requirement` WRITE;
/*!40000 ALTER TABLE `course_requirement` DISABLE KEYS */;
INSERT INTO `course_requirement` VALUES (1,'Logic knowledge'),(1,'Java'),(1,'Object oriented programming'),(1,'Data structures');
/*!40000 ALTER TABLE `course_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_subscription`
--

DROP TABLE IF EXISTS `course_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_subscription` (
  `course_subscription_score` float DEFAULT NULL,
  `course_subscription_status` char(1) DEFAULT NULL,
  `finished_at` datetime(6) DEFAULT NULL,
  `started_at` datetime(6) DEFAULT NULL,
  `course_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`course_id`,`student_id`),
  CONSTRAINT `FK89xaoc5ii025gnldxtsxb06ji` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_subscription`
--

LOCK TABLES `course_subscription` WRITE;
/*!40000 ALTER TABLE `course_subscription` DISABLE KEYS */;
INSERT INTO `course_subscription` VALUES (NULL,'O',NULL,'2020-11-29 18:06:20.379201',1,1),(NULL,'O',NULL,'2020-11-29 18:06:20.379056',1,2),(NULL,'O',NULL,'2020-11-29 18:06:20.379221',2,1),(NULL,'O',NULL,'2020-11-29 18:06:20.379191',2,2),(NULL,'O',NULL,'2020-11-29 18:06:20.379215',3,2),(NULL,'O',NULL,'2020-11-29 18:06:20.379208',3,3);
/*!40000 ALTER TABLE `course_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_willlearn`
--

DROP TABLE IF EXISTS `course_willlearn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_willlearn` (
  `course_id` bigint NOT NULL,
  `willlearn` varchar(255) DEFAULT NULL,
  KEY `FKih0nsvytjk7ruwudc6jtyei2y` (`course_id`),
  CONSTRAINT `FKih0nsvytjk7ruwudc6jtyei2y` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_willlearn`
--

LOCK TABLES `course_willlearn` WRITE;
/*!40000 ALTER TABLE `course_willlearn` DISABLE KEYS */;
INSERT INTO `course_willlearn` VALUES (1,'Develop systems'),(1,'Work fast'),(1,'Play with Eclipse and Spring'),(1,'Integrate db, backend and frontend');
/*!40000 ALTER TABLE `course_willlearn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_wontlearn`
--

DROP TABLE IF EXISTS `course_wontlearn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_wontlearn` (
  `course_id` bigint NOT NULL,
  `wontlearn` varchar(255) DEFAULT NULL,
  KEY `FKe5q4w08why0n7t27eq2fco0n2` (`course_id`),
  CONSTRAINT `FKe5q4w08why0n7t27eq2fco0n2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_wontlearn`
--

LOCK TABLES `course_wontlearn` WRITE;
/*!40000 ALTER TABLE `course_wontlearn` DISABLE KEYS */;
INSERT INTO `course_wontlearn` VALUES (1,'Logic basics'),(1,'Design and styles');
/*!40000 ALTER TABLE `course_wontlearn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) NOT NULL,
  `next_val` bigint DEFAULT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('default',10);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `id` bigint NOT NULL,
  `birth_date` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `registered_at` datetime(6) DEFAULT NULL,
  `user_status` char(1) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `portfoliourl` varchar(255) DEFAULT NULL,
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_h23sspwe1nutb1hkq9rvyh8h8` (`email`),
  UNIQUE KEY `UK_8e3s79c4nmdd9salt4tffctx2` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (5,'1966-06-13','jerepere@gmail.com','Jeremias','M','2020-11-22 18:32:34.000000','Pereira','$2a$10$aSVejg6h7ays3UomIrO.gOZf/xH6ZBe4L9BcU9K9sCtD9GjthLu76','+545545454','2020-10-19 12:00:34.000000','A','sarrapiao','www.elgranbello.com',NULL),(6,'1976-02-22','xuxa@gmail.com','Maria','F','2020-11-22 18:32:34.000000','Meneghel','$2a$10$b3lLVPoTrXrSLMIMW6Evi.9/CzmUiPEMFv88LOS8vonh7ekphfBh6','+545545454','2020-10-19 12:00:34.000000','A','xuxa','www.xuxa.com.br',NULL),(7,'1987-03-06','brunoharnik@gmail.com','Bruno','M','2020-11-22 18:32:34.000000','Bega Harnik','$2a$10$7ZD6O/fbbydGvxbA62OYwu7pWPfK30KMvV.3Lzr33NPJgUFwIP1ii','+545545454','2020-10-19 12:00:34.000000','A','bruno','www.brunoharnik.com',NULL),(8,'1998-06-24','feer@gmail.com','Fernanda','F','2020-11-22 18:32:34.000000','Pinheiro Reis','$2a$10$vcOLozUYCt/4m2wQgzF/duZZWVDB/evRSmixryAf4HG7i62Wwu3O.','+545545454','2020-10-19 12:00:34.000000','A','fernanda','github.com/feevars',NULL),(9,'1987-03-06','lfernando488@gmail.com','Luiz Fernando','M','2020-11-22 18:32:34.000000','Geraldo dos Santos','$2a$10$xw5L5svcFwAdRiB6FfMepOiBAcmA9O7AfHaPme8IXyrlfNOvdl.fe','+545545454','2020-10-19 12:00:34.000000','A','luiz','github.com/lfernando488',NULL),(10,'1987-03-06','oswaldalves@gmail.com','Oswaldo','M','2020-11-22 18:32:34.000000','Alves','$2a$10$Hd3VbDbyFhLTRdEoP9ywc.nd6jEo5WLl0VP6FHvrmul99eprpdJm6','+545545454','2020-10-19 12:00:34.000000','B','oswaldo','github.com/oswaldalves',NULL);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `lesson_number` int DEFAULT NULL,
  `permalink` varchar(30) DEFAULT NULL,
  `short_description` text,
  `title` varchar(100) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9elgfnfb59xnms7c2khualdvc` (`permalink`),
  KEY `FKjs3c7skmg8bvdddok5lc7s807` (`course_id`),
  CONSTRAINT `FKjs3c7skmg8bvdddok5lc7s807` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,'2020-11-29 18:06:20.147940',1,'create-project','This class shows us how to create a simple project using springboot app','Create Spring Simple project','2020-11-29 18:06:20.147963','https://www.youtube.com/watch?v=3pPr5NUpwgU',1),(2,'2020-11-29 18:06:20.148001',2,'main-class','In this lesson we will create the application class.','Create the main class','2020-11-29 18:06:20.148009','https://www.youtube.com/watch?v=3pPr5NUpwgU',1),(3,'2020-11-29 18:06:20.318038',1,'start-the-project','Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum','Start the project','2020-11-29 18:06:20.318058','https://www.youtube.com/watch?v=3pPr5NUpwgU',2),(4,'2020-11-29 18:06:20.318078',2,'continue-the-project','Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum','Continue the project','2020-11-29 18:06:20.318085','https://www.youtube.com/watch?v=3pPr5NUpwgU',2),(5,'2020-11-29 18:06:20.318098',3,'finish-the-project','Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum','Finish the project','2020-11-29 18:06:20.318105','https://www.youtube.com/watch?v=3pPr5NUpwgU',2);
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_instructor`
--

DROP TABLE IF EXISTS `lesson_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson_instructor` (
  `lesson_id` bigint NOT NULL,
  `instructor_id` bigint NOT NULL,
  PRIMARY KEY (`lesson_id`,`instructor_id`),
  KEY `FKm72enbdgfq0mgdh24x5ael5h9` (`instructor_id`),
  CONSTRAINT `FKhlah546fgrxp4vkot7qoix71g` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`),
  CONSTRAINT `FKm72enbdgfq0mgdh24x5ael5h9` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_instructor`
--

LOCK TABLES `lesson_instructor` WRITE;
/*!40000 ALTER TABLE `lesson_instructor` DISABLE KEYS */;
INSERT INTO `lesson_instructor` VALUES (1,7),(2,7),(3,7),(2,9);
/*!40000 ALTER TABLE `lesson_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `user_id` bigint NOT NULL,
  `roles` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'S'),(2,'S'),(3,'S'),(4,'S'),(5,'S'),(5,'I'),(6,'S'),(6,'I'),(7,'A'),(7,'S'),(7,'I'),(8,'A'),(8,'S'),(8,'I'),(9,'A'),(9,'S'),(9,'I'),(10,'S'),(10,'I');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` bigint NOT NULL,
  `birth_date` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `registered_at` datetime(6) DEFAULT NULL,
  `user_status` char(1) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `portfoliourl` varchar(255) DEFAULT NULL,
  `score` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_fe0i52si7ybu0wjedj6motiim` (`email`),
  UNIQUE KEY `UK_jyet50p17q01ks2bv4sn8i5r7` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'1986-01-22','adalba@gmail.com','Adalberto','M','2020-11-22 18:32:34.000000','Fonseca','$2a$10$/0rQ4yzkd.QI1ppre7yb3uSFFmZFgMSAs6xcOS6TNScOT9vFFMgpO','+5511987654321','2020-10-19 12:00:34.000000','A','impostor','www.adalbas.com.br',NULL),(2,'1959-11-09','maracarvalho@ig.com.br','Mara','F','2020-08-20 18:32:34.000000','Carvalho','$2a$10$9aaXT8zXQsC1e/Z6KJxUn.WnpGAlxjDUY9pw4ylMWbWRkK9wjgLuq','+5511987654321','2020-08-19 12:00:34.000000','I','bruxa666','instagram.com/maracarvalho',NULL),(3,'1965-10-12','feevars@gmail.com','Adamastor','M','2020-12-02 13:31:30.000000','Gigante','$2a$10$7kmeL7xX7tCA/wi1LpoHJujI4JNcAdfYFyaBHEMSWKqKerTdhu5hK','+5511987654321','2020-10-19 12:00:34.000000','A','adamastor','github.com/giganteadamastor',NULL),(4,'1965-10-12','rbotelho@gmail.com','Renato','M','2020-11-22 18:32:34.000000','Botelho','$2a$10$WYoPoUP8f.hk.w6f0vfhw.MW2hgEwv93/zJwr6YsEKahr0bGrb/yG','+5511987654321','2020-10-19 12:00:34.000000','A','botelho32','github.com/botelho32',NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-29 21:01:08
