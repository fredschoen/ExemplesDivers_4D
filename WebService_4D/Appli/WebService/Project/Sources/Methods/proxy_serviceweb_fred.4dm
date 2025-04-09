//%attributes = {}
// 
// proxy_serviceweb_fred
// file://C:\Users\frede\Documents\FSC 2022\z-projetsInfo 2022\4Dv19_WebService_Fred\Appli\WebService_Fred\WebFolder\desc_serviceweb_fred.wsdl
// 
// Méthode générée automatiquement par l'assistant Web Services de 4D.
// ----------------------------------------------------------------

C_TEXT:C284($1)
C_TEXT:C284($0)
WEB SERVICE SET PARAMETER:C777("monsieur"; $1)
WEB SERVICE CALL:C778("http://localhost/4DSOAP/"; "A_WebService#serviceweb_fred"; "serviceweb_fred"; "http://www.4d.com/namespace/default"; Web Service dynamic:K48:1)

If (OK=1)
	WEB SERVICE GET RESULT:C779($0; "madame"; *)  // Libération de la mémoire après retour de la valeur.
End if 
