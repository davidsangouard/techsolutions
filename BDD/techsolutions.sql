-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: techsolutions
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `actualites`
--

DROP TABLE IF EXISTS `actualites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actualites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `contenu` text NOT NULL,
  `date_publication` datetime DEFAULT current_timestamp(),
  `auteur` varchar(100) DEFAULT NULL,
  `statut` enum('brouillon','publie') DEFAULT 'brouillon',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actualites`
--

LOCK TABLES `actualites` WRITE;
/*!40000 ALTER TABLE `actualites` DISABLE KEYS */;
INSERT INTO `actualites` VALUES (1,'Bienvenue sur TechSolutions','TechSolutions propose des configurations PC adaptées à chaque service de votre entreprise.','2025-11-14 09:51:00','Admin','publie'),(2,'Nouvelles configurations disponibles','Découvrez nos configurations optimisées pour le développement, le design et la gestion.','2025-11-14 09:51:00','Admin','publie'),(3,'Support et conseil','Notre équipe vous accompagne dans le choix de la configuration idéale pour vos besoins.','2025-11-14 09:51:00','Admin','publie');
/*!40000 ALTER TABLE `actualites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrateurs`
--

DROP TABLE IF EXISTS `administrateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(150) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrateurs`
--

LOCK TABLES `administrateurs` WRITE;
/*!40000 ALTER TABLE `administrateurs` DISABLE KEYS */;
INSERT INTO `administrateurs` VALUES (1,'admin','$2a$12$P9TaVZVPADsYVEEfH6Hz0.0vgW9OP7aEAHa1TOxMhRyR5Tq8iDRd6','admin@techsolutions.fr','2025-11-14 08:51:00');
/*!40000 ALTER TABLE `administrateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composants`
--

DROP TABLE IF EXISTS `composants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(50) NOT NULL,
  `libelle` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `prix_ht` decimal(10,2) DEFAULT NULL,
  `date_ajout` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composants`
--

LOCK TABLES `composants` WRITE;
/*!40000 ALTER TABLE `composants` DISABLE KEYS */;
INSERT INTO `composants` VALUES (1,'CASEAC-001','Fox Spirit LIGHTFLOW ARGB HUB','https://www.ldlc.pro/fiche/PB00654453.html',8.29,'2025-11-14 08:51:00'),(2,'CASEFAN-001','Fox Spirit FA120 ARGB (Noir)','https://www.ldlc.pro/fiche/PB00696127.html',9.96,'2025-11-14 08:51:00'),(3,'CASEFAN-002','Arctic P12 PWM PST Noir','https://www.ldlc.pro/fiche/PB00505033.html',9.92,'2025-11-14 08:51:00'),(4,'CASEFAN-003','Aerocool Phantom M-3 12 PWM ARGB (Noir)','https://www.ldlc.pro/fiche/PB00659018.html',8.25,'2025-11-14 08:51:00'),(5,'CASEFAN-004','Noctua NF-P12 Redux-1300 PWM','https://www.ldlc.pro/fiche/PB00253244.html',16.63,'2025-11-14 08:51:00'),(6,'CASEFAN-005','be quiet! Silent Wings 4 120mm PWM','https://www.ldlc.pro/fiche/PB00504486.html',23.29,'2025-11-14 08:51:00'),(7,'CASEFAN-006','Arctic P12 Pro A-RGB (Noir)','https://www.ldlc.pro/fiche/PB00692228.html',11.46,'2025-11-14 08:51:00'),(8,'CASEFAN-007','Aerocool APNX FP1-140 (Noir)','https://www.ldlc.pro/fiche/PB00587254.html',10.79,'2025-11-14 08:51:00'),(9,'CASEFAN-008','Arctic P14 Pro (Noir)','https://www.ldlc.pro/fiche/PB00699278.html',8.25,'2025-11-14 08:51:00'),(10,'CASEFAN-009','Antec Connect 120 ARGB Noir (x3)','https://www.ldlc.pro/fiche/PB00657735.html',27.46,'2025-11-14 08:51:00'),(11,'CASEFAN-010','Arctic P12 SLIM PWM PST','https://www.ldlc.pro/fiche/PB00408325.html',7.46,'2025-11-14 08:51:00'),(12,'CASE-001','Fox Spirit AG1 (Noir) - Moyen Tour','https://www.ldlc.pro/fiche/PB00663701.html',83.29,'2025-11-14 08:51:00'),(13,'CASE-002','be quiet! Pure Base 500 (Noir) - Moyen Tour','https://www.ldlc.pro/fiche/PB00581486.html',91.63,'2025-11-14 08:51:00'),(14,'CASE-003','Aerocool CS-111 V2 Noir - Mini Tour','https://www.ldlc.pro/fiche/PB00660826.html',37.46,'2025-11-14 08:51:00'),(15,'CASE-004','Cooler Master Silencio S600 - Moyen Tour','https://www.ldlc.pro/fiche/PB00275559.html',91.62,'2025-11-14 08:51:00'),(16,'CASE-005','be quiet! Pure Base 600 (Noir) - Moyen Tour','https://www.ldlc.pro/fiche/PB00222411.html',87.46,'2025-11-14 08:51:00'),(17,'CASE-006','Aerocool D301A V1 Noir - Mini Tour','https://www.ldlc.pro/fiche/PB00659164.html',58.29,'2025-11-14 08:51:00'),(18,'CASE-007','Fox Spirit EG1 (Noir) - Moyen Tour','https://www.ldlc.pro/fiche/PB00703259.html',108.29,'2025-11-14 08:51:00'),(19,'CASE-008','Aerocool CS-106 (Noir) - Mini Tour','https://www.ldlc.pro/fiche/PB00428914.html',33.29,'2025-11-14 08:51:00'),(20,'CPUCO-001','be quiet! Pure Rock Pro 3 (Noir)','https://www.ldlc.pro/fiche/PB00672815.html',41.63,'2025-11-14 08:51:00'),(21,'CPUCO-002','Arctic Freezer 36 (Noir)','https://www.ldlc.pro/fiche/PB00606845.html',37.46,'2025-11-14 08:51:00'),(22,'CPUCO-003','Noctua NH-U12A Chromax Black','https://www.ldlc.pro/fiche/PB00465678.html',133.29,'2025-11-14 08:51:00'),(23,'CPUCO-004','be quiet! Dark Rock 5','https://www.ldlc.pro/fiche/PB00623910.html',66.63,'2025-11-14 08:51:00'),(24,'CPUCO-005','Arctic Liquid Freezer III 240 A-RGB (Noir)','https://www.ldlc.pro/fiche/PB00623910.html',91.63,'2025-11-14 08:51:00'),(25,'CPUCO-006','Cooler Master Hyper 212 Black','https://www.ldlc.pro/fiche/PB00579435.html',20.79,'2025-11-14 08:51:00'),(26,'CPU-001','AMD Ryzen 5 7600 (3.8 GHz / 5.1 GHz)','https://www.ldlc.pro/fiche/PB00536100.html',183.29,'2025-11-14 08:51:00'),(27,'CPU-002','AMD Ryzen 7 7700 (3.8 GHz / 5.3 GHz)','https://www.ldlc.pro/fiche/PB00703383.html',224.96,'2025-11-14 08:51:00'),(28,'CPU-003','AMD Ryzen 7 5800X (3.8 GHz / 4.7 GHz)','https://www.ldlc.pro/fiche/PB00387534.html',166.63,'2025-11-14 08:51:00'),(29,'CPU-004','AMD Ryzen 5 5600 (3.5 GHz / 4.4 GHz)','https://www.ldlc.pro/fiche/PB00699110.html',70.79,'2025-11-14 08:51:00'),(30,'CPU-005','AMD Ryzen 9 7900X (4.7 GHz / 5.6 GHz)','https://www.ldlc.pro/fiche/PB00516611.html',358.29,'2025-11-14 08:51:00'),(31,'CPU-006','Intel Core i5-13600KF (3.5 GHz / 5.1 GHz)','https://www.ldlc.pro/fiche/PB00519257.html',299.95,'2025-11-14 08:51:00'),(32,'CPU-007','Intel Core i7-13700K (3.4 GHz / 5.4 GHz)','https://www.ldlc.pro/fiche/PB00519277.html',416.63,'2025-11-14 08:51:00'),(33,'EXTERNAL-001','Samsung Portable SSD T7 1 To Bleu','https://www.ldlc.pro/fiche/PB00334797.html',91.63,'2025-11-14 08:51:00'),(34,'EXTERNAL-002','Samsung Portable SSD T7 2 To Bleu','https://www.ldlc.pro/fiche/PB00334798.html',137.46,'2025-11-14 08:51:00'),(35,'EXTERNAL-003','Samsung Portable SSD T7 4 To Gris','https://www.ldlc.pro/fiche/PB00622258.html',249.96,'2025-11-14 08:51:00'),(36,'EXTERNAL-004','Crucial X10 Portable 2 To','https://www.ldlc.pro/fiche/PB00683347.html',183.29,'2025-11-14 08:51:00'),(37,'EXTERNAL-005','Crucial X10 Pro Portable 4 To','https://www.ldlc.pro/fiche/PB00563421.html',333.29,'2025-11-14 08:51:00'),(38,'EXTERNAL-006','LaCie Rugged Mini 5 To (USB-C)','https://www.ldlc.pro/fiche/PB00277674.html',183.29,'2025-11-14 08:51:00'),(39,'EXTERNAL-007','WD Elements Portable 5 To Noir (USB 3.0)','https://www.ldlc.pro/fiche/PB00585178.html',133.29,'2025-11-14 08:51:00'),(40,'EXTERNAL-008','Kingston XS2000 2 To','https://www.ldlc.pro/fiche/PB00564415.html',166.63,'2025-11-14 08:51:00'),(41,'EXTERNAL-009','LaCie 1big Dock Thunderbolt 3 - 8 To','https://www.ldlc.pro/fiche/PB00353634.html',441.62,'2025-11-14 08:51:00'),(42,'EXTERNAL-010','ioSafe Solo G3 4 To (Waterproof/Fireproof)','https://www.ldlc.pro/fiche/PB00582205.html',499.96,'2025-11-14 08:51:00'),(43,'FAN-001','Noctua NA-FC1 (Contrôleur PWM 3 canaux)','https://www.ldlc.com/fiche/PB00253235.html',29.95,'2025-11-14 08:51:00'),(44,'FAN-002','NZXT RGB & Fan Controller','https://www.ldlc.com/fiche/PB00305624.html',59.95,'2025-11-14 08:51:00'),(45,'HEADPHONES-001','Audio-Technica ATH-M50x (Noir)','https://www.ldlc.pro/fiche/PB00466740.html',133.29,'2025-11-14 08:51:00'),(46,'HEADPHONES-002','Sony WH-1000XM5 (Noir)','https://www.ldlc.pro/fiche/PB00535836.html',274.96,'2025-11-14 08:51:00'),(47,'HEADPHONES-003','AKG N9 Hybrid (Noir)','https://www.ldlc.pro/fiche/PB00665063.html',240.83,'2025-11-14 08:51:00'),(48,'HEADPHONES-004','B&W Px7 S3 (Noir Anthracite)','https://www.ldlc.pro/fiche/PB00702618.html',358.29,'2025-11-14 08:51:00'),(49,'HEADPHONES-005','Audio-Technica ATH-M30x','https://www.ldlc.pro/fiche/PB00466691.html',74.96,'2025-11-14 08:51:00'),(50,'HEADPHONES-006','Belkin Micro Casque USB-C/Bluetooth','https://www.ldlc.pro/fiche/PB00584780.html',49.96,'2025-11-14 08:51:00'),(51,'HEADPHONES-007','Apple AirPods Pro 2 (Boîtier MagSafe USB-C)','https://www.ldlc.pro/fiche/PB00571619.html',190.83,'2025-11-14 08:51:00'),(52,'INTERNAL-001','Seagate BarraCuda 1 To (ST1000DM014)','https://www.ldlc.pro/fiche/PB00559048.html',56.63,'2025-11-14 08:51:00'),(53,'INTERNAL-002','Seagate BarraCuda 4 To (ST4000DM004)','https://www.ldlc.pro/fiche/PB00234144.html',108.29,'2025-11-14 08:51:00'),(54,'INTERNAL-003','Seagate IronWolf 4 To (ST4000VN006)','https://www.ldlc.pro/fiche/PB00494230.html',116.63,'2025-11-14 08:51:00'),(55,'INTERNAL-004','Seagate IronWolf 8 To (ST8000VN004)','https://www.ldlc.pro/fiche/PB00281525.html',191.63,'2025-11-14 08:51:00'),(56,'INTERNAL-005','Seagate IronWolf Pro 10 To (ST10000NT001)','https://www.ldlc.pro/fiche/PB00519239.html',291.63,'2025-11-14 08:51:00'),(57,'INTERNAL-006','Western Digital WD Red Plus 6 To','https://www.ldlc.pro/fiche/PB00542621.html',183.29,'2025-11-14 08:51:00'),(58,'INTERNAL-007','Synology HAT5300-4T 4 To','https://www.ldlc.pro/fiche/PB00498508.html',224.96,'2025-11-14 08:51:00'),(59,'INTERNAL-008','Seagate Exos X20 20 To (ST20000NM002D)','https://www.ldlc.pro/fiche/PB00584253.html',449.96,'2025-11-14 08:51:00'),(60,'KEYBOARD-001','Logitech MX Keys S (Graphite)','https://www.ldlc.pro/fiche/PB00556046.html',99.96,'2025-11-14 08:51:00'),(61,'KEYBOARD-002','Logitech Wave Keys (Noir)','https://www.ldlc.pro/fiche/PB00576651.html',58.29,'2025-11-14 08:51:00'),(62,'KEYBOARD-003','Cherry KC 6000 Slim (Noir)','https://www.ldlc.pro/fiche/PB00251920.html',45.79,'2025-11-14 08:51:00'),(63,'KEYBOARD-004','INOVU LK120 (AZERTY, Français)','https://www.ldlc.pro/fiche/PB00594739.html',14.58,'2025-11-14 08:51:00'),(64,'KEYBOARD-005','Apple Magic Keyboard (AZERTY, Français)','https://www.ldlc.pro/fiche/PB00651741.html',99.17,'2025-11-14 08:51:00'),(65,'KEYBOARD-006','Corsair Gaming K70 Core','https://www.ldlc.pro/fiche/PB00576649.html',83.29,'2025-11-14 08:51:00'),(66,'KEYBOARD-007','Bluestork Media Office','https://www.ldlc.pro/fiche/PB00649506.html',8.25,'2025-11-14 08:51:00'),(67,'KEYBOARD-008','INOVU SWL10 Noir (AZERTY, Français)','https://www.ldlc.pro/fiche/PB00388018.html',20.42,'2025-11-14 08:51:00'),(68,'MEMORY-001','Textorm 16 Go (2x 8 Go) DDR4 3200 MHz CL16','https://www.ldlc.pro/fiche/PB00392932.html',80.79,'2025-11-14 08:51:00'),(69,'MEMORY-002','Textorm 32 Go (2x 16 Go) DDR4 3200 MHz CL16','https://www.ldlc.pro/fiche/PB00392938.html',158.29,'2025-11-14 08:51:00'),(70,'MEMORY-003','Textorm 32 Go (2x 16 Go) DDR5 6000 MHz CL36','https://www.ldlc.pro/fiche/PB00656910.html',149.96,'2025-11-14 08:51:00'),(71,'MEMORY-004','Corsair Dominator Platinum DDR5 RGB 32 Go (2x 16 Go) 6000 MHz CL30','https://www.ldlc.pro/fiche/PB00548197.html',0.00,'2025-11-14 08:51:00'),(72,'MEMORY-005','Textorm SO-DIMM 16 Go DDR4 3200 MHz CL22','https://www.ldlc.pro/fiche/PB00426643.html',0.00,'2025-11-14 08:51:00'),(73,'MEMORY-006','Textorm SO-DIMM 32 Go (2x 16 Go) DDR4 3200 MHz CL22','https://www.ldlc.pro/fiche/PB00630478.html',0.00,'2025-11-14 08:51:00'),(74,'MEMORY-007','Corsair Dominator Platinum DDR5 RGB 64 Go (2x 32 Go) 6000 MHz CL30','https://www.ldlc.pro/fiche/PB00555089.html',0.00,'2025-11-14 08:51:00'),(75,'MONITOR-001','AOC 23.8\" LED - 24B3HA2 (Full HD, IPS, 75 Hz)','https://www.ldlc.pro/fiche/PB00597773.html',83.29,'2025-11-14 08:51:00'),(76,'MONITOR-002','LG 23.8\" LED - 24MS550-B (Full HD, IPS, 75 Hz)','https://www.ldlc.pro/fiche/PB00622280.html',83.29,'2025-11-14 08:51:00'),(77,'MONITOR-003','BenQ 23.8\" LED - GW2491 (Full HD, IPS, 75 Hz)','https://www.ldlc.pro/fiche/PB00663389.html',74.96,'2025-11-14 08:51:00'),(78,'MONITOR-004','MSI 23.8\" LED - PRO MP242AP (Full HD, IPS, 75 Hz)','https://www.ldlc.pro/fiche/PB00567502.html',91.63,'2025-11-14 08:51:00'),(79,'MONITOR-005','Acer 21.5\" LED - Vero B227QE3bmiprxv (Full HD, IPS, 100 Hz)','https://www.ldlc.pro/fiche/PB00631760.html',108.29,'2025-11-14 08:51:00'),(80,'MONITOR-006','INOVU 21.5\" LED - MB22 V2 (Full HD, VA, 100 Hz)','https://www.ldlc.pro/fiche/PB00613781.html',63.75,'2025-11-14 08:51:00'),(81,'MONITOR-007','iiyama 23.8\" LED - ProLite XUB2493HS-B6 (Full HD, IPS, 75 Hz)','https://www.ldlc.pro/fiche/PB00597291.html',116.63,'2025-11-14 08:51:00'),(82,'MONITOR-008','Acer 27\" LED - Nitro VG271UM3bmiipx (2.5K, 180 Hz, IPS)','https://www.ldlc.pro/fiche/PB00561639.html',166.63,'2025-11-14 08:51:00'),(83,'MONITOR-009','Acer 27\" LED - Vero B277UGbemiqpruzx (2.5K, 120 Hz, IPS, USB-C)','https://www.ldlc.pro/fiche/PB00698956.html',208.29,'2025-11-14 08:51:00'),(84,'MONITOR-010','Fox Spirit 28\" LED - PGK280 (4K, 144 Hz, IPS, USB-C)','https://www.ldlc.pro/fiche/PB00510188.html',291.63,'2025-11-14 08:51:00'),(85,'MONITOR-011','Acer 34\" LED - Predator X34Vbmiiphuzx (UltraWide OLED, 175 Hz)','https://www.ldlc.pro/fiche/PB00595101.html',833.29,'2025-11-14 08:51:00'),(86,'MONITOR-012','INOVU 27\" LED - MBQ27 (2.5K, 75 Hz, IPS, USB-C)','https://www.ldlc.pro/fiche/PB00559189.html',141.63,'2025-11-14 08:51:00'),(87,'MONITOR-013','Acer 23.8\" LED - Nitro VG240YEbmiix (Full HD, 100 Hz, IPS)','https://www.ldlc.pro/fiche/PB00561671.html',74.96,'2025-11-14 08:51:00'),(88,'MONITOR-014','Fox Spirit 49\" LED - PGM491 (UltraWide 5K, 144 Hz, VA)','https://www.ldlc.pro/fiche/PB00657719.html',624.96,'2025-11-14 08:51:00'),(89,'MOTHERBOARD-001','MSI PRO H610M-E DDR4','https://www.ldlc.pro/fiche/PB00545871.html',58.29,'2025-11-14 08:51:00'),(90,'MOTHERBOARD-002','Gigabyte H610M S2H V3 DDR4','https://www.ldlc.pro/fiche/PB00607356.html',62.46,'2025-11-14 08:51:00'),(91,'MOTHERBOARD-003','ASRock B450M Pro4 R2.0','https://www.ldlc.pro/fiche/PB00462746.html',69.13,'2025-11-14 08:51:00'),(92,'MOTHERBOARD-004','ASRock A620M-HDV/M.2','https://www.ldlc.pro/fiche/PB00552929.html',83.29,'2025-11-14 08:51:00'),(93,'MOTHERBOARD-005','MSI PRO B760M-P DDR4','https://www.ldlc.pro/fiche/PB00537254.html',83.29,'2025-11-14 08:51:00'),(94,'MOTHERBOARD-006','ASRock B650M PG Lightning','https://www.ldlc.pro/fiche/PB00592895.html',116.63,'2025-11-14 08:51:00'),(95,'MOTHERBOARD-007','ASUS TUF GAMING B650-PLUS WIFI','https://www.ldlc.pro/fiche/PB00520904.html',181.63,'2025-11-14 08:51:00'),(96,'MOTHERBOARD-008','ASRock B860 PRO RS','https://www.ldlc.pro/fiche/PB00671756.html',149.96,'2025-11-14 08:51:00'),(97,'MOTHERBOARD-009','Gigabyte B850 AORUS ELITE WIFI7 ICE','https://www.ldlc.pro/fiche/PB00660675.html',199.96,'2025-11-14 08:51:00'),(98,'MOTHERBOARD-010','ASRock X870 Nova WiFi','https://www.ldlc.pro/fiche/PB00703412.html',299.96,'2025-11-14 08:51:00'),(99,'MOUSE-001','Logitech B110 Silent (Noir)','https://www.ldlc.pro/fiche/PB00256298.html',9.96,'2025-11-14 08:51:00'),(100,'MOUSE-002','INOVU FM 1600 (Noir)','https://www.ldlc.pro/fiche/PB00654454.html',6.63,'2025-11-14 08:51:00'),(101,'MOUSE-003','Advance Drift 2 Noir','https://www.ldlc.pro/fiche/PB00316126.html',8.29,'2025-11-14 08:51:00'),(102,'MOUSE-004','Logitech M171 Wireless Mouse (Noir)','https://www.ldlc.pro/fiche/PB00214538.html',13.29,'2025-11-14 08:51:00'),(103,'MOUSE-005','Logitech M220 Silent (Noir)','https://www.ldlc.pro/fiche/PB00214497.html',16.63,'2025-11-14 08:51:00'),(104,'MOUSE-006','Logitech M240 Silent (Graphite)','https://www.ldlc.pro/fiche/PB00554020.html',23.29,'2025-11-14 08:51:00'),(105,'MOUSE-007','ASUS TUF Gaming M3 Gen II','https://www.ldlc.pro/fiche/PB00569700.html',33.29,'2025-11-14 08:51:00'),(106,'MOUSE-008','Logitech M650 (Graphite)','https://www.ldlc.pro/fiche/PB00480702.html',33.29,'2025-11-14 08:51:00'),(107,'MOUSE-009','ASUS ROG Gladius II Core','https://www.ldlc.pro/fiche/PB00274106.html',37.46,'2025-11-14 08:51:00'),(108,'MOUSE-010','Logitech MX Vertical','https://www.ldlc.pro/fiche/PB00256308.html',83.29,'2025-11-14 08:51:00'),(109,'MOUSE-011','Logitech MX Master 3S (Graphite)','https://www.ldlc.pro/fiche/PB00500370.html',74.96,'2025-11-14 08:51:00'),(110,'MOUSE-012','ASUS ROG Keris Wireless AimPoint (Blanc)','https://www.ldlc.pro/fiche/PB00536223.html',74.96,'2025-11-14 08:51:00'),(111,'MOUSE-013','ASUS ROG Harpe Ace Noir (Aim Lab Edition)','https://www.ldlc.pro/fiche/PB00538830.html',91.63,'2025-11-14 08:51:00'),(112,'MOUSE-014','ASUS ROG Harpe II Ace Noir','https://www.ldlc.pro/fiche/PB00697402.html',149.96,'2025-11-14 08:51:00'),(113,'OPTICAL-001','Verbatim Graveur de CD/DVD externe USB 2.0','https://www.ldlc.pro/fiche/PB00556044.html',33.29,'2025-11-14 08:51:00'),(114,'OPTICAL-002','Verbatim Graveur de CD/DVD externe USB-C','https://www.ldlc.pro/fiche/PB00556040.html',37.46,'2025-11-14 08:51:00'),(115,'OPTICAL-003','ASUS SDRW-08D2S-U Lite Noir','https://www.ldlc.pro/fiche/PB00123265.html',39.13,'2025-11-14 08:51:00'),(116,'OPTICAL-004','ASUS SDRW-08U7M-U Argent','https://www.ldlc.pro/fiche/PB00202674.html',45.79,'2025-11-14 08:51:00'),(117,'OPTICAL-005','ASUS SDRW-08U7M-U Noir','https://www.ldlc.pro/fiche/PB00202712.html',49.12,'2025-11-14 08:51:00'),(118,'OPTICAL-006','ASUS ZenDrive U9M (USB-C/USB-A) Noir','https://www.ldlc.pro/fiche/PB00237284.html',49.96,'2025-11-14 08:51:00'),(119,'OPTICAL-007','ASUS ZenDrive V1M (USB-C)','https://www.ldlc.pro/fiche/PB00481334.html',58.29,'2025-11-14 08:51:00'),(120,'OPTICAL-008','Verbatim Graveur de Blu-ray externe USB-A','https://www.ldlc.pro/fiche/PB00556082.html',116.63,'2025-11-14 08:51:00'),(121,'OPTICAL-009','ASUS BW-16D1HT (Interne SATA)','https://www.ldlc.pro/fiche/PB00152185.html',99.96,'2025-11-14 08:51:00'),(122,'OS-001','Microsoft Windows 10 Pro','',149.96,'2025-11-14 08:51:00'),(123,'OS-002','Microsoft Windows 10 Famille','',116.63,'2025-11-14 08:51:00'),(124,'OS-003','Microsoft Windows 11 Pro','',166.63,'2025-11-14 08:51:00'),(125,'OS-004','Microsoft Windows 11 Famille','',133.29,'2025-11-14 08:51:00'),(126,'OS-005','Microsoft Windows Server 2019','',541.63,'2025-11-14 08:51:00'),(127,'OS-006','Microsoft Windows Server 2022','',666.63,'2025-11-14 08:51:00'),(128,'OS-007','Microsoft Windows Server 2025','',749.96,'2025-11-14 08:51:00'),(129,'OS-008','Linux Mint','https://linuxmint.com/',0.00,'2025-11-14 08:51:00'),(130,'OS-009','Fedora Workstation','https://fedoraproject.org/',0.00,'2025-11-14 08:51:00'),(131,'OS-010','CentOS Stream','https://centos.org/',0.00,'2025-11-14 08:51:00'),(132,'OS-011','Red Hat Enterprise Linux','https://www.redhat.com/',349.96,'2025-11-14 08:51:00'),(133,'OS-012','Ubuntu Desktop','https://ubuntu.com/',0.00,'2025-11-14 08:51:00'),(134,'OS-013','Ubuntu Server','https://ubuntu.com/download/server',0.00,'2025-11-14 08:51:00'),(135,'OS-014','Debian','https://www.debian.org/',0.00,'2025-11-14 08:51:00'),(136,'OS-015','Debian Server','https://www.debian.org/',0.00,'2025-11-14 08:51:00'),(137,'POWER-001','be quiet! System Power 11 450W 80PLUS Bronze','https://www.ldlc.pro/fiche/PB00686560.html',54.13,'2025-11-14 08:51:00'),(138,'POWER-002','be quiet! Pure Power 12 550W 80PLUS Gold','https://www.ldlc.pro/fiche/PB00652452.html',72.46,'2025-11-14 08:51:00'),(139,'POWER-003','Corsair CX650 80PLUS Bronze (2023)','https://www.ldlc.pro/fiche/PB00580851.html',58.29,'2025-11-14 08:51:00'),(140,'POWER-004','be quiet! Pure Power 12 650W 80PLUS Gold','https://www.ldlc.pro/fiche/PB00652455.html',83.29,'2025-11-14 08:51:00'),(141,'POWER-005','Fox Spirit HG 650 80PLUS Gold','https://www.ldlc.pro/fiche/PB00655467.html',83.29,'2025-11-14 08:51:00'),(142,'POWER-006','Corsair RM650e (2025)','https://www.ldlc.pro/fiche/PB00672682.html',83.29,'2025-11-14 08:51:00'),(143,'POWER-007','be quiet! Pure Power 12 750W 80PLUS Gold','https://www.ldlc.pro/fiche/PB00652457.html',91.63,'2025-11-14 08:51:00'),(144,'POWER-008','Fox Spirit HG 750 80PLUS Gold','https://www.ldlc.pro/fiche/PB00660347.html',91.63,'2025-11-14 08:51:00'),(145,'POWER-009','Corsair RM750e (2025)','https://www.ldlc.pro/fiche/PB00663403.html',99.96,'2025-11-14 08:51:00'),(146,'POWER-010','be quiet! Pure Power 12 850W 80PLUS Gold','https://www.ldlc.pro/fiche/PB00652458.html',99.96,'2025-11-14 08:51:00'),(147,'POWER-011','Fox Spirit HG 850 80PLUS Gold','https://www.ldlc.pro/fiche/PB00678200.html',104.13,'2025-11-14 08:51:00'),(148,'POWER-012','be quiet! Pure Power 13 M 750W 80PLUS Gold','https://www.ldlc.pro/fiche/PB00696819.html',99.96,'2025-11-14 08:51:00'),(149,'POWER-013','Corsair RM850e (2025)','https://www.ldlc.pro/fiche/PB00663406.html',112.46,'2025-11-14 08:51:00'),(150,'POWER-014','be quiet! Straight Power 12 1200W Platinum','https://www.ldlc.pro/fiche/PB00557981.html',224.96,'2025-11-14 08:51:00'),(151,'SOUND-001','Nedis Carte Son 5.1 3D USB','https://www.ldlc.pro/fiche/PB00262751.html',8.29,'2025-11-14 08:51:00'),(152,'SOUND-002','DeLock Carte son externe USB-C','https://www.ldlc.pro/fiche/PB00677824.html',9.92,'2025-11-14 08:51:00'),(153,'SOUND-003','Dexlan Carte son USB-A','https://www.ldlc.pro/fiche/PB00260479.html',12.46,'2025-11-14 08:51:00'),(154,'SOUND-004','StarTech.com Carte son / Adaptateur USB vers audio stéréo','https://www.ldlc.pro/fiche/PB00241230.html',24.96,'2025-11-14 08:51:00'),(155,'SOUND-005','StarTech.com Carte son externe USB avec audio SPDIF numérique','https://www.ldlc.pro/fiche/PB00184041.html',41.62,'2025-11-14 08:51:00'),(156,'SOUND-006','Delock Carte son PCI Express 7.1','https://www.ldlc.pro/fiche/PB00685103.html',58.29,'2025-11-14 08:51:00'),(157,'SOUND-007','SteelSeries GameDAC Gen. 2 (PlayStation/Xbox)','https://www.ldlc.pro/fiche/PB00574289.html',124.96,'2025-11-14 08:51:00'),(158,'SPEAKERS-001','Advance SoundPhonic 2.0 4W','https://www.ldlc.pro/fiche/PB00241782.html',12.46,'2025-11-14 08:51:00'),(159,'SPEAKERS-002','Logitech S-150 Digital USB Speaker','https://www.ldlc.pro/fiche/PB00118575.html',16.63,'2025-11-14 08:51:00'),(160,'SPEAKERS-003','Mars Gaming MSCUBE (Noir)','https://www.ldlc.pro/fiche/PB00491049.html',12.46,'2025-11-14 08:51:00'),(161,'SPEAKERS-004','Advance SoundPhonic RGB 11W','https://www.ldlc.pro/fiche/PB00593376.html',20.79,'2025-11-14 08:51:00'),(162,'SPEAKERS-005','Edifier M1360 (Noir)','https://www.ldlc.pro/fiche/PB00228881.html',33.29,'2025-11-14 08:51:00'),(163,'SPEAKERS-006','Edifier R1280DB Noir','https://www.ldlc.pro/fiche/PB00240672.html',91.63,'2025-11-14 08:51:00'),(164,'SPEAKERS-007','Edifier R1700BT Noir','https://www.ldlc.pro/fiche/PB00248230.html',116.63,'2025-11-14 08:51:00'),(165,'SPEAKERS-008','Edifier QR30 Noir','https://www.ldlc.pro/fiche/PB00666808.html',99.96,'2025-11-14 08:51:00'),(166,'SPEAKERS-009','Edifier S2000MKIII','https://www.ldlc.pro/fiche/PB00576622.html',333.29,'2025-11-14 08:51:00'),(167,'SPEAKERS-010','Logitech Multimedia Speakers System Z533','https://www.ldlc.pro/fiche/PB00191223.html',116.63,'2025-11-14 08:51:00'),(168,'THERMAL-001','Arctic MX-4 2019 (4 grammes)','https://www.ldlc.pro/fiche/PB00263073.html',6.58,'2025-11-14 08:51:00'),(169,'THERMAL-002','Arctic MX-6 (4 grammes)','https://www.ldlc.pro/fiche/PB00532873.html',9.92,'2025-11-14 08:51:00'),(170,'THERMAL-003','Arctic MX-6 (8 grammes)','https://www.ldlc.pro/fiche/PB00532874.html',10.79,'2025-11-14 08:51:00'),(171,'THERMAL-004','Arctic Silver 5 (3.5 grammes)','https://www.ldlc.pro/fiche/PB00021822.html',12.46,'2025-11-14 08:51:00'),(172,'THERMAL-005','Noctua NT-H1 3.5g SW Edition','https://www.ldlc.pro/fiche/PB00503867.html',9.96,'2025-11-14 08:51:00'),(173,'THERMAL-006','Thermal Grizzly Hydronaut (3.9 grammes)','https://www.ldlc.pro/fiche/PB00226201.html',14.96,'2025-11-14 08:51:00'),(174,'THERMAL-007','Thermal Grizzly Conductonaut (1 gramme)','https://www.ldlc.pro/fiche/PB00226255.html',11.63,'2025-11-14 08:51:00'),(175,'THERMAL-008','Arctic MX-4 2019 (20 grammes)','https://www.ldlc.pro/fiche/PB00263075.html',12.46,'2025-11-14 08:51:00'),(176,'THERMAL-009','Polartherm X-10 (5G)','https://www.ldlc.pro/fiche/PB00655354.html',12.46,'2025-11-14 08:51:00'),(177,'THERMAL-010','be quiet! DC2 Pro (3 grammes)','https://www.ldlc.pro/fiche/PB00542237.html',14.96,'2025-11-14 08:51:00'),(178,'UPS-001','APC Back-UPS 500VA (BE500G2-FR)','https://www.ldlc.pro/fiche/PB00633134.html',116.63,'2025-11-14 08:51:00'),(179,'UPS-002','APC Back-UPS 650VA (BE650G2-FR)','https://www.ldlc.pro/fiche/PB00339370.html',112.46,'2025-11-14 08:51:00'),(180,'UPS-003','APC Back-UPS 750VA, 230V, AVR, prises FR','https://www.ldlc.pro/fiche/PB00406306.html',104.13,'2025-11-14 08:51:00'),(181,'UPS-004','APC Back-UPS 850VA (BE850G2-FR)','https://www.ldlc.pro/fiche/PB00339369.html',129.13,'2025-11-14 08:51:00'),(182,'UPS-005','APC Back-UPS 1200VA, 230V, AVR, prises FR','https://www.ldlc.pro/fiche/PB00406447.html',149.96,'2025-11-14 08:51:00'),(183,'UPS-006','Eaton Ellipse ECO 500 FR','https://www.ldlc.pro/fiche/PB00115597.html',79.13,'2025-11-14 08:51:00'),(184,'UPS-007','Eaton Ellipse ECO 650 FR','https://www.ldlc.pro/fiche/PB00115599.html',87.46,'2025-11-14 08:51:00'),(185,'UPS-008','Eaton Ellipse PRO 650 FR','https://www.ldlc.pro/fiche/PB00152766.html',141.63,'2025-11-14 08:51:00'),(186,'UPS-009','APC Back-UPS Pro 900G','https://www.ldlc.pro/fiche/PB00105725.html',249.96,'2025-11-14 08:51:00'),(187,'UPS-010','APC Back-UPS Pro 1200VA','https://www.ldlc.pro/fiche/PB00109187.html',358.29,'2025-11-14 08:51:00'),(188,'VIDEO-001','AMD Radeon Pro WX 3200','https://www.ldlc.pro/fiche/PB00482507.html',133.29,'2025-11-14 08:51:00'),(189,'VIDEO-002','PNY NVIDIA RTX A400 4 GB','https://www.ldlc.pro/fiche/PB00612206.html',187.46,'2025-11-14 08:51:00'),(190,'VIDEO-003','AMD Radeon Pro W6400','https://www.ldlc.pro/fiche/PB00482007.html',249.96,'2025-11-14 08:51:00'),(191,'VIDEO-004','AMD Radeon Pro W7500','https://www.ldlc.pro/fiche/PB00570791.html',458.29,'2025-11-14 08:51:00'),(192,'VIDEO-005','PNY Nvidia RTX 2000 Ada Generation','https://www.ldlc.pro/fiche/PB00609662.html',683.29,'2025-11-14 08:51:00'),(193,'VIDEO-006','PNY Nvidia RTX 4000 Ada Generation','https://www.ldlc.pro/fiche/PB00571200.html',0.00,'2025-11-14 08:51:00'),(194,'VIDEO-007','AMD Radeon Pro W7600','https://www.ldlc.pro/fiche/PB00570790.html',616.63,'2025-11-14 08:51:00'),(195,'VIDEO-008','AMD Radeon Pro W7800','https://www.ldlc.pro/fiche/PB00555973.html',0.00,'2025-11-14 08:51:00'),(196,'VIDEO-009','PNY Nvidia RTX 4500 Ada Generation','https://www.ldlc.pro/fiche/PB00571225.html',0.00,'2025-11-14 08:51:00'),(197,'VIDEO-010','PNY Nvidia RTX 6000 ADA','https://www.ldlc.pro/fiche/PB00535970.html',0.00,'2025-11-14 08:51:00'),(198,'WEBCAM-001','Logitech HD Webcam C270','https://www.ldlc.pro/fiche/PB00213751.html',27.46,'2025-11-14 08:51:00'),(199,'WEBCAM-002','Logitech HD Pro Webcam C920 Refresh','https://www.ldlc.pro/fiche/PB00195707.html',66.63,'2025-11-14 08:51:00'),(200,'WEBCAM-003','Logitech BRIO 100 (Blanc)','https://www.ldlc.pro/fiche/PB00571992.html',33.29,'2025-11-14 08:51:00'),(201,'WEBCAM-004','Logitech BRIO 300 (Graphite)','https://www.ldlc.pro/fiche/PB00538742.html',58.29,'2025-11-14 08:51:00'),(202,'WEBCAM-005','Logitech BRIO 4K B2B','https://www.ldlc.pro/fiche/PB00684421.html',149.96,'2025-11-14 08:51:00'),(203,'WEBCAM-006','Logitech MX BRIO Graphite','https://www.ldlc.pro/fiche/PB00595075.html',191.63,'2025-11-14 08:51:00'),(204,'WEBCAM-007','Logitech BRIO 500 Blanc','https://www.ldlc.pro/fiche/PB00516989.html',99.96,'2025-11-14 08:51:00'),(205,'WEBCAM-008','Elgato Facecam MK.2','https://www.ldlc.pro/fiche/PB00607592.html',133.29,'2025-11-14 08:51:00'),(206,'WIRED-001','INOVU Adaptateur USB 3.0 vers Gigabit Ethernet','https://www.ldlc.pro/fiche/PB00544276.html',16.63,'2025-11-14 08:51:00'),(207,'WIRED-002','DeLock Carte réseau PCI Express avec Ethernet Gigabit','https://www.ldlc.pro/fiche/PB00678113.html',49.96,'2025-11-14 08:51:00'),(208,'WIRED-003','Intel i210-T1','https://www.ldlc.pro/fiche/PB00585520.html',54.13,'2025-11-14 08:51:00'),(209,'WIRED-004','DeLock Carte réseau PCI Express x4 avec 4x Ethernet Gigabit PoE+','https://www.ldlc.pro/fiche/PB00706209.html',208.25,'2025-11-14 08:51:00'),(210,'WIRED-005','Intel Ethernet I350 T2V2BLK (bulk)','https://www.ldlc.pro/fiche/PB00245865.html',190.79,'2025-11-14 08:51:00'),(211,'WIRED-006','DeLock Carte réseau PCI Express avec SFP+ 10 Gigabits','https://www.ldlc.pro/fiche/PB00678111.html',91.63,'2025-11-14 08:51:00'),(212,'WIRED-007','Lenovo ThinkSystem Broadcom 5720 1GbE RJ45 2-Port PCIe Ethernet Adapter','https://www.ldlc.pro/fiche/PB00578863.html',141.63,'2025-11-14 08:51:00'),(213,'WIRELESS-001','D-Link DWA-X582','https://www.ldlc.pro/fiche/PB00579120.html',41.63,'2025-11-14 08:51:00'),(214,'WIRELESS-002','Gigabyte GC-WB1733D-I','https://www.ldlc.pro/fiche/PB00256035.html',33.29,'2025-11-14 08:51:00'),(215,'WIRELESS-003','Gigabyte GC-WIFI7 (Rév. 1.0)','https://www.ldlc.pro/fiche/PB00587217.html',55.79,'2025-11-14 08:51:00'),(216,'WIRELESS-004','MSI AX1800 WiFi USB Adapter','https://www.ldlc.pro/fiche/PB00549780.html',45.79,'2025-11-14 08:51:00'),(217,'WIRELESS-005','INOVU MBTAX900 - Clé USB Wi-Fi 6 / BT','https://www.ldlc.pro/fiche/PB00675651.html',14.13,'2025-11-14 08:51:00');
/*!40000 ALTER TABLE `composants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_composants`
--

DROP TABLE IF EXISTS `config_composants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_composants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL,
  `composant_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `config_id` (`config_id`),
  KEY `composant_id` (`composant_id`),
  CONSTRAINT `config_composants_ibfk_1` FOREIGN KEY (`config_id`) REFERENCES `configurations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `config_composants_ibfk_2` FOREIGN KEY (`composant_id`) REFERENCES `composants` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_composants`
--

LOCK TABLES `config_composants` WRITE;
/*!40000 ALTER TABLE `config_composants` DISABLE KEYS */;
INSERT INTO `config_composants` VALUES (1,1,26,1),(2,1,68,1),(3,1,89,1),(4,1,138,1),(5,1,13,1),(6,1,188,1),(7,1,75,2),(8,1,60,1),(9,1,109,1),(10,2,30,1),(11,2,69,1),(12,2,94,1),(13,2,143,1),(14,2,12,1),(15,2,189,1),(16,2,76,2),(17,2,60,1),(18,2,109,1),(19,3,27,1),(20,3,69,1),(21,3,92,1),(22,3,140,1),(23,3,13,1),(24,3,189,1),(25,3,82,1),(26,3,61,1),(27,3,109,1),(28,4,29,1),(29,4,68,1),(30,4,90,1),(31,4,137,1),(32,4,14,1),(33,4,75,1),(34,4,61,1),(35,4,103,1),(36,5,29,1),(37,5,68,1),(38,5,89,1),(39,5,137,1),(40,5,14,1),(41,5,77,1),(42,5,62,1),(43,5,102,1),(44,5,45,1),(45,6,32,1),(46,6,69,1),(47,6,95,1),(48,6,145,1),(49,6,18,1),(50,6,189,1),(51,6,84,1),(52,6,60,1),(53,6,109,1),(54,7,30,1),(55,7,69,1),(56,7,98,1),(57,7,149,1),(58,7,12,1),(59,7,188,1),(60,7,76,2),(61,7,60,1),(62,7,108,1);
/*!40000 ALTER TABLE `config_composants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_config` varchar(255) NOT NULL,
  `service` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `prix_total_ht` decimal(10,2) DEFAULT NULL,
  `prix_total_ttc` decimal(10,2) DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_service` (`service`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (1,'PC Développement Standard','Développement logiciel','Configuration optimale pour le développement logiciel : compilation rapide, multitâche fluide',961.25,1153.50,'2025-11-14 08:51:00'),(2,'PC Développement Performance','Développement logiciel','Configuration haute performance pour projets lourds et virtualisation',1337.09,1604.51,'2025-11-14 08:51:00'),(3,'PC Design Standard','Design UX/UI','Configuration pour design graphique et UX/UI avec écran couleur précis',1128.80,1354.56,'2025-11-14 08:51:00'),(4,'PC Marketing Standard','Marketing et vente','Configuration bureautique optimisée pour marketing et présentation client',463.84,556.61,'2025-11-14 08:51:00'),(5,'PC Support Client','Support client','Configuration légère pour support technique et helpdesk',568.79,682.55,'2025-11-14 08:51:00'),(6,'PC Direction Premium','Direction','Configuration haut de gamme pour la direction avec écran premium',1618.81,1942.57,'2025-11-14 08:51:00'),(7,'PC Infrastructure IT','Gestion des infrastructures systèmes et réseau','Configuration pour administration système et gestion réseau',1495.41,1794.49,'2025-11-14 08:51:00');
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `sujet` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `date_envoi` timestamp NOT NULL DEFAULT current_timestamp(),
  `statut` enum('nouveau','lu','traite') DEFAULT 'nouveau',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'test','tet@test.TEST','Demande de devis','test','2025-11-18 16:15:09','nouveau');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devis`
--

DROP TABLE IF EXISTS `devis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_devis` varchar(50) NOT NULL,
  `config_id` int(11) DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `montant_ht` decimal(10,2) DEFAULT NULL,
  `montant_ttc` decimal(10,2) DEFAULT NULL,
  `statut` enum('brouillon','envoye','accepte','refuse') DEFAULT 'brouillon',
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_devis` (`numero_devis`),
  KEY `config_id` (`config_id`),
  CONSTRAINT `devis_ibfk_1` FOREIGN KEY (`config_id`) REFERENCES `configurations` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devis`
--

LOCK TABLES `devis` WRITE;
/*!40000 ALTER TABLE `devis` DISABLE KEYS */;
/*!40000 ALTER TABLE `devis` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-01 14:57:37
