<?php 
require_once 'includes/config.php';

// Message de suppression compte
$deleted = isset($_GET['deleted']) ? true : false;

// Récupérer les services visibles (départements)
$stmt = $pdo->query("SELECT * FROM services WHERE visible = 1 ORDER BY ordre ASC LIMIT 6");
$services = $stmt->fetchAll();

// Récupérer les actualités visibles
$stmt = $pdo->query("SELECT * FROM actualites WHERE visible = 1 ORDER BY date_publication DESC LIMIT 6");
$actualites = $stmt->fetchAll();

// Actualité unique si demandée
$actualite_unique = null;
if(isset($_GET['actu'])) {
    $stmt = $pdo->prepare("SELECT * FROM actualites WHERE id = ? AND visible = 1");
    $stmt->execute([(int)$_GET['actu']]);
    $actualite_unique = $stmt->fetch();
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechSolutions - Services Informatiques Professionnels</title>
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
    <h2>TechSolutions</h2>
    <p>Votre partenaire pour la transformation digitale et les solutions informatiques sur mesure</p>
</section>

<div class="container">
    <?php if($deleted): ?>
        <div class="message success">Votre compte a été supprimé avec succès. Toutes vos données ont été effacées conformément au RGPD.</div>
    <?php endif; ?>
    
    <?php if($actualite_unique): ?>
        <!-- ACTUALITÉ COMPLÈTE -->
        <div class="news-full">
            <a href="index.php#actualites" class="btn-secondary" style="display:inline-block;margin-bottom:1rem;">Retour aux actualités</a>
            
            <?php if($actualite_unique['image_path']): ?>
                <img src="<?php echo htmlspecialchars($actualite_unique['image_path']); ?>" alt="<?php echo htmlspecialchars($actualite_unique['titre']); ?>">
            <?php endif; ?>
            
            <div class="news-date" style="font-size:1rem;margin:1rem 0;">
                <?php echo date('d/m/Y à H:i', strtotime($actualite_unique['date_publication'])); ?>
                <?php if($actualite_unique['auteur']): ?>
                    - Par <?php echo htmlspecialchars($actualite_unique['auteur']); ?>
                <?php endif; ?>
            </div>
            
            <h2><?php echo htmlspecialchars($actualite_unique['titre']); ?></h2>
            
            <div class="news-full-content">
                <?php echo nl2br(htmlspecialchars($actualite_unique['contenu'])); ?>
            </div>
        </div>
    <?php else: ?>
        <!-- ONGLETS (UNIQUEMENT SERVICES ET ACTUALITÉS) -->
        <div class="tabs">
            <button class="tab active" onclick="openTab(event, 'services')">
                Nos Services
            </button>
            <button class="tab" onclick="openTab(event, 'actualites')" id="actu-tab">
                Actualités
            </button>
        </div>

        <!-- ONGLET SERVICES -->
        <div id="services" class="tab-content active">
            <h2 class="section-title">Nos Services</h2>
            <p style="text-align:center;max-width:800px;margin:0 auto 2rem;">TechSolutions vous accompagne dans tous vos projets informatiques grâce à ses 7 départements spécialisés.</p>
            
            <?php if(empty($services)): ?>
                <p style="text-align:center;">Nos services seront bientôt disponibles.</p>
            <?php else: ?>
                <div class="services-grid">
                    <?php foreach($services as $service): ?>
                    <div class="service-card">
                        <h3><?php echo htmlspecialchars($service['titre']); ?></h3>
                        <?php if($service['nb_personnes'] > 0): ?>
                            <p style="color:#0099FF;font-weight:bold;">Équipe de <?php echo $service['nb_personnes']; ?> personne<?php echo $service['nb_personnes'] > 1 ? 's' : ''; ?></p>
                        <?php endif; ?>
                        <p><?php echo htmlspecialchars($service['description']); ?></p>
                    </div>
                    <?php endforeach; ?>
                </div>
                <div style="text-align:center;margin-top:2rem;">
                    <a href="services_public.php" class="btn">Voir tous nos services</a>
                </div>
            <?php endif; ?>
        </div>

        <!-- ONGLET ACTUALITÉS -->
        <div id="actualites" class="tab-content">
            <h2 class="section-title">Actualités TechSolutions</h2>
            
            <?php if(empty($actualites)): ?>
                <div class="content-box">
                    <p style="text-align:center;">Aucune actualité pour le moment. Revenez bientôt !</p>
                </div>
            <?php else: ?>
                <div class="news-grid">
                    <?php foreach($actualites as $actu): ?>
                    <div class="news-card">
                        <?php if($actu['image_path']): ?>
                            <img src="<?php echo htmlspecialchars($actu['image_path']); ?>" alt="<?php echo htmlspecialchars($actu['titre']); ?>" class="news-image">
                        <?php endif; ?>
                        <div class="news-content">
                            <div class="news-date">
                                <?php echo date('d/m/Y', strtotime($actu['date_publication'])); ?>
                                <?php if($actu['auteur']): ?>
                                    - Par <?php echo htmlspecialchars($actu['auteur']); ?>
                                <?php endif; ?>
                            </div>
                            <h3><?php echo htmlspecialchars($actu['titre']); ?></h3>
                            <p class="news-excerpt"><?php echo htmlspecialchars(substr($actu['contenu'], 0, 150)); ?>...</p>
                            <a href="index.php?actu=<?php echo $actu['id']; ?>#actualites" class="btn btn-small" style="margin-top:1rem;">Lire la suite</a>
                        </div>
                    </div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
        </div>

        <div class="content-box">
            <h2>À Propos de TechSolutions</h2>
            <p>TechSolutions est une entreprise de services informatiques basée à Brive-la-Gaillarde. Nous sommes fiers de notre culture inclusive et mettons un point d'honneur à accueillir et soutenir les personnes en situation de handicap.</p>
            <p>Avec nos 50 collaborateurs répartis en 7 départements spécialisés, nous vous accompagnons dans tous vos projets de transformation digitale.</p>
            <div class="text-center mt-2">
                <a href="about.php" class="btn">En savoir plus</a>
                <a href="contact.php" class="btn" style="margin-left:1rem;">Nous contacter</a>
            </div>
        </div>
    <?php endif; ?>
</div>

<footer>
    <p>&copy; 2025 TechSolutions - 12 rue des Innovateurs, 19100 Brive-la-Gaillarde</p>
    <p>Site réalisé par Lumni</p>
</footer>

<script>
function openTab(evt, tabName) {
    var tabContents = document.getElementsByClassName("tab-content");
    for (var i = 0; i < tabContents.length; i++) {
        tabContents[i].classList.remove("active");
    }
    var tabs = document.getElementsByClassName("tab");
    for (var i = 0; i < tabs.length; i++) {
        tabs[i].classList.remove("active");
    }
    document.getElementById(tabName).classList.add("active");
    evt.currentTarget.classList.add("active");
    window.location.hash = tabName;
}

// Ouvrir l'onglet si hash présent
if(window.location.hash) {
    var hash = window.location.hash.substring(1);
    if(['services', 'actualites'].includes(hash)) {
        var tab = document.querySelector('[onclick*="' + hash + '"]');
        if(tab) tab.click();
    }
}
</script>
</body>
</html>
