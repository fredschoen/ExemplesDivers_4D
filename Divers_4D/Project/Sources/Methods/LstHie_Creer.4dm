//%attributes = {}
//LstHie_Creer
/*exemple:
Nom.       Niv1.  Niv2.      
GenreQuoi  ""     Action;CoDr
GenreQuoi  Action Anglais;Français
GenreQuoi  CoDr   Anglais;Français
          
*/
var hlGenreQuoi; $hSousListeN1 : Integer
var $i : Integer
hlGenreQuoi:=New list:C375
Form:C1466.GenreQuoi_c:=New collection:C1472()
$es1:=ds:C1482.Parametre.query("Nom = :1 AND Niv1 = :2"; "GenreQuoi"; "")
If ($es1.length=0)
	return 
End if 
$hSousListeN1:=New list:C375
$e1:=$es1.first()
$c1:=Split string:C1554($es1.first().Niv2; ";")
For each ($t1; $c1)
	$es2:=ds:C1482.Parametre.query("Nom = :1 AND Niv1 = :2"; $e1.Nom; $t1)
	If ($es2.length>0)
		$c2:=Split string:C1554($es2.first().Niv2; ";")
		$hSousListeN1:=New list:C375
		For each ($t2; $c2)
			$i+=1
			Form:C1466.GenreQuoi_c.push(New object:C1471("ID"; $i; "Niv0"; $t1; "Niv1"; $t2))
			APPEND TO LIST:C376($hSousListeN1; $t2; $i)
		End for each 
		$i+=1
		Form:C1466.GenreQuoi_c.push(New object:C1471("ID"; $i; "Niv0"; $t1; "Niv1"; ""))
		APPEND TO LIST:C376(hlGenreQuoi; $t1; $i; $hSousListeN1; True:C214)
	End if 
End for each 
// Forcer la hauteur de ligne minimale à 14 Pts
SET LIST PROPERTIES:C387(hlGenreQuoi; 0; 0; 12)
