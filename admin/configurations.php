<?php
session_start();
require_once '../includes/config.php';

// Vérifier connexion admin
if(!isset($_SESSION['admin_id'])) {
    header('Location: login.php');
    exit;
}

$message = '';
$messageType = '';

// Créer une configuration
if(isset($_POST['create_config'])) {
    try {
        $stmt = $pdo->prepare("INSERT INTO configurations (nom, description) VALUES (?, ?)");
        $stmt->execute([
            trim($_POST['nom']),
            trim($_POST['description'])
        ]);
        
        $config_id = $pdo->lastInsertId();
        $message = "Configuration créée avec succès !";
        $messageType = 'success';
        
    } catch(Exception $e) {
        $message = "Erreur : " . $e->getMessage();
        $messageType = 'error';
    }
}

// Modifier une configuration
if(isset($_POST['update_config'])) {
    try {
        $stmt = $pdo->prepare("UPDATE configurations SET nom=?, description=? WHERE id=?");
        $stmt->execute([
            trim($_POST['nom']),
            trim($_POST['description']),
            $_POST['config_id']
        ]);
        
        $message = "Configuration mise à jour !";
        $messageType = 'success';
        
    } catch(Exception $e) {
        $message = "Erreur : " . $e->getMessage();
        $messageType = 'error';
    }
}

// Supprimer une configuration
if(isset($_POST['delete_config'])) {
    try {
        $stmt = $pdo->prepare("DELETE FROM configurations WHERE id = ?");
        $stmt->execute([$_POST['config_id']]);
        
        $message = "Configuration supprimée !";
        $messageType = 'success';
        
    } catch(Exception $e) {
        $message = "Erreur : " . $e->getMessage();
        $messageType = 'error';
    }
}

// Ajouter un composant à une configuration
if(isset($_POST['add_composant'])) {
    try {
        $stmt = $pdo->prepare("INSERT INTO configuration_composants (config_id, composant_id, quantite) VALUES (?, ?, ?)");
        $stmt->execute([
            $_POST['config_id'],
            $_POST['composant_id'],
            (int)$_POST['quantite']
        ]);
        
        $message = "Composant ajouté !";
        $messageType = 'success';
        
    } catch(Exception $e) {
        $message = "Erreur : " . $e->getMessage();
        $messageType = 'error';
    }
}

// Supprimer un composant
if(isset($_POST['delete_composant'])) {
    try {
        $stmt = $pdo->prepare("DELETE FROM configuration_composants WHERE id = ?");
        $stmt->execute([$_POST['liaison_id']]);
        
        $message = "Composant supprimé !";
        $messageType = 'success';
        
    } catch(Exception $e) {
        $message = "Erreur : " . $e->getMessage();
        $messageType = 'error';
    }
}

// Récupérer toutes les configs avec leur prix
$stmt = $pdo->query("SELECT * FROM vue_prix_configurations ORDER BY nom ASC");
$configurations = $stmt->fetchAll();

