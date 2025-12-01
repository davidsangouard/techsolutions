<?php require_once 'includes/config.php'; ?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualités - TechSolutions</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <div class="header-content">
            <div class="logo">
                <h1>TechSolutions</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="index.php">Accueil</a></li>
                    <li><a href="actualites.php">Actualités</a></li>
                    <li><a href="contact.php">Contact</a></li>
                    <li><a href="devis.php">Créer un Devis</a></li>
                    <li><a href="admin/login.php">Admin</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <section class="hero">
        <div class="container">
            <h2>Nos Actualités</h2>
            <p>Restez informé de nos dernières nouveautés</p>
        </div>
    </section>

    <div class="container">
        <div class="actualites">
            <?php
            try {
                $stmt = $pdo->query("SELECT * FROM actualites WHERE statut = 'publie' ORDER BY date_publication DESC");
                $actualites = $stmt->fetchAll();
                
                if (count($actualites) > 0) {
                    foreach ($actualites as $actu) {
                        echo '<div class="actualite">';
                        echo '<h3>' . htmlspecialchars($actu['titre']) . '</h3>';
                        echo '<p class="date">Publié le ' . date('d/m/Y', strtotime($actu['date_publication'])) . '</p>';
                        echo '<p>' . nl2br(htmlspecialchars($actu['contenu'])) . '</p>';
                        echo '</div>';
                    }
                } else {
                    echo '<p>Aucune actualité disponible pour le moment.</p>';
                }
            } catch(PDOException $e) {
                echo '<p class="message error">Erreur lors du chargement des actualités.</p>';
            }
            ?>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 TechSolutions - Tous droits réservés</p>
        <p><a href="mentions-legales.php">Mentions légales</a> | <a href="politique-rgpd.php">Politique de confidentialité</a></p>
    </footer>
</body>
</html>
