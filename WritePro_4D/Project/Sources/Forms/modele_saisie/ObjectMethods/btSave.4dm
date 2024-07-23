

WP EXPORT DOCUMENT:C1337(WPArea; Form:C1466.path_t; wk 4wp:K81:4)

If (Test path name:C476(Form:C1466.path_t)#Is a document:K24:1)  // Ouvrir le document 
	Form:C1466.message_t:="ANOMALIE : "+Form:C1466.path_t+"  non enregistré.."
	ALERT:C41("ANOMALIE : "+Form:C1466.path_t+"  non enregistré..")
Else 
	Form:C1466.message_t:="modèle enregistré"
End if 

//sauver la version initiale
WP EXPORT DOCUMENT:C1337(WPareaInit; Form:C1466.pathInit_t; wk 4wp:K81:4)
