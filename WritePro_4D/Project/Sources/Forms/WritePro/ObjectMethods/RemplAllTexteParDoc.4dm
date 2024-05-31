//fsch

//charger le "sous-doc" à insérer
$docWP:=WP New([Table1]Blob4D_b)

//trouver où insérer le "sous-doc" dans le doc maître
$objCible2:=WP Find all(WP_Area; "***includ***"; wk all insensitive)


If ($objCible2=Null)
	ALERT("// 2. recharger le formulaire (sortir+re-rentrer) ")
	//bizarre<<<<<
	//pour que le WP Find fonctionne, il faut
	// 1. charger
	// 2. recharger le formulaire (sortir+re-rentrer) 
	// 3. faire "importerDoc"
	// je supose que: WP_Area n'est mis à jour que quand on re-rentre dans le formulaire, non ????
	//bizarre>>>>>
	
Else 
	//insérer
	WP INSERT DOCUMENT($objCible2[0]; $docWP; wk replace)
	
	//$doc:=Select document(System folder(Documents folder)+"Report.pdf"; "pdf"; "Report name:"; File name entry)
	//If (OK=1)
	////BLOB TO DOCUMENT(Document; $blob)  // $blob contains document to record
	//WP EXPORT DOCUMENT($docWPa; document; wk pdf)
	//End if 
End if 




//$Txt:=WP Get text(WParea; wk expressions as value)
//$txt:=WP Get body("WP_Area")