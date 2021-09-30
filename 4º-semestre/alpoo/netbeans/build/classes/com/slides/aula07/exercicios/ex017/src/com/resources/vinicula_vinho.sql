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
-- Table structure for table `vinho`
--

DROP TABLE IF EXISTS `vinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vinho` (
  `Vinho_Id` int unsigned NOT NULL,
  `Vinho_Nome` varchar(30) DEFAULT NULL,
  `Vinho_Ano` int DEFAULT NULL,
  `Vinho_Cor` varchar(20) DEFAULT NULL,
  `Vinho_Grau` decimal(5,2) DEFAULT NULL,
  `Vinho_Preco` decimal(7,2) DEFAULT NULL,
  `Vinho_Prod_Id` int DEFAULT NULL,
  PRIMARY KEY (`Vinho_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vinho`
--

LOCK TABLES `vinho` WRITE;
/*!40000 ALTER TABLE `vinho` DISABLE KEYS */;
INSERT INTO `vinho` VALUES (111,'Reserva Especial 1',2005,'Tinto',14.50,18.50,12),(112,'Quinta do Vale',2002,'Branco',13.50,12.80,11),(113,'Vale Verde',2006,'Tinto',13.80,11.50,11),(114,'Reserva de Ouro',2000,'Branco',14.00,19.00,12),(116,'Verdes Belos',2001,'Branco',16.00,11.50,15),(117,'Novos Tempos',2007,'Rose',15.40,13.00,12),(118,'Especial',2005,'Tinto',16.40,14.50,13),(119,'Ouro Branco',2004,'Branco',13.50,15.00,11),(149,'Vinho Bom',2019,'Meio Tinto',25.00,100.00,162),(150,'Vinhaço',2019,'Tinto Rose',40.00,250.00,169);
/*!40000 ALTER TABLE `vinho` ENABLE KEYS */;
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
