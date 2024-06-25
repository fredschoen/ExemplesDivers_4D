var $path : Text

$path:=Get 4D folder:C485(Current resources folder:K5:16)+"modeleOrdonnance.4wp"

WP EXPORT DOCUMENT:C1337(WPArea; $path; wk 4wp:K81:4)

If (Test path name:C476($path)#Is a document:K24:1)  // Ouvrir le document 
	ALERT:C41("KO: [Table1]Blob4D_b non enregistré..")
	
End if 
