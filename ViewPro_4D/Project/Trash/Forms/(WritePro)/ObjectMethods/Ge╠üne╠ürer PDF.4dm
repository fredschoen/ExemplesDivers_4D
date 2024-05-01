
//fsch
var $file_f : 4D.Folder


$file_f:=Folder(fk desktop folder).file("document.pdf")

WP EXPORT DOCUMENT(WP_AreaObj; $file_f.platformPath; wk pdf)