# TechSolutions 🚀

Projet web fictif **TechSolutions** développé en environnement local avec **XAMPP** (Apache, PHP, MySQL).

Ce document explique comment **exporter et restaurer le site ainsi que la base de données** afin de relancer le projet sur un autre ordinateur.

---

## 🛠️ Prérequis

- XAMPP installé sur le nouveau PC
- Apache et MySQL fonctionnels
- Navigateur web
- Accès à phpMyAdmin

---

## 📦 Export du projet (PC source)

### Export du site web
1. Aller dans le dossier :
```xampp/htdocs/```

2. Copier le dossier du projet :
```techsolutions/```

3. Compresser le dossier (ZIP) ou le transférer via clé USB / cloud.

### Export de la base de données
1. Ouvrir phpMyAdmin :
```http://localhost/phpmyadmin```

2. Sélectionner la base de données du projet (ex : `techsolutions_db`)
3. Cliquer sur **Exporter**
4. Mode : **Rapide**
5. Format : **SQL**
6. Télécharger le fichier `.sql`

---

## 🔄 Import du projet (PC destination)

### Import du site
1. Installer et lancer XAMPP
2. Copier le dossier `techsolutions` dans :
```xampp/htdocs/```

### Import de la base de données
1. Ouvrir phpMyAdmin
2. Créer une nouvelle base de données nommée :
```techsolutions_db```

3. Aller dans l’onglet **Importer**
4. Sélectionner le fichier `.sql`
5. Cliquer sur **Exécuter**

---

## ⚙️ Configuration

Vérifier et adapter si besoin le fichier de configuration (ex : `config.php`) :

```php
$host = "localhost";
$dbname = "techsolutions_db";
$user = "root";
$password = "";
```
