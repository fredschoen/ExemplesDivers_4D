//fsch
_trace

//avec file en texte
var $file_t : Text
$file_t:=Get 4D folder(Database folder)+"documentView.4VP"
VP EXPORT DOCUMENT("ViewProArea_b"; $file_t)
DOCUMENT TO BLOB($file_t; [Table1]Blob4D_b)

