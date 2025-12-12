<?php 
session_start(); 
require_once 'includes/config.php';
require_once 'includes/security.php';

$message = '';
$message_type = '';

if($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        // Validation et nettoyage des données
        $nom = clean_input($_POST['nom'] ?? '', 100);
        $email = validate_email($_POST['email'] ?? '');
        $sujet = clean_input($_POST['sujet'] ?? '', 200);
        $message_text = clean_input($_POST['message'] ?? '', 5000);
        
        // Vérifications
        if (empty($nom) || strlen($nom) < 2) {
            throw new Exception("Le nom doit contenir au moins 2 caractères");
        }
        
        if (!$email) {
            throw new Exception("Email invalide");
        }
        
        if (empty($message_text) || strlen($message_text) < 10) {
            throw new Exception("Le message doit contenir au moins 10 caractères");
        }
        
        // Insertion sécurisée
        $stmt = $pdo->prepare("INSERT INTO contacts (nom, email, sujet, message) VALUES (?, ?, ?, ?)");
        $stmt->execute([$nom, $email, $sujet, $message_text]);
        
        $message = 'Message envoyé avec succès';
        $message_type = 'success';
        
    } catch(Exception $e) {
        $message = $e->getMessage();
        $message_type = 'error';
        log_security_event('CONTACT_ERROR', $message);
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Contact - TechSolutions</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
    <div class="header-content">
        <div class="logo">
            <img src="images/logo/logo.png" alt="TechSolutions">
        </div>
        <nav>
            <ul>
                <li><a href="index.php">Accueil</a></li>
                <li><a href="services_public.php">Services</a></li>
                <li><a href="about.php">À Propos</a></li>
                <li><a href="contact.php">Contact</a></li>
                <?php if(isset($_SESSION['client_id'])): ?>
                    <li><a href="client_account.php">Mon Compte</a></li>
                <?php else: ?>
                    <li><a href="client_login.php">Espace Client</a></li>
                <?php endif; ?>
                <li><a href="admin/login.php">Admin</a></li>
            </ul>
        </nav>
    </div>
</header>

<section class="hero" style="padding: 4rem 2rem;">
    <h2>Contactez-nous</h2>
    <p>Une question ? N'hésitez pas à nous écrire</p>
</section>

<div class="container">
    <div class="content-box">
        <?php if($message): ?>
            <div class="message <?php echo strpos($message, 'succès') !== false ? 'success' : 'error'; ?>">
                <?php echo htmlspecialchars($message); ?>
            </div>
        <?php endif; ?>
        
        <form method="POST">
            <div class="form-group">
                <label>Nom :</label>
                <input type="text" name="nom" value="<?php echo isset($_SESSION['client_nom']) ? htmlspecialchars($_SESSION['client_nom']) : ''; ?>" required <?php echo isset($_SESSION['client_id']) ? 'readonly' : ''; ?>>
            </div>
            <div class="form-group">
                <label>Email :</label>
                <input type="email" name="email" value="<?php echo isset($_SESSION['client_email']) ? htmlspecialchars($_SESSION['client_email']) : ''; ?>" required <?php echo isset($_SESSION['client_id']) ? 'readonly' : ''; ?>>
            </div>
            <div class="form-group">
                <label>Sujet :</label>
                <input type="text" name="sujet">
            </div>
            <div class="form-group">
                <label>Message :</label>
                <textarea name="message" required></textarea>
            </div>
            <button type="submit" class="btn">Envoyer</button>
        </form>
    </div>
</div>

<footer>
    <p>&copy; 2025 TechSolutions - Tous droits réservés</p>
    <p style="font-size:0.9em;color:#0066CC;margin-top:0.5rem;">
        Site web développé par <strong>Lumni</strong> - Digital Solutions Provider
    </p>
    <p style="font-size:0.85em;margin-top:0.5rem;">
        <a href="mentions_legales.php" style="color:#666;margin:0 1rem;">Mentions légales</a>
        <a href="politique_confidentialite.php" style="color:#666;margin:0 1rem;">Politique de confidentialité</a>
    </p>
</footer>
</body>
</html>
