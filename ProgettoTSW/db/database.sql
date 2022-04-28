CREATE DATABASE  IF NOT EXISTS `eCommerceDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eCommerceDB`;
-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: eCommerceDB
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `appartenenza`
--

DROP TABLE IF EXISTS `appartenenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appartenenza` (
  `prodotto` varchar(25) NOT NULL,
  `sottocategoria` varchar(50) NOT NULL,
  PRIMARY KEY (`prodotto`,`sottocategoria`),
  KEY `appartenenza_sottocategoria__fkasda` (`sottocategoria`),
  CONSTRAINT `appartenenza_prodotto_codiceSeriale_fk` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`codiceSeriale`),
  CONSTRAINT `appartenenza_sottocategoria__fkasda` FOREIGN KEY (`sottocategoria`) REFERENCES `sottocategoria` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartenenza`
--

LOCK TABLES `appartenenza` WRITE;
/*!40000 ALTER TABLE `appartenenza` DISABLE KEYS */;
INSERT INTO `appartenenza` VALUES ('gFEfPBJg','biscotti'),('hcCcRJX5','energy drink'),('zC3RFPrT','energy drink'),('GesKKqnx','patatine'),('UoESj9xK','patatine'),('Pz7nszym','snack dolci'),('PZzimtRa','snack dolci'),('xBDiMhYa','snack dolci'),('GesKKqnx','snack salati'),('T4iGqTCG','snack salati'),('UoESj9xK','snack salati'),('tyih29rt','soft drink');
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
  `peso` varchar(25) DEFAULT NULL,
  `volume` varchar(25) DEFAULT NULL,
  `immagine` varchar(100) DEFAULT NULL,
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
INSERT INTO `dettaglioProdotto` VALUES ('snack','GesKKqnx',6,22,99,'Giappone','2023-04-28','50g',NULL,'https://gdurl.com/AHQy/'),('snack','gFEfPBJg',2.99,22,99,'USA','2023-04-26','154g',NULL,'https://gdurl.com/LmYd/'),('snack','Pz7nszym',2.49,22,99,'USA','2023-04-10','49.9g',NULL,'https://gdurl.com/Q7D7/'),('snack','PZzimtRa',1.99,22,99,'USA','2023-04-22','47g',NULL,'https://gdurl.com/JDt7/'),('snack','tyih29rt',1.59,22,99,'UK','2023-04-21',NULL,'330ml','https://gdurl.com/CcXa/'),('snack','UoESj9xK',4.99,22,99,'USA','2023-04-17','226g',NULL,'https://gdurl.com/kxoy/'),('snack','xBDiMhYa',1.99,22,99,'USA','2023-04-20','40g',NULL,'https://gdurl.com/gYjUK/'),('drink','hcCcRJX5',5.99,22,99,'Giappone','2023-04-19',NULL,'355ml','https://gdurl.com/G16E/'),('drink','T4iGqTCG',6.5,22,99,'Giappone','2023-04-07','115g',NULL,'https://gdurl.com/MsbP/'),('drink','zC3RFPrT',1.5,22,99,'Internazionale','2023-04-30',NULL,'500ml','https://gdurl.com/obje/');
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
  `descrizioneBreve` varchar(1000) NOT NULL,
  `edLimitata` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codiceSeriale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES ('GesKKqnx','Chip Star Potato Chips - Mild Salt','Chip Star YBC','Le Chip Star Potato Chips della YBC sono uno degli snack più famosi. La confezione è un pratico cilindro con chiusura per portarle ovunque! Queste patatine sono leggermente salate per offrire un gusto delicato. Disponibili anche in altre varietà.',0),('gFEfPBJg','Oreo Mint Flavour','Oreo','Biscotti Oreo alla menta, farciti con tutto il gusto della crema green. Uno snack dolce che potrai tenere con te sul posto di lavoro, a scuola, in ufficio oppure in giro.',0),('hcCcRJX5','Monster Cuba Libre','Monster','Bevanda energetica all\'intenso sapore di Cuba Libre, il famoso cocktail al rum, cola e lime. Una lattina davvero speciale, assolutamente da collezione che arriva direttamente dal Giappone.',1),('Pz7nszym','Snickers Almond','Snickers','Barretta di cioccolato Snickers Almond da 49.9 grammi per una candy bar farcita internamente con squisite ed originali mandorle americane. Ma non solo: questo snack dolce è composto',0),('PZzimtRa','Reese\'s Nut Bar','Reese\'s','Barretta di cioccolato Reese\'s Nut bar, con all\'interno crema di caramello e arachidi intere a comporre uno snack dolce fra i migliori e più buoni di tutto il catalogo Reese\'s.',0),('T4iGqTCG','Chip Star Nori-Shio','Chip Star YBC','Patatine Chip Star al gusto di alga marina Nori-shio e sale.',0),('tyih29rt','Dr Pepper','Dr Pepper','Dr Pepper UK, bevanda fruttata con vaniglia e caramello. Un prodotto che non può assolutamente mancare nella tua dispensa, nella versione britannica, sinonimo di storia ed effervescenza! Dr. Pepper infatti è fra le bibite più conosciute ed apprezzate anche negli Stati Uniti e se hai voglia di provare qualcosa mai assaggiato prima non puoi assolutamente fartela scappare!',0),('UoESj9xK','Cheetos Crunchy','Cheetos ','Cheetos, Crunchy Flavoured, arricchiti da un\'incredibile croccantezza in questa straordinaria variante all\'originale e intenso sapore di formaggio cheddar. Le Cheetos Crunchy rappresentano le patatine preferite dagli americani ormai già dal 1948 per via del magico gusto, della forma un po’ bizzarra e della croccantezza unica.',0),('xBDiMhYa','M&M\'s Fudge Brownie','M&M\'s','Confezione di M&M\'s Fudge Brownie, confetti al cioccolato con cuore morbido al brownie, un famoso dolcetto al cioccolato e nocciole. Questa soluzione M&M\'s da 40 grammi contiene tutta la bontà e la qualità dell\'impasto M&M\'s, accompagnato da un dolce cuore al brownie che farà impazzire tutti gli appassionati.',0),('zC3RFPrT','Monster Mango Loco','Monster','Monster Energy al gusto mango è un mix perfetto tra dolcezza ed energia elettrizzante! Lasciati trasportare dalla movida',0);
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
INSERT INTO `sottocategoria` VALUES ('biscotti'),('energy drink'),('merendine'),('patatine'),('snack dolci'),('snack salati'),('soft drink');
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

-- Dump completed on 2022-04-28 16:55:12
