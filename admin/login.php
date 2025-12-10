<?php
session_start();
require_once '../includes/config.php';

$error = '';

if(isset($_POST['login'])) {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    
    try {
        $stmt = $pdo->prepare("SELECT * FROM admins WHERE username = ?");
        $stmt->execute([$username]);
        $admin = $stmt->fetch();
        
        // Pour le premier login, accepter admin/admin123
        if($username === 'admin' && $password === 'admin123') {
            // Créer l'admin si n'existe pas
            if(!$admin) {
                $stmt = $pdo->prepare("INSERT INTO admins (username, password) VALUES (?, ?)");
                $stmt->execute(['admin', password_hash('admin123', PASSWORD_DEFAULT)]);
                $admin = ['id' => $pdo->lastInsertId(), 'username' => 'admin'];
            }
            $_SESSION['admin_id'] = $admin['id'];
            $_SESSION['admin_username'] = $admin['username'];
            header('Location: dashboard.php');
            exit;
        }
        
        if($admin && password_verify($password, $admin['password'])) {
            $_SESSION['admin_id'] = $admin['id'];
            $_SESSION['admin_username'] = $admin['username'];
            header('Location: dashboard.php');
            exit;
        } else {
            $error = 'Identifiants incorrects';
        }
    } catch(Exception $e) {
        $error = 'Erreur: ' . $e->getMessage();
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion Admin</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="container" style="margin-top:5rem;">
    <div class="content-box" style="max-width:400px;margin:0 auto;">
        <h2 style="text-align:center;">Administration</h2>
        <?php if($error): ?>
            <div class="message error"><?php echo htmlspecialchars($error); ?></div>
        <?php endif; ?>
        <form method="POST">
            <div class="form-group">
                <label>Nom d'utilisateur</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label>Mot de passe</label>
                <input type="password" name="password" required>
            </div>
            <button type="submit" name="login" class="btn">Se connecter</button>
        </form>
        <p style="text-align:center;margin-top:1rem;"><a href="../index.php">Retour au site</a></p>
    </div>
</div>
</body>
</html>
