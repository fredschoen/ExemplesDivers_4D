// pour tester, ne pas prendre http://127.0.0.1/ qui renvoie à WebFolder/index.html
Case of 
	: ($1="/hello")
		WEB SEND TEXT:C677("Hello monsieur /hello !")
	Else 
		WEB SEND TEXT:C677("Hello monsieur "+$1)
End case 


