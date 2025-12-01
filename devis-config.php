<?php require_once 'includes/config.php';
$id = (int)($_GET['id'] ?? 0);
$stmt = $pdo->prepare("SELECT * FROM configurations WHERE id = ?");
$stmt->execute([$id]);
$config = $stmt->fetch();
if(!$config) { die('Configuration introuvable'); }
$stmt = $pdo->prepare("SELECT cc.*, c.* FROM config_composants cc JOIN composants c ON cc.composant_id = c.id WHERE cc.config_id = ?");
$stmt->execute([$id]);
$composants = $stmt->fetchAll();
$numero_devis = 'DEVIS-'.date('Ymd-His');
header('Content-Type: text/csv; charset=utf-8');
header('Content-Disposition: attachment; filename="'.$numero_devis.'.csv"');
$output = fopen('php://output', 'w');
fprintf($output, chr(0xEF).chr(0xBB).chr(0xBF));
fputcsv($output, ['DEVIS TECHSOLUTIONS'], ';');
fputcsv($output, [''], ';');
fputcsv($output, ['Numéro', $numero_devis], ';');
fputcsv($output, ['Date', date('d/m/Y')], ';');
fputcsv($output, ['Configuration', $config['nom_config']], ';');
fputcsv($output, ['Service', $config['service']], ';');
fputcsv($output, [''], ';');
fputcsv($output, ['Référence', 'Désignation', 'Quantité', 'Prix Unit. HT', 'Total HT'], ';');
foreach($composants as $comp) {
    fputcsv($output, [$comp['reference'], $comp['libelle'], $comp['quantite'], number_format($comp['prix_ht'], 2, ',', ' ').' €', number_format($comp['prix_ht']*$comp['quantite'], 2, ',', ' ').' €'], ';');
}
fputcsv($output, [''], ';');
fputcsv($output, ['', '', '', 'Total HT', number_format($config['prix_total_ht'], 2, ',', ' ').' €'], ';');
fputcsv($output, ['', '', '', 'TVA (20%)', number_format($config['prix_total_ht']*0.20, 2, ',', ' ').' €'], ';');
fputcsv($output, ['', '', '', 'Total TTC', number_format($config['prix_total_ttc'], 2, ',', ' ').' €'], ';');
fputcsv($output, [''], ';');
fputcsv($output, ['Validité', '30 jours'], ';');
fputcsv($output, ['Délai', '15 jours après acceptation'], ';');
fclose($output);
exit;
?>
