<?php
require_once '../includes/config.php';
require_once '../includes/security.php';
if(!isset($_SESSION['admin_id'])) { header('Location: login.php'); exit; }
$stats = [
    'configs' => $pdo->query("SELECT COUNT(*) FROM configurations")->fetchColumn(),
    'composants' => $pdo->query("SELECT COUNT(*) FROM composants")->fetchColumn(),
    'services' => $pdo->query("SELECT COUNT(*) FROM services")->fetchColumn(),
    'actualites' => $pdo->query("SELECT COUNT(*) FROM actualites")->fetchColumn(),
    'messages' => $pdo->query("SELECT COUNT(*) FROM contacts WHERE lu = 0")->fetchColumn()
];
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Admin</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<header>
    <div class="header-content">
        <div class="logo">
            <img src="../images/logo/logo.png" alt="TechSolutions">
        </div>
        <nav>
            <ul>
                <li><a href="dashboard.php">Dashboard</a></li>
                <li><a href="configurations.php">Configurations</a></li>
                <li><a href="services.php">Services</a></li>
                <li><a href="actualites.php">Actualités</a></li>
                <li><a href="contacts.php">Messages</a></li>
                <li><a href="logout.php">Déconnexion</a></li>
            </ul>
        </nav>
    </div>
</header>
<div class="container">
    <h2 class="section-title">Tableau de bord</h2>
    <p style="text-align:center;">Bienvenue, <?php echo htmlspecialchars($_SESSION['admin_username']); ?></p>
    <div class="dashboard">
        <div class="stat-card">
            <h3><?php echo $stats['configs']; ?></h3>
            <p>Configurations</p>
        </div>
        <div class="stat-card">
            <h3><?php echo $stats['composants']; ?></h3>
            <p>Composants</p>
        </div>
        <div class="stat-card">
            <h3><?php echo $stats['services']; ?></h3>
            <p>Services</p>
        </div>
        <div class="stat-card">
            <h3><?php echo $stats['actualites']; ?></h3>
            <p>Actualités</p>
        </div>
        <div class="stat-card">
            <h3><?php echo $stats['messages']; ?></h3>
            <p>Messages non lus</p>
        </div>
    </div>
    <div class="content-box">
        <h3>Actions rapides</h3>
        <a href="configurations.php" class="btn">Gérer les configurations</a>
        <a href="services.php" class="btn" style="margin-left:1rem;">Gérer les services</a>
        <a href="actualites.php" class="btn" style="margin-left:1rem;">Gérer les actualités</a>
        <a href="contacts.php" class="btn" style="margin-left:1rem;">Voir les messages</a>
    </div>
</div>
<footer>
    <p>&copy; 2025 TechSolutions - Tous droits réservés</p>
    <p style="font-size:0.9em;color:#0066CC;margin-top:0.5rem;">
        Site web développé par <strong>Lumni</strong> - Digital Solutions Provider
    </p>
    <p style="font-size:0.85em;margin-top:0.5rem;">
        <a href="../mentions_legales.php" style="color:#666;margin:0 1rem;">Mentions légales</a>
        <a href="../politique_confidentialite.php" style="color:#666;margin:0 1rem;">Politique de confidentialité</a>
    </p>
</footer>
</body>
</html>
