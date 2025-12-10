<?php
session_start();

// Prix fictifs réalistes par catégorie (en €  HT)
$prix_catalogue = [
    // CPU
    'CPU-001' => 210.00, 'CPU-002' => 340.00, 'CPU-003' => 320.00, 'CPU-004' => 140.00,
    'CPU-005' => 470.00, 'CPU-006' => 360.00, 'CPU-007' => 430.00,
    
    // MOTHERBOARD
    'MOTHERBOARD-001' => 70.00, 'MOTHERBOARD-002' => 75.00, 'MOTHERBOARD-003' => 65.00,
    'MOTHERBOARD-004' => 80.00, 'MOTHERBOARD-005' => 90.00, 'MOTHERBOARD-006' => 140.00,
    'MOTHERBOARD-007' => 220.00, 'MOTHERBOARD-008' => 160.00, 'MOTHERBOARD-009' => 280.00,
    'MOTHERBOARD-010' => 290.00,
    
    // MEMORY
    'MEMORY-001' => 50.00, 'MEMORY-002' => 90.00, 'MEMORY-003' => 120.00,
    'MEMORY-004' => 150.00, 'MEMORY-005' => 60.00, 'MEMORY-006' => 100.00,
    'MEMORY-007' => 290.00,
    
    // SSD
    'SSD-001' => 70.00, 'SSD-002' => 130.00, 'SSD-003' => 190.00,
    
    // VIDEO
    'VIDEO-001' => 150.00, 'VIDEO-002' => 180.00, 'VIDEO-003' => 220.00,
    'VIDEO-004' => 400.00, 'VIDEO-005' => 650.00, 'VIDEO-006' => 1200.00,
    'VIDEO-007' => 720.00, 'VIDEO-008' => 2400.00, 'VIDEO-009' => 1900.00,
    'VIDEO-010' => 5500.00,
    
    // TABLET
    'TABLET-001' => 70.00, 'TABLET-002' => 330.00,
    
    // CASE
    'CASE-001' => 65.00, 'CASE-002' => 90.00, 'CASE-003' => 50.00,
    'CASE-004' => 150.00, 'CASE-005' => 110.00, 'CASE-006' => 55.00,
    'CASE-007' => 85.00, 'CASE-008' => 45.00,
    
    // POWER
    'POWER-001' => 55.00, 'POWER-002' => 85.00, 'POWER-003' => 75.00,
    'POWER-004' => 95.00, 'POWER-005' => 90.00, 'POWER-006' => 105.00,
    'POWER-007' => 110.00, 'POWER-008' => 115.00, 'POWER-009' => 125.00,
    'POWER-010' => 140.00, 'POWER-011' => 145.00, 'POWER-012' => 130.00,
    'POWER-013' => 150.00, 'POWER-014' => 280.00,
    
    // CPU COOLER
    'CPUCO-001' => 50.00, 'CPUCO-002' => 45.00, 'CPUCO-003' => 130.00,
    'CPUCO-004' => 85.00, 'CPUCO-005' => 140.00, 'CPUCO-006' => 40.00,
    
    // MONITOR
    'MONITOR-001' => 100.00, 'MONITOR-002' => 110.00, 'MONITOR-003' => 120.00,
    'MONITOR-004' => 120.00, 'MONITOR-005' => 95.00, 'MONITOR-006' => 105.00,
    'MONITOR-007' => 115.00, 'MONITOR-008' => 240.00, 'MONITOR-009' => 320.00,
    'MONITOR-010' => 450.00, 'MONITOR-011' => 780.00, 'MONITOR-012' => 280.00,
    'MONITOR-013' => 130.00, 'MONITOR-014' => 1400.00,
    
    // KEYBOARD
    'KEYBOARD-001' => 110.00, 'KEYBOARD-002' => 60.00, 'KEYBOARD-003' => 50.00,
    'KEYBOARD-004' => 30.00, 'KEYBOARD-005' => 120.00, 'KEYBOARD-006' => 95.00,
    'KEYBOARD-007' => 25.00, 'KEYBOARD-008' => 35.00,
    
    // MOUSE
    'MOUSE-001' => 12.00, 'MOUSE-002' => 15.00, 'MOUSE-003' => 18.00,
    'MOUSE-004' => 20.00, 'MOUSE-005' => 20.00, 'MOUSE-006' => 25.00,
    'MOUSE-007' => 35.00, 'MOUSE-008' => 40.00, 'MOUSE-009' => 45.00,
    'MOUSE-010' => 90.00, 'MOUSE-011' => 110.00, 'MOUSE-012' => 100.00,
    'MOUSE-013' => 180.00, 'MOUSE-014' => 190.00,
    
    // HEADPHONES
    'HEADPHONES-001' => 140.00, 'HEADPHONES-002' => 350.00, 'HEADPHONES-003' => 420.00,
    'HEADPHONES-004' => 450.00, 'HEADPHONES-005' => 70.00, 'HEADPHONES-006' => 35.00,
    'HEADPHONES-007' => 280.00,
    
    // WEBCAM
    'WEBCAM-001' => 30.00, 'WEBCAM-002' => 80.00, 'WEBCAM-003' => 40.00,
    'WEBCAM-004' => 95.00, 'WEBCAM-005' => 190.00, 'WEBCAM-006' => 220.00,
    'WEBCAM-007' => 170.00, 'WEBCAM-008' => 160.00,
    
    // INTERNAL HDD
    'INTERNAL-001' => 45.00, 'INTERNAL-002' => 90.00, 'INTERNAL-003' => 110.00,
    'INTERNAL-004' => 180.00, 'INTERNAL-005' => 280.00, 'INTERNAL-006' => 140.00,
    'INTERNAL-007' => 120.00, 'INTERNAL-008' => 450.00,
    
    // EXTERNAL HDD
    'EXTERNAL-001' => 110.00, 'EXTERNAL-002' => 170.00, 'EXTERNAL-003' => 320.00,
    'EXTERNAL-004' => 220.00, 'EXTERNAL-005' => 420.00, 'EXTERNAL-006' => 180.00,
    'EXTERNAL-007' => 160.00, 'EXTERNAL-008' => 240.00, 'EXTERNAL-009' => 1200.00,
    'EXTERNAL-010' => 580.00,
    
    // Autres composants à prix raisonnables
    'CASEFAN-001' => 12.00, 'CASEFAN-002' => 8.00, 'CASEFAN-003' => 10.00,
    'CASEFAN-004' => 15.00, 'CASEFAN-005' => 22.00, 'CASEFAN-006' => 14.00,
    'CASEFAN-007' => 11.00, 'CASEFAN-008' => 13.00, 'CASEFAN-009' => 35.00,
    'CASEFAN-010' => 9.00,
    
    'SPEAKERS-001' => 8.00, 'SPEAKERS-002' => 15.00, 'SPEAKERS-003' => 20.00,
    'SPEAKERS-004' => 25.00, 'SPEAKERS-005' => 45.00, 'SPEAKERS-006' => 130.00,
    'SPEAKERS-007' => 180.00, 'SPEAKERS-008' => 190.00, 'SPEAKERS-009' => 450.00,
    'SPEAKERS-010' => 95.00,
    
    'UPS-001' => 70.00, 'UPS-002' => 95.00, 'UPS-003' => 115.00,
    'UPS-004' => 135.00, 'UPS-005' => 175.00, 'UPS-006' => 75.00,
    'UPS-007' => 100.00, 'UPS-008' => 140.00, 'UPS-009' => 160.00,
    'UPS-010' => 220.00,
    
    'THERMAL-001' => 8.00, 'THERMAL-002' => 10.00, 'THERMAL-003' => 12.00,
    'THERMAL-004' => 9.00, 'THERMAL-005' => 11.00, 'THERMAL-006' => 14.00,
    'THERMAL-007' => 18.00, 'THERMAL-008' => 25.00, 'THERMAL-009' => 11.00,
    'THERMAL-010' => 10.00,
    
    'OPTICAL-001' => 25.00, 'OPTICAL-002' => 30.00, 'OPTICAL-003' => 32.00,
    'OPTICAL-004' => 40.00, 'OPTICAL-005' => 40.00, 'OPTICAL-006' => 45.00,
    'OPTICAL-007' => 50.00, 'OPTICAL-008' => 70.00, 'OPTICAL-009' => 85.00,
    
    'SOUND-001' => 15.00, 'SOUND-002' => 18.00, 'SOUND-003' => 20.00,
    'SOUND-004' => 22.00, 'SOUND-005' => 45.00, 'SOUND-006' => 40.00,
    'SOUND-007' => 190.00,
    
    'WIRED-001' => 15.00, 'WIRED-002' => 25.00, 'WIRED-003' => 110.00,
    'WIRED-004' => 180.00, 'WIRED-005' => 280.00, 'WIRED-006' => 320.00,
    'WIRED-007' => 260.00,
    
    'WIRELESS-001' => 35.00, 'WIRELESS-002' => 45.00, 'WIRELESS-003' => 95.00,
    'WIRELESS-004' => 50.00, 'WIRELESS-005' => 40.00,
    
    'FAN-001' => 18.00, 'FAN-002' => 45.00,
    
    'CASEAC-001' => 25.00,
    
    'OS-001' => 145.00, 'OS-002' => 115.00, 'OS-003' => 520.00,
];

