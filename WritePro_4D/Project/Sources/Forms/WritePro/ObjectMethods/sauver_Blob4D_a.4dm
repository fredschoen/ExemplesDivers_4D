//fsch
var $file_t : Text
var $b : Blob


If (False)
	$file_t:=Get 4D folder(Database folder)+"document.4WP"
	WP EXPORT DOCUMENT(WParea; $file_t; wk 4wp)
	If (Test path name($file_t)=Is a document)  // Ouvrir le document
		DOCUMENT TO BLOB($file_t; $b)
		[Table1]Blob4D_a:=$b
		SAVE RECORD([Table1])
		ALERT("[Table1]Blob4D_a enregistré")
	Else 
		ALERT("KO: [Table1]Blob4D_a non enregistré..")
	End if 
End if 

If (True)
	WP EXPORT VARIABLE(WParea; [Table1]Blob4D_a; wk 4wp)
	SAVE RECORD([Table1])
End if 

