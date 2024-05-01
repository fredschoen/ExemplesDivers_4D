//fsch

//charger le "sous-doc" à insérer
$docWP:=WP New([Table1]Blob4D_b)

//charger le "doc maître
$docWPa:=WP New([Table1]Blob4D_a)

//trouver où insérer le "sous-doc" dans le doc maître
$objCible2:=WP Find all($docWPa; "***includ***"; wk all insensitive)


If ($objCible2=Null)
	ALERT("// 2. recharger le formulaire (sortir+re-rentrer) ")
	//return v19r4
	
Else 
	//insérer
	
	WP INSERT DOCUMENT($objCible2[0]; $docWP; wk replace)
	
	$doc:=Select document(System folder(Documents folder)+"Report.pdf"; "pdf"; "Report name:"; File name entry)
	If (OK=1)
		WP EXPORT DOCUMENT($docWPa; document; wk pdf)
		SHOW ON DISK(System folder(Documents folder); *)
		
	End if 
End if 




//$Txt:=WP Get text(WParea; wk expressions as value)
//$txt:=WP Get body("WP_Area")