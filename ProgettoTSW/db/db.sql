CREATE DATABASE  IF NOT EXISTS `ecommercedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommercedb`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommercedb
-- ------------------------------------------------------
-- Server version	8.0.27

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
INSERT INTO `appartenenza` VALUES ('gFEfPBJg','biscotti'),('hcCcRJX5','energy drink'),('zC3RFPrT','energy drink'),('GesKKqnx','patatine'),('UoESj9xK','patatine'),('Pz7nszym','snack dolci'),('PZzimtRa','snack dolci'),('xBDiMhYa','snack dolci'),('GesKKqnx','snack salati'),('T4iGqTCG','snack salati'),('UoESj9xK','snack salati'),('tyih29rt','soft drink');
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
INSERT INTO `composizioneordine` VALUES (1,'LMiranda','UoESj9xK',1,4.99),(1,'LMiranda','xBDiMhYa',1,4.99),(2,'ANappi','GesKKqnx',1,6.50),(2,'ANappi','zC3RFPrT',1,1.50),(3,'GBasile','T4iGqTCG',1,6.50),(3,'GBasile','UoESj9xK',1,4.99),(3,'GBasile','xBDiMhYa',1,4.99);
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
  `IVA` int NOT NULL,
  `quantita` int NOT NULL,
  `origine` varchar(50) DEFAULT NULL,
  `scadenza` date NOT NULL,
  `peso` varchar(25) DEFAULT NULL,
  `volume` varchar(25) DEFAULT NULL,
  `immagine` varchar(500) DEFAULT NULL,
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
INSERT INTO `dettaglioprodotto` VALUES ('snack','GesKKqnx',6.00,22,99,'Giappone','2023-04-28','50g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/mildsalt.png'),('snack','gFEfPBJg',2.99,22,99,'USA','2023-04-26','154g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/Oreo-Mint-Flavour-154g_1800x1800.png'),('snack','Pz7nszym',2.49,22,99,'USA','2023-04-10','49.9g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/Snickers-Almond-50g_1800x1800.png'),('snack','PZzimtRa',1.99,22,99,'USA','2023-04-22','47g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/reesesnutbar.png'),('snack','tyih29rt',1.59,22,99,'UK','2023-04-21',NULL,'330ml','https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/Dr-Pepper-330ml_1_1800x1800.png'),('snack','UoESj9xK',4.99,22,99,'USA','2023-04-17','226g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/cheetos-crunchy-226g_1800x1800.png'),('snack','xBDiMhYa',1.99,22,99,'USA','2023-04-20','40g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/memFudgeBrownie.png'),('drink','hcCcRJX5',5.99,22,99,'Giappone','2023-04-19',NULL,'355ml','https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/Monster-Cuba-Libre-355ml_1800x1800.png'),('drink','T4iGqTCG',6.50,22,99,'Giappone','2023-04-07','115g',NULL,'https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/chipstarnori.png'),('drink','zC3RFPrT',1.50,22,99,'Internazionale','2023-04-30',NULL,'500ml','https://raw.githubusercontent.com/ImCirot/Progetto-TSW/main/Immagini%20catalogo/mangoloco.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzo`
--

LOCK TABLES `indirizzo` WRITE;
/*!40000 ALTER TABLE `indirizzo` DISABLE KEYS */;
INSERT INTO `indirizzo` VALUES (1,'LMiranda','Via Giacomo Leopardi','San Giuseppe Vesuviano','80047','69','Napoli','Italia',NULL,NULL,'si'),(2,'LMiranda','Via Franco Civetta','Nola','80035','17','Napoli','Italia',NULL,NULL,'no'),(3,'ANappi','Via Rione ','Torre Annunziata','80058','32','Napoli','Italia','A','S','si'),(4,'GBasile','Via San Simone','Nola','80035','289','Napoli','Italia',NULL,NULL,'si'),(5,'CTroiano','Via Trieste','Portico di Caserta','81050','45','Caserta','Italia',NULL,NULL,'si');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metododipagamento`
--

LOCK TABLES `metododipagamento` WRITE;
/*!40000 ALTER TABLE `metododipagamento` DISABLE KEYS */;
INSERT INTO `metododipagamento` VALUES (1,'LMiranda','Via Giacomo Leopardi','San Giuseppe Vesuviano','80047','69','Napoli','Italia','IBAN','IT22T0300203280284125425667',NULL,'no'),(2,'LMiranda','Via Franco Civetta','Nola','80035','17','Napoli','Italia','carta',NULL,'5111538754725418','si'),(3,'ANappi','Via Rione ','Torre Annunziata','80058','32','Napoli','Italia','carta',NULL,'5109337062062083','si'),(4,'GBasile','Via San Simone','Nola','80035','289','Napoli','Italia','IBAN','IT84G0300203280397435493853',NULL,'si'),(5,'CTroiano','Via Trieste','Portico di Caserta','81050','45','Caserta','Italia','IBAN','IT14U0300203280955173519725',NULL,'si');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (1,'LMiranda','carta',NULL,'5111538754725418','San Giuseppe Vesuviano','80047','Via Franco Civetta','17','Napoli','Italia','2022-02-22',9.98),(2,'ANappi','carta',NULL,'5109337062062083','Torre Annunziata','80058','Via Rione ','32','Napoli','Italia','2022-02-11',8),(3,'GBasile','IBAN','IT84G0300203280397435493853',NULL,'Nola','80035','Via San Simone','289','Napoli','Italia','2022-03-04',16.48);
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
INSERT INTO `utente` VALUES ('ANappi','bmFwcGk5OQ==','anappi@gmail.com','Antonio','Nappi','M',0),('CTroiano','dHJvaWFubzEx','ctroiano@gmail.com','Ciro','Troiano','M',0),('GBasile','YmFzaWxlMjI=','gbasile@gmail.com','Giuseppe','Basile','M',0),('LMiranda','bWlyYW5kYTY5','lmiranda12@gmail.com','Luigi','Miranda','M',0),('root','cm9vdA==','root@email.com','root','sudo','X',1),('utenteA','cGFzc3dvcmQ=','utentea@email.com','nome','cognome','M',0);
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

-- Dump completed on 2022-05-06 16:22:48