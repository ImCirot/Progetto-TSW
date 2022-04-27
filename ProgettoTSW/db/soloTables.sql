-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: eCommerceDB
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `appartenenza`
--

DROP TABLE IF EXISTS `appartenenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appartenenza` (
  `prodotto` varchar(25) NOT NULL,
  `sottocategoria` varchar(50) NOT NULL,
  PRIMARY KEY (`prodotto`),
  KEY `appartenenza_sottocategoriaProdotto_nome_fk` (`sottocategoria`),
  CONSTRAINT `appartenenza_prodotto_codiceSeriale_fk` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`codiceSeriale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appartenenza_sottocategoriaProdotto_nome_fk` FOREIGN KEY (`sottocategoria`) REFERENCES `sottocategoria` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartenenza`
--

LOCK TABLES `appartenenza` WRITE;
/*!40000 ALTER TABLE `appartenenza` DISABLE KEYS */;
/*!40000 ALTER TABLE `appartenenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dettaglioProdotto`
--

DROP TABLE IF EXISTS `dettaglioProdotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dettaglioProdotto` (
  `tipo` enum('snack','drink') NOT NULL,
  `prodotto` varchar(25) NOT NULL,
  `costoUnitario` double NOT NULL,
  `IVA` int NOT NULL,
  `quantita` int NOT NULL,
  `origine` varchar(50) DEFAULT NULL,
  `scadenza` date NOT NULL,
  `peso` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `immagine` varchar(100) NOT NULL,
  PRIMARY KEY (`tipo`,`prodotto`),
  KEY `fk_new_table_1_idx` (`prodotto`),
  CONSTRAINT `fk_new_table_1` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`codiceSeriale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dettaglioProdotto`
--

LOCK TABLES `dettaglioProdotto` WRITE;
/*!40000 ALTER TABLE `dettaglioProdotto` DISABLE KEYS */;
/*!40000 ALTER TABLE `dettaglioProdotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotto` (
  `codiceSeriale` varchar(25) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `descrizioneBreve` varchar(250) NOT NULL,
  `edLimitata` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codiceSeriale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sottocategoria`
--

DROP TABLE IF EXISTS `sottocategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sottocategoria` (
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sottocategoria`
--

LOCK TABLES `sottocategoria` WRITE;
/*!40000 ALTER TABLE `sottocategoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `sottocategoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27  8:17:46
