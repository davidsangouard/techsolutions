-- ===== AJOUT CONFIG 7 : PC PORTABLE DIRECTION =====

-- Composant : PC Portable Executive
INSERT INTO composants (id, reference, libelle, categorie, description, prix_ht, prix_ttc) VALUES
(224, 'PORTABLE-001', 'PC Portable Executive 15.6" i7-1260P 32GB DDR5 1TB', 'Portable', 
 'Portable professionnel 15.6" Full HD IPS, Intel Core i7-1260P (12 cores), 32 GB DDR5, SSD 1 TB NVMe PCIe 4.0, GPU Intel Iris Xe, WiFi 6E, Thunderbolt 4, Webcam 1080p, autonomie 10h, châssis aluminium 1.8 kg, garantie 3 ans',
 2099.00, 2518.80);

-- Accessoires portables
INSERT INTO composants (id, reference, libelle, categorie, description, prix_ht, prix_ttc) VALUES
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

