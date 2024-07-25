//fsch

//charger le "sous-doc" à insérer
$docWP:=WP New([Table1]Blob4D_b)

//trouver où insérer le "sous-doc" dans le doc maître
$userSel:=WP Selection range(*; "WParea")
$objCible:=WP Find next(WParea; $userSel; "***includ***"; wk all insensitive)
//$docWPa:=WP New([Table1]Blob4D_a)
//$objCible2:=WP Find next($docWPa; $userSel; "***includ***"; wk all insensitive)


If ($objCible=Null)
	ALERT("KO // 2. recharger le formulaire (sortir+re-rentrer) ")
	//bizarre<<<<<
	//pour que le WP Find fonctionne, il faut
	// 1. charger
	// 2. recharger le formulaire (sortir+re-rentrer) 
	// 3. faire "importerDoc"
	// je supose que: WParea n'est mis à jour que quand on re-rentre dans le formulaire, non ????
	//bizarre>>>>>
	
Else 
	//insérer
	WP INSERT DOCUMENT($objCible; $docWP; wk replace)
End if 


//$Txt:=WP Get text(WParea; wk expressions as value)
//$txt:=WP Get body("WParea")