// Calcul si soumis
$devis = [];
$total_ht = 0;
$total_tva = 0;
$total_ttc = 0;

if($_SERVER['REQUEST_METHOD'] === 'POST') {
    foreach($_POST as $key => $value) {
        if(strpos($key, 'qty_') === 0) {
            $ref = str_replace('qty_', '', $key);
            $qty = (int)$value;
            if($qty > 0 && isset($prix_catalogue[$ref])) {
                $prix_unit = $prix_catalogue[$ref];
                $prix_ligne = $prix_unit * $qty;
                $devis[$ref] = [
                    'qte' => $qty,
                    'prix_unit' => $prix_unit,
                    'prix_ligne' => $prix_ligne
                ];
                $total_ht += $prix_ligne;
            }
        }
    }
    $total_tva = $total_ht * 0.20;
    $total_ttc = $total_ht + $total_tva;
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Générateur de Devis - Lumni</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        .devis-header {
            background: #000;
            color: #fff;
            padding: 3rem 2rem;
            text-align: center;
            margin-bottom: 2rem;
        }
        .devis-header h1 {
            font-size: 3rem;
            margin-bottom: 0.5rem;
            letter-spacing: 3px;
        }
        .devis-header p {
            font-size: 1.2rem;
            opacity: 0.9;
        }
        .catalogue-section {
            margin: 2rem 0;
            border: 2px solid #000;
            padding: 1rem;
        }
        .catalogue-section h3 {
            background: #000;
            color: #fff;
            padding: 0.75rem;
            margin: -1rem -1rem 1rem -1rem;
            font-size: 1.2rem;
            letter-spacing: 1px;
        }
        .component-line {
            display: grid;
            grid-template-columns: 120px 1fr 100px 120px;
            gap: 1rem;
            padding: 0.75rem;
            border-bottom: 1px solid #eee;
            align-items: center;
        }
        .component-line:hover {
            background: #f5f5f5;
        }
        .component-line input {
            width: 100%;
            padding: 0.5rem;
            border: 2px solid #000;
            text-align: center;
            font-weight: bold;
        }
        .component-ref {
            font-family: monospace;
            font-weight: bold;
            color: #000;
        }
        .component-prix {
            text-align: right;
            font-weight: bold;
            color: #000;
        }
        .recapitulatif {
            background: #000;
            color: #fff;
            padding: 2rem;
            margin: 2rem 0;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .recapitulatif h3 {
            margin-bottom: 1rem;
            font-size: 1.8rem;
        }
        .recap-line {
            display: flex;
            justify-content: space-between;
            padding: 0.5rem 0;
            font-size: 1.1rem;
        }
        .recap-total {
            border-top: 2px solid #fff;
            margin-top: 1rem;
            padding-top: 1rem;
            font-size: 1.5rem;
            font-weight: bold;
        }
        .btn-calcul {
            background: #000;
            color: #fff;
            border: 2px solid #000;
            padding: 1.5rem 3rem;
            font-size: 1.3rem;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            margin: 2rem 0;
            letter-spacing: 2px;
        }
        .btn-calcul:hover {
            background: #fff;
            color: #000;
        }
        .devis-result {
            background: #f5f5f5;
            border: 2px solid #000;
            padding: 2rem;
            margin: 2rem 0;
        }
        .devis-result h3 {
            background: #000;
            color: #fff;
            padding: 1rem;
            margin: -2rem -2rem 2rem -2rem;
            font-size: 1.5rem;
        }
        .devis-line {
            display: grid;
            grid-template-columns: 100px 1fr 80px 120px 120px;
            gap: 1rem;
            padding: 0.75rem;
            border-bottom: 1px solid #ccc;
            font-size: 0.95rem;
        }
        .devis-line.header {
            font-weight: bold;
            background: #000;
            color: #fff;
            border: none;
        }
        @media print {
            .catalogue-section, .btn-calcul, header, footer {
                display: none !important;
            }
            .devis-result {
                border: 1px solid #000;
            }
        }
    </style>
</head>
<body>

<div class="devis-header">
    <h1>LUMNI</h1>
    <p>Générateur de Devis Professionnel</p>
    <p style="font-size:1rem;opacity:0.7;">Fournisseur de configurations PC pour TechSolutions</p>
</div>

<?php if(!empty($devis)): ?>
<div class="recapitulatif">
    <h3>📋 Récapitulatif</h3>
    <div class="recap-line">
        <span>Articles:</span>
        <strong><?php echo count($devis); ?></strong>
    </div>
    <div class="recap-line">
        <span>Total HT:</span>
        <strong><?php echo number_format($total_ht, 2, ',', ' '); ?> €</strong>
    </div>
    <div class="recap-line">
        <span>TVA (20%):</span>
        <strong><?php echo number_format($total_tva, 2, ',', ' '); ?> €</strong>
    </div>
    <div class="recap-line recap-total">
        <span>TOTAL TTC:</span>
        <strong><?php echo number_format($total_ttc, 2, ',', ' '); ?> €</strong>
    </div>
    <button onclick="window.print()" class="btn" style="width:100%;margin-top:1rem;">🖨️ Imprimer / PDF</button>
</div>

<div class="devis-result">
    <h3>DEVIS LUMNI - <?php echo date('d/m/Y'); ?></h3>
    <div class="devis-line header">
        <div>Référence</div>
        <div>Désignation</div>
        <div>Qté</div>
        <div>Prix Unit. HT</div>
        <div>Total HT</div>
    </div>
    <?php 
    foreach($devis as $ref => $data): 
        // Trouver le libellé (simulé ici)
        $libelle = "Composant " . $ref;
    ?>
    <div class="devis-line">
        <div class="component-ref"><?php echo $ref; ?></div>
        <div><?php echo $libelle; ?></div>
        <div style="text-align:center;"><?php echo $data['qte']; ?></div>
        <div style="text-align:right;"><?php echo number_format($data['prix_unit'], 2, ',', ' '); ?> €</div>
        <div style="text-align:right;font-weight:bold;"><?php echo number_format($data['prix_ligne'], 2, ',', ' '); ?> €</div>
    </div>
    <?php endforeach; ?>
    
    <div style="margin-top:2rem;padding-top:2rem;border-top:2px solid #000;">
        <div style="text-align:right;font-size:1.2rem;">
            <p><strong>Total HT:</strong> <?php echo number_format($total_ht, 2, ',', ' '); ?> €</p>
            <p><strong>TVA (20%):</strong> <?php echo number_format($total_tva, 2, ',', ' '); ?> €</p>
            <p style="font-size:1.5rem;"><strong>TOTAL TTC:</strong> <?php echo number_format($total_ttc, 2, ',', ' '); ?> €</p>
        </div>
    </div>
    
    <p style="margin-top:2rem;text-align:center;font-size:0.9rem;color:#666;">
        Devis généré par <strong>LUMNI</strong> - Fournisseur de configurations PC professionnelles
    </p>
</div>
<?php endif; ?>

<div class="container">
    <form method="POST">
        <h2 style="text-align:center;margin:2rem 0;font-size:2rem;">📦 Catalogue Complet</h2>
        <p style="text-align:center;margin-bottom:2rem;color:#666;">Saisissez les quantités désirées (0 par défaut)</p>

        <div class="catalogue-section">
            <h3></h3>
            <div class="component-line">
                <div class="component-ref">CASEAC-001</div>
                <div>Fox Spirit LIGHTFLOW ARGB HUB</div>
                <input type="number" name="qty_CASEAC-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASEAC-001']) ? number_format($prix_catalogue['CASEAC-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASEFAN-001</div>
                <div>Fox Spirit FA120 ARGB (Noir)</div>
                <input type="number" name="qty_CASEFAN-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASEFAN-001']) ? number_format($prix_catalogue['CASEFAN-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASEFAN-002</div>
                <div>Arctic P12 PWM PST Noir</div>
                <input type="number" name="qty_CASEFAN-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASEFAN-002']) ? number_format($prix_catalogue['CASEFAN-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASEFAN-003</div>
                <div>Aerocool Phantom M-3 12 PWM ARGB (Noir)</div>
                <input type="number" name="qty_CASEFAN-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASEFAN-003']) ? number_format($prix_catalogue['CASEFAN-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASEFAN-004</div>
                <div>Noctua NF-P12 Redux-1300 PWM</div>
                <input type="number" name="qty_CASEFAN-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASEFAN-004']) ? number_format($prix_catalogue['CASEFAN-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASEFAN-005</div>
                <div>be quiet! Silent Wings 4 120mm PWM</div>
                <input type="number" name="qty_CASEFAN-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASEFAN-005']) ? number_format($prix_catalogue['CASEFAN-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASEFAN-006</div>
                <div>Arctic P12 Pro A-RGB (Noir)</div>
                <input type="number" name="qty_CASEFAN-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASEFAN-006']) ? number_format($prix_catalogue['CASEFAN-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASEFAN-007</div>
                <div>Aerocool APNX FP1-140 (Noir)</div>
                <input type="number" name="qty_CASEFAN-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASEFAN-007']) ? number_format($prix_catalogue['CASEFAN-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASEFAN-008</div>
                <div>Arctic P14 Pro (Noir)</div>
                <input type="number" name="qty_CASEFAN-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASEFAN-008']) ? number_format($prix_catalogue['CASEFAN-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASEFAN-009</div>
                <div>Antec Connect 120 ARGB Noir (x3)</div>
                <input type="number" name="qty_CASEFAN-009" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASEFAN-009']) ? number_format($prix_catalogue['CASEFAN-009'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASEFAN-010</div>
                <div>Arctic P12 SLIM PWM PST</div>
                <input type="number" name="qty_CASEFAN-010" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASEFAN-010']) ? number_format($prix_catalogue['CASEFAN-010'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>CASE</h3>
            <div class="component-line">
                <div class="component-ref">CASE-001</div>
                <div>Fox Spirit AG1 (Noir) - Moyen Tour</div>
                <input type="number" name="qty_CASE-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASE-001']) ? number_format($prix_catalogue['CASE-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASE-002</div>
                <div>be quiet! Pure Base 500 (Noir) - Moyen Tour</div>
                <input type="number" name="qty_CASE-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASE-002']) ? number_format($prix_catalogue['CASE-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASE-003</div>
                <div>Aerocool CS-111 V2 Noir - Mini Tour</div>
                <input type="number" name="qty_CASE-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASE-003']) ? number_format($prix_catalogue['CASE-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASE-004</div>
                <div>Cooler Master Silencio S600 - Moyen Tour</div>
                <input type="number" name="qty_CASE-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASE-004']) ? number_format($prix_catalogue['CASE-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASE-005</div>
                <div>be quiet! Pure Base 600 (Noir) - Moyen Tour</div>
                <input type="number" name="qty_CASE-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASE-005']) ? number_format($prix_catalogue['CASE-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASE-006</div>
                <div>Aerocool D301A V1 Noir - Mini Tour</div>
                <input type="number" name="qty_CASE-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASE-006']) ? number_format($prix_catalogue['CASE-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASE-007</div>
                <div>Fox Spirit EG1 (Noir) - Moyen Tour</div>
                <input type="number" name="qty_CASE-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASE-007']) ? number_format($prix_catalogue['CASE-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CASE-008</div>
                <div>Aerocool CS-106 (Noir) - Mini Tour</div>
                <input type="number" name="qty_CASE-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CASE-008']) ? number_format($prix_catalogue['CASE-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CPUCO-001</div>
                <div>be quiet! Pure Rock Pro 3 (Noir)</div>
                <input type="number" name="qty_CPUCO-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CPUCO-001']) ? number_format($prix_catalogue['CPUCO-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CPUCO-002</div>
                <div>Arctic Freezer 36 (Noir)</div>
                <input type="number" name="qty_CPUCO-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CPUCO-002']) ? number_format($prix_catalogue['CPUCO-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CPUCO-003</div>
                <div>Noctua NH-U12A Chromax Black</div>
                <input type="number" name="qty_CPUCO-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CPUCO-003']) ? number_format($prix_catalogue['CPUCO-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CPUCO-004</div>
                <div>be quiet! Dark Rock 5</div>
                <input type="number" name="qty_CPUCO-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CPUCO-004']) ? number_format($prix_catalogue['CPUCO-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CPUCO-005</div>
                <div>Arctic Liquid Freezer III 240 A-RGB (Noir)</div>
                <input type="number" name="qty_CPUCO-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CPUCO-005']) ? number_format($prix_catalogue['CPUCO-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CPUCO-006</div>
                <div>Cooler Master Hyper 212 Black</div>
                <input type="number" name="qty_CPUCO-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CPUCO-006']) ? number_format($prix_catalogue['CPUCO-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>CPU</h3>
            <div class="component-line">
                <div class="component-ref">CPU-001</div>
                <div>AMD Ryzen 5 7600 (3.8 GHz / 5.1 GHz)</div>
                <input type="number" name="qty_CPU-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CPU-001']) ? number_format($prix_catalogue['CPU-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CPU-002</div>
                <div>AMD Ryzen 7 7700 (3.8 GHz / 5.3 GHz)</div>
                <input type="number" name="qty_CPU-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CPU-002']) ? number_format($prix_catalogue['CPU-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CPU-003</div>
                <div>AMD Ryzen 7 5800X (3.8 GHz / 4.7 GHz)</div>
                <input type="number" name="qty_CPU-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CPU-003']) ? number_format($prix_catalogue['CPU-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CPU-004</div>
                <div>AMD Ryzen 5 5600 (3.5 GHz / 4.4 GHz)</div>
                <input type="number" name="qty_CPU-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CPU-004']) ? number_format($prix_catalogue['CPU-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CPU-005</div>
                <div>AMD Ryzen 9 7900X (4.7 GHz / 5.6 GHz)</div>
                <input type="number" name="qty_CPU-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CPU-005']) ? number_format($prix_catalogue['CPU-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CPU-006</div>
                <div>Intel Core i5-13600KF (3.5 GHz / 5.1 GHz)</div>
                <input type="number" name="qty_CPU-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CPU-006']) ? number_format($prix_catalogue['CPU-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">CPU-007</div>
                <div>Intel Core i7-13700K (3.4 GHz / 5.4 GHz)</div>
                <input type="number" name="qty_CPU-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['CPU-007']) ? number_format($prix_catalogue['CPU-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">EXTERNAL-001</div>
                <div>Samsung Portable SSD T7 1 To Bleu</div>
                <input type="number" name="qty_EXTERNAL-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['EXTERNAL-001']) ? number_format($prix_catalogue['EXTERNAL-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">EXTERNAL-002</div>
                <div>Samsung Portable SSD T7 2 To Bleu</div>
                <input type="number" name="qty_EXTERNAL-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['EXTERNAL-002']) ? number_format($prix_catalogue['EXTERNAL-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">EXTERNAL-003</div>
                <div>Samsung Portable SSD T7 4 To Gris</div>
                <input type="number" name="qty_EXTERNAL-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['EXTERNAL-003']) ? number_format($prix_catalogue['EXTERNAL-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">EXTERNAL-004</div>
                <div>Crucial X10 Portable 2 To</div>
                <input type="number" name="qty_EXTERNAL-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['EXTERNAL-004']) ? number_format($prix_catalogue['EXTERNAL-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">EXTERNAL-005</div>
                <div>Crucial X10 Pro Portable 4 To</div>
                <input type="number" name="qty_EXTERNAL-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['EXTERNAL-005']) ? number_format($prix_catalogue['EXTERNAL-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">EXTERNAL-006</div>
                <div>LaCie Rugged Mini 5 To (USB-C)</div>
                <input type="number" name="qty_EXTERNAL-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['EXTERNAL-006']) ? number_format($prix_catalogue['EXTERNAL-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">EXTERNAL-007</div>
                <div>WD Elements Portable 5 To Noir (USB 3.0)</div>
                <input type="number" name="qty_EXTERNAL-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['EXTERNAL-007']) ? number_format($prix_catalogue['EXTERNAL-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">EXTERNAL-008</div>
                <div>Kingston XS2000 2 To</div>
                <input type="number" name="qty_EXTERNAL-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['EXTERNAL-008']) ? number_format($prix_catalogue['EXTERNAL-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">EXTERNAL-009</div>
                <div>LaCie 1big Dock Thunderbolt 3 - 8 To</div>
                <input type="number" name="qty_EXTERNAL-009" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['EXTERNAL-009']) ? number_format($prix_catalogue['EXTERNAL-009'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">EXTERNAL-010</div>
                <div>ioSafe Solo G3 4 To (Waterproof/Fireproof)</div>
                <input type="number" name="qty_EXTERNAL-010" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['EXTERNAL-010']) ? number_format($prix_catalogue['EXTERNAL-010'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">FAN-001</div>
                <div>Noctua NA-FC1 (Contrôleur PWM 3 canaux)</div>
                <input type="number" name="qty_FAN-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['FAN-001']) ? number_format($prix_catalogue['FAN-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">FAN-002</div>
                <div>NZXT RGB & Fan Controller</div>
                <input type="number" name="qty_FAN-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['FAN-002']) ? number_format($prix_catalogue['FAN-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>HEADPHONES</h3>
            <div class="component-line">
                <div class="component-ref">HEADPHONES-001</div>
                <div>Audio-Technica ATH-M50x (Noir)</div>
                <input type="number" name="qty_HEADPHONES-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['HEADPHONES-001']) ? number_format($prix_catalogue['HEADPHONES-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">HEADPHONES-002</div>
                <div>Sony WH-1000XM5 (Noir)</div>
                <input type="number" name="qty_HEADPHONES-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['HEADPHONES-002']) ? number_format($prix_catalogue['HEADPHONES-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">HEADPHONES-003</div>
                <div>AKG N9 Hybrid (Noir)</div>
                <input type="number" name="qty_HEADPHONES-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['HEADPHONES-003']) ? number_format($prix_catalogue['HEADPHONES-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">HEADPHONES-004</div>
                <div>B&W Px7 S3 (Noir Anthracite)</div>
                <input type="number" name="qty_HEADPHONES-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['HEADPHONES-004']) ? number_format($prix_catalogue['HEADPHONES-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">HEADPHONES-005</div>
                <div>Audio-Technica ATH-M30x</div>
                <input type="number" name="qty_HEADPHONES-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['HEADPHONES-005']) ? number_format($prix_catalogue['HEADPHONES-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">HEADPHONES-006</div>
                <div>Belkin Micro Casque USB-C/Bluetooth</div>
                <input type="number" name="qty_HEADPHONES-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['HEADPHONES-006']) ? number_format($prix_catalogue['HEADPHONES-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">HEADPHONES-007</div>
                <div>Apple AirPods Pro 2 (Boîtier MagSafe USB-C)</div>
                <input type="number" name="qty_HEADPHONES-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['HEADPHONES-007']) ? number_format($prix_catalogue['HEADPHONES-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">INTERNAL-001</div>
                <div>Seagate BarraCuda 1 To (ST1000DM014)</div>
                <input type="number" name="qty_INTERNAL-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['INTERNAL-001']) ? number_format($prix_catalogue['INTERNAL-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">INTERNAL-002</div>
                <div>Seagate BarraCuda 4 To (ST4000DM004)</div>
                <input type="number" name="qty_INTERNAL-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['INTERNAL-002']) ? number_format($prix_catalogue['INTERNAL-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">INTERNAL-003</div>
                <div>Seagate IronWolf 4 To (ST4000VN006)</div>
                <input type="number" name="qty_INTERNAL-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['INTERNAL-003']) ? number_format($prix_catalogue['INTERNAL-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">INTERNAL-004</div>
                <div>Seagate IronWolf 8 To (ST8000VN004)</div>
                <input type="number" name="qty_INTERNAL-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['INTERNAL-004']) ? number_format($prix_catalogue['INTERNAL-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">INTERNAL-005</div>
                <div>Seagate IronWolf Pro 10 To (ST10000NT001)</div>
                <input type="number" name="qty_INTERNAL-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['INTERNAL-005']) ? number_format($prix_catalogue['INTERNAL-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">INTERNAL-006</div>
                <div>Western Digital WD Red Plus 6 To</div>
                <input type="number" name="qty_INTERNAL-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['INTERNAL-006']) ? number_format($prix_catalogue['INTERNAL-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">INTERNAL-007</div>
                <div>Synology HAT5300-4T 4 To</div>
                <input type="number" name="qty_INTERNAL-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['INTERNAL-007']) ? number_format($prix_catalogue['INTERNAL-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">INTERNAL-008</div>
                <div>Seagate Exos X20 20 To (ST20000NM002D)</div>
                <input type="number" name="qty_INTERNAL-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['INTERNAL-008']) ? number_format($prix_catalogue['INTERNAL-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>KEYBOARD</h3>
            <div class="component-line">
                <div class="component-ref">KEYBOARD-001</div>
                <div>Logitech MX Keys S (Graphite)</div>
                <input type="number" name="qty_KEYBOARD-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['KEYBOARD-001']) ? number_format($prix_catalogue['KEYBOARD-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">KEYBOARD-002</div>
                <div>Logitech Wave Keys (Noir)</div>
                <input type="number" name="qty_KEYBOARD-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['KEYBOARD-002']) ? number_format($prix_catalogue['KEYBOARD-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">KEYBOARD-003</div>
                <div>Cherry KC 6000 Slim (Noir)</div>
                <input type="number" name="qty_KEYBOARD-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['KEYBOARD-003']) ? number_format($prix_catalogue['KEYBOARD-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">KEYBOARD-004</div>
                <div>INOVU LK120 (AZERTY, Français)</div>
                <input type="number" name="qty_KEYBOARD-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['KEYBOARD-004']) ? number_format($prix_catalogue['KEYBOARD-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">KEYBOARD-005</div>
                <div>Apple Magic Keyboard (AZERTY, Français)</div>
                <input type="number" name="qty_KEYBOARD-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['KEYBOARD-005']) ? number_format($prix_catalogue['KEYBOARD-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">KEYBOARD-006</div>
                <div>Corsair Gaming K70 Core</div>
                <input type="number" name="qty_KEYBOARD-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['KEYBOARD-006']) ? number_format($prix_catalogue['KEYBOARD-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">KEYBOARD-007</div>
                <div>Bluestork Media Office</div>
                <input type="number" name="qty_KEYBOARD-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['KEYBOARD-007']) ? number_format($prix_catalogue['KEYBOARD-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">KEYBOARD-008</div>
                <div>INOVU SWL10 Noir (AZERTY, Français)</div>
                <input type="number" name="qty_KEYBOARD-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['KEYBOARD-008']) ? number_format($prix_catalogue['KEYBOARD-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>MEMORY</h3>
            <div class="component-line">
                <div class="component-ref">MEMORY-001</div>
                <div>Textorm 16 Go (2x 8 Go) DDR4 3200 MHz CL16</div>
                <input type="number" name="qty_MEMORY-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MEMORY-001']) ? number_format($prix_catalogue['MEMORY-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MEMORY-002</div>
                <div>Textorm 32 Go (2x 16 Go) DDR4 3200 MHz CL16</div>
                <input type="number" name="qty_MEMORY-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MEMORY-002']) ? number_format($prix_catalogue['MEMORY-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MEMORY-003</div>
                <div>Textorm 32 Go (2x 16 Go) DDR5 6000 MHz CL36</div>
                <input type="number" name="qty_MEMORY-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MEMORY-003']) ? number_format($prix_catalogue['MEMORY-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MEMORY-004</div>
                <div>Corsair Dominator Platinum DDR5 RGB 32 Go (2x 16 Go) 6000 MHz CL30</div>
                <input type="number" name="qty_MEMORY-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MEMORY-004']) ? number_format($prix_catalogue['MEMORY-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MEMORY-005</div>
                <div>Textorm SO-DIMM 16 Go DDR4 3200 MHz CL22</div>
                <input type="number" name="qty_MEMORY-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MEMORY-005']) ? number_format($prix_catalogue['MEMORY-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MEMORY-006</div>
                <div>Textorm SO-DIMM 32 Go (2x 16 Go) DDR4 3200 MHz CL22</div>
                <input type="number" name="qty_MEMORY-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MEMORY-006']) ? number_format($prix_catalogue['MEMORY-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MEMORY-007</div>
                <div>Corsair Dominator Platinum DDR5 RGB 64 Go (2x 32 Go) 6000 MHz CL30</div>
                <input type="number" name="qty_MEMORY-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MEMORY-007']) ? number_format($prix_catalogue['MEMORY-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>MONITOR</h3>
            <div class="component-line">
                <div class="component-ref">MONITOR-001</div>
                <div>AOC 23.8" LED - 24B3HA2 (Full HD, IPS, 75 Hz)</div>
                <input type="number" name="qty_MONITOR-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-001']) ? number_format($prix_catalogue['MONITOR-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MONITOR-002</div>
                <div>LG 23.8" LED - 24MS550-B (Full HD, IPS, 75 Hz)</div>
                <input type="number" name="qty_MONITOR-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-002']) ? number_format($prix_catalogue['MONITOR-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MONITOR-003</div>
                <div>BenQ 23.8" LED - GW2491 (Full HD, IPS, 75 Hz)</div>
                <input type="number" name="qty_MONITOR-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-003']) ? number_format($prix_catalogue['MONITOR-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MONITOR-004</div>
                <div>MSI 23.8" LED - PRO MP242AP (Full HD, IPS, 75 Hz)</div>
                <input type="number" name="qty_MONITOR-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-004']) ? number_format($prix_catalogue['MONITOR-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MONITOR-005</div>
                <div>Acer 21.5" LED - Vero B227QE3bmiprxv (Full HD, IPS, 100 Hz)</div>
                <input type="number" name="qty_MONITOR-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-005']) ? number_format($prix_catalogue['MONITOR-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MONITOR-006</div>
                <div>INOVU 21.5" LED - MB22 V2 (Full HD, VA, 100 Hz)</div>
                <input type="number" name="qty_MONITOR-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-006']) ? number_format($prix_catalogue['MONITOR-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MONITOR-007</div>
                <div>iiyama 23.8" LED - ProLite XUB2493HS-B6 (Full HD, IPS, 75 Hz)</div>
                <input type="number" name="qty_MONITOR-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-007']) ? number_format($prix_catalogue['MONITOR-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MONITOR-008</div>
                <div>Acer 27" LED - Nitro VG271UM3bmiipx (2.5K, 180 Hz, IPS)</div>
                <input type="number" name="qty_MONITOR-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-008']) ? number_format($prix_catalogue['MONITOR-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MONITOR-009</div>
                <div>Acer 27" LED - Vero B277UGbemiqpruzx (2.5K, 120 Hz, IPS, USB-C)</div>
                <input type="number" name="qty_MONITOR-009" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-009']) ? number_format($prix_catalogue['MONITOR-009'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MONITOR-010</div>
                <div>Fox Spirit 28" LED - PGK280 (4K, 144 Hz, IPS, USB-C)</div>
                <input type="number" name="qty_MONITOR-010" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-010']) ? number_format($prix_catalogue['MONITOR-010'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MONITOR-011</div>
                <div>Acer 34" LED - Predator X34Vbmiiphuzx (UltraWide OLED, 175 Hz)</div>
                <input type="number" name="qty_MONITOR-011" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-011']) ? number_format($prix_catalogue['MONITOR-011'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MONITOR-012</div>
                <div>INOVU 27" LED - MBQ27 (2.5K, 75 Hz, IPS, USB-C)</div>
                <input type="number" name="qty_MONITOR-012" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-012']) ? number_format($prix_catalogue['MONITOR-012'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MONITOR-013</div>
                <div>Acer 23.8" LED - Nitro VG240YEbmiix (Full HD, 100 Hz, IPS)</div>
                <input type="number" name="qty_MONITOR-013" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-013']) ? number_format($prix_catalogue['MONITOR-013'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MONITOR-014</div>
                <div>Fox Spirit 49" LED - PGM491 (UltraWide 5K, 144 Hz, VA)</div>
                <input type="number" name="qty_MONITOR-014" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MONITOR-014']) ? number_format($prix_catalogue['MONITOR-014'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>MOTHERBOARD</h3>
            <div class="component-line">
                <div class="component-ref">MOTHERBOARD-001</div>
                <div>MSI PRO H610M-E DDR4</div>
                <input type="number" name="qty_MOTHERBOARD-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOTHERBOARD-001']) ? number_format($prix_catalogue['MOTHERBOARD-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOTHERBOARD-002</div>
                <div>Gigabyte H610M S2H V3 DDR4</div>
                <input type="number" name="qty_MOTHERBOARD-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOTHERBOARD-002']) ? number_format($prix_catalogue['MOTHERBOARD-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOTHERBOARD-003</div>
                <div>ASRock B450M Pro4 R2.0</div>
                <input type="number" name="qty_MOTHERBOARD-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOTHERBOARD-003']) ? number_format($prix_catalogue['MOTHERBOARD-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOTHERBOARD-004</div>
                <div>ASRock A620M-HDV/M.2</div>
                <input type="number" name="qty_MOTHERBOARD-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOTHERBOARD-004']) ? number_format($prix_catalogue['MOTHERBOARD-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOTHERBOARD-005</div>
                <div>MSI PRO B760M-P DDR4</div>
                <input type="number" name="qty_MOTHERBOARD-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOTHERBOARD-005']) ? number_format($prix_catalogue['MOTHERBOARD-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOTHERBOARD-006</div>
                <div>ASRock B650M PG Lightning</div>
                <input type="number" name="qty_MOTHERBOARD-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOTHERBOARD-006']) ? number_format($prix_catalogue['MOTHERBOARD-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOTHERBOARD-007</div>
                <div>ASUS TUF GAMING B650-PLUS WIFI</div>
                <input type="number" name="qty_MOTHERBOARD-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOTHERBOARD-007']) ? number_format($prix_catalogue['MOTHERBOARD-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOTHERBOARD-008</div>
                <div>ASRock B860 PRO RS</div>
                <input type="number" name="qty_MOTHERBOARD-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOTHERBOARD-008']) ? number_format($prix_catalogue['MOTHERBOARD-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOTHERBOARD-009</div>
                <div>Gigabyte B850 AORUS ELITE WIFI7 ICE</div>
                <input type="number" name="qty_MOTHERBOARD-009" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOTHERBOARD-009']) ? number_format($prix_catalogue['MOTHERBOARD-009'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOTHERBOARD-010</div>
                <div>ASRock X870 Nova WiFi</div>
                <input type="number" name="qty_MOTHERBOARD-010" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOTHERBOARD-010']) ? number_format($prix_catalogue['MOTHERBOARD-010'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>MOUSE</h3>
            <div class="component-line">
                <div class="component-ref">MOUSE-001</div>
                <div>Logitech B110 Silent (Noir)</div>
                <input type="number" name="qty_MOUSE-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-001']) ? number_format($prix_catalogue['MOUSE-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOUSE-002</div>
                <div>INOVU FM 1600 (Noir)</div>
                <input type="number" name="qty_MOUSE-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-002']) ? number_format($prix_catalogue['MOUSE-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOUSE-003</div>
                <div>Advance Drift 2 Noir</div>
                <input type="number" name="qty_MOUSE-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-003']) ? number_format($prix_catalogue['MOUSE-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOUSE-004</div>
                <div>Logitech M171 Wireless Mouse (Noir)</div>
                <input type="number" name="qty_MOUSE-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-004']) ? number_format($prix_catalogue['MOUSE-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOUSE-005</div>
                <div>Logitech M220 Silent (Noir)</div>
                <input type="number" name="qty_MOUSE-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-005']) ? number_format($prix_catalogue['MOUSE-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOUSE-006</div>
                <div>Logitech M240 Silent (Graphite)</div>
                <input type="number" name="qty_MOUSE-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-006']) ? number_format($prix_catalogue['MOUSE-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOUSE-007</div>
                <div>ASUS TUF Gaming M3 Gen II</div>
                <input type="number" name="qty_MOUSE-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-007']) ? number_format($prix_catalogue['MOUSE-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOUSE-008</div>
                <div>Logitech M650 (Graphite)</div>
                <input type="number" name="qty_MOUSE-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-008']) ? number_format($prix_catalogue['MOUSE-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOUSE-009</div>
                <div>ASUS ROG Gladius II Core</div>
                <input type="number" name="qty_MOUSE-009" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-009']) ? number_format($prix_catalogue['MOUSE-009'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOUSE-010</div>
                <div>Logitech MX Vertical</div>
                <input type="number" name="qty_MOUSE-010" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-010']) ? number_format($prix_catalogue['MOUSE-010'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOUSE-011</div>
                <div>Logitech MX Master 3S (Graphite)</div>
                <input type="number" name="qty_MOUSE-011" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-011']) ? number_format($prix_catalogue['MOUSE-011'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOUSE-012</div>
                <div>ASUS ROG Keris Wireless AimPoint (Blanc)</div>
                <input type="number" name="qty_MOUSE-012" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-012']) ? number_format($prix_catalogue['MOUSE-012'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOUSE-013</div>
                <div>ASUS ROG Harpe Ace Noir (Aim Lab Edition)</div>
                <input type="number" name="qty_MOUSE-013" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-013']) ? number_format($prix_catalogue['MOUSE-013'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">MOUSE-014</div>
                <div>ASUS ROG Harpe II Ace Noir</div>
                <input type="number" name="qty_MOUSE-014" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['MOUSE-014']) ? number_format($prix_catalogue['MOUSE-014'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OPTICAL-001</div>
                <div>Verbatim Graveur de CD/DVD externe USB 2.0</div>
                <input type="number" name="qty_OPTICAL-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OPTICAL-001']) ? number_format($prix_catalogue['OPTICAL-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OPTICAL-002</div>
                <div>Verbatim Graveur de CD/DVD externe USB-C</div>
                <input type="number" name="qty_OPTICAL-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OPTICAL-002']) ? number_format($prix_catalogue['OPTICAL-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OPTICAL-003</div>
                <div>ASUS SDRW-08D2S-U Lite Noir</div>
                <input type="number" name="qty_OPTICAL-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OPTICAL-003']) ? number_format($prix_catalogue['OPTICAL-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OPTICAL-004</div>
                <div>ASUS SDRW-08U7M-U Argent</div>
                <input type="number" name="qty_OPTICAL-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OPTICAL-004']) ? number_format($prix_catalogue['OPTICAL-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OPTICAL-005</div>
                <div>ASUS SDRW-08U7M-U Noir</div>
                <input type="number" name="qty_OPTICAL-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OPTICAL-005']) ? number_format($prix_catalogue['OPTICAL-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OPTICAL-006</div>
                <div>ASUS ZenDrive U9M (USB-C/USB-A) Noir</div>
                <input type="number" name="qty_OPTICAL-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OPTICAL-006']) ? number_format($prix_catalogue['OPTICAL-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OPTICAL-007</div>
                <div>ASUS ZenDrive V1M (USB-C)</div>
                <input type="number" name="qty_OPTICAL-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OPTICAL-007']) ? number_format($prix_catalogue['OPTICAL-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OPTICAL-008</div>
                <div>Verbatim Graveur de Blu-ray externe USB-A</div>
                <input type="number" name="qty_OPTICAL-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OPTICAL-008']) ? number_format($prix_catalogue['OPTICAL-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OPTICAL-009</div>
                <div>ASUS BW-16D1HT (Interne SATA)</div>
                <input type="number" name="qty_OPTICAL-009" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OPTICAL-009']) ? number_format($prix_catalogue['OPTICAL-009'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>OS</h3>
            <div class="component-line">
                <div class="component-ref">OS-001</div>
                <div>Microsoft Windows 11 Pro</div>
                <input type="number" name="qty_OS-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OS-001']) ? number_format($prix_catalogue['OS-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OS-002</div>
                <div>Microsoft Windows 11 Famille</div>
                <input type="number" name="qty_OS-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OS-002']) ? number_format($prix_catalogue['OS-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OS-003</div>
                <div>Microsoft Windows Server 2025</div>
                <input type="number" name="qty_OS-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OS-003']) ? number_format($prix_catalogue['OS-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OS-004</div>
                <div>Linux Mint</div>
                <input type="number" name="qty_OS-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OS-004']) ? number_format($prix_catalogue['OS-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OS-005</div>
                <div>Fedora Workstation</div>
                <input type="number" name="qty_OS-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OS-005']) ? number_format($prix_catalogue['OS-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OS-006</div>
                <div>CentOS Stream</div>
                <input type="number" name="qty_OS-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OS-006']) ? number_format($prix_catalogue['OS-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OS-011</div>
                <div>Red Hat Enterprise Linux</div>
                <input type="number" name="qty_OS-011" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OS-011']) ? number_format($prix_catalogue['OS-011'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OS-012</div>
                <div>Ubuntu Desktop</div>
                <input type="number" name="qty_OS-012" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OS-012']) ? number_format($prix_catalogue['OS-012'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OS-013</div>
                <div>Ubuntu Server</div>
                <input type="number" name="qty_OS-013" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OS-013']) ? number_format($prix_catalogue['OS-013'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OS-014</div>
                <div>Debian</div>
                <input type="number" name="qty_OS-014" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OS-014']) ? number_format($prix_catalogue['OS-014'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">OS-015</div>
                <div>Debian Server</div>
                <input type="number" name="qty_OS-015" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['OS-015']) ? number_format($prix_catalogue['OS-015'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-001</div>
                <div>be quiet! System Power 11 450W 80PLUS Bronze</div>
                <input type="number" name="qty_POWER-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-001']) ? number_format($prix_catalogue['POWER-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-002</div>
                <div>be quiet! Pure Power 12 550W 80PLUS Gold</div>
                <input type="number" name="qty_POWER-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-002']) ? number_format($prix_catalogue['POWER-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-003</div>
                <div>Corsair CX650 80PLUS Bronze (2023)</div>
                <input type="number" name="qty_POWER-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-003']) ? number_format($prix_catalogue['POWER-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-004</div>
                <div>be quiet! Pure Power 12 650W 80PLUS Gold</div>
                <input type="number" name="qty_POWER-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-004']) ? number_format($prix_catalogue['POWER-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-005</div>
                <div>Fox Spirit HG 650 80PLUS Gold</div>
                <input type="number" name="qty_POWER-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-005']) ? number_format($prix_catalogue['POWER-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-006</div>
                <div>Corsair RM650e (2025)</div>
                <input type="number" name="qty_POWER-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-006']) ? number_format($prix_catalogue['POWER-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-007</div>
                <div>be quiet! Pure Power 12 750W 80PLUS Gold</div>
                <input type="number" name="qty_POWER-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-007']) ? number_format($prix_catalogue['POWER-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-008</div>
                <div>Fox Spirit HG 750 80PLUS Gold</div>
                <input type="number" name="qty_POWER-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-008']) ? number_format($prix_catalogue['POWER-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-009</div>
                <div>Corsair RM750e (2025)</div>
                <input type="number" name="qty_POWER-009" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-009']) ? number_format($prix_catalogue['POWER-009'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-010</div>
                <div>be quiet! Pure Power 12 850W 80PLUS Gold</div>
                <input type="number" name="qty_POWER-010" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-010']) ? number_format($prix_catalogue['POWER-010'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-011</div>
                <div>Fox Spirit HG 850 80PLUS Gold</div>
                <input type="number" name="qty_POWER-011" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-011']) ? number_format($prix_catalogue['POWER-011'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-012</div>
                <div>be quiet! Pure Power 13 M 750W 80PLUS Gold</div>
                <input type="number" name="qty_POWER-012" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-012']) ? number_format($prix_catalogue['POWER-012'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-013</div>
                <div>Corsair RM850e (2025)</div>
                <input type="number" name="qty_POWER-013" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-013']) ? number_format($prix_catalogue['POWER-013'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">POWER-014</div>
                <div>be quiet! Straight Power 12 1200W Platinum</div>
                <input type="number" name="qty_POWER-014" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['POWER-014']) ? number_format($prix_catalogue['POWER-014'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SOUND-001</div>
                <div>Nedis Carte Son 5.1 3D USB</div>
                <input type="number" name="qty_SOUND-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SOUND-001']) ? number_format($prix_catalogue['SOUND-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SOUND-002</div>
                <div>DeLock Carte son externe USB-C</div>
                <input type="number" name="qty_SOUND-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SOUND-002']) ? number_format($prix_catalogue['SOUND-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SOUND-003</div>
                <div>Dexlan Carte son USB-A</div>
                <input type="number" name="qty_SOUND-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SOUND-003']) ? number_format($prix_catalogue['SOUND-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SOUND-004</div>
                <div>StarTech.com Carte son / Adaptateur USB vers audio stéréo</div>
                <input type="number" name="qty_SOUND-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SOUND-004']) ? number_format($prix_catalogue['SOUND-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SOUND-005</div>
                <div>StarTech.com Carte son externe USB avec audio SPDIF numérique</div>
                <input type="number" name="qty_SOUND-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SOUND-005']) ? number_format($prix_catalogue['SOUND-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SOUND-006</div>
                <div>Delock Carte son PCI Express 7.1</div>
                <input type="number" name="qty_SOUND-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SOUND-006']) ? number_format($prix_catalogue['SOUND-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SOUND-007</div>
                <div>SteelSeries GameDAC Gen. 2 (PlayStation/Xbox)</div>
                <input type="number" name="qty_SOUND-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SOUND-007']) ? number_format($prix_catalogue['SOUND-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>SPEAKERS</h3>
            <div class="component-line">
                <div class="component-ref">SPEAKERS-001</div>
                <div>Advance SoundPhonic 2.0 4W</div>
                <input type="number" name="qty_SPEAKERS-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SPEAKERS-001']) ? number_format($prix_catalogue['SPEAKERS-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SPEAKERS-002</div>
                <div>Logitech S-150 Digital USB Speaker</div>
                <input type="number" name="qty_SPEAKERS-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SPEAKERS-002']) ? number_format($prix_catalogue['SPEAKERS-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SPEAKERS-003</div>
                <div>Mars Gaming MSCUBE (Noir)</div>
                <input type="number" name="qty_SPEAKERS-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SPEAKERS-003']) ? number_format($prix_catalogue['SPEAKERS-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SPEAKERS-004</div>
                <div>Advance SoundPhonic RGB 11W</div>
                <input type="number" name="qty_SPEAKERS-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SPEAKERS-004']) ? number_format($prix_catalogue['SPEAKERS-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SPEAKERS-005</div>
                <div>Edifier M1360 (Noir)</div>
                <input type="number" name="qty_SPEAKERS-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SPEAKERS-005']) ? number_format($prix_catalogue['SPEAKERS-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SPEAKERS-006</div>
                <div>Edifier R1280DB Noir</div>
                <input type="number" name="qty_SPEAKERS-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SPEAKERS-006']) ? number_format($prix_catalogue['SPEAKERS-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SPEAKERS-007</div>
                <div>Edifier R1700BT Noir</div>
                <input type="number" name="qty_SPEAKERS-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SPEAKERS-007']) ? number_format($prix_catalogue['SPEAKERS-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SPEAKERS-008</div>
                <div>Edifier QR30 Noir</div>
                <input type="number" name="qty_SPEAKERS-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SPEAKERS-008']) ? number_format($prix_catalogue['SPEAKERS-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SPEAKERS-009</div>
                <div>Edifier S2000MKIII</div>
                <input type="number" name="qty_SPEAKERS-009" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SPEAKERS-009']) ? number_format($prix_catalogue['SPEAKERS-009'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SPEAKERS-010</div>
                <div>Logitech Multimedia Speakers System Z533</div>
                <input type="number" name="qty_SPEAKERS-010" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SPEAKERS-010']) ? number_format($prix_catalogue['SPEAKERS-010'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">THERMAL-001</div>
                <div>Arctic MX-4 2019 (4 grammes)</div>
                <input type="number" name="qty_THERMAL-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['THERMAL-001']) ? number_format($prix_catalogue['THERMAL-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">THERMAL-002</div>
                <div>Arctic MX-6 (4 grammes)</div>
                <input type="number" name="qty_THERMAL-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['THERMAL-002']) ? number_format($prix_catalogue['THERMAL-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">THERMAL-003</div>
                <div>Arctic MX-6 (8 grammes)</div>
                <input type="number" name="qty_THERMAL-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['THERMAL-003']) ? number_format($prix_catalogue['THERMAL-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">THERMAL-004</div>
                <div>Arctic Silver 5 (3.5 grammes)</div>
                <input type="number" name="qty_THERMAL-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['THERMAL-004']) ? number_format($prix_catalogue['THERMAL-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">THERMAL-005</div>
                <div>Noctua NT-H1 3.5g SW Edition</div>
                <input type="number" name="qty_THERMAL-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['THERMAL-005']) ? number_format($prix_catalogue['THERMAL-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">THERMAL-006</div>
                <div>Thermal Grizzly Hydronaut (3.9 grammes)</div>
                <input type="number" name="qty_THERMAL-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['THERMAL-006']) ? number_format($prix_catalogue['THERMAL-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">THERMAL-007</div>
                <div>Thermal Grizzly Conductonaut (1 gramme)</div>
                <input type="number" name="qty_THERMAL-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['THERMAL-007']) ? number_format($prix_catalogue['THERMAL-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">THERMAL-008</div>
                <div>Arctic MX-4 2019 (20 grammes)</div>
                <input type="number" name="qty_THERMAL-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['THERMAL-008']) ? number_format($prix_catalogue['THERMAL-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">THERMAL-009</div>
                <div>Polartherm X-10 (5G)</div>
                <input type="number" name="qty_THERMAL-009" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['THERMAL-009']) ? number_format($prix_catalogue['THERMAL-009'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">THERMAL-010</div>
                <div>be quiet! DC2 Pro (3 grammes)</div>
                <input type="number" name="qty_THERMAL-010" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['THERMAL-010']) ? number_format($prix_catalogue['THERMAL-010'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>SSD</h3>
            <div class="component-line">
                <div class="component-ref">SSD-001</div>
                <div>Samsung 970 EVO Plus 500 Go NVMe M.2</div>
                <input type="number" name="qty_SSD-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SSD-001']) ? number_format($prix_catalogue['SSD-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SSD-002</div>
                <div>Samsung 980 PRO 1 To NVMe M.2</div>
                <input type="number" name="qty_SSD-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SSD-002']) ? number_format($prix_catalogue['SSD-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">SSD-003</div>
                <div>Samsung 990 PRO 2 To NVMe M.2 PCIe 4.0</div>
                <input type="number" name="qty_SSD-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['SSD-003']) ? number_format($prix_catalogue['SSD-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>TABLET</h3>
            <div class="component-line">
                <div class="component-ref">TABLET-001</div>
                <div>Wacom Intuos S Bluetooth (Noir)</div>
                <input type="number" name="qty_TABLET-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['TABLET-001']) ? number_format($prix_catalogue['TABLET-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">TABLET-002</div>
                <div>Wacom Intuos Pro M (PTH-660)</div>
                <input type="number" name="qty_TABLET-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['TABLET-002']) ? number_format($prix_catalogue['TABLET-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>UPS</h3>
            <div class="component-line">
                <div class="component-ref">UPS-001</div>
                <div>APC Back-UPS 500VA (BE500G2-FR)</div>
                <input type="number" name="qty_UPS-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['UPS-001']) ? number_format($prix_catalogue['UPS-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">UPS-002</div>
                <div>APC Back-UPS 650VA (BE650G2-FR)</div>
                <input type="number" name="qty_UPS-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['UPS-002']) ? number_format($prix_catalogue['UPS-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">UPS-003</div>
                <div>APC Back-UPS 750VA, 230V, AVR, prises FR</div>
                <input type="number" name="qty_UPS-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['UPS-003']) ? number_format($prix_catalogue['UPS-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">UPS-004</div>
                <div>APC Back-UPS 850VA (BE850G2-FR)</div>
                <input type="number" name="qty_UPS-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['UPS-004']) ? number_format($prix_catalogue['UPS-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">UPS-005</div>
                <div>APC Back-UPS 1200VA, 230V, AVR, prises FR</div>
                <input type="number" name="qty_UPS-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['UPS-005']) ? number_format($prix_catalogue['UPS-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">UPS-006</div>
                <div>Eaton Ellipse ECO 500 FR</div>
                <input type="number" name="qty_UPS-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['UPS-006']) ? number_format($prix_catalogue['UPS-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">UPS-007</div>
                <div>Eaton Ellipse ECO 650 FR</div>
                <input type="number" name="qty_UPS-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['UPS-007']) ? number_format($prix_catalogue['UPS-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">UPS-008</div>
                <div>Eaton Ellipse PRO 650 FR</div>
                <input type="number" name="qty_UPS-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['UPS-008']) ? number_format($prix_catalogue['UPS-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">UPS-009</div>
                <div>APC Back-UPS Pro 900G</div>
                <input type="number" name="qty_UPS-009" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['UPS-009']) ? number_format($prix_catalogue['UPS-009'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">UPS-010</div>
                <div>APC Back-UPS Pro 1200VA</div>
                <input type="number" name="qty_UPS-010" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['UPS-010']) ? number_format($prix_catalogue['UPS-010'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">VIDEO-001</div>
                <div>AMD Radeon Pro WX 3200</div>
                <input type="number" name="qty_VIDEO-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['VIDEO-001']) ? number_format($prix_catalogue['VIDEO-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">VIDEO-002</div>
                <div>PNY NVIDIA RTX A400 4 GB</div>
                <input type="number" name="qty_VIDEO-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['VIDEO-002']) ? number_format($prix_catalogue['VIDEO-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">VIDEO-003</div>
                <div>AMD Radeon Pro W6400</div>
                <input type="number" name="qty_VIDEO-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['VIDEO-003']) ? number_format($prix_catalogue['VIDEO-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">VIDEO-004</div>
                <div>AMD Radeon Pro W7500</div>
                <input type="number" name="qty_VIDEO-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['VIDEO-004']) ? number_format($prix_catalogue['VIDEO-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">VIDEO-005</div>
                <div>PNY Nvidia RTX 2000 Ada Generation</div>
                <input type="number" name="qty_VIDEO-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['VIDEO-005']) ? number_format($prix_catalogue['VIDEO-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">VIDEO-006</div>
                <div>PNY Nvidia RTX 4000 Ada Generation</div>
                <input type="number" name="qty_VIDEO-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['VIDEO-006']) ? number_format($prix_catalogue['VIDEO-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">VIDEO-007</div>
                <div>AMD Radeon Pro W7600</div>
                <input type="number" name="qty_VIDEO-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['VIDEO-007']) ? number_format($prix_catalogue['VIDEO-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">VIDEO-008</div>
                <div>AMD Radeon Pro W7800</div>
                <input type="number" name="qty_VIDEO-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['VIDEO-008']) ? number_format($prix_catalogue['VIDEO-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">VIDEO-009</div>
                <div>PNY Nvidia RTX 4500 Ada Generation</div>
                <input type="number" name="qty_VIDEO-009" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['VIDEO-009']) ? number_format($prix_catalogue['VIDEO-009'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">VIDEO-010</div>
                <div>PNY Nvidia RTX 6000 ADA</div>
                <input type="number" name="qty_VIDEO-010" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['VIDEO-010']) ? number_format($prix_catalogue['VIDEO-010'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <div class="catalogue-section">
            <h3>WEBCAM</h3>
            <div class="component-line">
                <div class="component-ref">WEBCAM-001</div>
                <div>Logitech HD Webcam C270</div>
                <input type="number" name="qty_WEBCAM-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WEBCAM-001']) ? number_format($prix_catalogue['WEBCAM-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WEBCAM-002</div>
                <div>Logitech HD Pro Webcam C920 Refresh</div>
                <input type="number" name="qty_WEBCAM-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WEBCAM-002']) ? number_format($prix_catalogue['WEBCAM-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WEBCAM-003</div>
                <div>Logitech BRIO 100 (Blanc)</div>
                <input type="number" name="qty_WEBCAM-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WEBCAM-003']) ? number_format($prix_catalogue['WEBCAM-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WEBCAM-004</div>
                <div>Logitech BRIO 300 (Graphite)</div>
                <input type="number" name="qty_WEBCAM-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WEBCAM-004']) ? number_format($prix_catalogue['WEBCAM-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WEBCAM-005</div>
                <div>Logitech BRIO 4K B2B</div>
                <input type="number" name="qty_WEBCAM-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WEBCAM-005']) ? number_format($prix_catalogue['WEBCAM-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WEBCAM-006</div>
                <div>Logitech MX BRIO Graphite</div>
                <input type="number" name="qty_WEBCAM-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WEBCAM-006']) ? number_format($prix_catalogue['WEBCAM-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WEBCAM-007</div>
                <div>Logitech BRIO 500 Blanc</div>
                <input type="number" name="qty_WEBCAM-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WEBCAM-007']) ? number_format($prix_catalogue['WEBCAM-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WEBCAM-008</div>
                <div>Elgato Facecam MK.2</div>
                <input type="number" name="qty_WEBCAM-008" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WEBCAM-008']) ? number_format($prix_catalogue['WEBCAM-008'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WIRED-001</div>
                <div>INOVU Adaptateur USB 3.0 vers Gigabit Ethernet</div>
                <input type="number" name="qty_WIRED-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WIRED-001']) ? number_format($prix_catalogue['WIRED-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WIRED-002</div>
                <div>DeLock Carte réseau PCI Express avec Ethernet Gigabit</div>
                <input type="number" name="qty_WIRED-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WIRED-002']) ? number_format($prix_catalogue['WIRED-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WIRED-003</div>
                <div>Intel i210-T1</div>
                <input type="number" name="qty_WIRED-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WIRED-003']) ? number_format($prix_catalogue['WIRED-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WIRED-004</div>
                <div>DeLock Carte réseau PCI Express x4 avec 4x Ethernet Gigabit PoE+</div>
                <input type="number" name="qty_WIRED-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WIRED-004']) ? number_format($prix_catalogue['WIRED-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WIRED-005</div>
                <div>Intel Ethernet I350 T2V2BLK (bulk)</div>
                <input type="number" name="qty_WIRED-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WIRED-005']) ? number_format($prix_catalogue['WIRED-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WIRED-006</div>
                <div>DeLock Carte réseau PCI Express avec SFP+ 10 Gigabits</div>
                <input type="number" name="qty_WIRED-006" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WIRED-006']) ? number_format($prix_catalogue['WIRED-006'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WIRED-007</div>
                <div>Lenovo ThinkSystem Broadcom 5720 1GbE RJ45 2-Port PCIe Ethernet Adapter</div>
                <input type="number" name="qty_WIRED-007" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WIRED-007']) ? number_format($prix_catalogue['WIRED-007'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WIRELESS-001</div>
                <div>D-Link DWA-X582</div>
                <input type="number" name="qty_WIRELESS-001" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WIRELESS-001']) ? number_format($prix_catalogue['WIRELESS-001'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WIRELESS-002</div>
                <div>Gigabyte GC-WB1733D-I</div>
                <input type="number" name="qty_WIRELESS-002" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WIRELESS-002']) ? number_format($prix_catalogue['WIRELESS-002'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WIRELESS-003</div>
                <div>Gigabyte GC-WIFI7 (Rév. 1.0)</div>
                <input type="number" name="qty_WIRELESS-003" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WIRELESS-003']) ? number_format($prix_catalogue['WIRELESS-003'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WIRELESS-004</div>
                <div>MSI AX1800 WiFi USB Adapter</div>
                <input type="number" name="qty_WIRELESS-004" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WIRELESS-004']) ? number_format($prix_catalogue['WIRELESS-004'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
            <div class="component-line">
                <div class="component-ref">WIRELESS-005</div>
                <div>INOVU MBTAX900 - Clé USB Wi-Fi 6 / BT</div>
                <input type="number" name="qty_WIRELESS-005" value="0" min="0" max="999">
                <div class="component-prix"><?php echo isset($prix_catalogue['WIRELESS-005']) ? number_format($prix_catalogue['WIRELESS-005'], 2, ',', ' ') . ' €' : '-'; ?></div>
            </div>
        </div>

        <button type="submit" class="btn-calcul">💼 CALCULER LE DEVIS</button>
    </form>
</div>

<footer>
    <p>&copy; 2025 LUMNI - Fournisseur de configurations PC professionnelles pour TechSolutions</p>
</footer>

<script>
// Auto-scroll en haut après soumission
<?php if(!empty($devis)): ?>
window.scrollTo(0, 0);
<?php endif; ?>
</script>

</body>
</html>