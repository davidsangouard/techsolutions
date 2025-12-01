<?php require_once 'includes/config.php';
$id = (int)($_GET['id'] ?? 0);
$stmt = $pdo->prepare("SELECT * FROM configurations WHERE id = ?");
$stmt->execute([$id]);
$config = $stmt->fetch();
if(!$config) { header('Location: configurations.php'); exit; }
$stmt = $pdo->prepare("SELECT cc.*, c.* FROM config_composants cc JOIN composants c ON cc.composant_id = c.id WHERE cc.config_id = ?");
$stmt->execute([$id]);
$composants = $stmt->fetchAll();
?>
<!DOCTYPE html><html lang="fr"><head><meta charset="UTF-8"><title><?php echo htmlspecialchars($config['nom_config']); ?> - TechSolutions</title><link rel="stylesheet" href="css/style.css"></head><body>
<header><div class="header-content"><div class="logo"><h1>TechSolutions</h1></div><nav><ul><li><a href="index.php">Accueil</a></li><li><a href="configurations.php">Configurations PC</a></li><li><a href="actualites.php">Actualités</a></li><li><a href="contact.php">Contact</a></li><li><a href="admin/login.php">Admin</a></li></ul></nav></div></header>
<div class="container"><a href="configurations.php" style="display:inline-block;margin:1rem 0;">← Retour aux configurations</a>
<div class="content-box"><h1><?php echo htmlspecialchars($config['nom_config']); ?></h1>
<p><strong>Service :</strong> <?php echo htmlspecialchars($config['service']); ?></p>
<p style="margin:1rem 0;"><?php echo htmlspecialchars($config['description']); ?></p>
<h2>Composants inclus</h2>
<table style="margin-top:1rem;"><thead><tr><th>Référence</th><th>Composant</th><th>Quantité</th><th>Prix Unitaire HT</th><th>Total HT</th></tr></thead><tbody>
<?php foreach($composants as $comp): ?>
<tr><td><?php echo htmlspecialchars($comp['reference']); ?></td>
<td><?php echo htmlspecialchars($comp['libelle']); ?></td>
<td><?php echo $comp['quantite']; ?></td>
<td><?php echo number_format($comp['prix_ht'], 2, ',', ' '); ?> €</td>
<td><?php echo number_format($comp['prix_ht'] * $comp['quantite'], 2, ',', ' '); ?> €</td></tr>
<?php endforeach; ?>
</tbody></table>
<div style="background:#f8f9fa;padding:1.5rem;border-radius:8px;margin-top:2rem;">
<h3>Récapitulatif</h3>
<p style="font-size:1.3rem;"><strong>Total HT :</strong> <?php echo number_format($config['prix_total_ht'], 2, ',', ' '); ?> €</p>
<p style="font-size:1.3rem;"><strong>TVA (20%) :</strong> <?php echo number_format($config['prix_total_ht'] * 0.20, 2, ',', ' '); ?> €</p>
<p style="font-size:1.6rem;font-weight:bold;color:#667eea;"><strong>Total TTC :</strong> <?php echo number_format($config['prix_total_ttc'], 2, ',', ' '); ?> €</p>
</div>
<a href="devis-config.php?id=<?php echo $config['id']; ?>" class="btn-success" style="display:inline-block;margin-top:2rem;">📥 Télécharger le devis (CSV)</a>
</div></div>
<footer><p>&copy; 2025 TechSolutions</p></footer>
</body></html>
