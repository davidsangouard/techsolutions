<?php 
session_start();
require_once 'includes/config.php';

$message = '';
$messageType = '';

if(isset($_POST['register'])) {
    try {
        // Validation
        if(empty($_POST['nom']) || empty($_POST['prenom']) || empty($_POST['email']) || empty($_POST['password'])) {
            throw new Exception("Tous les champs obligatoires doivent être remplis");
        }
        
        if($_POST['password'] !== $_POST['confirm_password']) {
            throw new Exception("Les mots de passe ne correspondent pas");
        }
        
        if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
            throw new Exception("Email invalide");
        }
        
        if(!isset($_POST['rgpd_consent'])) {
            throw new Exception("Vous devez accepter la politique de confidentialité");
        }
        
        // Vérifier si email existe
        $stmt = $pdo->prepare("SELECT id FROM clients WHERE email = ?");
        $stmt->execute([$_POST['email']]);
        if($stmt->fetch()) {
            throw new Exception("Un compte existe déjà avec cet email");
        }
        
        // Créer le compte
        $stmt = $pdo->prepare("INSERT INTO clients (nom, prenom, email, telephone, entreprise, adresse, ville, code_postal, password, rgpd_consent) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 1)");
        $stmt->execute([
            trim($_POST['nom']),
            trim($_POST['prenom']),
            trim($_POST['email']),
            trim($_POST['telephone']),
            trim($_POST['entreprise']),
            trim($_POST['adresse']),
            trim($_POST['ville']),
            trim($_POST['code_postal']),
            password_hash($_POST['password'], PASSWORD_DEFAULT)
        ]);
        
        $message = "Compte créé avec succès ! Vous pouvez maintenant vous connecter.";
        $messageType = 'success';
        
    } catch(Exception $e) {
        $message = "Erreur : " . $e->getMessage();
        $messageType = 'error';
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription - TechSolutions</title>
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

<div class="container">
    <h2 class="section-title">Créer un compte client</h2>
    
    <?php if($message): ?>
        <div class="message <?php echo $messageType; ?>"><?php echo htmlspecialchars($message); ?></div>
        <?php if($messageType === 'success'): ?>
            <p style="text-align:center;"><a href="client_login.php" class="btn">Se connecter</a></p>
        <?php endif; ?>
    <?php endif; ?>
    
    <div class="content-box" style="max-width:700px;margin:0 auto;">
        <form method="POST">
            <div class="form-group">
                <label>Nom *</label>
                <input type="text" name="nom" required>
            </div>
            
            <div class="form-group">
                <label>Prénom *</label>
                <input type="text" name="prenom" required>
            </div>
            
            <div class="form-group">
                <label>Email *</label>
                <input type="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label>Téléphone</label>
                <input type="tel" name="telephone">
            </div>
            
            <div class="form-group">
                <label>Entreprise</label>
                <input type="text" name="entreprise">
            </div>
            
            <div class="form-group">
                <label>Adresse</label>
                <textarea name="adresse" rows="3"></textarea>
            </div>
            
            <div class="form-group">
                <label>Ville</label>
                <input type="text" name="ville">
            </div>
            
            <div class="form-group">
                <label>Code Postal</label>
                <input type="text" name="code_postal">
            </div>
            
            <div class="form-group">
                <label>Mot de passe *</label>
                <input type="password" name="password" required minlength="6">
                <small>Minimum 6 caractères</small>
            </div>
            
            <div class="form-group">
                <label>Confirmer le mot de passe *</label>
                <input type="password" name="confirm_password" required>
            </div>
            
            <div class="form-group">
                <label style="display:flex;align-items:start;gap:0.5rem;">
                    <input type="checkbox" name="rgpd_consent" required style="margin-top:0.3rem;">
                    <span>J'accepte la politique de confidentialité et le traitement de mes données personnelles conformément au RGPD. Je comprends que je peux à tout moment modifier ou supprimer mes données depuis mon espace client. *</span>
                </label>
            </div>
            
            <button type="submit" name="register" class="btn">Créer mon compte</button>
            
            <p style="text-align:center;margin-top:1rem;">
                Déjà un compte ? <a href="client_login.php">Se connecter</a>
            </p>
        </form>
    </div>
</div>

<footer>
    <p>&copy; 2025 TechSolutions - Site réalisé par Lumni</p>
</footer>
</body>
</html>
