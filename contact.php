<?php session_start(); ?>
<?php 
require_once 'includes/config.php';
$message = '';
if($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $stmt = $pdo->prepare("INSERT INTO contacts (nom, email, sujet, message) VALUES (?, ?, ?, ?)");
        $stmt->execute([trim($_POST['nom']), trim($_POST['email']), trim($_POST['sujet']), trim($_POST['message'])]);
        $message = 'Message envoyé avec succès';
    } catch(PDOException $e) {
        $message = 'Erreur: ' . $e->getMessage();
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
    <p>&copy; 2025 TechSolutions - Site réalisé par Lumni</p>
</footer>
</body>
</html>
