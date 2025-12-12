<?php 
session_start();
require_once 'includes/config.php';
require_once 'includes/security.php';

// Vérifier connexion
if(!isset($_SESSION['client_id'])) {
    header('Location: client_login.php');
    exit;
}

$message = '';
$messageType = '';

// Récupérer données client
$stmt = $pdo->prepare("SELECT * FROM clients WHERE id = ?");
$stmt->execute([$_SESSION['client_id']]);
$client = $stmt->fetch();

if(!$client) {
    session_destroy();
    header('Location: client_login.php');
    exit;
}

// MODIFIER DONNÉES
if(isset($_POST['update'])) {
    try {
        $stmt = $pdo->prepare("UPDATE clients SET nom=?, prenom=?, telephone=?, entreprise=?, adresse=?, ville=?, code_postal=? WHERE id=?");
        $stmt->execute([
            trim($_POST['nom']),
            trim($_POST['prenom']),
            trim($_POST['telephone']),
            trim($_POST['entreprise']),
            trim($_POST['adresse']),
            trim($_POST['ville']),
            trim($_POST['code_postal']),
            $_SESSION['client_id']
        ]);
        
        $message = "Vos données ont été mises à jour";
        $messageType = 'success';
        
        // Recharger les données
        $stmt = $pdo->prepare("SELECT * FROM clients WHERE id = ?");
        $stmt->execute([$_SESSION['client_id']]);
        $client = $stmt->fetch();
        
    } catch(Exception $e) {
        $message = "Erreur : " . $e->getMessage();
        $messageType = 'error';
    }
}

// CHANGER MOT DE PASSE
if(isset($_POST['change_password'])) {
    try {
        if(!password_verify($_POST['current_password'], $client['password'])) {
            throw new Exception("Mot de passe actuel incorrect");
        }
        
        if($_POST['new_password'] !== $_POST['confirm_new_password']) {
            throw new Exception("Les nouveaux mots de passe ne correspondent pas");
        }
        
        $stmt = $pdo->prepare("UPDATE clients SET password=? WHERE id=?");
        $stmt->execute([
            password_hash($_POST['new_password'], PASSWORD_DEFAULT),
            $_SESSION['client_id']
        ]);
        
        $message = "Mot de passe modifié avec succès";
        $messageType = 'success';
        
    } catch(Exception $e) {
        $message = "Erreur : " . $e->getMessage();
        $messageType = 'error';
    }
}

// SUPPRIMER COMPTE (DROIT À L'OUBLI - RGPD)
if(isset($_POST['delete_account'])) {
    if(isset($_POST['confirm_delete']) && $_POST['confirm_delete'] === 'SUPPRIMER') {
        try {
            $stmt = $pdo->prepare("DELETE FROM clients WHERE id = ?");
            $stmt->execute([$_SESSION['client_id']]);
            
            session_destroy();
            header('Location: index.php?deleted=1');
            exit;
            
        } catch(Exception $e) {
            $message = "Erreur : " . $e->getMessage();
            $messageType = 'error';
        }
    } else {
        $message = "Pour supprimer votre compte, tapez SUPPRIMER dans le champ de confirmation";
        $messageType = 'error';
    }
}

