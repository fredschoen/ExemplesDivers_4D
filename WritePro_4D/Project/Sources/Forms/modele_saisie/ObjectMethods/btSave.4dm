

WP EXPORT DOCUMENT(WParea; Form.path_t; wk 4wp)

If (Test path name(Form.path_t)#Is a document)  // Ouvrir le document 
	Form.message_t:="ANOMALIE : "+Form.path_t+"  non enregistré.."
	ALERT("ANOMALIE : "+Form.path_t+"  non enregistré..")
Else 
	Form.message_t:="modèle enregistré"
End if 

//sauver la version initiale
WP EXPORT DOCUMENT(WPareaInit; Form.pathInit_t; wk 4wp)
