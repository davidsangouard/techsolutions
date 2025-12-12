-- =============================================
-- BASE DE DONNÉES TECHSOLUTIONS
-- Structure optimisée : UNE SEULE table composants
-- =============================================

DROP DATABASE IF EXISTS techsolutions;
CREATE DATABASE techsolutions CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE techsolutions;

-- =============================================
-- TABLE: admins
-- =============================================
CREATE TABLE admins (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO admins (username, password) VALUES 
('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi');
-- Mot de passe: admin123

-- =============================================
-- TABLE: services (7 départements)
-- =============================================
CREATE TABLE services (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(200) NOT NULL,
    description TEXT,
    departement VARCHAR(100),
    nb_personnes INT DEFAULT 0,
    ordre INT DEFAULT 0,
    visible BOOLEAN DEFAULT 1,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO services (titre, description, departement, nb_personnes, ordre, visible) VALUES
('Développement Logiciel', 'Conception et développement d\'applications web et mobile sur mesure, maintenance évolutive et corrective.', 'Développement Logiciel', 15, 1, 1),
('Design UX/UI', 'Création d\'interfaces utilisateur intuitives et attractives, prototypage, tests utilisateurs.', 'Design UX/UI', 5, 2, 1),
('Infrastructures IT', 'Gestion et maintenance des infrastructures réseau, serveurs, cybersécurité, cloud computing.', 'Infrastructures IT', 5, 3, 1),
('Marketing et Vente', 'Stratégie marketing digitale, gestion de campagnes, relation client, analyse de données commerciales.', 'Marketing et Vente', 10, 4, 1),
('Support Client', 'Assistance technique 24/7, formation utilisateurs, documentation, gestion des incidents.', 'Support Client', 5, 5, 1),
('Ressources Humaines', 'Recrutement, gestion administrative du personnel, formation, développement des compétences.', 'Ressources Humaines', 5, 6, 1),
('Direction', 'Direction générale, stratégie d\'entreprise, gestion financière, pilotage opérationnel.', 'Direction', 5, 7, 1);

-- =============================================
-- TABLE: composants (TOUS LES PRODUITS - 223)
-- =============================================
CREATE TABLE composants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    reference VARCHAR(50) UNIQUE NOT NULL,
    libelle VARCHAR(255) NOT NULL,
    categorie VARCHAR(100) NOT NULL,
    url TEXT,
    prix_ht DECIMAL(10,2) NOT NULL,
    prix_ttc DECIMAL(10,2) NOT NULL,
    date_ajout TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertion de tous les produits
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASEAC-001', 'Fox Spirit LIGHTFLOW ARGB HUB', 'Boîtier Accessoire', 'https://www.ldlc.pro/fiche/PB00654453.html', 8.29, 9.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASEFAN-001', 'Fox Spirit FA120 ARGB (Noir)', 'Ventilateur Boîtier', 'https://www.ldlc.pro/fiche/PB00696127.html', 9.96, 11.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASEFAN-002', 'Arctic P12 PWM PST Noir', 'Ventilateur Boîtier', 'https://www.ldlc.pro/fiche/PB00505033.html', 9.92, 11.9);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASEFAN-003', 'Aerocool Phantom M-3 12 PWM ARGB (Noir)', 'Ventilateur Boîtier', 'https://www.ldlc.pro/fiche/PB00659018.html', 8.25, 9.9);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASEFAN-004', 'Noctua NF-P12 Redux-1300 PWM', 'Ventilateur Boîtier', 'https://www.ldlc.pro/fiche/PB00253244.html', 16.63, 19.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASEFAN-005', 'be quiet! Silent Wings 4 120mm PWM', 'Ventilateur Boîtier', 'https://www.ldlc.pro/fiche/PB00504486.html', 23.29, 27.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASEFAN-006', 'Arctic P12 Pro A-RGB (Noir)', 'Ventilateur Boîtier', 'https://www.ldlc.pro/fiche/PB00692228.html', 11.46, 13.75);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASEFAN-007', 'Aerocool APNX FP1-140 (Noir)', 'Ventilateur Boîtier', 'https://www.ldlc.pro/fiche/PB00587254.html', 10.79, 12.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASEFAN-008', 'Arctic P14 Pro (Noir)', 'Ventilateur Boîtier', 'https://www.ldlc.pro/fiche/PB00699278.html', 8.25, 9.9);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASEFAN-009', 'Antec Connect 120 ARGB Noir (x3)', 'Ventilateur Boîtier', 'https://www.ldlc.pro/fiche/PB00657735.html', 27.46, 32.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASEFAN-010', 'Arctic P12 SLIM PWM PST', 'Ventilateur Boîtier', 'https://www.ldlc.pro/fiche/PB00408325.html', 7.46, 8.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASE-001', 'Fox Spirit AG1 (Noir) - Moyen Tour', 'Boîtier', 'https://www.ldlc.pro/fiche/PB00663701.html', 83.29, 99.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASE-002', 'be quiet! Pure Base 500 (Noir) - Moyen Tour', 'Boîtier', 'https://www.ldlc.pro/fiche/PB00581486.html', 91.63, 109.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASE-003', 'Aerocool CS-111 V2 Noir - Mini Tour', 'Boîtier', 'https://www.ldlc.pro/fiche/PB00660826.html', 37.46, 44.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASE-004', 'Cooler Master Silencio S600 - Moyen Tour', 'Boîtier', 'https://www.ldlc.pro/fiche/PB00275559.html', 91.62, 109.94);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASE-005', 'be quiet! Pure Base 600 (Noir) - Moyen Tour', 'Boîtier', 'https://www.ldlc.pro/fiche/PB00222411.html', 87.46, 104.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASE-006', 'Aerocool D301A V1 Noir - Mini Tour', 'Boîtier', 'https://www.ldlc.pro/fiche/PB00659164.html', 58.29, 69.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASE-007', 'Fox Spirit EG1 (Noir) - Moyen Tour', 'Boîtier', 'https://www.ldlc.pro/fiche/PB00703259.html', 108.29, 129.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CASE-008', 'Aerocool CS-106 (Noir) - Mini Tour', 'Boîtier', 'https://www.ldlc.pro/fiche/PB00428914.html', 33.29, 39.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CPUCO-001', 'be quiet! Pure Rock Pro 3 (Noir)', 'Refroidissement CPU', 'https://www.ldlc.pro/fiche/PB00672815.html', 41.63, 49.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CPUCO-002', 'Arctic Freezer 36 (Noir)', 'Refroidissement CPU', 'https://www.ldlc.pro/fiche/PB00606845.html', 37.46, 44.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CPUCO-003', 'Noctua NH-U12A Chromax Black', 'Refroidissement CPU', 'https://www.ldlc.pro/fiche/PB00465678.html', 133.29, 159.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CPUCO-004', 'be quiet! Dark Rock 5', 'Refroidissement CPU', 'https://www.ldlc.pro/fiche/PB00623910.html', 66.63, 79.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CPUCO-005', 'Arctic Liquid Freezer III 240 A-RGB (Noir)', 'Refroidissement CPU', 'https://www.ldlc.pro/fiche/PB00623910.html', 91.63, 109.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CPUCO-006', 'Cooler Master Hyper 212 Black', 'Refroidissement CPU', 'https://www.ldlc.pro/fiche/PB00579435.html', 20.79, 24.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CPU-001', 'AMD Ryzen 5 7600 (3.8 GHz / 5.1 GHz)', 'Processeur', 'https://www.ldlc.pro/fiche/PB00536100.html', 183.29, 219.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CPU-002', 'AMD Ryzen 7 7700 (3.8 GHz / 5.3 GHz)', 'Processeur', 'https://www.ldlc.pro/fiche/PB00703383.html', 224.96, 269.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CPU-003', 'AMD Ryzen 7 5800X (3.8 GHz / 4.7 GHz)', 'Processeur', 'https://www.ldlc.pro/fiche/PB00387534.html', 166.63, 199.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CPU-004', 'AMD Ryzen 5 5600 (3.5 GHz / 4.4 GHz)', 'Processeur', 'https://www.ldlc.pro/fiche/PB00699110.html', 70.79, 84.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CPU-005', 'AMD Ryzen 9 7900X (4.7 GHz / 5.6 GHz)', 'Processeur', 'https://www.ldlc.pro/fiche/PB00516611.html', 358.29, 429.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CPU-006', 'Intel Core i5-13600KF (3.5 GHz / 5.1 GHz)', 'Processeur', 'https://www.ldlc.pro/fiche/PB00519257.html', 299.95, 359.94);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CPU-007', 'Intel Core i7-13700K (3.4 GHz / 5.4 GHz)', 'Processeur', 'https://www.ldlc.pro/fiche/PB00519277.html', 416.63, 499.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('EXTERNAL-001', 'Samsung Portable SSD T7 1 To Bleu', 'Disque Dur Externe', 'https://www.ldlc.pro/fiche/PB00334797.html', 91.63, 109.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('EXTERNAL-002', 'Samsung Portable SSD T7 2 To Bleu', 'Disque Dur Externe', 'https://www.ldlc.pro/fiche/PB00334798.html', 137.46, 164.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('EXTERNAL-003', 'Samsung Portable SSD T7 4 To Gris', 'Disque Dur Externe', 'https://www.ldlc.pro/fiche/PB00622258.html', 249.96, 299.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('EXTERNAL-004', 'Crucial X10 Portable 2 To', 'Disque Dur Externe', 'https://www.ldlc.pro/fiche/PB00683347.html', 183.29, 219.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('EXTERNAL-005', 'Crucial X10 Pro Portable 4 To', 'Disque Dur Externe', 'https://www.ldlc.pro/fiche/PB00563421.html', 333.29, 399.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('EXTERNAL-006', 'LaCie Rugged Mini 5 To (USB-C)', 'Disque Dur Externe', 'https://www.ldlc.pro/fiche/PB00277674.html', 183.29, 219.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('EXTERNAL-007', 'WD Elements Portable 5 To Noir (USB 3.0)', 'Disque Dur Externe', 'https://www.ldlc.pro/fiche/PB00585178.html', 133.29, 159.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('EXTERNAL-008', 'Kingston XS2000 2 To', 'Disque Dur Externe', 'https://www.ldlc.pro/fiche/PB00564415.html', 166.63, 199.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('EXTERNAL-009', 'LaCie 1big Dock Thunderbolt 3 - 8 To', 'Disque Dur Externe', 'https://www.ldlc.pro/fiche/PB00353634.html', 441.62, 529.94);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('EXTERNAL-010', 'ioSafe Solo G3 4 To (Waterproof/Fireproof)', 'Disque Dur Externe', 'https://www.ldlc.pro/fiche/PB00582205.html', 499.96, 599.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('FAN-001', 'Noctua NA-FC1 (Contrôleur PWM 3 canaux)', 'Contrôleur Ventilateur', 'https://www.ldlc.com/fiche/PB00253235.html', 29.95, 35.94);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('FAN-002', 'NZXT RGB & Fan Controller', 'Contrôleur Ventilateur', 'https://www.ldlc.com/fiche/PB00305624.html', 59.95, 71.94);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('HEADPHONES-001', 'Audio-Technica ATH-M50x (Noir)', 'Casque Audio', 'https://www.ldlc.pro/fiche/PB00466740.html', 133.29, 159.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('HEADPHONES-002', 'Sony WH-1000XM5 (Noir)', 'Casque Audio', 'https://www.ldlc.pro/fiche/PB00535836.html', 274.96, 329.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('HEADPHONES-003', 'AKG N9 Hybrid (Noir)', 'Casque Audio', 'https://www.ldlc.pro/fiche/PB00665063.html', 240.83, 289.0);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('HEADPHONES-004', 'B&W Px7 S3 (Noir Anthracite)', 'Casque Audio', 'https://www.ldlc.pro/fiche/PB00702618.html', 358.29, 429.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('HEADPHONES-005', 'Audio-Technica ATH-M30x', 'Casque Audio', 'https://www.ldlc.pro/fiche/PB00466691.html', 74.96, 89.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('HEADPHONES-006', 'Belkin Micro Casque USB-C/Bluetooth', 'Casque Audio', 'https://www.ldlc.pro/fiche/PB00584780.html', 49.96, 59.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('HEADPHONES-007', 'Apple AirPods Pro 2 (Boîtier MagSafe USB-C)', 'Casque Audio', 'https://www.ldlc.pro/fiche/PB00571619.html', 190.83, 229.0);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('INTERNAL-001', 'Seagate BarraCuda 1 To (ST1000DM014)', 'Disque Dur Interne', 'https://www.ldlc.pro/fiche/PB00559048.html', 56.63, 67.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('INTERNAL-002', 'Seagate BarraCuda 4 To (ST4000DM004)', 'Disque Dur Interne', 'https://www.ldlc.pro/fiche/PB00234144.html', 108.29, 129.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('INTERNAL-003', 'Seagate IronWolf 4 To (ST4000VN006)', 'Disque Dur Interne', 'https://www.ldlc.pro/fiche/PB00494230.html', 116.63, 139.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('INTERNAL-004', 'Seagate IronWolf 8 To (ST8000VN004)', 'Disque Dur Interne', 'https://www.ldlc.pro/fiche/PB00281525.html', 191.63, 229.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('INTERNAL-005', 'Seagate IronWolf Pro 10 To (ST10000NT001)', 'Disque Dur Interne', 'https://www.ldlc.pro/fiche/PB00519239.html', 291.63, 349.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('INTERNAL-006', 'Western Digital WD Red Plus 6 To', 'Disque Dur Interne', 'https://www.ldlc.pro/fiche/PB00542621.html', 183.29, 219.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('INTERNAL-007', 'Synology HAT5300-4T 4 To', 'Disque Dur Interne', 'https://www.ldlc.pro/fiche/PB00498508.html', 224.96, 269.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('INTERNAL-008', 'Seagate Exos X20 20 To (ST20000NM002D)', 'Disque Dur Interne', 'https://www.ldlc.pro/fiche/PB00584253.html', 449.96, 539.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('KEYBOARD-001', 'Logitech MX Keys S (Graphite)', 'Clavier', 'https://www.ldlc.pro/fiche/PB00556046.html', 99.96, 119.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('KEYBOARD-002', 'Logitech Wave Keys (Noir)', 'Clavier', 'https://www.ldlc.pro/fiche/PB00576651.html', 58.29, 69.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('KEYBOARD-003', 'Cherry KC 6000 Slim (Noir)', 'Clavier', 'https://www.ldlc.pro/fiche/PB00251920.html', 45.79, 54.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('KEYBOARD-004', 'INOVU LK120 (AZERTY, Français)', 'Clavier', 'https://www.ldlc.pro/fiche/PB00594739.html', 14.58, 17.5);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('KEYBOARD-005', 'Apple Magic Keyboard (AZERTY, Français)', 'Clavier', 'https://www.ldlc.pro/fiche/PB00651741.html', 99.17, 119.0);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('KEYBOARD-006', 'Corsair Gaming K70 Core', 'Clavier', 'https://www.ldlc.pro/fiche/PB00576649.html', 83.29, 99.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('KEYBOARD-007', 'Bluestork Media Office', 'Clavier', 'https://www.ldlc.pro/fiche/PB00649506.html', 8.25, 9.9);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('KEYBOARD-008', 'INOVU SWL10 Noir (AZERTY, Français)', 'Clavier', 'https://www.ldlc.pro/fiche/PB00388018.html', 20.42, 24.5);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MEMORY-001', 'Textorm 16 Go (2x 8 Go) DDR4 3200 MHz CL16', 'Mémoire RAM', 'https://www.ldlc.pro/fiche/PB00392932.html', 80.79, 96.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MEMORY-002', 'Textorm 32 Go (2x 16 Go) DDR4 3200 MHz CL16', 'Mémoire RAM', 'https://www.ldlc.pro/fiche/PB00392938.html', 158.29, 189.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MEMORY-003', 'Textorm 32 Go (2x 16 Go) DDR5 6000 MHz CL36', 'Mémoire RAM', 'https://www.ldlc.pro/fiche/PB00656910.html', 149.96, 179.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MEMORY-008', 'Samsung SSD 990 EVO Plus M.2 PCIe NVMe 1 To ', 'Mémoire RAM', 'https://www.ldlc.pro/fiche/PB00653106.html', 95.79, 114.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-001', 'AOC 23.8" LED - 24B3HA2 (Full HD, IPS, 75 Hz)', 'Écran', 'https://www.ldlc.pro/fiche/PB00597773.html', 83.29, 99.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-002', 'LG 23.8" LED - 24MS550-B (Full HD, IPS, 75 Hz)', 'Écran', 'https://www.ldlc.pro/fiche/PB00622280.html', 83.29, 99.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-003', 'BenQ 23.8" LED - GW2491 (Full HD, IPS, 75 Hz)', 'Écran', 'https://www.ldlc.pro/fiche/PB00663389.html', 74.96, 89.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-004', 'MSI 23.8" LED - PRO MP242AP (Full HD, IPS, 75 Hz)', 'Écran', 'https://www.ldlc.pro/fiche/PB00567502.html', 91.63, 109.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-005', 'Acer 21.5" LED - Vero B227QE3bmiprxv (Full HD, IPS, 100 Hz)', 'Écran', 'https://www.ldlc.pro/fiche/PB00631760.html', 108.29, 129.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-006', 'INOVU 21.5" LED - MB22 V2 (Full HD, VA, 100 Hz)', 'Écran', 'https://www.ldlc.pro/fiche/PB00613781.html', 63.75, 76.5);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-007', 'iiyama 23.8" LED - ProLite XUB2493HS-B6 (Full HD, IPS, 75 Hz)', 'Écran', 'https://www.ldlc.pro/fiche/PB00597291.html', 116.63, 139.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-008', 'Acer 27" LED - Nitro VG271UM3bmiipx (2.5K, 180 Hz, IPS)', 'Écran', 'https://www.ldlc.pro/fiche/PB00561639.html', 166.63, 199.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-009', 'Acer 27" LED - Vero B277UGbemiqpruzx (2.5K, 120 Hz, IPS, USB-C)', 'Écran', 'https://www.ldlc.pro/fiche/PB00698956.html', 208.29, 249.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-010', 'Fox Spirit 28" LED - PGK280 (4K, 144 Hz, IPS, USB-C)', 'Écran', 'https://www.ldlc.pro/fiche/PB00510188.html', 291.63, 349.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-011', 'Acer 34" LED - Predator X34Vbmiiphuzx (UltraWide OLED, 175 Hz)', 'Écran', 'https://www.ldlc.pro/fiche/PB00595101.html', 833.29, 999.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-012', 'INOVU 27" LED - MBQ27 (2.5K, 75 Hz, IPS, USB-C)', 'Écran', 'https://www.ldlc.pro/fiche/PB00559189.html', 141.63, 169.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-013', 'Acer 23.8" LED - Nitro VG240YEbmiix (Full HD, 100 Hz, IPS)', 'Écran', 'https://www.ldlc.pro/fiche/PB00561671.html', 74.96, 89.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MONITOR-014', 'Fox Spirit 49" LED - PGM491 (UltraWide 5K, 144 Hz, VA)', 'Écran', 'https://www.ldlc.pro/fiche/PB00657719.html', 624.96, 749.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOTHERBOARD-001', 'MSI PRO H610M-E DDR4', 'Carte Mère', 'https://www.ldlc.pro/fiche/PB00545871.html', 58.29, 69.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOTHERBOARD-002', 'Gigabyte H610M S2H V3 DDR4', 'Carte Mère', 'https://www.ldlc.pro/fiche/PB00607356.html', 62.46, 74.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOTHERBOARD-003', 'ASRock B450M Pro4 R2.0', 'Carte Mère', 'https://www.ldlc.pro/fiche/PB00462746.html', 69.13, 82.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOTHERBOARD-004', 'ASRock A620M-HDV/M.2', 'Carte Mère', 'https://www.ldlc.pro/fiche/PB00552929.html', 83.29, 99.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOTHERBOARD-005', 'MSI PRO B760M-P DDR4', 'Carte Mère', 'https://www.ldlc.pro/fiche/PB00537254.html', 83.29, 99.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOTHERBOARD-006', 'ASRock B650M PG Lightning', 'Carte Mère', 'https://www.ldlc.pro/fiche/PB00592895.html', 116.63, 139.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOTHERBOARD-007', 'ASUS TUF GAMING B650-PLUS WIFI', 'Carte Mère', 'https://www.ldlc.pro/fiche/PB00520904.html', 181.63, 217.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOTHERBOARD-008', 'ASRock B860 PRO RS', 'Carte Mère', 'https://www.ldlc.pro/fiche/PB00671756.html', 149.96, 179.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOTHERBOARD-009', 'Gigabyte B850 AORUS ELITE WIFI7 ICE', 'Carte Mère', 'https://www.ldlc.pro/fiche/PB00660675.html', 199.96, 239.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOTHERBOARD-010', 'ASRock X870 Nova WiFi', 'Carte Mère', 'https://www.ldlc.pro/fiche/PB00703412.html', 299.96, 359.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-001', 'Logitech B110 Silent (Noir)', 'Souris', 'https://www.ldlc.pro/fiche/PB00256298.html', 9.96, 11.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-002', 'INOVU FM 1600 (Noir)', 'Souris', 'https://www.ldlc.pro/fiche/PB00654454.html', 6.63, 7.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-003', 'Advance Drift 2 Noir', 'Souris', 'https://www.ldlc.pro/fiche/PB00316126.html', 8.29, 9.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-004', 'Logitech M171 Wireless Mouse (Noir)', 'Souris', 'https://www.ldlc.pro/fiche/PB00214538.html', 13.29, 15.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-005', 'Logitech M220 Silent (Noir)', 'Souris', 'https://www.ldlc.pro/fiche/PB00214497.html', 16.63, 19.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-006', 'Logitech M240 Silent (Graphite)', 'Souris', 'https://www.ldlc.pro/fiche/PB00554020.html', 23.29, 27.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-007', 'ASUS TUF Gaming M3 Gen II', 'Souris', 'https://www.ldlc.pro/fiche/PB00569700.html', 33.29, 39.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-008', 'Logitech M650 (Graphite)', 'Souris', 'https://www.ldlc.pro/fiche/PB00480702.html', 33.29, 39.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-009', 'ASUS ROG Gladius II Core', 'Souris', 'https://www.ldlc.pro/fiche/PB00274106.html', 37.46, 44.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-010', 'Logitech MX Vertical', 'Souris', 'https://www.ldlc.pro/fiche/PB00256308.html', 83.29, 99.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-011', 'Logitech MX Master 3S (Graphite)', 'Souris', 'https://www.ldlc.pro/fiche/PB00500370.html', 74.96, 89.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-012', 'ASUS ROG Keris Wireless AimPoint (Blanc)', 'Souris', 'https://www.ldlc.pro/fiche/PB00536223.html', 74.96, 89.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-013', 'ASUS ROG Harpe Ace Noir (Aim Lab Edition)', 'Souris', 'https://www.ldlc.pro/fiche/PB00538830.html', 91.63, 109.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('MOUSE-014', 'ASUS ROG Harpe II Ace Noir', 'Souris', 'https://www.ldlc.pro/fiche/PB00697402.html', 149.96, 179.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('OPTICAL-001', 'Verbatim Graveur de CD/DVD externe USB 2.0', 'Lecteur Optique', 'https://www.ldlc.pro/fiche/PB00556044.html', 33.29, 39.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('OPTICAL-002', 'Verbatim Graveur de CD/DVD externe USB-C', 'Lecteur Optique', 'https://www.ldlc.pro/fiche/PB00556040.html', 37.46, 44.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('OPTICAL-003', 'ASUS SDRW-08D2S-U Lite Noir', 'Lecteur Optique', 'https://www.ldlc.pro/fiche/PB00123265.html', 39.13, 46.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('OPTICAL-004', 'ASUS SDRW-08U7M-U Argent', 'Lecteur Optique', 'https://www.ldlc.pro/fiche/PB00202674.html', 45.79, 54.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('OPTICAL-005', 'ASUS SDRW-08U7M-U Noir', 'Lecteur Optique', 'https://www.ldlc.pro/fiche/PB00202712.html', 49.12, 58.94);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('OPTICAL-006', 'ASUS ZenDrive U9M (USB-C/USB-A) Noir', 'Lecteur Optique', 'https://www.ldlc.pro/fiche/PB00237284.html', 49.96, 59.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('OPTICAL-007', 'ASUS ZenDrive V1M (USB-C)', 'Lecteur Optique', 'https://www.ldlc.pro/fiche/PB00481334.html', 58.29, 69.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('OPTICAL-008', 'Verbatim Graveur de Blu-ray externe USB-A', 'Lecteur Optique', 'https://www.ldlc.pro/fiche/PB00556082.html', 116.63, 139.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('OPTICAL-009', 'ASUS BW-16D1HT (Interne SATA)', 'Lecteur Optique', 'https://www.ldlc.pro/fiche/PB00152185.html', 99.96, 119.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('OS-001', 'Microsoft Windows 11 Pro', 'Système d''Exploitation', '', 166.63, 199.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('OS-002', 'Microsoft Windows 11 Famille', 'Système d''Exploitation', '', 133.29, 159.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('OS-003', 'Microsoft Windows Server 2025', 'Système d''Exploitation', '', 749.96, 899.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('OS-011', 'Red Hat Enterprise Linux', 'Système d''Exploitation', 'https://www.redhat.com/', 349.96, 419.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-001', 'be quiet! System Power 11 450W 80PLUS Bronze', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00686560.html', 54.13, 64.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-002', 'be quiet! Pure Power 12 550W 80PLUS Gold', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00652452.html', 72.46, 86.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-003', 'Corsair CX650 80PLUS Bronze (2023)', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00580851.html', 58.29, 69.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-004', 'be quiet! Pure Power 12 650W 80PLUS Gold', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00652455.html', 83.29, 99.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-005', 'Fox Spirit HG 650 80PLUS Gold', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00655467.html', 83.29, 99.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-006', 'Corsair RM650e (2025)', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00672682.html', 83.29, 99.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-007', 'be quiet! Pure Power 12 750W 80PLUS Gold', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00652457.html', 91.63, 109.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-008', 'Fox Spirit HG 750 80PLUS Gold', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00660347.html', 91.63, 109.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-009', 'Corsair RM750e (2025)', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00663403.html', 99.96, 119.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-010', 'be quiet! Pure Power 12 850W 80PLUS Gold', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00652458.html', 99.96, 119.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-011', 'Fox Spirit HG 850 80PLUS Gold', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00678200.html', 104.13, 124.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-012', 'be quiet! Pure Power 13 M 750W 80PLUS Gold', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00696819.html', 99.96, 119.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-013', 'Corsair RM850e (2025)', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00663406.html', 112.46, 134.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('POWER-014', 'be quiet! Straight Power 12 1200W Platinum', 'Alimentation', 'https://www.ldlc.pro/fiche/PB00557981.html', 224.96, 269.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SOUND-001', 'Nedis Carte Son 5.1 3D USB', 'Carte Son', 'https://www.ldlc.pro/fiche/PB00262751.html', 8.29, 9.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SOUND-002', 'DeLock Carte son externe USB-C', 'Carte Son', 'https://www.ldlc.pro/fiche/PB00677824.html', 9.92, 11.9);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SOUND-003', 'Dexlan Carte son USB-A', 'Carte Son', 'https://www.ldlc.pro/fiche/PB00260479.html', 12.46, 14.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SOUND-004', 'StarTech.com Carte son / Adaptateur USB vers audio stéréo', 'Carte Son', 'https://www.ldlc.pro/fiche/PB00241230.html', 24.96, 29.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SOUND-005', 'StarTech.com Carte son externe USB avec audio SPDIF numérique', 'Carte Son', 'https://www.ldlc.pro/fiche/PB00184041.html', 41.62, 49.94);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SOUND-006', 'Delock Carte son PCI Express 7.1', 'Carte Son', 'https://www.ldlc.pro/fiche/PB00685103.html', 58.29, 69.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SOUND-007', 'SteelSeries GameDAC Gen. 2 (PlayStation/Xbox)', 'Carte Son', 'https://www.ldlc.pro/fiche/PB00574289.html', 124.96, 149.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SPEAKERS-001', 'Advance SoundPhonic 2.0 4W', 'Enceintes', 'https://www.ldlc.pro/fiche/PB00241782.html', 12.46, 14.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SPEAKERS-002', 'Logitech S-150 Digital USB Speaker', 'Enceintes', 'https://www.ldlc.pro/fiche/PB00118575.html', 16.63, 19.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SPEAKERS-003', 'Mars Gaming MSCUBE (Noir)', 'Enceintes', 'https://www.ldlc.pro/fiche/PB00491049.html', 12.46, 14.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SPEAKERS-004', 'Advance SoundPhonic RGB 11W', 'Enceintes', 'https://www.ldlc.pro/fiche/PB00593376.html', 20.79, 24.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SPEAKERS-005', 'Edifier M1360 (Noir)', 'Enceintes', 'https://www.ldlc.pro/fiche/PB00228881.html', 33.29, 39.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SPEAKERS-006', 'Edifier R1280DB Noir', 'Enceintes', 'https://www.ldlc.pro/fiche/PB00240672.html', 91.63, 109.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SPEAKERS-007', 'Edifier R1700BT Noir', 'Enceintes', 'https://www.ldlc.pro/fiche/PB00248230.html', 116.63, 139.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SPEAKERS-008', 'Edifier QR30 Noir', 'Enceintes', 'https://www.ldlc.pro/fiche/PB00666808.html', 99.96, 119.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SPEAKERS-009', 'Edifier S2000MKIII', 'Enceintes', 'https://www.ldlc.pro/fiche/PB00576622.html', 333.29, 399.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('SPEAKERS-010', 'Logitech Multimedia Speakers System Z533', 'Enceintes', 'https://www.ldlc.pro/fiche/PB00191223.html', 116.63, 139.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('THERMAL-001', 'Arctic MX-4 2019 (4 grammes)', 'Pâte Thermique', 'https://www.ldlc.pro/fiche/PB00263073.html', 6.58, 7.9);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('THERMAL-002', 'Arctic MX-6 (4 grammes)', 'Pâte Thermique', 'https://www.ldlc.pro/fiche/PB00532873.html', 9.92, 11.9);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('THERMAL-003', 'Arctic MX-6 (8 grammes)', 'Pâte Thermique', 'https://www.ldlc.pro/fiche/PB00532874.html', 10.79, 12.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('THERMAL-004', 'Arctic Silver 5 (3.5 grammes)', 'Pâte Thermique', 'https://www.ldlc.pro/fiche/PB00021822.html', 12.46, 14.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('THERMAL-005', 'Noctua NT-H1 3.5g SW Edition', 'Pâte Thermique', 'https://www.ldlc.pro/fiche/PB00503867.html', 9.96, 11.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('THERMAL-006', 'Thermal Grizzly Hydronaut (3.9 grammes)', 'Pâte Thermique', 'https://www.ldlc.pro/fiche/PB00226201.html', 14.96, 17.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('THERMAL-007', 'Thermal Grizzly Conductonaut (1 gramme)', 'Pâte Thermique', 'https://www.ldlc.pro/fiche/PB00226255.html', 11.63, 13.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('THERMAL-008', 'Arctic MX-4 2019 (20 grammes)', 'Pâte Thermique', 'https://www.ldlc.pro/fiche/PB00263075.html', 12.46, 14.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('THERMAL-009', 'Polartherm X-10 (5G)', 'Pâte Thermique', 'https://www.ldlc.pro/fiche/PB00655354.html', 12.46, 14.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('THERMAL-010', 'be quiet! DC2 Pro (3 grammes)', 'Pâte Thermique', 'https://www.ldlc.pro/fiche/PB00542237.html', 14.96, 17.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('UPS-001', 'APC Back-UPS 500VA (BE500G2-FR)', 'Onduleur', 'https://www.ldlc.pro/fiche/PB00633134.html', 116.63, 139.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('UPS-002', 'APC Back-UPS 650VA (BE650G2-FR)', 'Onduleur', 'https://www.ldlc.pro/fiche/PB00339370.html', 112.46, 134.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('UPS-003', 'APC Back-UPS 750VA, 230V, AVR, prises FR', 'Onduleur', 'https://www.ldlc.pro/fiche/PB00406306.html', 104.13, 124.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('UPS-004', 'APC Back-UPS 850VA (BE850G2-FR)', 'Onduleur', 'https://www.ldlc.pro/fiche/PB00339369.html', 129.13, 154.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('UPS-005', 'APC Back-UPS 1200VA, 230V, AVR, prises FR', 'Onduleur', 'https://www.ldlc.pro/fiche/PB00406447.html', 149.96, 179.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('UPS-006', 'Eaton Ellipse ECO 500 FR', 'Onduleur', 'https://www.ldlc.pro/fiche/PB00115597.html', 79.13, 94.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('UPS-007', 'Eaton Ellipse ECO 650 FR', 'Onduleur', 'https://www.ldlc.pro/fiche/PB00115599.html', 87.46, 104.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('UPS-008', 'Eaton Ellipse PRO 650 FR', 'Onduleur', 'https://www.ldlc.pro/fiche/PB00152766.html', 141.63, 169.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('UPS-009', 'APC Back-UPS Pro 900G', 'Onduleur', 'https://www.ldlc.pro/fiche/PB00105725.html', 249.96, 299.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('UPS-010', 'APC Back-UPS Pro 1200VA', 'Onduleur', 'https://www.ldlc.pro/fiche/PB00109187.html', 358.29, 429.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('VIDEO-001', 'AMD Radeon Pro WX 3200', 'Carte Graphique', 'https://www.ldlc.pro/fiche/PB00482507.html', 133.29, 159.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('VIDEO-002', 'PNY NVIDIA RTX A400 4 GB', 'Carte Graphique', 'https://www.ldlc.pro/fiche/PB00612206.html', 187.46, 224.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('VIDEO-003', 'AMD Radeon Pro W6400', 'Carte Graphique', 'https://www.ldlc.pro/fiche/PB00482007.html', 249.96, 299.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('VIDEO-004', 'AMD Radeon Pro W7500', 'Carte Graphique', 'https://www.ldlc.pro/fiche/PB00570791.html', 458.29, 549.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('VIDEO-005', 'PNY Nvidia RTX 2000 Ada Generation', 'Carte Graphique', 'https://www.ldlc.pro/fiche/PB00609662.html', 683.29, 819.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('VIDEO-006', 'PNY Nvidia RTX 4000 Ada Generation', 'Carte Graphique', 'https://www.ldlc.pro/fiche/PB00571200.html', 1324.96, 1589.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('VIDEO-007', 'AMD Radeon Pro W7600', 'Carte Graphique', 'https://www.ldlc.pro/fiche/PB00570790.html', 616.63, 739.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('VIDEO-008', 'AMD Radeon Pro W7800', 'Carte Graphique', 'https://www.ldlc.pro/fiche/PB00555973.html', 2749.96, 3299.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('VIDEO-009', 'PNY Nvidia RTX 4500 Ada Generation', 'Carte Graphique', 'https://www.ldlc.pro/fiche/PB00571225.html', 2391.63, 2869.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('VIDEO-010', 'PNY Nvidia RTX 6000 ADA', 'Carte Graphique', 'https://www.ldlc.pro/fiche/PB00535970.html', 7099.96, 8519.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WEBCAM-001', 'Logitech HD Webcam C270', 'Webcam', 'https://www.ldlc.pro/fiche/PB00213751.html', 27.46, 32.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WEBCAM-002', 'Logitech HD Pro Webcam C920 Refresh', 'Webcam', 'https://www.ldlc.pro/fiche/PB00195707.html', 66.63, 79.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WEBCAM-003', 'Logitech BRIO 100 (Blanc)', 'Webcam', 'https://www.ldlc.pro/fiche/PB00571992.html', 33.29, 39.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WEBCAM-004', 'Logitech BRIO 300 (Graphite)', 'Webcam', 'https://www.ldlc.pro/fiche/PB00538742.html', 58.29, 69.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WEBCAM-005', 'Logitech BRIO 4K B2B', 'Webcam', 'https://www.ldlc.pro/fiche/PB00684421.html', 149.96, 179.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WEBCAM-006', 'Logitech MX BRIO Graphite', 'Webcam', 'https://www.ldlc.pro/fiche/PB00595075.html', 191.63, 229.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WEBCAM-007', 'Logitech BRIO 500 Blanc', 'Webcam', 'https://www.ldlc.pro/fiche/PB00516989.html', 99.96, 119.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WEBCAM-008', 'Elgato Facecam MK.2', 'Webcam', 'https://www.ldlc.pro/fiche/PB00607592.html', 133.29, 159.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WIRED-001', 'INOVU Adaptateur USB 3.0 vers Gigabit Ethernet', 'Carte Réseau Filaire', 'https://www.ldlc.pro/fiche/PB00544276.html', 16.63, 19.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WIRED-002', 'DeLock Carte réseau PCI Express avec Ethernet Gigabit', 'Carte Réseau Filaire', 'https://www.ldlc.pro/fiche/PB00678113.html', 49.96, 59.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WIRED-003', 'Intel i210-T1', 'Carte Réseau Filaire', 'https://www.ldlc.pro/fiche/PB00585520.html', 54.13, 64.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WIRED-004', 'DeLock Carte réseau PCI Express x4 avec 4x Ethernet Gigabit PoE+', 'Carte Réseau Filaire', 'https://www.ldlc.pro/fiche/PB00706209.html', 208.25, 249.9);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WIRED-005', 'Intel Ethernet I350 T2V2BLK (bulk)', 'Carte Réseau Filaire', 'https://www.ldlc.pro/fiche/PB00245865.html', 190.79, 228.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WIRED-006', 'DeLock Carte réseau PCI Express avec SFP+ 10 Gigabits', 'Carte Réseau Filaire', 'https://www.ldlc.pro/fiche/PB00678111.html', 91.63, 109.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WIRED-007', 'Lenovo ThinkSystem Broadcom 5720 1GbE RJ45 2-Port PCIe Ethernet Adapter', 'Carte Réseau Filaire', 'https://www.ldlc.pro/fiche/PB00578863.html', 141.63, 169.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WIRELESS-001', 'D-Link DWA-X582', 'Carte Réseau Sans Fil', 'https://www.ldlc.pro/fiche/PB00579120.html', 41.63, 49.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WIRELESS-002', 'Gigabyte GC-WB1733D-I', 'Carte Réseau Sans Fil', 'https://www.ldlc.pro/fiche/PB00256035.html', 33.29, 39.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WIRELESS-003', 'Gigabyte GC-WIFI7 (Rév. 1.0)', 'Carte Réseau Sans Fil', 'https://www.ldlc.pro/fiche/PB00587217.html', 55.79, 66.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WIRELESS-004', 'MSI AX1800 WiFi USB Adapter', 'Carte Réseau Sans Fil', 'https://www.ldlc.pro/fiche/PB00549780.html', 45.79, 54.95);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('WIRELESS-005', 'INOVU MBTAX900 - Clé USB Wi-Fi 6 / BT', 'Carte Réseau Sans Fil', 'https://www.ldlc.pro/fiche/PB00675651.html', 14.13, 16.96);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-001', 'Windows 11 Pro (OEM)', 'Logiciel', 'https://www.ldlc.pro/', 145.0, 174.0);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-002', 'Windows 11 Home (OEM)', 'Logiciel', 'https://www.ldlc.pro/', 109.0, 130.8);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-003', 'Microsoft 365 Business Standard (1 an)', 'Logiciel', 'https://www.microsoft.com/', 144.0, 172.8);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-004', 'Microsoft Office 2021', 'Logiciel', 'https://www.microsoft.com/', 149.0, 178.8);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-005', 'Kaspersky Small Office Security (5 postes)', 'Logiciel', 'https://www.kaspersky.fr/', 99.0, 118.8);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-006', 'Norton 360 Premium (5 appareils)', 'Logiciel', 'https://fr.norton.com/', 39.99, 47.99);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-007', 'Bitdefender GravityZone (10 postes)', 'Logiciel', 'https://www.bitdefender.fr/', 199.0, 238.8);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-008', 'Adobe Creative Cloud All Apps (1 an)', 'Logiciel', 'https://www.adobe.com/', 719.88, 863.86);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-009', 'CorelDRAW Graphics Suite', 'Logiciel', 'https://www.corel.com/', 549.0, 658.8);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-010', 'Autodesk AutoCAD (1 an)', 'Logiciel', 'https://www.autodesk.fr/', 2100.0, 2520.0);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-011', 'JAWS Professional (licence annuelle)', 'Logiciel', 'https://www.freedomscientific.com/', 995.0, 1194.0);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-012', 'NVDA (lecteur d''écran - GRATUIT)', 'Logiciel', 'https://www.nvaccess.org/', 0.0, 0.0);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-013', 'ZoomText Magnifier', 'Logiciel', 'https://www.freedomscientific.com/', 595.0, 714.0);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-014', 'VMware Workstation Pro', 'Logiciel', 'https://www.vmware.com/', 299.0, 358.8);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('LOG-015', 'Visual Studio Professional (1 an)', 'Logiciel', 'https://visualstudio.microsoft.com/', 539.0, 646.8);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('PER-001', 'Tablette graphique Wacom Intuos Pro M', 'Périphérique', 'https://www.ldlc.pro/', 349.0, 418.8);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('PER-002', 'Clavier Gros Caractères Contrastés (Accessibilité)', 'Périphérique', 'https://www.ldlc.pro/', 49.0, 58.8);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('NET-001', 'Switch Gigabit 48 ports TP-Link', 'Réseau', 'https://www.ldlc.pro/', 149.0, 178.8);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('NET-002', 'Routeur WiFi 6 TP-Link Archer AX73', 'Réseau', 'https://www.ldlc.pro/', 119.0, 142.8);
INSERT INTO composants (reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES ('CAB-001', 'Lot 50 câbles RJ45 Cat6a FTP 1m', 'Réseau', 'https://www.ldlc.pro/', 99.0, 118.8);

-- =============================================
-- TABLE: configurations PC
-- =============================================
CREATE TABLE configurations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(200) NOT NULL,
    description TEXT,
    image_path VARCHAR(255) DEFAULT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO configurations (id, nom, description) VALUES (1, 'PC Développement Pro', 'Configuration haute performance pour développeurs : AMD Ryzen 7, 32GB RAM DDR5, SSD NVMe 1TB, 2 écrans 27" QHD, logiciels professionnels');
INSERT INTO configurations (id, nom, description) VALUES (2, 'PC Design Graphique', 'Station de travail pour designers : AMD Ryzen 9 équivalent, 32GB RAM, GPU Pro, SSD 1TB, écran 4K 27", tablette Wacom, Adobe Creative Cloud');
INSERT INTO configurations (id, nom, description) VALUES (3, 'PC Bureautique Standard', 'Configuration bureautique pour Marketing et RH : Intel i5, 16GB RAM, SSD 500GB, écran 24" Full HD, périphériques standard');
INSERT INTO configurations (id, nom, description) VALUES (4, 'PC Support Client avec Accessibilité', 'Configuration adaptée handicap visuel : Intel i5, 16GB RAM, SSD 500GB, écran 24", clavier gros caractères, logiciel NVDA gratuit, casque professionnel');
INSERT INTO configurations (id, nom, description) VALUES (5, 'PC Infrastructure IT', 'Configuration pour administrateurs réseau : Intel i7 équivalent, 32GB RAM, SSD 1TB, 2 écrans 27", logiciels virtualisation et gestion réseau');
INSERT INTO configurations (id, nom, description) VALUES (6, 'PC Direction Executive', 'Configuration premium pour direction : AMD Ryzen 9 équivalent, 32GB RAM, SSD 2TB, GPU Pro, écran 4K 27", périphériques haut de gamme');

-- =============================================
-- TABLE: configuration_composants (LIAISON)
-- Relie les configurations aux composants par ID
-- =============================================
CREATE TABLE configuration_composants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    config_id INT NOT NULL,
    composant_id INT NOT NULL,
    quantite INT DEFAULT 1,
    FOREIGN KEY (config_id) REFERENCES configurations(id) ON DELETE CASCADE,
    FOREIGN KEY (composant_id) REFERENCES composants(id) ON DELETE CASCADE,
    UNIQUE KEY unique_config_composant (config_id, composant_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertion des liaisons configuration <-> composants

-- Composants pour: PC Développement Pro
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (1, 1, 27, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (2, 1, 87, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (3, 1, 69, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (4, 1, 52, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (5, 1, 124, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (6, 1, 12, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (7, 1, 20, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (8, 1, 73, 2);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (9, 1, 60, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (10, 1, 96, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (11, 1, 45, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (12, 1, 204, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (13, 1, 206, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (14, 1, 218, 1);

-- Composants pour: PC Design Graphique
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (15, 2, 28, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (16, 2, 87, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (17, 2, 69, 2);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (18, 2, 53, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (19, 2, 52, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (20, 2, 175, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (21, 2, 125, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (22, 2, 12, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (23, 2, 21, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (24, 2, 73, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (25, 2, 219, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (26, 2, 61, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (27, 2, 97, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (28, 2, 46, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (29, 2, 204, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (30, 2, 206, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (31, 2, 211, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (32, 2, 212, 1);

-- Composants pour: PC Bureautique Standard
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (33, 3, 26, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (34, 3, 86, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (35, 3, 68, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (36, 3, 52, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (37, 3, 123, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (38, 3, 13, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (39, 3, 20, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (40, 3, 72, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (41, 3, 60, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (42, 3, 96, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (43, 3, 184, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (44, 3, 204, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (45, 3, 206, 1);

-- Composants pour: PC Support Client avec Accessibilité
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (46, 4, 26, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (47, 4, 86, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (48, 4, 69, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (49, 4, 52, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (50, 4, 123, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (51, 4, 13, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (52, 4, 20, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (53, 4, 72, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (54, 4, 220, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (55, 4, 96, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (56, 4, 46, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (57, 4, 204, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (58, 4, 206, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (59, 4, 215, 1);

-- Composants pour: PC Infrastructure IT
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (60, 5, 28, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (61, 5, 87, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (62, 5, 69, 2);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (63, 5, 52, 2);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (64, 5, 124, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (65, 5, 12, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (66, 5, 20, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (67, 5, 73, 2);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (68, 5, 61, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (69, 5, 97, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (70, 5, 204, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (71, 5, 206, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (72, 5, 217, 1);

-- Composants pour: PC Direction Executive
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (73, 6, 28, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (74, 6, 87, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (75, 6, 69, 2);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (76, 6, 52, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (77, 6, 53, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (78, 6, 175, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (79, 6, 125, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (80, 6, 12, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (81, 6, 21, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (82, 6, 73, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (83, 6, 62, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (84, 6, 98, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (85, 6, 144, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (86, 6, 204, 1);
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES (87, 6, 206, 1);

-- =============================================
-- TABLE: actualites
-- =============================================
CREATE TABLE actualites (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(255) NOT NULL,
    contenu TEXT NOT NULL,
    auteur VARCHAR(100),
    image_path VARCHAR(255),
    visible BOOLEAN DEFAULT 1,
    date_publication TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_modification TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO actualites (titre, contenu, auteur, visible) VALUES
('Bienvenue sur TechSolutions', 'TechSolutions est fière de vous présenter son nouveau site internet. Découvrez nos services et notre expertise.', 'Direction', 1),
('Modernisation de notre infrastructure', 'Nous investissons dans 50 nouveaux postes de travail pour nos équipes, avec une attention particulière à l\'accessibilité. Nos configurations incluent des équipements adaptés pour le handicap visuel (clavier gros caractères, logiciel NVDA).', 'Infrastructure IT', 1),
('Nouveau département Design', 'Notre équipe Design s\'agrandit avec 5 nouveaux postes équipés de stations graphiques professionnelles : GPU Pro, tablettes Wacom, écrans 4K et suite Adobe Creative Cloud complète.', 'Design UX/UI', 1);

-- =============================================
-- TABLE: contacts
-- =============================================
CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    sujet VARCHAR(200),
    message TEXT NOT NULL,
    lu BOOLEAN DEFAULT 0,
    date_envoi TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- TABLE: clients (RGPD)
-- =============================================
CREATE TABLE clients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    telephone VARCHAR(20),
    entreprise VARCHAR(150),
    adresse TEXT,
    ville VARCHAR(100),
    code_postal VARCHAR(10),
    password VARCHAR(255) NOT NULL,
    rgpd_consent BOOLEAN DEFAULT 0,
    rgpd_consent_date TIMESTAMP NULL,
    date_inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    derniere_connexion TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- VUES UTILES
-- =============================================

-- Vue pour voir les composants de chaque configuration
CREATE VIEW vue_configuration_details AS
SELECT 
    cfg.id as config_id,
    cfg.nom as config_nom,
    c.id as composant_id,
    c.reference,
    c.libelle,
    c.categorie,
    cc.quantite,
    c.prix_ht,
    c.prix_ttc,
    (cc.quantite * c.prix_ht) as total_ht,
    (cc.quantite * c.prix_ttc) as total_ttc
FROM configurations cfg
JOIN configuration_composants cc ON cfg.id = cc.config_id
JOIN composants c ON cc.composant_id = c.id
ORDER BY cfg.id, c.categorie, c.libelle;

-- Vue pour calculer le prix total de chaque configuration
CREATE VIEW vue_prix_configurations AS
SELECT 
    cfg.id,
    cfg.nom,
    cfg.description,
    COUNT(cc.composant_id) as nb_composants,
    SUM(cc.quantite * c.prix_ht) as prix_total_ht,
    SUM(cc.quantite * c.prix_ttc) as prix_total_ttc
FROM configurations cfg
LEFT JOIN configuration_composants cc ON cfg.id = cc.config_id
LEFT JOIN composants c ON cc.composant_id = c.id
GROUP BY cfg.id, cfg.nom, cfg.description;

-- =============================================
-- RÉSUMÉ DE LA STRUCTURE
-- =============================================
-- Tables:
-- 1. admins (1 admin)
-- 2. services (7 départements)
-- 3. composants (223 produits/composants)
-- 4. configurations (6 configurations PC)
-- 5. configuration_composants (87 liaisons)
-- 6. actualites (3 actualités)
-- 7. contacts (vide)
-- 8. clients (vide, RGPD)
--
-- Vues:
-- 1. vue_configuration_details (détails complets)
-- 2. vue_prix_configurations (prix totaux)
--
-- AVANTAGE: Une seule source de vérité pour les composants
-- Les configurations référencent les composants par ID
-- Pas de duplication de données
-- =============================================
-- ===== AJOUT CONFIG 7 : PC PORTABLE DIRECTION =====

-- Composant : PC Portable Executive
INSERT INTO composants (id, reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES
(224, 'PORTABLE-001', 'PC Portable Executive 15.6" i7-1260P 32GB DDR5 1TB', 'Portable', 
 'Portable professionnel 15.6" Full HD IPS, Intel Core i7-1260P (12 cores), 32 GB DDR5, SSD 1 TB NVMe PCIe 4.0, GPU Intel Iris Xe, WiFi 6E, Thunderbolt 4, Webcam 1080p, autonomie 10h, châssis aluminium 1.8 kg, garantie 3 ans',
 2099.00, 2518.80);

-- Accessoires portables
INSERT INTO composants (id, reference, libelle, categorie, url, prix_ht, prix_ttc) VALUES
(225, 'ACC-PORT-001', 'Sacoche de transport professionnelle', 'Accessoire Portable',
 'Sacoche de transport renforcée pour portable 15.6", protection chocs, compartiments organisés',
 49.00, 58.80),

(226, 'ACC-PORT-002', 'Souris sans fil Logitech MX Anywhere 3', 'Accessoire Portable',
 'Souris sans fil Bluetooth, capteur 4000 DPI, autonomie 70 jours, compatible multi-OS',
 79.00, 94.80),

(227, 'ACC-PORT-003', 'Adaptateur HDMI/VGA multiport', 'Accessoire Portable',
 'Hub USB-C vers HDMI, VGA, USB 3.0, RJ45, compatible tous portables USB-C',
 39.00, 46.80);

-- Configuration 7
INSERT INTO configurations (id, nom, description, prix_ht, prix_ttc, type_usage, specifications_techniques) VALUES
(7, 'PC Portable Direction Executive', 
 'Portable haut de gamme 15.6" pour cadres dirigeants - Mobilité et performance professionnelle', 
 2499.00, 2998.80, 
 'Direction, cadres, commerciaux terrain, consultants, télétravail, présentations clients', 
 'Portable 15.6" Full HD IPS mat, Intel Core i7-1260P (12 cores: 4P+8E, 5.0 GHz), 32 GB DDR5-4800, SSD 1 TB NVMe PCIe 4.0, GPU Intel Iris Xe (96 EU), WiFi 6E, 2× Thunderbolt 4, HDMI 2.1, RJ45 Gigabit, Webcam 1080p avec obturateur, dual-array microphones AI, batterie 68 Wh (10h autonomie), charge rapide USB-C PD 100W, châssis aluminium 1.8 kg, certification MIL-STD-810H, clavier rétroéclairé résistant éclaboussures, garantie 3 ans on-site');

-- Liens configuration 7 avec composants
INSERT INTO configuration_composants (id, config_id, composant_id, quantite) VALUES
-- Portable principal
(88, 7, 224, 1),

-- Accessoires
(89, 7, 225, 1),  -- Sacoche
(90, 7, 226, 1),  -- Souris MX Anywhere 3
(91, 7, 227, 1),  -- Adaptateur HDMI/VGA

-- Logiciels (réutilisation composants existants)
(92, 7, 161, 1),  -- LOG-005: Kaspersky
(93, 7, 163, 1);  -- LOG-007: Bitdefender

-- Mise à jour vue
-- (les vues se mettent à jour automatiquement, pas besoin de code supplémentaire)