// DÉCONNEXION
if(isset($_GET['logout'])) {
    session_destroy();
    header('Location: index.php');
    exit;
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon Compte - TechSolutions</title>
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
                <li><a href="client_account.php">Mon Compte</a></li>
                <li><a href="?logout=1">Déconnexion</a></li>
            </ul>
        </nav>
    </div>
</header>

<div class="container">
    <h2 class="section-title">Mon Compte Client</h2>
    <p style="text-align:center;">Bienvenue, <?php echo htmlspecialchars($client['prenom'] . ' ' . $client['nom']); ?></p>
    
    <?php if($message): ?>
        <div class="message <?php echo $messageType; ?>"><?php echo htmlspecialchars($message); ?></div>
    <?php endif; ?>
    
    <!-- MES INFORMATIONS -->
    <div class="content-box">
        <h3>Mes Informations Personnelles</h3>
        <form method="POST">
            <div class="form-group">
                <label>Nom</label>
                <input type="text" name="nom" value="<?php echo htmlspecialchars($client['nom']); ?>" required>
            </div>
            
            <div class="form-group">
                <label>Prénom</label>
                <input type="text" name="prenom" value="<?php echo htmlspecialchars($client['prenom']); ?>" required>
            </div>
            
            <div class="form-group">
                <label>Email (non modifiable)</label>
                <input type="email" value="<?php echo htmlspecialchars($client['email']); ?>" disabled>
            </div>
            
            <div class="form-group">
                <label>Téléphone</label>
                <input type="tel" name="telephone" value="<?php echo htmlspecialchars($client['telephone']); ?>">
            </div>
            
            <div class="form-group">
                <label>Entreprise</label>
                <input type="text" name="entreprise" value="<?php echo htmlspecialchars($client['entreprise']); ?>">
            </div>
            
            <div class="form-group">
                <label>Adresse</label>
                <textarea name="adresse" rows="3"><?php echo htmlspecialchars($client['adresse']); ?></textarea>
            </div>
            
            <div class="form-group">
                <label>Ville</label>
                <input type="text" name="ville" value="<?php echo htmlspecialchars($client['ville']); ?>">
            </div>
            
            <div class="form-group">
                <label>Code Postal</label>
                <input type="text" name="code_postal" value="<?php echo htmlspecialchars($client['code_postal']); ?>">
            </div>
            
            <button type="submit" name="update" class="btn">Mettre à jour</button>
        </form>
    </div>
    
    <!-- CHANGER MOT DE PASSE -->
    <div class="content-box">
        <h3>Changer mon Mot de Passe</h3>
        <form method="POST">
            <div class="form-group">
                <label>Mot de passe actuel</label>
                <input type="password" name="current_password" required>
            </div>
            
            <div class="form-group">
                <label>Nouveau mot de passe</label>
                <input type="password" name="new_password" required minlength="6">
            </div>
            
            <div class="form-group">
                <label>Confirmer nouveau mot de passe</label>
                <input type="password" name="confirm_new_password" required>
            </div>
            
            <button type="submit" name="change_password" class="btn">Changer le mot de passe</button>
        </form>
    </div>
    
    <!-- INFORMATIONS RGPD -->
    <div class="content-box">
        <h3>Mes Données et le RGPD</h3>
        <p><strong>Date d'inscription :</strong> <?php echo date('d/m/Y', strtotime($client['date_inscription'])); ?></p>
        <p><strong>Dernière connexion :</strong> <?php echo $client['derniere_connexion'] ? date('d/m/Y à H:i', strtotime($client['derniere_connexion'])) : 'Première connexion'; ?></p>
        <p><strong>Consentement RGPD :</strong> Accordé le <?php echo date('d/m/Y', strtotime($client['rgpd_consent_date'])); ?></p>
        
        <h4 style="margin-top:2rem;">Vos droits RGPD</h4>
        <ul style="line-height:1.8; list-style-type: none; padding-left: 0;">
            <li><strong>Droit d'accès :</strong> Vous pouvez consulter toutes vos données ci-dessus</li>
            <li><strong>Droit de rectification :</strong> Vous pouvez modifier vos données à tout moment</li>
            <li><strong>Droit à l'oubli :</strong> Vous pouvez supprimer votre compte (voir ci-dessous)</li>
            <li><strong>Droit à la portabilité :</strong> Contactez-nous pour obtenir vos données</li>
        </ul>
    </div>
    
    <!-- SUPPRIMER COMPTE -->
    <div class="content-box" style="border:2px solid #dc3545;">
        <h3 style="color:#dc3545;">Zone Dangereuse - Supprimer mon Compte</h3>
        <p><strong>Attention :</strong> Cette action est irréversible. Toutes vos données seront définitivement supprimées de nos serveurs conformément au RGPD (droit à l'oubli).</p>
        
        <form method="POST" onsubmit="return confirm('Êtes-vous VRAIMENT sûr de vouloir supprimer votre compte ? Cette action est irréversible !');">
            <div class="form-group">
                <label>Pour confirmer, tapez "SUPPRIMER" (en majuscules) :</label>
                <input type="text" name="confirm_delete" required>
            </div>
            
            <button type="submit" name="delete_account" class="btn-delete">Supprimer définitivement mon compte</button>
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
