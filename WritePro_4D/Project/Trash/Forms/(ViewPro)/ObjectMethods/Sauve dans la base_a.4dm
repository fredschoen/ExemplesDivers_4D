//fsch

var $file_t : Text
$file_t:=Get 4D folder(Database folder)+"documentView.4VP"
VP EXPORT DOCUMENT("ViewProArea"; $file_t)
DOCUMENT TO BLOB($file_t; [Table1]Blob4D_a)
SAVE RECORD([Table1])