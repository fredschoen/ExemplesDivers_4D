//fsch
var $file_t : Text
$file_t:=Get 4D folder(Database folder)+"document.pdf"
WP EXPORT DOCUMENT(WParea; $file_t; wk pdf)
SHOW ON DISK($file_t)