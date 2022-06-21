CREATE DATABASE  IF NOT EXISTS `ecommercedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommercedb`;
-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: ecommercedb
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.22.04.2

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
  CONSTRAINT `appartenenza_prodotto_codiceSeriale_fk` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`codiceSeriale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appartenenza_sottocategoria__fkasda` FOREIGN KEY (`sottocategoria`) REFERENCES `sottocategoria` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartenenza`
--

LOCK TABLES `appartenenza` WRITE;
/*!40000 ALTER TABLE `appartenenza` DISABLE KEYS */;
INSERT INTO `appartenenza` VALUES ('gBHM8710J','biscotti'),('gFEfPBJg','biscotti'),('t6hyM8710J','biscotti'),('hcCcRJX5','energy drink'),('zC3RFPrT','energy drink'),('4X6AYOAF','merendine'),('7P6TAKI9P','merendine'),('JgrrTR876','merendine'),('GesKKqnx','patatine'),('UoESj9xK','patatine'),('4X6AYOAF','snack dolci'),('7P6TAKI9P','snack dolci'),('gBHM8710J','snack dolci'),('JgrrTR876','snack dolci'),('Pz7nszym','snack dolci'),('PZzimtRa','snack dolci'),('t6hyM8710J','snack dolci'),('xBDiMhYa','snack dolci'),('GesKKqnx','snack salati'),('T4iGqTCG','snack salati'),('UoESj9xK','snack salati'),('tyih29rt','soft drink'),('YHGv875TyK','soft drink'),('YJtnPO97G','soft drink');
/*!40000 ALTER TABLE `appartenenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composizioneordine`
--

DROP TABLE IF EXISTS `composizioneordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composizioneordine` (
  `ordine` int NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `prodotto` varchar(25) NOT NULL,
  `quantitaProdotto` int NOT NULL,
  `costoUnitario` decimal(4,2) NOT NULL,
  PRIMARY KEY (`ordine`,`cliente`,`prodotto`),
  KEY `composizioneOrdine_prodotto_codiceSeriale_fk` (`prodotto`),
  CONSTRAINT `composizioneOrdine_ordine_numOrdineProgessivo_fk` FOREIGN KEY (`ordine`, `cliente`) REFERENCES `ordine` (`numOrdineProgressivo`, `cliente`),
  CONSTRAINT `composizioneOrdine_prodotto_codiceSeriale_fk` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`codiceSeriale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composizioneordine`
--

LOCK TABLES `composizioneordine` WRITE;
/*!40000 ALTER TABLE `composizioneordine` DISABLE KEYS */;
INSERT INTO `composizioneordine` VALUES (1,'LMiranda','gFEfPBJg',2,2.99),(1,'LMiranda','UoESj9xK',1,4.99),(1,'LMiranda','xBDiMhYa',1,1.99),(2,'ANappi','GesKKqnx',1,6.00),(2,'ANappi','zC3RFPrT',1,1.50),(3,'GBasile','T4iGqTCG',1,6.50),(3,'GBasile','UoESj9xK',1,4.99),(3,'GBasile','xBDiMhYa',1,1.99),(4,'CTroiano','hcCcRJX5',2,5.99),(4,'CTroiano','zC3RFPrT',3,1.50),(5,'LMessi10','Pz7nszym',2,2.49),(6,'LMessi10','Pz7nszym',2,2.49),(7,'GBasile','hcCcRJX5',1,5.99),(7,'GBasile','Pz7nszym',1,2.49),(9,'LMiranda','hcCcRJX5',1,5.99),(9,'LMiranda','Pz7nszym',1,2.49),(10,'LMiranda','gFEfPBJg',1,2.99),(10,'LMiranda','hcCcRJX5',1,5.99),(10,'LMiranda','Pz7nszym',1,2.49),(10,'LMiranda','PZzimtRa',1,1.99),(11,'LMiranda','GesKKqnx',1,6.00),(12,'LMiranda','GesKKqnx',2,6.00),(13,'LMiranda','gFEfPBJg',1,2.99),(13,'LMiranda','hcCcRJX5',2,5.99),(13,'LMiranda','Pz7nszym',1,2.49),(14,'LMiranda','gFEfPBJg',1,2.99),(14,'LMiranda','hcCcRJX5',1,5.99),(14,'LMiranda','Pz7nszym',2,2.49),(15,'LMiranda','hcCcRJX5',1,5.99),(15,'LMiranda','T4iGqTCG',1,6.50),(15,'LMiranda','tyih29rt',1,1.59),(15,'LMiranda','UoESj9xK',1,4.99),(15,'LMiranda','xBDiMhYa',1,1.99),(16,'GBasile','GesKKqnx',1,6.00),(16,'GBasile','gFEfPBJg',2,2.99),(16,'GBasile','UoESj9xK',1,4.99),(16,'GBasile','xBDiMhYa',1,1.99),(17,'GBasile','hcCcRJX5',1,5.99),(17,'GBasile','Pz7nszym',1,2.49),(17,'GBasile','PZzimtRa',1,1.99),(18,'LMiranda','4X6AYOAF',1,8.99),(18,'LMiranda','7P6TAKI9P',1,3.27),(19,'LMiranda','JgrrTR876',1,12.90),(19,'LMiranda','Pz7nszym',2,2.49),(20,'LMiranda','JgrrTR876',1,6.99),(20,'LMiranda','Pz7nszym',1,2.49),(21,'LMiranda','JgrrTR876',1,12.90),(21,'LMiranda','Pz7nszym',1,2.49),(22,'LMiranda','4X6AYOAF',1,5.99),(22,'LMiranda','7P6TAKI9P',1,3.27),(22,'LMiranda','Pz7nszym',1,2.49),(22,'LMiranda','PZzimtRa',1,1.99),(22,'LMiranda','tyih29rt',1,1.59),(22,'LMiranda','tyPOJ864PL',1,1.79),(22,'LMiranda','UoESj9xK',1,3.90),(22,'LMiranda','YHGv875TyK',1,3.99),(22,'LMiranda','YJtnPO97G',1,1.70),(22,'LMiranda','zC3RFPrT',1,1.50),(23,'LMiranda','JgrrTR876',1,6.99),(23,'LMiranda','t6hyM8710J',1,4.00),(24,'LMiranda','tyih29rt',4,1.59),(24,'LMiranda','YHGv875TyK',6,3.99),(24,'LMiranda','YJtnPO97G',1,1.70),(24,'LMiranda','zC3RFPrT',5,1.50);
/*!40000 ALTER TABLE `composizioneordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dettaglioprodotto`
--

DROP TABLE IF EXISTS `dettaglioprodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dettaglioprodotto` (
  `tipo` enum('snack','drink') NOT NULL,
  `prodotto` varchar(25) NOT NULL,
  `costoUnitario` decimal(4,2) NOT NULL,
  `prezzoScontato` decimal(4,2) DEFAULT NULL,
  `IVA` int NOT NULL,
  `quantita` int NOT NULL,
  `origine` varchar(50) DEFAULT NULL,
  `scadenza` date NOT NULL,
  `peso` varchar(25) DEFAULT NULL,
  `volume` varchar(25) DEFAULT NULL,
  `immagine` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`tipo`,`prodotto`),
  KEY `fk_new_table_1_idx` (`prodotto`),
  CONSTRAINT `fk_new_table_1` FOREIGN KEY (`prodotto`) REFERENCES `prodotto` (`codiceSeriale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dettaglioprodotto`
--

LOCK TABLES `dettaglioprodotto` WRITE;
/*!40000 ALTER TABLE `dettaglioprodotto` DISABLE KEYS */;
INSERT INTO `dettaglioprodotto` VALUES ('snack','4X6AYOAF',8.99,5.99,22,97,'Giappone','2023-07-18','150g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/dorayaki.png'),('snack','7P6TAKI9P',3.27,NULL,22,97,'Giappone','2023-07-10','75g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/baumkuchen.png'),('snack','gBHM8710J',2.49,NULL,22,99,'USA','2023-01-10','49g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/pocky.png'),('snack','GesKKqnx',6.00,NULL,22,95,'Giappone','2023-04-28','50g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/mildsalt.png'),('snack','gFEfPBJg',2.99,NULL,22,92,'USA','2023-04-26','154g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/Oreo-Mint-Flavour-154g_1800x1800.png'),('snack','JgrrTR876',12.90,6.99,22,86,'Giappone','2023-09-18','200g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/pancake.png'),('snack','Pz7nszym',2.49,NULL,22,87,'USA','2023-04-10','49.9g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/Snickers-Almond-50g_1800x1800.png'),('snack','PZzimtRa',1.99,NULL,22,96,'USA','2023-04-22','47g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/reesesnutbar.png'),('snack','T4iGqTCG',6.50,NULL,22,98,'Giappone','2023-04-07','115g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/chipstarnori.png'),('snack','t6hyM8710J',6.49,4.00,22,98,'Giappone','2023-10-08','400g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/poptarts.png'),('snack','tyPOJ864PL',1.79,NULL,22,98,'USA','2023-09-08','38g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/oishi.png'),('snack','UoESj9xK',4.99,3.90,22,96,'USA','2023-04-17','226g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/cheetos-crunchy-226g_1800x1800.png'),('snack','xBDiMhYa',1.99,NULL,22,97,'USA','2023-04-20','40g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/memFudgeBrownie.png'),('drink','hcCcRJX5',5.99,NULL,22,91,'Giappone','2023-04-19',NULL,'355ml','https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/Monster-Cuba-Libre-355ml_1800x1800.png'),('drink','tyih29rt',1.59,NULL,22,93,'UK','2023-04-21',NULL,'330ml','https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/Dr-Pepper-330ml_1_1800x1800.png'),('drink','YHGv875TyK',3.99,NULL,22,92,'USA','2023-09-17',NULL,'330ml','https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/vegito.png'),('drink','YJtnPO97G',1.70,NULL,22,97,'USA','2023-08-18',NULL,'355ml','https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/fanta peach.png'),('drink','zC3RFPrT',1.50,NULL,22,93,'Internazionale','2023-04-30',NULL,'500ml','https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/mangoloco.png');
/*!40000 ALTER TABLE `dettaglioprodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzo`
--

DROP TABLE IF EXISTS `indirizzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzo` (
  `numIndirizzoProgressivo` int NOT NULL AUTO_INCREMENT,
  `utente` varchar(50) NOT NULL,
  `via` varchar(50) NOT NULL,
  `citta` varchar(50) NOT NULL,
  `CAP` varchar(10) NOT NULL,
  `civico` varchar(10) NOT NULL,
  `provincia` varchar(10) NOT NULL,
  `nazione` varchar(25) NOT NULL,
  `scala` varchar(5) DEFAULT NULL,
  `interno` varchar(20) DEFAULT NULL,
  `preferito` enum('si','no') NOT NULL,
  PRIMARY KEY (`numIndirizzoProgressivo`,`utente`),
  KEY `indirizzo_utente_username_fk` (`utente`),
  CONSTRAINT `indirizzo_utente_username_fk` FOREIGN KEY (`utente`) REFERENCES `utente` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzo`
