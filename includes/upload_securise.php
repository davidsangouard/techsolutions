<?php
/**
 * UPLOAD SÉCURISÉ D'IMAGES
 * Bloque PHP, malware, fichiers malveillants
 * Accepte uniquement des images valides
 */

function upload_image_securise($file, $destination_folder) {
    // Vérifier si fichier uploadé
    if (!isset($file) || $file['error'] !== UPLOAD_ERR_OK) {
        return ['success' => false, 'error' => 'Aucun fichier uploadé ou erreur upload'];
    }
    
    // Taille max: 5 MB
    $max_size = 5 * 1024 * 1024;
    if ($file['size'] > $max_size) {
        return ['success' => false, 'error' => 'Fichier trop volumineux (max 5 MB)'];
    }
    
    // Extensions autorisées (LISTE BLANCHE)
    $allowed_extensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
    $file_extension = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
    
    if (!in_array($file_extension, $allowed_extensions)) {
        return ['success' => false, 'error' => 'Extension non autorisée. Uniquement: ' . implode(', ', $allowed_extensions)];
    }
    
    // Vérifier MIME type RÉEL du fichier (pas juste l'extension)
    $finfo = finfo_open(FILEINFO_MIME_TYPE);
    $mime_type = finfo_file($finfo, $file['tmp_name']);
    finfo_close($finfo);
    
    $allowed_mimes = [
        'image/jpeg',
        'image/jpg', 
        'image/png',
        'image/gif',
        'image/webp'
    ];
    
    if (!in_array($mime_type, $allowed_mimes)) {
        return ['success' => false, 'error' => 'Type de fichier non autorisé. Ce n\'est pas une image valide.'];
    }
    
    // Vérifier que c'est vraiment une image (tente de la charger)
    $image_info = @getimagesize($file['tmp_name']);
    if ($image_info === false) {
        return ['success' => false, 'error' => 'Fichier corrompu ou non-image'];
    }
    
    // RENOMMER le fichier pour éviter injection
    // Format: timestamp_random.extension
    $new_filename = time() . '_' . bin2hex(random_bytes(8)) . '.' . $file_extension;
    $destination_path = $destination_folder . '/' . $new_filename;
    
    // Créer le dossier si inexistant
    if (!is_dir($destination_folder)) {
        mkdir($destination_folder, 0755, true);
    }
    
    // Déplacer le fichier
    if (!move_uploaded_file($file['tmp_name'], $destination_path)) {
        return ['success' => false, 'error' => 'Erreur lors de la sauvegarde'];
    }
    
    // SÉCURITÉ SUPPLÉMENTAIRE: chmod pour éviter exécution
    chmod($destination_path, 0644);
    
    // Retourner le chemin relatif
    return [
        'success' => true,
        'filename' => $new_filename,
        'path' => $destination_path
    ];
}

/**
 * Supprimer une image
 */
function delete_image_securise($filepath) {
    if (file_exists($filepath) && is_file($filepath)) {
        // Vérifier que c'est bien dans images/
        if (strpos(realpath($filepath), realpath('images/')) === 0) {
            return unlink($filepath);
        }
    }
    return false;
}
?>
