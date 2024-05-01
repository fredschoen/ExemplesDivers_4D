C_OBJECT($section; $header)
//Récupère la référence de la première section
$section:=WP Get section(WP_Area; 1)

//Supprime l'en-tête
WP DELETE HEADER($section)