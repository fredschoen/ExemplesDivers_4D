// -----------------------------------------------------------------
// Accueil.bBreak
// -----------------------------------------------------------------
// 15/07/24 - frederic@connect_io.fr : création
// -----------------------------------------------------------------
var $i : Integer
var $txt : Text

For ($i; 1; 10)
	If ($i=2)
		continue  //passe au suivant
	End if 
	If ($i=7)
		break  //sort de la boucle
	End if 
	
	$txt+=String:C10($i)+" ; "
	
End for 
ALERT:C41($txt)