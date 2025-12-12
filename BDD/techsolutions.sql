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
  `auteur` varchar(100) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT 1,
  `date_publication` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modification` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actualites`
--

LOCK TABLES `actualites` WRITE;
/*!40000 ALTER TABLE `actualites` DISABLE KEYS */;
INSERT INTO `actualites` VALUES (1,'Bienvenue sur TechSolutions','TechSolutions est fière de vous présenter son nouveau site internet. Découvrez nos services et notre expertise.','Direction','images/actualites/1765533033_09284a639e073d77.png',1,'2025-12-12 09:00:23','2025-12-12 09:50:33'),(2,'Modernisation de notre infrastructure','Nous investissons dans 50 nouveaux postes de travail pour nos équipes, avec une attention particulière à l\'accessibilité. Nos configurations incluent des équipements adaptés pour le handicap visuel (clavier gros caractères, logiciel NVDA).','Infrastructure IT',NULL,1,'2025-12-12 09:00:23','2025-12-12 09:00:23'),(3,'Nouveau département Design','Notre équipe Design s\'agrandit avec 5 nouveaux postes équipés de stations graphiques professionnelles : GPU Pro, tablettes Wacom, écrans 4K et suite Adobe Creative Cloud complète.','Design UX/UI',NULL,1,'2025-12-12 09:00:23','2025-12-12 09:00:23');
/*!40000 ALTER TABLE `actualites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','$2a$12$fWeoEmq1jUBeMdUIC1uLd.Yapleg16sEpNRlwaolz/uMxM7gclP/6','2025-12-12 09:00:21');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `entreprise` varchar(150) DEFAULT NULL,
  `adresse` text DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `rgpd_consent` tinyint(1) DEFAULT 0,
  `rgpd_consent_date` timestamp NULL DEFAULT NULL,
  `date_inscription` timestamp NOT NULL DEFAULT current_timestamp(),
  `derniere_connexion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'test','test','test@test.test','test','test','test','','test','$2y$10$FcisBifHqBnb7AlBsoK5uOxeTQWBCxJrHvljLSRfgutagYRlv2Q9u',1,NULL,'2025-12-12 09:45:39','2025-12-12 09:45:44');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
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
  `libelle` varchar(255) NOT NULL,
  `categorie` varchar(100) NOT NULL,
  `url` text DEFAULT NULL,
  `prix_ht` decimal(10,2) NOT NULL,
  `prix_ttc` decimal(10,2) NOT NULL,
  `date_ajout` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composants`
--

LOCK TABLES `composants` WRITE;
/*!40000 ALTER TABLE `composants` DISABLE KEYS */;
INSERT INTO `composants` VALUES (1,'CASEAC-001','Fox Spirit LIGHTFLOW ARGB HUB','Boîtier Accessoire','https://www.ldlc.pro/fiche/PB00654453.html',8.29,9.95,'2025-12-12 09:00:21'),(2,'CASEFAN-001','Fox Spirit FA120 ARGB (Noir)','Ventilateur Boîtier','https://www.ldlc.pro/fiche/PB00696127.html',9.96,11.95,'2025-12-12 09:00:21'),(3,'CASEFAN-002','Arctic P12 PWM PST Noir','Ventilateur Boîtier','https://www.ldlc.pro/fiche/PB00505033.html',9.92,11.90,'2025-12-12 09:00:21'),(4,'CASEFAN-003','Aerocool Phantom M-3 12 PWM ARGB (Noir)','Ventilateur Boîtier','https://www.ldlc.pro/fiche/PB00659018.html',8.25,9.90,'2025-12-12 09:00:21'),(5,'CASEFAN-004','Noctua NF-P12 Redux-1300 PWM','Ventilateur Boîtier','https://www.ldlc.pro/fiche/PB00253244.html',16.63,19.96,'2025-12-12 09:00:21'),(6,'CASEFAN-005','be quiet! Silent Wings 4 120mm PWM','Ventilateur Boîtier','https://www.ldlc.pro/fiche/PB00504486.html',23.29,27.95,'2025-12-12 09:00:21'),(7,'CASEFAN-006','Arctic P12 Pro A-RGB (Noir)','Ventilateur Boîtier','https://www.ldlc.pro/fiche/PB00692228.html',11.46,13.75,'2025-12-12 09:00:21'),(8,'CASEFAN-007','Aerocool APNX FP1-140 (Noir)','Ventilateur Boîtier','https://www.ldlc.pro/fiche/PB00587254.html',10.79,12.95,'2025-12-12 09:00:21'),(9,'CASEFAN-008','Arctic P14 Pro (Noir)','Ventilateur Boîtier','https://www.ldlc.pro/fiche/PB00699278.html',8.25,9.90,'2025-12-12 09:00:21'),(10,'CASEFAN-009','Antec Connect 120 ARGB Noir (x3)','Ventilateur Boîtier','https://www.ldlc.pro/fiche/PB00657735.html',27.46,32.95,'2025-12-12 09:00:21'),(11,'CASEFAN-010','Arctic P12 SLIM PWM PST','Ventilateur Boîtier','https://www.ldlc.pro/fiche/PB00408325.html',7.46,8.95,'2025-12-12 09:00:21'),(12,'CASE-001','Fox Spirit AG1 (Noir) - Moyen Tour','Boîtier','https://www.ldlc.pro/fiche/PB00663701.html',83.29,99.95,'2025-12-12 09:00:21'),(13,'CASE-002','be quiet! Pure Base 500 (Noir) - Moyen Tour','Boîtier','https://www.ldlc.pro/fiche/PB00581486.html',91.63,109.96,'2025-12-12 09:00:21'),(14,'CASE-003','Aerocool CS-111 V2 Noir - Mini Tour','Boîtier','https://www.ldlc.pro/fiche/PB00660826.html',37.46,44.95,'2025-12-12 09:00:21'),(15,'CASE-004','Cooler Master Silencio S600 - Moyen Tour','Boîtier','https://www.ldlc.pro/fiche/PB00275559.html',91.62,109.94,'2025-12-12 09:00:21'),(16,'CASE-005','be quiet! Pure Base 600 (Noir) - Moyen Tour','Boîtier','https://www.ldlc.pro/fiche/PB00222411.html',87.46,104.95,'2025-12-12 09:00:21'),(17,'CASE-006','Aerocool D301A V1 Noir - Mini Tour','Boîtier','https://www.ldlc.pro/fiche/PB00659164.html',58.29,69.95,'2025-12-12 09:00:21'),(18,'CASE-007','Fox Spirit EG1 (Noir) - Moyen Tour','Boîtier','https://www.ldlc.pro/fiche/PB00703259.html',108.29,129.95,'2025-12-12 09:00:21'),(19,'CASE-008','Aerocool CS-106 (Noir) - Mini Tour','Boîtier','https://www.ldlc.pro/fiche/PB00428914.html',33.29,39.95,'2025-12-12 09:00:21'),(20,'CPUCO-001','be quiet! Pure Rock Pro 3 (Noir)','Refroidissement CPU','https://www.ldlc.pro/fiche/PB00672815.html',41.63,49.96,'2025-12-12 09:00:21'),(21,'CPUCO-002','Arctic Freezer 36 (Noir)','Refroidissement CPU','https://www.ldlc.pro/fiche/PB00606845.html',37.46,44.95,'2025-12-12 09:00:21'),(22,'CPUCO-003','Noctua NH-U12A Chromax Black','Refroidissement CPU','https://www.ldlc.pro/fiche/PB00465678.html',133.29,159.95,'2025-12-12 09:00:21'),(23,'CPUCO-004','be quiet! Dark Rock 5','Refroidissement CPU','https://www.ldlc.pro/fiche/PB00623910.html',66.63,79.96,'2025-12-12 09:00:21'),(24,'CPUCO-005','Arctic Liquid Freezer III 240 A-RGB (Noir)','Refroidissement CPU','https://www.ldlc.pro/fiche/PB00623910.html',91.63,109.96,'2025-12-12 09:00:21'),(25,'CPUCO-006','Cooler Master Hyper 212 Black','Refroidissement CPU','https://www.ldlc.pro/fiche/PB00579435.html',20.79,24.95,'2025-12-12 09:00:21'),(26,'CPU-001','AMD Ryzen 5 7600 (3.8 GHz / 5.1 GHz)','Processeur','https://www.ldlc.pro/fiche/PB00536100.html',183.29,219.95,'2025-12-12 09:00:21'),(27,'CPU-002','AMD Ryzen 7 7700 (3.8 GHz / 5.3 GHz)','Processeur','https://www.ldlc.pro/fiche/PB00703383.html',224.96,269.95,'2025-12-12 09:00:21'),(28,'CPU-003','AMD Ryzen 7 5800X (3.8 GHz / 4.7 GHz)','Processeur','https://www.ldlc.pro/fiche/PB00387534.html',166.63,199.96,'2025-12-12 09:00:21'),(29,'CPU-004','AMD Ryzen 5 5600 (3.5 GHz / 4.4 GHz)','Processeur','https://www.ldlc.pro/fiche/PB00699110.html',70.79,84.95,'2025-12-12 09:00:21'),(30,'CPU-005','AMD Ryzen 9 7900X (4.7 GHz / 5.6 GHz)','Processeur','https://www.ldlc.pro/fiche/PB00516611.html',358.29,429.95,'2025-12-12 09:00:21'),(31,'CPU-006','Intel Core i5-13600KF (3.5 GHz / 5.1 GHz)','Processeur','https://www.ldlc.pro/fiche/PB00519257.html',299.95,359.94,'2025-12-12 09:00:21'),(32,'CPU-007','Intel Core i7-13700K (3.4 GHz / 5.4 GHz)','Processeur','https://www.ldlc.pro/fiche/PB00519277.html',416.63,499.96,'2025-12-12 09:00:21'),(33,'EXTERNAL-001','Samsung Portable SSD T7 1 To Bleu','Disque Dur Externe','https://www.ldlc.pro/fiche/PB00334797.html',91.63,109.96,'2025-12-12 09:00:21'),(34,'EXTERNAL-002','Samsung Portable SSD T7 2 To Bleu','Disque Dur Externe','https://www.ldlc.pro/fiche/PB00334798.html',137.46,164.95,'2025-12-12 09:00:21'),(35,'EXTERNAL-003','Samsung Portable SSD T7 4 To Gris','Disque Dur Externe','https://www.ldlc.pro/fiche/PB00622258.html',249.96,299.95,'2025-12-12 09:00:21'),(36,'EXTERNAL-004','Crucial X10 Portable 2 To','Disque Dur Externe','https://www.ldlc.pro/fiche/PB00683347.html',183.29,219.95,'2025-12-12 09:00:22'),(37,'EXTERNAL-005','Crucial X10 Pro Portable 4 To','Disque Dur Externe','https://www.ldlc.pro/fiche/PB00563421.html',333.29,399.95,'2025-12-12 09:00:22'),(38,'EXTERNAL-006','LaCie Rugged Mini 5 To (USB-C)','Disque Dur Externe','https://www.ldlc.pro/fiche/PB00277674.html',183.29,219.95,'2025-12-12 09:00:22'),(39,'EXTERNAL-007','WD Elements Portable 5 To Noir (USB 3.0)','Disque Dur Externe','https://www.ldlc.pro/fiche/PB00585178.html',133.29,159.95,'2025-12-12 09:00:22'),(40,'EXTERNAL-008','Kingston XS2000 2 To','Disque Dur Externe','https://www.ldlc.pro/fiche/PB00564415.html',166.63,199.96,'2025-12-12 09:00:22'),(41,'EXTERNAL-009','LaCie 1big Dock Thunderbolt 3 - 8 To','Disque Dur Externe','https://www.ldlc.pro/fiche/PB00353634.html',441.62,529.94,'2025-12-12 09:00:22'),(42,'EXTERNAL-010','ioSafe Solo G3 4 To (Waterproof/Fireproof)','Disque Dur Externe','https://www.ldlc.pro/fiche/PB00582205.html',499.96,599.95,'2025-12-12 09:00:22'),(43,'FAN-001','Noctua NA-FC1 (Contrôleur PWM 3 canaux)','Contrôleur Ventilateur','https://www.ldlc.com/fiche/PB00253235.html',29.95,35.94,'2025-12-12 09:00:22'),(44,'FAN-002','NZXT RGB & Fan Controller','Contrôleur Ventilateur','https://www.ldlc.com/fiche/PB00305624.html',59.95,71.94,'2025-12-12 09:00:22'),(45,'HEADPHONES-001','Audio-Technica ATH-M50x (Noir)','Casque Audio','https://www.ldlc.pro/fiche/PB00466740.html',133.29,159.95,'2025-12-12 09:00:22'),(46,'HEADPHONES-002','Sony WH-1000XM5 (Noir)','Casque Audio','https://www.ldlc.pro/fiche/PB00535836.html',274.96,329.95,'2025-12-12 09:00:22'),(47,'HEADPHONES-003','AKG N9 Hybrid (Noir)','Casque Audio','https://www.ldlc.pro/fiche/PB00665063.html',240.83,289.00,'2025-12-12 09:00:22'),(48,'HEADPHONES-004','B&W Px7 S3 (Noir Anthracite)','Casque Audio','https://www.ldlc.pro/fiche/PB00702618.html',358.29,429.95,'2025-12-12 09:00:22'),(49,'HEADPHONES-005','Audio-Technica ATH-M30x','Casque Audio','https://www.ldlc.pro/fiche/PB00466691.html',74.96,89.95,'2025-12-12 09:00:22'),(50,'HEADPHONES-006','Belkin Micro Casque USB-C/Bluetooth','Casque Audio','https://www.ldlc.pro/fiche/PB00584780.html',49.96,59.95,'2025-12-12 09:00:22'),(51,'HEADPHONES-007','Apple AirPods Pro 2 (Boîtier MagSafe USB-C)','Casque Audio','https://www.ldlc.pro/fiche/PB00571619.html',190.83,229.00,'2025-12-12 09:00:22'),(52,'INTERNAL-001','Seagate BarraCuda 1 To (ST1000DM014)','Disque Dur Interne','https://www.ldlc.pro/fiche/PB00559048.html',56.63,67.96,'2025-12-12 09:00:22'),(53,'INTERNAL-002','Seagate BarraCuda 4 To (ST4000DM004)','Disque Dur Interne','https://www.ldlc.pro/fiche/PB00234144.html',108.29,129.95,'2025-12-12 09:00:22'),(54,'INTERNAL-003','Seagate IronWolf 4 To (ST4000VN006)','Disque Dur Interne','https://www.ldlc.pro/fiche/PB00494230.html',116.63,139.96,'2025-12-12 09:00:22'),(55,'INTERNAL-004','Seagate IronWolf 8 To (ST8000VN004)','Disque Dur Interne','https://www.ldlc.pro/fiche/PB00281525.html',191.63,229.96,'2025-12-12 09:00:22'),(56,'INTERNAL-005','Seagate IronWolf Pro 10 To (ST10000NT001)','Disque Dur Interne','https://www.ldlc.pro/fiche/PB00519239.html',291.63,349.96,'2025-12-12 09:00:22'),(57,'INTERNAL-006','Western Digital WD Red Plus 6 To','Disque Dur Interne','https://www.ldlc.pro/fiche/PB00542621.html',183.29,219.95,'2025-12-12 09:00:22'),(58,'INTERNAL-007','Synology HAT5300-4T 4 To','Disque Dur Interne','https://www.ldlc.pro/fiche/PB00498508.html',224.96,269.95,'2025-12-12 09:00:22'),(59,'INTERNAL-008','Seagate Exos X20 20 To (ST20000NM002D)','Disque Dur Interne','https://www.ldlc.pro/fiche/PB00584253.html',449.96,539.95,'2025-12-12 09:00:22'),(60,'KEYBOARD-001','Logitech MX Keys S (Graphite)','Clavier','https://www.ldlc.pro/fiche/PB00556046.html',99.96,119.95,'2025-12-12 09:00:22'),(61,'KEYBOARD-002','Logitech Wave Keys (Noir)','Clavier','https://www.ldlc.pro/fiche/PB00576651.html',58.29,69.95,'2025-12-12 09:00:22'),(62,'KEYBOARD-003','Cherry KC 6000 Slim (Noir)','Clavier','https://www.ldlc.pro/fiche/PB00251920.html',45.79,54.95,'2025-12-12 09:00:22'),(63,'KEYBOARD-004','INOVU LK120 (AZERTY, Français)','Clavier','https://www.ldlc.pro/fiche/PB00594739.html',14.58,17.50,'2025-12-12 09:00:22'),(64,'KEYBOARD-005','Apple Magic Keyboard (AZERTY, Français)','Clavier','https://www.ldlc.pro/fiche/PB00651741.html',99.17,119.00,'2025-12-12 09:00:22'),(65,'KEYBOARD-006','Corsair Gaming K70 Core','Clavier','https://www.ldlc.pro/fiche/PB00576649.html',83.29,99.95,'2025-12-12 09:00:22'),(66,'KEYBOARD-007','Bluestork Media Office','Clavier','https://www.ldlc.pro/fiche/PB00649506.html',8.25,9.90,'2025-12-12 09:00:22'),(67,'KEYBOARD-008','INOVU SWL10 Noir (AZERTY, Français)','Clavier','https://www.ldlc.pro/fiche/PB00388018.html',20.42,24.50,'2025-12-12 09:00:22'),(68,'MEMORY-001','Textorm 16 Go (2x 8 Go) DDR4 3200 MHz CL16','Mémoire RAM','https://www.ldlc.pro/fiche/PB00392932.html',80.79,96.95,'2025-12-12 09:00:22'),(69,'MEMORY-002','Textorm 32 Go (2x 16 Go) DDR4 3200 MHz CL16','Mémoire RAM','https://www.ldlc.pro/fiche/PB00392938.html',158.29,189.95,'2025-12-12 09:00:22'),(70,'MEMORY-003','Textorm 32 Go (2x 16 Go) DDR5 6000 MHz CL36','Mémoire RAM','https://www.ldlc.pro/fiche/PB00656910.html',149.96,179.95,'2025-12-12 09:00:22'),(71,'MEMORY-008','Samsung SSD 990 EVO Plus M.2 PCIe NVMe 1 To ','Mémoire RAM','https://www.ldlc.pro/fiche/PB00653106.html',95.79,114.95,'2025-12-12 09:00:22'),(72,'MONITOR-001','AOC 23.8\" LED - 24B3HA2 (Full HD, IPS, 75 Hz)','Écran','https://www.ldlc.pro/fiche/PB00597773.html',83.29,99.95,'2025-12-12 09:00:22'),(73,'MONITOR-002','LG 23.8\" LED - 24MS550-B (Full HD, IPS, 75 Hz)','Écran','https://www.ldlc.pro/fiche/PB00622280.html',83.29,99.95,'2025-12-12 09:00:22'),(74,'MONITOR-003','BenQ 23.8\" LED - GW2491 (Full HD, IPS, 75 Hz)','Écran','https://www.ldlc.pro/fiche/PB00663389.html',74.96,89.95,'2025-12-12 09:00:22'),(75,'MONITOR-004','MSI 23.8\" LED - PRO MP242AP (Full HD, IPS, 75 Hz)','Écran','https://www.ldlc.pro/fiche/PB00567502.html',91.63,109.96,'2025-12-12 09:00:22'),(76,'MONITOR-005','Acer 21.5\" LED - Vero B227QE3bmiprxv (Full HD, IPS, 100 Hz)','Écran','https://www.ldlc.pro/fiche/PB00631760.html',108.29,129.95,'2025-12-12 09:00:22'),(77,'MONITOR-006','INOVU 21.5\" LED - MB22 V2 (Full HD, VA, 100 Hz)','Écran','https://www.ldlc.pro/fiche/PB00613781.html',63.75,76.50,'2025-12-12 09:00:22'),(78,'MONITOR-007','iiyama 23.8\" LED - ProLite XUB2493HS-B6 (Full HD, IPS, 75 Hz)','Écran','https://www.ldlc.pro/fiche/PB00597291.html',116.63,139.96,'2025-12-12 09:00:22'),(79,'MONITOR-008','Acer 27\" LED - Nitro VG271UM3bmiipx (2.5K, 180 Hz, IPS)','Écran','https://www.ldlc.pro/fiche/PB00561639.html',166.63,199.96,'2025-12-12 09:00:22'),(80,'MONITOR-009','Acer 27\" LED - Vero B277UGbemiqpruzx (2.5K, 120 Hz, IPS, USB-C)','Écran','https://www.ldlc.pro/fiche/PB00698956.html',208.29,249.95,'2025-12-12 09:00:22'),(81,'MONITOR-010','Fox Spirit 28\" LED - PGK280 (4K, 144 Hz, IPS, USB-C)','Écran','https://www.ldlc.pro/fiche/PB00510188.html',291.63,349.96,'2025-12-12 09:00:22'),(82,'MONITOR-011','Acer 34\" LED - Predator X34Vbmiiphuzx (UltraWide OLED, 175 Hz)','Écran','https://www.ldlc.pro/fiche/PB00595101.html',833.29,999.95,'2025-12-12 09:00:22'),(83,'MONITOR-012','INOVU 27\" LED - MBQ27 (2.5K, 75 Hz, IPS, USB-C)','Écran','https://www.ldlc.pro/fiche/PB00559189.html',141.63,169.96,'2025-12-12 09:00:22'),(84,'MONITOR-013','Acer 23.8\" LED - Nitro VG240YEbmiix (Full HD, 100 Hz, IPS)','Écran','https://www.ldlc.pro/fiche/PB00561671.html',74.96,89.95,'2025-12-12 09:00:22'),(85,'MONITOR-014','Fox Spirit 49\" LED - PGM491 (UltraWide 5K, 144 Hz, VA)','Écran','https://www.ldlc.pro/fiche/PB00657719.html',624.96,749.95,'2025-12-12 09:00:22'),(86,'MOTHERBOARD-001','MSI PRO H610M-E DDR4','Carte Mère','https://www.ldlc.pro/fiche/PB00545871.html',58.29,69.95,'2025-12-12 09:00:22'),(87,'MOTHERBOARD-002','Gigabyte H610M S2H V3 DDR4','Carte Mère','https://www.ldlc.pro/fiche/PB00607356.html',62.46,74.95,'2025-12-12 09:00:22'),(88,'MOTHERBOARD-003','ASRock B450M Pro4 R2.0','Carte Mère','https://www.ldlc.pro/fiche/PB00462746.html',69.13,82.96,'2025-12-12 09:00:22'),(89,'MOTHERBOARD-004','ASRock A620M-HDV/M.2','Carte Mère','https://www.ldlc.pro/fiche/PB00552929.html',83.29,99.95,'2025-12-12 09:00:22'),(90,'MOTHERBOARD-005','MSI PRO B760M-P DDR4','Carte Mère','https://www.ldlc.pro/fiche/PB00537254.html',83.29,99.95,'2025-12-12 09:00:22'),(91,'MOTHERBOARD-006','ASRock B650M PG Lightning','Carte Mère','https://www.ldlc.pro/fiche/PB00592895.html',116.63,139.96,'2025-12-12 09:00:22'),(92,'MOTHERBOARD-007','ASUS TUF GAMING B650-PLUS WIFI','Carte Mère','https://www.ldlc.pro/fiche/PB00520904.html',181.63,217.96,'2025-12-12 09:00:22'),(93,'MOTHERBOARD-008','ASRock B860 PRO RS','Carte Mère','https://www.ldlc.pro/fiche/PB00671756.html',149.96,179.95,'2025-12-12 09:00:22'),(94,'MOTHERBOARD-009','Gigabyte B850 AORUS ELITE WIFI7 ICE','Carte Mère','https://www.ldlc.pro/fiche/PB00660675.html',199.96,239.95,'2025-12-12 09:00:22'),(95,'MOTHERBOARD-010','ASRock X870 Nova WiFi','Carte Mère','https://www.ldlc.pro/fiche/PB00703412.html',299.96,359.95,'2025-12-12 09:00:22'),(96,'MOUSE-001','Logitech B110 Silent (Noir)','Souris','https://www.ldlc.pro/fiche/PB00256298.html',9.96,11.95,'2025-12-12 09:00:22'),(97,'MOUSE-002','INOVU FM 1600 (Noir)','Souris','https://www.ldlc.pro/fiche/PB00654454.html',6.63,7.96,'2025-12-12 09:00:22'),(98,'MOUSE-003','Advance Drift 2 Noir','Souris','https://www.ldlc.pro/fiche/PB00316126.html',8.29,9.95,'2025-12-12 09:00:22'),(99,'MOUSE-004','Logitech M171 Wireless Mouse (Noir)','Souris','https://www.ldlc.pro/fiche/PB00214538.html',13.29,15.95,'2025-12-12 09:00:22'),(100,'MOUSE-005','Logitech M220 Silent (Noir)','Souris','https://www.ldlc.pro/fiche/PB00214497.html',16.63,19.96,'2025-12-12 09:00:22'),(101,'MOUSE-006','Logitech M240 Silent (Graphite)','Souris','https://www.ldlc.pro/fiche/PB00554020.html',23.29,27.95,'2025-12-12 09:00:22'),(102,'MOUSE-007','ASUS TUF Gaming M3 Gen II','Souris','https://www.ldlc.pro/fiche/PB00569700.html',33.29,39.95,'2025-12-12 09:00:22'),(103,'MOUSE-008','Logitech M650 (Graphite)','Souris','https://www.ldlc.pro/fiche/PB00480702.html',33.29,39.95,'2025-12-12 09:00:22'),(104,'MOUSE-009','ASUS ROG Gladius II Core','Souris','https://www.ldlc.pro/fiche/PB00274106.html',37.46,44.95,'2025-12-12 09:00:22'),(105,'MOUSE-010','Logitech MX Vertical','Souris','https://www.ldlc.pro/fiche/PB00256308.html',83.29,99.95,'2025-12-12 09:00:22'),(106,'MOUSE-011','Logitech MX Master 3S (Graphite)','Souris','https://www.ldlc.pro/fiche/PB00500370.html',74.96,89.95,'2025-12-12 09:00:22'),(107,'MOUSE-012','ASUS ROG Keris Wireless AimPoint (Blanc)','Souris','https://www.ldlc.pro/fiche/PB00536223.html',74.96,89.95,'2025-12-12 09:00:22'),(108,'MOUSE-013','ASUS ROG Harpe Ace Noir (Aim Lab Edition)','Souris','https://www.ldlc.pro/fiche/PB00538830.html',91.63,109.96,'2025-12-12 09:00:22'),(109,'MOUSE-014','ASUS ROG Harpe II Ace Noir','Souris','https://www.ldlc.pro/fiche/PB00697402.html',149.96,179.95,'2025-12-12 09:00:22'),(110,'OPTICAL-001','Verbatim Graveur de CD/DVD externe USB 2.0','Lecteur Optique','https://www.ldlc.pro/fiche/PB00556044.html',33.29,39.95,'2025-12-12 09:00:22'),(111,'OPTICAL-002','Verbatim Graveur de CD/DVD externe USB-C','Lecteur Optique','https://www.ldlc.pro/fiche/PB00556040.html',37.46,44.95,'2025-12-12 09:00:22'),(112,'OPTICAL-003','ASUS SDRW-08D2S-U Lite Noir','Lecteur Optique','https://www.ldlc.pro/fiche/PB00123265.html',39.13,46.96,'2025-12-12 09:00:22'),(113,'OPTICAL-004','ASUS SDRW-08U7M-U Argent','Lecteur Optique','https://www.ldlc.pro/fiche/PB00202674.html',45.79,54.95,'2025-12-12 09:00:22'),(114,'OPTICAL-005','ASUS SDRW-08U7M-U Noir','Lecteur Optique','https://www.ldlc.pro/fiche/PB00202712.html',49.12,58.94,'2025-12-12 09:00:22'),(115,'OPTICAL-006','ASUS ZenDrive U9M (USB-C/USB-A) Noir','Lecteur Optique','https://www.ldlc.pro/fiche/PB00237284.html',49.96,59.95,'2025-12-12 09:00:22'),(116,'OPTICAL-007','ASUS ZenDrive V1M (USB-C)','Lecteur Optique','https://www.ldlc.pro/fiche/PB00481334.html',58.29,69.95,'2025-12-12 09:00:22'),(117,'OPTICAL-008','Verbatim Graveur de Blu-ray externe USB-A','Lecteur Optique','https://www.ldlc.pro/fiche/PB00556082.html',116.63,139.96,'2025-12-12 09:00:22'),(118,'OPTICAL-009','ASUS BW-16D1HT (Interne SATA)','Lecteur Optique','https://www.ldlc.pro/fiche/PB00152185.html',99.96,119.95,'2025-12-12 09:00:22'),(119,'OS-001','Microsoft Windows 11 Pro','Système d\'Exploitation','',166.63,199.96,'2025-12-12 09:00:22'),(120,'OS-002','Microsoft Windows 11 Famille','Système d\'Exploitation','',133.29,159.95,'2025-12-12 09:00:22'),(121,'OS-003','Microsoft Windows Server 2025','Système d\'Exploitation','',749.96,899.95,'2025-12-12 09:00:22'),(122,'OS-011','Red Hat Enterprise Linux','Système d\'Exploitation','https://www.redhat.com/',349.96,419.95,'2025-12-12 09:00:22'),(123,'POWER-001','be quiet! System Power 11 450W 80PLUS Bronze','Alimentation','https://www.ldlc.pro/fiche/PB00686560.html',54.13,64.96,'2025-12-12 09:00:22'),(124,'POWER-002','be quiet! Pure Power 12 550W 80PLUS Gold','Alimentation','https://www.ldlc.pro/fiche/PB00652452.html',72.46,86.95,'2025-12-12 09:00:22'),(125,'POWER-003','Corsair CX650 80PLUS Bronze (2023)','Alimentation','https://www.ldlc.pro/fiche/PB00580851.html',58.29,69.95,'2025-12-12 09:00:22'),(126,'POWER-004','be quiet! Pure Power 12 650W 80PLUS Gold','Alimentation','https://www.ldlc.pro/fiche/PB00652455.html',83.29,99.95,'2025-12-12 09:00:22'),(127,'POWER-005','Fox Spirit HG 650 80PLUS Gold','Alimentation','https://www.ldlc.pro/fiche/PB00655467.html',83.29,99.95,'2025-12-12 09:00:22'),(128,'POWER-006','Corsair RM650e (2025)','Alimentation','https://www.ldlc.pro/fiche/PB00672682.html',83.29,99.95,'2025-12-12 09:00:22'),(129,'POWER-007','be quiet! Pure Power 12 750W 80PLUS Gold','Alimentation','https://www.ldlc.pro/fiche/PB00652457.html',91.63,109.96,'2025-12-12 09:00:22'),(130,'POWER-008','Fox Spirit HG 750 80PLUS Gold','Alimentation','https://www.ldlc.pro/fiche/PB00660347.html',91.63,109.96,'2025-12-12 09:00:22'),(131,'POWER-009','Corsair RM750e (2025)','Alimentation','https://www.ldlc.pro/fiche/PB00663403.html',99.96,119.95,'2025-12-12 09:00:22'),(132,'POWER-010','be quiet! Pure Power 12 850W 80PLUS Gold','Alimentation','https://www.ldlc.pro/fiche/PB00652458.html',99.96,119.95,'2025-12-12 09:00:22'),(133,'POWER-011','Fox Spirit HG 850 80PLUS Gold','Alimentation','https://www.ldlc.pro/fiche/PB00678200.html',104.13,124.96,'2025-12-12 09:00:22'),(134,'POWER-012','be quiet! Pure Power 13 M 750W 80PLUS Gold','Alimentation','https://www.ldlc.pro/fiche/PB00696819.html',99.96,119.95,'2025-12-12 09:00:22'),(135,'POWER-013','Corsair RM850e (2025)','Alimentation','https://www.ldlc.pro/fiche/PB00663406.html',112.46,134.95,'2025-12-12 09:00:22'),(136,'POWER-014','be quiet! Straight Power 12 1200W Platinum','Alimentation','https://www.ldlc.pro/fiche/PB00557981.html',224.96,269.95,'2025-12-12 09:00:22'),(137,'SOUND-001','Nedis Carte Son 5.1 3D USB','Carte Son','https://www.ldlc.pro/fiche/PB00262751.html',8.29,9.95,'2025-12-12 09:00:22'),(138,'SOUND-002','DeLock Carte son externe USB-C','Carte Son','https://www.ldlc.pro/fiche/PB00677824.html',9.92,11.90,'2025-12-12 09:00:22'),(139,'SOUND-003','Dexlan Carte son USB-A','Carte Son','https://www.ldlc.pro/fiche/PB00260479.html',12.46,14.95,'2025-12-12 09:00:22'),(140,'SOUND-004','StarTech.com Carte son / Adaptateur USB vers audio stéréo','Carte Son','https://www.ldlc.pro/fiche/PB00241230.html',24.96,29.95,'2025-12-12 09:00:22'),(141,'SOUND-005','StarTech.com Carte son externe USB avec audio SPDIF numérique','Carte Son','https://www.ldlc.pro/fiche/PB00184041.html',41.62,49.94,'2025-12-12 09:00:22'),(142,'SOUND-006','Delock Carte son PCI Express 7.1','Carte Son','https://www.ldlc.pro/fiche/PB00685103.html',58.29,69.95,'2025-12-12 09:00:22'),(143,'SOUND-007','SteelSeries GameDAC Gen. 2 (PlayStation/Xbox)','Carte Son','https://www.ldlc.pro/fiche/PB00574289.html',124.96,149.95,'2025-12-12 09:00:22'),(144,'SPEAKERS-001','Advance SoundPhonic 2.0 4W','Enceintes','https://www.ldlc.pro/fiche/PB00241782.html',12.46,14.95,'2025-12-12 09:00:22'),(145,'SPEAKERS-002','Logitech S-150 Digital USB Speaker','Enceintes','https://www.ldlc.pro/fiche/PB00118575.html',16.63,19.96,'2025-12-12 09:00:22'),(146,'SPEAKERS-003','Mars Gaming MSCUBE (Noir)','Enceintes','https://www.ldlc.pro/fiche/PB00491049.html',12.46,14.95,'2025-12-12 09:00:22'),(147,'SPEAKERS-004','Advance SoundPhonic RGB 11W','Enceintes','https://www.ldlc.pro/fiche/PB00593376.html',20.79,24.95,'2025-12-12 09:00:22'),(148,'SPEAKERS-005','Edifier M1360 (Noir)','Enceintes','https://www.ldlc.pro/fiche/PB00228881.html',33.29,39.95,'2025-12-12 09:00:22'),(149,'SPEAKERS-006','Edifier R1280DB Noir','Enceintes','https://www.ldlc.pro/fiche/PB00240672.html',91.63,109.96,'2025-12-12 09:00:22'),(150,'SPEAKERS-007','Edifier R1700BT Noir','Enceintes','https://www.ldlc.pro/fiche/PB00248230.html',116.63,139.96,'2025-12-12 09:00:22'),(151,'SPEAKERS-008','Edifier QR30 Noir','Enceintes','https://www.ldlc.pro/fiche/PB00666808.html',99.96,119.95,'2025-12-12 09:00:22'),(152,'SPEAKERS-009','Edifier S2000MKIII','Enceintes','https://www.ldlc.pro/fiche/PB00576622.html',333.29,399.95,'2025-12-12 09:00:22'),(153,'SPEAKERS-010','Logitech Multimedia Speakers System Z533','Enceintes','https://www.ldlc.pro/fiche/PB00191223.html',116.63,139.96,'2025-12-12 09:00:22'),(154,'THERMAL-001','Arctic MX-4 2019 (4 grammes)','Pâte Thermique','https://www.ldlc.pro/fiche/PB00263073.html',6.58,7.90,'2025-12-12 09:00:22'),(155,'THERMAL-002','Arctic MX-6 (4 grammes)','Pâte Thermique','https://www.ldlc.pro/fiche/PB00532873.html',9.92,11.90,'2025-12-12 09:00:22'),(156,'THERMAL-003','Arctic MX-6 (8 grammes)','Pâte Thermique','https://www.ldlc.pro/fiche/PB00532874.html',10.79,12.95,'2025-12-12 09:00:22'),(157,'THERMAL-004','Arctic Silver 5 (3.5 grammes)','Pâte Thermique','https://www.ldlc.pro/fiche/PB00021822.html',12.46,14.95,'2025-12-12 09:00:22'),(158,'THERMAL-005','Noctua NT-H1 3.5g SW Edition','Pâte Thermique','https://www.ldlc.pro/fiche/PB00503867.html',9.96,11.95,'2025-12-12 09:00:22'),(159,'THERMAL-006','Thermal Grizzly Hydronaut (3.9 grammes)','Pâte Thermique','https://www.ldlc.pro/fiche/PB00226201.html',14.96,17.95,'2025-12-12 09:00:22'),(160,'THERMAL-007','Thermal Grizzly Conductonaut (1 gramme)','Pâte Thermique','https://www.ldlc.pro/fiche/PB00226255.html',11.63,13.96,'2025-12-12 09:00:22'),(161,'THERMAL-008','Arctic MX-4 2019 (20 grammes)','Pâte Thermique','https://www.ldlc.pro/fiche/PB00263075.html',12.46,14.95,'2025-12-12 09:00:22'),(162,'THERMAL-009','Polartherm X-10 (5G)','Pâte Thermique','https://www.ldlc.pro/fiche/PB00655354.html',12.46,14.95,'2025-12-12 09:00:22'),(163,'THERMAL-010','be quiet! DC2 Pro (3 grammes)','Pâte Thermique','https://www.ldlc.pro/fiche/PB00542237.html',14.96,17.95,'2025-12-12 09:00:22'),(164,'UPS-001','APC Back-UPS 500VA (BE500G2-FR)','Onduleur','https://www.ldlc.pro/fiche/PB00633134.html',116.63,139.96,'2025-12-12 09:00:22'),(165,'UPS-002','APC Back-UPS 650VA (BE650G2-FR)','Onduleur','https://www.ldlc.pro/fiche/PB00339370.html',112.46,134.95,'2025-12-12 09:00:22'),(166,'UPS-003','APC Back-UPS 750VA, 230V, AVR, prises FR','Onduleur','https://www.ldlc.pro/fiche/PB00406306.html',104.13,124.96,'2025-12-12 09:00:22'),(167,'UPS-004','APC Back-UPS 850VA (BE850G2-FR)','Onduleur','https://www.ldlc.pro/fiche/PB00339369.html',129.13,154.96,'2025-12-12 09:00:22'),(168,'UPS-005','APC Back-UPS 1200VA, 230V, AVR, prises FR','Onduleur','https://www.ldlc.pro/fiche/PB00406447.html',149.96,179.95,'2025-12-12 09:00:22'),(169,'UPS-006','Eaton Ellipse ECO 500 FR','Onduleur','https://www.ldlc.pro/fiche/PB00115597.html',79.13,94.96,'2025-12-12 09:00:22'),(170,'UPS-007','Eaton Ellipse ECO 650 FR','Onduleur','https://www.ldlc.pro/fiche/PB00115599.html',87.46,104.95,'2025-12-12 09:00:22'),(171,'UPS-008','Eaton Ellipse PRO 650 FR','Onduleur','https://www.ldlc.pro/fiche/PB00152766.html',141.63,169.96,'2025-12-12 09:00:22'),(172,'UPS-009','APC Back-UPS Pro 900G','Onduleur','https://www.ldlc.pro/fiche/PB00105725.html',249.96,299.95,'2025-12-12 09:00:22'),(173,'UPS-010','APC Back-UPS Pro 1200VA','Onduleur','https://www.ldlc.pro/fiche/PB00109187.html',358.29,429.95,'2025-12-12 09:00:22'),(174,'VIDEO-001','AMD Radeon Pro WX 3200','Carte Graphique','https://www.ldlc.pro/fiche/PB00482507.html',133.29,159.95,'2025-12-12 09:00:22'),(175,'VIDEO-002','PNY NVIDIA RTX A400 4 GB','Carte Graphique','https://www.ldlc.pro/fiche/PB00612206.html',187.46,224.95,'2025-12-12 09:00:22'),(176,'VIDEO-003','AMD Radeon Pro W6400','Carte Graphique','https://www.ldlc.pro/fiche/PB00482007.html',249.96,299.95,'2025-12-12 09:00:22'),(177,'VIDEO-004','AMD Radeon Pro W7500','Carte Graphique','https://www.ldlc.pro/fiche/PB00570791.html',458.29,549.95,'2025-12-12 09:00:22'),(178,'VIDEO-005','PNY Nvidia RTX 2000 Ada Generation','Carte Graphique','https://www.ldlc.pro/fiche/PB00609662.html',683.29,819.95,'2025-12-12 09:00:22'),(179,'VIDEO-006','PNY Nvidia RTX 4000 Ada Generation','Carte Graphique','https://www.ldlc.pro/fiche/PB00571200.html',1324.96,1589.95,'2025-12-12 09:00:22'),(180,'VIDEO-007','AMD Radeon Pro W7600','Carte Graphique','https://www.ldlc.pro/fiche/PB00570790.html',616.63,739.96,'2025-12-12 09:00:22'),(181,'VIDEO-008','AMD Radeon Pro W7800','Carte Graphique','https://www.ldlc.pro/fiche/PB00555973.html',2749.96,3299.95,'2025-12-12 09:00:22'),(182,'VIDEO-009','PNY Nvidia RTX 4500 Ada Generation','Carte Graphique','https://www.ldlc.pro/fiche/PB00571225.html',2391.63,2869.96,'2025-12-12 09:00:22'),(183,'VIDEO-010','PNY Nvidia RTX 6000 ADA','Carte Graphique','https://www.ldlc.pro/fiche/PB00535970.html',7099.96,8519.95,'2025-12-12 09:00:22'),(184,'WEBCAM-001','Logitech HD Webcam C270','Webcam','https://www.ldlc.pro/fiche/PB00213751.html',27.46,32.95,'2025-12-12 09:00:22'),(185,'WEBCAM-002','Logitech HD Pro Webcam C920 Refresh','Webcam','https://www.ldlc.pro/fiche/PB00195707.html',66.63,79.96,'2025-12-12 09:00:22'),(186,'WEBCAM-003','Logitech BRIO 100 (Blanc)','Webcam','https://www.ldlc.pro/fiche/PB00571992.html',33.29,39.95,'2025-12-12 09:00:22'),(187,'WEBCAM-004','Logitech BRIO 300 (Graphite)','Webcam','https://www.ldlc.pro/fiche/PB00538742.html',58.29,69.95,'2025-12-12 09:00:22'),(188,'WEBCAM-005','Logitech BRIO 4K B2B','Webcam','https://www.ldlc.pro/fiche/PB00684421.html',149.96,179.95,'2025-12-12 09:00:22'),(189,'WEBCAM-006','Logitech MX BRIO Graphite','Webcam','https://www.ldlc.pro/fiche/PB00595075.html',191.63,229.96,'2025-12-12 09:00:22'),(190,'WEBCAM-007','Logitech BRIO 500 Blanc','Webcam','https://www.ldlc.pro/fiche/PB00516989.html',99.96,119.95,'2025-12-12 09:00:22'),(191,'WEBCAM-008','Elgato Facecam MK.2','Webcam','https://www.ldlc.pro/fiche/PB00607592.html',133.29,159.95,'2025-12-12 09:00:22'),(192,'WIRED-001','INOVU Adaptateur USB 3.0 vers Gigabit Ethernet','Carte Réseau Filaire','https://www.ldlc.pro/fiche/PB00544276.html',16.63,19.96,'2025-12-12 09:00:22'),(193,'WIRED-002','DeLock Carte réseau PCI Express avec Ethernet Gigabit','Carte Réseau Filaire','https://www.ldlc.pro/fiche/PB00678113.html',49.96,59.95,'2025-12-12 09:00:22'),(194,'WIRED-003','Intel i210-T1','Carte Réseau Filaire','https://www.ldlc.pro/fiche/PB00585520.html',54.13,64.96,'2025-12-12 09:00:22'),(195,'WIRED-004','DeLock Carte réseau PCI Express x4 avec 4x Ethernet Gigabit PoE+','Carte Réseau Filaire','https://www.ldlc.pro/fiche/PB00706209.html',208.25,249.90,'2025-12-12 09:00:22'),(196,'WIRED-005','Intel Ethernet I350 T2V2BLK (bulk)','Carte Réseau Filaire','https://www.ldlc.pro/fiche/PB00245865.html',190.79,228.95,'2025-12-12 09:00:22'),(197,'WIRED-006','DeLock Carte réseau PCI Express avec SFP+ 10 Gigabits','Carte Réseau Filaire','https://www.ldlc.pro/fiche/PB00678111.html',91.63,109.96,'2025-12-12 09:00:22'),(198,'WIRED-007','Lenovo ThinkSystem Broadcom 5720 1GbE RJ45 2-Port PCIe Ethernet Adapter','Carte Réseau Filaire','https://www.ldlc.pro/fiche/PB00578863.html',141.63,169.96,'2025-12-12 09:00:22'),(199,'WIRELESS-001','D-Link DWA-X582','Carte Réseau Sans Fil','https://www.ldlc.pro/fiche/PB00579120.html',41.63,49.96,'2025-12-12 09:00:22'),(200,'WIRELESS-002','Gigabyte GC-WB1733D-I','Carte Réseau Sans Fil','https://www.ldlc.pro/fiche/PB00256035.html',33.29,39.95,'2025-12-12 09:00:22'),(201,'WIRELESS-003','Gigabyte GC-WIFI7 (Rév. 1.0)','Carte Réseau Sans Fil','https://www.ldlc.pro/fiche/PB00587217.html',55.79,66.95,'2025-12-12 09:00:22'),(202,'WIRELESS-004','MSI AX1800 WiFi USB Adapter','Carte Réseau Sans Fil','https://www.ldlc.pro/fiche/PB00549780.html',45.79,54.95,'2025-12-12 09:00:22'),(203,'WIRELESS-005','INOVU MBTAX900 - Clé USB Wi-Fi 6 / BT','Carte Réseau Sans Fil','https://www.ldlc.pro/fiche/PB00675651.html',14.13,16.96,'2025-12-12 09:00:22'),(204,'LOG-001','Windows 11 Pro (OEM)','Logiciel','https://www.ldlc.pro/',145.00,174.00,'2025-12-12 09:00:22'),(205,'LOG-002','Windows 11 Home (OEM)','Logiciel','https://www.ldlc.pro/',109.00,130.80,'2025-12-12 09:00:22'),(206,'LOG-003','Microsoft 365 Business Standard (1 an)','Logiciel','https://www.microsoft.com/',144.00,172.80,'2025-12-12 09:00:22'),(207,'LOG-004','Microsoft Office 2021','Logiciel','https://www.microsoft.com/',149.00,178.80,'2025-12-12 09:00:22'),(208,'LOG-005','Kaspersky Small Office Security (5 postes)','Logiciel','https://www.kaspersky.fr/',99.00,118.80,'2025-12-12 09:00:22'),(209,'LOG-006','Norton 360 Premium (5 appareils)','Logiciel','https://fr.norton.com/',39.99,47.99,'2025-12-12 09:00:22'),(210,'LOG-007','Bitdefender GravityZone (10 postes)','Logiciel','https://www.bitdefender.fr/',199.00,238.80,'2025-12-12 09:00:22'),(211,'LOG-008','Adobe Creative Cloud All Apps (1 an)','Logiciel','https://www.adobe.com/',719.88,863.86,'2025-12-12 09:00:22'),(212,'LOG-009','CorelDRAW Graphics Suite','Logiciel','https://www.corel.com/',549.00,658.80,'2025-12-12 09:00:22'),(213,'LOG-010','Autodesk AutoCAD (1 an)','Logiciel','https://www.autodesk.fr/',2100.00,2520.00,'2025-12-12 09:00:22'),(214,'LOG-011','JAWS Professional (licence annuelle)','Logiciel','https://www.freedomscientific.com/',995.00,1194.00,'2025-12-12 09:00:22'),(215,'LOG-012','NVDA (lecteur d\'écran - GRATUIT)','Logiciel','https://www.nvaccess.org/',0.00,0.00,'2025-12-12 09:00:22'),(216,'LOG-013','ZoomText Magnifier','Logiciel','https://www.freedomscientific.com/',595.00,714.00,'2025-12-12 09:00:22'),(217,'LOG-014','VMware Workstation Pro','Logiciel','https://www.vmware.com/',299.00,358.80,'2025-12-12 09:00:22'),(218,'LOG-015','Visual Studio Professional (1 an)','Logiciel','https://visualstudio.microsoft.com/',539.00,646.80,'2025-12-12 09:00:22'),(219,'PER-001','Tablette graphique Wacom Intuos Pro M','Périphérique','https://www.ldlc.pro/',349.00,418.80,'2025-12-12 09:00:22'),(220,'PER-002','Clavier Gros Caractères Contrastés (Accessibilité)','Périphérique','https://www.ldlc.pro/',49.00,58.80,'2025-12-12 09:00:22'),(221,'NET-001','Switch Gigabit 48 ports TP-Link','Réseau','https://www.ldlc.pro/',149.00,178.80,'2025-12-12 09:00:22'),(222,'NET-002','Routeur WiFi 6 TP-Link Archer AX73','Réseau','https://www.ldlc.pro/',119.00,142.80,'2025-12-12 09:00:22'),(223,'CAB-001','Lot 50 câbles RJ45 Cat6a FTP 1m','Réseau','https://www.ldlc.pro/',99.00,118.80,'2025-12-12 09:00:22'),(224,'PORTABLE-001','PC Portable Executive 15.6\" i7-1260P 32GB DDR5 1TB','Portable','Portable professionnel 15.6\" Full HD IPS, Intel Core i7-1260P (12 cores), 32 GB DDR5, SSD 1 TB NVMe PCIe 4.0, GPU Intel Iris Xe, WiFi 6E, Thunderbolt 4, Webcam 1080p, autonomie 10h, châssis aluminium 1.8 kg, garantie 3 ans',2099.00,2518.80,'2025-12-12 09:00:23'),(225,'ACC-PORT-001','Sacoche de transport professionnelle','Accessoire Portable','Sacoche de transport renforcée pour portable 15.6\", protection chocs, compartiments organisés',49.00,58.80,'2025-12-12 09:00:23'),(226,'ACC-PORT-002','Souris sans fil Logitech MX Anywhere 3','Accessoire Portable','Souris sans fil Bluetooth, capteur 4000 DPI, autonomie 70 jours, compatible multi-OS',79.00,94.80,'2025-12-12 09:00:23'),(227,'ACC-PORT-003','Adaptateur HDMI/VGA multiport','Accessoire Portable','Hub USB-C vers HDMI, VGA, USB 3.0, RJ45, compatible tous portables USB-C',39.00,46.80,'2025-12-12 09:00:23');
/*!40000 ALTER TABLE `composants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_composants`
--

DROP TABLE IF EXISTS `configuration_composants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_composants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL,
  `composant_id` int(11) NOT NULL,
  `quantite` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_config_composant` (`config_id`,`composant_id`),
  KEY `composant_id` (`composant_id`),
  CONSTRAINT `configuration_composants_ibfk_1` FOREIGN KEY (`config_id`) REFERENCES `configurations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `configuration_composants_ibfk_2` FOREIGN KEY (`composant_id`) REFERENCES `composants` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_composants`
--

LOCK TABLES `configuration_composants` WRITE;
/*!40000 ALTER TABLE `configuration_composants` DISABLE KEYS */;
INSERT INTO `configuration_composants` VALUES (1,1,27,1),(2,1,87,1),(3,1,69,1),(4,1,52,1),(5,1,124,1),(6,1,12,1),(7,1,20,1),(8,1,73,2),(9,1,60,1),(10,1,96,1),(11,1,45,1),(12,1,204,1),(13,1,206,1),(14,1,218,1),(15,2,28,1),(16,2,87,1),(17,2,69,2),(18,2,53,1),(19,2,52,1),(20,2,175,1),(21,2,125,1),(22,2,12,1),(23,2,21,1),(24,2,73,1),(25,2,219,1),(26,2,61,1),(27,2,97,1),(28,2,46,1),(29,2,204,1),(30,2,206,1),(31,2,211,1),(32,2,212,1),(33,3,26,1),(34,3,86,1),(35,3,68,1),(36,3,52,1),(37,3,123,1),(38,3,13,1),(39,3,20,1),(40,3,72,1),(41,3,60,1),(42,3,96,1),(43,3,184,1),(44,3,204,1),(45,3,206,1),(46,4,26,1),(47,4,86,1),(48,4,69,1),(49,4,52,1),(50,4,123,1),(51,4,13,1),(52,4,20,1),(53,4,72,1),(54,4,220,1),(55,4,96,1),(56,4,46,1),(57,4,204,1),(58,4,206,1),(59,4,215,1),(73,6,28,1),(74,6,87,1),(75,6,69,2),(76,6,52,1),(77,6,53,1),(78,6,175,1),(79,6,125,1),(80,6,12,1),(81,6,21,1),(82,6,73,1),(83,6,62,1),(84,6,98,1),(85,6,144,1),(86,6,204,1),(87,6,206,1);
/*!40000 ALTER TABLE `configuration_composants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (1,'PC Développement Pro','Configuration haute performance pour développeurs : AMD Ryzen 7, 32GB RAM DDR5, SSD NVMe 1TB, 2 écrans 27\" QHD, logiciels professionnels','images/configurations/1765532947_519c5d807c494614.jpg','2025-12-12 09:00:22'),(2,'PC Design Graphique','Station de travail pour designers : AMD Ryzen 9 équivalent, 32GB RAM, GPU Pro, SSD 1TB, écran 4K 27\", tablette Wacom, Adobe Creative Cloud','images/configurations/1765532916_e0f7d9f272083f1f.jpg','2025-12-12 09:00:22'),(3,'PC Bureautique Standard','Configuration bureautique pour Marketing et RH : Intel i5, 16GB RAM, SSD 500GB, écran 24\" Full HD, périphériques standard','images/configurations/1765532861_543679acf0d0dfdc.jpg','2025-12-12 09:00:22'),(4,'PC Support Client avec Accessibilité','Configuration adaptée handicap visuel : Intel i5, 16GB RAM, SSD 500GB, écran 24\", clavier gros caractères, logiciel NVDA gratuit, casque professionnel','images/configurations/1765532227_6d5db3e378fbcdf5.jpg','2025-12-12 09:00:22'),(6,'PC Direction Executive','Configuration premium pour direction : AMD Ryzen 9 équivalent, 32GB RAM, SSD 2TB, GPU Pro, écran 4K 27\", périphériques haut de gamme','images/configurations/1765532968_e09b385d1a4813b8.jpg','2025-12-12 09:00:22');
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
  `sujet` varchar(200) DEFAULT NULL,
  `message` text NOT NULL,
  `lu` tinyint(1) DEFAULT 0,
  `date_envoi` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `departement` varchar(100) DEFAULT NULL,
  `nb_personnes` int(11) DEFAULT 0,
  `ordre` int(11) DEFAULT 0,
  `visible` tinyint(1) DEFAULT 1,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Développement Logiciel','Conception et développement d\'applications web et mobile sur mesure, maintenance évolutive et corrective.','Développement Logiciel',15,1,1,'2025-12-12 09:00:21'),(2,'Design UX/UI','Création d\'interfaces utilisateur intuitives et attractives, prototypage, tests utilisateurs.','Design UX/UI',5,2,1,'2025-12-12 09:00:21'),(3,'Infrastructures IT','Gestion et maintenance des infrastructures réseau, serveurs, cybersécurité, cloud computing.','Infrastructures IT',5,3,0,'2025-12-12 09:00:21'),(4,'Marketing et Vente','Stratégie marketing digitale, gestion de campagnes, relation client, analyse de données commerciales.','Marketing et Vente',10,4,1,'2025-12-12 09:00:21'),(5,'Support Client','Assistance technique 24/7, formation utilisateurs, documentation, gestion des incidents.','Support Client',5,5,1,'2025-12-12 09:00:21'),(6,'Ressources Humaines','Recrutement, gestion administrative du personnel, formation, développement des compétences.','Ressources Humaines',5,6,1,'2025-12-12 09:00:21'),(7,'Direction','Direction générale, stratégie d\'entreprise, gestion financière, pilotage opérationnel.','Direction',5,7,1,'2025-12-12 09:00:21');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vue_configuration_details`
--

DROP TABLE IF EXISTS `vue_configuration_details`;
/*!50001 DROP VIEW IF EXISTS `vue_configuration_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vue_configuration_details` AS SELECT
 1 AS `config_id`,
  1 AS `config_nom`,
  1 AS `composant_id`,
  1 AS `reference`,
  1 AS `libelle`,
  1 AS `categorie`,
  1 AS `quantite`,
  1 AS `prix_ht`,
  1 AS `prix_ttc`,
  1 AS `total_ht`,
  1 AS `total_ttc` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vue_prix_configurations`
--

DROP TABLE IF EXISTS `vue_prix_configurations`;
/*!50001 DROP VIEW IF EXISTS `vue_prix_configurations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vue_prix_configurations` AS SELECT
 1 AS `id`,
  1 AS `nom`,
  1 AS `description`,
  1 AS `nb_composants`,
  1 AS `prix_total_ht`,
  1 AS `prix_total_ttc` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vue_configuration_details`
--

/*!50001 DROP VIEW IF EXISTS `vue_configuration_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vue_configuration_details` AS select `cfg`.`id` AS `config_id`,`cfg`.`nom` AS `config_nom`,`c`.`id` AS `composant_id`,`c`.`reference` AS `reference`,`c`.`libelle` AS `libelle`,`c`.`categorie` AS `categorie`,`cc`.`quantite` AS `quantite`,`c`.`prix_ht` AS `prix_ht`,`c`.`prix_ttc` AS `prix_ttc`,`cc`.`quantite` * `c`.`prix_ht` AS `total_ht`,`cc`.`quantite` * `c`.`prix_ttc` AS `total_ttc` from ((`configurations` `cfg` join `configuration_composants` `cc` on(`cfg`.`id` = `cc`.`config_id`)) join `composants` `c` on(`cc`.`composant_id` = `c`.`id`)) order by `cfg`.`id`,`c`.`categorie`,`c`.`libelle` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vue_prix_configurations`
--

/*!50001 DROP VIEW IF EXISTS `vue_prix_configurations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vue_prix_configurations` AS select `cfg`.`id` AS `id`,`cfg`.`nom` AS `nom`,`cfg`.`description` AS `description`,count(`cc`.`composant_id`) AS `nb_composants`,sum(`cc`.`quantite` * `c`.`prix_ht`) AS `prix_total_ht`,sum(`cc`.`quantite` * `c`.`prix_ttc`) AS `prix_total_ttc` from ((`configurations` `cfg` left join `configuration_composants` `cc` on(`cfg`.`id` = `cc`.`config_id`)) left join `composants` `c` on(`cc`.`composant_id` = `c`.`id`)) group by `cfg`.`id`,`cfg`.`nom`,`cfg`.`description` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-12 10:57:07
