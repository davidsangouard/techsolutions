<?php require_once 'includes/config.php';
$stmt = $pdo->query("SELECT * FROM configurations ORDER BY service, nom_config");
$configs = $stmt->fetchAll();
$configs_by_service = [];
foreach($configs as $config) {
    $configs_by_service[$config['service']][] = $config;
}
?>
<!DOCTYPE html><html lang="fr"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Configurations PC - TechSolutions</title><link rel="stylesheet" href="css/style.css"></head><body>
<header><div class="header-content"><div class="logo"><h1>TechSolutions</h1></div><nav><ul><li><a href="index.php">Accueil</a></li><li><a href="configurations.php">Configurations PC</a></li><li><a href="actualites.php">Actualités</a></li><li><a href="contact.php">Contact</a></li><li><a href="admin/login.php">Admin</a></li></ul></nav></div></header>
<section class="hero"><div class="container"><h2>Configurations PC par Service</h2><p>Choisissez la configuration adaptée à votre métier</p></div></section>
<div class="container">
<?php foreach($configs_by_service as $service => $service_configs): ?>
<div class="content-box" id="<?php echo strtolower(str_replace(' ', '-', $service)); ?>"><h2><?php echo htmlspecialchars($service); ?></h2>
<div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(300px,1fr));gap:2rem;margin-top:1.5rem;">
<?php foreach($service_configs as $config): ?>
<div style="border:2px solid #667eea;border-radius:8px;padding:1.5rem;background:#f8f9fa;">
<h3 style="color:#667eea;margin-bottom:1rem;"><?php echo htmlspecialchars($config['nom_config']); ?></h3>
<p style="margin-bottom:1rem;"><?php echo htmlspecialchars($config['description']); ?></p>
<p style="font-size:1.5rem;font-weight:bold;color:#667eea;margin:1rem 0;">
<?php echo number_format($config['prix_total_ht'], 2, ',', ' '); ?> € HT<br>
<span style="font-size:1.2rem;"><?php echo number_format($config['prix_total_ttc'], 2, ',', ' '); ?> € TTC</span>
</p>
<a href="detail-config.php?id=<?php echo $config['id']; ?>" class="btn" style="display:block;text-align:center;margin-top:1rem;">Voir les détails</a>
<a href="devis-config.php?id=<?php echo $config['id']; ?>" class="btn-success" style="display:block;text-align:center;margin-top:0.5rem;">Créer un devis</a>
</div>
<?php endforeach; ?>
</div></div>
<?php endforeach; ?>
</div>
<footer><p>&copy; 2025 TechSolutions</p><p><a href="mentions-legales.php">Mentions légales</a> | <a href="politique-rgpd.php">Politique RGPD</a></p></footer>
</body></html>
