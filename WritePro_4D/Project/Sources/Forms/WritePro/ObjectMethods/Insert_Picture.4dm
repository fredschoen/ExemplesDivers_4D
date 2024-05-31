//C_OBJECT($wpRange)
//$wpRange:=WP Get selection([EXAMPLES]wpDoc)

WP_Area:=WP New()

C_BOOLEAN($fail)
$fail:=False
$path_t:=Folder(fk resources folder).file("img1.png").platformPath


WP SET ATTRIBUTES(WP_Area; wk layout unit; wk unit px)
WP SET ATTRIBUTES(WP_Area; wk page margin; "50")
$rgPicture:=WP Add picture(WP_Area; $path_t)
WP SET ATTRIBUTES($rgPicture; wk anchor horizontal align; wk center)  //centrer
WP SET ATTRIBUTES($rgPicture; wk anchor vertical align; wk center)  // centrer

READ PICTURE FILE($path_t; $p)
PICTURE PROPERTIES($p; $width; $height)
If (($width/$height)>(210/296))  //plus large que haute
	WP SET ATTRIBUTES($rgPicture; wk width; "750")  //redim sur la largeur
Else 
	WP SET ATTRIBUTES($rgPicture; wk height; "900")  //redim sur la hauteur
End if 

If (False)
	
	
	If (True)
		$wpRange:=WP Text range(WP_Area; wk start text; wk end text)
		WP INSERT PICTURE($wpRange; $p; wk replace)
	End if 
	
	$oPicts:=WP Picture range(WP Text range(WP_Area; wk start text; wk end text))
	
	PICTURE PROPERTIES($p; $width; $height)
	If (($width/$height)>(210/296))  //plus large que haute
		WP SET ATTRIBUTES($oPicts; wk width; "750")  //redim sur la largeur
	Else 
		WP SET ATTRIBUTES($oPicts; wk height; "900")  //redim sur la hauteur
	End if 
	
	
	WP SET ATTRIBUTES($oPicts; wk anchor horizontal align; wk center)  //centrer
	WP SET ATTRIBUTES($oPicts; wk anchor vertical align; wk center)  // centrer
	
	WP GET ATTRIBUTES($oPicts; wk image display mode; $a)
	WP GET ATTRIBUTES($oPicts; wk width; $a)
	WP GET ATTRIBUTES($oPicts; wk height; $a)
End if 


If (False)
	$imgRef:=Open document("")
	//if user does not cancel
	If (OK=1)
		//if the file is a supported picture file
		If (Is picture file(document))
			// insert picture selected by user
			//WP INSERT PICTURE($wpRange; document; wk replace) //erreur "manque un objet"
			//WP INSERT PICTURE(WP_Area; document; wk append)  //erreur "manque un objet"
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
End if 
