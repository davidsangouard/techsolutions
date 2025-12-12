<?php 
session_start();
require_once 'includes/config.php';
require_once 'includes/security.php';

// Déjà connecté ?
if(isset($_SESSION['client_id'])) {
    header('Location: client_account.php');
    exit;
}

$message = '';

if(isset($_POST['login'])) {
    try {
        if(empty($_POST['email']) || empty($_POST['password'])) {
            throw new Exception("Email et mot de passe requis");
        }
        
        $stmt = $pdo->prepare("SELECT * FROM clients WHERE email = ?");
        $stmt->execute([$_POST['email']]);
        $client = $stmt->fetch();
        
        if(!$client || !password_verify($_POST['password'], $client['password'])) {
            throw new Exception("Email ou mot de passe incorrect");
        }
        
        // Mettre à jour dernière connexion
        $stmt = $pdo->prepare("UPDATE clients SET derniere_connexion = NOW() WHERE id = ?");
        $stmt->execute([$client['id']]);
        
        // Session
        $_SESSION['client_id'] = $client['id'];
        $_SESSION['client_nom'] = $client['nom'] . ' ' . $client['prenom'];
        $_SESSION['client_email'] = $client['email'];
        
        header('Location: client_account.php');
        exit;
        
    } catch(Exception $e) {
        $message = $e->getMessage();
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion Client - TechSolutions</title>
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
                <li><a href="client_login.php">Espace Client</a></li>
                <li><a href="admin/login.php">Admin</a></li>
            </ul>
        </nav>
    </div>
</header>

<div class="container">
    <h2 class="section-title">Espace Client</h2>
    
    <?php if($message): ?>
        <div class="message error"><?php echo htmlspecialchars($message); ?></div>
    <?php endif; ?>
    
    <div class="content-box" style="max-width:500px;margin:0 auto;">
        <h3>Connexion</h3>
        <form method="POST">
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label>Mot de passe</label>
                <input type="password" name="password" required>
            </div>
            
            <button type="submit" name="login" class="btn">Se connecter</button>
            
            <p style="text-align:center;margin-top:1rem;">
                Pas encore de compte ? <a href="client_register.php">S'inscrire</a>
            </p>
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
