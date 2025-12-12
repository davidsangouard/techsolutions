<?php session_start(); ?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Politique de Confidentialité - TechSolutions</title>
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
    <h2>Politique de Confidentialité</h2>
    <p>Protection de vos données personnelles - RGPD</p>
</section>

<div class="container">
    <div class="content-box">
        <p style="font-style:italic;color:#666;">
            Dernière mise à jour : Décembre 2024
        </p>
        
        <h3>1. INTRODUCTION</h3>
        <p>TechSolutions s'engage à protéger la vie privée de ses utilisateurs et à traiter leurs données personnelles conformément au Règlement Général sur la Protection des Données (RGPD) et à la loi Informatique et Libertés.</p>
        <p>Cette politique de confidentialité vous informe sur la manière dont nous collectons, utilisons, stockons et protégeons vos données personnelles.</p>
        
        <h3>2. RESPONSABLE DU TRAITEMENT</h3>
        <p><strong>TechSolutions</strong></p>
        <p>Adresse : [Adresse complète]</p>
        <p>Email : contact@techsolutions.fr</p>
        <p>Téléphone : [Numéro]</p>
        
        <h3>3. DONNÉES COLLECTÉES</h3>
        
        <h4>3.1 Données collectées lors de l'inscription</h4>
        <p>Lorsque vous créez un compte client, nous collectons :</p>
        <ul style="list-style-type: none; padding-left: 0;">
            <li>• Nom et prénom</li>
            <li>• Adresse email</li>
            <li>• Mot de passe (crypté)</li>
            <li>• Adresse postale</li>
            <li>• Téléphone (optionnel)</li>
            <li>• Date d'inscription</li>
        </ul>
        
        <h4>3.2 Données collectées lors de l'utilisation du site</h4>
        <ul style="list-style-type: none; padding-left: 0;">
            <li>• Date et heure de connexion</li>
            <li>• Pages visitées</li>
            <li>• Adresse IP</li>
            <li>• Navigateur et système d'exploitation</li>
        </ul>
        
        <h4>3.3 Données collectées via le formulaire de contact</h4>
        <ul style="list-style-type: none; padding-left: 0;">
            <li>• Nom et prénom</li>
            <li>• Adresse email</li>
            <li>• Sujet et message</li>
        </ul>
        
        <h3>4. FINALITÉS DU TRAITEMENT</h3>
        <p>Vos données personnelles sont collectées pour les finalités suivantes :</p>
        <ul style="list-style-type: none; padding-left: 0;">
            <li>• Gestion de votre compte client</li>
            <li>• Traitement de vos demandes de contact</li>
            <li>• Communication sur nos services</li>
            <li>• Amélioration de nos services</li>
            <li>• Respect de nos obligations légales</li>
            <li>• Sécurité du site et prévention des fraudes</li>
        </ul>
        
        <h3>5. BASE LÉGALE DU TRAITEMENT</h3>
        <p>Le traitement de vos données repose sur :</p>
        <ul style="list-style-type: none; padding-left: 0;">
            <li>• Votre consentement (lors de l'inscription)</li>
            <li>• L'exécution du contrat (gestion de compte)</li>
            <li>• Nos intérêts légitimes (amélioration des services)</li>
            <li>• Le respect d'obligations légales</li>
        </ul>
        
        <h3>6. DURÉE DE CONSERVATION</h3>
        <p><strong>Comptes clients actifs :</strong> Les données sont conservées pendant toute la durée d'utilisation du compte.</p>
        <p><strong>Comptes inactifs :</strong> Les données sont supprimées après 3 ans d'inactivité.</p>
        <p><strong>Messages de contact :</strong> Conservés pendant 1 an maximum.</p>
        <p><strong>Logs de connexion :</strong> Conservés pendant 1 an pour des raisons de sécurité.</p>
        
        <h3>7. VOS DROITS (RGPD)</h3>
        <p>Conformément au RGPD, vous disposez des droits suivants :</p>
        
        <h4>Droit d'accès</h4>
        <p>Vous pouvez consulter l'ensemble de vos données personnelles depuis votre espace client.</p>
        
        <h4>Droit de rectification</h4>
        <p>Vous pouvez modifier vos données à tout moment depuis votre compte.</p>
        
        <h4>Droit à l'effacement (droit à l'oubli)</h4>
        <p>Vous pouvez supprimer votre compte et toutes vos données depuis votre espace client. Cette action est irréversible.</p>
        
        <h4>Droit à la portabilité</h4>
        <p>Vous pouvez demander une copie de vos données dans un format structuré et couramment utilisé.</p>
        
        <h4>Droit d'opposition</h4>
        <p>Vous pouvez vous opposer au traitement de vos données pour des motifs légitimes.</p>
        
        <h4>Droit à la limitation du traitement</h4>
        <p>Vous pouvez demander la limitation du traitement de vos données dans certaines situations.</p>
        
        <h3>8. EXERCICE DE VOS DROITS</h3>
        <p>Pour exercer vos droits, vous pouvez :</p>
        <ul style="list-style-type: none; padding-left: 0;">
            <li>• Accéder à votre espace client pour modifier ou supprimer vos données</li>
            <li>• Nous contacter par email : contact@techsolutions.fr</li>
            <li>• Nous écrire à : TechSolutions, [Adresse complète]</li>
        </ul>
        <p>Nous nous engageons à répondre à votre demande dans un délai maximum d'1 mois.</p>
        
        <h3>9. SÉCURITÉ DES DONNÉES</h3>
        <p>Nous mettons en œuvre toutes les mesures techniques et organisationnelles appropriées pour protéger vos données personnelles contre tout accès, modification, divulgation ou destruction non autorisés :</p>
        <ul style="list-style-type: none; padding-left: 0;">
            <li>• Cryptage des mots de passe (bcrypt)</li>
            <li>• Connexion HTTPS sécurisée</li>
            <li>• Protection contre les injections SQL</li>
            <li>• Protection contre les attaques XSS</li>
            <li>• Fichiers .htaccess sécurisés</li>
            <li>• Sauvegardes régulières</li>
            <li>• Accès restreint aux données</li>
        </ul>
        
        <h3>10. PARTAGE DES DONNÉES</h3>
        <p>Vos données personnelles ne sont <strong>jamais vendues</strong> à des tiers.</p>
        <p>Nous ne partageons vos données qu'avec :</p>
        <ul style="list-style-type: none; padding-left: 0;">
            <li>• Notre hébergeur (pour le fonctionnement du site)</li>
            <li>• Les autorités compétentes (en cas d'obligation légale)</li>
        </ul>
        
        <h3>11. TRANSFERT DE DONNÉES HORS UE</h3>
        <p>Vos données personnelles sont hébergées en France et ne font l'objet d'aucun transfert hors de l'Union Européenne.</p>
        
        <h3>12. COOKIES</h3>
        <p>Ce site utilise uniquement des cookies de session essentiels au fonctionnement de l'authentification.</p>
        <p><strong>Types de cookies utilisés :</strong></p>
        <ul style="list-style-type: none; padding-left: 0;">
            <li>• Cookies de session (authentification client/admin)</li>
            <li>• Durée : Session de navigation uniquement</li>
            <li>• Pas de cookies publicitaires ou de traçage</li>
        </ul>
        
        <h3>13. MODIFICATIONS DE LA POLITIQUE</h3>
        <p>Nous nous réservons le droit de modifier cette politique de confidentialité à tout moment.</p>
        <p>En cas de modification substantielle, nous vous en informerons par email ou via une notification sur le site.</p>
        <p>La date de dernière mise à jour est indiquée en haut de cette page.</p>
        
        <h3>14. RÉCLAMATION AUPRÈS DE LA CNIL</h3>
        <p>Si vous estimez que vos droits ne sont pas respectés, vous pouvez introduire une réclamation auprès de la Commission Nationale de l'Informatique et des Libertés (CNIL) :</p>
        <p><strong>CNIL</strong><br>
        3 Place de Fontenoy - TSA 80715<br>
        75334 PARIS CEDEX 07<br>
        Téléphone : 01 53 73 22 22<br>
        Site web : <a href="https://www.cnil.fr" target="_blank" style="color:#0066CC;">www.cnil.fr</a></p>
        
        <h3>15. CONTACT</h3>
        <p>Pour toute question concernant cette politique de confidentialité ou le traitement de vos données personnelles :</p>
        <p>Email : contact@techsolutions.fr<br>
        Courrier : TechSolutions, [Adresse complète]<br>
        Formulaire : <a href="contact.php" style="color:#0066CC;">Contactez-nous</a></p>
        
        <p style="margin-top:2rem;padding:1rem;background:#E6F2FF;border-left:4px solid #0066CC;">
            <strong>Note :</strong> Cette politique de confidentialité a été rédigée pour un site développé par <strong>Lumni</strong> - Digital Solutions Provider, conformément aux standards RGPD.
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
