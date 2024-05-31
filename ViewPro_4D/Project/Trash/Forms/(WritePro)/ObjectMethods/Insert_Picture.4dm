//C_OBJECT($wpRange)
//$wpRange:=WP Get selection([EXAMPLES]wpDoc)

C_BOOLEAN($fail)
$fail:=False

//ask user to choose a picture on the disk that they want to insert
$imgRef:=Open document("")
//if user does not cancel
If (OK=1)
	//if the file is a supported picture file
	If (Is picture file(document))
		// insert picture selected by user
		//WP INSERT PICTURE($wpRange; document; wk replace) //erreur "manque un objet"
		WP INSERT PICTURE(WP_AreaVar; document; wk replace)  //erreur "manque un objet"
	Else 
		$fail:=True
	End if 
Else 
	$fail:=True
End if 
//if the insertion failed, alert the user
If ($fail)
	ALERT("Picture insertion failed")
End if 