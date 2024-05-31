//fsch
_trace
$file_t:=Get 4D folder(Database folder)+"documentView.4VP"
BLOB TO DOCUMENT($file_t; [Table1]Blob4D_a)
VP IMPORT DOCUMENT("ViewProArea"; $file_t)

