//fsch
var $file_t : Text

$file_t:=Get 4D folder(Database folder)+"document.4WP"

WP EXPORT DOCUMENT(WParea; $file_t; wk 4wp)

If (Test path name($file_t)=Is a document)  // Ouvrir le document
	DOCUMENT TO BLOB($file_t; [Table1]Blob4D_b)
	SAVE RECORD([Table1])
	ALERT("[Table1]Blob4D_b enregistré")
Else 
	ALERT("KO: [Table1]Blob4D_b non enregistré..")
	
End if 
