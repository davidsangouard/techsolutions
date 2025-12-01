-- Base de données TechSolutions avec Configurations Pré-définies
CREATE DATABASE IF NOT EXISTS techsolutions CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE techsolutions;

-- Table des composants PC (depuis le CSV)
CREATE TABLE IF NOT EXISTS composants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reference VARCHAR(50) UNIQUE NOT NULL,
    libelle TEXT,
    url TEXT,
    prix_ht DECIMAL(10,2),
    date_ajout TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table des configurations pré-définies (par service/département)
CREATE TABLE IF NOT EXISTS configurations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_config VARCHAR(255) NOT NULL,
    service VARCHAR(100) NOT NULL,
    description TEXT,
    prix_total_ht DECIMAL(10,2),
    prix_total_ttc DECIMAL(10,2),
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_service (service)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table des composants de chaque configuration
CREATE TABLE IF NOT EXISTS config_composants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    config_id INT NOT NULL,
    composant_id INT NOT NULL,
    quantite INT NOT NULL DEFAULT 1,
    FOREIGN KEY (config_id) REFERENCES configurations(id) ON DELETE CASCADE,
    FOREIGN KEY (composant_id) REFERENCES composants(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table des actualités
CREATE TABLE IF NOT EXISTS actualites (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    contenu TEXT NOT NULL,
    date_publication DATETIME DEFAULT CURRENT_TIMESTAMP,
    auteur VARCHAR(100),
    statut ENUM('brouillon', 'publie') DEFAULT 'brouillon'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table des contacts
CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    sujet VARCHAR(255),
    message TEXT NOT NULL,
    date_envoi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    statut ENUM('nouveau', 'lu', 'traite') DEFAULT 'nouveau'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table des administrateurs
CREATE TABLE IF NOT EXISTS administrateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(150) NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table des devis
CREATE TABLE IF NOT EXISTS devis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_devis VARCHAR(50) UNIQUE NOT NULL,
    config_id INT,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    montant_ht DECIMAL(10,2),
    montant_ttc DECIMAL(10,2),
    statut ENUM('brouillon', 'envoye', 'accepte', 'refuse') DEFAULT 'brouillon',
    FOREIGN KEY (config_id) REFERENCES configurations(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertion des composants depuis le CSV
INSERT INTO composants (reference, libelle, url, prix_ht) VALUES
('CASEAC-001', 'Fox Spirit LIGHTFLOW ARGB HUB', 'https://www.ldlc.pro/fiche/PB00654453.html', 8.29),
('CASEFAN-001', 'Fox Spirit FA120 ARGB (Noir)', 'https://www.ldlc.pro/fiche/PB00696127.html', 9.96),
('CASEFAN-002', 'Arctic P12 PWM PST Noir', 'https://www.ldlc.pro/fiche/PB00505033.html', 9.92),
('CASEFAN-003', 'Aerocool Phantom M-3 12 PWM ARGB (Noir)', 'https://www.ldlc.pro/fiche/PB00659018.html', 8.25),
('CASEFAN-004', 'Noctua NF-P12 Redux-1300 PWM', 'https://www.ldlc.pro/fiche/PB00253244.html', 16.63),
('CASEFAN-005', 'be quiet! Silent Wings 4 120mm PWM', 'https://www.ldlc.pro/fiche/PB00504486.html', 23.29),
('CASEFAN-006', 'Arctic P12 Pro A-RGB (Noir)', 'https://www.ldlc.pro/fiche/PB00692228.html', 11.46),
('CASEFAN-007', 'Aerocool APNX FP1-140 (Noir)', 'https://www.ldlc.pro/fiche/PB00587254.html', 10.79),
('CASEFAN-008', 'Arctic P14 Pro (Noir)', 'https://www.ldlc.pro/fiche/PB00699278.html', 8.25),
('CASEFAN-009', 'Antec Connect 120 ARGB Noir (x3)', 'https://www.ldlc.pro/fiche/PB00657735.html', 27.46),
('CASEFAN-010', 'Arctic P12 SLIM PWM PST', 'https://www.ldlc.pro/fiche/PB00408325.html', 7.46),
('CASE-001', 'Fox Spirit AG1 (Noir) - Moyen Tour', 'https://www.ldlc.pro/fiche/PB00663701.html', 83.29),
('CASE-002', 'be quiet! Pure Base 500 (Noir) - Moyen Tour', 'https://www.ldlc.pro/fiche/PB00581486.html', 91.63),
('CASE-003', 'Aerocool CS-111 V2 Noir - Mini Tour', 'https://www.ldlc.pro/fiche/PB00660826.html', 37.46),
('CASE-004', 'Cooler Master Silencio S600 - Moyen Tour', 'https://www.ldlc.pro/fiche/PB00275559.html', 91.62),
('CASE-005', 'be quiet! Pure Base 600 (Noir) - Moyen Tour', 'https://www.ldlc.pro/fiche/PB00222411.html', 87.46),
('CASE-006', 'Aerocool D301A V1 Noir - Mini Tour', 'https://www.ldlc.pro/fiche/PB00659164.html', 58.29),
('CASE-007', 'Fox Spirit EG1 (Noir) - Moyen Tour', 'https://www.ldlc.pro/fiche/PB00703259.html', 108.29),
('CASE-008', 'Aerocool CS-106 (Noir) - Mini Tour', 'https://www.ldlc.pro/fiche/PB00428914.html', 33.29),
('CPUCO-001', 'be quiet! Pure Rock Pro 3 (Noir)', 'https://www.ldlc.pro/fiche/PB00672815.html', 41.63),
('CPUCO-002', 'Arctic Freezer 36 (Noir)', 'https://www.ldlc.pro/fiche/PB00606845.html', 37.46),
('CPUCO-003', 'Noctua NH-U12A Chromax Black', 'https://www.ldlc.pro/fiche/PB00465678.html', 133.29),
('CPUCO-004', 'be quiet! Dark Rock 5', 'https://www.ldlc.pro/fiche/PB00623910.html', 66.63),
('CPUCO-005', 'Arctic Liquid Freezer III 240 A-RGB (Noir)', 'https://www.ldlc.pro/fiche/PB00623910.html', 91.63),
('CPUCO-006', 'Cooler Master Hyper 212 Black', 'https://www.ldlc.pro/fiche/PB00579435.html', 20.79),
('CPU-001', 'AMD Ryzen 5 7600 (3.8 GHz / 5.1 GHz)', 'https://www.ldlc.pro/fiche/PB00536100.html', 183.29),
('CPU-002', 'AMD Ryzen 7 7700 (3.8 GHz / 5.3 GHz)', 'https://www.ldlc.pro/fiche/PB00703383.html', 224.96),
('CPU-003', 'AMD Ryzen 7 5800X (3.8 GHz / 4.7 GHz)', 'https://www.ldlc.pro/fiche/PB00387534.html', 166.63),
('CPU-004', 'AMD Ryzen 5 5600 (3.5 GHz / 4.4 GHz)', 'https://www.ldlc.pro/fiche/PB00699110.html', 70.79),
('CPU-005', 'AMD Ryzen 9 7900X (4.7 GHz / 5.6 GHz)', 'https://www.ldlc.pro/fiche/PB00516611.html', 358.29),
('CPU-006', 'Intel Core i5-13600KF (3.5 GHz / 5.1 GHz)', 'https://www.ldlc.pro/fiche/PB00519257.html', 299.95),
('CPU-007', 'Intel Core i7-13700K (3.4 GHz / 5.4 GHz)', 'https://www.ldlc.pro/fiche/PB00519277.html', 416.63),
('EXTERNAL-001', 'Samsung Portable SSD T7 1 To Bleu', 'https://www.ldlc.pro/fiche/PB00334797.html', 91.63),
('EXTERNAL-002', 'Samsung Portable SSD T7 2 To Bleu', 'https://www.ldlc.pro/fiche/PB00334798.html', 137.46),
('EXTERNAL-003', 'Samsung Portable SSD T7 4 To Gris', 'https://www.ldlc.pro/fiche/PB00622258.html', 249.96),
('EXTERNAL-004', 'Crucial X10 Portable 2 To', 'https://www.ldlc.pro/fiche/PB00683347.html', 183.29),
('EXTERNAL-005', 'Crucial X10 Pro Portable 4 To', 'https://www.ldlc.pro/fiche/PB00563421.html', 333.29),
('EXTERNAL-006', 'LaCie Rugged Mini 5 To (USB-C)', 'https://www.ldlc.pro/fiche/PB00277674.html', 183.29),
('EXTERNAL-007', 'WD Elements Portable 5 To Noir (USB 3.0)', 'https://www.ldlc.pro/fiche/PB00585178.html', 133.29),
('EXTERNAL-008', 'Kingston XS2000 2 To', 'https://www.ldlc.pro/fiche/PB00564415.html', 166.63),
('EXTERNAL-009', 'LaCie 1big Dock Thunderbolt 3 - 8 To', 'https://www.ldlc.pro/fiche/PB00353634.html', 441.62),
('EXTERNAL-010', 'ioSafe Solo G3 4 To (Waterproof/Fireproof)', 'https://www.ldlc.pro/fiche/PB00582205.html', 499.96),
('FAN-001', 'Noctua NA-FC1 (Contrôleur PWM 3 canaux)', 'https://www.ldlc.com/fiche/PB00253235.html', 29.95),
('FAN-002', 'NZXT RGB & Fan Controller', 'https://www.ldlc.com/fiche/PB00305624.html', 59.95),
('HEADPHONES-001', 'Audio-Technica ATH-M50x (Noir)', 'https://www.ldlc.pro/fiche/PB00466740.html', 133.29),
('HEADPHONES-002', 'Sony WH-1000XM5 (Noir)', 'https://www.ldlc.pro/fiche/PB00535836.html', 274.96),
('HEADPHONES-003', 'AKG N9 Hybrid (Noir)', 'https://www.ldlc.pro/fiche/PB00665063.html', 240.83),
('HEADPHONES-004', 'B&W Px7 S3 (Noir Anthracite)', 'https://www.ldlc.pro/fiche/PB00702618.html', 358.29),
('HEADPHONES-005', 'Audio-Technica ATH-M30x', 'https://www.ldlc.pro/fiche/PB00466691.html', 74.96),
('HEADPHONES-006', 'Belkin Micro Casque USB-C/Bluetooth', 'https://www.ldlc.pro/fiche/PB00584780.html', 49.96),
('HEADPHONES-007', 'Apple AirPods Pro 2 (Boîtier MagSafe USB-C)', 'https://www.ldlc.pro/fiche/PB00571619.html', 190.83),
('INTERNAL-001', 'Seagate BarraCuda 1 To (ST1000DM014)', 'https://www.ldlc.pro/fiche/PB00559048.html', 56.63),
('INTERNAL-002', 'Seagate BarraCuda 4 To (ST4000DM004)', 'https://www.ldlc.pro/fiche/PB00234144.html', 108.29),
('INTERNAL-003', 'Seagate IronWolf 4 To (ST4000VN006)', 'https://www.ldlc.pro/fiche/PB00494230.html', 116.63),
('INTERNAL-004', 'Seagate IronWolf 8 To (ST8000VN004)', 'https://www.ldlc.pro/fiche/PB00281525.html', 191.63),
('INTERNAL-005', 'Seagate IronWolf Pro 10 To (ST10000NT001)', 'https://www.ldlc.pro/fiche/PB00519239.html', 291.63),
('INTERNAL-006', 'Western Digital WD Red Plus 6 To', 'https://www.ldlc.pro/fiche/PB00542621.html', 183.29),
('INTERNAL-007', 'Synology HAT5300-4T 4 To', 'https://www.ldlc.pro/fiche/PB00498508.html', 224.96),
('INTERNAL-008', 'Seagate Exos X20 20 To (ST20000NM002D)', 'https://www.ldlc.pro/fiche/PB00584253.html', 449.96),
('KEYBOARD-001', 'Logitech MX Keys S (Graphite)', 'https://www.ldlc.pro/fiche/PB00556046.html', 99.96),
('KEYBOARD-002', 'Logitech Wave Keys (Noir)', 'https://www.ldlc.pro/fiche/PB00576651.html', 58.29),
('KEYBOARD-003', 'Cherry KC 6000 Slim (Noir)', 'https://www.ldlc.pro/fiche/PB00251920.html', 45.79),
('KEYBOARD-004', 'INOVU LK120 (AZERTY, Français)', 'https://www.ldlc.pro/fiche/PB00594739.html', 14.58),
('KEYBOARD-005', 'Apple Magic Keyboard (AZERTY, Français)', 'https://www.ldlc.pro/fiche/PB00651741.html', 99.17),
('KEYBOARD-006', 'Corsair Gaming K70 Core', 'https://www.ldlc.pro/fiche/PB00576649.html', 83.29),
('KEYBOARD-007', 'Bluestork Media Office', 'https://www.ldlc.pro/fiche/PB00649506.html', 8.25),
('KEYBOARD-008', 'INOVU SWL10 Noir (AZERTY, Français)', 'https://www.ldlc.pro/fiche/PB00388018.html', 20.42),
('MEMORY-001', 'Textorm 16 Go (2x 8 Go) DDR4 3200 MHz CL16', 'https://www.ldlc.pro/fiche/PB00392932.html', 80.79),
('MEMORY-002', 'Textorm 32 Go (2x 16 Go) DDR4 3200 MHz CL16', 'https://www.ldlc.pro/fiche/PB00392938.html', 158.29),
('MEMORY-003', 'Textorm 32 Go (2x 16 Go) DDR5 6000 MHz CL36', 'https://www.ldlc.pro/fiche/PB00656910.html', 149.96),
('MEMORY-004', 'Corsair Dominator Platinum DDR5 RGB 32 Go (2x 16 Go) 6000 MHz CL30', 'https://www.ldlc.pro/fiche/PB00548197.html', 0),
('MEMORY-005', 'Textorm SO-DIMM 16 Go DDR4 3200 MHz CL22', 'https://www.ldlc.pro/fiche/PB00426643.html', 0),
('MEMORY-006', 'Textorm SO-DIMM 32 Go (2x 16 Go) DDR4 3200 MHz CL22', 'https://www.ldlc.pro/fiche/PB00630478.html', 0),
('MEMORY-007', 'Corsair Dominator Platinum DDR5 RGB 64 Go (2x 32 Go) 6000 MHz CL30', 'https://www.ldlc.pro/fiche/PB00555089.html', 0),
('MONITOR-001', 'AOC 23.8" LED - 24B3HA2 (Full HD, IPS, 75 Hz)', 'https://www.ldlc.pro/fiche/PB00597773.html', 83.29),
('MONITOR-002', 'LG 23.8" LED - 24MS550-B (Full HD, IPS, 75 Hz)', 'https://www.ldlc.pro/fiche/PB00622280.html', 83.29),
('MONITOR-003', 'BenQ 23.8" LED - GW2491 (Full HD, IPS, 75 Hz)', 'https://www.ldlc.pro/fiche/PB00663389.html', 74.96),
('MONITOR-004', 'MSI 23.8" LED - PRO MP242AP (Full HD, IPS, 75 Hz)', 'https://www.ldlc.pro/fiche/PB00567502.html', 91.63),
('MONITOR-005', 'Acer 21.5" LED - Vero B227QE3bmiprxv (Full HD, IPS, 100 Hz)', 'https://www.ldlc.pro/fiche/PB00631760.html', 108.29),
('MONITOR-006', 'INOVU 21.5" LED - MB22 V2 (Full HD, VA, 100 Hz)', 'https://www.ldlc.pro/fiche/PB00613781.html', 63.75),
('MONITOR-007', 'iiyama 23.8" LED - ProLite XUB2493HS-B6 (Full HD, IPS, 75 Hz)', 'https://www.ldlc.pro/fiche/PB00597291.html', 116.63),
('MONITOR-008', 'Acer 27" LED - Nitro VG271UM3bmiipx (2.5K, 180 Hz, IPS)', 'https://www.ldlc.pro/fiche/PB00561639.html', 166.63),
('MONITOR-009', 'Acer 27" LED - Vero B277UGbemiqpruzx (2.5K, 120 Hz, IPS, USB-C)', 'https://www.ldlc.pro/fiche/PB00698956.html', 208.29),
('MONITOR-010', 'Fox Spirit 28" LED - PGK280 (4K, 144 Hz, IPS, USB-C)', 'https://www.ldlc.pro/fiche/PB00510188.html', 291.63),
('MONITOR-011', 'Acer 34" LED - Predator X34Vbmiiphuzx (UltraWide OLED, 175 Hz)', 'https://www.ldlc.pro/fiche/PB00595101.html', 833.29),
('MONITOR-012', 'INOVU 27" LED - MBQ27 (2.5K, 75 Hz, IPS, USB-C)', 'https://www.ldlc.pro/fiche/PB00559189.html', 141.63),
('MONITOR-013', 'Acer 23.8" LED - Nitro VG240YEbmiix (Full HD, 100 Hz, IPS)', 'https://www.ldlc.pro/fiche/PB00561671.html', 74.96),
('MONITOR-014', 'Fox Spirit 49" LED - PGM491 (UltraWide 5K, 144 Hz, VA)', 'https://www.ldlc.pro/fiche/PB00657719.html', 624.96),
('MOTHERBOARD-001', 'MSI PRO H610M-E DDR4', 'https://www.ldlc.pro/fiche/PB00545871.html', 58.29),
('MOTHERBOARD-002', 'Gigabyte H610M S2H V3 DDR4', 'https://www.ldlc.pro/fiche/PB00607356.html', 62.46),
('MOTHERBOARD-003', 'ASRock B450M Pro4 R2.0', 'https://www.ldlc.pro/fiche/PB00462746.html', 69.13),
('MOTHERBOARD-004', 'ASRock A620M-HDV/M.2', 'https://www.ldlc.pro/fiche/PB00552929.html', 83.29),
('MOTHERBOARD-005', 'MSI PRO B760M-P DDR4', 'https://www.ldlc.pro/fiche/PB00537254.html', 83.29),
('MOTHERBOARD-006', 'ASRock B650M PG Lightning', 'https://www.ldlc.pro/fiche/PB00592895.html', 116.63),
('MOTHERBOARD-007', 'ASUS TUF GAMING B650-PLUS WIFI', 'https://www.ldlc.pro/fiche/PB00520904.html', 181.63),
('MOTHERBOARD-008', 'ASRock B860 PRO RS', 'https://www.ldlc.pro/fiche/PB00671756.html', 149.96),
('MOTHERBOARD-009', 'Gigabyte B850 AORUS ELITE WIFI7 ICE', 'https://www.ldlc.pro/fiche/PB00660675.html', 199.96),
('MOTHERBOARD-010', 'ASRock X870 Nova WiFi', 'https://www.ldlc.pro/fiche/PB00703412.html', 299.96),
('MOUSE-001', 'Logitech B110 Silent (Noir)', 'https://www.ldlc.pro/fiche/PB00256298.html', 9.96),
('MOUSE-002', 'INOVU FM 1600 (Noir)', 'https://www.ldlc.pro/fiche/PB00654454.html', 6.63),
('MOUSE-003', 'Advance Drift 2 Noir', 'https://www.ldlc.pro/fiche/PB00316126.html', 8.29),
('MOUSE-004', 'Logitech M171 Wireless Mouse (Noir)', 'https://www.ldlc.pro/fiche/PB00214538.html', 13.29),
('MOUSE-005', 'Logitech M220 Silent (Noir)', 'https://www.ldlc.pro/fiche/PB00214497.html', 16.63),
('MOUSE-006', 'Logitech M240 Silent (Graphite)', 'https://www.ldlc.pro/fiche/PB00554020.html', 23.29),
('MOUSE-007', 'ASUS TUF Gaming M3 Gen II', 'https://www.ldlc.pro/fiche/PB00569700.html', 33.29),
('MOUSE-008', 'Logitech M650 (Graphite)', 'https://www.ldlc.pro/fiche/PB00480702.html', 33.29),
('MOUSE-009', 'ASUS ROG Gladius II Core', 'https://www.ldlc.pro/fiche/PB00274106.html', 37.46),
('MOUSE-010', 'Logitech MX Vertical', 'https://www.ldlc.pro/fiche/PB00256308.html', 83.29),
('MOUSE-011', 'Logitech MX Master 3S (Graphite)', 'https://www.ldlc.pro/fiche/PB00500370.html', 74.96),
('MOUSE-012', 'ASUS ROG Keris Wireless AimPoint (Blanc)', 'https://www.ldlc.pro/fiche/PB00536223.html', 74.96),
('MOUSE-013', 'ASUS ROG Harpe Ace Noir (Aim Lab Edition)', 'https://www.ldlc.pro/fiche/PB00538830.html', 91.63),
('MOUSE-014', 'ASUS ROG Harpe II Ace Noir', 'https://www.ldlc.pro/fiche/PB00697402.html', 149.96),
('OPTICAL-001', 'Verbatim Graveur de CD/DVD externe USB 2.0', 'https://www.ldlc.pro/fiche/PB00556044.html', 33.29),
('OPTICAL-002', 'Verbatim Graveur de CD/DVD externe USB-C', 'https://www.ldlc.pro/fiche/PB00556040.html', 37.46),
('OPTICAL-003', 'ASUS SDRW-08D2S-U Lite Noir', 'https://www.ldlc.pro/fiche/PB00123265.html', 39.13),
('OPTICAL-004', 'ASUS SDRW-08U7M-U Argent', 'https://www.ldlc.pro/fiche/PB00202674.html', 45.79),
('OPTICAL-005', 'ASUS SDRW-08U7M-U Noir', 'https://www.ldlc.pro/fiche/PB00202712.html', 49.12),
('OPTICAL-006', 'ASUS ZenDrive U9M (USB-C/USB-A) Noir', 'https://www.ldlc.pro/fiche/PB00237284.html', 49.96),
('OPTICAL-007', 'ASUS ZenDrive V1M (USB-C)', 'https://www.ldlc.pro/fiche/PB00481334.html', 58.29),
('OPTICAL-008', 'Verbatim Graveur de Blu-ray externe USB-A', 'https://www.ldlc.pro/fiche/PB00556082.html', 116.63),
('OPTICAL-009', 'ASUS BW-16D1HT (Interne SATA)', 'https://www.ldlc.pro/fiche/PB00152185.html', 99.96),
('OS-001', 'Microsoft Windows 10 Pro', '', 149.96),
('OS-002', 'Microsoft Windows 10 Famille', '', 116.63),
('OS-003', 'Microsoft Windows 11 Pro', '', 166.63),
('OS-004', 'Microsoft Windows 11 Famille', '', 133.29),
('OS-005', 'Microsoft Windows Server 2019', '', 541.63),
('OS-006', 'Microsoft Windows Server 2022', '', 666.63),
('OS-007', 'Microsoft Windows Server 2025', '', 749.96),
('OS-008', 'Linux Mint', 'https://linuxmint.com/', 0.0),
('OS-009', 'Fedora Workstation', 'https://fedoraproject.org/', 0.0),
('OS-010', 'CentOS Stream', 'https://centos.org/', 0.0),
('OS-011', 'Red Hat Enterprise Linux', 'https://www.redhat.com/', 349.96),
('OS-012', 'Ubuntu Desktop', 'https://ubuntu.com/', 0.0),
('OS-013', 'Ubuntu Server', 'https://ubuntu.com/download/server', 0.0),
('OS-014', 'Debian', 'https://www.debian.org/', 0.0),
('OS-015', 'Debian Server', 'https://www.debian.org/', 0.0),
('POWER-001', 'be quiet! System Power 11 450W 80PLUS Bronze', 'https://www.ldlc.pro/fiche/PB00686560.html', 54.13),
('POWER-002', 'be quiet! Pure Power 12 550W 80PLUS Gold', 'https://www.ldlc.pro/fiche/PB00652452.html', 72.46),
('POWER-003', 'Corsair CX650 80PLUS Bronze (2023)', 'https://www.ldlc.pro/fiche/PB00580851.html', 58.29),
('POWER-004', 'be quiet! Pure Power 12 650W 80PLUS Gold', 'https://www.ldlc.pro/fiche/PB00652455.html', 83.29),
('POWER-005', 'Fox Spirit HG 650 80PLUS Gold', 'https://www.ldlc.pro/fiche/PB00655467.html', 83.29),
('POWER-006', 'Corsair RM650e (2025)', 'https://www.ldlc.pro/fiche/PB00672682.html', 83.29),
('POWER-007', 'be quiet! Pure Power 12 750W 80PLUS Gold', 'https://www.ldlc.pro/fiche/PB00652457.html', 91.63),
('POWER-008', 'Fox Spirit HG 750 80PLUS Gold', 'https://www.ldlc.pro/fiche/PB00660347.html', 91.63),
('POWER-009', 'Corsair RM750e (2025)', 'https://www.ldlc.pro/fiche/PB00663403.html', 99.96),
('POWER-010', 'be quiet! Pure Power 12 850W 80PLUS Gold', 'https://www.ldlc.pro/fiche/PB00652458.html', 99.96),
('POWER-011', 'Fox Spirit HG 850 80PLUS Gold', 'https://www.ldlc.pro/fiche/PB00678200.html', 104.13),
('POWER-012', 'be quiet! Pure Power 13 M 750W 80PLUS Gold', 'https://www.ldlc.pro/fiche/PB00696819.html', 99.96),
('POWER-013', 'Corsair RM850e (2025)', 'https://www.ldlc.pro/fiche/PB00663406.html', 112.46),
('POWER-014', 'be quiet! Straight Power 12 1200W Platinum', 'https://www.ldlc.pro/fiche/PB00557981.html', 224.96),
('SOUND-001', 'Nedis Carte Son 5.1 3D USB', 'https://www.ldlc.pro/fiche/PB00262751.html', 8.29),
('SOUND-002', 'DeLock Carte son externe USB-C', 'https://www.ldlc.pro/fiche/PB00677824.html', 9.92),
('SOUND-003', 'Dexlan Carte son USB-A', 'https://www.ldlc.pro/fiche/PB00260479.html', 12.46),
('SOUND-004', 'StarTech.com Carte son / Adaptateur USB vers audio stéréo', 'https://www.ldlc.pro/fiche/PB00241230.html', 24.96),
('SOUND-005', 'StarTech.com Carte son externe USB avec audio SPDIF numérique', 'https://www.ldlc.pro/fiche/PB00184041.html', 41.62),
('SOUND-006', 'Delock Carte son PCI Express 7.1', 'https://www.ldlc.pro/fiche/PB00685103.html', 58.29),
('SOUND-007', 'SteelSeries GameDAC Gen. 2 (PlayStation/Xbox)', 'https://www.ldlc.pro/fiche/PB00574289.html', 124.96),
('SPEAKERS-001', 'Advance SoundPhonic 2.0 4W', 'https://www.ldlc.pro/fiche/PB00241782.html', 12.46),
('SPEAKERS-002', 'Logitech S-150 Digital USB Speaker', 'https://www.ldlc.pro/fiche/PB00118575.html', 16.63),
('SPEAKERS-003', 'Mars Gaming MSCUBE (Noir)', 'https://www.ldlc.pro/fiche/PB00491049.html', 12.46),
('SPEAKERS-004', 'Advance SoundPhonic RGB 11W', 'https://www.ldlc.pro/fiche/PB00593376.html', 20.79),
('SPEAKERS-005', 'Edifier M1360 (Noir)', 'https://www.ldlc.pro/fiche/PB00228881.html', 33.29),
('SPEAKERS-006', 'Edifier R1280DB Noir', 'https://www.ldlc.pro/fiche/PB00240672.html', 91.63),
('SPEAKERS-007', 'Edifier R1700BT Noir', 'https://www.ldlc.pro/fiche/PB00248230.html', 116.63),
('SPEAKERS-008', 'Edifier QR30 Noir', 'https://www.ldlc.pro/fiche/PB00666808.html', 99.96),
('SPEAKERS-009', 'Edifier S2000MKIII', 'https://www.ldlc.pro/fiche/PB00576622.html', 333.29),
('SPEAKERS-010', 'Logitech Multimedia Speakers System Z533', 'https://www.ldlc.pro/fiche/PB00191223.html', 116.63),
('THERMAL-001', 'Arctic MX-4 2019 (4 grammes)', 'https://www.ldlc.pro/fiche/PB00263073.html', 6.58),
('THERMAL-002', 'Arctic MX-6 (4 grammes)', 'https://www.ldlc.pro/fiche/PB00532873.html', 9.92),
('THERMAL-003', 'Arctic MX-6 (8 grammes)', 'https://www.ldlc.pro/fiche/PB00532874.html', 10.79),
('THERMAL-004', 'Arctic Silver 5 (3.5 grammes)', 'https://www.ldlc.pro/fiche/PB00021822.html', 12.46),
('THERMAL-005', 'Noctua NT-H1 3.5g SW Edition', 'https://www.ldlc.pro/fiche/PB00503867.html', 9.96),
('THERMAL-006', 'Thermal Grizzly Hydronaut (3.9 grammes)', 'https://www.ldlc.pro/fiche/PB00226201.html', 14.96),
('THERMAL-007', 'Thermal Grizzly Conductonaut (1 gramme)', 'https://www.ldlc.pro/fiche/PB00226255.html', 11.63),
('THERMAL-008', 'Arctic MX-4 2019 (20 grammes)', 'https://www.ldlc.pro/fiche/PB00263075.html', 12.46),
('THERMAL-009', 'Polartherm X-10 (5G)', 'https://www.ldlc.pro/fiche/PB00655354.html', 12.46),
('THERMAL-010', 'be quiet! DC2 Pro (3 grammes)', 'https://www.ldlc.pro/fiche/PB00542237.html', 14.96),
('UPS-001', 'APC Back-UPS 500VA (BE500G2-FR)', 'https://www.ldlc.pro/fiche/PB00633134.html', 116.63),
('UPS-002', 'APC Back-UPS 650VA (BE650G2-FR)', 'https://www.ldlc.pro/fiche/PB00339370.html', 112.46),
('UPS-003', 'APC Back-UPS 750VA, 230V, AVR, prises FR', 'https://www.ldlc.pro/fiche/PB00406306.html', 104.13),
('UPS-004', 'APC Back-UPS 850VA (BE850G2-FR)', 'https://www.ldlc.pro/fiche/PB00339369.html', 129.13),
('UPS-005', 'APC Back-UPS 1200VA, 230V, AVR, prises FR', 'https://www.ldlc.pro/fiche/PB00406447.html', 149.96),
('UPS-006', 'Eaton Ellipse ECO 500 FR', 'https://www.ldlc.pro/fiche/PB00115597.html', 79.13),
('UPS-007', 'Eaton Ellipse ECO 650 FR', 'https://www.ldlc.pro/fiche/PB00115599.html', 87.46),
('UPS-008', 'Eaton Ellipse PRO 650 FR', 'https://www.ldlc.pro/fiche/PB00152766.html', 141.63),
('UPS-009', 'APC Back-UPS Pro 900G', 'https://www.ldlc.pro/fiche/PB00105725.html', 249.96),
('UPS-010', 'APC Back-UPS Pro 1200VA', 'https://www.ldlc.pro/fiche/PB00109187.html', 358.29),
('VIDEO-001', 'AMD Radeon Pro WX 3200', 'https://www.ldlc.pro/fiche/PB00482507.html', 133.29),
('VIDEO-002', 'PNY NVIDIA RTX A400 4 GB', 'https://www.ldlc.pro/fiche/PB00612206.html', 187.46),
('VIDEO-003', 'AMD Radeon Pro W6400', 'https://www.ldlc.pro/fiche/PB00482007.html', 249.96),
('VIDEO-004', 'AMD Radeon Pro W7500', 'https://www.ldlc.pro/fiche/PB00570791.html', 458.29),
('VIDEO-005', 'PNY Nvidia RTX 2000 Ada Generation', 'https://www.ldlc.pro/fiche/PB00609662.html', 683.29),
('VIDEO-006', 'PNY Nvidia RTX 4000 Ada Generation', 'https://www.ldlc.pro/fiche/PB00571200.html', 0),
('VIDEO-007', 'AMD Radeon Pro W7600', 'https://www.ldlc.pro/fiche/PB00570790.html', 616.63),
('VIDEO-008', 'AMD Radeon Pro W7800', 'https://www.ldlc.pro/fiche/PB00555973.html', 0),
('VIDEO-009', 'PNY Nvidia RTX 4500 Ada Generation', 'https://www.ldlc.pro/fiche/PB00571225.html', 0),
('VIDEO-010', 'PNY Nvidia RTX 6000 ADA', 'https://www.ldlc.pro/fiche/PB00535970.html', 0),
('WEBCAM-001', 'Logitech HD Webcam C270', 'https://www.ldlc.pro/fiche/PB00213751.html', 27.46),
('WEBCAM-002', 'Logitech HD Pro Webcam C920 Refresh', 'https://www.ldlc.pro/fiche/PB00195707.html', 66.63),
('WEBCAM-003', 'Logitech BRIO 100 (Blanc)', 'https://www.ldlc.pro/fiche/PB00571992.html', 33.29),
('WEBCAM-004', 'Logitech BRIO 300 (Graphite)', 'https://www.ldlc.pro/fiche/PB00538742.html', 58.29),
('WEBCAM-005', 'Logitech BRIO 4K B2B', 'https://www.ldlc.pro/fiche/PB00684421.html', 149.96),
('WEBCAM-006', 'Logitech MX BRIO Graphite', 'https://www.ldlc.pro/fiche/PB00595075.html', 191.63),
('WEBCAM-007', 'Logitech BRIO 500 Blanc', 'https://www.ldlc.pro/fiche/PB00516989.html', 99.96),
('WEBCAM-008', 'Elgato Facecam MK.2', 'https://www.ldlc.pro/fiche/PB00607592.html', 133.29),
('WIRED-001', 'INOVU Adaptateur USB 3.0 vers Gigabit Ethernet', 'https://www.ldlc.pro/fiche/PB00544276.html', 16.63),
('WIRED-002', 'DeLock Carte réseau PCI Express avec Ethernet Gigabit', 'https://www.ldlc.pro/fiche/PB00678113.html', 49.96),
('WIRED-003', 'Intel i210-T1', 'https://www.ldlc.pro/fiche/PB00585520.html', 54.13),
('WIRED-004', 'DeLock Carte réseau PCI Express x4 avec 4x Ethernet Gigabit PoE+', 'https://www.ldlc.pro/fiche/PB00706209.html', 208.25),
('WIRED-005', 'Intel Ethernet I350 T2V2BLK (bulk)', 'https://www.ldlc.pro/fiche/PB00245865.html', 190.79),
('WIRED-006', 'DeLock Carte réseau PCI Express avec SFP+ 10 Gigabits', 'https://www.ldlc.pro/fiche/PB00678111.html', 91.63),
('WIRED-007', 'Lenovo ThinkSystem Broadcom 5720 1GbE RJ45 2-Port PCIe Ethernet Adapter', 'https://www.ldlc.pro/fiche/PB00578863.html', 141.63),
('WIRELESS-001', 'D-Link DWA-X582', 'https://www.ldlc.pro/fiche/PB00579120.html', 41.63),
('WIRELESS-002', 'Gigabyte GC-WB1733D-I', 'https://www.ldlc.pro/fiche/PB00256035.html', 33.29),
('WIRELESS-003', 'Gigabyte GC-WIFI7 (Rév. 1.0)', 'https://www.ldlc.pro/fiche/PB00587217.html', 55.79),
('WIRELESS-004', 'MSI AX1800 WiFi USB Adapter', 'https://www.ldlc.pro/fiche/PB00549780.html', 45.79),
('WIRELESS-005', 'INOVU MBTAX900 - Clé USB Wi-Fi 6 / BT', 'https://www.ldlc.pro/fiche/PB00675651.html', 14.13);

-- Administrateur par défaut (username: admin, password: admin123)
INSERT INTO administrateurs (username, password, email) VALUES
('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin@techsolutions.fr');

-- Actualités d'exemple
INSERT INTO actualites (titre, contenu, auteur, statut) VALUES
('Bienvenue sur TechSolutions', 'TechSolutions propose des configurations PC adaptées à chaque service de votre entreprise.', 'Admin', 'publie'),
('Nouvelles configurations disponibles', 'Découvrez nos configurations optimisées pour le développement, le design et la gestion.', 'Admin', 'publie'),
('Support et conseil', 'Notre équipe vous accompagne dans le choix de la configuration idéale pour vos besoins.', 'Admin', 'publie');

-- Configurations pré-définies par service

-- 1. Configuration "Développement logiciel - Standard"
INSERT INTO configurations (nom_config, service, description, prix_total_ht, prix_total_ttc) VALUES
('PC Développement Standard', 'Développement logiciel', 'Configuration optimale pour le développement logiciel : compilation rapide, multitâche fluide', 0, 0);

SET @dev_standard_id = LAST_INSERT_ID();

INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_standard_id, id, 1 FROM composants WHERE reference = 'CPU-001';  -- AMD Ryzen 5 7600
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_standard_id, id, 1 FROM composants WHERE reference = 'MEMORY-001';  -- 16 Go RAM
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_standard_id, id, 1 FROM composants WHERE reference = 'MOTHERBOARD-001';  -- MSI PRO H610M
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_standard_id, id, 1 FROM composants WHERE reference = 'POWER-002';  -- 550W
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_standard_id, id, 1 FROM composants WHERE reference = 'CASE-002';  -- be quiet! Pure Base 500
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_standard_id, id, 1 FROM composants WHERE reference = 'VIDEO-001';  -- AMD Radeon Pro WX 3200
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_standard_id, id, 2 FROM composants WHERE reference = 'MONITOR-001';  -- 2 écrans
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_standard_id, id, 1 FROM composants WHERE reference = 'KEYBOARD-001';  -- Logitech MX Keys
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_standard_id, id, 1 FROM composants WHERE reference = 'MOUSE-011';  -- Logitech MX Master

-- Calculer le prix
UPDATE configurations SET prix_total_ht = (
    SELECT SUM(c.prix_ht * cc.quantite)
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @dev_standard_id
), prix_total_ttc = (
    SELECT SUM(c.prix_ht * cc.quantite) * 1.20
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @dev_standard_id
) WHERE id = @dev_standard_id;

-- 2. Configuration "Développement logiciel - Performance"
INSERT INTO configurations (nom_config, service, description, prix_total_ht, prix_total_ttc) VALUES
('PC Développement Performance', 'Développement logiciel', 'Configuration haute performance pour projets lourds et virtualisation', 0, 0);

SET @dev_perf_id = LAST_INSERT_ID();

INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_perf_id, id, 1 FROM composants WHERE reference = 'CPU-005';  -- AMD Ryzen 9 7900X
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_perf_id, id, 1 FROM composants WHERE reference = 'MEMORY-002';  -- 32 Go RAM
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_perf_id, id, 1 FROM composants WHERE reference = 'MOTHERBOARD-006';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_perf_id, id, 1 FROM composants WHERE reference = 'POWER-007';  -- 750W
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_perf_id, id, 1 FROM composants WHERE reference = 'CASE-001';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_perf_id, id, 1 FROM composants WHERE reference = 'VIDEO-002';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_perf_id, id, 2 FROM composants WHERE reference = 'MONITOR-002';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_perf_id, id, 1 FROM composants WHERE reference = 'KEYBOARD-001';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @dev_perf_id, id, 1 FROM composants WHERE reference = 'MOUSE-011';

UPDATE configurations SET prix_total_ht = (
    SELECT SUM(c.prix_ht * cc.quantite)
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @dev_perf_id
), prix_total_ttc = (
    SELECT SUM(c.prix_ht * cc.quantite) * 1.20
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @dev_perf_id
) WHERE id = @dev_perf_id;

-- 3. Configuration "Design UX/UI - Standard"
INSERT INTO configurations (nom_config, service, description, prix_total_ht, prix_total_ttc) VALUES
('PC Design Standard', 'Design UX/UI', 'Configuration pour design graphique et UX/UI avec écran couleur précis', 0, 0);

SET @design_std_id = LAST_INSERT_ID();

INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @design_std_id, id, 1 FROM composants WHERE reference = 'CPU-002';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @design_std_id, id, 1 FROM composants WHERE reference = 'MEMORY-002';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @design_std_id, id, 1 FROM composants WHERE reference = 'MOTHERBOARD-004';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @design_std_id, id, 1 FROM composants WHERE reference = 'POWER-004';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @design_std_id, id, 1 FROM composants WHERE reference = 'CASE-002';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @design_std_id, id, 1 FROM composants WHERE reference = 'VIDEO-002';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @design_std_id, id, 1 FROM composants WHERE reference = 'MONITOR-008';  -- 27" 2.5K
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @design_std_id, id, 1 FROM composants WHERE reference = 'KEYBOARD-002';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @design_std_id, id, 1 FROM composants WHERE reference = 'MOUSE-011';

UPDATE configurations SET prix_total_ht = (
    SELECT SUM(c.prix_ht * cc.quantite)
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @design_std_id
), prix_total_ttc = (
    SELECT SUM(c.prix_ht * cc.quantite) * 1.20
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @design_std_id
) WHERE id = @design_std_id;

-- 4. Configuration "Marketing et vente - Standard"
INSERT INTO configurations (nom_config, service, description, prix_total_ht, prix_total_ttc) VALUES
('PC Marketing Standard', 'Marketing et vente', 'Configuration bureautique optimisée pour marketing et présentation client', 0, 0);

SET @marketing_std_id = LAST_INSERT_ID();

INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @marketing_std_id, id, 1 FROM composants WHERE reference = 'CPU-004';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @marketing_std_id, id, 1 FROM composants WHERE reference = 'MEMORY-001';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @marketing_std_id, id, 1 FROM composants WHERE reference = 'MOTHERBOARD-002';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @marketing_std_id, id, 1 FROM composants WHERE reference = 'POWER-001';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @marketing_std_id, id, 1 FROM composants WHERE reference = 'CASE-003';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @marketing_std_id, id, 1 FROM composants WHERE reference = 'MONITOR-001';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @marketing_std_id, id, 1 FROM composants WHERE reference = 'KEYBOARD-002';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @marketing_std_id, id, 1 FROM composants WHERE reference = 'MOUSE-005';

UPDATE configurations SET prix_total_ht = (
    SELECT SUM(c.prix_ht * cc.quantite)
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @marketing_std_id
), prix_total_ttc = (
    SELECT SUM(c.prix_ht * cc.quantite) * 1.20
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @marketing_std_id
) WHERE id = @marketing_std_id;

-- 5. Configuration "Support Client - Standard"
INSERT INTO configurations (nom_config, service, description, prix_total_ht, prix_total_ttc) VALUES
('PC Support Client', 'Support client', 'Configuration légère pour support technique et helpdesk', 0, 0);

SET @support_std_id = LAST_INSERT_ID();

INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @support_std_id, id, 1 FROM composants WHERE reference = 'CPU-004';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @support_std_id, id, 1 FROM composants WHERE reference = 'MEMORY-001';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @support_std_id, id, 1 FROM composants WHERE reference = 'MOTHERBOARD-001';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @support_std_id, id, 1 FROM composants WHERE reference = 'POWER-001';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @support_std_id, id, 1 FROM composants WHERE reference = 'CASE-003';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @support_std_id, id, 1 FROM composants WHERE reference = 'MONITOR-003';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @support_std_id, id, 1 FROM composants WHERE reference = 'KEYBOARD-003';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @support_std_id, id, 1 FROM composants WHERE reference = 'MOUSE-004';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @support_std_id, id, 1 FROM composants WHERE reference = 'HEADPHONES-001';  -- Casque audio

UPDATE configurations SET prix_total_ht = (
    SELECT SUM(c.prix_ht * cc.quantite)
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @support_std_id
), prix_total_ttc = (
    SELECT SUM(c.prix_ht * cc.quantite) * 1.20
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @support_std_id
) WHERE id = @support_std_id;

-- 6. Configuration "Direction - Premium"
INSERT INTO configurations (nom_config, service, description, prix_total_ht, prix_total_ttc) VALUES
('PC Direction Premium', 'Direction', 'Configuration haut de gamme pour la direction avec écran premium', 0, 0);

SET @direction_id = LAST_INSERT_ID();

INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @direction_id, id, 1 FROM composants WHERE reference = 'CPU-007';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @direction_id, id, 1 FROM composants WHERE reference = 'MEMORY-002';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @direction_id, id, 1 FROM composants WHERE reference = 'MOTHERBOARD-007';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @direction_id, id, 1 FROM composants WHERE reference = 'POWER-009';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @direction_id, id, 1 FROM composants WHERE reference = 'CASE-007';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @direction_id, id, 1 FROM composants WHERE reference = 'VIDEO-002';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @direction_id, id, 1 FROM composants WHERE reference = 'MONITOR-010';  -- 28" 4K
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @direction_id, id, 1 FROM composants WHERE reference = 'KEYBOARD-001';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @direction_id, id, 1 FROM composants WHERE reference = 'MOUSE-011';

UPDATE configurations SET prix_total_ht = (
    SELECT SUM(c.prix_ht * cc.quantite)
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @direction_id
), prix_total_ttc = (
    SELECT SUM(c.prix_ht * cc.quantite) * 1.20
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @direction_id
) WHERE id = @direction_id;

-- 7. Configuration "Infrastructure IT - Serveur"
INSERT INTO configurations (nom_config, service, description, prix_total_ht, prix_total_ttc) VALUES
('PC Infrastructure IT', 'Gestion des infrastructures systèmes et réseau', 'Configuration pour administration système et gestion réseau', 0, 0);

SET @infra_id = LAST_INSERT_ID();

INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @infra_id, id, 1 FROM composants WHERE reference = 'CPU-005';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @infra_id, id, 1 FROM composants WHERE reference = 'MEMORY-002';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @infra_id, id, 1 FROM composants WHERE reference = 'MOTHERBOARD-010';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @infra_id, id, 1 FROM composants WHERE reference = 'POWER-013';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @infra_id, id, 1 FROM composants WHERE reference = 'CASE-001';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @infra_id, id, 1 FROM composants WHERE reference = 'VIDEO-001';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @infra_id, id, 2 FROM composants WHERE reference = 'MONITOR-002';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @infra_id, id, 1 FROM composants WHERE reference = 'KEYBOARD-001';
INSERT INTO config_composants (config_id, composant_id, quantite) 
SELECT @infra_id, id, 1 FROM composants WHERE reference = 'MOUSE-010';

UPDATE configurations SET prix_total_ht = (
    SELECT SUM(c.prix_ht * cc.quantite)
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @infra_id
), prix_total_ttc = (
    SELECT SUM(c.prix_ht * cc.quantite) * 1.20
    FROM config_composants cc
    JOIN composants c ON cc.composant_id = c.id
    WHERE cc.config_id = @infra_id
) WHERE id = @infra_id;
