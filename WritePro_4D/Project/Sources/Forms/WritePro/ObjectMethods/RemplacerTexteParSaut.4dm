//trouver où insérer le "sous-doc" dans le doc maître
$userSel:=WP Selection range(*; "WParea")

$objCible:=WP Find next(WParea; $userSel; "***includ***"; wk all insensitive)


If ($objCible=Null)
	ALERT("***includ*** non trouvé. recharger le formulaire (sortir+re-rentrer) ")
	//bizarre<<<<<
	//pour que le WP Find fonctionne, il faut
	// 1. charger
	// 2. recharger le formulaire (sortir+re-rentrer) 
	// 3. faire "importerDoc"
	// je supose que: WParea n'est mis à jour que quand on re-rentre dans le formulaire, non ????
	//bizarre>>>>>
	return 
	
End if 

WP INSERT BREAK($objCible; wk page break; wk append)

ALERT("////insértion OK")


//bizarre<<<<<
//pour que le WP Find fonctionne, il faut
// 1. charger
// 2. recharger le formulaire (sortir+re-rentrer) 
// 3. faire "importerDoc"
// je supose que: WParea n'est mis à jour que quand on re-rentre dans le formulaire, non ????
//bizarre>>>>>
