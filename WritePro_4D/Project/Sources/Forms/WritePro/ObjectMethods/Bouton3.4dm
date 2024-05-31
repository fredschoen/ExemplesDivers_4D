C_OBJECT($section; $subsection; $header)
//Récupère la référence de la première section
$section:=WP Get section(wpDoc; 1)
//Récupère la référence de la sous-section droite de la première section
$subsection:=WP Get subsection($section; wk right page)

//Supprime l'en-tête
WP DELETE HEADER($subsection)