// Si on édite une config
$editing_config = null;
$composants_config = [];
$all_composants = [];
if(isset($_GET['edit'])) {
    $stmt = $pdo->prepare("SELECT * FROM configurations WHERE id = ?");
    $stmt->execute([$_GET['edit']]);
    $editing_config = $stmt->fetch();
    
    if($editing_config) {
        // Récupérer les composants de cette config (via la vue)
        $stmt = $pdo->prepare("SELECT * FROM vue_configuration_details WHERE config_id = ? ORDER BY categorie, libelle");
        $stmt->execute([$_GET['edit']]);
        $composants_config = $stmt->fetchAll();
        
        // Récupérer TOUS les composants disponibles (pour le formulaire)
        $stmt = $pdo->query("SELECT * FROM composants ORDER BY categorie, libelle");
        $all_composants = $stmt->fetchAll();
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion Configurations - Admin TechSolutions</title>
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
    <h2 class="section-title">Gestion des Configurations PC</h2>
    
    <?php if($message): ?>
        <div class="message <?php echo $messageType; ?>"><?php echo htmlspecialchars($message); ?></div>
    <?php endif; ?>
    
    <?php if($editing_config): ?>
        <!-- ÉDITION D'UNE CONFIGURATION -->
        <div class="content-box">
            <h3>Éditer la configuration : <?php echo htmlspecialchars($editing_config['nom']); ?></h3>
            
            <form method="POST">
                <input type="hidden" name="config_id" value="<?php echo $editing_config['id']; ?>">
                
                <div class="form-group">
                    <label>Nom de la configuration</label>
                    <input type="text" name="nom" value="<?php echo htmlspecialchars($editing_config['nom']); ?>" required>
                </div>
                
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" rows="3" required><?php echo htmlspecialchars($editing_config['description']); ?></textarea>
                </div>
                
                <button type="submit" name="update_config" class="btn">Mettre à jour</button>
                <a href="configurations.php" class="btn-secondary">Annuler</a>
            </form>
        </div>
        
        <!-- COMPOSANTS DE CETTE CONFIG -->
        <div class="content-box">
            <h3>Composants de cette configuration (<?php echo count($composants_config); ?>)</h3>
            
            <?php if(empty($composants_config)): ?>
                <p>Aucun composant pour cette configuration.</p>
            <?php else: ?>
                <table>
                    <thead>
                        <tr>
                            <th>Catégorie</th>
                            <th>Référence</th>
                            <th>Libellé</th>
                            <th>Qté</th>
                            <th>Prix Unit. HT</th>
                            <th>Total HT</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        $total_config = 0;
                        foreach($composants_config as $comp): 
                            $total_config += $comp['total_ht'];
                        ?>
                        <tr>
                            <td><?php echo htmlspecialchars($comp['categorie']); ?></td>
                            <td><?php echo htmlspecialchars($comp['reference']); ?></td>
                            <td><?php echo htmlspecialchars($comp['libelle']); ?></td>
                            <td><?php echo $comp['quantite']; ?></td>
                            <td><?php echo number_format($comp['prix_ht'], 2, ',', ' '); ?> €</td>
                            <td><?php echo number_format($comp['total_ht'], 2, ',', ' '); ?> €</td>
                            <td>
                                <form method="POST" style="display:inline;" onsubmit="return confirm('Supprimer ?');">
                                    <input type="hidden" name="liaison_id" value="<?php echo $comp['composant_id']; ?>">
                                    <button type="submit" name="delete_composant" class="btn-delete btn-small">Supprimer</button>
                                </form>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                        <tr style="font-weight:bold;background:#f0f0f0;">
                            <td colspan="5" style="text-align:right;">TOTAL HT :</td>
                            <td colspan="2"><?php echo number_format($total_config, 2, ',', ' '); ?> €</td>
                        </tr>
                        <tr style="font-weight:bold;background:#f0f0f0;">
                            <td colspan="5" style="text-align:right;">TOTAL TTC (TVA 20%) :</td>
                            <td colspan="2"><?php echo number_format($total_config * 1.20, 2, ',', ' '); ?> €</td>
                        </tr>
                    </tbody>
                </table>
            <?php endif; ?>
        </div>
        
        <!-- AJOUTER UN COMPOSANT -->
        <div class="content-box">
            <h3>Ajouter un composant à cette configuration</h3>
            
            <form method="POST">
                <input type="hidden" name="config_id" value="<?php echo $editing_config['id']; ?>">
                
                <div class="form-group">
                    <label>Composant</label>
                    <select name="composant_id" required style="width:100%;">
                        <option value="">-- Sélectionner un composant --</option>
                        <?php 
                        $current_cat = '';
                        foreach($all_composants as $comp): 
                            if($comp['categorie'] != $current_cat):
                                if($current_cat != '') echo '</optgroup>';
                                echo '<optgroup label="' . htmlspecialchars($comp['categorie']) . '">';
                                $current_cat = $comp['categorie'];
                            endif;
                        ?>
                            <option value="<?php echo $comp['id']; ?>">
                                <?php echo htmlspecialchars($comp['reference']); ?> - 
                                <?php echo htmlspecialchars($comp['libelle']); ?> 
                                (<?php echo number_format($comp['prix_ht'], 2, ',', ' '); ?> € HT)
                            </option>
                        <?php endforeach; ?>
                        <?php if($current_cat != '') echo '</optgroup>'; ?>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Quantité</label>
                    <input type="number" name="quantite" value="1" min="1" required>
                </div>
                
                <button type="submit" name="add_composant" class="btn">Ajouter le composant</button>
            </form>
        </div>
        
    <?php else: ?>
        <!-- CRÉER UNE NOUVELLE CONFIGURATION -->
        <div class="content-box">
            <h3>Créer une nouvelle configuration</h3>
            
            <form method="POST">
                <div class="form-group">
                    <label>Nom de la configuration</label>
                    <input type="text" name="nom" placeholder="Ex: PC Développement Pro" required>
                </div>
                
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" rows="3" placeholder="Description de la configuration..." required></textarea>
                </div>
                
                <button type="submit" name="create_config" class="btn">Créer la configuration</button>
            </form>
        </div>
        
        <!-- LISTE DES CONFIGURATIONS -->
        <div class="content-box">
            <h3>Configurations existantes (<?php echo count($configurations); ?>)</h3>
            
            <?php if(empty($configurations)): ?>
                <p>Aucune configuration créée.</p>
            <?php else: ?>
                <div class="services-grid">
                    <?php foreach($configurations as $config): ?>
                    <div class="service-card">
                        <h3><?php echo htmlspecialchars($config['nom']); ?></h3>
                        <p style="font-size:0.95rem;color:#666;margin-bottom:1rem;">
                            <?php echo $config['nb_composants']; ?> composant<?php echo $config['nb_composants'] > 1 ? 's' : ''; ?>
                        </p>
                        <p style="font-size:0.95rem;"><?php echo htmlspecialchars(substr($config['description'], 0, 100)); ?><?php echo strlen($config['description']) > 100 ? '...' : ''; ?></p>
                        <div class="price" style="font-size:1.2rem;font-weight:bold;color:#0099FF;margin:1rem 0;">
                            <?php echo number_format($config['prix_total_ht'], 2, ',', ' '); ?> € HT
                        </div>
                        <div style="font-size:1rem;color:#666;margin-bottom:1rem;">
                            <?php echo number_format($config['prix_total_ttc'], 2, ',', ' '); ?> € TTC
                        </div>
                        <div style="margin-top:1rem;">
                            <a href="configurations.php?edit=<?php echo $config['id']; ?>" class="btn">Éditer</a>
                            <form method="POST" style="display:inline;margin-left:0.5rem;" onsubmit="return confirm('Supprimer cette configuration et tous ses composants ?');">
                                <input type="hidden" name="config_id" value="<?php echo $config['id']; ?>">
                                <button type="submit" name="delete_config" class="btn-delete btn-small">Supprimer</button>
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
    <p>&copy; 2025 TechSolutions - Administration</p>
</footer>
</body>
</html>
