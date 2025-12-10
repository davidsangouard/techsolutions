<?php session_start(); ?>
<?php require_once 'includes/config.php'; ?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>À Propos - TechSolutions</title>
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
    <h2>À Propos de TechSolutions</h2>
    <p>Une entreprise innovante au service de vos projets informatiques</p>
</section>

<div class="container">
    <!-- QUI SOMMES-NOUS -->
    <div class="content-box">
        <h2>Qui Sommes-Nous ?</h2>
        <p>TechSolutions est une entreprise de <strong>services informatiques</strong> basée à Brive-la-Gaillarde, spécialisée dans la fourniture de solutions informatiques complètes et sur mesure.</p>
        
        <p>Depuis notre création, nous nous engageons à fournir à nos clients des services de haute qualité dans tous les domaines de l'informatique : du développement logiciel à la gestion d'infrastructures, en passant par le design UX/UI et le support technique.</p>
        
        <p>Notre mission est de <strong>moderniser les systèmes d'information</strong> des entreprises et de les accompagner dans leur transformation digitale avec des solutions adaptées à leurs besoins spécifiques.</p>
    </div>
    
    <!-- NOS VALEURS -->
    <div class="content-box">
        <h2>Nos Valeurs</h2>
        <div class="services-grid" style="grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));">
            <div class="service-card">
                <h3>Innovation</h3>
                <p>Nous restons à la pointe des technologies pour offrir les solutions les plus performantes.</p>
            </div>
            <div class="service-card">
                <h3>Qualité</h3>
                <p>Chaque projet est traité avec le plus grand soin pour garantir votre satisfaction.</p>
            </div>
            <div class="service-card">
                <h3>Accessibilité</h3>
                <p>Nous mettons un point d'honneur à créer des solutions accessibles à tous.</p>
            </div>
        </div>
    </div>
    
    <!-- CULTURE INCLUSIVE -->
    <div class="content-box" style="background:#e6f7ff;border-left:4px solid #0099FF;">
        <h2>Une Culture Inclusive</h2>
        <p><strong>TechSolutions est fière de sa culture inclusive.</strong> Nous mettons un point d'honneur à accueillir et à soutenir les personnes en situation de handicap, en adaptant les postes de travail pour répondre à leurs besoins.</p>
        
        <p>Nous croyons fermement que la diversité est une force et que chaque collaborateur, quelles que soient ses particularités, peut apporter une contribution précieuse à notre entreprise.</p>
        
        <p>Notre engagement se traduit par :</p>
        <ul style="line-height:1.8;">
            <li>L'adaptation des postes de travail (matériel et logiciels spécialisés)</li>
            <li>La formation et la sensibilisation de nos équipes</li>
            <li>Un accompagnement personnalisé de chaque collaborateur</li>
            <li>Des solutions d'accessibilité intégrées dans tous nos projets</li>
        </ul>
    </div>
    
    <!-- NOTRE ORGANISATION -->
    <div class="content-box">
        <h2>Notre Organisation</h2>
        <p>TechSolutions est structurée en <strong>7 départements spécialisés</strong> qui travaillent en synergie pour vous offrir un service complet :</p>
    </div>
    
    <!-- LES 7 DÉPARTEMENTS -->
    <div class="services-grid">
        <div class="service-card">
            <h3>Développement Logiciel</h3>
            <p><strong>15 personnes</strong></p>
            <p>Responsable de la création et de la maintenance des logiciels sur mesure pour les clients. Notre équipe experte maîtrise les dernières technologies de développement.</p>
        </div>
        
        <div class="service-card">
            <h3>Design UX/UI</h3>
            <p><strong>5 personnes</strong></p>
            <p>Spécialisé dans la conception d'interfaces utilisateur attrayantes et fonctionnelles. Nous créons des expériences utilisateur optimales.</p>
        </div>
        
        <div class="service-card">
            <h3>Infrastructures IT</h3>
            <p><strong>5 personnes</strong></p>
            <p>Chargé de la mise en place et de l'entretien des infrastructures informatiques, incluant les réseaux et les serveurs.</p>
        </div>
        
        <div class="service-card">
            <h3>Marketing et Vente</h3>
            <p><strong>10 personnes</strong></p>
            <p>S'occupe de la stratégie commerciale, de la promotion des services et de la relation client. Votre satisfaction est notre priorité.</p>
        </div>
        
        <div class="service-card">
            <h3>Support Client</h3>
            <p><strong>5 personnes</strong></p>
            <p>Fournit l'assistance technique et le support nécessaire aux clients. Une équipe dédiée et réactive à votre service.</p>
        </div>
        
        <div class="service-card">
            <h3>Ressources Humaines</h3>
            <p><strong>5 personnes</strong></p>
            <p>Gère le personnel, le recrutement, et les aspects administratifs de l'entreprise. Nous prenons soin de nos équipes.</p>
        </div>
        
        <div class="service-card">
            <h3>Direction</h3>
            <p><strong>5 personnes</strong></p>
            <p>Responsable de la gestion globale et de la stratégie de l'entreprise. Une vision claire pour votre avenir digital.</p>
        </div>
    </div>
    
    <!-- CHIFFRES CLÉS -->
    <div class="content-box">
        <h2>TechSolutions en Chiffres</h2>
        <div class="dashboard" style="grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));">
            <div class="stat-card">
                <h3>50</h3>
                <p>Collaborateurs</p>
            </div>
            <div class="stat-card">
                <h3>7</h3>
                <p>Départements</p>
            </div>
            <div class="stat-card">
                <h3>100+</h3>
                <p>Clients Satisfaits</p>
            </div>
            <div class="stat-card">
                <h3>10+</h3>
                <p>Années d'Expérience</p>
            </div>
        </div>
    </div>
    
    <!-- CONTACT -->
    <div class="content-box">
        <h2>Nous Contacter</h2>
        <div style="display:grid;grid-template-columns:repeat(auto-fit, minmax(300px, 1fr));gap:2rem;">
            <div>
                <h3>Adresse</h3>
                <p>
                    <strong>TechSolutions</strong><br>
                    12 rue des Innovateurs<br>
                    19100 Brive-la-Gaillarde<br>
                    France
                </p>
            </div>
            <div>
                <h3>Contact</h3>
                <p>
                    <strong>Directrice des Opérations</strong><br>
                    Mme Anna LISE<br>
                    <a href="mailto:contact@techsolutions.fr">contact@techsolutions.fr</a>
                </p>
            </div>
        </div>
        
        <div style="text-align:center;margin-top:2rem;">
            <a href="contact.php" class="btn">Nous contacter</a>
            <a href="services_public.php" class="btn" style="margin-left:1rem;">Découvrir nos services</a>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2025 TechSolutions - 12 rue des Innovateurs, 19100 Brive-la-Gaillarde</p>
    <p>Site réalisé par Lumni</p>
</footer>
</body>
</html>
