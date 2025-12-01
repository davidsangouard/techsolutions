<?php 
require_once 'includes/config.php';

$message = '';
$messageType = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nom = trim($_POST['nom'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $sujet = trim($_POST['sujet'] ?? '');
    $messageContact = trim($_POST['message'] ?? '');
    
    if (empty($nom) || empty($email) || empty($messageContact)) {
        $message = 'Veuillez remplir tous les champs obligatoires.';
        $messageType = 'error';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $message = 'Adresse email invalide.';
        $messageType = 'error';
    } else {
        try {
            $stmt = $pdo->prepare("INSERT INTO contacts (nom, email, sujet, message) VALUES (?, ?, ?, ?)");
            $stmt->execute([$nom, $email, $sujet, $messageContact]);
            $message = 'Votre message a été envoyé avec succès.';
            $messageType = 'success';
        } catch(PDOException $e) {
            $message = 'Une erreur est survenue.';
            $messageType = 'error';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact - TechSolutions</title>
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
            <h2>Contactez-Nous</h2>
            <p>Une question ? N'hésitez pas à nous contacter</p>
        </div>
    </section>

    <div class="container">
        <div class="content-box">
            <?php if ($message): ?>
                <div class="message <?php echo $messageType; ?>">
                    <?php echo htmlspecialchars($message); ?>
                </div>
            <?php endif; ?>

            <form method="POST" action="">
                <div class="form-group">
                    <label for="nom">Nom * :</label>
                    <input type="text" id="nom" name="nom" required>
                </div>

                <div class="form-group">
                    <label for="email">Email * :</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="sujet">Sujet :</label>
                    <select id="sujet" name="sujet">
                        <option value="">-- Sélectionnez --</option>
                        <option value="Demande de devis">Demande de devis</option>
                        <option value="Information">Information</option>
                        <option value="Support technique">Support technique</option>
                        <option value="Autre">Autre</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="message">Message * :</label>
                    <textarea id="message" name="message" required></textarea>
                </div>

                <button type="submit">Envoyer</button>
            </form>

            <div style="margin-top: 3rem; padding-top: 2rem; border-top: 1px solid #eee;">
                <h3>Informations</h3>
                <p><strong>Adresse :</strong> 12 rue des Innovateurs, 19100 Brive-la-Gaillarde</p>
                <p><strong>Téléphone :</strong> +33 (0)5 55 00 00 00</p>
                <p><strong>Email :</strong> contact@techsolutions.fr</p>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 TechSolutions - Tous droits réservés</p>
        <p><a href="mentions-legales.php">Mentions légales</a> | <a href="politique-rgpd.php">Politique de confidentialité</a></p>
    </footer>
</body>
</html>
