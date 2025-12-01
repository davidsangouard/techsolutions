#!/bin/bash

# Copier le CSS
cp /home/claude/techsolutions/css/style.css css/

# Config
cat > includes/config.php << 'ENDPHP'
<?php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'techsolutions');
define('SITE_NAME', 'TechSolutions');
define('TVA_RATE', 0.20);
try {
    $pdo = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME.";charset=utf8mb4", DB_USER, DB_PASS, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false
    ]);
} catch(PDOException $e) {
    die("Erreur DB : " . $e->getMessage());
}
if (session_status() === PHP_SESSION_NONE) { session_start(); }
?>
ENDPHP

# Index
cat > index.php << 'ENDPHP'
<?php require_once 'includes/config.php'; ?>
<!DOCTYPE html><html lang="fr"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>TechSolutions - Configurations PC par Service</title><link rel="stylesheet" href="css/style.css"></head><body>
<header><div class="header-content"><div class="logo"><h1>TechSolutions</h1></div><nav><ul><li><a href="index.php">Accueil</a></li><li><a href="configurations.php">Configurations PC</a></li><li><a href="actualites.php">Actualités</a></li><li><a href="contact.php">Contact</a></li><li><a href="admin/login.php">Admin</a></li></ul></nav></div></header>
<section class="hero"><div class="container"><h2>Configurations PC Professionnelles par Service</h2><p>Des PC optimisés pour chaque département de votre entreprise</p></div></section>
<div class="container"><h2>Nos Services</h2><div class="services">
<div class="service-card"><h3>Développement logiciel</h3><p>PC puissants pour compilation et tests. <a href="configurations.php#dev">Voir les configs →</a></p></div>
<div class="service-card"><h3>Design UX/UI</h3><p>Stations graphiques avec écrans calibrés. <a href="configurations.php#design">Voir les configs →</a></p></div>
<div class="service-card"><h3>Infrastructure IT</h3><p>PC robustes pour administration système. <a href="configurations.php#infra">Voir les configs →</a></p></div>
<div class="service-card"><h3>Marketing et vente</h3><p>Configuration bureautique performante. <a href="configurations.php#marketing">Voir les configs →</a></p></div>
<div class="service-card"><h3>Support Client</h3><p>PC optimisés pour le support technique. <a href="configurations.php#support">Voir les configs →</a></p></div>
<div class="service-card"><h3>Direction</h3><p>Configurations premium haut de gamme. <a href="configurations.php#direction">Voir les configs →</a></p></div>
</div>
<div class="content-box" style="margin-top:3rem;"><h2>Pourquoi nos configurations ?</h2><p>✅ <strong>Adaptées à chaque métier</strong> - Chaque configuration est optimisée pour les besoins spécifiques du service</p><p>✅ <strong>Composants sélectionnés</strong> - Plus de 200 composants professionnels dans notre catalogue</p><p>✅ <strong>Prix transparents</strong> - Détail complet des composants avec prix HT et TTC</p><p>✅ <strong>Devis instantané</strong> - Téléchargez votre devis en CSV en un clic</p></div>
</div>
<footer><p>&copy; 2025 TechSolutions - Tous droits réservés</p><p><a href="mentions-legales.php">Mentions légales</a> | <a href="politique-rgpd.php">Politique RGPD</a></p></footer>
</body></html>
ENDPHP

echo "Fichiers de base créés"
