var $headerTarget : Object

$headerTarget:=WP Get header(WP_Area; 1)  //get the first page header of section 1

If ($headerTarget=Null)
	C_OBJECT($section; $subsection; $header)
	//Retrieve the first section
	$section:=WP Get section(WP_Area; 1)
	$header:=WP New header($section)
End if 



//$headerTarget:=WP Get header(WP_Area; 1; wk first page)  //get the first page header of section 1
$headerTarget:=WP Get header(WP_Area; 1)  //all pages of section 1
$rangeTarget:=WP Text range($headerTarget; wk start text; wk end text)


//WP INSERT DOCUMENT($rangeTarget; $tempoc; wk replace)


C_BOOLEAN($fail)
$fail:=False

//ask user to choose a picture on the disk that they want to insert
$imgRef:=Open document("")
//if user does not cancel
If (OK=1)
	//if the file is a supported picture file
	If (Is picture file(document))
		// insert picture selected by user
		WP INSERT PICTURE($rangeTarget; document; wk replace)  //erreur "manque un objet"
		
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