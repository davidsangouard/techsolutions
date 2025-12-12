<?php session_start(); ?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentions Légales - TechSolutions</title>
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

<section class="hero" style="padding: 3rem 2rem;">
    <h2>Mentions Légales</h2>
</section>

<div class="container">
    <div class="content-box">
        <h3>1. ÉDITEUR DU SITE</h3>
        <p><strong>Nom de la société :</strong> TechSolutions</p>
        <p><strong>Forme juridique :</strong> [À compléter - SARL, SAS, etc.]</p>
        <p><strong>Capital social :</strong> [À compléter]</p>
        <p><strong>Siège social :</strong> [Adresse complète]</p>
        <p><strong>SIRET :</strong> [Numéro SIRET]</p>
        <p><strong>RCS :</strong> [Ville et numéro RCS]</p>
        <p><strong>Email :</strong> contact@techsolutions.fr</p>
        <p><strong>Téléphone :</strong> [Numéro de téléphone]</p>
        
        <h3>2. DIRECTEUR DE LA PUBLICATION</h3>
        <p><strong>Nom :</strong> [Nom du directeur de publication]</p>
        <p><strong>Fonction :</strong> [Gérant, Président, etc.]</p>
        
        <h3>3. DÉVELOPPEMENT ET HÉBERGEMENT</h3>
        <p><strong>Site développé par :</strong> <span style="color:#0066CC;font-weight:bold;">LUMNI</span> - Digital Solutions Provider</p>
        <p>Prestataire de développement web et solutions digitales</p>
        
        <p style="margin-top:1.5rem;"><strong>Hébergeur du site :</strong></p>
        <p>[Nom de l'hébergeur]</p>
        <p>[Adresse de l'hébergeur]</p>
        <p>[Code postal et ville]</p>
        <p>Téléphone : [Numéro]</p>
        
        <h3>4. PROPRIÉTÉ INTELLECTUELLE</h3>
        <p>L'ensemble de ce site relève de la législation française et internationale sur le droit d'auteur et la propriété intellectuelle.</p>
        <p>Tous les droits de reproduction sont réservés, y compris pour les documents téléchargeables et les représentations iconographiques et photographiques.</p>
        <p>La reproduction de tout ou partie de ce site sur un support électronique ou autre quel qu'il soit est formellement interdite sauf autorisation expresse du directeur de la publication.</p>
        
        <h3>5. RESPONSABILITÉ</h3>
        <p>Les informations contenues sur ce site sont aussi précises que possible. Toutefois, TechSolutions ne peut être tenu responsable des omissions, des inexactitudes et des carences dans la mise à jour, qu'elles soient de son fait ou du fait des tiers partenaires qui lui fournissent ces informations.</p>
        <p>TechSolutions ne peut être tenu pour responsable de l'utilisation et de l'interprétation de l'information contenue dans ce site.</p>
        
        <h3>6. LIENS HYPERTEXTES</h3>
        <p>Le site peut contenir des liens hypertextes vers d'autres sites présents sur le réseau Internet. Les liens vers ces autres ressources vous font quitter le site TechSolutions.</p>
        <p>TechSolutions ne saurait être responsable du contenu de ces sites externes ni des liens qu'ils contiennent.</p>
        
        <h3>7. DONNÉES PERSONNELLES</h3>
        <p>Conformément au Règlement Général sur la Protection des Données (RGPD), vous disposez d'un droit d'accès, de rectification, d'effacement et de portabilité de vos données personnelles.</p>
        <p>Pour exercer ces droits ou pour toute question sur le traitement de vos données, vous pouvez nous contacter :</p>
        <ul style="list-style-type: none; padding-left: 0;">
            <li>• Par email : contact@techsolutions.fr</li>
            <li>• Par courrier : TechSolutions, [Adresse complète]</li>
        </ul>
        <p>Pour plus d'informations, consultez notre <a href="politique_confidentialite.php" style="color:#0066CC;">Politique de Confidentialité</a>.</p>
        
        <h3>8. COOKIES</h3>
        <p>Ce site utilise uniquement des cookies de session nécessaires au bon fonctionnement de l'authentification et de la navigation.</p>
        <p>Ces cookies sont essentiels et ne collectent aucune donnée personnelle à des fins de traçage ou de publicité.</p>
        
        <h3>9. DROIT APPLICABLE</h3>
        <p>Le présent site et les présentes mentions légales sont soumis au droit français.</p>
        <p>En cas de litige et à défaut d'accord amiable, le litige sera porté devant les tribunaux français conformément aux règles de compétence en vigueur.</p>
        
        <h3>10. CONTACT</h3>
        <p>Pour toute question concernant ces mentions légales, vous pouvez nous contacter via notre <a href="contact.php" style="color:#0066CC;">formulaire de contact</a>.</p>
        
        <p style="margin-top:2rem;font-size:0.9em;color:#666;">
            <strong>Dernière mise à jour :</strong> Décembre 2024
        </p>
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
