<?php
require_once '../includes/config.php';
require_once '../includes/security.php';
require_once '../includes/upload_securise.php';
if(!isset($_SESSION['admin_id'])) { header('Location: login.php'); exit; }

$message = '';
$messageType = '';

// CRÉER
if(isset($_POST['create_actualite'])) {
    try {
        $image_path = null;
        if(isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
            $upload_result = upload_image_securise($_FILES['image'], '../images/actualites');
            if($upload_result['success']) {
                $image_path = 'images/actualites/' . $upload_result['filename'];
            } else {
                throw new Exception($upload_result['error']);
            }
        }
        $visible = isset($_POST['visible']) ? 1 : 0;
        $stmt = $pdo->prepare("INSERT INTO actualites (titre, contenu, image_path, auteur, visible) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([trim($_POST['titre']), trim($_POST['contenu']), $image_path, trim($_POST['auteur']), $visible]);
        $message = "Actualité créée avec succès";
        $messageType = 'success';
    } catch(Exception $e) {
        $message = "Erreur: " . $e->getMessage();
        $messageType = 'error';
    }
}

// MODIFIER
if(isset($_POST['update_actualite'])) {
    try {
        $actu_id = (int)$_POST['actu_id'];
        $image_path = $_POST['current_image'];
        if(isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
            $upload_result = upload_image_securise($_FILES['image'], '../images/actualites');
            if($upload_result['success']) {
                // Supprimer ancienne image
                if($image_path && file_exists('../' . $image_path)) {
                    delete_image_securise('../' . $image_path);
                }
                $image_path = 'images/actualites/' . $upload_result['filename'];
            } else {
                throw new Exception($upload_result['error']);
            }
        }
        $visible = isset($_POST['visible']) ? 1 : 0;
        $stmt = $pdo->prepare("UPDATE actualites SET titre=?, contenu=?, image_path=?, auteur=?, visible=? WHERE id=?");
        $stmt->execute([trim($_POST['titre']), trim($_POST['contenu']), $image_path, trim($_POST['auteur']), $visible, $actu_id]);
        $message = "Actualité mise à jour";
        $messageType = 'success';
    } catch(Exception $e) {
        $message = "Erreur: " . $e->getMessage();
        $messageType = 'error';
    }
}

// SUPPRIMER
if(isset($_POST['delete_actualite'])) {
    try {
        $actu_id = (int)$_POST['actu_id'];
        $stmt = $pdo->prepare("SELECT image_path FROM actualites WHERE id = ?");
        $stmt->execute([$actu_id]);
        $actu = $stmt->fetch();
        if($actu && $actu['image_path'] && file_exists('../' . $actu['image_path'])) {
            unlink('../' . $actu['image_path']);
        }
        $stmt = $pdo->prepare("DELETE FROM actualites WHERE id = ?");
        $stmt->execute([$actu_id]);
        $message = "Actualité supprimée";
        $messageType = 'success';
    } catch(PDOException $e) {
        $message = "Erreur: " . $e->getMessage();
        $messageType = 'error';
    }
}

$stmt = $pdo->query("SELECT * FROM actualites ORDER BY date_publication DESC");
$actualites = $stmt->fetchAll();

$editing_actu = null;
if(isset($_GET['edit'])) {
    $edit_id = (int)$_GET['edit'];
    $stmt = $pdo->prepare("SELECT * FROM actualites WHERE id = ?");
    $stmt->execute([$edit_id]);
    $editing_actu = $stmt->fetch();
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion Actualités - Admin</title>
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
    <h2 class="section-title">Gestion des Actualités</h2>
    
    <?php if($message): ?>
        <div class="message <?php echo $messageType; ?>"><?php echo htmlspecialchars($message); ?></div>
    <?php endif; ?>
    
    <?php if($editing_actu): ?>
        <!-- MODE ÉDITION -->
        <div class="content-box">
            <h3>Edition: <?php echo htmlspecialchars($editing_actu['titre']); ?></h3>
            <a href="actualites.php" class="btn-secondary">Retour à la liste</a>
            
            <form method="POST" enctype="multipart/form-data" style="margin-top:2rem;">
                <input type="hidden" name="actu_id" value="<?php echo $editing_actu['id']; ?>">
                <input type="hidden" name="current_image" value="<?php echo htmlspecialchars($editing_actu['image_path']); ?>">
                
                <div class="form-group">
                    <label>Titre:</label>
                    <input type="text" name="titre" value="<?php echo htmlspecialchars($editing_actu['titre']); ?>" required>
                </div>
                
                <div class="form-group">
                    <label>Contenu:</label>
                    <textarea name="contenu" rows="10" required><?php echo htmlspecialchars($editing_actu['contenu']); ?></textarea>
                </div>
                
                <div class="form-group">
                    <label>Auteur:</label>
                    <input type="text" name="auteur" value="<?php echo htmlspecialchars($editing_actu['auteur']); ?>">
                </div>
                
                <div class="form-group">
                    <label>Image:</label>
                    <?php if($editing_actu['image_path']): ?>
                        <div class="image-preview">
                            <img src="../<?php echo htmlspecialchars($editing_actu['image_path']); ?>" alt="Image">
                        </div>
                    <?php endif; ?>
                    <input type="file" name="image" accept="image/*">
                </div>
                
                <div class="form-group">
                    <label style="display:block;">
                        <input type="checkbox" name="visible" value="1" <?php echo $editing_actu['visible'] ? 'checked' : ''; ?> style="margin-right:0.5rem;">
                        Visible sur le site
                    </label>
                </div>
                
                <button type="submit" name="update_actualite" class="btn">Mettre à jour</button>
            </form>
        </div>
    <?php else: ?>
        <!-- MODE LISTE -->
        <div class="content-box">
            <h3>Créer une nouvelle actualité</h3>
            <form method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Titre:</label>
                    <input type="text" name="titre" required>
                </div>
                <div class="form-group">
                    <label>Contenu:</label>
                    <textarea name="contenu" rows="10" required></textarea>
                </div>
                <div class="form-group">
                    <label>Auteur:</label>
                    <input type="text" name="auteur" value="TechSolutions">
                </div>
                <div class="form-group">
                    <label>Image:</label>
                    <input type="file" name="image" accept="image/*">
                </div>
                <div class="form-group">
                    <label style="display:block;">
                        <input type="checkbox" name="visible" value="1" checked style="margin-right:0.5rem;">
                        Visible sur le site
                    </label>
                </div>
                <button type="submit" name="create_actualite" class="btn">Créer</button>
            </form>
        </div>
        
        <div class="content-box">
            <h3>Liste des actualités (<?php echo count($actualites); ?>)</h3>
            <?php if(empty($actualites)): ?>
                <p>Aucune actualité.</p>
            <?php else: ?>
                <div class="news-grid">
                <?php foreach($actualites as $actu): ?>
                    <div class="news-card">
                        <?php if($actu['image_path']): ?>
                            <img src="../<?php echo htmlspecialchars($actu['image_path']); ?>" alt="<?php echo htmlspecialchars($actu['titre']); ?>" class="news-image">
                        <?php endif; ?>
                        <div class="news-content">
                            <div class="news-date"><?php echo date('d/m/Y', strtotime($actu['date_publication'])); ?></div>
                            <h3><?php echo htmlspecialchars($actu['titre']); ?></h3>
                            <p class="news-excerpt"><?php echo htmlspecialchars(substr($actu['contenu'], 0, 100)); ?>...</p>
                            <p style="margin-top:1rem;">
                                <span style="color:<?php echo $actu['visible'] ? '#0099FF' : '#ccc'; ?>;font-weight:bold;">
                                    <?php echo $actu['visible'] ? 'Visible' : 'Masqué'; ?>
                                </span>
                            </p>
                            <div class="btn-group">
                                <a href="actualites.php?edit=<?php echo $actu['id']; ?>" class="btn btn-small">Éditer</a>
                                <form method="POST" style="display:inline;" onsubmit="return confirm('Supprimer cette actualité ?');">
                                    <input type="hidden" name="actu_id" value="<?php echo $actu['id']; ?>">
                                    <button type="submit" name="delete_actualite" class="btn-delete btn-small">Supprimer</button>
                                </form>
                            </div>
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
