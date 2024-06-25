If (Form event code:C388=On Load:K2:1)
	var $b : Blob
	$path:=Get 4D folder:C485(Current resources folder:K5:16)+"modeleOrdonnance.4wp"
	If (Test path name:C476($path)#Is a document:K24:1)  // Ouvrir le document
		return 
	End if 
	DOCUMENT TO BLOB:C525($path; $b)  // Load the document
	If (OK=0)
		ALERT:C41("KO")
		TRACE:C157
	Else 
		WParea:=WP New:C1317($b)
	End if 
End if 
