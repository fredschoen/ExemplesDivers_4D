//fsch

//charger le "sous-doc" à insérer
ALL RECORDS([Table1])
$docPrincipale:=WP New([Table1]Blob4D_a)

//chercher
$txt:="***includ***"
$txt:=Request("Chaine à remplacer pour l'inclusion"; $txt)
var $plageCible_c : Collection
//trouver où insérer le "sous-doc" dans le doc maître
$plageCible_c:=WP Find all($docPrincipale; $txt; wk all insensitive)
If ($plageCible_c.length=0)
	ALERT($txt+" non trouvé")
	return 
End if 

//charger le doc secondaire
$docSecondaire:=WP New([Table1]Blob4D_b)

//insérer doc secondaire dans doc principale
WP INSERT DOCUMENT($plageCible_c[0]; $docSecondaire; wk replace)

//écrire doc sur disque
$doc:=Select document(System folder(Documents folder)+"Report.pdf"; "pdf"; "Report name:"; File name entry)
If (OK=1)
	WP EXPORT DOCUMENT($docPrincipale; document; wk pdf)
	SHOW ON DISK(System folder(Documents folder); *)
	
End if 
