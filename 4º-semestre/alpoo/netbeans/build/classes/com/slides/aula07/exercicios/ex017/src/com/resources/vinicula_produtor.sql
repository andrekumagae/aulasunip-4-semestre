-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: vinicula
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `produtor`
--

DROP TABLE IF EXISTS `produtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtor` (
  `Prod_Id` int unsigned NOT NULL,
  `Prod_Nome` varchar(35) NOT NULL,
  `Prod_End` varchar(40) DEFAULT NULL,
  `Prod_Tel` varchar(15) DEFAULT NULL,
  `Prod_Email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Prod_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtor`
--

LOCK TABLES `produtor` WRITE;
/*!40000 ALTER TABLE `produtor` DISABLE KEYS */;
INSERT INTO `produtor` VALUES (11,'Epaminondas Souza','Vinicula A','1111 1111 11 11','epa@maila.br'),(12,'Asdrubal Silva','Vinicula B','2222 2222 22 22','asdra@mailb.br'),(13,'Emengarda Santos','Vinicula C','3333 3333 33 33','eme@mailc.br'),(14,'Xampofago Matos','Vinicula D','4444 4444 44 44','xamp@mdila.br'),(15,'Amaralindo Se','Vinicula E','5555 5555 55 55','ama@maile.br'),(49,'Xantipo Oliveira','Para Todos','99999 99 99 99','piriri@mailc.br'),(50,'Florindo Gomes','Nosso Vinho','8888 88 88 88','arapuc@aile.br');
/*!40000 ALTER TABLE `produtor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-30  5:29:57
