<?php
/**
 * FONCTIONS DE SÉCURITÉ GLOBALES
 * Protection contre injections SQL, XSS, CSRF
 */

/**
 * Nettoyer et valider une chaîne de caractères
 * @param string $input
 * @param int $max_length Longueur max (0 = pas de limite)
 * @return string
 */
function clean_input($input, $max_length = 0) {
    if (!is_string($input)) {
        return '';
    }
    
    // Supprimer espaces début/fin
    $input = trim($input);
    
    // Supprimer balises HTML/PHP
    $input = strip_tags($input);
    
    // Convertir caractères spéciaux
    $input = htmlspecialchars($input, ENT_QUOTES, 'UTF-8');
    
    // Limiter longueur si spécifié
    if ($max_length > 0 && strlen($input) > $max_length) {
        $input = substr($input, 0, $max_length);
    }
    
    return $input;
}

/**
 * Valider un email
 * @param string $email
 * @return string|false Email nettoyé ou false si invalide
 */
function validate_email($email) {
    $email = trim($email);
    $email = filter_var($email, FILTER_VALIDATE_EMAIL);
    return $email ? htmlspecialchars($email, ENT_QUOTES, 'UTF-8') : false;
}

/**
 * Valider un entier
 * @param mixed $value
 * @param int $min Valeur minimale
 * @param int $max Valeur maximale
 * @return int|false
 */
function validate_int($value, $min = 0, $max = PHP_INT_MAX) {
    $value = filter_var($value, FILTER_VALIDATE_INT);
    if ($value === false) {
        return false;
    }
    if ($value < $min || $value > $max) {
        return false;
    }
    return $value;
}

/**
 * Générer un token CSRF
 * @return string
 */
function generate_csrf_token() {
    if (!isset($_SESSION['csrf_token'])) {
        $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['csrf_token'];
}

/**
 * Vérifier un token CSRF
 * @param string $token
 * @return bool
 */
function verify_csrf_token($token) {
    return isset($_SESSION['csrf_token']) && hash_equals($_SESSION['csrf_token'], $token);
}

/**
 * Échapper pour affichage HTML
 * @param mixed $value
 * @return string
 */
function escape_html($value) {
    if (is_array($value)) {
        return array_map('escape_html', $value);
    }
    return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8');
}

/**
 * Échapper pour affichage dans attribut HTML
 * @param mixed $value
 * @return string
 */
function escape_attr($value) {
    return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8');
}

/**
 * Nettoyer tableau de données
 * @param array $data
 * @param array $rules [champ => max_length]
 * @return array
 */
function clean_array($data, $rules = []) {
    $cleaned = [];
    foreach ($data as $key => $value) {
        $max_length = isset($rules[$key]) ? $rules[$key] : 0;
        $cleaned[$key] = clean_input($value, $max_length);
    }
    return $cleaned;
}

/**
 * Logger les tentatives d'injection
 * @param string $type Type d'attaque
 * @param string $data Données suspectes
 */
function log_security_event($type, $data) {
    $log_file = __DIR__ . '/../logs/security.log';
    $log_dir = dirname($log_file);
    
    if (!is_dir($log_dir)) {
        @mkdir($log_dir, 0755, true);
    }
    
    $timestamp = date('Y-m-d H:i:s');
    $ip = $_SERVER['REMOTE_ADDR'] ?? 'UNKNOWN';
    $user_agent = $_SERVER['HTTP_USER_AGENT'] ?? 'UNKNOWN';
    
    $log_entry = sprintf(
        "[%s] %s | IP: %s | UA: %s | Data: %s\n",
        $timestamp,
        $type,
        $ip,
        $user_agent,
        substr($data, 0, 200)
    );
    
    @file_put_contents($log_file, $log_entry, FILE_APPEND | LOCK_EX);
}
?>
