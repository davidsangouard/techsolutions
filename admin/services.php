<?php
require_once '../includes/config.php';
require_once '../includes/security.php';
if(!isset($_SESSION['admin_id'])) { header('Location: login.php'); exit; }

$message = '';
$messageType = '';

// CRÉER
if(isset($_POST['create_service'])) {
    try {
        $stmt = $pdo->prepare("INSERT INTO services (titre, description, ordre, visible) VALUES (?, ?, ?, ?)");
        $stmt->execute([
            trim($_POST['titre']),
            trim($_POST['description']),
            (int)$_POST['ordre'],
            isset($_POST['visible']) ? 1 : 0
        ]);
        $message = "Configuration créée avec succès";
        $messageType = 'success';
    } catch(PDOException $e) {
        $message = "Erreur: " . $e->getMessage();
        $messageType = 'error';
    }
}

// MODIFIER
if(isset($_POST['update_service'])) {
    try {
        $stmt = $pdo->prepare("UPDATE services SET titre=?, description=?, ordre=?, visible=? WHERE id=?");
        $stmt->execute([
            trim($_POST['titre']),
            trim($_POST['description']),
            (int)$_POST['ordre'],
            isset($_POST['visible']) ? 1 : 0,
            (int)$_POST['service_id']
        ]);
        $message = "Configuration mise à jour";
        $messageType = 'success';
    } catch(PDOException $e) {
        $message = "Erreur: " . $e->getMessage();
        $messageType = 'error';
    }
}

// SUPPRIMER
if(isset($_POST['delete_service'])) {
    try {
        $stmt = $pdo->prepare("DELETE FROM services WHERE id = ?");
        $stmt->execute([(int)$_POST['service_id']]);
        $message = "Configuration supprimée";
        $messageType = 'success';
    } catch(PDOException $e) {
        $message = "Erreur: " . $e->getMessage();
        $messageType = 'error';
    }
}

// Récupérer tous les services
$stmt = $pdo->query("SELECT * FROM services ORDER BY ordre ASC");
$services = $stmt->fetchAll();

// Édition
$editing_service = null;
if(isset($_GET['edit'])) {
    $stmt = $pdo->prepare("SELECT * FROM services WHERE id = ?");
    $stmt->execute([(int)$_GET['edit']]);
    $editing_service = $stmt->fetch();
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion Configurations - Admin</title>
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
    <h2 class="section-title">Gestion des Configurations Proposées</h2>
    
    <?php if($message): ?>
        <div class="message <?php echo $messageType; ?>"><?php echo htmlspecialchars($message); ?></div>
    <?php endif; ?>
    
    <?php if($editing_service): ?>
        <!-- MODE ÉDITION -->
        <div class="content-box">
            <h3>Edition: <?php echo htmlspecialchars($editing_service['titre']); ?></h3>
            <a href="services.php" class="btn-secondary">Retour à la liste</a>
            
            <form method="POST" style="margin-top:2rem;">
                <input type="hidden" name="service_id" value="<?php echo $editing_service['id']; ?>">
                
                <div class="form-group">
                    <label>Nom de la configuration:</label>
                    <input type="text" name="titre" value="<?php echo htmlspecialchars($editing_service['titre']); ?>" required placeholder="Ex: PC Développement Pro">
                </div>
                
                <div class="form-group">
                    <label>Description:</label>
                    <textarea name="description" rows="5" required placeholder="Décrivez les caractéristiques de cette configuration..."><?php echo htmlspecialchars($editing_service['description']); ?></textarea>
                </div>
                
                <div class="form-group">
                    <label>Ordre d'affichage:</label>
                    <input type="number" name="ordre" value="<?php echo $editing_service['ordre']; ?>" min="0">
                </div>
                
                <div class="form-group">
                    <label style="display:flex;align-items:center;gap:0.5rem;">
                        <input type="checkbox" name="visible" value="1" <?php echo $editing_service['visible'] ? 'checked' : ''; ?>>
                        <span>Visible sur le site</span>
                    </label>
                </div>
                
                <button type="submit" name="update_service" class="btn">Mettre à jour</button>
            </form>
        </div>
    <?php else: ?>
        <!-- MODE LISTE -->
        <div class="content-box">
            <h3>Créer une nouvelle configuration</h3>
            <form method="POST">
                <div class="form-group">
                    <label>Nom de la configuration:</label>
                    <input type="text" name="titre" required placeholder="Ex: PC Développement Pro">
                </div>
                <div class="form-group">
                    <label>Description:</label>
                    <textarea name="description" rows="5" required placeholder="Décrivez les caractéristiques de cette configuration..."></textarea>
                </div>
                <div class="form-group">
                    <label>Ordre d'affichage:</label>
                    <input type="number" name="ordre" value="<?php echo count($services) + 1; ?>" min="0">
                </div>
                <div class="form-group">
                    <label style="display:flex;align-items:center;gap:0.5rem;">
                        <input type="checkbox" name="visible" value="1" checked>
                        <span>Visible sur le site</span>
                    </label>
                </div>
                <button type="submit" name="create_service" class="btn">Créer</button>
            </form>
        </div>
        
        <div class="content-box">
            <h3>Liste des configurations (<?php echo count($services); ?>)</h3>
            <?php if(empty($services)): ?>
                <p>Aucune configuration.</p>
            <?php else: ?>
                <div class="services-grid">
                <?php foreach($services as $serv): ?>
                    <div class="service-card" style="position:relative;">
                        <div style="position:absolute;top:1rem;right:1rem;">
                            <span style="color:<?php echo $serv['visible'] ? '#0099FF' : '#ccc'; ?>;font-weight:bold;">
                                <?php echo $serv['visible'] ? 'Visible' : 'Masqué'; ?>
                            </span>
                        </div>
                        <h3><?php echo htmlspecialchars($serv['titre']); ?></h3>
                        <p><?php echo htmlspecialchars(substr($serv['description'], 0, 150)); ?>...</p>
                        <p style="margin-top:0.5rem;font-size:0.9rem;color:#666;">Ordre: <?php echo $serv['ordre']; ?></p>
                        <div class="btn-group">
                            <a href="services.php?edit=<?php echo $serv['id']; ?>" class="btn btn-small">Éditer</a>
                            <form method="POST" style="display:inline;" onsubmit="return confirm('Supprimer cette configuration ?');">
                                <input type="hidden" name="service_id" value="<?php echo $serv['id']; ?>">
                                <button type="submit" name="delete_service" class="btn-delete btn-small">Supprimer</button>
                            </form>
                        </div>
                    </div>
                <?php endforeach; ?>
                </div>
            <?php endif; ?>
        </div>
    <?php endif; ?>
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
