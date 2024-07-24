

//$viewFile_t:=Select document(""; ".4wp"; "Sélection du document 4D View"; Use sheet window)
//WParea:=WP Import document("C:\\documents\\4DWriteDocs\\Letter.4w7")


var $b : Blob

$vhDocRef:=Open document("")  // Select the document of your choice

If (OK=0)
	
End if 

If (OK=1)  // If a document has been chosen
	CLOSE DOCUMENT($vhDocRef)  // We don't need to keep it open
	DOCUMENT TO BLOB(Document; $b)  // Load the document
	If (OK=0)
		// Handle error
	Else 
		WParea:=WP New($b)
	End if 
End if 