--

LOCK TABLES `indirizzo` WRITE;
/*!40000 ALTER TABLE `indirizzo` DISABLE KEYS */;
INSERT INTO `indirizzo` VALUES (1,'LMiranda','Via Giacomo Leopardi','San Giuseppe Vesuviano','80047','69','Napoli','Italia',NULL,NULL,'si'),(2,'LMiranda','Via Franco Civetta','Nola','80035','17','Napoli','Italia',NULL,NULL,'no'),(3,'ANappi','Via Rione ','Torre Annunziata','80058','32','Napoli','Italia','A','S','si'),(4,'GBasile','Via San Simone','Nola','80035','289','Napoli','Italia',NULL,NULL,'si'),(5,'CTroiano','Via Trieste','Portico di Caserta','81050','45','Caserta','Italia',NULL,NULL,'si'),(10,'LMessi10','Via Nazionale','Caivano','80023','9','Napoli','Italia','B','','si');
/*!40000 ALTER TABLE `indirizzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metododipagamento`
--

DROP TABLE IF EXISTS `metododipagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metododipagamento` (
  `numPagamentoProgressivo` int NOT NULL AUTO_INCREMENT,
  `utente` varchar(50) NOT NULL,
  `via` varchar(50) NOT NULL,
  `citta` varchar(50) NOT NULL,
  `CAP` varchar(10) NOT NULL,
  `civico` varchar(10) NOT NULL,
  `provincia` varchar(10) NOT NULL,
  `nazione` varchar(25) NOT NULL,
  `tipo` enum('carta','IBAN') NOT NULL,
  `IBAN` char(27) DEFAULT NULL,
  `numCarta` varchar(19) DEFAULT NULL,
  `preferito` enum('si','no') NOT NULL,
  PRIMARY KEY (`numPagamentoProgressivo`,`utente`),
  KEY `metodoDiPagamento_utente_username_fk` (`utente`),
  CONSTRAINT `metodoDiPagamento_utente_username_fk` FOREIGN KEY (`utente`) REFERENCES `utente` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metododipagamento`
--

LOCK TABLES `metododipagamento` WRITE;
/*!40000 ALTER TABLE `metododipagamento` DISABLE KEYS */;
INSERT INTO `metododipagamento` VALUES (1,'LMiranda','Via Giacomo Leopardi','San Giuseppe Vesuviano','80047','69','Napoli','Italia','IBAN','IT22T0300203280284125425667',NULL,'si'),(2,'LMiranda','Via Franco Civetta','Nola','80035','17','Napoli','Italia','carta',NULL,'5111538754725418','no'),(3,'ANappi','Via Rione ','Torre Annunziata','80058','32','Napoli','Italia','carta',NULL,'5109337062062083','si'),(4,'GBasile','Via San Simone','Nola','80035','289','Napoli','Italia','IBAN','IT84G0300203280397435493853',NULL,'si'),(5,'CTroiano','Via Trieste','Portico di Caserta','81050','45','Caserta','Italia','IBAN','IT14U0300203280955173519725',NULL,'si'),(8,'LMessi10','Via Nazionale','Caivano','80023','9','Napoli','Italia','carta','null','1234567890','si');
/*!40000 ALTER TABLE `metododipagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `numOrdineProgressivo` int NOT NULL AUTO_INCREMENT,
  `cliente` varchar(50) NOT NULL,
  `tipoPagamento` enum('carta','IBAN') NOT NULL,
  `IBAN` char(27) DEFAULT NULL,
  `numCarta` varchar(19) DEFAULT NULL,
  `citta` varchar(50) NOT NULL,
  `CAP` varchar(10) NOT NULL,
  `via` varchar(50) NOT NULL,
  `civico` varchar(10) DEFAULT NULL,
  `provincia` varchar(10) NOT NULL,
  `nazione` varchar(25) NOT NULL,
  `dataAcquisto` date NOT NULL,
  `costoTotale` double NOT NULL,
  PRIMARY KEY (`numOrdineProgressivo`,`cliente`),
  KEY `ordine_utente_username_fk` (`cliente`),
  CONSTRAINT `ordine_utente_username_fk` FOREIGN KEY (`cliente`) REFERENCES `utente` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (1,'LMiranda','carta',NULL,'5111538754725418','San Giuseppe Vesuviano','80047','Via Franco Civetta','17','Napoli','Italia','2022-02-22',6.98),(2,'ANappi','carta',NULL,'5109337062062083','Torre Annunziata','80058','Via Rione ','32','Napoli','Italia','2022-02-11',7.5),(3,'GBasile','IBAN','IT84G0300203280397435493853',NULL,'Nola','80035','Via San Simone','289','Napoli','Italia','2022-03-04',13.48),(4,'CTroiano','IBAN','IT14U0300203280955173519725','null','Portico di Caserta','81050','Via Trieste','45','Caserta','Italia','2022-05-09',16.48),(5,'LMessi10','carta','null','1234567890','Caivano','80023','Via Nazionale','9','Napoli','Italia','2022-05-10',4.98),(6,'LMessi10','carta','null','1234567890','Caivano','80023','Via Nazionale','9','Napoli','Italia','2022-05-10',4.98),(7,'GBasile','IBAN','IT84G0300203280397435493853','null','Nola','80035','Via San Simone','289','Napoli','Italia','2022-05-16',8.48),(8,'LMiranda','IBAN','IT22T0300203280284125425667','null','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-05-26',5.98),(9,'LMiranda','IBAN','IT22T0300203280284125425667','null','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-05-26',8.48),(10,'LMiranda','IBAN','IT22T0300203280284125425667','null','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-05-26',13.46),(11,'LMiranda','IBAN','IT22T0300203280284125425667','null','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-05-30',6),(12,'LMiranda','IBAN','IT22T0300203280284125425667','null','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-06-14',12),(13,'LMiranda','IBAN','IT22T0300203280284125425667','null','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-06-14',11.47),(14,'LMiranda','carta','null','5111538754725418','Nola','80035','Via Franco Civetta','17','Napoli','Italia','2022-06-14',13.96),(15,'LMiranda','carta','null','5111538754725418','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-06-14',21.06),(16,'GBasile','IBAN','IT84G0300203280397435493853','null','Nola','80035','Via San Simone','289','Napoli','Italia','2022-06-17',18.959999999999997),(17,'GBasile','IBAN','IT84G0300203280397435493853','null','Nola','80035','Via San Simone','289','Napoli','Italia','2022-06-17',10.47),(18,'LMiranda','IBAN','IT22T0300203280284125425667','null','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-06-18',12.26),(19,'LMiranda','IBAN','IT22T0300203280284125425667','null','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-06-18',11.97),(20,'LMiranda','IBAN','IT22T0300203280284125425667','null','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-06-18',9.48),(21,'LMiranda','IBAN','IT22T0300203280284125425667','null','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-06-19',15.39),(22,'LMiranda','IBAN','IT22T0300203280284125425667','null','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-06-20',28.21),(23,'LMiranda','IBAN','IT22T0300203280284125425667','null','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-06-20',10.99),(24,'LMiranda','IBAN','IT22T0300203280284125425667','null','San Giuseppe Vesuviano','80047','Via Giacomo Leopardi','69','Napoli','Italia','2022-06-20',39.5);
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
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
  `descrizioneBreve` varchar(500) NOT NULL,
  `edLimitata` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codiceSeriale`,`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES ('4X6AYOAF','Dorayaki Color','Tenkei','Tenkei 2 Color Dorayaki ÃÂ¨ un delizioso dorayaki si possono gustare due gusti di dorayaki, uno con pasta morbida al forno inserita tra pasta di fagioli granulosi e l\'altro con pasta di castagne. Un assortimento di soffici dorayaki di dimensioni ridotte. Puoi goderti sia la pasta di fagioli di grano che la pasta di fagioli di castagne dorayaki in un unico sacchetto.',0),('7P6TAKI9P','Baumkuchen Torta Al Latte E Fragola','Faiyo Foods','Baumkuchen è una parola tedesca che letteralmente significa \"torta di legno\". Questo dolce ha infatti l\'aspetto di un tronco tagliato.',0),('gBHM8710J','Chocolate Pocky','Glico','Leggeri biscottini  Chocolate Pocky, dalla forma stretta e lunga e al sapore di cacao, ricoperti poi da una gustosa crema al cioccolato. Uno snack inedito, introvabile altrove che arriva direttamente dal Giappone in una particolare confezione da 49g grammi, comodo e maneggevole da portare ovunque si voglia e da consumare con chiunque tu voglia!',0),('GesKKqnx','Chip Star Potato Chips - Mild Salt','Chip Star YBC','Le Chip Star Potato Chips della YBC sono uno degli snack più famosi. La confezione è un pratico cilindro con chiusura per portarle ovunque! Queste patatine sono leggermente salate per offrire un gusto delicato. Disponibili anche in altre varietà.',0),('gFEfPBJg','Oreo Mint Flavour','Oreo','Biscotti Oreo alla menta, farciti con tutto il gusto della crema green. Uno snack dolce che potrai tenere con te sul posto di lavoro, a scuola, in ufficio oppure in giro.',0),('hcCcRJX5','Monster Cuba Libre','Monster','Bevanda energetica all\'intenso sapore di Cuba Libre, il famoso cocktail al rum, cola e lime. Una lattina davvero speciale, assolutamente da collezione che arriva direttamente dal Giappone.',1),('JgrrTR876','Pancakes con Mochi Al Matcha','Marukyo','Due soffici Funwari, pancake giapponesi ripieni di pasta di fagioli dolci e mochi di riso, al tÃÂÃÂÃÂÃÂ¨ verde matcha',0),('Pz7nszym','Snickers Almond','Snickers','Barretta di cioccolato Snickers Almond da 49.9 grammi per una candy bar farcita internamente con squisite ed originali mandorle americane. Ma non solo: questo snack dolce è composto',0),('PZzimtRa','Reese\'s Nut Bar','Reese\'s','Barretta di cioccolato Reese\'s Nut bar, con all\'interno crema di caramello e arachidi intere a comporre uno snack dolce fra i migliori e più buoni di tutto il catalogo Reese\'s.',0),('T4iGqTCG','Chip Star Nori-Shio','Chip Star YBC','Patatine Chip Star al gusto di alga marina Nori-shio e sale.',0),('t6hyM8710J','Pop Tarts Frosted Cookies and Creme','Pop tarts','Pop Tarts Cookies and Creme, biscotti ripieni di crema alla vaniglia e cioccolato, nel formato da 400 grammi. Questa soluzione prevede biscotti Pop Tarts con farcitura cremosa alla vaniglia e al cioccolato.',1),('tyih29rt','Dr Pepper','Dr Pepper','Dr Pepper UK, bevanda fruttata con vaniglia e caramello. Un prodotto che non può assolutamente mancare nella tua dispensa, nella versione britannica, sinonimo di storia ed effervescenza! Dr. Pepper infatti è fra le bibite più conosciute ed apprezzate anche negli Stati Uniti e se hai voglia di provare qualcosa mai assaggiato prima non puoi assolutamente fartela scappare!',0),('tyPOJ864PL','Oishi Pillows Choco Filled Crackers','Oishi','Gli Oishi Pillows Choco Filled Crackers, crackers al cacao ripieni di crema al cioccolato da 38 grammi. Una mini confezione da 38 grammi che racchiude un sapore straordinario con biscotti friabili fuori e crema al cioccolato interna.',0),('UoESj9xK','Cheetos Crunchy','Cheetos','Cheetos, Crunchy Flavoured, arricchiti da un\'incredibile croccantezza in questa straordinaria variante all\'originale e intenso sapore di formaggio cheddar. Le Cheetos Crunchy rappresentano le patatine preferite dagli americani ormai già dal 1948 per via del magico gusto, della forma un po’ bizzarra e della croccantezza unica.',0),('xBDiMhYa','M&M\'s Fudge Brownie','MM\'s','Confezione di M&M\'s Fudge Brownie, confetti al cioccolato con cuore morbido al brownie, un famoso dolcetto al cioccolato e nocciole. Questa soluzione M&M\'s da 40 grammi contiene tutta la bontà e la qualità dell\'impasto M&M\'s, accompagnato da un dolce cuore al brownie che farà impazzire tutti gli appassionati.',0),('YHGv875TyK','Ocean Bomb Vegito Apple','Ocean Bomb','Ocean Bomb Vegito Apple, un\' incredibile bevanda alla mela da 330ml dedicata alla famosissima serie Dragon Ball. arliamo di una bevanda composta per lo più da acqua frizzante e rinfrescante al gusto di mela. Una lattina degna di essere provata e, ovviamente, collezionata.',1),('YJtnPO97G','Fanta Peach','Fanta','Lattina Fanta Peach da 355 ml al gusto di Pesca. Sapore nuovo e dolce al punto giusto: questo prodotto è uno fra quelli che raramente troverete in un negozio europeo. ',1),('zC3RFPrT','Monster Mango Loco','Monster','Monster Energy al gusto mango è un mix perfetto tra dolcezza ed energia elettrizzante! Lasciati trasportare dalla movida',0);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recensione`
--

DROP TABLE IF EXISTS `recensione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recensione` (
  `cliente` varchar(50) NOT NULL,
  `codiceSerialeProdotto` varchar(25) NOT NULL,
  `prodotto` varchar(50) NOT NULL,
  `voto` int NOT NULL,
  `testoRecensione` varchar(250) NOT NULL,
  `data` date NOT NULL,
  `anonimo` tinyint NOT NULL,
  PRIMARY KEY (`cliente`,`codiceSerialeProdotto`),
  KEY `fk_recensione_2_idx` (`codiceSerialeProdotto`,`prodotto`),
  CONSTRAINT `fk_recensione_1` FOREIGN KEY (`cliente`) REFERENCES `utente` (`username`),
  CONSTRAINT `fk_recensione_2` FOREIGN KEY (`codiceSerialeProdotto`, `prodotto`) REFERENCES `prodotto` (`codiceSeriale`, `nome`),
  CONSTRAINT `recensione_chk_1` CHECK (((`voto` >= 0) and (`voto` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recensione`
--

LOCK TABLES `recensione` WRITE;
/*!40000 ALTER TABLE `recensione` DISABLE KEYS */;
INSERT INTO `recensione` VALUES ('LMiranda','GesKKqnx','Chip Star Potato Chips - Mild Salt',3,'Mi piacevano tanto','2022-06-22',0);
/*!40000 ALTER TABLE `recensione` ENABLE KEYS */;
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

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `sesso` enum('M','F','X') NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('ANappi','bmFwcGk5OQ==','anappi@gmail.com','Antonio','Nappi','M',0),('CTroiano','dHJvaWFubzEx','ctroiano@gmail.com','Ciro','Troiano','M',0),('GBasile','YmFzaWxlMjI=','gbasile@gmail.com','Giuseppe','Basile','M',0),('LMessi10','TGlvbmVsMTA=','leomessi@email.it','Lionel','Messi','M',0),('LMiranda','bWlyYW5kYTY5','lmiranda12@gmail.com','Luigi','Miranda','M',0),('root','cm9vdA==','root@email.com','root','sudo','X',1),('utenteA','cGFzc3dvcmQ=','utentea@email.com','nome','cognome','M',0),('xporion64','cHJvdmE=','ciro.troiano@gmail.com','succa','suchello','M',0);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-21 12:53:13
