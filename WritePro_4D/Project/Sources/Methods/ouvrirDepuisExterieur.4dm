//%attributes = {}
var $doc4d_o : Object
var $file4d_f : 4D.File


$file4d_f:=Folder(fk desktop folder).file("Sans titre.4wp")
$doc4d_o:=WP New($file4d_f.platformPath)

$file_f:=Folder(fk desktop folder).file("document.pdf")
WP EXPORT DOCUMENT($doc4d_o; $file_f.platformPath; wk pdf)