//btPdf
var $file_t; $d; $t : Text
$d:=Replace string(String(Current date); "/"; "-")
$t:=Replace string(String(Current time); ":"; ".")
$file_t:=System folder(Desktop)+Form.nomModele_t+" "+$d+" "+$t+".pdf"
WP EXPORT DOCUMENT(WParea; $file_t; wk pdf)
SHOW ON DISK($file_t)