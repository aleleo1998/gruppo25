-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: acagreen_db
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` varchar(10) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `quantita` varchar(45) DEFAULT NULL,
  `descrizione` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('14','Concime 1','concime','3333',' è un item di tipo concime disponibile con la quantita di  kg'),('15','Concime 2','concime','333',' è un item di tipo concime disponibile con la quantita di  kg'),('16','Concime 3','concime','3232',' è un item di tipo concime disponibile con la quantita di  kg'),('17','Concime 4','concime','223',' è un item di tipo concime disponibile con la quantita di  kg'),('18','Concime 5','concime','443',' è un item di tipo concime disponibile con la quantita di  kg'),('19','Concime 6','concime','455',' è un item di tipo concime disponibile con la quantita di  kg'),('2','Concime 7','concime','342',' è un item di tipo concime disponibile con la quantita di  kg'),('20','Concime 8','concime','244',' è un item di tipo concime disponibile con la quantita di  kg'),('21','Concime 9','concime','543',' è un item di tipo concime disponibile con la quantita di  kg'),('22','Concime 10','concime','234',' è un item di tipo concime disponibile con la quantita di  kg'),('3','Concime 11','concime','232',' è un item di tipo concime disponibile con la quantita di  kg'),('31','Coltura 1','coltura','35','Coltura 1 è un item di tipo coltura disponibile con la quantita di 35 kg'),('32','Coltura 2','coltura','1000000','Coltura 2 è un item di tipo coltura disponibile con la quantita di 14 kg'),('33','Coltura 3','coltura','1000','Coltura 3 è un item di tipo coltura disponibile con la quantita di 1000 kg'),('35','Coltura4','coltura','50000','Coltura5 è un item di tipo coltura disponibile con la quantita di 50000 kg'),('36','Coltura 5','coltura','4332','Coltura 22 è un item di tipo coltura disponibile con la quantita di 1111111 kg'),('37','Coltura 6','pesticida','3322','Coltura 22 è un item di tipo coltura disponibile con la quantita di 1111111 kg'),('38','Coltura 7','pesticida','233','Doc è un item di tipo concime disponibile con la quantita di 2 kg'),('4','Coltura 8','concime','4322',' è un item di tipo concime disponibile con la quantita di  kg'),('5','Coltura 9','concime','3421',' è un item di tipo concime disponibile con la quantita di  kg'),('50','Pesticida 1','pesticida','232','è un pesticida'),('51','Pesticida 2','pesticida','323','è un pesticida'),('6','Coltura 10','concime','2222',' è un item di tipo concime disponibile con la quantita di  kg');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-17 17:34:33
