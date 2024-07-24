C_OBJECT($section; $subsection; $header)
//Récupère la première section
$section:=WP Get section(wpDoc; 1)
//Récupère la sous-section droite de la première section
$subsection:=WP Get subsection($section; wk right page)

//Si la sous-section existe, fixez l'en-tête
If ($subsection#Null)
	$header:=WP New header($subsection)
End if 

$headerTarget:=WP Get header(WParea; 1; wk first page)  //get the first page header of section 1
$rangeTarget:=WP Text range($headerTarget; wk start text; wk end text)
