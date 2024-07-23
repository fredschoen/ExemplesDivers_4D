If (Form event code=On Load)
	var $b : Blob
	var $file_t; $d; $t : Text
	If (String(Form.nomModele_t)="")
		Form.nomModele_t:="Modele1"
	End if 
	Form.path_t:=Storage.myConst.WriteProPath+Form.nomModele_t+".4wp"
	If (Test path name(Form.path_t)#Is a document)  // Ouvrir le document
		ALERT(Form.path_t+" non trouvé"+Char(Carriage return)+"Création d'un modèle vide")
		WParea:=WP New()
		WPareaInit:=WP New()
		return 
	End if 
	DOCUMENT TO BLOB(Form.path_t; $b)  // Load the document
	If (OK=0)
		ALERT("DOCUMENT TO BLOB KO")
		TRACE
	Else 
		WParea:=WP New($b)
		WPareaInit:=WP New($b)
	End if 
	
	//pour sauver la version avant modif
	$d:=String(Current date; "yyyy-MM-dd")
	$t:=Replace string(String(Current time); ":"; ".")
	Form.pathInit_t:=Storage.myConst.WriteProPath+"Anciens"+Folder separator+Form.nomModele_t+" "+$d+" "+$t+".pdf"
	
End if 