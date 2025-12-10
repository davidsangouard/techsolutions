<?php
// Empêcher la mise en cache des pages (utile en développement)
// En production, commenter ces lignes pour permettre le cache
header("Expires: 0");
header("Cache-Control: no-cache, no-store, must-revalidate, max-age=0");
header("Pragma: no-cache");
?>
