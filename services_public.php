<?php 
session_start();
require_once 'includes/config.php';

// Récupérer les services visibles
$stmt = $pdo->query("SELECT * FROM services WHERE visible = 1 ORDER BY ordre ASC");
$services = $stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nos Services - TechSolutions</title>
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

<section class="hero">
    <h2>Nos Services</h2>
    <p>Des solutions informatiques complètes pour tous vos besoins</p>
</section>

<div class="container">
    <div class="content-box">
        <h2>Une Expertise Complète à Votre Service</h2>
        <p>TechSolutions vous accompagne dans tous vos projets informatiques grâce à ses <strong>7 départements spécialisés</strong>. Chaque service est assuré par une équipe d'experts dédiés qui mettent leur savoir-faire à votre disposition.</p>
        
        <p>Que vous ayez besoin de développement logiciel sur mesure, de gestion d'infrastructures, de design UX/UI ou de support technique, nous avons les compétences pour répondre à vos attentes.</p>
    </div>
    
    <?php if(empty($services)): ?>
        <div class="content-box">
            <p style="text-align:center;">Nos services seront bientôt disponibles.</p>
        </div>
    <?php else: ?>
        <div class="services-grid">
            <?php foreach($services as $service): ?>
            <div class="service-card">
                <h3><?php echo htmlspecialchars($service['titre']); ?></h3>
                <?php if($service['nb_personnes'] > 0): ?>
                    <p style="color:#0099FF;font-weight:bold;margin-bottom:1rem;">
                        Équipe de <?php echo $service['nb_personnes']; ?> personne<?php echo $service['nb_personnes'] > 1 ? 's' : ''; ?>
                    </p>
                <?php endif; ?>
                <p><?php echo nl2br(htmlspecialchars($service['description'])); ?></p>
            </div>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
    
    <div class="content-box">
        <h2>Pourquoi Choisir TechSolutions ?</h2>
        <div style="display:grid;grid-template-columns:repeat(auto-fit, minmax(250px, 1fr));gap:2rem;margin-top:2rem;">
            <div>
                <h3 style="color:#0099FF;">Expertise</h3>
                <p>50 collaborateurs experts répartis en 7 départements spécialisés</p>
            </div>
            <div>
                <h3 style="color:#0099FF;">Sur Mesure</h3>
                <p>Des solutions adaptées à vos besoins spécifiques et à votre secteur</p>
            </div>
            <div>
                <h3 style="color:#0099FF;">Qualité</h3>
                <p>Un engagement qualité sur tous nos projets et prestations</p>
            </div>
            <div>
                <h3 style="color:#0099FF;">Support</h3>
                <p>Un accompagnement continu et une équipe de support dédiée</p>
            </div>
        </div>
    </div>
    
    <div class="content-box" style="background:#e6f7ff;border-left:4px solid #0099FF;">
        <h2>Accessibilité et Inclusion</h2>
        <p>TechSolutions est fière de sa culture inclusive. Nous adaptons nos solutions et nos postes de travail pour répondre aux besoins de tous, y compris les personnes en situation de handicap.</p>
        
        <p>Notre engagement pour l'accessibilité se reflète dans :</p>
        <ul style="line-height:1.8;">
            <li>Des solutions logicielles accessibles (lecteurs d'écran, agrandisseurs, etc.)</li>
            <li>Des postes de travail adaptés (matériel ergonomique et spécialisé)</li>
            <li>Une formation continue de nos équipes aux enjeux de l'accessibilité</li>
            <li>Un accompagnement personnalisé pour chaque projet</li>
        </ul>
    </div>
    
    <div class="content-box">
        <h2>Nos Domaines d'Intervention</h2>
        <div style="display:grid;grid-template-columns:repeat(auto-fit, minmax(300px, 1fr));gap:1.5rem;margin-top:1.5rem;">
            <div>
                <h4>Développement</h4>
                <ul style="line-height:1.8;">
                    <li>Applications web et mobile</li>
                    <li>Logiciels métier sur mesure</li>
                    <li>API et intégrations</li>
                    <li>Maintenance évolutive</li>
                </ul>
            </div>
            <div>
                <h4>Infrastructure</h4>
                <ul style="line-height:1.8;">
                    <li>Architecture réseau</li>
                    <li>Serveurs et stockage</li>
                    <li>Cybersécurité</li>
                    <li>Cloud et virtualisation</li>
                </ul>
            </div>
            <div>
                <h4>Design & UX</h4>
                <ul style="line-height:1.8;">
                    <li>Interface utilisateur</li>
                    <li>Expérience utilisateur</li>
                    <li>Prototypage</li>
                    <li>Tests utilisateurs</li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="content-box" style="text-align:center;">
        <h2>Prêt à Démarrer Votre Projet ?</h2>
        <p>Contactez-nous pour discuter de vos besoins et obtenir un devis personnalisé.</p>
        <div style="margin-top:2rem;">
            <a href="contact.php" class="btn">Nous contacter</a>
            <a href="about.php" class="btn-secondary" style="margin-left:1rem;">En savoir plus</a>
        </div>
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
