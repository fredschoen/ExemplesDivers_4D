//ImporterDoc //fsch

//charger le "sous-doc" à insérer
$docWP:=WP New([Table1]Blob4D_b)
$Txt:=WP Get text($docWP; wk expressions as value)

//trouver où insérer le "sous-doc" dans le doc maître
$userSel:=WP Selection range(*; "WP_Area")

$objCible:=WP Find next(WP_Area; $userSel; "***includ***"; wk all insensitive; $txt)


If ($objCible=Null)
	ALERT("// 2. recharger le formulaire (sortir+re-rentrer) ")
	//bizarre<<<<<
	//pour que le WP Find fonctionne, il faut
	// 1. charger
	// 2. recharger le formulaire (sortir+re-rentrer) 
	// 3. faire "importerDoc"
	// je supose que: WP_Area n'est mis à jour que quand on re-rentre dans le formulaire, non ????
	//bizarre>>>>>
	
Else 
	ALERT("////insértion OK")
	
End if 




//bizarre<<<<<
//pour que le WP Find fonctionne, il faut
// 1. charger
// 2. recharger le formulaire (sortir+re-rentrer) 
// 3. faire "importerDoc"
// je supose que: WP_Area n'est mis à jour que quand on re-rentre dans le formulaire, non ????
//bizarre>>>>>
