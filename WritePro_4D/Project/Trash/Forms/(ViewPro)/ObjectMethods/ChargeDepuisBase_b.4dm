//fsch
$file_t:=Get 4D folder(Database folder)+"documentView.4VP"
BLOB TO DOCUMENT($file_t; [Table1]Blob4D_b)
VP IMPORT DOCUMENT("ViewProArea_b"; $file_t)

