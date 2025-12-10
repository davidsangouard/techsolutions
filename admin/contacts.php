<?php
require_once '../includes/config.php';
if(!isset($_SESSION['admin_id'])) { header('Location: login.php'); exit; }

$message = '';

// MARQUER COMME LU
if(isset($_POST['mark_read'])) {
    try {
        $stmt = $pdo->prepare("UPDATE contacts SET lu = 1 WHERE id = ?");
        $stmt->execute([(int)$_POST['contact_id']]);
        $message = 'Message marqué comme lu';
    } catch(PDOException $e) {
        $message = 'Erreur: ' . $e->getMessage();
    }
}

// SUPPRIMER
if(isset($_POST['delete_contact'])) {
    try {
        $stmt = $pdo->prepare("DELETE FROM contacts WHERE id = ?");
        $stmt->execute([(int)$_POST['contact_id']]);
        $message = 'Message supprimé';
    } catch(PDOException $e) {
        $message = 'Erreur: ' . $e->getMessage();
    }
}

// Afficher un message complet
$view_message = null;
if(isset($_GET['view'])) {
    $stmt = $pdo->prepare("SELECT * FROM contacts WHERE id = ?");
    $stmt->execute([(int)$_GET['view']]);
    $view_message = $stmt->fetch();
    
    // Marquer automatiquement comme lu
    if($view_message && !$view_message['lu']) {
        $stmt = $pdo->prepare("UPDATE contacts SET lu = 1 WHERE id = ?");
        $stmt->execute([(int)$_GET['view']]);
    }
}

// Récupérer tous les contacts
$stmt = $pdo->query("SELECT * FROM contacts ORDER BY date_envoi DESC");
$contacts = $stmt->fetchAll();

$non_lus = array_filter($contacts, fn($c) => !$c['lu']);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Messages - Admin</title>
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
    <h2 class="section-title">Messages Reçus</h2>
    
    <?php if($message): ?>
        <div class="message success"><?php echo htmlspecialchars($message); ?></div>
    <?php endif; ?>
    
    <?php if($view_message): ?>
        <!-- AFFICHAGE MESSAGE COMPLET -->
        <div class="content-box">
            <a href="contacts.php" class="btn-secondary">Retour à la liste</a>
            
            <h3 style="margin:2rem 0 1rem 0;"><?php echo htmlspecialchars($view_message['sujet'] ?: 'Sans sujet'); ?></h3>
            
            <div style="background:#f5f5f5;padding:1rem;border-radius:4px;margin-bottom:1rem;">
                <p><strong>De :</strong> <?php echo htmlspecialchars($view_message['nom']); ?></p>
                <p><strong>Email :</strong> <a href="mailto:<?php echo htmlspecialchars($view_message['email']); ?>"><?php echo htmlspecialchars($view_message['email']); ?></a></p>
                <p><strong>Date :</strong> <?php echo date('d/m/Y à H:i', strtotime($view_message['date_envoi'])); ?></p>
                <p><strong>Statut :</strong> <span style="color:<?php echo $view_message['lu'] ? '#0099FF' : '#ccc'; ?>;font-weight:bold;"><?php echo $view_message['lu'] ? 'Lu' : 'Non lu'; ?></span></p>
            </div>
            
            <div style="background:white;padding:2rem;border:2px solid #0099FF;border-radius:4px;white-space:pre-wrap;">
                <?php echo htmlspecialchars($view_message['message']); ?>
            </div>
            
            <div class="btn-group" style="margin-top:2rem;">
                <form method="POST" style="display:inline;" onsubmit="return confirm('Supprimer ce message ?');">
                    <input type="hidden" name="contact_id" value="<?php echo $view_message['id']; ?>">
                    <button type="submit" name="delete_contact" class="btn-delete">Supprimer</button>
                </form>
            </div>
        </div>
    <?php else: ?>
        <!-- LISTE DES MESSAGES -->
        <div class="content-box">
            <p><strong><?php echo count($non_lus); ?></strong> message(s) non lu(s) sur <strong><?php echo count($contacts); ?></strong> total</p>
        </div>
        
        <?php if(empty($contacts)): ?>
            <div class="content-box">
                <p>Aucun message.</p>
            </div>
        <?php else: ?>
            <table class="messages-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Nom</th>
                        <th>Email</th>
                        <th>Sujet</th>
                        <th>Statut</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($contacts as $contact): ?>
                    <tr class="<?php echo $contact['lu'] ? 'read' : 'unread'; ?>">
                        <td><?php echo date('d/m/Y H:i', strtotime($contact['date_envoi'])); ?></td>
                        <td><?php echo htmlspecialchars($contact['nom']); ?></td>
                        <td><?php echo htmlspecialchars($contact['email']); ?></td>
                        <td><?php echo htmlspecialchars($contact['sujet'] ?: '(sans sujet)'); ?></td>
                        <td>
                            <span style="color:<?php echo $contact['lu'] ? '#0099FF' : '#999'; ?>;font-weight:<?php echo $contact['lu'] ? 'normal' : 'bold'; ?>;">
                                <?php echo $contact['lu'] ? 'Lu' : 'Non lu'; ?>
                            </span>
                        </td>
                        <td>
                            <a href="contacts.php?view=<?php echo $contact['id']; ?>" class="btn btn-small">Lire</a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php endif; ?>
    <?php endif; ?>
</div>

<footer><p>&copy; 2025 TechSolutions</p></footer>
</body>
</html>
